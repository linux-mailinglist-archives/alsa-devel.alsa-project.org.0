Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8977F953A72
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 20:57:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE1732BEE;
	Thu, 15 Aug 2024 20:57:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE1732BEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723748268;
	bh=WAvDL8DBnjf0h7exqmbd3eXOzfGyRJS4wwiVT9Jfnvk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=nNWrr0eWtp80qfCcMwCIzN56MTnSGAcfOoi8WqpvQgzx36yAMT3HKtwgyXnMnTGBA
	 DNGbjMxX7Nv6/dgKBblSOU+1rf1KifRAmUN1RkQAKnEzhkDg4QmWch2WBFy5805207
	 fAB7njGkTdOMks6LocxuYiCWjhNIwX4I9OwEllLk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BFA2F805EF; Thu, 15 Aug 2024 20:56:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12D88F805FB;
	Thu, 15 Aug 2024 20:56:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CCA2F80423; Thu, 15 Aug 2024 20:56:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id B1770F800BF
	for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2024 20:56:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1770F800BF
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1723748205681296110-webhooks-bot@alsa-project.org>
References: <1723748205681296110-webhooks-bot@alsa-project.org>
Subject: hctltest1.py crashes with utf-8 decoding error on IEC958 "status"
Message-Id: <20240815185647.6CCA2F80423@alsa1.perex.cz>
Date: Thu, 15 Aug 2024 20:56:47 +0200 (CEST)
Message-ID-Hash: YLQZ3KVRKGFNUVURGVTQX4YPV4ODAPKX
X-Message-ID-Hash: YLQZ3KVRKGFNUVURGVTQX4YPV4ODAPKX
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YLQZ3KVRKGFNUVURGVTQX4YPV4ODAPKX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-python issue #13 was edited from tormodvolden:

Version 1.2.12, on Ubuntu 24.04, Python 3.12.3.

It seems like the "status" member returned by `snd_ctl_elem_value_get_iec958(self->value, iec958);` on pyalsa/alsahcontrol.c line 1053 starts with 0xff then a 0x00.

I haven't been able to find a corresponding node under /proc/asound to check this.

The relevant aplay -L entry is
```
iec958:CARD=Stereo,DEV=0
    Logitech H570e Stereo, USB Audio
    IEC958 (S/PDIF) Digital Audio Output
```
Here is a dump of /proc/asound/card1 (card 1 is called "Stereo")
<details>

