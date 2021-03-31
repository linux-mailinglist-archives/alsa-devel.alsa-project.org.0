Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1EF34F9B8
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 09:21:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57B1D1675;
	Wed, 31 Mar 2021 09:21:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57B1D1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617175315;
	bh=s2PUQNlEV3FmGqNJwaZL4y2iYS/TiHjlrDi9auYIQ9o=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NlX2pC+Qx5/g5E8q3kXVs/IkhN+pI3mW+rrgnqSbNF8OInTfEe7D0CEAy4GZL1ws2
	 HIwCj+k5Lt1XZGexArz1pfVWrZU9JayGqxDJ15AaGXgNV3CZ0AtnIindpOs7KqhpgH
	 aToGVI3han7wB4Riv4ToFqG4ckdsGJ4WuWf04HX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B97C8F8016E;
	Wed, 31 Mar 2021 09:20:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 442F9F80166; Wed, 31 Mar 2021 09:20:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 85316F8013C
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 09:20:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85316F8013C
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1617175213942497015-webhooks-bot@alsa-project.org>
References: <1617175213942497015-webhooks-bot@alsa-project.org>
Subject: Bus error with alsaloop
Message-Id: <20210331072026.442F9F80166@alsa1.perex.cz>
Date: Wed, 31 Mar 2021 09:20:26 +0200 (CEST)
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

alsa-project/alsa-utils issue #85 was opened from philipp-fischer:

## Behaviour
alsaloop crashes with a bus error (SIGBUS) immediately

```
pi@pi-snapserver:~ $ alsaloop -C hw:2,0 -P hw:3,0
Bus error
```

## Analysis and debugging

Very verbose output:
```
pi@pi-snapserver:~ $ alsaloop -C hw:2,0 -P hw:3,0 -vvvvvvvvvvvvvvvvv
!!!Scheduler set to Round Robin with priority 99 FAILED!
playback hw:3,0: buffer_size=1920
playback hw:3,0: period_size=240
capture hw:2,0: buffer_size=1920
capture hw:2,0: period_size=240
playback hw:3,0: avail_min2=1560
capture hw:2,0: avail_min2=120
Hardware PCM card 3 'ICUSBAUDIO7D' device 0 subdevice 0
Its setup is:
  stream       : PLAYBACK
  access       : RW_INTERLEAVED
  format       : S16_LE
  subformat    : STD
  channels     : 2
  rate         : 48000
  exact rate   : 48000 (48000/1)
  msbits       : 16
  buffer_size  : 1920
  period_size  : 240
  period_time  : 5000
  tstamp_mode  : NONE
  tstamp_type  : MONOTONIC
  period_step  : 1
  avail_min    : 1560
  period_event : 0
  start_threshold  : 2147483647
  stop_threshold   : 1920
  silence_threshold: 0
  silence_size : 0
  boundary     : 2013265920
  appl_ptr     : 0
  hw_ptr       : 0
Hardware PCM card 2 'ICUSBAUDIO7D' device 0 subdevice 0
Its setup is:
  stream       : CAPTURE
  access       : RW_INTERLEAVED
  format       : S16_LE
  subformat    : STD
  channels     : 2
  rate         : 48000
  exact rate   : 48000 (48000/1)
  msbits       : 16
  buffer_size  : 1920
  period_size  : 240
  period_time  : 5000
  tstamp_mode  : NONE
  tstamp_type  : MONOTONIC
  period_step  : 1
  avail_min    : 240
  period_event : 0
  start_threshold  : 2147483647
  stop_threshold   : 1920
  silence_threshold: 0
  silence_size : 0
  boundary     : 2013265920
  appl_ptr     : 0
  hw_ptr       : 0
Latency 480 frames, 10000.000us, 10.000000ms (100.0000Hz)
playback hw:3,0/capture hw:2,0 sync type: SAMPLERATE (SRC_SINC_FASTEST)
playback hw:3,0/capture hw:2,0: capt->buffer_size = 3840, play->buffer_size = 3840
playback hw:3,0/capture hw:2,0: Samplerate src_ratio update1: 1.00000000
New pitch for playback hw:3,0/capture hw:2,0: 1.00000000 (min/max samples = 0/0)
playback hw:3,0/capture hw:2,0: silence queued 480 samples
pool took 3074us
playback hw:3,0/capture hw:2,0: pollfds handle
playback hw:3,0: delay 480 / 3840 / 0
capture hw:2,0: delay 0 / 3840 / 0
playback hw:3,0/capture hw:2,0: prevents = 0x4, crevents = 0x0
playback hw:3,0/capture hw:2,0: queued 480/0 samples
playback hw:3,0: end delay 480 / 3840 / 0
capture hw:2,0: end delay 0 / 3840 / 0
playback hw:3,0/capture hw:2,0: processing time 59us
pool took 13us
[...]
playback hw:3,0/capture hw:2,0: pollfds handle
playback hw:3,0: delay 323 / 3840 / 0
capture hw:2,0: delay 0 / 3840 / 0
playback hw:3,0/capture hw:2,0: prevents = 0x4, crevents = 0x0
playback hw:3,0/capture hw:2,0: queued 323/0 samples
playback hw:3,0: end delay 323 / 3840 / 0
capture hw:2,0: end delay 0 / 3840 / 0
playback hw:3,0/capture hw:2,0: processing time 212us
pool took 5us
playback hw:3,0/capture hw:2,0: pollfds handle
playback hw:3,0: delay 323 / 3840 / 0
capture hw:2,0: delay 48 / 3840 / 0
playback hw:3,0/capture hw:2,0: prevents = 0x4, crevents = 0x0
Bus error
```

Debugging with backtrace (binary without dbg symbols):
```
[...]
Program received signal SIGBUS, Bus error.
0xb6dbd394 in src_short_to_float_array () from /lib/arm-linux-gnueabihf/libsamplerate.so.0
(gdb) bt
#0  0xb6dbd394 in src_short_to_float_array () from /lib/arm-linux-gnueabihf/libsamplerate.so.0
#1  0x00016a20 in ?? ()
Backtrace stopped: previous frame identical to this frame (corrupt stack?)
(gdb)
```

So the error seems to happen in `libsamplerate.so`

Switching the sync method to "SIMPLE" prevents the error from happening as alsaloop doesn't seem to make use of libsamplerate in this case.
The following modes run without failing but don't give the desired results:

```
pi@pi-snapserver:~ $ alsaloop -C hw:2,0 -P hw:3,0 -S 0  # SYNC_TYPE_NONE
pi@pi-snapserver:~ $ alsaloop -C hw:2,0 -P hw:3,0 -S 1  # SYNC_TYPE_SIMPLE
pi@pi-snapserver:~ $ alsaloop -C hw:2,0 -P hw:3,0 -S 2  # SYNC_TYPE_CAPTRATESHIFT
pi@pi-snapserver:~ $ alsaloop -C hw:2,0 -P hw:3,0 -S 3  # SYNC_TYPE_PLAYRATESHIFT
```

Only `SYNC_TYPE_SAMPLERATE` and `SYNC_TYPE_AUTO` (which selects SYNC_TYPE_SAMPLERATE) fail.

The modes `SYNC_TYPE_NONE` and `SYNC_TYPE_SIMPLE` don't crash for me, but they don't work and result in increasing latency until the fifos reset. (Which is another issue I guess)

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/85
Repository URL: https://github.com/alsa-project/alsa-utils
