Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C90E70667B
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 13:18:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7F72207;
	Wed, 17 May 2023 13:17:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7F72207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684322300;
	bh=Y475XU+9ClN5OEj+mIHQ9mqPGMAfEGuJKydDrwCsByk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hsfTh2V6hEjYARBY+JAXxP9mq8tBtprPvGIp2+gv7TZXF7f+k49DDoFGLFBJ9VkGc
	 WbFyaMdvM+tE4/RALPjR3siT+Sc7Vrf+fVkyQbkc3bbnVAsABAezawcldfTuWmzcEv
	 Lc7SUuZXJe94O7AiaZ86e06qCr4vmgmIR9tntE6A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66699F805E1; Wed, 17 May 2023 13:15:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FD0DF805D3;
	Wed, 17 May 2023 13:15:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78E0DF80578; Wed, 17 May 2023 13:15:02 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A3EEF80544
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 13:14:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A3EEF80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Mqrza8r6
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-96652cb7673so93574666b.0
        for <alsa-devel@alsa-project.org>;
 Wed, 17 May 2023 04:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684322090; x=1686914090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikB2y5rvufm/ROET3UaPHVQf0uJXk4esoL2mDQIzzPA=;
        b=Mqrza8r6L1qVxSOY8tPU3HdOmEKLv1L4y3PLSmB1w5nETDTDauRdLQWLKSc70HZ800
         pi7A8pKDIp3UiLkPHkSm2Z9WKbHpPVQqowRRvDdLX9xaXmcZFAqbO+2DgbzQZo92DKPc
         mfGsvAWTr5zLhsgTVpPH5G7b95kh5eRGV/HhBRsi3O+NGuXyaGLl9tEVU7dTaQROQ9Un
         HBexjtOtDlBB+58I33xjm/oeXxfhsOTQgIc2wwvKbCqosGiLVZQQHsaMol4RliIown2f
         KuLWdNzxde/Dr78sqoTvF8zkY//R7v9P+iWX0ABe7GdxGBXLkAz92qty0kQ5+iiERX0c
         vNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684322090; x=1686914090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ikB2y5rvufm/ROET3UaPHVQf0uJXk4esoL2mDQIzzPA=;
        b=SUiFAjDTpWVN8tBSMvGqkAfeyR9GKHvainz/y9RFGKo/VjqX301gxtpDz3ehMRgPf/
         Xfd2qVv9hl9+9XDpCkxpbcbuYdArhEWz4UR0vCfwFMQ3AMv94lJQ5C/bWuxNpqEZjmL2
         OngbVJpTGBkhR4Ygker+pjKwMOnj/CqSF5y4ilsX3hlt3jt3CKBbTn1ADHSD/7jFeYbF
         ktMhmIAwzNhBdNc9e21Cq2aIqBE44vq9w0m8YQj7sTEEcbzn2SGR02ihd/ZgWu2FLNcx
         nv0SrRYNMmKiPn1DT1DoxBwBBvBZjPKAj8pyc4KIR2LJcWp+VBceyIukJvg08SDXLPfK
         jy4g==
X-Gm-Message-State: AC+VfDxRP7a47//lcX+gysQsstV/bCXxYJFuzGiime9phHxPdH2IGP8v
	mDunmzuC/sIVwwqsU5xhzIcgyw==
X-Google-Smtp-Source: 
 ACHHUZ77Po5iB686z2AKal+Svea6MuM/egkvm4vr7KEKPnMB5+2IdxYBbcnEdkJ1O2aYG7A3MTAXaQ==
X-Received: by 2002:a17:907:7fa8:b0:969:8d19:74 with SMTP id
 qk40-20020a1709077fa800b009698d190074mr35584944ejc.57.1684322090644;
        Wed, 17 May 2023 04:14:50 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id
 ml18-20020a170906cc1200b0094f124a37c4sm12326880ejb.18.2023.05.17.04.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 04:14:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 11/12] ASoC: codecs: rt715: do not store status in state
 container
Date: Wed, 17 May 2023 13:14:15 +0200
Message-Id: <20230517111416.424420-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230517111416.424420-1-krzysztof.kozlowski@linaro.org>
References: <20230517111416.424420-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GL64WWA7PHRPNMKEM2ZVXMCAIYLBU3WP
X-Message-ID-Hash: GL64WWA7PHRPNMKEM2ZVXMCAIYLBU3WP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GL64WWA7PHRPNMKEM2ZVXMCAIYLBU3WP/>
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
 sound/soc/codecs/rt715-sdw.c | 4 +---
 sound/soc/codecs/rt715.h     | 1 -
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt715-sdw.c b/sound/soc/codecs/rt715-sdw.c
index 5ffe9a00dfd8..6db87442b783 100644
--- a/sound/soc/codecs/rt715-sdw.c
+++ b/sound/soc/codecs/rt715-sdw.c
@@ -417,13 +417,11 @@ static int rt715_update_status(struct sdw_slave *slave,
 {
 	struct rt715_priv *rt715 = dev_get_drvdata(&slave->dev);
 
-	/* Update the status */
-	rt715->status = status;
 	/*
 	 * Perform initialization only if slave status is present and
 	 * hw_init flag is false
 	 */
-	if (rt715->hw_init || rt715->status != SDW_SLAVE_ATTACHED)
+	if (rt715->hw_init || status != SDW_SLAVE_ATTACHED)
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
diff --git a/sound/soc/codecs/rt715.h b/sound/soc/codecs/rt715.h
index 17a8d041c1c3..12a0ae656d09 100644
--- a/sound/soc/codecs/rt715.h
+++ b/sound/soc/codecs/rt715.h
@@ -18,7 +18,6 @@ struct rt715_priv {
 	int dbg_nid;
 	int dbg_vid;
 	int dbg_payload;
-	enum sdw_slave_status status;
 	struct sdw_bus_params params;
 	bool hw_init;
 	bool first_hw_init;
-- 
2.34.1

