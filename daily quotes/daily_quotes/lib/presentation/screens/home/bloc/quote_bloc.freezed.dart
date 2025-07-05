// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quote_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuoteEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuoteEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuoteEvent()';
}


}

/// @nodoc
class $QuoteEventCopyWith<$Res>  {
$QuoteEventCopyWith(QuoteEvent _, $Res Function(QuoteEvent) __);
}


/// Adds pattern-matching-related methods to [QuoteEvent].
extension QuoteEventPatterns on QuoteEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadDailyQuote value)?  loadDailyQuote,TResult Function( Togglefavorite value)?  togglefavorite,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadDailyQuote() when loadDailyQuote != null:
return loadDailyQuote(_that);case Togglefavorite() when togglefavorite != null:
return togglefavorite(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadDailyQuote value)  loadDailyQuote,required TResult Function( Togglefavorite value)  togglefavorite,}){
final _that = this;
switch (_that) {
case LoadDailyQuote():
return loadDailyQuote(_that);case Togglefavorite():
return togglefavorite(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadDailyQuote value)?  loadDailyQuote,TResult? Function( Togglefavorite value)?  togglefavorite,}){
final _that = this;
switch (_that) {
case LoadDailyQuote() when loadDailyQuote != null:
return loadDailyQuote(_that);case Togglefavorite() when togglefavorite != null:
return togglefavorite(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadDailyQuote,TResult Function( Quote quote)?  togglefavorite,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadDailyQuote() when loadDailyQuote != null:
return loadDailyQuote();case Togglefavorite() when togglefavorite != null:
return togglefavorite(_that.quote);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadDailyQuote,required TResult Function( Quote quote)  togglefavorite,}) {final _that = this;
switch (_that) {
case LoadDailyQuote():
return loadDailyQuote();case Togglefavorite():
return togglefavorite(_that.quote);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadDailyQuote,TResult? Function( Quote quote)?  togglefavorite,}) {final _that = this;
switch (_that) {
case LoadDailyQuote() when loadDailyQuote != null:
return loadDailyQuote();case Togglefavorite() when togglefavorite != null:
return togglefavorite(_that.quote);case _:
  return null;

}
}

}

/// @nodoc


class LoadDailyQuote implements QuoteEvent {
  const LoadDailyQuote();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadDailyQuote);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuoteEvent.loadDailyQuote()';
}


}




/// @nodoc


class Togglefavorite implements QuoteEvent {
  const Togglefavorite(this.quote);
  

 final  Quote quote;

/// Create a copy of QuoteEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TogglefavoriteCopyWith<Togglefavorite> get copyWith => _$TogglefavoriteCopyWithImpl<Togglefavorite>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Togglefavorite&&(identical(other.quote, quote) || other.quote == quote));
}


@override
int get hashCode => Object.hash(runtimeType,quote);

@override
String toString() {
  return 'QuoteEvent.togglefavorite(quote: $quote)';
}


}

/// @nodoc
abstract mixin class $TogglefavoriteCopyWith<$Res> implements $QuoteEventCopyWith<$Res> {
  factory $TogglefavoriteCopyWith(Togglefavorite value, $Res Function(Togglefavorite) _then) = _$TogglefavoriteCopyWithImpl;
@useResult
$Res call({
 Quote quote
});


$QuoteCopyWith<$Res> get quote;

}
/// @nodoc
class _$TogglefavoriteCopyWithImpl<$Res>
    implements $TogglefavoriteCopyWith<$Res> {
  _$TogglefavoriteCopyWithImpl(this._self, this._then);

  final Togglefavorite _self;
  final $Res Function(Togglefavorite) _then;

/// Create a copy of QuoteEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? quote = null,}) {
  return _then(Togglefavorite(
null == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as Quote,
  ));
}

/// Create a copy of QuoteEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuoteCopyWith<$Res> get quote {
  
  return $QuoteCopyWith<$Res>(_self.quote, (value) {
    return _then(_self.copyWith(quote: value));
  });
}
}

/// @nodoc
mixin _$QuoteState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuoteState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuoteState()';
}


}

/// @nodoc
class $QuoteStateCopyWith<$Res>  {
$QuoteStateCopyWith(QuoteState _, $Res Function(QuoteState) __);
}


/// Adds pattern-matching-related methods to [QuoteState].
extension QuoteStatePatterns on QuoteState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Loaded value)?  loaded,TResult Function( Errors value)?  errors,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case Errors() when errors != null:
return errors(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Loaded value)  loaded,required TResult Function( Errors value)  errors,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case Loaded():
return loaded(_that);case Errors():
return errors(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Loaded value)?  loaded,TResult? Function( Errors value)?  errors,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case Errors() when errors != null:
return errors(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Quote quote)?  loaded,TResult Function( String message)?  errors,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.quote);case Errors() when errors != null:
return errors(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Quote quote)  loaded,required TResult Function( String message)  errors,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case Loaded():
return loaded(_that.quote);case Errors():
return errors(_that.message);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Quote quote)?  loaded,TResult? Function( String message)?  errors,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.quote);case Errors() when errors != null:
return errors(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements QuoteState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuoteState.initial()';
}


}




/// @nodoc


class Loading implements QuoteState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuoteState.loading()';
}


}




/// @nodoc


class Loaded implements QuoteState {
  const Loaded(this.quote);
  

 final  Quote quote;

/// Create a copy of QuoteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&(identical(other.quote, quote) || other.quote == quote));
}


@override
int get hashCode => Object.hash(runtimeType,quote);

@override
String toString() {
  return 'QuoteState.loaded(quote: $quote)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $QuoteStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 Quote quote
});


$QuoteCopyWith<$Res> get quote;

}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of QuoteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? quote = null,}) {
  return _then(Loaded(
null == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as Quote,
  ));
}

/// Create a copy of QuoteState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuoteCopyWith<$Res> get quote {
  
  return $QuoteCopyWith<$Res>(_self.quote, (value) {
    return _then(_self.copyWith(quote: value));
  });
}
}

/// @nodoc


class Errors implements QuoteState {
  const Errors(this.message);
  

 final  String message;

/// Create a copy of QuoteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorsCopyWith<Errors> get copyWith => _$ErrorsCopyWithImpl<Errors>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Errors&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'QuoteState.errors(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorsCopyWith<$Res> implements $QuoteStateCopyWith<$Res> {
  factory $ErrorsCopyWith(Errors value, $Res Function(Errors) _then) = _$ErrorsCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorsCopyWithImpl<$Res>
    implements $ErrorsCopyWith<$Res> {
  _$ErrorsCopyWithImpl(this._self, this._then);

  final Errors _self;
  final $Res Function(Errors) _then;

/// Create a copy of QuoteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Errors(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
