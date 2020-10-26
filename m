Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA222299611
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 19:55:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05E3016C7;
	Mon, 26 Oct 2020 19:54:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05E3016C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603738525;
	bh=n2LPS9jN9o4NVe5FOnjwnmg/VLKzmy214jpcKwX+MOU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ntIDJe6SDjMjTApP+eYOGIPccD2RBqeTyEdzM56adkGnWHk//MFDh0GO+lsyF9IG1
	 q3iNqVxIIpcGqcgHdRlz8nyb3zuKe8J3ITCSbLYfRujooVslpyy13H7nAUFk2XGcUF
	 N0Adl8ZQYJpZwZ1FvBOeOwhiXnlts25/HJRDBYZ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9ECD4F804C3;
	Mon, 26 Oct 2020 19:53:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13A5BF804C3; Mon, 26 Oct 2020 19:52:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52350F80276
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 19:52:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52350F80276
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XPITp7Mn"
Received: by mail-wr1-x442.google.com with SMTP id b8so13941789wrn.0
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 11:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=djM7OyfVgD6rWaDQbsh+ExufRJOlpqGGlwiwTkQsm9s=;
 b=XPITp7Mn/F7ykF8dNJcHLgRgIoXgXlp/x/xHlDBwv4gzqpHQZIFPutG/5sI+OJlIMK
 fiWQqhIt68mai1qt8GzW8z4MKvGRb/YwhrU7cNjkfYjUC2FC1w5FcqiGb4dZaOxoJc6V
 inp2DbSQjsd7THaT8b9AgiVKvxbb49QaM3wMvOHA2/NMV0UhRh3XBgul+DBqbINOPjHh
 nDaOr+s1DRoERDgX/yXQRF8q6811drP5IHIstzDRneRb9RfqbltzeNt7O0Fr+fxUHwEN
 BHzcVtIxco2ocKBM6Ljsd79OSMLetjsLJdcVxKYy5H+YvH6+ZE0WRxG88hKVPyPW2FfI
 /OjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=djM7OyfVgD6rWaDQbsh+ExufRJOlpqGGlwiwTkQsm9s=;
 b=OSgI3rAlmDtU5UN3OX/Ufv0cuCnWatWb6KnZG3xNrug2Cf0m19WyqHFWjjnM3LgONs
 o19+3343cHI5g9IJcRa00S72CR7a49dYzkwRckosT3R4fsYM+tV18uHKj/chvtYphYmy
 kOXerVi60ZYRIb/Etn/QzT39yhm9ndEPSNJj7pPLxE1JcJi/MCMJSfZaFHkPc9e6q9bQ
 hGwajNDkjVhdhye/67qOpMc1oRn9s3rWgLFD+B+GL8nciWyBljO2mNMLcI8AWBF8Qpci
 9gksmR9Iu1qO8GKoJdtyOyzoZEUfThbvtsUfj1Qje4CWlTGm3Bc7w1Fl3UTUslZRIw2t
 EhTQ==
X-Gm-Message-State: AOAM531euK4e/SLj7UVVpkLo0I/8f+NBEvyjIvtJax5EqKviQLGwcsEM
 wR1MdDLrV5qDl/9gNV4Uxik=
X-Google-Smtp-Source: ABdhPJwo6Q8s0AOAx3BYAVnRxx4Uhh3HP4/cvorgqun4R1kWEC8iSfm/uBzLSX1PyYGm0OnWIf8i1A==
X-Received: by 2002:adf:f20e:: with SMTP id p14mr455926wro.376.1603738368761; 
 Mon, 26 Oct 2020 11:52:48 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id f7sm24885193wrx.64.2020.10.26.11.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 11:52:47 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v8 05/14] ASoc: sun4i-i2s: Add 20 and 24 bit support
Date: Mon, 26 Oct 2020 19:52:30 +0100
Message-Id: <20201026185239.379417-6-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026185239.379417-1-peron.clem@gmail.com>
References: <20201026185239.379417-1-peron.clem@gmail.com>
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
index beaca56a44ae..eee1e64cd8f4 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -599,6 +599,9 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 	case 16:
 		width = DMA_SLAVE_BUSWIDTH_2_BYTES;
 		break;
+	case 32:
+		width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+		break;
 	default:
 		dev_err(dai->dev, "Unsupported physical sample width: %d\n",
 			params_physical_width(params));
@@ -1080,6 +1083,10 @@ static int sun4i_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+#define SUN4I_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
+			 SNDRV_PCM_FMTBIT_S20_LE | \
+			 SNDRV_PCM_FMTBIT_S24_LE)
+
 static struct snd_soc_dai_driver sun4i_i2s_dai = {
 	.probe = sun4i_i2s_dai_probe,
 	.capture = {
@@ -1087,14 +1094,14 @@ static struct snd_soc_dai_driver sun4i_i2s_dai = {
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

