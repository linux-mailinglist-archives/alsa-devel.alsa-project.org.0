Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE31B6576AE
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Dec 2022 13:53:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C27222DF8;
	Wed, 28 Dec 2022 13:52:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C27222DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672232024;
	bh=0Y/9YIswIEXr5kCVE+bXfBT3CK7ODZvYABZXTxK8hL4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bdTSS2qJ2r2hj1rWEELtYuTENwQeHpA27sPsmwruMBICep3nRVDHq/9VrjvBOXVgX
	 v5d2psmdlTtK+1Q5el0PEme+DNW/NouyRUAiCVm1GkchnTZdZ7GnoZG2Ou7OWFvDyd
	 pP970ddpYijAkaNac4LHJsOdy3dzT8pPa4v824ps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1B96F80539;
	Wed, 28 Dec 2022 13:51:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0215FF80310; Wed, 28 Dec 2022 13:22:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E653F80310
 for <alsa-devel@alsa-project.org>; Wed, 28 Dec 2022 13:22:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E653F80310
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=huaqin-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@huaqin-corp-partner-google-com.20210112.gappssmtp.com
 header.a=rsa-sha256 header.s=20210112 header.b=8ATAjlMS
Received: by mail-pj1-x102f.google.com with SMTP id
 h7-20020a17090aa88700b00225f3e4c992so7292635pjq.1
 for <alsa-devel@alsa-project.org>; Wed, 28 Dec 2022 04:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9X91Fnadk2T2IXBmaaCHcqGD55dHXQIcw8hnKRyjWdc=;
 b=8ATAjlMSvH64+WHo5TfeKLy/9iwXrYE8/B0YTdIfYIbO5BQINeQDS9114Ih2LQcH4a
 oXtlbx2wf+omFT99UgiMZHnatKZ4sQfsMymZ+OVOz3wATCMcKeaLSaHFtraywPp7zjNA
 vqiKIK67C9KVKhqT5L2FmmjPnNeH7jaJJfOozT6FOAHxNSRYSYMTasIieCUx+gJQymeF
 GamizVymKLPex/aowlguGu4BSxVkhe75Hrh01m0AAGOVQDplWliLtNdkdzazWdF+xuHA
 bXiAI06dLc+TL1zkSHjg/PT3eipglJY2ffb9YeGdzHK1o0H+GvTYkbQaKJUHgeqneBWH
 PZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9X91Fnadk2T2IXBmaaCHcqGD55dHXQIcw8hnKRyjWdc=;
 b=Xh+1Bv5LV6QQNKeQOjz5Qin83VUsKtxgjIJkBIP6Z4yrYqhEAp9bVS0eLGT4B5HYJG
 c5A7bZ5PNIxqw3NshOvV6DvzKYiKXTgLbwyw9iyAwmm0KRcwU7zZchOoVCokTVsAZdw9
 maCwSuJPNVSP8pkb2say80p2QpInPPQxP4oL9i2WiJAUGvmmpBHZjuRcoQVen8P6JASs
 2DByC+VstJv3ahC7jGGu3eufk/y2wv+nDwvCNNQCfWJ+L5gFdU2iW6oU4imEOcKIpJk9
 bzDt+SdpREOaMYUvXm+iRTSgTJY4vxVoZqLA2sHX6N39L/207icH4rMdeTES7orv9K6E
 WtUg==
X-Gm-Message-State: AFqh2kp8ahzlkNQ3KoKQH86uOBxcdZp/N26b9h8uSzlf16z2pVxK70bu
 b7m3F20vb0oHRHz+YCZ3GrNJLQ==
X-Google-Smtp-Source: AMrXdXt0gVyGT9VaSwJVm9bxkdZzyN9aQyXLpHP3077wingZFW4PqgWXO63Kj2x5OqBxtEC9qIw/cQ==
X-Received: by 2002:a05:6a21:3949:b0:a7:9022:5d5e with SMTP id
 ac9-20020a056a21394900b000a790225d5emr31532687pzc.2.1672230173418; 
 Wed, 28 Dec 2022 04:22:53 -0800 (PST)
Received: from localhost.localdomain (202.60.225.077.static.cyberec.com.
 [202.60.225.77]) by smtp.gmail.com with ESMTPSA id
 h1-20020a056a00000100b0058124f92399sm5236074pfk.219.2022.12.28.04.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 04:22:53 -0800 (PST)
From: tongjian <tongjian@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, perex@perex.cz,
 tiwai@suse.com, angelogioacchino.delregno@collabora.com,
 nfraprado@collabora.com, jiaxin.yu@mediatek.com, chunxu.li@mediatek.com,
 ajye_huang@compal.corp-partner.google.com,
 tongjian@huaqin.corp-partner.google.com
Subject: [PATCH 1/2] ASoC: mediatek: mt8186: support rt5682s_max98360
Date: Wed, 28 Dec 2022 20:22:29 +0800
Message-Id: <20221228122230.3818533-2-tongjian@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221228122230.3818533-1-tongjian@huaqin.corp-partner.google.com>
References: <20221228122230.3818533-1-tongjian@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 28 Dec 2022 13:51:26 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add support for using the rt5682s codec together with max98360a on
MT8186-MT6366-RT1019-RT5682S machines.

Signed-off-by: tongjian <tongjian@huaqin.corp-partner.google.com>
---
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index 8f77a0bc1dc8..af44e331dae8 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
@@ -1083,6 +1083,21 @@ static struct snd_soc_card mt8186_mt6366_rt1019_rt5682s_soc_card = {
 	.num_configs = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_codec_conf),
 };
 
+static struct snd_soc_card mt8186_mt6366_rt5682s_max98360_soc_card = {
+	.name = "mt8186_rt5682s_max98360",
+	.owner = THIS_MODULE,
+	.dai_link = mt8186_mt6366_rt1019_rt5682s_dai_links,
+	.num_links = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_dai_links),
+	.controls = mt8186_mt6366_rt1019_rt5682s_controls,
+	.num_controls = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_controls),
+	.dapm_widgets = mt8186_mt6366_rt1019_rt5682s_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_widgets),
+	.dapm_routes = mt8186_mt6366_rt1019_rt5682s_routes,
+	.num_dapm_routes = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_routes),
+	.codec_conf = mt8186_mt6366_rt1019_rt5682s_codec_conf,
+	.num_configs = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_codec_conf),
+};
+
 static int mt8186_mt6366_rt1019_rt5682s_dev_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card;
@@ -1232,9 +1247,14 @@ static int mt8186_mt6366_rt1019_rt5682s_dev_probe(struct platform_device *pdev)
 
 #if IS_ENABLED(CONFIG_OF)
 static const struct of_device_id mt8186_mt6366_rt1019_rt5682s_dt_match[] = {
-	{	.compatible = "mediatek,mt8186-mt6366-rt1019-rt5682s-sound",
+	{
+		.compatible = "mediatek,mt8186-mt6366-rt1019-rt5682s-sound",
 		.data = &mt8186_mt6366_rt1019_rt5682s_soc_card,
 	},
+	{
+		.compatible = "mediatek,mt8186-mt6366-rt5682s-max98360-sound",
+		.data = &mt8186_mt6366_rt5682s_max98360_soc_card,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, mt8186_mt6366_rt1019_rt5682s_dt_match);
-- 
2.25.1

