Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 069EA707ADF
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 09:30:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CEEF3E8;
	Thu, 18 May 2023 09:29:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CEEF3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684395010;
	bh=MnQ97/hVN5FSzJzUz6uJLPHxJiB0a87/C3eBZvHKaHQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sEv863V+HYsyp+u6YuAH+VCOjkqKNuyz9wvoVc37oBMdftSecVApubn4vXmyWtAB1
	 uDaov0YSb05oL1B2C9Xd8tDXbt6wo5Wk5MwP9BAEPY4Mf/RflEXdHWqpyKZ/I0cKef
	 vCrDU+aQufB0xriEm/LYJC43QbTfeeYgvQYEsVDw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A649CF80272; Thu, 18 May 2023 09:28:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8BE1F8057C;
	Thu, 18 May 2023 09:28:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC33AF80553; Thu, 18 May 2023 09:28:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86641F80087
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 09:28:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86641F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=WP+J1VwS
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-96aadfb19d7so316865666b.2
        for <alsa-devel@alsa-project.org>;
 Thu, 18 May 2023 00:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684394879; x=1686986879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LC/zIc8X+SN3v3HkNtTVdt1UL4xSDxpH+q1cQ2DHdvs=;
        b=WP+J1VwSUrjRPf0WUHV5s4C8tvmBJHGuOzF1k5aWgcB+Mw3xKYuBhbCXu364BdOCwP
         2VDyyUqIYQB2hGqLRmtrHJqOENQpwdUYXOiEui9j2ebQGU1cL5VjZ0FTb1/kbr24Q6Np
         0kAN0HTBxFawRRBs36ejvFCGYOCWC14xl/3tSjX/YRbONRJgr4+2Aa3/W7ELX3uVPddk
         FACbZtF5IlbdDmQldf6ObNjB9PAe5niHMcjTthzN4iZCtNhmLie3vFqFlArzytN5XBp9
         vM+hvr9BLbJWMNy5YnSAybjVHoq8ftywfjwUrE7QTdpVYMawZcEQgVKEWoYor4GE53ci
         wyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684394879; x=1686986879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LC/zIc8X+SN3v3HkNtTVdt1UL4xSDxpH+q1cQ2DHdvs=;
        b=Hgx8w0OoSc0o4ozMRPrUp4n2AADSNjvgZbHJlFhK+dwbhAWGBx6HcXiEZxUTPBAGZF
         dBJ25ecZJwstmukpAFrqWqYckgxCxkyC4Z475hJh8a7IVwGsVCII/n/NwniEQFyKQBa7
         R4RrfnR1LUksgOQMky7yEAnsBmVPeDBOpaH2NV10b3yuZ/4xZB+4OIFKFz+sT0H/F9cs
         7NLfe8V992zocU26cAWQuTIeyr3fpx2KZ9TlZKU721G5LhhnBuOON7VyHHC1qYFnb5K1
         OjBh34cjamDztsOua3TpMkKe3fffDXCUgSKu85m8KUZGduLUD22BzljhtGOXYVdGVDsU
         RIlw==
X-Gm-Message-State: AC+VfDxKYh43QAGhuQ/mq3IlOFmYbLlrt2jKzgk+OR4RErzaaZIxQa9S
	zl5L1H5D5k3mqGXZ+HWaIip3Ig==
X-Google-Smtp-Source: 
 ACHHUZ6bymIhEgJDfUzkeFREt4EtG+UMkBzeSiCgNymRaghAk/dTfP/cemBVaWPSj4Cv08e99FsHpQ==
X-Received: by 2002:a17:906:d54b:b0:94f:3980:bf91 with SMTP id
 cr11-20020a170906d54b00b0094f3980bf91mr46254817ejc.19.1684394879305;
        Thu, 18 May 2023 00:27:59 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a2b:c408:5834:f48e])
        by smtp.gmail.com with ESMTPSA id
 g17-20020a17090669d100b00965aee5be9asm594241ejs.170.2023.05.18.00.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 00:27:58 -0700 (PDT)
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
Subject: [RESEND PATCH 02/12] ASoC: codecs: rt1316: do not store status in
 state container
Date: Thu, 18 May 2023 09:27:43 +0200
Message-Id: <20230518072753.7361-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230518072753.7361-1-krzysztof.kozlowski@linaro.org>
References: <20230518072753.7361-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: G5FKLTESVHMKQWNYSQ7RQ5OWXCJG2IQJ
X-Message-ID-Hash: G5FKLTESVHMKQWNYSQ7RQ5OWXCJG2IQJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G5FKLTESVHMKQWNYSQ7RQ5OWXCJG2IQJ/>
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
 sound/soc/codecs/rt1316-sdw.c | 5 +----
 sound/soc/codecs/rt1316-sdw.h | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt1316-sdw.c b/sound/soc/codecs/rt1316-sdw.c
index 2ee5e763e345..601b76320124 100644
--- a/sound/soc/codecs/rt1316-sdw.c
+++ b/sound/soc/codecs/rt1316-sdw.c
@@ -323,9 +323,6 @@ static int rt1316_update_status(struct sdw_slave *slave,
 {
 	struct  rt1316_sdw_priv *rt1316 = dev_get_drvdata(&slave->dev);
 
-	/* Update the status */
-	rt1316->status = status;
-
 	if (status == SDW_SLAVE_UNATTACHED)
 		rt1316->hw_init = false;
 
@@ -333,7 +330,7 @@ static int rt1316_update_status(struct sdw_slave *slave,
 	 * Perform initialization only if slave status is present and
 	 * hw_init flag is false
 	 */
-	if (rt1316->hw_init || rt1316->status != SDW_SLAVE_ATTACHED)
+	if (rt1316->hw_init || status != SDW_SLAVE_ATTACHED)
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
diff --git a/sound/soc/codecs/rt1316-sdw.h b/sound/soc/codecs/rt1316-sdw.h
index e37121655bc1..dc1bfe40edd3 100644
--- a/sound/soc/codecs/rt1316-sdw.h
+++ b/sound/soc/codecs/rt1316-sdw.h
@@ -42,7 +42,6 @@ struct rt1316_sdw_priv {
 	struct snd_soc_component *component;
 	struct regmap *regmap;
 	struct sdw_slave *sdw_slave;
-	enum sdw_slave_status status;
 	struct sdw_bus_params params;
 	bool hw_init;
 	bool first_hw_init;
-- 
2.34.1

