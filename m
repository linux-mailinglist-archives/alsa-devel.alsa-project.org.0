Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2143963517D
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Nov 2022 08:53:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C75E1664;
	Wed, 23 Nov 2022 08:52:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C75E1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669190006;
	bh=65LyqlHXMN4q+yQxR76Qw5wZ/Nn5bIGyP+6FAprkGyc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lmzKlyZehl82Vofc2oprdgCmBfi9wSLIrrL2rEXKTEou2fqERUCnm94cmNSgxXcjs
	 haO0VzXC2TjkGK9ERWq3GmxHcqm52LZDYdzxdQrm1QdP4RgyesMT9m/jCH/yvZ3d80
	 2q1tfOe1VyAC2bNF3EIVktWf61eCp/8/Ay4fNKAw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B92C4F8025D;
	Wed, 23 Nov 2022 08:52:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EF9FF80249; Wed, 23 Nov 2022 08:52:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_FILL_THIS_FORM_SHORT,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 8AC31F800BB
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 08:52:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AC31F800BB
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1669189951411835909-webhooks-bot@alsa-project.org>
References: <1669189951411835909-webhooks-bot@alsa-project.org>
Subject: starting from kernel 5.10.x latency test fails systematically on
 multiple platforms
Message-Id: <20221123075234.0EF9FF80249@alsa1.perex.cz>
Date: Wed, 23 Nov 2022 08:52:34 +0100 (CET)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-lib issue #285 was edited from bondagit:

