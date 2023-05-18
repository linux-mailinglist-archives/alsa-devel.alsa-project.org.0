Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B5D707ADB
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 09:29:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D9C31F9;
	Thu, 18 May 2023 09:28:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D9C31F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684394953;
	bh=d+VL79f1FoMJqQbqX2Mgk/NMY05JmQb72dmkEbSNu4Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z4J4WtnJrnjgvLNbgulybysTzY+nuG5QeoBwT/4r8rfPXJa+B+SfgI59WKOkeTvuG
	 y2qm7EXFi1zLudzin6LXSPE+jJaQTEYMTyY025E5LT/zbfEyJAfmLiKUHW36Bxvd+5
	 W7NXcsBKcjJoLDmpQuMp2CcYIRwVr9FchJeK4Ork=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD63EF80087; Thu, 18 May 2023 09:28:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA2C6F80087;
	Thu, 18 May 2023 09:28:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A15AAF80552; Thu, 18 May 2023 09:28:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05DBBF8025A
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 09:27:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05DBBF8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=VdCXcIJz
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-965c3f9af2aso252776166b.0
        for <alsa-devel@alsa-project.org>;
 Thu, 18 May 2023 00:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684394878; x=1686986878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xY4US8j109ap8g7iJPTxaqGh/0KFUvHJ6e/HWa50JR0=;
        b=VdCXcIJz3zJr+Z194kctgRAjtWQyZ8oKgT3cqsKr2mbtExnmGXiP6sq1k6ff7pm/cB
         /2TbXgKWQfA5/hdwYF5YeQPaNdZAM6GBNHvIztoou8hegf3uUbCwiCQxBQX7becb0J6M
         lSzA5ZWORuBJMzq9QGt1+2CoYD/6tUMsrMb+62zbEZTlWDdZp4urjE1QejdtIqapndS6
         J/0dwAFwWXC1PxLwiryYg76queLaMNfzQKhH1j10QGIqdXI/u+qvtIS2ObSyuWofmM4x
         Rj4fm6iHvvf27XCjbs63mUYGm8d37NdEiWizcFIZBEva1cii+s7v/DLYuB2hA1gu/0bl
         GaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684394878; x=1686986878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xY4US8j109ap8g7iJPTxaqGh/0KFUvHJ6e/HWa50JR0=;
        b=LA//oZqRHjfUWdam6X6Hd90/oeOHyHGNyhamvpqMaFlhOitrcZVTiISTam2gwrnynx
         Mc6qa68zHhreu22jV9YfZ+jyJaTs9/M4+Vilpqgn4tYmXKVsh02MiB3P14a2dZ0Tx14d
         OHMB44YLw/5WoCHmfqbA1VNrzHVBuGfgrzzsYmkFrSEnODnEnGceFHycthPmd/5rw5IL
         kwyxL0VFb2ydBW8YX5n8S16qPlpUbkTyTakNLToafSzl4d8vfewuF3WPGkOPIU7wI7sQ
         jkUaQ/VJ8bfD2qpEvOHd+eFhd75zGH5gtMTM03s4/K/w3xQe/Z+RS5bqQ22NCy+IKv49
         wZNg==
X-Gm-Message-State: AC+VfDw+671OnTdp7R9lVye1lWGOcFE0KRVK7mQTJVgH7vCAn4krwKwb
	AkFTLT7iVmN4dMDPddQZSWB9Vg==
X-Google-Smtp-Source: 
 ACHHUZ54EI6Z2Sgw4IUl4GkQXP2DPVdI/bOYfBxdQhdJbWUdQ69lrxWikweBVU6nlqSvZnHHhpQn9w==
X-Received: by 2002:a17:907:1ca8:b0:96a:bfc:7342 with SMTP id
 nb40-20020a1709071ca800b0096a0bfc7342mr32079981ejc.62.1684394878057;
        Thu, 18 May 2023 00:27:58 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a2b:c408:5834:f48e])
        by smtp.gmail.com with ESMTPSA id
 g17-20020a17090669d100b00965aee5be9asm594241ejs.170.2023.05.18.00.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 00:27:57 -0700 (PDT)
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
Subject: [RESEND PATCH 01/12] ASoC: codecs: rt1308: do not store status in
 state container
Date: Thu, 18 May 2023 09:27:42 +0200
Message-Id: <20230518072753.7361-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230518072753.7361-1-krzysztof.kozlowski@linaro.org>
References: <20230518072753.7361-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JHWPWZWBHVKJ64QSTZOFJNBUANCJUTUR
X-Message-ID-Hash: JHWPWZWBHVKJ64QSTZOFJNBUANCJUTUR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JHWPWZWBHVKJ64QSTZOFJNBUANCJUTUR/>
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
 sound/soc/codecs/rt1308-sdw.c | 5 +----
 sound/soc/codecs/rt1308-sdw.h | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index 1797af824f60..313e97c94532 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -304,9 +304,6 @@ static int rt1308_update_status(struct sdw_slave *slave,
 {
 	struct  rt1308_sdw_priv *rt1308 = dev_get_drvdata(&slave->dev);
 
-	/* Update the status */
-	rt1308->status = status;
-
 	if (status == SDW_SLAVE_UNATTACHED)
 		rt1308->hw_init = false;
 
@@ -314,7 +311,7 @@ static int rt1308_update_status(struct sdw_slave *slave,
 	 * Perform initialization only if slave status is present and
 	 * hw_init flag is false
 	 */
-	if (rt1308->hw_init || rt1308->status != SDW_SLAVE_ATTACHED)
+	if (rt1308->hw_init || status != SDW_SLAVE_ATTACHED)
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
diff --git a/sound/soc/codecs/rt1308-sdw.h b/sound/soc/codecs/rt1308-sdw.h
index 04ff18fa18e2..f816c73e247e 100644
--- a/sound/soc/codecs/rt1308-sdw.h
+++ b/sound/soc/codecs/rt1308-sdw.h
@@ -159,7 +159,6 @@ struct rt1308_sdw_priv {
 	struct snd_soc_component *component;
 	struct regmap *regmap;
 	struct sdw_slave *sdw_slave;
-	enum sdw_slave_status status;
 	struct sdw_bus_params params;
 	bool hw_init;
 	bool first_hw_init;
-- 
2.34.1

