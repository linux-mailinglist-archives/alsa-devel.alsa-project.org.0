Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D94AD40340A
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Sep 2021 08:04:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52E691711;
	Wed,  8 Sep 2021 08:03:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52E691711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631081075;
	bh=q/kb69JHBqAKBRpgXfJIUkM77kGXlhFy7ESr9OP9zqM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nOvnwU5LVhiXXF3BhGMOIuFgMRWRhFUHhn0iZb9WBqa9Xaz9EZZslL4ZC/om1Jh7k
	 VXlX7W8W5pEqg1a7iGcgb9UPoicm12PKOCzGZViwUjRuDlFURUry3oi9KIKR+Q9+Oy
	 IBLrzJz2li6rKYpxs01e1zsEO1H4q1gmRfFZJYQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A445DF80166;
	Wed,  8 Sep 2021 08:03:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C05AF80224; Tue,  7 Sep 2021 23:01:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA6ECF80103
 for <alsa-devel@alsa-project.org>; Tue,  7 Sep 2021 23:01:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA6ECF80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LLEIdYui"
Received: by mail-io1-xd35.google.com with SMTP id a15so320298iot.2
 for <alsa-devel@alsa-project.org>; Tue, 07 Sep 2021 14:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=42/o3XCTvFFMDqQK8f9AfyX4rLgajFefJ/gjs/d1iq8=;
 b=LLEIdYuiZYXgeaNIuDLm0LQWrjYOXmecJ+uVmwTbZET508a7ox7wZKj3OGIfsFoJGS
 P/nUK1hIHoUbEY9L4wagB/KWdU5GPhXGtHDp1ocgJV+ilRKzbfJr4jCDtWwsaX57D6qg
 luWbusBQYyh0YXpWXCHLUq01tzfOhL4VbmBGJjmTEGRdGpDNM+3ztB+Rtjj3oQ+xL5Sj
 1/cD0hkyGDHvSPqhHB4ydL3eRkaQztNodJgAxLqnUyrBohtuvtNMYOUpYB/9eU/zsuvZ
 qKUvaEMxi9MBQzpheVoWeJO/9Pf+s/EPQS09wnmqlL7XiOuUhxKga7x4YMBWtF26IQgY
 fg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=42/o3XCTvFFMDqQK8f9AfyX4rLgajFefJ/gjs/d1iq8=;
 b=Sl4I3tZNCvXllsnv4F68HRbrMaUJ8IGXRQmUytl42KREP60Bvwg3q9WwrEdnlZNjke
 USYUdH7X+eYR+Vigft0YvNDcqOuFL4655hb3JEA66FDHcEs2Tv7HlHqNZ3+ETZDUMbSt
 EqdyAwGoOIKSs/BK4t/X2Skr1M3C6CeID6WPsj/0HcsG9mNG19X0uOyaLNnXysBFS1uW
 bLCbvv4T/IgY+Ve76VGJrO/gdo7Sy/tyCKTkYPKgc7SnUviboSd6rJWTmGZl72n/+5oq
 azQZu1NmSuLLJWz5NIMnow43GACYKBMdn6XI5ky7rMPmpmZX4mJzYiRAtymzMbxOD6iH
 s94A==
X-Gm-Message-State: AOAM530JX/B/F3GuWTJZwJ8eudboIYZrO5L/uQKCal3nmejXzIfubLWD
 Wj0gs637YCBNA77dW04HGMI=
X-Google-Smtp-Source: ABdhPJzB9ZDRa7SHDtuzOgMiXk9eN8ynL/UpZ1hFODTFS3ZTujq5wAFtsVY1S9f8cYWOGn8vK8yd7w==
X-Received: by 2002:a02:7f47:: with SMTP id r68mr294215jac.54.1631048509005;
 Tue, 07 Sep 2021 14:01:49 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:4320:6caf::199])
 by smtp.googlemail.com with ESMTPSA id c11sm22740ioh.50.2021.09.07.14.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 14:01:47 -0700 (PDT)
From: gearhead <ys3al35l@gmail.com>
To: ys3al35l@gmail.com
Subject: [PATCH] ASoC: pcm5102a: increase rate from 192k to 384k
Date: Tue,  7 Sep 2021 16:01:25 -0500
Message-Id: <20210907210130.116769-1-ys3al35l@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 08 Sep 2021 08:03:16 +0200
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>
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

the pcm5102a is capable of 384k, but the current code limits it to 192k.
This commit extends to 384k

Signed-off-by: gearhead <ys3al35l@gmail.com>
---
 sound/soc/codecs/pcm5102a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/pcm5102a.c b/sound/soc/codecs/pcm5102a.c
index b8cfc250612c..f39f98bbc97f 100644
--- a/sound/soc/codecs/pcm5102a.c
+++ b/sound/soc/codecs/pcm5102a.c
@@ -17,7 +17,7 @@ static struct snd_soc_dai_driver pcm5102a_dai = {
 	.playback = {
 		.channels_min = 2,
 		.channels_max = 2,
-		.rates = SNDRV_PCM_RATE_8000_192000,
+		.rates = SNDRV_PCM_RATE_8000_384000,
 		.formats = SNDRV_PCM_FMTBIT_S16_LE |
 			   SNDRV_PCM_FMTBIT_S24_LE |
 			   SNDRV_PCM_FMTBIT_S32_LE
-- 
2.33.0

