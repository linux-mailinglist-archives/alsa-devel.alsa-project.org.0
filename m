Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4383CC33A
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Jul 2021 14:28:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D14BF16A1;
	Sat, 17 Jul 2021 14:27:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D14BF16A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626524908;
	bh=uzTlJXmnHGJ7XvcJ/3YpYVrDyPbjbf0gvf18kk265fE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lOMXYUMh+CPaLiFmlkBZeVbF1kEAcSbgYn4kvsqaQSyha+Gd+IvRQ+856EC1qZ2Aj
	 1Q1GNcLeHhOcwmxT7toVllh1pWLe57aYInHXnM1perfKQlJWEmRIBUDkJr9DdIW8lL
	 h0rHLQh7hPVpxlAXgD01RWEXdz1uwvtXWSx+3ymY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 717ECF804E3;
	Sat, 17 Jul 2021 14:26:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CF23F80424; Sat, 17 Jul 2021 14:26:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F05D3F80217
 for <alsa-devel@alsa-project.org>; Sat, 17 Jul 2021 14:25:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F05D3F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HagJseli"
Received: by mail-lf1-x134.google.com with SMTP id u13so20611746lfs.11
 for <alsa-devel@alsa-project.org>; Sat, 17 Jul 2021 05:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QQNp0sdJ1Pncpy92tkHPev6Ip/OvjtBZgI6rNz1+HnQ=;
 b=HagJselij1rPkM83SkXRi8s5txDFX3iZo24S2R4hEnOrrQGOmjxpOj2f/Ubp/KwrMh
 eQQAVkAa/d/2qiApChdMTlifgVc8mTYbdd9F+xycTz58txExhdewxGYv3mJQ2zrEo4Pl
 1bUymxNUNiHCh2BrSinuc0T0AQNYlUXfbNvY61COhHCAT08NKdzjOdgy8ijKnpu8PSDK
 +g7qOiWP6f1y5DO6oQH9RDyslvKU8Rr6+ioNcNXo3UTqUzlMjKiosJv0e9cNCKHsYDeL
 Y/fLf9o+TD+7Cctgdwgj9vwIEkTuFLWtnyBMGTRNYRSz4T9X2i0Ue2VJb4JoqJpZ+oCy
 sWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QQNp0sdJ1Pncpy92tkHPev6Ip/OvjtBZgI6rNz1+HnQ=;
 b=NZY45K5ZrziGnWcIU0ojgnffzf2W/8JkCfKOmVhZWm3aiyTTcFFiQxi94QLQOZIebB
 luV/7JhqVAVm04ZwkKO9BjJJv21leH/z9coueCHLMgn0ZoJfS8IOTYMzKwYoQTtbbrrD
 EUP8hEjeutVpnDQbxbs+Aew+AkE33mrTHLXmHBfVmrraYl+GtYqZeH/7c6vg3hhq8XKg
 8O3em7Wv/9aSd7o0rSqWRCyVOEV5I5rR5NAP3nbHcg7yncT6gD/c5DUExBm5xrLjW/Nd
 yYZQHyttcVXz0QG3QyxfbcLMqVDrzgdR4pdCyoCufyd2dpwPGkcPWGyZy6XKwHr8tuCo
 Kvzw==
X-Gm-Message-State: AOAM532CXuaQpTpZuwzO3ww2E3OYSxrjuxCcU2yCW9yCibyd8q+NruFT
 74QII5rxpjei7R0B0M2sTp4=
X-Google-Smtp-Source: ABdhPJwvjZYy4JK+uyCUeuLazErVsTkw42oyvSUNnwSGJ2+I4tunXj0aL2huEmXDf7NnkY+/GDNpXg==
X-Received: by 2002:ac2:5d2e:: with SMTP id i14mr11130476lfb.642.1626524754566; 
 Sat, 17 Jul 2021 05:25:54 -0700 (PDT)
Received: from localhost.localdomain (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id v4sm860087lfi.118.2021.07.17.05.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 05:25:54 -0700 (PDT)
From: Peter Ujfalusi <peter.ujfalusi@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 2/3] ASoC: ti: j721e-evm: Check for not initialized
 parent_clk_id
Date: Sat, 17 Jul 2021 15:28:19 +0300
Message-Id: <20210717122820.1467-3-peter.ujfalusi@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210717122820.1467-1-peter.ujfalusi@gmail.com>
References: <20210717122820.1467-1-peter.ujfalusi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com
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

During probe the parent_clk_id is set to -1 which should not be used to
array index within hsdiv_rates[].

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
---
 sound/soc/ti/j721e-evm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/j721e-evm.c b/sound/soc/ti/j721e-evm.c
index 017c4ad11ca6..265bbc5a2f96 100644
--- a/sound/soc/ti/j721e-evm.c
+++ b/sound/soc/ti/j721e-evm.c
@@ -197,7 +197,7 @@ static int j721e_configure_refclk(struct j721e_priv *priv,
 		return ret;
 	}
 
-	if (priv->hsdiv_rates[domain->parent_clk_id] != scki) {
+	if (domain->parent_clk_id == -1 || priv->hsdiv_rates[domain->parent_clk_id] != scki) {
 		dev_dbg(priv->dev,
 			"%s configuration for %u Hz: %s, %dxFS (SCKI: %u Hz)\n",
 			audio_domain == J721E_AUDIO_DOMAIN_CPB ? "CPB" : "IVI",
-- 
2.32.0

