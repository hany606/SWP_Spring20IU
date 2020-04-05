# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: displayer.proto

from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()




DESCRIPTOR = _descriptor.FileDescriptor(
  name='displayer.proto',
  package='',
  syntax='proto3',
  serialized_options=None,
  serialized_pb=b'\n\x0f\x64isplayer.proto\"\x07\n\x05\x45mpty\"\x16\n\x05Index\x12\r\n\x05value\x18\x01 \x01(\x05\"1\n\x05Slide\x12\r\n\x05image\x18\x01 \x01(\x0c\x12\x0b\n\x03\x62in\x18\x02 \x01(\x0c\x12\x0c\n\x04gltf\x18\x03 \x01(\x0c\"M\n\x08Tutorial\x12\x0c\n\x04name\x18\x01 \x01(\t\x12\x0b\n\x03_id\x18\x02 \x01(\t\x12\x0e\n\x06length\x18\x03 \x01(\x05\x12\x16\n\x06slides\x18\x04 \x03(\x0b\x32\x06.Slide\"O\n\x0cTutorialInfo\x12\x0c\n\x04name\x18\x01 \x01(\t\x12\x0b\n\x03_id\x18\x02 \x01(\t\x12\x0e\n\x06length\x18\x03 \x01(\x05\x12\x14\n\x0cimg_data_str\x18\x04 \x01(\t\"A\n\rTutorialsList\x12\x0e\n\x06length\x18\x01 \x01(\x05\x12 \n\ttutorials\x18\x02 \x03(\x0b\x32\r.TutorialInfo2Z\n\x06Helper\x12,\n\x10GetTutorialsList\x12\x06.Empty\x1a\x0e.TutorialsList\"\x00\x12\"\n\x0bGetTutorial\x12\x06.Index\x1a\t.Tutorial\"\x00\x62\x06proto3'
)




_EMPTY = _descriptor.Descriptor(
  name='Empty',
  full_name='Empty',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=19,
  serialized_end=26,
)


_INDEX = _descriptor.Descriptor(
  name='Index',
  full_name='Index',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='value', full_name='Index.value', index=0,
      number=1, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=28,
  serialized_end=50,
)


_SLIDE = _descriptor.Descriptor(
  name='Slide',
  full_name='Slide',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='image', full_name='Slide.image', index=0,
      number=1, type=12, cpp_type=9, label=1,
      has_default_value=False, default_value=b"",
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='bin', full_name='Slide.bin', index=1,
      number=2, type=12, cpp_type=9, label=1,
      has_default_value=False, default_value=b"",
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='gltf', full_name='Slide.gltf', index=2,
      number=3, type=12, cpp_type=9, label=1,
      has_default_value=False, default_value=b"",
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=52,
  serialized_end=101,
)


_TUTORIAL = _descriptor.Descriptor(
  name='Tutorial',
  full_name='Tutorial',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='name', full_name='Tutorial.name', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='_id', full_name='Tutorial._id', index=1,
      number=2, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='length', full_name='Tutorial.length', index=2,
      number=3, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='slides', full_name='Tutorial.slides', index=3,
      number=4, type=11, cpp_type=10, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=103,
  serialized_end=180,
)


_TUTORIALINFO = _descriptor.Descriptor(
  name='TutorialInfo',
  full_name='TutorialInfo',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='name', full_name='TutorialInfo.name', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='_id', full_name='TutorialInfo._id', index=1,
      number=2, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='length', full_name='TutorialInfo.length', index=2,
      number=3, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='img_data_str', full_name='TutorialInfo.img_data_str', index=3,
      number=4, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=182,
  serialized_end=261,
)


_TUTORIALSLIST = _descriptor.Descriptor(
  name='TutorialsList',
  full_name='TutorialsList',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='length', full_name='TutorialsList.length', index=0,
      number=1, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='tutorials', full_name='TutorialsList.tutorials', index=1,
      number=2, type=11, cpp_type=10, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=263,
  serialized_end=328,
)

_TUTORIAL.fields_by_name['slides'].message_type = _SLIDE
_TUTORIALSLIST.fields_by_name['tutorials'].message_type = _TUTORIALINFO
DESCRIPTOR.message_types_by_name['Empty'] = _EMPTY
DESCRIPTOR.message_types_by_name['Index'] = _INDEX
DESCRIPTOR.message_types_by_name['Slide'] = _SLIDE
DESCRIPTOR.message_types_by_name['Tutorial'] = _TUTORIAL
DESCRIPTOR.message_types_by_name['TutorialInfo'] = _TUTORIALINFO
DESCRIPTOR.message_types_by_name['TutorialsList'] = _TUTORIALSLIST
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

Empty = _reflection.GeneratedProtocolMessageType('Empty', (_message.Message,), {
  'DESCRIPTOR' : _EMPTY,
  '__module__' : 'displayer_pb2'
  # @@protoc_insertion_point(class_scope:Empty)
  })
_sym_db.RegisterMessage(Empty)

Index = _reflection.GeneratedProtocolMessageType('Index', (_message.Message,), {
  'DESCRIPTOR' : _INDEX,
  '__module__' : 'displayer_pb2'
  # @@protoc_insertion_point(class_scope:Index)
  })
_sym_db.RegisterMessage(Index)

Slide = _reflection.GeneratedProtocolMessageType('Slide', (_message.Message,), {
  'DESCRIPTOR' : _SLIDE,
  '__module__' : 'displayer_pb2'
  # @@protoc_insertion_point(class_scope:Slide)
  })
_sym_db.RegisterMessage(Slide)

Tutorial = _reflection.GeneratedProtocolMessageType('Tutorial', (_message.Message,), {
  'DESCRIPTOR' : _TUTORIAL,
  '__module__' : 'displayer_pb2'
  # @@protoc_insertion_point(class_scope:Tutorial)
  })
_sym_db.RegisterMessage(Tutorial)

TutorialInfo = _reflection.GeneratedProtocolMessageType('TutorialInfo', (_message.Message,), {
  'DESCRIPTOR' : _TUTORIALINFO,
  '__module__' : 'displayer_pb2'
  # @@protoc_insertion_point(class_scope:TutorialInfo)
  })
_sym_db.RegisterMessage(TutorialInfo)

TutorialsList = _reflection.GeneratedProtocolMessageType('TutorialsList', (_message.Message,), {
  'DESCRIPTOR' : _TUTORIALSLIST,
  '__module__' : 'displayer_pb2'
  # @@protoc_insertion_point(class_scope:TutorialsList)
  })
_sym_db.RegisterMessage(TutorialsList)



_HELPER = _descriptor.ServiceDescriptor(
  name='Helper',
  full_name='Helper',
  file=DESCRIPTOR,
  index=0,
  serialized_options=None,
  serialized_start=330,
  serialized_end=420,
  methods=[
  _descriptor.MethodDescriptor(
    name='GetTutorialsList',
    full_name='Helper.GetTutorialsList',
    index=0,
    containing_service=None,
    input_type=_EMPTY,
    output_type=_TUTORIALSLIST,
    serialized_options=None,
  ),
  _descriptor.MethodDescriptor(
    name='GetTutorial',
    full_name='Helper.GetTutorial',
    index=1,
    containing_service=None,
    input_type=_INDEX,
    output_type=_TUTORIAL,
    serialized_options=None,
  ),
])
_sym_db.RegisterServiceDescriptor(_HELPER)

DESCRIPTOR.services_by_name['Helper'] = _HELPER

# @@protoc_insertion_point(module_scope)