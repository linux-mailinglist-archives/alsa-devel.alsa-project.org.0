Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 853D0524B31
	for <lists+alsa-devel@lfdr.de>; Thu, 12 May 2022 13:14:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 198341813;
	Thu, 12 May 2022 13:13:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 198341813
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652354089;
	bh=q04d+jmNMnk7ULsUl1WXDV2r6WtI22zlROXQ2Ij+rVE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Yf1cXMbONbKhQvLmOGovtwg4oTQvJwEPzn2/gP+MtGC14C9AxIznutXU0bQMOZBYX
	 Q98Xte7RkYJsGzKsXSDmcSQc4PKnT9XLhONXolRqXMRVqHXEQQNalp1Zw1XvsEvBz4
	 i83HgZOJmLTeAcRgtY9kkGDpsEsvTySnwhrD6utU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F8B4F80154;
	Thu, 12 May 2022 13:13:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 484C9F80245; Thu, 12 May 2022 13:13:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CB7BF8010B
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 13:13:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CB7BF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TWkDoQms"
Received: by mail-pf1-x433.google.com with SMTP id x52so4462244pfu.11
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 04:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3SloLfFU8a1Q2HMNHKnLwbt6pwT6BUy9sQ/8OgycCqI=;
 b=TWkDoQms83WKpuzTNBdzKvhoODw/n2DKAB8PkH+WiozWmeNSuyjVm2KbSvtlMzMYCU
 5AfE9yC2bc67wnsu2Z8Vv8u3Af/Zzx8mURws2tXG8nDAjzY6OYZb425+fGXR8DRY6LPV
 arSq90SoYNx+KnlokAVjO1vz4A8Wz87mIQWyEvLOI0UCBfKL3NQt1u4ln6YGym9EIWej
 ZiFRbwxPQChV0Bb8ZVLe4FQO06jNZD9Af123ar9N0qMbNk8LMocN60z3oQCYCpzAJx63
 imffSCEagiv0jJexube7LgHVJAdDYLcQEPa9aMbEngNzcN1tzHa0Q3mPlseKS7bfJkgZ
 X4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3SloLfFU8a1Q2HMNHKnLwbt6pwT6BUy9sQ/8OgycCqI=;
 b=bJgD5fdzek34uMKX0c1f5c97g+3vfKTBjpOhuiJgHWuYiSVNeAjsnVFLhqvZg9r7Sq
 inIrRR3b4hGgNqmFoQE3EYQU91zOyJpSE3iWoTgcpHzVAY3AOdTaiAecqiqyCeQTf8Ji
 lvtGuPj23qyzeGLV3gi/iSS5c3mbgHLoJ1g+SpzdaT6sNuvTaU/Uskh5uinXzNYvNIc1
 nDn0F/QkB4Nyts7/79xwCa9aisIzxpgU1FDFpUstM0yX2qiXEGzX2+Ws3RLlJ9xehx/b
 wRtnZuAkt0se6P0oAUW2036yQf3YTuPJ6Hzkq/Rq7YcRyiXy7eDsvhfl8nRKiOVG40qc
 22eQ==
X-Gm-Message-State: AOAM530D8vP8deXaf+C1SvHNGGuwrqAaIZ+ZY6CC2PFcBYPSglxuaMvR
 bc1EX6eDihOA6vS2H6ik4Jk=
X-Google-Smtp-Source: ABdhPJy/350N6jJC6Z1dMu9/mg4+Nu0BAcptLFnUjKHPNCWQopVS3tO4EUk5mkrlt09q3p5haIZgow==
X-Received: by 2002:a05:6a00:b87:b0:510:5e02:79f1 with SMTP id
 g7-20020a056a000b8700b005105e0279f1mr29558222pfj.80.1652354019644; 
 Thu, 12 May 2022 04:13:39 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 c3-20020a170902724300b0015e8d4eb20esm3605859pll.88.2022.05.12.04.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 04:13:39 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: ti: j721e-evm: Fix refcount leak in j721e_soc_probe_*
Date: Thu, 12 May 2022 15:13:30 +0400
Message-Id: <20220512111331.44774-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

of_parse_phandle() returns a node pointer with refcount
incremented, we should use of_node_put() on it when not needed anymore.
Add missing of_node_put() to avoid refcount leak.

