Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B42473AA8
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 03:14:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 278FC1B16;
	Tue, 14 Dec 2021 03:14:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 278FC1B16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639448090;
	bh=y2jV7FrdPykhC7jRF7EMV4m3EBpKY+XRYaVXBxA13Xw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s+40osuZwjXn/JnTQDn4TV9M8UL0BbeZIxJJV+7PwDnwQh53fGOIEBJj/0FLkM69s
	 VgvP2WoIY5pU5gTl8xP8oZoselT/Ii2aR6ZUOVT4L57rHAfmmFhZYbKvw6QnEZGSvK
	 BlHl0cjmI1WTh6JeS7Wok0bWEXyOc60hPxsN8OnY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A28CF8053E;
	Tue, 14 Dec 2021 03:10:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F2D6F8054A; Tue, 14 Dec 2021 03:09:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8374F80527
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 03:09:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8374F80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="O0TFNZ4V"
Received: by mail-pg1-x531.google.com with SMTP id 200so7294064pgg.3
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 18:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L3F85+gScuw2iCO1i31KCrbl5yRrJQv0xVYGhAgYmRM=;
 b=O0TFNZ4Vl+zsTtOeRE/41cPLUdxeck5kr1/PideANvbrf0Ewi/UI0LsyDNuVs7ERqp
 ZvQJ6DVnDR6DX7KDsXQd5nhli9TaupDQD/IGRvzwLIe5HPMNOZWP+WFTNTp/rEmvc6eK
 mX1pS3/GkqBpUyUYocFe7I531pd0+1olKN5nS5i04dUDkMJxm5sTacAC1DJ7v4gFPdgx
 Mtu2xuWX66Ck6ZzF5Uj8vHsKGzcRQ2R9uUWzNEJGv+pMgho6KdddeBuk03y8W7HRksLH
 6yoDk2rXeuS6NxYU/BL1Q3dTAHCBHnKez6nQeSJfPcwiRRZwlyQsaIqr4TFxkRAbJnga
 GJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=L3F85+gScuw2iCO1i31KCrbl5yRrJQv0xVYGhAgYmRM=;
 b=ELuSQYoKABsTFJnRywKqrpG0s/QpWThdNr5AH7dz8sg/WLqUH4MkwXXyWABX5gR+rx
 GNhcxdBh5hiSpkJVWgq0Kb267n3Gh1cXF1dkuOUAaT1NRZnOzeCJMmIhCuHt9zj907AF
 +3rYX1opasvY9XDbfZGExQeWbP2wHWOa/Fmjkv6J7feFzDRxeXr/qMtJZNeui6b/qyz7
 P4FvPcoGZ6IfyJ9u6keYkyCyWZQnLbzsuHL6xTMAFi/E3eflXh8CxG1fEa+iuFBw/XZn
 ZuawovQxSzaIumKd7L3AEL0+7jIpPOnQVcXTiKTT+YBTji2weYl5VUtc7qMeXSpjnAD0
 zieA==
X-Gm-Message-State: AOAM533qEvKmyqB7ZDAxwLlj0BPNm4oTsE0gghAIoeS7ALzjUJy41bUs
 2VzSPqRk3ZvMyQWcU37boP8eMOZ46n0=
X-Google-Smtp-Source: ABdhPJx6CeBFRYW036dlf8oLt7pqsWJmIzw0Vemtzw9JAG0fkyhWnZdhGWgyYX7g7BBupyPtOydWlg==
X-Received: by 2002:aa7:8219:0:b0:4a4:bec7:ef10 with SMTP id
 k25-20020aa78219000000b004a4bec7ef10mr1742797pfi.37.1639447781046; 
 Mon, 13 Dec 2021 18:09:41 -0800 (PST)
Received: from localhost.localdomain ([126.249.140.249])
 by smtp.gmail.com with ESMTPSA id b2sm14622296pfv.198.2021.12.13.18.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 18:09:40 -0800 (PST)
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 13/22] ASoC: fsl: Use dev_err_probe() helper
Date: Tue, 14 Dec 2021 11:08:34 +0900
Message-Id: <20211214020843.2225831-14-kuninori.morimoto.gx@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214020843.2225831-1-kuninori.morimoto.gx@renesas.com>
References: <20211214020843.2225831-1-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Use the dev_err_probe() helper, instead of open-coding the same
operation.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/fsl/fsl-asoc-card.c |  3 +--
 sound/soc/fsl/imx-card.c      | 17 ++++++-----------
 sound/soc/fsl/imx-sgtl5000.c  |  4 +---
 sound/soc/fsl/imx-spdif.c     |  4 ++--
 4 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 90cbed496f98..5ee945505281 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -853,8 +853,7 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(&pdev->dev, &priv->card);
 	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
+		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed\n");
 		goto asrc_fail;
 	}
 
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 6f06afd23b16..e758c4f1b0bc 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -563,9 +563,8 @@ static int imx_card_parse_of(struct imx_card_data *data)
 
 		ret = snd_soc_of_get_dai_name(cpu, &link->cpus->dai_name);
 		if (ret) {
-			if (ret != -EPROBE_DEFER)
-				dev_err(card->dev, "%s: error getting cpu dai name: %d\n",
-					link->name, ret);
+			dev_err_probe(card->dev, ret,
+				      "%s: error getting cpu dai name\n", link->name);
 			goto err;
 		}
 
@@ -573,9 +572,8 @@ static int imx_card_parse_of(struct imx_card_data *data)
 		if (codec) {
 			ret = snd_soc_of_get_dai_link_codecs(dev, codec, link);
 			if (ret < 0) {
-				if (ret != -EPROBE_DEFER)
-					dev_err(dev, "%s: codec dai not found: %d\n",
-						link->name, ret);
+				dev_err_probe(dev, ret, "%s: codec dai not found\n",
+						link->name);
 				goto err;
 			}
 
@@ -814,11 +812,8 @@ static int imx_card_probe(struct platform_device *pdev)
 	}
 
 	ret = devm_snd_soc_register_card(&pdev->dev, &data->card);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed\n");
 
 	return 0;
 }
diff --git a/sound/soc/fsl/imx-sgtl5000.c b/sound/soc/fsl/imx-sgtl5000.c
index 2f1acd011042..8daced42d55e 100644
--- a/sound/soc/fsl/imx-sgtl5000.c
+++ b/sound/soc/fsl/imx-sgtl5000.c
@@ -173,9 +173,7 @@ static int imx_sgtl5000_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(&pdev->dev, &data->card);
 	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n",
-				ret);
+		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed\n");
 		goto fail;
 	}
 
diff --git a/sound/soc/fsl/imx-spdif.c b/sound/soc/fsl/imx-spdif.c
index 6c4dadf60355..4446fba755b9 100644
--- a/sound/soc/fsl/imx-spdif.c
+++ b/sound/soc/fsl/imx-spdif.c
@@ -70,8 +70,8 @@ static int imx_spdif_audio_probe(struct platform_device *pdev)
 		goto end;
 
 	ret = devm_snd_soc_register_card(&pdev->dev, &data->card);
-	if (ret && ret != -EPROBE_DEFER)
-		dev_err(&pdev->dev, "snd_soc_register_card failed: %d\n", ret);
+	if (ret)
+		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed\n");
 
 end:
 	of_node_put(spdif_np);
-- 
2.25.1

