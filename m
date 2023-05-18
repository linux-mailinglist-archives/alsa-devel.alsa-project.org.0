Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F0A707AEE
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 09:32:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BE8A82C;
	Thu, 18 May 2023 09:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BE8A82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684395163;
	bh=Iqyby5VEg0SeiuVu7tvN9a01i2rhmWAoC4yPy1hiHpo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hzDfGxAgNXXFmxgDI9+BMz4+iA8nz3fP3uRNQC88TLk2u3Ehwa9Lptf69WqDSyave
	 mLhpX+5zl2vFG3SmAhGI7p7oXS+pdMQm+pMWV9G4qjpoT65HU/wFZ4JESWF3lgPym1
	 t9HdPhgOfhW6IRWpz3FUHsYIyvh9kEsf2p5X00Qo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E756F80600; Thu, 18 May 2023 09:28:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5D27F805FC;
	Thu, 18 May 2023 09:28:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68136F805AC; Thu, 18 May 2023 09:28:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 263D3F80548
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 09:28:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 263D3F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=fGc0R2lA
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-965b5f3b9ffso177822266b.0
        for <alsa-devel@alsa-project.org>;
 Thu, 18 May 2023 00:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684394886; x=1686986886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAnyusDSWoWYoHl8ExRyZExxONPzTQENQiwitAy+Yow=;
        b=fGc0R2lAtf83BfVI6TvwcDj2bdZJTVJZqt4QHboCsxtKA0NQJfBqJqUxxJDCmQfDql
         VSahfgrHD3mnGLxahg7xk8X1YbExxhcUrrUW5INaUyBgR74rNCJBZqO9i0Sc93LZeXlF
         V8YFqCJzT/ulYdMA/4oqonmaURd3fn96NaHWKQkzNHj3o+Y+Yovm01/Is22QDfnv2Xxv
         +mxn/yVHYCknBOQFhLTivV5OP7w8wUsSB7npWly5VaKDSsoSIIKF+sK2JnVpJfhudJ0f
         55/vf049iXJOBbjzw+10+Xsfwj/gP5WpRR8lOyYqV0q++J2sJGDarPcLSHPr3S3epPbk
         CBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684394886; x=1686986886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YAnyusDSWoWYoHl8ExRyZExxONPzTQENQiwitAy+Yow=;
        b=STbDNHjMY1RK3+m/18cbdRpsy/hP4X6LHpvAV5mOOi9m1fhUDrrjsrtGwkTwX3DBqw
         lbv/ObWLCL6tNoW6OaZIYJY6tvPy+cokTLulQ9yiJyTa4FsYYNpruHI7VEO0kM1sV9Kf
         RQMsJOesYBUsiBeSECV8VO4lfDAyFq9cdaMTbqQlagEMLbcyALUgtZE42OrbF/c/r9In
         ncD27vlnQLmpnoZf6t4fAqSWFVSJVgHAtjO0J+YVGpARJCsPos2NDe0RKAGlS6vfAf8c
         135s1Sh1ZttHA2WJ/fHok3tscEWn3Ns0+wrKrc7/0DGT0e8OXnecNm1Qb9/9zoOBJVNX
         0RjA==
X-Gm-Message-State: AC+VfDyXxxBsKFocCQPn3vA+6BVVUf/8zOQENNIsqJ3V4axl/ddQ2wD5
	HHopQ0kDOAaK23WwZxBYxGi+6w==
X-Google-Smtp-Source: 
 ACHHUZ7A6J5q3lKRmQdoRE77X3+XkJxZpq6vCwemsAeRMtFaxdKJGUtSy7k0o4X3f46sQBZJ573Usw==
X-Received: by 2002:a17:907:96a1:b0:94f:236b:9e3a with SMTP id
 hd33-20020a17090796a100b0094f236b9e3amr4762971ejc.3.1684394886350;
        Thu, 18 May 2023 00:28:06 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a2b:c408:5834:f48e])
        by smtp.gmail.com with ESMTPSA id
 g17-20020a17090669d100b00965aee5be9asm594241ejs.170.2023.05.18.00.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 00:28:05 -0700 (PDT)
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
Subject: [RESEND PATCH 08/12] ASoC: codecs: rt712-sdca-dmic: do not store
 status in state container
Date: Thu, 18 May 2023 09:27:49 +0200
Message-Id: <20230518072753.7361-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230518072753.7361-1-krzysztof.kozlowski@linaro.org>
References: <20230518072753.7361-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7JNZMDQ72OXUZO4EDWYRSNUCDXOYMQCN
X-Message-ID-Hash: 7JNZMDQ72OXUZO4EDWYRSNUCDXOYMQCN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7JNZMDQ72OXUZO4EDWYRSNUCDXOYMQCN/>
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
 sound/soc/codecs/rt712-sdca-dmic.c | 5 +----
 sound/soc/codecs/rt712-sdca-dmic.h | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-dmic.c b/sound/soc/codecs/rt712-sdca-dmic.c
index 09807b6d6353..847198e6c07e 100644
--- a/sound/soc/codecs/rt712-sdca-dmic.c
+++ b/sound/soc/codecs/rt712-sdca-dmic.c
@@ -803,9 +803,6 @@ static int rt712_sdca_dmic_update_status(struct sdw_slave *slave,
 {
 	struct rt712_sdca_dmic_priv *rt712 = dev_get_drvdata(&slave->dev);
 
-	/* Update the status */
-	rt712->status = status;
-
 	if (status == SDW_SLAVE_UNATTACHED)
 		rt712->hw_init = false;
 
@@ -813,7 +810,7 @@ static int rt712_sdca_dmic_update_status(struct sdw_slave *slave,
 	 * Perform initialization only if slave status is present and
 	 * hw_init flag is false
 	 */
-	if (rt712->hw_init || rt712->status != SDW_SLAVE_ATTACHED)
+	if (rt712->hw_init || status != SDW_SLAVE_ATTACHED)
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
diff --git a/sound/soc/codecs/rt712-sdca-dmic.h b/sound/soc/codecs/rt712-sdca-dmic.h
index 74c29677c251..110154e74efe 100644
--- a/sound/soc/codecs/rt712-sdca-dmic.h
+++ b/sound/soc/codecs/rt712-sdca-dmic.h
@@ -16,7 +16,6 @@ struct  rt712_sdca_dmic_priv {
 	struct regmap *mbq_regmap;
 	struct snd_soc_component *component;
 	struct sdw_slave *slave;
-	enum sdw_slave_status status;
 	struct sdw_bus_params params;
 	bool hw_init;
 	bool first_hw_init;
-- 
2.34.1

