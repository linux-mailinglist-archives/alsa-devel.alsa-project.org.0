Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E582716F6
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Sep 2020 20:13:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D16F21685;
	Sun, 20 Sep 2020 20:13:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D16F21685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600625638;
	bh=8JfgK7frOTLM+aQqhK2686SOQUrc3GCBk6UFp2tRA04=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xzz9F/Nwe/k1WGLjTjMRTUO2GZzV1ufJzzWy4V/WzqJvUb5H3/68Q7dg6ktDVSv0j
	 scT+wxqiLFJQGne6ZU05VIFI50jspbBTRy7B4eDT3cqUVazYgHVqm8EtUZTXlb25Lb
	 p7lqnr6DMLeRh28bPaSXjhidEkEXu4pdR15rPh2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D276F80316;
	Sun, 20 Sep 2020 20:08:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C46CF802E7; Sun, 20 Sep 2020 20:08:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08FE7F80234
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 20:08:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08FE7F80234
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mXfdBiak"
Received: by mail-wm1-x341.google.com with SMTP id q9so9973773wmj.2
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 11:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EIccKi4IoikLFt1GHmOwRkpQe5sR20G6j+WnVWrmvso=;
 b=mXfdBiakPfVTHfsCFaHAMPoqT6nvSS+bOVu2VRhbQjcn43WE9jQBGfLs7j4ue2O+ON
 VeOCEnerUl3WKulsPWkvXDrh85uAshFwYIBFsuJwufUciR5GxY9axZ2Epzxx+/FZeElh
 O/llYyDcUqA37WP3Ihml1IJebDSJap2tk3cLVO34w7Hx37rM+uG+KztoDz1ELtYkLUui
 JlF/GPKy5StNSS99nU5/2fYSH84za6Z6aAcILGnByHOLZt2Wt1hbE+ZeqNMyDxu+OLIk
 rAEyNDfBoG1q8aEbP2njunC7XS7XsZxCzgEHYMWSTQP54YeUfJykk12SemCwksbKUX9h
 drXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EIccKi4IoikLFt1GHmOwRkpQe5sR20G6j+WnVWrmvso=;
 b=m/Ddg+3CA4MtCVC0PRAMI//NlhWNYxVh9h0eFQjp0ShyLEaDluaiFUxUBzGALA2sMR
 /sC2ERuT9zUsJRpyafy5PviFuyFg97fycySQQgBF6+dz6yKZGPoBYiKysAp0MJ47khgl
 PigBdDKfBzleGsWmF4MKD+Hx0pGgF19mQRzyKkDXz/HZPXfBgW1dPwCN0eTXg6OAJxr3
 IqpJ3IjSbZE0bEZfMMWuGx5OeLyGbjVnQQJh6ybyUqyCy0BfxyML4WbbdxwHCFQFGIcK
 pG1jvFXWwLBsodBMXVwaQF09JKrKX53xmSU69bb++UGVTPH+F+2olAQCMf42XXGneVPh
 d/jg==
X-Gm-Message-State: AOAM530BqnLznzD7kenCx1RO/dVYgy4ABmhQ1xrpO2h8sbv349RZitZW
 7l8Q3F3b5dmNUkxBEq+F4E4=
X-Google-Smtp-Source: ABdhPJxvXVdePhLRtAC/BKdGM2ETh2u/JMTIh5NkOTRDcRv3Pfjs3Z1Rz4KEjUot+ag+Zg8wZoPFFQ==
X-Received: by 2002:a05:600c:230f:: with SMTP id
 15mr26264114wmo.186.1600625294080; 
 Sun, 20 Sep 2020 11:08:14 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id 18sm15142782wmj.28.2020.09.20.11.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 11:08:13 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v3 05/19] ASoc: sun4i-i2s: Add 20 and 24 bit support
Date: Sun, 20 Sep 2020 20:07:44 +0200
Message-Id: <20200920180758.592217-6-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200920180758.592217-1-peron.clem@gmail.com>
References: <20200920180758.592217-1-peron.clem@gmail.com>
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
Acked-by: Maxime Ripard <mripard@kernel.org>
---
 sound/soc/sunxi/sun4i-i2s.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 57a68222f99a..ce4913f0ffe4 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -570,6 +570,9 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 	case 16:
 		width = DMA_SLAVE_BUSWIDTH_2_BYTES;
 		break;
+	case 32:
+		width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+		break;
 	default:
 		dev_err(dai->dev, "Unsupported physical sample width: %d\n",
 			params_physical_width(params));
@@ -1045,6 +1048,10 @@ static int sun4i_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+#define SUN4I_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
+			 SNDRV_PCM_FMTBIT_S20_LE | \
+			 SNDRV_PCM_FMTBIT_S24_LE)
+
 static struct snd_soc_dai_driver sun4i_i2s_dai = {
 	.probe = sun4i_i2s_dai_probe,
 	.capture = {
@@ -1052,14 +1059,14 @@ static struct snd_soc_dai_driver sun4i_i2s_dai = {
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

