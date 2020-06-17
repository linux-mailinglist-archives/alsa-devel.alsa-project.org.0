Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2DE1FCCDF
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 13:58:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9D21851;
	Wed, 17 Jun 2020 13:57:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9D21851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592395079;
	bh=o16GcUfRhzwsmPN/cCoes3HW2sQhH8Y6ONyZbfb4jmU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Aut7CXNWvPV+DHuz92R+CEEsYsvmfcFnqhkbhIRkYHMZw1qNGsSHKm5Ay6JS3npmY
	 tlkqMPsYqKhKHepXoU4ZEqpmySReA5fc58JoRkuxspD58duPPiz6IhaQVSgjq3gSSa
	 Wcr+cIQ4QsxNolX8eKqpru4KCrw0sqqF6IcsHEzA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EAFCF80162;
	Wed, 17 Jun 2020 13:56:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD9D4F80271; Wed, 17 Jun 2020 13:56:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=4.0 required=5.0 tests=MISSING_DATE,MISSING_MID,
 PRX_BODY_16,SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 6ED54F80162
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 13:56:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6ED54F80162
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1592395003659609079-webhooks-bot@alsa-project.org>
References: <1592395003659609079-webhooks-bot@alsa-project.org>
Subject: pcm: direct: correctly apply existing interval settings
Message-Id: <20200617115651.AD9D4F80271@alsa1.perex.cz>
Date: Wed, 17 Jun 2020 13:56:51 +0200 (CEST)
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

alsa-project/alsa-lib pull request #62 was opened from aditpape:

Feature 'variable periodsize' allows to extend user period size up to buffer_size/2 independent of slave period.
On enlargement of the settings for period_time.max and period_size.max the setting for openmax was not updated.

This lead to the effect, that if the slave period itself had openmax set it was still set on the extended size.
Configuration of a period matching half buffer size was thus rejected.

Example for failure: period size of 384 (half buffer size) is requested which is rejected and rounded down to 352:

root@oracle-virtualbox:~# arecord -DDSNOOP_32 -r48000 -fS16_LE -c2 --period-size=382 -vv --dump-hw-params > /dev/null
Recording WAVE 'stdin' : Signed 16 bit Little Endian, Rate 48000 Hz, Stereo
HW Params of device "DSNOOP_32":
--------------------
ACCESS:  MMAP_INTERLEAVED MMAP_NONINTERLEAVED RW_INTERLEAVED RW_NONINTERLEAVED
FORMAT:  S16_LE
SUBFORMAT:  STD
SAMPLE_BITS: 16
FRAME_BITS: 32
CHANNELS: 2
RATE: 48000
PERIOD_TIME: (666 7334)
PERIOD_SIZE: [32 352]
PERIOD_BYTES: [128 1408]
PERIODS: [2 24]
BUFFER_TIME: (1333 16000]
BUFFER_SIZE: [64 768]
BUFFER_BYTES: [256 3072]
TICK_TIME: ALL
--------------------
Direct Snoop PCM
Its setup is:
  stream       : CAPTURE
  access       : RW_INTERLEAVED
  format       : S16_LE
  subformat    : STD
  channels     : 2
  rate         : 48000
  exact rate   : 48000 (48000/1)
  msbits       : 16
  buffer_size  : 704
  period_size  : 352
  period_time  : 7333
  tstamp_mode  : NONE
  tstamp_type  : MONOTONIC
  period_step  : 1
  avail_min    : 352
  period_event : 0
  start_threshold  : 1
  stop_threshold   : 704
  silence_threshold: 0
  silence_size : 0
  boundary     : 6341068275337658368
Hardware PCM card 0 'Intel 82801AA-ICH' device 0 subdevice 0
Its setup is:
  stream       : CAPTURE
  access       : MMAP_INTERLEAVED
  format       : S16_LE
  subformat    : STD
  channels     : 2
  rate         : 48000
  exact rate   : 48000 (48000/1)
  msbits       : 16
  buffer_size  : 768
  period_size  : 32
  period_time  : 666
  tstamp_mode  : ENABLE
  tstamp_type  : MONOTONIC
  period_step  : 1
  avail_min    : 32
  period_event : 0
  start_threshold  : 1
  stop_threshold   : 6917529027641081856
  silence_threshold: 0
  silence_size : 0
  boundary     : 6917529027641081856
  appl_ptr     : 0
  hw_ptr       : 224

When correctly applying the openmax setting:

root@oracle-virtualbox:~# arecord -DDSNOOP_32 -r48000 -fS16_LE -c2 --period-size=382 -vv --dump-hw-params > /dev/null
Recording WAVE 'stdin' : Signed 16 bit Little Endian, Rate 48000 Hz, Stereo
HW Params of device "DSNOOP_32":
--------------------
ACCESS:  MMAP_INTERLEAVED MMAP_NONINTERLEAVED RW_INTERLEAVED RW_NONINTERLEAVED
FORMAT:  S16_LE
SUBFORMAT:  STD
SAMPLE_BITS: 16
FRAME_BITS: 32
CHANNELS: 2
RATE: 48000
PERIOD_TIME: (666 8000]
PERIOD_SIZE: [32 384]
PERIOD_BYTES: [128 1536]
PERIODS: [2 24]
BUFFER_TIME: (1333 16000]
BUFFER_SIZE: [64 768]
BUFFER_BYTES: [256 3072]
TICK_TIME: ALL
--------------------
Direct Snoop PCM
Its setup is:
  stream       : CAPTURE
  access       : RW_INTERLEAVED
  format       : S16_LE
  subformat    : STD
  channels     : 2
  rate         : 48000
  exact rate   : 48000 (48000/1)
  msbits       : 16
  buffer_size  : 768
  period_size  : 384
  period_time  : 8000
  tstamp_mode  : NONE
  tstamp_type  : MONOTONIC
  period_step  : 1
  avail_min    : 384
  period_event : 0
  start_threshold  : 1
  stop_threshold   : 768
  silence_threshold: 0
  silence_size : 0
  boundary     : 6917529027641081856
Hardware PCM card 0 'Intel 82801AA-ICH' device 0 subdevice 0
Its setup is:
  stream       : CAPTURE
  access       : MMAP_INTERLEAVED
  format       : S16_LE
  subformat    : STD
  channels     : 2
  rate         : 48000
  exact rate   : 48000 (48000/1)
  msbits       : 16
  buffer_size  : 768
  period_size  : 32
  period_time  : 666
  tstamp_mode  : ENABLE
  tstamp_type  : MONOTONIC
  period_step  : 1
  avail_min    : 32
  period_event : 0
  start_threshold  : 1
  stop_threshold   : 6917529027641081856
  silence_threshold: 0
  silence_size : 0
  boundary     : 6917529027641081856
  appl_ptr     : 0
  hw_ptr       : 224

Signed-off-by: Andreas Pape <apape@de.adit-jv.com>

Request URL   : https://github.com/alsa-project/alsa-lib/pull/62
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/62.patch
Repository URL: https://github.com/alsa-project/alsa-lib
