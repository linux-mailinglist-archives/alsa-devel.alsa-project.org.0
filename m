Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F25F8707AE2
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 09:30:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BAE7826;
	Thu, 18 May 2023 09:29:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BAE7826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684395045;
	bh=9X62j4kwqih0Ta5q9aF+pncNuZKECt1KZ7b6uFl28DA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vGkJGNiSZZBnCFXbDFQZ90Y4Eqf/1lGXJWjnADK68wYFxlGxYUOlHCKJftLWlhPpg
	 eynnS842E7sUJMyOx3fKF65oDkV3RGHKbA6OS9YdBa/efWLblZHnGAUFk9vMrT7IY7
	 s2fOGqz/CjxP4eQZPziPfbJeCei1Nhn/3hTQWYlM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB629F805A9; Thu, 18 May 2023 09:28:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4CC2F805A9;
	Thu, 18 May 2023 09:28:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F766F80567; Thu, 18 May 2023 09:28:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4055BF802E8
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 09:28:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4055BF802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ryT3oII2
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-965b8a969b3so179811466b.1
        for <alsa-devel@alsa-project.org>;
 Thu, 18 May 2023 00:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684394884; x=1686986884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXL5o5qPvph6Jym30uHyOqMAZEOM4W+jtVScVxTiDlk=;
        b=ryT3oII2qDSHvEnNd8R3Sxowcji9SoTEbJkcGp19IIs+FWqR5+MsE+p0x5qh15PDQd
         i6kTbi07i9WT+RjRbfYWccwFP297hTr1IW9+vIW4y4ldZsySI2GacVMRsOWHWD8vRcXw
         fCCnIuBKoI3pQB7+fpAmk5rlAASAmGvL26SC0XR8c6iX5K3N3H6oIawvpL+EHYoS3M5v
         HIx3FfeqyJLxmgdWEtMNZpAKwrdmlAmTdwGVSFpHRDWy8/1qpho/tf2ePrHktnIReFPK
         3viszkD0I3ZkFL5h9H4v05K/ZzLF1WRU3TmaQZb8h16t18DKTxcZ8XTnXie3BvMdrFJf
         PcHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684394884; x=1686986884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fXL5o5qPvph6Jym30uHyOqMAZEOM4W+jtVScVxTiDlk=;
        b=kRH+LpbM36HG4oiCFKJrDG8yquT1/wwN2P3B+iWBlfEC7dDHm0HY3EfS4ZirT+jBKB
         brQAQadTtjgmXE2SoaVS3x+7M+QjcBpbQ5Uhi/ysh4wdU3/ixesjfQG5zfzdLnoJpuaO
         zR8bW5EgO/uVVWmZAptouM6d1i1jQMmM13bayDCe2O8MYGoaLmhJi5PbDSxnSZ0ePBjI
         3d3rRGxJUFn07VpS/uFhGg4XGcr8wyCt/98oKLQxjTukWF6wZ3g0myTgkeIOlohVgNXi
         bjSKg9R7XYCi6Y6uRg2XfEm65DNhnaFMhYF02fy7nOuWVNhmRKtQ9ezQekyC/mzEQCmO
         LhJQ==
X-Gm-Message-State: AC+VfDwbVhbDGJdfNu5FaJlIqY9iLpr8evjbbIMrXhjOWL3BgO8a4uwU
	/E6zOAnnVjD+qCbh772kDufv5Q==
X-Google-Smtp-Source: 
 ACHHUZ6jvtLDiIknXfnlrRB0KFzN9p8chuhdTxU60B7h54mon8DHKl9rh8r1GsMm+rETremULB/ksA==
X-Received: by 2002:a17:907:3d93:b0:94a:4739:bed9 with SMTP id
 he19-20020a1709073d9300b0094a4739bed9mr5233414ejc.13.1684394883911;
        Thu, 18 May 2023 00:28:03 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a2b:c408:5834:f48e])
        by smtp.gmail.com with ESMTPSA id
 g17-20020a17090669d100b00965aee5be9asm594241ejs.170.2023.05.18.00.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 00:28:03 -0700 (PDT)
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
Subject: [RESEND PATCH 06/12] ASoC: codecs: rt711-sdca: do not store status in
 state container
Date: Thu, 18 May 2023 09:27:47 +0200
Message-Id: <20230518072753.7361-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230518072753.7361-1-krzysztof.kozlowski@linaro.org>
References: <20230518072753.7361-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QVMTSWSQ5DDMPKWS3W5AIMQS7WE4ESOE
X-Message-ID-Hash: QVMTSWSQ5DDMPKWS3W5AIMQS7WE4ESOE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QVMTSWSQ5DDMPKWS3W5AIMQS7WE4ESOE/>
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
 sound/soc/codecs/rt711-sdca-sdw.c | 5 +----
 sound/soc/codecs/rt711-sdca.h     | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index 51f3335343e0..2c5eb28259dc 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -143,9 +143,6 @@ static int rt711_sdca_update_status(struct sdw_slave *slave,
 {
 	struct rt711_sdca_priv *rt711 = dev_get_drvdata(&slave->dev);
 
-	/* Update the status */
-	rt711->status = status;
-
 	if (status == SDW_SLAVE_UNATTACHED)
 		rt711->hw_init = false;
 
@@ -168,7 +165,7 @@ static int rt711_sdca_update_status(struct sdw_slave *slave,
 	 * Perform initialization only if slave status is present and
 	 * hw_init flag is false
 	 */
-	if (rt711->hw_init || rt711->status != SDW_SLAVE_ATTACHED)
+	if (rt711->hw_init || status != SDW_SLAVE_ATTACHED)
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
diff --git a/sound/soc/codecs/rt711-sdca.h b/sound/soc/codecs/rt711-sdca.h
index 22076f268577..11d421e8ab2b 100644
--- a/sound/soc/codecs/rt711-sdca.h
+++ b/sound/soc/codecs/rt711-sdca.h
@@ -19,7 +19,6 @@ struct  rt711_sdca_priv {
 	struct regmap *regmap, *mbq_regmap;
 	struct snd_soc_component *component;
 	struct sdw_slave *slave;
-	enum sdw_slave_status status;
 	struct sdw_bus_params params;
 	bool hw_init;
 	bool first_hw_init;
-- 
2.34.1

