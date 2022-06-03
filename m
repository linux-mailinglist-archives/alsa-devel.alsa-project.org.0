Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D93353C6F6
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 10:35:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D0971825;
	Fri,  3 Jun 2022 10:34:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D0971825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654245337;
	bh=8xIel8/P5Fg4ePmT2ommOE5dF83zo/NaMDjiim69N/Q=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pDhfyVknyt+PCJcNCMwXw6HyRA5URBFwtvKE72fzW+Huv3nkohNr6T46V+VKs1DUN
	 NH3GwguxWLV0N1otOHJTP0769T6S01WnBMj8PCCZGfkomflGBMxMDRzRU2JyGelQMB
	 ao+0QvJ424PLb7TcvEyAddq9z9ZRDuswSJkTp2yE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1326F800F5;
	Fri,  3 Jun 2022 10:34:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31B47F804CC; Fri,  3 Jun 2022 10:34:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10BACF800F5
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 10:34:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10BACF800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hx9nlXm+"
Received: by mail-pl1-x636.google.com with SMTP id o6so1307751plg.2
 for <alsa-devel@alsa-project.org>; Fri, 03 Jun 2022 01:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GpfF8ItPMk0VJbbfMj/WC62xrovcB2QttagaUM4KJ38=;
 b=hx9nlXm+saSHa0qlQPDeVf9Evb9JKM3WDBSe/Mibf0IxM42umtirmqRX1DYDq9SePl
 Ee+zwR7LTa6mfdGdKNrLO++/HcpuzfJU5qcYnaBqCqy9tPJc9ZOMDI9uF92+Xi+rWDpf
 tU3ysW+XZ2xPe3SqAvyHX9btz9ou+ZwGqhCxQuGDhc2NrMQXH4UVJISjH5yrP7pQCFmt
 LdweHKNZwj9FwGZKLsc0ShA03be9Ok31txrcHV6dyxliOrh8VDHZjotcuo06d9Qjst4X
 ECtzZWJU5jmNsk8eNh9sKDu5PZ1xXDLVi31/FppMY5b61Chhl9ckWdtuzKAdDEAMS0BV
 2WqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GpfF8ItPMk0VJbbfMj/WC62xrovcB2QttagaUM4KJ38=;
 b=wlV9F39vgqw88/9n41LBklsiyPhNy0tddoXaJ0gjc7dDZRrAnXertqykwiXYs44Q+I
 gfhHMo+8DswOdt+1Pz9JQ1ioRcPTfYgNUNoQqtQ177n+zDBzksskgT9querXsphiAe0h
 FaguqH4hBEYY0HhsoaQB9cSyGUf6Rfcn+wb6jB5Y4MUADruNJwsVbMGQVPw8+BU5jlw1
 YgavVE6x8nmJeEG9B8l0xUPruckzUmmEZ6Rp1fgEFFX6cXXSzt9WhwSnDg4ytiAVStqE
 BUQMUQTmxz7gCVHy6TbiTCQqd3JLa7vPdOJ4xCE2Y0S3IG1dDz7wd5CACMn8+OjbNE4q
 RXRQ==
X-Gm-Message-State: AOAM533oxbY3iAzMa1sfylpw6IxXFJKMlzkm0HEKYbP1Zkj4kBg1O5bf
 9qk5MaVdr2z9wG6Rso+MTuc=
X-Google-Smtp-Source: ABdhPJy42CKbXP1g6HSFgMNfnYKPHDiOSTgrA1jna9XgHfAtjIeZISzUg9TczCGoz/8M5puUSJSJvg==
X-Received: by 2002:a17:90b:17c6:b0:1e6:8486:b324 with SMTP id
 me6-20020a17090b17c600b001e68486b324mr8464340pjb.24.1654245269977; 
 Fri, 03 Jun 2022 01:34:29 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 k5-20020a170902760500b0015e8d4eb2b8sm4809485pll.258.2022.06.03.01.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 01:34:29 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Miaoqian Lin <linmq006@gmail.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mt6797-mt6351: Fix refcount leak in
 mt6797_mt6351_dev_probe
Date: Fri,  3 Jun 2022 12:34:15 +0400
Message-Id: <20220603083417.9011-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
incremented, we should use of_node_put() on it when not need anymore.
Add missing of_node_put() to avoid refcount leak.

Fixes: format:f0ab0bf250da ("ASoC: add mt6797-mt6351 driver and config option")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/mediatek/mt6797/mt6797-mt6351.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-mt6351.c b/sound/soc/mediatek/mt6797/mt6797-mt6351.c
index 496f32bcfb5e..d2f6213a6bfc 100644
--- a/sound/soc/mediatek/mt6797/mt6797-mt6351.c
+++ b/sound/soc/mediatek/mt6797/mt6797-mt6351.c
@@ -217,7 +217,8 @@ static int mt6797_mt6351_dev_probe(struct platform_device *pdev)
 	if (!codec_node) {
 		dev_err(&pdev->dev,
 			"Property 'audio-codec' missing or invalid\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_platform_node;
 	}
 	for_each_card_prelinks(card, i, dai_link) {
 		if (dai_link->codecs->name)
@@ -230,6 +231,9 @@ static int mt6797_mt6351_dev_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
 			__func__, ret);
 
+	of_node_put(codec_node);
+put_platform_node:
+	of_node_put(platform_node);
 	return ret;
 }
 
-- 
2.25.1

