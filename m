Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D3E25CAC9
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 22:35:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 365A31948;
	Thu,  3 Sep 2020 22:34:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 365A31948
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599165315;
	bh=ilgwNc0/JS2QNLcLj45n54RRxVclMrSHOIFZTWrSzUE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YHIl3yuxkCk5NqrHYTJfw19AKMC6orJgS1lrjDFB1f6Mm2Ur/Ku2nZ7+lTdz21o7v
	 I1PXBC+HPtn4bqE0htJE1VwJqm/P1a4cHPBEZnqUHlS8hjfLQnmOG4NkPYZw5p45JC
	 HUBPONUXAxX8664mgyIr9zEj1xN2blRZXuBmDFAk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4C3FF80315;
	Thu,  3 Sep 2020 22:31:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D045F802C4; Thu,  3 Sep 2020 22:31:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7BF8F802BC
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 22:30:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7BF8F802BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XJmA4ic0"
Received: by mail-wr1-x443.google.com with SMTP id z4so4589582wrr.4
 for <alsa-devel@alsa-project.org>; Thu, 03 Sep 2020 13:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kIXpju43i4Jg9vuM4D1hPqA0p/QuMqwDr+5ieWDqPBc=;
 b=XJmA4ic05bqYJiH8XSglfibsrHedMOqI1oL0PnBy6JWSdbwlKY6+fGyewEpFm4tXv7
 1IJbYdC7lvHOVtieItrlbvHdlK1Vj+eRf5ckuoBUz6kzj/Rbb7XW2n9aS1zSDxYeEIaQ
 ZnpjE1tIxbFH857dJ5yAgm3pFER6eFlj9Nm9HJEJWXZqwmLgVpd2G55GjOkJVjNA3zK1
 6ygeKuapH8UtZB3b56tSP3dqvVQRYMDvBCgatEgTyQ92hOd1nozv4jP2JkTc54InM0ZZ
 79ymq4RvLti38isRhWcnN+eB+0CKNV3qm0s+3N4mAl5xRNVdjacQUU2KWc3NhPvZJgeO
 aLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kIXpju43i4Jg9vuM4D1hPqA0p/QuMqwDr+5ieWDqPBc=;
 b=nnBrGihP+/kC6c5RUhtfLacqFb6BT1E6joqTc415zBBlUIQAX/SXXUriJdVztDf04X
 TEP05ssgBgslo+EBcv0yKlGAQxppcl2hf3nTqFrlDpPDMZJDIpfOnbbfe+EHQaKz+LNT
 bqyYMulVFKdGq/AD5o9QyDTgQoFmTXT0c7zuEe2P2og6b5d3/LEvQBEKI0XzHyhy+WpI
 Ny6sl+K5oqEKTN4nU7qijeAEiClKfhBwKgBkMvvxDLuTed13Q3UcRH6WPu7It5TG/wFR
 hcJoVWdupF2Dkgv4YKiVgk/vOzb/eKkPHXeSgCMw+1uYpixv3q5gMNL6b+AdpQrrF6wW
 rExg==
X-Gm-Message-State: AOAM532QoCUTSnHLrSeQrPOgBOIJF0wwXAq9UQ0KT4dejy8XJFG/sxJU
 uIsWHNR4OmIGsUFmkomR+wA=
X-Google-Smtp-Source: ABdhPJw0tBMq5EwMZ7iM7eO1IpZYKZhZLLG9OvLxuj7MQlpv73SxOh/smd45fJuTmVp82znJ2UIz/w==
X-Received: by 2002:adf:f846:: with SMTP id d6mr4574464wrq.56.1599165050638;
 Thu, 03 Sep 2020 13:30:50 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id q186sm6818274wma.45.2020.09.03.13.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 13:30:50 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2 06/20] ASoc: sun4i-i2s: Add 20 and 24 bit support
Date: Thu,  3 Sep 2020 22:30:20 +0200
Message-Id: <20200903203034.1057334-7-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200903203034.1057334-1-peron.clem@gmail.com>
References: <20200903203034.1057334-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Marcus Cooper <codekipper@gmail.com>,
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
index 13e64180e917..df73cd5751c0 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -585,6 +585,9 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 	case 16:
 		width = DMA_SLAVE_BUSWIDTH_2_BYTES;
 		break;
+	case 32:
+		width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+		break;
 	default:
 		dev_err(dai->dev, "Unsupported physical sample width: %d\n",
 			params_physical_width(params));
@@ -1054,6 +1057,10 @@ static int sun4i_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+#define SUN4I_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
+			 SNDRV_PCM_FMTBIT_S20_LE | \
+			 SNDRV_PCM_FMTBIT_S24_LE)
+
 static struct snd_soc_dai_driver sun4i_i2s_dai = {
 	.probe = sun4i_i2s_dai_probe,
 	.capture = {
@@ -1061,14 +1068,14 @@ static struct snd_soc_dai_driver sun4i_i2s_dai = {
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

