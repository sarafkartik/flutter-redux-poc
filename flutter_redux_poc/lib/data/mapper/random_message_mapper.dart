import 'package:flutter_redux_poc/domain/models/dto/random_message_dto.dart';
import 'package:flutter_redux_poc/domain/models/model/random_message_model.dart';

import 'mapper.dart';

class RandomMessageMapper extends Mapper<RandomMessageDto, RandomMessageModel> {
  @override
  RandomMessageModel map(RandomMessageDto input) {
    return RandomMessageModel(input.content, input.authorSlug);
  }
}
