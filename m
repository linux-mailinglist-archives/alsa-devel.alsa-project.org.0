Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 547E0706679
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 13:18:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 876D91FC;
	Wed, 17 May 2023 13:17:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 876D91FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684322279;
	bh=FiYgNgYvzQZHBTsYkz9CR3MzXtWoGGqaxLSPfuum1Ss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iiNBsAStrx8RnZBxYM90CqXjyeZ6JXTeEL3uYMU2JVjQ28ONK6YpnHQ7eg5Ow2XYq
	 3eVOpDTJP24GKi0AMiTHjLL3G/au8X/337ck0sRiLaEQLCFPd6cEHq6x2Che6GL2dG
	 qPWFbNZs2g5kkLoK3x6vAChjkpXIgJX46xO7h+Wc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74593F805C6; Wed, 17 May 2023 13:15:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A18C9F805C3;
	Wed, 17 May 2023 13:15:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0B94F80570; Wed, 17 May 2023 13:14:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 63625F8016D
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 13:14:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63625F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=uMpMaqG1
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-510bcd2d6b8so5692288a12.0
        for <alsa-devel@alsa-project.org>;
 Wed, 17 May 2023 04:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684322092; x=1686914092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnIEpqHICz7MCR44hDCQrdJI2TjC+iEi+weDD/DiHgQ=;
        b=uMpMaqG1DqCWwx1hCI5PuOhkim7/TDAijWwMpe1ydZKEw+qIhizYVg/cft4VQapzD4
         vzRLPboKiuQD0ZoY9vRl7zLw4E7JgW6k5CzgJIlwjvUz6TVW1XPRsfFF2wWQ4R14/pZi
         pAn7ChTywYn6exjMI1vNn5Ih0jSFSXn7AgpetOMZhQr7x0kzU1k+kk9zfhRC/JIaArDl
         SvoXQkKGfjFzJnPROvYxvC77bUGONoLXl+YQnBK7TWVdHGzUMY0mmb10gDIlZkXpNXgc
         VmvfNO4QTLaSiJPS+ROPLbAm2awcyFtVjD0nDsFHebUVzUYXb0H8js0WQ+bS39DRONlF
         zj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684322092; x=1686914092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VnIEpqHICz7MCR44hDCQrdJI2TjC+iEi+weDD/DiHgQ=;
        b=VTh02Bo/lgwmBzkL1zRLuAwyOjGy2tkckB0sSi2hH6sfWMyYiEHg2U6ql8Z2q3DpD3
         aAREjIOckbZglqGqYVBw2JyM0Ilh4nq70pNzuoWP4v1G3fAtdA1Vh89IvN6Nk0BzXFVk
         j/L1uDAa+1Y2ORza3yfLAhzA+1Wxjd3+IMGJbcAWAoG2RymLmtW8pOpzR/EXfchb6j3J
         ND/exWBOKfWSGtCl4BG4y6yYsU02xgnmsyx8Pls3ffXxW6zuBORhzi4oC+E7mBzxnoQk
         EAy36Kmm8+hY7E6tfzKUJAH8trY6UF4d0zNtqzxvJdUOaeNrwxM1QGrX9QX/Tjtv6EaW
         G8Gg==
X-Gm-Message-State: AC+VfDy+/7paTtYtpX0lfj4sNt/59kIcFU+UmJx8K15QL6MuCtbrVH6h
	up8daMJEDB+q3r/wZQsTzfYLug==
X-Google-Smtp-Source: 
 ACHHUZ5o/6icRslOMBgpWvrVIHAHLvuvr5xOTVdS5zygNzE9ImG9M96dMpU+Dv/r1s/UxbSnU5g9IA==
X-Received: by 2002:a17:907:6d25:b0:965:d7c7:24db with SMTP id
 sa37-20020a1709076d2500b00965d7c724dbmr1640573ejc.32.1684322091870;
        Wed, 17 May 2023 04:14:51 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id
 ml18-20020a170906cc1200b0094f124a37c4sm12326880ejb.18.2023.05.17.04.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 04:14:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 12/12] ASoC: codecs: rt722-sdca: do not store status in state
 container
Date: Wed, 17 May 2023 13:14:16 +0200
Message-Id: <20230517111416.424420-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230517111416.424420-1-krzysztof.kozlowski@linaro.org>
References: <20230517111416.424420-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ENT44KNLC4ZJI55TTMW66L45ZAJ3OWCS
X-Message-ID-Hash: ENT44KNLC4ZJI55TTMW66L45ZAJ3OWCS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ENT44KNLC4ZJI55TTMW66L45ZAJ3OWCS/>
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

