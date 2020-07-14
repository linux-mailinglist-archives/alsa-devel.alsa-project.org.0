Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D9421F5B3
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 17:05:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72FE282E;
	Tue, 14 Jul 2020 17:04:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72FE282E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594739131;
	bh=eCYLUjeEayoag8E19ddEcHwoeg4PYBGaYLVgSqqnfRg=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vTkT2Cx3x00RF1zJHgj3uJW0s+KDLbwyMXKgsWrGci5riTFYEfn0Msfm3EpH9vMcq
	 /SREm0RCbXu8Q4YM4+NOPIf5iGIv7NVaQY5X0oKOcte+1nyi/UcV9253VyzUKt+8k2
	 vikzTpbd4p7NQ3S+nrIYCg9Ji+dnQKvkYf1n307M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C94BDF802BC;
	Tue, 14 Jul 2020 17:02:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15825F801F2; Tue, 14 Jul 2020 17:02:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE9FAF8020C
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 17:02:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE9FAF8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aWo9U/wr"
Received: by mail-ej1-x62f.google.com with SMTP id a1so22298973ejg.12
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 08:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language;
 bh=XcH3Mi1tFoDsEvfLCCbqy7279nooFLm8gGAaNy9zEo0=;
 b=aWo9U/wrGr1fUV8lcQMgcSS9qENLinZr/US98Xp1iP2S2LokrexK/8oy940PbnFv1R
 9Kby0/y1/1QDGSr+NX4S77CFK+a89gtUtFEnLgCw0hElKjsCmJZe5GL8cdLNm36GXoV1
 9yRhGyGEeVNngLEao/zExhbLI+v2bLjniBmec9GMHBziqkLq4BlKUOUAFNIv56sC3zT9
 d0tm65SN3vAwzOms8GQBxQ0QgdupMczmS8Im8kw6tUejw3wHrxhUPF2QAXLBbLHMa4eg
 lXxqbuHVtTolYmEJpqeTQS9nusbFvQL6aYqdanrNJNpq8mQtvUZSiMzG23l6/AmzWjw7
 b1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language;
 bh=XcH3Mi1tFoDsEvfLCCbqy7279nooFLm8gGAaNy9zEo0=;
 b=kjtptnKpZFsfoJ5mHg4rR0SRDH/85RTH0RvWPcenYOzAD2ktYwhekkmTJctDRoI0j+
 kxIE4i2xlFH7boFI1P/B+CiMeIpHIrMqi5C1ZJgczIsOutcRTw6ZLN7TtYdAMBk98Ij3
 TeoslumbO+0EVCDzB30Mb4qeeR3hcvg4Oo+Lgd6d79lFd0gw4/feah1kyoeE1o95e4oN
 u8zLRE1ksqHI5hbOwFiGOw51cdo82k9onaZE9HFv7RvZHYBFfRA6DobqQRj2DfCozxUR
 C8eibAqk1fHLpwdEYSOuGRK38FVTeesR4IY7eA8j9ivRcgK3D3AW4g7z8TdwSrRHuY3g
 uolQ==
X-Gm-Message-State: AOAM530iGqv4UkddpbnTl+JzNtRpbyf7u7A0NW0KtNEddS9CJWr/eyo3
 MYMMwB3XPokpSKteG5RDaW5+dwMD
X-Google-Smtp-Source: ABdhPJzuQ8asM2ejp52UFsS50wH9Os78D4bnUDf2978rV5NkXkpHfzPY0QXJPXOvtwuD++zLSRsnow==
X-Received: by 2002:a17:906:408c:: with SMTP id
 u12mr4815321ejj.162.1594738960368; 
 Tue, 14 Jul 2020 08:02:40 -0700 (PDT)
Received: from ?IPv6:2001:1c01:2f03:7200:763c:d807:63d8:4d15?
 (2001-1c01-2f03-7200-763c-d807-63d8-4d15.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:2f03:7200:763c:d807:63d8:4d15])
 by smtp.gmail.com with ESMTPSA id o6sm14889797edr.94.2020.07.14.08.02.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 08:02:39 -0700 (PDT)
To: alsa-devel@alsa-project.org
From: =?UTF-8?Q?Ren=c3=a9_Herman?= <rene.herman@gmail.com>
Subject: [snd-usb-6fire] Pulseaudio needs snd_pcm_hardware.channels_min > 1
Message-ID: <8d3495ee-82d6-245c-9fa7-ba1fb6d375e5@gmail.com>
Date: Tue, 14 Jul 2020 17:02:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------769721C6722C06FD8E8B763F"
Content-Language: nl-NL
Cc: Torsten Schenk <torsten.schenk@zoho.com>
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

This is a multi-part message in MIME format.
--------------769721C6722C06FD8E8B763F
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Pulseaudio with snd_pcm_hardware.channels_min=1 creates a mono device
only.

Signed-off-by: René Herman <rene.herman@gmail.com>


--------------769721C6722C06FD8E8B763F
Content-Type: text/x-patch; charset=UTF-8;
 name="0002-snd-usb-6fire-Pulseaudio-needs-snd_pcm_hardware.chan.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename*0="0002-snd-usb-6fire-Pulseaudio-needs-snd_pcm_hardware.chan.pa";
 filename*1="tch"

From 070d3a9b76cebf9f66ca092fc097753e165ddd77 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Ren=C3=A9=20Herman?= <rene.herman@gmail.com>
Date: Sun, 12 Jul 2020 01:31:29 +0200
Subject: [PATCH 2/3] [snd-usb-6fire] Pulseaudio needs
 snd_pcm_hardware.channels_min > 1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Pulseaudio with snd_pcm_hardware.channels_min=1 creates a mono device
only.

Signed-off-by: René Herman <rene.herman@gmail.com>
---
 sound/usb/6fire/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/6fire/pcm.c b/sound/usb/6fire/pcm.c
index 88ac1c4ee163..cce1312db93a 100644
--- a/sound/usb/6fire/pcm.c
+++ b/sound/usb/6fire/pcm.c
@@ -58,7 +58,7 @@ static const struct snd_pcm_hardware pcm_hw = {
 
 	.rate_min = 44100,
 	.rate_max = 192000,
-	.channels_min = 1,
+	.channels_min = 2,
 	.channels_max = 0, /* set in pcm_open, depending on capture/playback */
 	.buffer_bytes_max = MAX_BUFSIZE,
 	.period_bytes_min = PCM_N_PACKETS_PER_URB * (PCM_MAX_PACKET_SIZE - 4),
-- 
2.17.1


--------------769721C6722C06FD8E8B763F--
