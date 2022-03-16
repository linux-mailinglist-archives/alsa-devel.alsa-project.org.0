Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D99DF4DAEBC
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Mar 2022 12:16:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BFC71707;
	Wed, 16 Mar 2022 12:16:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BFC71707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647429418;
	bh=5jbWfFNAAmaVGwYt/QkqAqtagaURrNGVll4diD0gpb8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=auU/l0Yj4N97Jdlh8n2eENSDcLribdnV+NWk0yeCIoED/qtIYr4C69oKknao5ONPy
	 OdqY0epoh64XR0XVmcT9lm0mp35BQ3tlxJZr8dVpxVgHlZoH6yCd+xPr0hqvzA+kBd
	 /QTrP/dSUasHKbZsrkDQN1tR6iDyWbe6RC211HR0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0132EF80153;
	Wed, 16 Mar 2022 12:15:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C97FF8019D; Wed, 16 Mar 2022 12:15:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB1D4F80087
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 12:15:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB1D4F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="C2CWoCL0"
Received: by mail-pj1-x1035.google.com with SMTP id gb19so1888527pjb.1
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 04:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=zpi5C9VV7konMRkeAfHk+5WhJ0SH5tbVLPHMmc40AjM=;
 b=C2CWoCL0Ekn9fRjpQjKpOPVMIMUMUH4Npcw0+/oPcg2aLyuUpYvpAw2dmMqTRUwiSM
 b+zYOdiV3tuPw0Gfyl+AKftp59xe8UdWWNofXLCyZtOx7uURMvHYlcAeB8yKAneYjKqI
 fYjiMp+r4Vxzip6CRZd+JVH029JC7ei9MKq3aXE5t+HCCfNQBhvNEZXFvV/wfp3FPJWs
 bKIlWbir8Q68uJLn+5yO5nxMHTC+DWePTVxlHYBCzmupgsfYsLryvD7UWfSd7CILtx0Z
 Crzxs7nNVuWLQLQ1FCSjg35uCXMp/uJX+PDG8iXGsPIIJLnv5Up1osKZ48w5qCjNl2oF
 VNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=zpi5C9VV7konMRkeAfHk+5WhJ0SH5tbVLPHMmc40AjM=;
 b=mMHxg78Fpc8J1Xm95q/AtPKDFQckanf/iUYbcD1dQ72RLBXjRSWLsxukHCawIZxgqi
 Ovj5QtwXG55Mlf1CSslwkwaUanhfclczX6ak/20/8mvbU4hdXdq+Y70y3HtjsmQsMF/L
 UWrOKfqEOKjsSZ5rdo1PZAP2qG1/pnxsnNLbs3KwbIaMC/0wfjOiLngcXqY6egLO8Da2
 s+V6s44rEng+JFVuNuCPu2zYG8kk02ghHaqe8mjdYG16zBrziMSnS2YaCnmnOqlXcmpq
 +5XV0IsraP1Y/1ZlskN5CJh+duRwRgxve1WEAF6uRjPsaYramIXmsxvaeLyfb5zzEY/x
 i1Hw==
X-Gm-Message-State: AOAM531ARsgxxl/6KEU/OYJIB9lNcCW3ifNI+Eec9H10y4Tzq0rBdvVh
 8XhmN67v4ITGcC3uypf/CuU=
X-Google-Smtp-Source: ABdhPJwD/HkV28o+VSnvQcF7fVyfofI2bk4qfLidwrOFxEvmYqOHaHPM3R6krfmEk/xw91sIJ45ZPQ==
X-Received: by 2002:a17:902:edd5:b0:153:abee:1093 with SMTP id
 q21-20020a170902edd500b00153abee1093mr5290014plk.77.1647429342185; 
 Wed, 16 Mar 2022 04:15:42 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 w3-20020a63af03000000b00381309eb407sm2125704pge.68.2022.03.16.04.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 04:15:41 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Richard Genoud <richard.genoud@gmail.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: atmel: Fix error handling in sam9x5_wm8731_driver_probe
Date: Wed, 16 Mar 2022 11:15:30 +0000
Message-Id: <20220316111530.4551-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linmq006@gmail.com
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

The device_node pointer is returned by of_parse_phandle()  with refcount
incremented. We should use of_node_put() on it when done.

This function only calls of_node_put() in the regular path.
And it will cause refcount leak in error path.

Fixes: fdbcb3cba54b ("ASoC: atmel: machine driver for at91sam9x5-wm8731 boards")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/atmel/sam9x5_wm8731.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/soc/atmel/sam9x5_wm8731.c b/sound/soc/atmel/sam9x5_wm8731.c
index 7c45dc4f8c1b..99310e40e7a6 100644
--- a/sound/soc/atmel/sam9x5_wm8731.c
+++ b/sound/soc/atmel/sam9x5_wm8731.c
@@ -142,7 +142,7 @@ static int sam9x5_wm8731_driver_probe(struct platform_device *pdev)
 	if (!cpu_np) {
 		dev_err(&pdev->dev, "atmel,ssc-controller node missing\n");
 		ret = -EINVAL;
-		goto out;
+		goto out_put_codec_np;
 	}
 	dai->cpus->of_node = cpu_np;
 	dai->platforms->of_node = cpu_np;
@@ -153,12 +153,9 @@ static int sam9x5_wm8731_driver_probe(struct platform_device *pdev)
 	if (ret != 0) {
 		dev_err(&pdev->dev, "Failed to set SSC %d for audio: %d\n",
 			ret, priv->ssc_id);
-		goto out;
+		goto out_put_cpu_np;
 	}
 
-	of_node_put(codec_np);
-	of_node_put(cpu_np);
-
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
 		dev_err(&pdev->dev, "Platform device allocation failed\n");
@@ -167,10 +164,14 @@ static int sam9x5_wm8731_driver_probe(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "%s ok\n", __func__);
 
-	return ret;
+	goto out_put_cpu_np;
 
 out_put_audio:
 	atmel_ssc_put_audio(priv->ssc_id);
+out_put_cpu_np:
+	of_node_put(cpu_np);
+out_put_codec_np:
+	of_node_put(codec_np);
 out:
 	return ret;
 }
-- 
2.17.1

