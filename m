Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8AD2A086F
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 15:51:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E45D1607;
	Fri, 30 Oct 2020 15:50:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E45D1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604069464;
	bh=hJ/fmI3LFZTy1500BXQDzXT5dQDWjzsCJKx5P9vikbs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L3hLVd60BIs8bAGs6HMfjzju8ePcG1vP4dEDaRmv3hoUboccXqFOns/HX3lwdgl8T
	 ofodbCcbDZZRrHjnhXqs5wzRDFOKgOeQEIhWCjE/4VDs1tpgEAaQxw4yXpw4sMgj5h
	 /Zf//Q7K6XiZ3RFvkfYJuySXTyYW7S25bLc0GKkM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62AD6F804F2;
	Fri, 30 Oct 2020 15:47:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0772FF804F3; Fri, 30 Oct 2020 15:47:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A029F804D2
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 15:47:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A029F804D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rEPruIXP"
Received: by mail-ot1-x344.google.com with SMTP id a6so5736447otp.10
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 07:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hVl8qXyL4uyE+bKvgQrUQIjmv0VmS+Xl5odcY5Z+CoI=;
 b=rEPruIXPTVXLfk67LDH5YCfgYBjZF5vIrUX5Tbnn9ls+c7uvOSpuBR/pxgWaM4eLSA
 uucxveJU5jrBrOSrMFqsyyhPBvcOeI4XyN2NmHddCtWdlLfsEopLtb5OqTayDGPTX3u4
 xg7DRqPCiYusOR/daBojNeKKOYebXxUlXDcNxTita3qsSUKzL2+Yki2pnNB0D7/Dz0jQ
 76XaRk7uZ4dpmNl5+4w5lFgXRRrf6+CidQu/MUSiiAZHf8JX5Cl+TjWzDmqDijky8nca
 UUtDE+1n1CYaGMkN6L/rs//PJWFax6Csj+ooUdl1J8mU9Hjds5ip3msnn/3Ki+Jjqiga
 Jp1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hVl8qXyL4uyE+bKvgQrUQIjmv0VmS+Xl5odcY5Z+CoI=;
 b=Ys78iHaijSdMFfm9YGeXdEfzpF6eqxCeXrwkF6kZlU0corLY/Al+D9oNJE94CAvmb3
 RNUkpcvK9+T/uNzTltQmEsqa7XG//1I4vkPjXG2wTJVL5Jk5YDnWBlLd4L5/8Tv2P7JB
 pUbc6LbkQFw/d3RLF7RjgaZmaYQOgbcNJIeVBX4iSAOTzZF1D/BuxgyN+t+AqcKHOExD
 ZD0aTr3ZUTeUWXg+mZQD0t421XeXUZWC7VpkZ6HGfHaBfRblNCkiqNL9vdcEUqSqznrD
 pB+ct77Cr1yOoHj4Y3i3gsETorp/8ePCEpFJhZEI+ZgDk+FUzEjDLaVnh5Ra9+gGcrCC
 kWYw==
X-Gm-Message-State: AOAM530M2ik1krZ6q+SKcL5P7Ffx3vtk9sAG8aj7bwQSWSlh8iziaOv3
 X9L67FJquVC1lFDuRGeodHM=
X-Google-Smtp-Source: ABdhPJyXk1sTONN1FzWWHkaULZ0gNYWaxtyOSeBBxR4VbPDIVIvSmhcinPoe5FOpCzGCuc0JWuo7/A==
X-Received: by 2002:a9d:3d44:: with SMTP id a62mr1834140otc.254.1604069233998; 
 Fri, 30 Oct 2020 07:47:13 -0700 (PDT)
Received: from localhost.localdomain (213-245-241-245.rev.numericable.fr.
 [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id s20sm1462856oof.39.2020.10.30.07.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 07:47:13 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v10 06/15] ASoC: sun4i-i2s: Add 20 and 24 bit support
Date: Fri, 30 Oct 2020 15:46:39 +0100
Message-Id: <20201030144648.397824-7-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030144648.397824-1-peron.clem@gmail.com>
References: <20201030144648.397824-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi@googlegroups.com,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

From: Marcus Cooper <codekipper@gmail.com>

Extend the functionality of the driver to include support of 20 and
24 bits per sample.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 46e4da18c27f..786731191d90 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -600,6 +600,9 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 	case 16:
 		width = DMA_SLAVE_BUSWIDTH_2_BYTES;
 		break;
+	case 32:
+		width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+		break;
 	default:
 		dev_err(dai->dev, "Unsupported physical sample width: %d\n",
 			params_physical_width(params));
@@ -1081,6 +1084,10 @@ static int sun4i_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+#define SUN4I_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
+			 SNDRV_PCM_FMTBIT_S20_LE | \
+			 SNDRV_PCM_FMTBIT_S24_LE)
+
 static struct snd_soc_dai_driver sun4i_i2s_dai = {
 	.probe = sun4i_i2s_dai_probe,
 	.capture = {
@@ -1088,14 +1095,14 @@ static struct snd_soc_dai_driver sun4i_i2s_dai = {
 		.channels_min = 1,
 		.channels_max = 8,
 		.rates = SNDRV_PCM_RATE_8000_192000,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		.formats = SUN4I_FORMATS,
 	},
 	.playback = {
 		.stream_name = "Playback",
 		.channels_min = 1,
 		.channels_max = 8,
 		.rates = SNDRV_PCM_RATE_8000_192000,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		.formats = SUN4I_FORMATS,
 	},
 	.ops = &sun4i_i2s_dai_ops,
 	.symmetric_rates = 1,
-- 
2.25.1

