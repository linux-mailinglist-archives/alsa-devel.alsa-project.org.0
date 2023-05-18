Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2587C707AEB
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 09:31:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FE97204;
	Thu, 18 May 2023 09:31:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FE97204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684395116;
	bh=us34Eav5mASsFlGyhU7Uhg/+iRGmhNRG5z43OLR58E8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Nwg0SJ4y2OM7SFuIS2agDCsWZ85BxF339r73LALlI81dU9FbhlK4SleiZO+rXuvcx
	 4W+qdaU44nugJz3z85uizfFro4PAXp8fP1trqSH8n/QkYBLDgK2LiRxQUv1hJ/wNkf
	 1QkiQkked1X3Yidc2jE9IGtt8dvfC6MuAhI/n+FE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41706F805EB; Thu, 18 May 2023 09:28:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A158F805EB;
	Thu, 18 May 2023 09:28:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 615A2F805A0; Thu, 18 May 2023 09:28:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A5D7F80549
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 09:28:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A5D7F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=oM+RXRYe
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-510eb3dbaaeso286101a12.1
        for <alsa-devel@alsa-project.org>;
 Thu, 18 May 2023 00:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684394891; x=1686986891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIwJNTzxhNUSrbT0TXBGuXZECsHlorjZtBHAk3OzfKw=;
        b=oM+RXRYewHu4bLBr2ElIoV0dqPvtWyZM0qOHY/GFfmSdVrPTj24HiN13Hh7N8TAeni
         J5WYZxY71PrQQyURr3ZcPaKy25fwgtH9gFwJn5xRfVV+YN7j8Yg1IIVxxp/wI9aXf5Y8
         n2GPRztj+HYrJ4tRS4qSrFvEZytlLMWMzvtkAIU4+gnpOMjkrAzXJUiw8D3OFvqdXkOp
         Y9C4Mjs64P8/DSnrbXzRNoMWa7x8uyymebiZANZSmRclRig3M6WKiWX9Mfv3q1gq3q16
         ZpCP+MgXPKH2V0022YfM/aj/MxtPC8Jv9fMliQBdeYJP4QhbMx7ox+z3jhylUoAfhJZn
         fbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684394891; x=1686986891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aIwJNTzxhNUSrbT0TXBGuXZECsHlorjZtBHAk3OzfKw=;
        b=H5mPsPc3PqgCwAKPh+V/q6hQPKAt4F8Lx9tMWbV2oHISX/eQoiPz5/0ntPbn2tB2/N
         qa3bGyaxkAtTM6nDY3mVxE3xEDtsLdBMj/qR8vYADHLP5pqf5dLYdaLM5MBRTUlCrMlW
         vaDJjzPv3Q/7MPM/UHnKAAQtgu6bgrPTci1+0yS97uK6PGeP+COHDxJtHFXfGGL+lphY
         ArdFKpsi3N57UjJ9zGEr1Eo1t2hNHAkYU7PyZFtKrW6VmYjM+zyrmf90UcGc2m1HcdrS
         GdP0N1nvEDwsFlBFGo86YUHyrMIIv3hDlxWd8YOedoLVir6WnjUQcuv/X8uTCZZfXtLd
         L/5w==
X-Gm-Message-State: AC+VfDzAPKr3J4y/4JPUYL1fyl7lcXYgzftkb6rTK8Y5cQ4hk6XxRG9Z
	8a5rVdrK+6d4FxMVNA6aXwKZcgP0Is87IQvbBwKeJQ==
X-Google-Smtp-Source: 
 ACHHUZ5OyqRsRWc7zyUbnXlZEEMWIsRGekh6wkroEH6t7iYe7O1fvVzQsYjovW9n9PSXNsvSM3Ws0A==
X-Received: by 2002:a17:906:58d5:b0:969:9fd0:7cee with SMTP id
 e21-20020a17090658d500b009699fd07ceemr33147092ejs.10.1684394890980;
        Thu, 18 May 2023 00:28:10 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a2b:c408:5834:f48e])
        by smtp.gmail.com with ESMTPSA id
 g17-20020a17090669d100b00965aee5be9asm594241ejs.170.2023.05.18.00.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 00:28:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [RESEND PATCH 12/12] ASoC: codecs: rt722-sdca: do not store status in
 state container
Date: Thu, 18 May 2023 09:27:53 +0200
Message-Id: <20230518072753.7361-13-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230518072753.7361-1-krzysztof.kozlowski@linaro.org>
References: <20230518072753.7361-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 34FERF6AV23QZLMA7NOUMRKML2K2HRVK
X-Message-ID-Hash: 34FERF6AV23QZLMA7NOUMRKML2K2HRVK
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/34FERF6AV23QZLMA7NOUMRKML2K2HRVK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Driver in its update status callback stores Soundwire device status in
state container but it never uses it later.  Simplify the code a bit.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt722-sdca-sdw.c | 5 +----
 sound/soc/codecs/rt722-sdca.h     | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index 0a791a14215e..bfb2dac6bfee 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -163,9 +163,6 @@ static int rt722_sdca_update_status(struct sdw_slave *slave,
 {
 	struct rt722_sdca_priv *rt722 = dev_get_drvdata(&slave->dev);
 
-	/* Update the status */
-	rt722->status = status;
-
 	if (status == SDW_SLAVE_UNATTACHED)
 		rt722->hw_init = false;
 
@@ -188,7 +185,7 @@ static int rt722_sdca_update_status(struct sdw_slave *slave,
 	 * Perform initialization only if slave status is present and
 	 * hw_init flag is false
 	 */
-	if (rt722->hw_init || rt722->status != SDW_SLAVE_ATTACHED)
+	if (rt722->hw_init || status != SDW_SLAVE_ATTACHED)
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
diff --git a/sound/soc/codecs/rt722-sdca.h b/sound/soc/codecs/rt722-sdca.h
index 5bc6184d09aa..44af8901352e 100644
--- a/sound/soc/codecs/rt722-sdca.h
+++ b/sound/soc/codecs/rt722-sdca.h
@@ -20,7 +20,6 @@ struct  rt722_sdca_priv {
 	struct regmap *mbq_regmap;
 	struct snd_soc_component *component;
 	struct sdw_slave *slave;
-	enum sdw_slave_status status;
 	struct sdw_bus_params params;
 	bool hw_init;
 	bool first_hw_init;
-- 
2.34.1

