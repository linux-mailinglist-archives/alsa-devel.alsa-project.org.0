Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DAB46BD89
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 15:24:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03F40244E;
	Tue,  7 Dec 2021 15:23:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03F40244E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638887088;
	bh=sZ06HnMVwe5Lv2Q24ZdKFSq5a6IweAvob3t9x/Pjq1k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cSwBXjI7FThC7MRKTyomAHBm+zK6kAZitRNEb1bK5hGM3k8c7PjmYPbgE+IDAN7Or
	 trWv/Bs+wQGgY+C7R1C7LxQleu3AbZefydXPhdOnDYD+amuOkQ5+AaYmAaFFc/bcBv
	 wtYVDLAkqOFoZzHdQQ/b8/2hVoxbB/bRJylDhIpY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC2C7F8032B;
	Tue,  7 Dec 2021 15:23:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CA63F8028D; Tue,  7 Dec 2021 15:23:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28ECDF80217
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 15:23:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28ECDF80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="K3IUYo1B"
Received: by mail-wr1-x436.google.com with SMTP id o13so29760146wrs.12
 for <alsa-devel@alsa-project.org>; Tue, 07 Dec 2021 06:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uY+Ye5lZK/paRfbOIv1ilOUmqS6UHZavsbAKwAI2Ayo=;
 b=K3IUYo1B7pu/wgpmnj5bernzE9trlHIFClUHa0V8zVeHm0hf0QwfDKtFh/hEol2P+I
 GZuUSDRzddkmH1Zab8ISaKbpcsrE/tXEnbWh+s8yClNOxj2NrTF1aWKNWIWtb1k8D2IA
 bM1dSMFqx1R3jZ/l+40UEoore5l8lyKO8Zh9thpw+nQ2hczIRxG3dE1IrH1mVfxuyF40
 4kNQjOlzxKNn+42q8M0/qWb0W1bXC4LJvcXBosgdlOe3Hms9aCH5L24eUmQ8Sse2Shpk
 E05pAjLY5Flu9kYILYteFpf7c6jdqriH1Cr1A0a9F5LGvW759vdsT/NbLyBn02/Gdrr/
 9wQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uY+Ye5lZK/paRfbOIv1ilOUmqS6UHZavsbAKwAI2Ayo=;
 b=BovJ9bNLkkeedowqPgOJqyf/irR3akC899HHcdaTM6N3sPOr9oxC3iy2k07t+A1YnE
 pYfBp1OA6elHn/iLPX7WQfN8zIOhm7r1Vlj/F9R5wT8i1YSErRrPvGG8GQ5g4HE6UmnH
 y//4wVN2iGIvHs4MJZDLD0RS1Q0gmAgA4pTzUaKdHn7vjBfRxU+gl50fJ8uMjodRhDx5
 nV9Djv+bz7j2AXsoXa3i8z0mPD79hMOJ32/hX8/QUDtUMyCDE4/I9Pt8hSCr/FY8LPBu
 29N7Rv22JXMWiYCKp8/fDTr33R5/QL0yLMb+DY1H0Hc9/ITuQ/Nrp/toZzxNkLtEaQ+X
 HBnw==
X-Gm-Message-State: AOAM533He3wZg6lbKbw4U3iuJmiMsjyftJwBF3X4aXmVl6Z7UDHRoWzl
 PJPjK7dodprpy3R9XJIVw10=
X-Google-Smtp-Source: ABdhPJzEGZxqvOkgDTrQ2wpZCusW5PWJyq2nGJ4WUdYa/7ExbD3EXioqx2hhLFY6t6Q7uUsVNmZu/Q==
X-Received: by 2002:a5d:45c4:: with SMTP id b4mr51085122wrs.222.1638887001943; 
 Tue, 07 Dec 2021 06:23:21 -0800 (PST)
Received: from localhost.localdomain ([39.48.199.136])
 by smtp.gmail.com with ESMTPSA id h18sm16075887wre.46.2021.12.07.06.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 06:23:21 -0800 (PST)
From: Ameer Hamza <amhamza.mgc@gmail.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: test-component: fix null pointer dereference.
Date: Tue,  7 Dec 2021 19:23:09 +0500
Message-Id: <20211207142309.222820-1-amhamza.mgc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <Ya9YxoUqkATCOASh@sirena.org.uk>
References: <Ya9YxoUqkATCOASh@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: amhamza.mgc@gmail.com, linux-kernel@vger.kernel.org
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

Dereferncing of_id pointer will result in exception in current
implementation since of_match_device() will assign it to NULL.
Adding NULL check for protection.

Signed-off-by: Ameer Hamza <amhamza.mgc@gmail.com>
---
changes in v2:
Replace of_match_device() with of_device_get_match_data to simplify the
logic as suggested by Kuninori Morimoto
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