Fixes: 6748d0559059 ("ASoC: ti: Add custom machine driver for j721e EVM (CPB and IVI)")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/ti/j721e-evm.c | 44 ++++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/sound/soc/ti/j721e-evm.c b/sound/soc/ti/j721e-evm.c
index 4077e15ec48b..6a969874c927 100644
--- a/sound/soc/ti/j721e-evm.c
+++ b/sound/soc/ti/j721e-evm.c
@@ -630,17 +630,18 @@ static int j721e_soc_probe_cpb(struct j721e_priv *priv, int *link_idx,
 	codec_node = of_parse_phandle(node, "ti,cpb-codec", 0);
 	if (!codec_node) {
 		dev_err(priv->dev, "CPB codec node is not provided\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_dai_node;
 	}
 
 	domain = &priv->audio_domains[J721E_AUDIO_DOMAIN_CPB];
 	ret = j721e_get_clocks(priv->dev, &domain->codec, "cpb-codec-scki");
 	if (ret)
-		return ret;
+		goto put_codec_node;
 
 	ret = j721e_get_clocks(priv->dev, &domain->mcasp, "cpb-mcasp-auxclk");
 	if (ret)
-		return ret;
+		goto put_codec_node;
 
 	/*
 	 * Common Processor Board, two links
@@ -650,8 +651,10 @@ static int j721e_soc_probe_cpb(struct j721e_priv *priv, int *link_idx,
 	comp_count = 6;
 	compnent = devm_kzalloc(priv->dev, comp_count * sizeof(*compnent),
 				GFP_KERNEL);
-	if (!compnent)
-		return -ENOMEM;
+	if (!compnent) {
+		ret = -ENOMEM;
+		goto put_codec_node;
+	}
 
 	comp_idx = 0;
 	priv->dai_links[*link_idx].cpus = &compnent[comp_idx++];
@@ -702,6 +705,12 @@ static int j721e_soc_probe_cpb(struct j721e_priv *priv, int *link_idx,
 	(*conf_idx)++;
 
 	return 0;
+
+put_codec_node:
+	of_node_put(codec_node);
+put_dai_node:
+	of_node_put(dai_node);
+	return ret;
 }
 
 static int j721e_soc_probe_ivi(struct j721e_priv *priv, int *link_idx,
@@ -726,23 +735,25 @@ static int j721e_soc_probe_ivi(struct j721e_priv *priv, int *link_idx,
 	codeca_node = of_parse_phandle(node, "ti,ivi-codec-a", 0);
 	if (!codeca_node) {
 		dev_err(priv->dev, "IVI codec-a node is not provided\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_dai_node;
 	}
 
 	codecb_node = of_parse_phandle(node, "ti,ivi-codec-b", 0);
 	if (!codecb_node) {
 		dev_warn(priv->dev, "IVI codec-b node is not provided\n");
-		return 0;
+		ret = 0;
+		goto put_codeca_node;
 	}
 
 	domain = &priv->audio_domains[J721E_AUDIO_DOMAIN_IVI];
 	ret = j721e_get_clocks(priv->dev, &domain->codec, "ivi-codec-scki");
 	if (ret)
-		return ret;
+		goto put_codecb_node;
 
 	ret = j721e_get_clocks(priv->dev, &domain->mcasp, "ivi-mcasp-auxclk");
 	if (ret)
-		return ret;
+		goto put_codecb_node;
 
 	/*
 	 * IVI extension, two links
@@ -754,8 +765,10 @@ static int j721e_soc_probe_ivi(struct j721e_priv *priv, int *link_idx,
 	comp_count = 8;
 	compnent = devm_kzalloc(priv->dev, comp_count * sizeof(*compnent),
 				GFP_KERNEL);
-	if (!compnent)
-		return -ENOMEM;
+	if (!compnent) {
+		ret = -ENOMEM;
+		goto put_codecb_node;
+	}
 
 	comp_idx = 0;
 	priv->dai_links[*link_idx].cpus = &compnent[comp_idx++];
@@ -816,6 +829,15 @@ static int j721e_soc_probe_ivi(struct j721e_priv *priv, int *link_idx,
 	(*conf_idx)++;
 
 	return 0;
+
+
+put_codecb_node:
+	of_node_put(codecb_node);
+put_codeca_node:
+	of_node_put(codeca_node);
+put_dai_node:
+	of_node_put(dai_node);
+	return ret;
 }
 
 static int j721e_soc_probe(struct platform_device *pdev)
-- 
2.25.1

