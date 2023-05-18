Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 870FA707AE8
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 09:31:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B66BE1F6;
	Thu, 18 May 2023 09:30:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B66BE1F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684395091;
	bh=72IOSX+RBqqWeihAkeUuZGbYVOJ/4lmBe8Q/033gqUg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vJINL5hY9wc1v9httBwP9qzgIF2jFn+087PExKaTH9birphjfgKzlRetgaoh5O6w+
	 6s/k4wvN2RTL1csfAQTz/Cddp5S/pqGLhQcjDcdPxm1HZYZkGImQ3HXOFl0U/5XW2p
	 5dDcSqK6yNNCMz2PP/Jv9VTFBrrKoOpJPF4xcSFM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC14CF805D3; Thu, 18 May 2023 09:28:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DFF25F805C9;
	Thu, 18 May 2023 09:28:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C226F80544; Thu, 18 May 2023 09:28:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CEEE3F80544
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 09:28:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEEE3F80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ekpuCluP
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50be17a1eceso2943732a12.2
        for <alsa-devel@alsa-project.org>;
 Thu, 18 May 2023 00:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684394887; x=1686986887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qojvzkxpai9FaVqu5a3rsXDeVwEMlNrj9bbWfn2RUs4=;
        b=ekpuCluPIWtdcF+DlLdXQuBzWj2T3yqpK1eo5JOW9J+oC2TnU4Cu1/c3Qnl+cfxOMw
         QBDnMXqS5j84+cx64RCXvTyFPrrcphblozW0EG3ZzG2JV1guL8LrjNwOtLCGCRsvPZ8S
         OuE6Binws0/Z/JuQXY+w2aI57UE1CxV3oiLNa2MzgQJ+3uHfPm+vH/1bl6BXXzLkK2B4
         dNDXzwm6LPn9xO7B/LrYtwYKooOXnDsoQ89EboL03MI+GbDcdrNKo5x8aoUVPY0YphO2
         n+f3oAlZzVl0enXvl953TFLLYHfNmW0zKDx2Zi2aAEcCyaSPpaWJIiuvpWghqsooIe6l
         Ppxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684394887; x=1686986887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qojvzkxpai9FaVqu5a3rsXDeVwEMlNrj9bbWfn2RUs4=;
        b=JlSTy1ncXgREM9mmCP2VW7D0+sMVnbwiN2rIYYg6WkCVXYp1QTduZm3xlr0GYZ8ulx
         OMeK+fGxcf7CAKVPqTdVHJt5T7C+5lVUS7DgKHtE6cmVEZUF2Ca33C3+wxs8S7qCUeaM
         hVeg1clHTjYCr8Q5uYuYgoezD7T293YXXzhX9aWW/gDN3/3NgmTPg64WbJYgNTZSnLm2
         0we/yXuXLFlC/cLWqa1+f+HKAqqsRcvl9+LoXdvBIu/hQdwyU4nJYYky9sTPj8sqSJ5C
         8EdSO+LSsH2Q8cHO4mgHT8MmzVvqEmLDefqWoG8nkH2UYp2QBltYaai9iB4TQhxu7isH
         7mVA==
X-Gm-Message-State: AC+VfDygrH955MaykZzecVReSFJc8Z4dFvagX6rVKAoYgG4Ch59UJywN
	MHNlMee8BEEeOToK34wUXGimZQ==
X-Google-Smtp-Source: 
 ACHHUZ7SDfkB5r68xXymWzpYbDvg/6rwAIMLjQpgKOm1OMdIsaHCpDhTO5xEPRYHd2ZoKGeNEKYr8g==
X-Received: by 2002:a17:907:31cb:b0:95e:ce3b:a471 with SMTP id
 xf11-20020a17090731cb00b0095ece3ba471mr42167358ejb.55.1684394887570;
        Thu, 18 May 2023 00:28:07 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a2b:c408:5834:f48e])
        by smtp.gmail.com with ESMTPSA id
 g17-20020a17090669d100b00965aee5be9asm594241ejs.170.2023.05.18.00.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 00:28:07 -0700 (PDT)
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
Subject: [RESEND PATCH 09/12] ASoC: codecs: rt712-sdca: do not store status in
 state container
Date: Thu, 18 May 2023 09:27:50 +0200
Message-Id: <20230518072753.7361-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230518072753.7361-1-krzysztof.kozlowski@linaro.org>
References: <20230518072753.7361-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YX7JXFYCC7HT6H5N2RNLXCHRMJUSS5YG
X-Message-ID-Hash: YX7JXFYCC7HT6H5N2RNLXCHRMJUSS5YG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YX7JXFYCC7HT6H5N2RNLXCHRMJUSS5YG/>
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
 sound/soc/codecs/rt712-sdca-sdw.c | 5 +----
 sound/soc/codecs/rt712-sdca.h     | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index 3f319459dfec..8f65516e7562 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -140,9 +140,6 @@ static int rt712_sdca_update_status(struct sdw_slave *slave,
 {
 	struct rt712_sdca_priv *rt712 = dev_get_drvdata(&slave->dev);
 
-	/* Update the status */
-	rt712->status = status;
-
 	if (status == SDW_SLAVE_UNATTACHED)
 		rt712->hw_init = false;
 
@@ -165,7 +162,7 @@ static int rt712_sdca_update_status(struct sdw_slave *slave,
 	 * Perform initialization only if slave status is present and
 	 * hw_init flag is false
 	 */
-	if (rt712->hw_init || rt712->status != SDW_SLAVE_ATTACHED)
+	if (rt712->hw_init || status != SDW_SLAVE_ATTACHED)
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
diff --git a/sound/soc/codecs/rt712-sdca.h b/sound/soc/codecs/rt712-sdca.h
index c6a94a23f46e..ff79e03118ce 100644
--- a/sound/soc/codecs/rt712-sdca.h
+++ b/sound/soc/codecs/rt712-sdca.h
@@ -20,7 +20,6 @@ struct  rt712_sdca_priv {
 	struct regmap *mbq_regmap;
 	struct snd_soc_component *component;
 	struct sdw_slave *slave;
-	enum sdw_slave_status status;
 	struct sdw_bus_params params;
 	bool hw_init;
 	bool first_hw_init;
-- 
2.34.1

