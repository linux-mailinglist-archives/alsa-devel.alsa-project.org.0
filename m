Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D22182065
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 19:07:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E6C4167E;
	Wed, 11 Mar 2020 19:06:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E6C4167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583950034;
	bh=TZqe4ZtYQUmklWOXHOEpIq5uF4AXsMvZegYk3tGqNh8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lqLp/PuK9fAIH+e1Mf4/csjtnrtKQtokUsFFqfgy51AjvDrYtB7RA83uf/G2M2Efm
	 1oLMWrOmkBeUYrYqbB70rEU9Lx1qIQQuGmNDNmR53McDsf+6UsXZRViVkN+4vCUyX8
	 KXr7MVJX9xjbKC+iVhnKCETZnXXGDs1EJQeM9wnk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E367F80268;
	Wed, 11 Mar 2020 19:04:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79BEAF801F7; Wed, 11 Mar 2020 19:04:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCC5BF800BE
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 19:04:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCC5BF800BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="KGUQqjtX"
Received: by mail-wm1-x344.google.com with SMTP id f7so3171561wml.4
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 11:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ko+f04MVdRtDW1tJPAYxq3VR8XAY3gAswAGYqmbv10w=;
 b=KGUQqjtXCiM9TTaRqOalBpsoGhAuqWfLxdC6jGMu+jkWXmhHu++/mDWPhjwg5VTICC
 hWegtEImHiXCNZaoTi3Laup0KYsxQ2k085mIEQmS6D2JiSrZYeJY5ZjdXgIALRpbeSDr
 Fd+uWYZRl7wPw/zZbTgx1YmHlc+Z8dCeXcGDEljSjVACdlcDLEgRcFGnzQZi5vcCO6Ij
 QNcVufk66xuZss6cNQ4zuGxvxXCYHCbp/JY+Y/BYbHNhbuUOC+wa0MPGMlNIQPc2yEb+
 ucOGh5mhxY0yKALnJieG8fEuUWBM6rHgnePfPMBG7TUI20LlJVyodk8vIYBIOtvt8i9g
 ScXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ko+f04MVdRtDW1tJPAYxq3VR8XAY3gAswAGYqmbv10w=;
 b=M2pqvc/xFQJd6FCVEampeM0AuC1JOMZz1t+zTWUhyT0z4k9ukJ5SyR5hvq/Q4mKlin
 b4KYGKUHtGxO7Uj2+F69+FxloPC3HFLMhjRE2sAgmpUuFvNKXXEwu70pq8qPvSiUQwSG
 T+4f5JrRN92XdVQtwxi9hlJ3GD1bPLm4yl59tnu1Akt3mFP/4gakjcgs4G+HXl37DEWI
 f+5qHp308DK6VlKMhyoISKpESv3cr9tGQ5xzFvZR3mMQPUixqG5yXPfNx8rHXUCzXfTl
 vg72eAmNc50V0Mfs6m6BpgQ8+Wsz6M/y1YFhlgshObN3qZoxNCmOYG3Aii79b6grgANF
 3C7g==
X-Gm-Message-State: ANhLgQ30SVs9O669nYirgDNfyTWDzijKdxg6s88hzzc1BpjlKYh/9a3Y
 8h2kOlAExgiW3075D7ptTBCI6Q==
X-Google-Smtp-Source: ADFU+vvVrTaAUu7ON5vFK7p0ja0xplS1TC2dk+nm4D+UFMEJx/tKEtHgJH5iT2cEGJuo+5TZgIq5fg==
X-Received: by 2002:a1c:2045:: with SMTP id g66mr4772885wmg.15.1583949883888; 
 Wed, 11 Mar 2020 11:04:43 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id z11sm8997840wmd.47.2020.03.11.11.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 11:04:43 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 1/2] ASoC: qdsp6: q6asm-dai: only enable dais from device tree
Date: Wed, 11 Mar 2020 18:04:21 +0000
Message-Id: <20200311180422.28363-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200311180422.28363-1-srinivas.kandagatla@linaro.org>
References: <20200311180422.28363-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, lgirdwood@gmail.com
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

Existing code enables all the playback and capture dais even
if there is no device tree entry. This can lead to
un-necessary dais in the system which will never be used.
So honour whats specfied in device tree.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index c0d422d0ab94..8b48815ff918 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -69,6 +69,8 @@ struct q6asm_dai_rtd {
 };
 
 struct q6asm_dai_data {
+	struct snd_soc_dai_driver *dais;
+	int num_dais;
 	long long int sid;
 };
 
@@ -889,7 +891,7 @@ static const struct snd_soc_component_driver q6asm_fe_dai_component = {
 	.compr_ops	= &q6asm_dai_compr_ops,
 };
 
-static struct snd_soc_dai_driver q6asm_fe_dais[] = {
+static struct snd_soc_dai_driver q6asm_fe_dais_template[] = {
 	Q6ASM_FEDAI_DRIVER(1),
 	Q6ASM_FEDAI_DRIVER(2),
 	Q6ASM_FEDAI_DRIVER(3),
@@ -903,10 +905,22 @@ static struct snd_soc_dai_driver q6asm_fe_dais[] = {
 static int of_q6asm_parse_dai_data(struct device *dev,
 				    struct q6asm_dai_data *pdata)
 {
-	static struct snd_soc_dai_driver *dai_drv;
+	struct snd_soc_dai_driver *dai_drv;
 	struct snd_soc_pcm_stream empty_stream;
 	struct device_node *node;
-	int ret, id, dir;
+	int ret, id, dir, idx = 0;
+
+
+	pdata->num_dais = of_get_child_count(dev->of_node);
+	if (!pdata->num_dais) {
+		dev_err(dev, "No dais found in DT\n");
+		return -EINVAL;
+	}
+
+	pdata->dais = devm_kcalloc(dev, pdata->num_dais, sizeof(*dai_drv),
+				   GFP_KERNEL);
+	if (!pdata->dais)
+		return -ENOMEM;
 
 	memset(&empty_stream, 0, sizeof(empty_stream));
 
@@ -917,7 +931,8 @@ static int of_q6asm_parse_dai_data(struct device *dev,
 			continue;
 		}
 
-		dai_drv = &q6asm_fe_dais[id];
+		dai_drv = &pdata->dais[idx++];
+		*dai_drv = q6asm_fe_dais_template[id];
 
 		ret = of_property_read_u32(node, "direction", &dir);
 		if (ret)
@@ -955,11 +970,12 @@ static int q6asm_dai_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, pdata);
 
-	of_q6asm_parse_dai_data(dev, pdata);
+	rc = of_q6asm_parse_dai_data(dev, pdata);
+	if (rc)
+		return rc;
 
 	return devm_snd_soc_register_component(dev, &q6asm_fe_dai_component,
-					q6asm_fe_dais,
-					ARRAY_SIZE(q6asm_fe_dais));
+					       pdata->dais, pdata->num_dais);
 }
 
 static const struct of_device_id q6asm_dai_device_id[] = {
-- 
2.21.0

