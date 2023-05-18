Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1148A707AEC
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 09:32:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E77E7F8;
	Thu, 18 May 2023 09:31:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E77E7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684395139;
	bh=C1mPqbFYhsJBdKbdcVgm69H9b0K10gG7zIsQ3bKYjGc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ar/uMlgRUsjK/8VlvnviiVKMfFKoSn/x2zDyW4/Qwop9L9Jib917MJXwRVG//ydgk
	 68o5fFsOIL0RQo0qqcjltSfiHJ/dNqdt2oTMEQEvLPfDarGSjnARN2qDCgI7Ktnfho
	 5N1ec9w7U6+KV8wRKIGqTeIqDmLCBZ5qLGF8uxDM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D3F7F805FB; Thu, 18 May 2023 09:28:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76AF8F805F1;
	Thu, 18 May 2023 09:28:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4B87F805A9; Thu, 18 May 2023 09:28:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A02F8F80272
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 09:28:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A02F8F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=O9ourAIq
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-96aae59bbd6so318891166b.3
        for <alsa-devel@alsa-project.org>;
 Thu, 18 May 2023 00:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684394880; x=1686986880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJY+f/kyvGT80qDu/2YzrWbFWrXecvsPv92RJrnC6oM=;
        b=O9ourAIqiWUoA66Do64H+sF3x/mqeWBFY1RLtuUwyPqlqUUj+RaoCyPjATbGFzY6uP
         vv0n+QcH0YiWtYMVbl1DtrxKnskNmlVpnXcM2bELSuVYkIkwQyakVQiDdim2G6qCuZ1b
         LTF2tCNi+KHuG/hw6oFjAiK8qNLZebZYgeBnKvMH41x6m4T1LBtpxQF/ljm3QFHyRiHL
         lwwJMfNpG9gK6QGBkGC0iebrnNFhiQk8ThPZ+PMDWSxHwb1c5tpfQ6dsDevIxJgPybVS
         artNLQuSEdRZ6dsivfMk0624OjTfKDz7aKmjWmcOYrWkAVkDK0TrwPjDrlc42proM92w
         ofEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684394880; x=1686986880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jJY+f/kyvGT80qDu/2YzrWbFWrXecvsPv92RJrnC6oM=;
        b=LsfAzil7kiW3QAgQ4Wpf7UN4IgeQjd6RIf9Txfuw57/965qbWbqigLsOYYrwmRJuhr
         wQ55o3bbMSXKuw+5kaFHOgSVywm2bXfq0fB+vJ2E2KQSpLIwLU8EwVIo7D6+bpPlSPfO
         PCnsoH3tIR/okrp9tyCWtJ5PufkOBe3ivXp5yYFtdgaj9adM1zfqMYQIBtWhSPCnfwr4
         tbe76MQoljhxaKHQ6+ZCS2Nqwx/tryDcgjj7RSNMfHVvZ/UyUiKFoLuLfRiJVsR1MvOV
         yi2IgOutYdBL7NDozSAqVaZtuSYFp6RysIkWL6slOeeB/pF7EShI3yseNOZ/NCUObpki
         RIFA==
X-Gm-Message-State: AC+VfDyqQ/INS+U/NRJR32tYqS+B+CgcUc5J9IlBtI2L2asUA9X/wU2M
	7adLe+gbFOzNg2j+i+abVI+Adkb/aNh+m/fXBNULZw==
X-Google-Smtp-Source: 
 ACHHUZ4u5KhX1gbFbc1OQdpkGq4jRhdU94xrmSghEO85zLrbApdS3ipuJkXCJSa18RAmDtrB+J5qjA==
X-Received: by 2002:a17:906:ee82:b0:94f:1a23:2f1c with SMTP id
 wt2-20020a170906ee8200b0094f1a232f1cmr36770723ejb.50.1684394880586;
        Thu, 18 May 2023 00:28:00 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a2b:c408:5834:f48e])
        by smtp.gmail.com with ESMTPSA id
 g17-20020a17090669d100b00965aee5be9asm594241ejs.170.2023.05.18.00.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 00:28:00 -0700 (PDT)
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
Subject: [RESEND PATCH 03/12] ASoC: codecs: rt1318: do not store status in
 state container
Date: Thu, 18 May 2023 09:27:44 +0200
Message-Id: <20230518072753.7361-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230518072753.7361-1-krzysztof.kozlowski@linaro.org>
References: <20230518072753.7361-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LQ2FC4JOL3UCSSL7QARXG67JO5W4WAOR
X-Message-ID-Hash: LQ2FC4JOL3UCSSL7QARXG67JO5W4WAOR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LQ2FC4JOL3UCSSL7QARXG67JO5W4WAOR/>
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
 sound/soc/codecs/rt1318-sdw.c | 5 +----
 sound/soc/codecs/rt1318-sdw.h | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt1318-sdw.c b/sound/soc/codecs/rt1318-sdw.c
index 795accedc22c..3751d923611c 100644
--- a/sound/soc/codecs/rt1318-sdw.c
+++ b/sound/soc/codecs/rt1318-sdw.c
@@ -456,9 +456,6 @@ static int rt1318_update_status(struct sdw_slave *slave,
 {
 	struct  rt1318_sdw_priv *rt1318 = dev_get_drvdata(&slave->dev);
 
-	/* Update the status */
-	rt1318->status = status;
-
 	if (status == SDW_SLAVE_UNATTACHED)
 		rt1318->hw_init = false;
 
@@ -466,7 +463,7 @@ static int rt1318_update_status(struct sdw_slave *slave,
 	 * Perform initialization only if slave status is present and
 	 * hw_init flag is false
 	 */
-	if (rt1318->hw_init || rt1318->status != SDW_SLAVE_ATTACHED)
+	if (rt1318->hw_init || status != SDW_SLAVE_ATTACHED)
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
diff --git a/sound/soc/codecs/rt1318-sdw.h b/sound/soc/codecs/rt1318-sdw.h
index 85918c184f16..86e83d63a017 100644
--- a/sound/soc/codecs/rt1318-sdw.h
+++ b/sound/soc/codecs/rt1318-sdw.h
@@ -88,7 +88,6 @@ struct rt1318_sdw_priv {
 	struct snd_soc_component *component;
 	struct regmap *regmap;
 	struct sdw_slave *sdw_slave;
-	enum sdw_slave_status status;
 	struct sdw_bus_params params;
 	bool hw_init;
 	bool first_hw_init;
-- 
2.34.1

