Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E594C85A1
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 08:55:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEF441B07;
	Tue,  1 Mar 2022 08:54:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEF441B07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646121311;
	bh=oC8YUnXw6/vxm8Rn0GOIVg+dVbyXpq5nI4Hs3FI0enY=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hRaVtyGQ5G6Jso5hpeqmsa3a84BX5e2N7PfLTnLnDJG3XLgrZQ2xnRg9kRZFIhepH
	 +AcZpljveEx2/TEaNmbQbtJ2SpukaNeokq4j6jxPxNouR5oiWCcw7IWR5EwAd/zyin
	 9yIJBBIzxBqjnfngcLqZIuv/ZBv5OVBnxNFADfCY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 510C6F802D2;
	Tue,  1 Mar 2022 08:54:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6AFCF80227; Tue,  1 Mar 2022 08:54:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 201F3F80167
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 08:53:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 201F3F80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="U4QvuLzo"
Received: by mail-pg1-x52b.google.com with SMTP id e6so12361230pgn.2
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 23:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id;
 bh=k29JDfqvR6mNy7EkcocFmwmWLWxTFCgH8vy77P+eaVE=;
 b=U4QvuLzoLqAHKmQMoaUBg1B7A0xkreLeZ9Spbt0PJWnJCyzL/Lt0YuogzyZMoU3R66
 nMIvKh9tmxlCXVma/LPIStHeRFFeCKZ5z4A4pmar0rMiSdBTAhSnlVt64ntQDfcNbGzZ
 CFoGASFO/MlfxvU/Fsv1afgYUtZpuM/4woI//24S2o4tNxj9IdyMO2/oI0fDuW3PsddV
 QlPK8iSl99r8713o9iG6Z1CyzVWc6QzRslUvPUAqmqqa2clXdAa4h7l8oMXMwgzjmV+M
 FzMyt1B3jye1dChvuCQbEY5pw/fb3UV1Tz8VE23Ei6tL3WZ5EyTuqJ9VcNqOey09ERIP
 w8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=k29JDfqvR6mNy7EkcocFmwmWLWxTFCgH8vy77P+eaVE=;
 b=hUP/JeNbZD+jhHchVqv7ZYLEKahdxwgXI4oHb0t8NDhVnavyELyaII9UPy5YSThyq+
 VVmQOECB2bq7M/nZ2Ft1OWa56XcSCl0e7EeSkJ8XpY/w9uiORWd2cxJ73QWa+u0MI0q7
 8FdoZYepRbBpuakNkfO5GORio2Rl1HUi8wph64W7CI5xDLv1Bgb+vgR+/V84XF226tVv
 SfSfmCICaoqbNaOAcl+b9w2Z9dhP+VxNaRMCt6fy+CV4m59eIiPP555HbqId48VIq/TK
 rBqJYKHLclsgSE04yp6s2w8TxWx5UOmFBHzHKWK+Auh3zUEOwhBfkYkUDQtFwPYPjSi5
 Suwg==
X-Gm-Message-State: AOAM532ZpbWWHFshGCH+UhcHpr/3lYEQ68RdWznSDXhFfTqY1tMCkaSx
 fQwAKG8V/GLrpqg0ikdFP9c=
X-Google-Smtp-Source: ABdhPJzwTwnamipFkPsIa99LN8JgvfXABeGyi9pRo+WzEGsNhK2+qosAq26HNCVULju916ag/5zr4g==
X-Received: by 2002:a65:4845:0:b0:325:c147:146d with SMTP id
 i5-20020a654845000000b00325c147146dmr21097675pgs.140.1646121237775; 
 Mon, 28 Feb 2022 23:53:57 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 23-20020a17090a0d5700b001bc3c650e01sm1856852pju.1.2022.02.28.23.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 23:53:57 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Miaoqian Lin <linmq006@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl: Fix error handling in pcm030_fabric_probe
Date: Tue,  1 Mar 2022 07:53:48 +0000
Message-Id: <20220301075351.31691-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
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

This will call twice platform_device_put()
if both platform_device_add() and snd_soc_register_card() fails.
Fix it by using goto label to avoid duplicating the error code logic.

Fixes: fb25621da570 ("ASoC: fsl: Add missing error handling in pcm030_fabric_probe")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/fsl/pcm030-audio-fabric.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/pcm030-audio-fabric.c b/sound/soc/fsl/pcm030-audio-fabric.c
index 83b4a22bf15a..d397bb97f37b 100644
--- a/sound/soc/fsl/pcm030-audio-fabric.c
+++ b/sound/soc/fsl/pcm030-audio-fabric.c
@@ -95,19 +95,23 @@ static int pcm030_fabric_probe(struct platform_device *op)
 	ret = platform_device_add(pdata->codec_device);
 	if (ret) {
 		dev_err(&op->dev, "platform_device_add() failed: %d\n", ret);
-		platform_device_put(pdata->codec_device);
+		goto err_add;
 	}
 
 	ret = snd_soc_register_card(card);
 	if (ret) {
 		dev_err(&op->dev, "snd_soc_register_card() failed: %d\n", ret);
-		platform_device_del(pdata->codec_device);
-		platform_device_put(pdata->codec_device);
+		goto err_register;
 	}
 
 	platform_set_drvdata(op, pdata);
 	return ret;
 
+err_register:
+	platform_device_del(pdata->codec_device);
+err_add:
+	platform_device_put(pdata->codec_device);
+	return ret;
 }
 
 static int pcm030_fabric_remove(struct platform_device *op)
-- 
2.17.1

