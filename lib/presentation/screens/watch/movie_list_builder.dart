import 'package:flutter/material.dart';
import 'package:movieflix/common/extensions/size_extensions.dart';
import 'package:transformable_list_view/transformable_list_view.dart';

import '../../../common/constants/color_constants.dart';
import '../../../common/constants/route_constants.dart';
import '../../../common/constants/size_constants.dart';
import '../../../common/styles.dart';
import '../../../data/core/api_constants.dart';
import '../../../data/models/movie_model.dart';
import '../../widgets/common_widgets.dart';
import '../movie_detail/movie_detail_arguments.dart';
import 'movie_list_tile.dart';

class MovieListBuilder extends StatelessWidget {
  final List<MovieModel> movies;

  const MovieListBuilder({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Sizes.dimen_6.h),
      child: Column(
        children: [
          Expanded(
            child: TransformableListView.builder(
              getTransformMatrix: getScaleDownMatrix,
              itemBuilder: (context, index) {
                return MovieListTile(
                  movie: movies[index],
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      RouteList.movieDetail,
                      arguments:
                      MovieDetailArguments(movies[index].id, movies[index].posterPath),
                    );
                  },
                );
              },
              itemCount: movies.length,
            ),
          )
        ],
      ),
    );
  }

  Matrix4 getScaleDownMatrix(TransformableListItem item) {
    /// final scale of child when the animation is completed
    const endScaleBound = 0.95;

    /// 0 when animation completed and [scale] == [endScaleBound]
    /// 1 when animation starts and [scale] == 1
    final animationProgress = item.visibleExtent / item.size.height;

    /// result matrix
    final paintTransform = Matrix4.identity();

    /// animate only if item is on edge
    if (item.position != TransformableListItemPosition.middle) {
      final scale = endScaleBound + ((1 - endScaleBound) * animationProgress);

      paintTransform
        ..translate(item.size.width / 2)
        ..scale(scale)
        ..translate(-item.size.width / 2);
    }

    return paintTransform;
  }
}
