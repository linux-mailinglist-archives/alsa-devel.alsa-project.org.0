Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A77EB214594
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Jul 2020 13:43:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52337167E;
	Sat,  4 Jul 2020 13:43:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52337167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593863039;
	bh=MjluNlTbvAnmTe3mrja8LDpaPk1OYb73njlHRe4OQUI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HrzigRpDidpDVbj22ZSMU9jqoutdzVhzOfapJikGQSX0De+g9RXnN+oiDYS5IZwEK
	 D8/6LEtce+laj+VJhkVqyNJUFDEaQ8e5G1pVNdeynCh8kFOc88un+/u6hJOMBeRGhD
	 9ZPhz1gAzuvKkRvvJSdFnmeDPzPTP1vqr95tEZ9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D00BEF802F9;
	Sat,  4 Jul 2020 13:39:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7840F802E0; Sat,  4 Jul 2020 13:39:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADFDEF8011B
 for <alsa-devel@alsa-project.org>; Sat,  4 Jul 2020 13:39:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADFDEF8011B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HAcb77ZJ"
Received: by mail-wr1-x442.google.com with SMTP id a6so35436507wrm.4
 for <alsa-devel@alsa-project.org>; Sat, 04 Jul 2020 04:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ESvvN/D0Hfp01gqc7DB6yCCc1XPduthb29WoQdXR4XI=;
 b=HAcb77ZJONKREpW52PASaGho76Okwx4LA+qV206R+/N0/goTrfOGVoXxy5HSUwzFul
 L5N3WxT/n1rrBMykKCO+fYppCvkZYb7ojRh7oPiH9Oeokiikv9RvF8VP52hvHP3AboTj
 mI/wpw907Awdp6ZZQjIH2MtsrB46+H4w0F6OgjIlGMDH/4JbiTgVmgNkBXqT9CTnXYD5
 w5Q2lgxa5v9Va179bQ1LiOq5cqALEfB3gwn0Np7N4mSpUH8FHusQFAqmFVTDQz33a7jO
 v5awH1PzzKiSuHHJr0mbKd3TNlyTAyPs+5n1jBrLUdL8U/7iYgdkTqXOOEED02n8qN3J
 3ITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ESvvN/D0Hfp01gqc7DB6yCCc1XPduthb29WoQdXR4XI=;
 b=bRLK7dzeWv/Z+lsVRusa1VfPFfyBjvjmVkty5TXVssEKnBWm1oHuuRdKtM//n7Zqsf
 fkDOB4Nno23VbWjHPpaOKLl3gXUcxChF9DCLmo6D3TATqGlWMoxTHokJTkZdHMEnWpBb
 T38pfQ072Q6oKYVg315d6WD940D5x9UHYRsTXjSbPb/ZfpN84GP06KKYijpakOkFpn4A
 MX0CGbqmd7kahNypLkPNdPGDjOBbqk2kFN9llbi1FcY0c1XqlOnhfyUPl4NKS5CVuwvS
 aZ+W8jebsRMATkR/BbMyMdVtIeDB3dMm1jk5fAeFYYFf8MNIDuK4rzQXYf7T/KsUeYot
 FWoA==
X-Gm-Message-State: AOAM532LA1jOWNEHohO3l9dXRDGEpWfCoavZbBJoa+8b1U++93u4AVSe
 TgnMudQMk3BNP5r7CHDgkhQ=
X-Google-Smtp-Source: ABdhPJxIUWrIjz3LSlsiaQlsL6gMInsAYaGWfox28gRQLMNg4u+OoJTeTKOrr6S/rQGsaI5bMhBS1w==
X-Received: by 2002:a5d:69c8:: with SMTP id s8mr39790634wrw.405.1593862751825; 
 Sat, 04 Jul 2020 04:39:11 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id j24sm18657373wrd.43.2020.07.04.04.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 04:39:11 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 05/16] ASoc: sun4i-i2s: Add 20 and 24 bit support
Date: Sat,  4 Jul 2020 13:38:51 +0200
Message-Id: <20200704113902.336911-6-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200704113902.336911-1-peron.clem@gmail.com>
References: <20200704113902.336911-1-peron.clem@gmail.com>
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
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index f78167e152ce..bc7f9343bc7a 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -577,6 +577,9 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 	case 16:
 		width = DMA_SLAVE_BUSWIDTH_2_BYTES;
 		break;
+	case 32:
+		width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+		break;
 	default:
 		dev_err(dai->dev, "Unsupported physical sample width: %d\n",
 			params_physical_width(params));
@@ -1063,6 +1066,10 @@ static int sun4i_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+#define SUN4I_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
+			 SNDRV_PCM_FMTBIT_S20_LE | \
+			 SNDRV_PCM_FMTBIT_S24_LE)
+
 static struct snd_soc_dai_driver sun4i_i2s_dai = {
 	.probe = sun4i_i2s_dai_probe,
 	.capture = {
@@ -1070,14 +1077,14 @@ static struct snd_soc_dai_driver sun4i_i2s_dai = {
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