```
$ more $(find  /proc/asound/card1 -type f)
::::::::::::::
/proc/asound/card1/id
::::::::::::::
Stereo
::::::::::::::
/proc/asound/card1/pcm0c/info
::::::::::::::
card: 1
device: 0
subdevice: 0
stream: CAPTURE
id: USB Audio
name: USB Audio
subname: subdevice #0
class: 0
subclass: 0
subdevices_count: 1
subdevices_avail: 1
::::::::::::::
/proc/asound/card1/pcm0c/sub0/info
::::::::::::::
card: 1
device: 0
subdevice: 0
stream: CAPTURE
id: USB Audio
name: USB Audio
subname: subdevice #0
class: 0
subclass: 0
subdevices_count: 1
subdevices_avail: 1
::::::::::::::
/proc/asound/card1/pcm0c/sub0/status
::::::::::::::
closed
::::::::::::::
/proc/asound/card1/pcm0c/sub0/hw_params
::::::::::::::
closed
::::::::::::::
/proc/asound/card1/pcm0c/sub0/sw_params
::::::::::::::
closed
::::::::::::::
/proc/asound/card1/pcm0p/info
::::::::::::::
card: 1
device: 0
subdevice: 0
stream: PLAYBACK
id: USB Audio
name: USB Audio
subname: subdevice #0
class: 0
subclass: 0
subdevices_count: 1
subdevices_avail: 0
::::::::::::::
/proc/asound/card1/pcm0p/sub0/info
::::::::::::::
card: 1
device: 0
subdevice: 0
stream: PLAYBACK
id: USB Audio
name: USB Audio
subname: subdevice #0
class: 0
subclass: 0
subdevices_count: 1
subdevices_avail: 0
::::::::::::::
/proc/asound/card1/pcm0p/sub0/status
::::::::::::::
state: RUNNING
owner_pid   : 1928
trigger_time: 270044.979966617
tstamp      : 309371.219688371
delay       : 1872
avail       : 31520
avail_max   : 32032
-----
hw_ptr      : 1887652896
appl_ptr    : 1887654144
::::::::::::::
/proc/asound/card1/pcm0p/sub0/hw_params
::::::::::::::
access: MMAP_INTERLEAVED
format: S16_LE
subformat: STD
channels: 2
rate: 48000 (48000/1)
period_size: 256
buffer_size: 32768
::::::::::::::
/proc/asound/card1/pcm0p/sub0/sw_params
::::::::::::::
tstamp_mode: ENABLE
period_step: 1
avail_min: 256
start_threshold: 9223372036854775807
stop_threshold: 32768
silence_threshold: 0
silence_size: 0
boundary: 4611686018427387904
::::::::::::::
/proc/asound/card1/usbid
::::::::::::::
046d:0a56
::::::::::::::
/proc/asound/card1/usbbus
::::::::::::::
003/006
::::::::::::::
/proc/asound/card1/stream0
::::::::::::::
Logitech Inc Logitech H570e Stereo at usb-0000:00:14.0-4.4.2, full speed : USB A
udio

Playback:
  Status: Running
    Interface = 2
    Altset = 1
    Packet Size = 192
    Momentary freq = 48000 Hz (0x30.0000)
  Interface 2
    Altset 1
    Format: S16_LE
    Channels: 2
    Endpoint: 0x01 (1 OUT) (ADAPTIVE)
    Rates: 8000, 16000, 24000, 32000, 44100, 48000
    Bits: 16
    Channel map: FL FR

Capture:
  Status: Stop
  Interface 1
    Altset 1
    Format: S16_LE
    Channels: 2
    Endpoint: 0x81 (1 IN) (ASYNC)
    Rates: 8000, 16000, 24000, 32000, 44100, 48000
    Bits: 16
    Channel map: FL FR
::::::::::::::
/proc/asound/card1/usbmixer
::::::::::::::
USB Mixer: usb_id=0x046d0a56, ctrlif=0, ctlerr=0
Card: Logitech Inc Logitech H570e Stereo at usb-0000:00:14.0-4.4.2, full speed
  Unit: 2
    Control: name="Auto Gain Control", index=0
    Info: id=2, control=7, cmask=0x0, channels=1, type="BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 2
    Control: name="Headset Capture Volume", index=0
    Info: id=2, control=2, cmask=0x0, channels=1, type="S16"
    Volume: min=-7680, max=1280, dBmin=-3000, dBmax=500
  Unit: 2
    Control: name="Headset Capture Switch", index=0
    Info: id=2, control=1, cmask=0x0, channels=1, type="INV_BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 5
    Control: name="Headset Playback Volume", index=0
    Info: id=5, control=2, cmask=0x3, channels=2, type="S16"
    Volume: min=-15360, max=1280, dBmin=-6000, dBmax=500
  Unit: 5
    Control: name="Headset Playback Switch", index=0
    Info: id=5, control=1, cmask=0x0, channels=1, type="INV_BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 11
    Control: name="Sidetone Playback Volume", index=0
    Info: id=11, control=2, cmask=0x0, channels=1, type="S16"
    Volume: min=0, max=4125, dBmin=0, dBmax=1611
  Unit: 11
    Control: name="Sidetone Playback Switch", index=0
    Info: id=11, control=1, cmask=0x0, channels=1, type="INV_BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
```
</details>


This is the last part of the output from running `python3 test/hctltest1.py
`
```
*****
  count: 1
  device: 0
  dimensions: None
  element: <alsahcontrol.Element object at 0x7e418ebb9650>
  id: (19, 2, 0, 0, 'IEC958 Playback Con Mask', 0)
  index: 0
  interface: 2
  is_inactive: False
  is_locked: False
  is_owner: False
  is_readable: True
  is_tlv_Commandable: False
  is_tlv_Writable: False
  is_tlv_readable: False
  is_user: False
  is_volatile: False
  is_writable: False
  name: IEC958 Playback Con Mask
  numid: 19
  owner: -1
  subdevice: 0
  type: 5 (IEC958)
-----
  device: 0
  element: <alsahcontrol.Element object at 0x7e418ebb9650>
  get_array: <built-in method get_array of alsahcontrol.Value object at 0x7e418ebb9620>
  get_tuple: <built-in method get_tuple of alsahcontrol.Value object at 0x7e418ebb9620>
  id: (19, 2, 0, 0, 'IEC958 Playback Con Mask', 0)
  index: 0
  interface: 2
  name: IEC958 Playback Con Mask
  numid: 19
  read: <built-in method read of alsahcontrol.Value object at 0x7e418ebb9620>
  set_array: <built-in method set_array of alsahcontrol.Value object at 0x7e418ebb9620>
  set_tuple: <built-in method set_tuple of alsahcontrol.Value object at 0x7e418ebb9620>
  subdevice: 0
  write: <built-in method write of alsahcontrol.Value object at 0x7e418ebb9620>
UnicodeDecodeError: 'utf-8' codec can't decode byte 0xff in position 1: invalid start byte

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "/home/tormod/SOURCES/pyalsa-debian/python-pyalsa/test/hctltest1.py", line 69, in <module>
    value(element1)
  File "/home/tormod/SOURCES/pyalsa-debian/python-pyalsa/test/hctltest1.py", line 36, in value
    values = value.get_tuple(info.type, info.count)
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
SystemError: <method 'get_tuple' of 'alsahcontrol.Value' objects> returned a result with an exception set
```


info.type is 5 info.count is 1

Issue URL     : https://github.com/alsa-project/alsa-python/issues/13
Repository URL: https://github.com/alsa-project/alsa-python
