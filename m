Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8C253C9D8
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 14:23:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0C4E184D;
	Fri,  3 Jun 2022 14:22:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0C4E184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654258987;
	bh=IJhPMh4HjT5lR2ZYbZm9q4qNkgg/V0BuuSJaMSIVQe8=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cqepbaP0T4eS1kSiq7em8YpSOS+bRDPICucsv5J11lrA4CNxTxNvWy/eXUp/hyV3/
	 leOJjHpqhu2WnA5bA5XWj9K6ycH94BT6w9Rh2UBJGq8FO+DwYIKmbTXPNV1JpRbJVu
	 jXl29Pw/8hDUtTSeW9Zi7WbosYc2w6yoT+Rmh/bE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C177F80089;
	Fri,  3 Jun 2022 14:22:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAA49F804CC; Fri,  3 Jun 2022 14:22:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9099F80124
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 14:22:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9099F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hROkOAQn"
Received: by mail-pg1-x532.google.com with SMTP id g184so7118613pgc.1
 for <alsa-devel@alsa-project.org>; Fri, 03 Jun 2022 05:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3VC0YJVZn7Kv6rn/9H6pSETWMjRj00JSP4l9cAHh5eU=;
 b=hROkOAQnkmQctmhtlL1X5NiOE3QXbtEkfIJvBno2MFCdveIkW1Kx36uOmAKO4ebT0Z
 QFcLvV1FAiydy4xwFUEtjTgcTg7kDI7nAD7s7AusEVTao1eFqEJtHnMINWF8Ki5oe5nU
 6M+t9EyIWLPH060tBgvGubZ/UtPZzcg8iTOjyIteG1qOQ2rJdBuUZ9VjymAASIPMsk95
 FZZihZ3m/6Q/GfUE3fn2Vynix8OvJ9N2t35TnUiWRflNGc6TogspMjzsXRkSaiVSm/cA
 2Gd4PdL359hpW+FgdiSNaZIa0iIo5p6Yn+Uf3HupeYEQIdFEafpNpt/91kuianpwz6JB
 HAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3VC0YJVZn7Kv6rn/9H6pSETWMjRj00JSP4l9cAHh5eU=;
 b=1sA4hezFeN+TCSHVSV+IwJVISfNbzQiQwVqc20Djf+Er+0VZf8aP3xxzAkDmk8oued
 llBHVTxN/AarA+Y/TzXz8o2+tQhKbIcj6s+wyt3loZTZ4HYQGkrf547GDc/RlKg0ASRU
 /O/Z6XZwdT9rrqT6U8cAcubv8JLGcuV6YW0ZSZu3cpXl7PxrcwBiCHrYvVSp6Lt5BxZn
 JGjPdp09aMR/1Eiuy87b9IeSsq8tx4ElmfMe+Jl5ay70W/oTWdo2OUGiGYWV9qrJPgf9
 AQAjNHDuclNDT36kyB0MygRRCUkVYH1cBojo2MwWyqQ0t7O3GlMcrtxDUrg4n46BZop8
 Vh7A==
X-Gm-Message-State: AOAM530ALgFXnh8fbCH7n79oXA4KvW9f7CnZe7fkZrXpjeJKLk0yRkXZ
 iRYcdWZW7qKou+hnN0aNbcs=
X-Google-Smtp-Source: ABdhPJxCUQk6p5MU7RZHc5xtq+78cZYza7i9U7uf70adLQBe3kOuHC+oOulaqSKHxDVn+zUwwg3Q2Q==
X-Received: by 2002:a65:6cc9:0:b0:399:26da:29af with SMTP id
 g9-20020a656cc9000000b0039926da29afmr8711774pgw.489.1654258919680; 
 Fri, 03 Jun 2022 05:21:59 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 h15-20020a17090a470f00b001df51dd0c93sm8330001pjg.1.2022.06.03.05.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 05:21:58 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Miaoqian Lin <linmq006@gmail.com>,
 Kai Chieh Chuang <kaichieh.chuang@mediatek.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mt6797-mt6351: Fix refcount leak in
 mt6797_mt6351_dev_probe
Date: Fri,  3 Jun 2022 16:21:47 +0400
Message-Id: <20220603122149.25117-1-linmq006@gmail.com>
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

Fixes: f0ab0bf250da ("ASoC: add mt6797-mt6351 driver and config option")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
changes in v2:
- update Fixes tag
v1 link: https://lore.kernel.org/r/20220603083417.9011-1-linmq006@gmail.com/
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

