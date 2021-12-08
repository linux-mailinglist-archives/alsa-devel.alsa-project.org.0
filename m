Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8009446D36D
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 13:38:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC45A2731;
	Wed,  8 Dec 2021 13:37:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC45A2731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638967102;
	bh=fmhWuazkRaBc7wehcKID8oVlfgCchRM1dLTvnLP9w10=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yv49b2Vfda56Y/rLjH6avLRc+IcUjEZLNdSsLNcGH+cnMslT8mewL5TmEcekVGkIL
	 hlVpipocJi8ZMwKkdhYwdtJLatHVePIT0XowJUArEQu+MPwasSFY9WpG3RfhUKSlQR
	 d3NjZWvPEFLZT+B974OZm6tQfJMmEKqIKhHE+JtA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 832DDF804ED;
	Wed,  8 Dec 2021 13:37:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40CC3F804F1; Wed,  8 Dec 2021 13:37:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BE82F804E5
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 13:37:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BE82F804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="R3Q47PcD"
Received: by mail-wm1-x32e.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso4051598wms.3
 for <alsa-devel@alsa-project.org>; Wed, 08 Dec 2021 04:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m5qhQ9MNHXL9LJ6rZcLeSxLX1M+ykgvvbEBVp94brXA=;
 b=R3Q47PcDIGWU6wfCnrz3WWPqZL7veIVDENu6xNqx/KczcRrkyPDsuGK1J66wxg+BTq
 2cjoC/i2QtHzs7eccipbQHF7PvEjTdkZmLga1uS/SoaKE6qcwsiTEol5c8Tq00Pc/Ixq
 2mF9kMxY+fLveuEVf9i8nI+VeYiLmn9uOWeeT81OWFv1igAuW2Vfr2vZa6/a+CIlC7Mu
 9kLXwH3z6ZOqw/9uT4W2fAKoP5dw+O2dv5qCF8BI9ayZi4Hacl/GBTyUK/hb+QsV3K+W
 01c3IL8MPxfnU1DGZ/prChKmJZIwyhfgcZljOqwr0YlKjzMKY8ON6VqOkWgFUFVk5qw6
 jY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m5qhQ9MNHXL9LJ6rZcLeSxLX1M+ykgvvbEBVp94brXA=;
 b=H5WuVWnOh1OubKRi1B2uI038UXipJNSof93AXenlR/MgZcZjaDCwYYBn2evyCxtMrs
 ZB5sMu+5zLtI3o2WDoYkrtQB+S0QRnRA0cej6WhqKEyakYK3LnD+du7wdfauByAufNsA
 E6fiPoVkGLZkLnDMrvGvKoBQxeL+VNzIvogGsAPsUxDYpHEp+yd7Cnl+0+CZUG07xp5w
 5+iGY2humL6mgaY0Smv78PmjN/HZqSoZ296I9aqDAGkbROZA4rzp2R3c83krWMzgaUxS
 2srepB1RUR5H8FdE4K1qU9/TKFsrNOYRgauWApmzUbI6Pj4IFntaECu9inBi3wvkuHfP
 3LbA==
X-Gm-Message-State: AOAM532z5rxLJBcGmReHtT/7YjO+34kA+ILGGw7p/et2FkWVQi9ALBvC
 Kr3ahwivLcMh4vSft9U1DFXSeeuiErDDQw==
X-Google-Smtp-Source: ABdhPJwoJQehgSgC3WTBJ8A9+Pvydr7lyxo0AY5wcfJQBORefP6fUW4Oxf6io8fDpvHnRuLll1phYw==
X-Received: by 2002:a1c:287:: with SMTP id 129mr15867599wmc.49.1638967039134; 
 Wed, 08 Dec 2021 04:37:19 -0800 (PST)
Received: from localhost.localdomain ([39.48.199.136])
 by smtp.gmail.com with ESMTPSA id z5sm7167562wmp.26.2021.12.08.04.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 04:37:18 -0800 (PST)
From: Ameer Hamza <amhamza.mgc@gmail.com>
To: kuninori.morimoto.gx@renesas.com
Subject: [PATCH] ASoC: test-component: replace of_match_device() to
 of_device_get_match_data()
Date: Wed,  8 Dec 2021 17:36:59 +0500
Message-Id: <20211208123659.15789-1-amhamza.mgc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211208120526.GA12550@hamza-OptiPlex-7040>
References: <20211208120526.GA12550@hamza-OptiPlex-7040>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Ameer Hamza <amhamza.mgc@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 broonie@kernel.org
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

Getting device data from of_device_get_match_data() for a cleaner
implementation.

Signed-off-by: Ameer Hamza <amhamza.mgc@gmail.com>
---
 sound/soc/generic/test-component.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index 8fc97d3ff011..5da4725d9e16 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -531,17 +531,13 @@ static int test_driver_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
 	struct device_node *ep;
-	const struct of_device_id *of_id = of_match_device(test_of_match, &pdev->dev);
-	const struct test_adata *adata;
+	const struct test_adata *adata = of_device_get_match_data(&pdev->dev);
 	struct snd_soc_component_driver *cdriv;
 	struct snd_soc_dai_driver *ddriv;
 	struct test_dai_name *dname;
 	struct test_priv *priv;
 	int num, ret, i;
 
-	if (!of_id)
-		return -EINVAL;
-	adata = of_id->data;
 	num = of_graph_get_endpoint_count(node);
 	if (!num) {
 		dev_err(dev, "no port exits\n");
@@ -552,7 +548,7 @@ static int test_driver_probe(struct platform_device *pdev)
 	cdriv	= devm_kzalloc(dev, sizeof(*cdriv),		GFP_KERNEL);
 	ddriv	= devm_kzalloc(dev, sizeof(*ddriv) * num,	GFP_KERNEL);
 	dname	= devm_kzalloc(dev, sizeof(*dname) * num,	GFP_KERNEL);
-	if (!priv || !cdriv || !ddriv || !dname)
+	if (!priv || !cdriv || !ddriv || !dname || !adata)
 		return -EINVAL;
 
 	priv->dev		= dev;
-- 
2.25.1

