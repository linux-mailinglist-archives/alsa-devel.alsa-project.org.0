Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF838B2A7
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 10:39:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC8D5166A;
	Tue, 13 Aug 2019 10:38:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC8D5166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565685571;
	bh=diikQooGknYL/65axQhITv7zdqX0qCXto2stLwQ9TMs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aVkNWVjrypEQmPpgSF5mxJ0sIB6OMVlopvKjlO/sJWTeIVAQ7rxIeX8vi6wiZ5cjo
	 SUknEjHlX6rRt3StQ7U/gPiOgelc8BWWPWTFcoknqCFCcRd0ceY2K5fwAnWXRMK/GO
	 bqsFd+/avC6vGgMAkCYIou4k90IQHxr9puj1utec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91B2BF805F9;
	Tue, 13 Aug 2019 10:36:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B5B5F804CC; Tue, 13 Aug 2019 10:36:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED1DAF8015A
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 10:35:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED1DAF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="NIbQsuQ2"
Received: by mail-wm1-x343.google.com with SMTP id g67so700632wme.1
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 01:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B9rsr1/dgfaWkUD61V9rwU3U5jz+C8FjG7cuo0AJp/Q=;
 b=NIbQsuQ2GpNnu739xoBeBF5FbMINwGQO+uIiIC0oSLND+QmbFVEfIMFPovy+35DF/K
 wg++6jFE3Z9x5YLYZzPdq3Td/haqQlmOjOe2kkrJEYAeG2DEXu1cUrNyCr8UXuRtNjJ2
 M8cpQ+NGVZzfmBjrrbQVSi09Fk1hcLN0wTa2gbd8aT6C4hJ/bV1Ty/wgvnZIzTzLNq1C
 GMCi/GaYWG04/R8YjyoIM97doonDiD9mxrNim+ql2pMM+zsPLw2Il2hxXPIg5EMx5Sva
 4N/VaFxQyREtZdPogXXXuqNfJn5TUJyO7KtYv/4svBoYj4qUzg1iZ2KBR5awYOXaAwFI
 NSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B9rsr1/dgfaWkUD61V9rwU3U5jz+C8FjG7cuo0AJp/Q=;
 b=jFWviMYaNmM25iQUNpn61gn2SugvyIhIvi8+7+KcDomZmP5IWS34QXglxElNnWh8OC
 vP4ORvxbLbCCIlfTrrqbiOTy0f9jVaVtqh7EzX0CIIVJkZra0QF58TsHdoaB4x8lHbFa
 LcjW3gPA4ua/Z6WPOORks5gxnl1ZhkJOu/PUrMVjrBtAebcg6U5xBj7xJ0IenfSdGes4
 gMqfnRCJCiZg63Vzdb/pA0R02spUTbAmJS/tYJDRReOhls4RBchWRhVGofVmR1yEocqQ
 hIb5waJ9zSxRlLpoRx76qHnb8zAmifKv8mdJPlWwyAyNyOS6fwBd8gc1D8BrpTlI1VeC
 qALA==
X-Gm-Message-State: APjAAAVljKGg4QZhEMm4QMHoPyfZlmUq0UdJnK+7sL5bpw2MPTaHQEEL
 62Hbk7T5zrzsKy5bJRxYCvYa1A==
X-Google-Smtp-Source: APXvYqwP5gWmgCWzPHvhUEOHEmYJug9XD6Ru09g/P4GV8esa71ue0cYftUlFH20psboRMPK85MePTg==
X-Received: by 2002:a1c:7a12:: with SMTP id v18mr1765791wmc.56.1565685358047; 
 Tue, 13 Aug 2019 01:35:58 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id o11sm8651822wrw.19.2019.08.13.01.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2019 01:35:57 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	broonie@kernel.org
Date: Tue, 13 Aug 2019 09:35:48 +0100
Message-Id: <20190813083550.5877-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190813083550.5877-1-srinivas.kandagatla@linaro.org>
References: <20190813083550.5877-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, spapothi@codeaurora.org
Subject: [alsa-devel] [PATCH v2 3/5] ASoC: core: add support to
	snd_soc_dai_get_sdw_stream()
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

On platforms which have smart speaker amplifiers connected via
soundwire and modeled as aux devices in ASoC, in such usecases machine
driver should be able to get sdw master stream from dai so that it can
use the runtime stream to setup slave streams.

soundwire already as a set function, get function would provide more
flexibility to above configurations.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 include/sound/soc-dai.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index dc48fe081a20..1e01f4a302e0 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -202,6 +202,7 @@ struct snd_soc_dai_ops {
 
 	int (*set_sdw_stream)(struct snd_soc_dai *dai,
 			void *stream, int direction);
+	void *(*get_sdw_stream)(struct snd_soc_dai *dai, int direction);
 	/*
 	 * DAI digital mute - optional.
 	 * Called by soc-core to minimise any pops.
@@ -410,4 +411,13 @@ static inline int snd_soc_dai_set_sdw_stream(struct snd_soc_dai *dai,
 		return -ENOTSUPP;
 }
 
+static inline void *snd_soc_dai_get_sdw_stream(struct snd_soc_dai *dai,
+					       int direction)
+{
+	if (dai->driver->ops->get_sdw_stream)
+		return dai->driver->ops->get_sdw_stream(dai, direction);
+	else
+		return ERR_PTR(-ENOTSUPP);
+}
+
 #endif
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
