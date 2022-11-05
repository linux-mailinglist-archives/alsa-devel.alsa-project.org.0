Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 053A861A667
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 01:28:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 920D1E12;
	Sat,  5 Nov 2022 01:27:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 920D1E12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667608127;
	bh=vGqjIK6e1XNZqgDypgg3FDCLt+6IvjIPcz6aQI3KkCM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=adM+0k6jusm/edD8Z4tDmq0EnTpMMoqUgWbADbAcxgljmgQraYcYrQTPt+ZbwsZlU
	 7Iy3X4LN+29xcULrX9pm174XR5Rp54ShGD2R6NRZ90izaYMdH6PYQ7tvXvRO0t3QCL
	 2HG+RGlW33eEE0rlfCHywt1YyQ5NiWIib2QZ79/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BB44F8047D;
	Sat,  5 Nov 2022 01:27:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A524F80431; Sat,  5 Nov 2022 01:27:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 7D8A1F801D5
 for <alsa-devel@alsa-project.org>; Sat,  5 Nov 2022 01:27:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D8A1F801D5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1667608056806138992-webhooks-bot@alsa-project.org>
References: <1667608056806138992-webhooks-bot@alsa-project.org>
Subject: [snd-dice] latency 13 times higher compared to FFADO (Saffire 14 PRO)
 with jack2
Message-Id: <20221105002748.9A524F80431@alsa1.perex.cz>
Date: Sat,  5 Nov 2022 01:27:48 +0100 (CET)
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

alsa-project/alsa-lib issue #280 was opened from grinness:

Hi,

I hope this is the right place to report this (please let me know if it is not)
On a 5900x, 32 GB RAM, Archlinux (kernel 6.0.2), I have been investigating crazy high latency using a pipewire-jack, see:

https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/2790

I ended up testing jack_iodelay with jack2, comparing snd-dice and FFADO

Running qjackctl jack2, ALSA backed (snd-dice) 48000Hz, 1024 samples, 2 periods:

```
> jack_iodelay                                                                                                                                                                                                                                                                                                                           
new capture latency: [0, 0]
new playback latency: [0, 0]
Signal below threshold...
Signal below threshold...
new capture latency: [1024, 1024]
Signal below threshold...
Signal below threshold...
new playback latency: [2048, 2048]
  5198.818 frames    108.309 ms total roundtrip latency
        extra loopback latency: 2126 frames
        use 1063 for the backend arguments -I and -O Inv
  5198.818 frames    108.309 ms total roundtrip latency
        extra loopback latency: 2126 frames
        use 1063 for the backend arguments -I and -O ?? Inv
```
Running qjackctl jack2, firewire backend (FFADO) 4800, 512 samples, 2 periods:
```
> jack_iodelay                                                                                                                                                                                                                                                                                                                                    
new capture latency: [0, 0]
new playback latency: [0, 0]
Signal below threshold...
new capture latency: [1024, 1024]
Signal below threshold...
new playback latency: [3072, 3072]
  4258.811 frames     88.725 ms total roundtrip latency
        extra loopback latency: 162 frames
        use 81 for the backend arguments -I and -O Inv
  4258.812 frames     88.725 ms total roundtrip latency
        extra loopback latency: 162 frames
        use 81 for the backend arguments -I and -O Inv
```
Note that qjackctl seems to not set the number of periods correctly with firewire backend, the above playback latency suggests 3 periods instead of 2.
It seems that Cadence fixes the issue, but the extra loopback latency stays at 162 frames with FFADO:
```
> jack_iodelay                                                                                                                                                                                                                                                                                                                                        
new capture latency: [0, 0]
new playback latency: [0, 0]
Signal below threshold...
Signal below threshold...
Signal below threshold...
Signal below threshold...
Signal below threshold...
Signal below threshold...
new capture latency: [512, 512]
  8354.799 frames    174.058 ms total roundtrip latency
        extra loopback latency: 7842 frames
        use 3921 for the backend arguments -I and -O ?? Inv
  8354.779 frames    174.058 ms total roundtrip latency
        extra loopback latency: 7842 frames
        use 3921 for the backend arguments -I and -O Inv
Signal below threshold...
Signal below threshold...
new playback latency: [1024, 1024]
Signal below threshold...
  1698.777 frames     35.391 ms total roundtrip latency
        extra loopback latency: 162 frames
        use 81 for the backend arguments -I and -O Inv
  1698.777 frames     35.391 ms total roundtrip latency
        extra loopback latency: 162 frames
        use 81 for the backend arguments -I and -O Inv
  1698.777 frames     35.391 ms total roundtrip latency
        extra loopback latency: 162 frames
        use 81 for the backend arguments -I and -O Inv
  1698.777 frames     35.391 ms total roundtrip latency
        extra loopback latency: 162 frames
        use 81 for the backend arguments -I and -O Inv
  1698.777 frames     35.391 ms total roundtrip latency
        extra loopback latency: 162 frames

```

Please note that the pipewire developer pointed out that:

"My problem is that the period size in the driver is set to 1024. For batch devices and a quantum of 256 this should be set to 128 to get decent latency.
So, either the driver does not report itself as batch, or something else started the nodes with a higher quantum. I'm betting it's the batch thing."

I also reported this in the following:
https://github.com/takaswie/snd-firewire-improve/issues/47

thanks

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/280
Repository URL: https://github.com/alsa-project/alsa-lib