If I try the latency test application ([test/latency.c](https://github.com/alsa-project/alsa-lib/blob/master/test/latency.c)) using a **Linux Kernel 5.9.x** with alsa-lib v1.2.4 on the following audio card:
_PCH [HDA Intel PCH], device 1: ALC269VC Analog [ALC269VC Analog]_ (for example)
I get the following result:

```
sudo ./latency -C hw:1 -P hw:1 -f S16_LE -r 48000 -c 2  -s 10 -m 128 -M 128 
Scheduler set to Round Robin with priority 99...
Playback device is hw:1
Capture device is hw:1
Parameters are 48000Hz, S16_LE, 2 channels, non-blocking mode
Poll mode: no
Loop limit is 480000 frames, minimum latency = 128, maximum latency = 128
Hardware PCM card 1 'HDA Intel PCH' device 0 subdevice 0
Its setup is:
  stream       : PLAYBACK
  access       : RW_INTERLEAVED
  format       : S16_LE
  subformat    : STD
  channels     : 2
  rate         : 48000
  exact rate   : 48000 (48000/1)
  msbits       : 16
  buffer_size  : 128
  period_size  : 64
  period_time  : 1333
  tstamp_mode  : NONE
  tstamp_type  : MONOTONIC
  period_step  : 1
  avail_min    : 64
  period_event : 0
  start_threshold  : 2147483647
  stop_threshold   : 128
  silence_threshold: 0
  silence_size : 0
  boundary     : 4611686018427387904
  appl_ptr     : 0
  hw_ptr       : 0
Hardware PCM card 1 'HDA Intel PCH' device 0 subdevice 0
Its setup is:
  stream       : CAPTURE
  access       : RW_INTERLEAVED
  format       : S16_LE
  subformat    : STD
  channels     : 2
  rate         : 48000
  exact rate   : 48000 (48000/1)
  msbits       : 16
  buffer_size  : 128
  period_size  : 64
  period_time  : 1333
  tstamp_mode  : NONE
  tstamp_type  : MONOTONIC
  period_step  : 1
  avail_min    : 64
  period_event : 0
  start_threshold  : 2147483647
  stop_threshold   : 128
  silence_threshold: 0
  silence_size : 0
  boundary     : 4611686018427387904
  appl_ptr     : 0
  hw_ptr       : 0
Trying latency 128 frames, 2666.667us, 2.666667ms (375.0000Hz)
Success
Playback:
*** frames = 480128 ***
  state       : RUNNING
  trigger_time: 1907393.672215
  tstamp      : 0.000000
  delay       : 80
  avail       : 48
  avail_max   : 64
Capture:
*** frames = 480000 ***
  state       : RUNNING
  trigger_time: 1907393.672215
  tstamp      : 0.000000
  delay       : 0
  avail       : 0
  avail_max   : 16
Maximum read: 16 frames
Maximum read latency: 333.333us, 0.333333ms (3000.0000Hz)
Hardware sync
Playback time = 1907393.672215, Record time = 1907393.672215, diff = 0
```

The tests succeeded and final state is **RUNNING**

If I try the same tests on the same audio device and distribution but with a **Linux Kernel >= 5.10.x** it fails systematically and I get:

```
sudo ./lantency -C hw:1 -P hw:1 -f S16_LE -r 48000 -c 2  -s 10 -m 128 -M 128 
Scheduler set to Round Robin with priority 99...
Playback device is hw:0
Capture device is hw:0
Parameters are 48000Hz, S16_LE, 2 channels, non-blocking mode
Poll mode: no
Loop limit is 480000 frames, minimum latency = 128, maximum latency = 128
Hardware PCM card 0 'HDA Intel PCH' device 0 subdevice 0
Its setup is:
  stream       : PLAYBACK
  access       : RW_INTERLEAVED
  format       : S16_LE
  subformat    : STD
  channels     : 2
  rate         : 48000
  exact rate   : 48000 (48000/1)
  msbits       : 16
  buffer_size  : 128
  period_size  : 64
  period_time  : 1333
  tstamp_mode  : NONE
  tstamp_type  : MONOTONIC
  period_step  : 1
  avail_min    : 64
  period_event : 0
  start_threshold  : 2147483647
  stop_threshold   : 128
  silence_threshold: 0
  silence_size : 0
  boundary     : 4611686018427387904
  appl_ptr     : 0
  hw_ptr       : 0
Hardware PCM card 0 'HDA Intel PCH' device 0 subdevice 0
Its setup is:
  stream       : CAPTURE
  access       : RW_INTERLEAVED
  format       : S16_LE
  subformat    : STD
  channels     : 2
  rate         : 48000
  exact rate   : 48000 (48000/1)
  msbits       : 16
  buffer_size  : 128
  period_size  : 64
  period_time  : 1333
  tstamp_mode  : NONE
  tstamp_type  : MONOTONIC
  period_step  : 1
  avail_min    : 64
  period_event : 0
  start_threshold  : 2147483647
  stop_threshold   : 128
  silence_threshold: 0
  silence_size : 0
  boundary     : 4611686018427387904
  appl_ptr     : 0
  hw_ptr       : 0
Trying latency 128 frames, 2666.667us, 2.666667ms (375.0000Hz)
Failure
Playback:
*** frames = 90720 ***
  state       : XRUN
  trigger_time: 967.658489
  tstamp      : 0.000000
  delay       : 0
  avail       : 216
  avail_max   : 216
Capture:
*** frames = 90592 ***
  state       : XRUN
  trigger_time: 967.658489
  tstamp      : 0.000000
  delay       : 0
  avail       : 88
  avail_max   : 88
Maximum read: 16 frames
Maximum read latency: 333.333us, 0.333333ms (3000.0000Hz)
Hardware sync
```

I get an **XRUN** during the test execution.
I can reproduce the same error on multiple boards for multiple audio cards and on different Linux distribution just changing the Linux kernel version.
The problem was originally reported at:
[AES67 Linux daemon: Latency test fails with Linux kernel starting from 5.10.0x](https://github.com/bondagit/aes67-linux-daemon/issues/79)

I am interested in testing with low latency (-m 128 -M 128).
My guess is that something changed in the Linux audio core and the latency application has to be adapted.
Any idea ?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/285
Repository URL: https://github.com/alsa-project/alsa-lib
