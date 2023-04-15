Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2906D6E3024
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Apr 2023 11:37:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4254B832;
	Sat, 15 Apr 2023 11:36:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4254B832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681551459;
	bh=uCTRZMUuaKIKz3k2Ez/QlDSBar+Ho0cS7GsfJMRGSJA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Ln7B2CXMWNNRe3So7ir7tqtn7ANDe4vXs7O29+vc/Ee7tXg1FWXqEf59LjTJI+O1T
	 Hr5mKQ7p+8IFFRVrzmzl0yL7cFKIO2wAPp6MWFsxpjBuUWEcNs9fONBSDx+4RcyA4r
	 Aa1EhBdzz6Cb+bfmVA267yeNXZiosq2bzOM2yjAU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E0AAF8025E;
	Sat, 15 Apr 2023 11:36:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17424F8032B; Sat, 15 Apr 2023 11:36:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id B2F23F800E5
	for <alsa-devel@alsa-project.org>; Sat, 15 Apr 2023 11:36:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2F23F800E5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1681551396425462008-webhooks-bot@alsa-project.org>
References: <1681551396425462008-webhooks-bot@alsa-project.org>
Subject: arecord: duration incorrect when ALSA chooses different sample rate
Message-Id: <20230415093644.17424F8032B@alsa1.perex.cz>
Date: Sat, 15 Apr 2023 11:36:44 +0200 (CEST)
Message-ID-Hash: ER65LLAKUQJ2QLP3AHOT3RWCEAT3TBEO
X-Message-ID-Hash: ER65LLAKUQJ2QLP3AHOT3RWCEAT3TBEO
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ER65LLAKUQJ2QLP3AHOT3RWCEAT3TBEO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #200 was opened from iam-TJ:

I encountered this issue whilst researching a bug in capture handling in ALSA/PulseAudio/PortAudio/Audacity. When recording for    a fixed duration the duration is measured by the quantity of samples, not clock time. In `capture()`  a call to `calc_count()` occurs before `set_params()`, but in that latter function the actual sample rate used may differ from the requested rate   , but the count is not recalculated. E.g:
```
$ time arecord -D hw:1,0 -d 2 -c 2 -f S16_LE -r 384000 --dump-hw-params /tmp/test.11.wav
Recording WAVE '/tmp/test.11.wav' : Signed 16 bit Little Endian, Rate 384000 Hz, Stereo
HW Params of device "hw:1,0":
--------------------
ACCESS:  MMAP_INTERLEAVED RW_INTERLEAVED
FORMAT:  S16_LE S32_LE
SUBFORMAT:  STD
SAMPLE_BITS: [16 32]
FRAME_BITS: [32 64]
CHANNELS: 2
RATE: [44100 192000]
PERIOD_TIME: (83 11888617)
PERIOD_SIZE: [16 524288]
PERIOD_BYTES: [128 2097152]
PERIODS: [2 32]
BUFFER_TIME: (166 23777234)
BUFFER_SIZE: [32 1048576]
BUFFER_BYTES: [128 4194304]
TICK_TIME: ALL
--------------------
Warning: rate is not accurate (requested = 384000Hz, got = 192000Hz)
         please, try the plug plugin

real    0m4.009s
user    0m0.004s
sys     0m0.007s
```
In this example, because the actual sample rate was 1/2 of that requested, count is double what it should be and therefore the    recording continues for 4 seconds instead of the requested 2 seconds.
Moving the call to `set_params()` to before the count logic solves it:
```
$  time aplay/aplay -C -D hw:1,0 -d 2 -c 2 -f S16_LE -r 384000 --dump-hw-params /tmp/test.11.wav
HW Params of device "hw:1,0":
--------------------
ACCESS:  MMAP_INTERLEAVED RW_INTERLEAVED
FORMAT:  S16_LE S32_LE
SUBFORMAT:  STD
SAMPLE_BITS: [16 32]
FRAME_BITS: [32 64]
CHANNELS: 2
RATE: [44100 192000]
PERIOD_TIME: (83 11888617)
PERIOD_SIZE: [16 524288]
PERIOD_BYTES: [128 2097152]
PERIODS: [2 32]
BUFFER_TIME: (166 23777234)
BUFFER_SIZE: [32 1048576]
BUFFER_BYTES: [128 4194304]
TICK_TIME: ALL
--------------------
Warning: rate is not accurate (requested = 384000Hz, got = 192000Hz)
         please, try the plug plugin
Recording WAVE '/tmp/test.11.wav' : Signed 16 bit Little Endian, Rate 192000 Hz, Stereo

real    0m2.009s
user    0m0.001s
sys     0m0.008s
```

Request URL   : https://github.com/alsa-project/alsa-utils/pull/200
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/200.patch
Repository URL: https://github.com/alsa-project/alsa-utils
