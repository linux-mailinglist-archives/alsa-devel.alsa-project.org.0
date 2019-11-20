Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A52103E59
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 16:28:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6499B16E8;
	Wed, 20 Nov 2019 16:27:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6499B16E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574263703;
	bh=uKjH+wx0+3c+VUxXjYIthXI5OV5PNS6axdjmQ07aKAM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FOTB2xFkKoIA0oOc1IxNOuvrqUBYssik9GVV54Tc+jS9lmtY0zQA9HaV/9X0z4bFd
	 cPhjByAKPlEcoAo86iVogJoPm7B4TXZX+7T1gG0iJVCExffPDNr9KhZab0WVz7tUNn
	 CiNSqHn4WpT/oBiAMtXPo+e6L5XUHRIsDOGatw/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE550F80171;
	Wed, 20 Nov 2019 16:24:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DF32F80161; Wed, 20 Nov 2019 16:24:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15433F80150
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 16:24:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15433F80150
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 918322910F2
Received: by earth.universe (Postfix, from userid 1000)
 id 314213C0C7B; Wed, 20 Nov 2019 16:24:08 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Date: Wed, 20 Nov 2019 16:24:05 +0100
Message-Id: <20191120152406.2744-6-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191120152406.2744-1-sebastian.reichel@collabora.com>
References: <20191120152406.2744-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com
Subject: [alsa-devel] [PATCHv2 5/6] ASoC: da7213: Move set_pll to codec level
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Move set_pll function to component level, so that it can be used at
both component and DAI level.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 sound/soc/codecs/da7213.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index 9686948b16ea..3e6ad996741b 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -1392,10 +1392,10 @@ static int da7213_set_component_sysclk(struct snd_soc_component *component,
 }
 
 /* Supported PLL input frequencies are 32KHz, 5MHz - 54MHz. */
-static int da7213_set_dai_pll(struct snd_soc_dai *codec_dai, int pll_id,
-			      int source, unsigned int fref, unsigned int fout)
+static int da7213_set_component_pll(struct snd_soc_component *component,
+				    int pll_id, int source,
+				    unsigned int fref, unsigned int fout)
 {
-	struct snd_soc_component *component = codec_dai->component;
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
 
 	u8 pll_ctrl, indiv_bits, indiv;
@@ -1507,7 +1507,6 @@ static int da7213_set_dai_pll(struct snd_soc_dai *codec_dai, int pll_id,
 static const struct snd_soc_dai_ops da7213_dai_ops = {
 	.hw_params	= da7213_hw_params,
 	.set_fmt	= da7213_set_dai_fmt,
-	.set_pll	= da7213_set_dai_pll,
 	.digital_mute	= da7213_mute,
 };
 
@@ -1845,6 +1844,7 @@ static const struct snd_soc_component_driver soc_component_dev_da7213 = {
 	.dapm_routes		= da7213_audio_map,
 	.num_dapm_routes	= ARRAY_SIZE(da7213_audio_map),
 	.set_sysclk		= da7213_set_component_sysclk,
+	.set_pll		= da7213_set_component_pll,
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-- 
2.24.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
