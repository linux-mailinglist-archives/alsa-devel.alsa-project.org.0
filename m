Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0298270668F
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 13:20:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5274583E;
	Wed, 17 May 2023 13:19:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5274583E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684322441;
	bh=IakYSP4Uh17qdBtq00fNOlaLb30g+Dofuda+Er60KeY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bInFqlHIj5jTaw31TypVt2jYV73gawctkefb8aCs9TuWtZBMPOe3q89VaiSa5Ugq4
	 Uv9e+ozITc6SLUhLjmasTmBGLRDkvKtFOIhwz0+TLJrlKs8xRTIiDCYzaHWZN5FQbM
	 QMQzNCZXV2nGfmXNPmp4uf55mzTfEk/x8nRR5exo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D5C2F805AC; Wed, 17 May 2023 13:17:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D71FAF80580;
	Wed, 17 May 2023 13:17:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F81AF8025A; Wed, 17 May 2023 13:17:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EF19BF8053D
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 13:14:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF19BF8053D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=hIdANJjD
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-965cc5170bdso94618266b.2
        for <alsa-devel@alsa-project.org>;
 Wed, 17 May 2023 04:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684322085; x=1686914085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=orOtZCSMdy0LOUQiF3GDNtFNR/PCT+bEnkKVYg6k6GY=;
        b=hIdANJjDwebuLejzh1gdqt+267DcEVSuEXFFfZttIJwmQVKZZhGt5sC81zWStiXcRj
         VkXD93TUaA6p5/xnMn+t1KsA2k9XWbfzDLmphIbNyQCMePhqmJwZ0QIctyh5cwm8q4wy
         jpGo6s5Hd6p6eKRAO0ltyCLM8otD/mS7+HaUb4FFNTthYyMbM30oBOfYkgfq+MXolgz5
         OrfMgBCLybw5ytMdkTg+It68qT+icGoIHEi0KynM6uNo5zrHoHcKNS540jcbGu4+XgBj
         KS6QniH0sv0gGfn4aAtNBHezfiPEI5b6LpAL/hI7ksQoRcMW9Z2nBnGJkQPfI8i5ovSr
         ydYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684322085; x=1686914085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=orOtZCSMdy0LOUQiF3GDNtFNR/PCT+bEnkKVYg6k6GY=;
        b=ADYQctc6rHvZtiYTA8rNZNPGekH3AgfdD7EEEt0V0j6IKBv01fy8CFS3PI2EaydaKj
         8J9gibSuNaHZDy+FGCvIA2Q0g2RDkBOv4Sxtyk72Mzc3aN34v2hhpeG+1J/DnbPNxZvV
         EHxZNUsGtQFmGB7WoE+6zF/aRUwsoxU729plGawPJ8/kRR4K7ykqMGnPtMoE/ui4JX5E
         nsGq2YgB+tVR9Mr7/9N2dtB1UfKx5TvAMA6pb+GqakAlD4/oQR048k8XwmAGTfO4eIOL
         uCuI1Yszy2Jh5mF0XUPPTh+5Lkkj7Ep1Gs1wjkFD1vh1tG7fWMWkjbgUVBflCv4rYoDo
         xOLA==
X-Gm-Message-State: AC+VfDxrXlaV99vYgm705Wt5i204Q/OST3/hvkeY1tyEh/pLxdaWRBYD
	5Z1+B3CbbNWemniegwm8kpGYKw==
X-Google-Smtp-Source: 
 ACHHUZ59InEiEFagluPob/jRCVm/OnOiFjG4/CRAJ+B+r/pybagONxCqHhmhRqrqagLoPDquLlcEYA==
X-Received: by 2002:a17:907:7e86:b0:969:b2e2:4f3b with SMTP id
 qb6-20020a1709077e8600b00969b2e24f3bmr31186355ejc.51.1684322085181;
        Wed, 17 May 2023 04:14:45 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id
 ml18-20020a170906cc1200b0094f124a37c4sm12326880ejb.18.2023.05.17.04.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 04:14:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 07/12] ASoC: codecs: rt711: do not store status in state
 container
Date: Wed, 17 May 2023 13:14:11 +0200
Message-Id: <20230517111416.424420-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230517111416.424420-1-krzysztof.kozlowski@linaro.org>
References: <20230517111416.424420-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QFH4IIPZDYX7RNLL6H56SWG5L6RLTEGR
X-Message-ID-Hash: QFH4IIPZDYX7RNLL6H56SWG5L6RLTEGR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QFH4IIPZDYX7RNLL6H56SWG5L6RLTEGR/>
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
---
 sound/soc/codecs/rt711-sdw.c | 5 +----
 sound/soc/codecs/rt711.h     | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index 4fe68bcf2a7c..b8ed3c6236d8 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -319,9 +319,6 @@ static int rt711_update_status(struct sdw_slave *slave,
 {
 	struct rt711_priv *rt711 = dev_get_drvdata(&slave->dev);
 
-	/* Update the status */
-	rt711->status = status;
-
 	if (status == SDW_SLAVE_UNATTACHED)
 		rt711->hw_init = false;
 
@@ -329,7 +326,7 @@ static int rt711_update_status(struct sdw_slave *slave,
 	 * Perform initialization only if slave status is present and
 	 * hw_init flag is false
 	 */
-	if (rt711->hw_init || rt711->status != SDW_SLAVE_ATTACHED)
+	if (rt711->hw_init || status != SDW_SLAVE_ATTACHED)
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
diff --git a/sound/soc/codecs/rt711.h b/sound/soc/codecs/rt711.h
index b31351f11df9..491e357191f9 100644
--- a/sound/soc/codecs/rt711.h
+++ b/sound/soc/codecs/rt711.h
@@ -15,7 +15,6 @@ struct  rt711_priv {
 	struct regmap *sdw_regmap;
 	struct snd_soc_component *component;
 	struct sdw_slave *slave;
-	enum sdw_slave_status status;
 	struct sdw_bus_params params;
 	bool hw_init;
 	bool first_hw_init;
-- 
2.34.1

