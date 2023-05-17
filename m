Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DDB70666F
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 13:16:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBC721F3;
	Wed, 17 May 2023 13:15:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBC721F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684322196;
	bh=tzh5dXFEpZxgW78Np01x+PKGa8FiJTOjSub2GDhH/8c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XaftE0OftcxEHGkqGn/4ymnXE52cntCOpf+MC4napQGaFME+xyx78oYGyV1r1N5Y2
	 ZGioCiIRAWAauDt4tepIMp8zL8Q8JbH5wjQO/f4vFoXW4BuO/yGRHBaC9BTzX1SklU
	 UDUAqznED5paYqJEhnb7wahPkr08gYmr98JEGK/Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7041F80558; Wed, 17 May 2023 13:14:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BEE0FF80558;
	Wed, 17 May 2023 13:14:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 913C8F80548; Wed, 17 May 2023 13:14:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4DFD0F80272
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 13:14:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DFD0F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZZNYO7Tc
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-965f7bdab6bso111880466b.3
        for <alsa-devel@alsa-project.org>;
 Wed, 17 May 2023 04:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684322081; x=1686914081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=if7YQ3Jqyx8UU5QrJc7rocl2hzsm+T3skIrYgPJcbZ8=;
        b=ZZNYO7TcWQf/4w4gaLWDpyEDeka0OZxVnDIc5sRFsbyL/9iZbbCbx8vZeGO60WRFhB
         YLphCf2UBV/33sliiaI7pZOZcIbc4EdrzIGyc1D2yJtr5YqERyrQU6BHQw7geeHsJMgi
         A+7VlGTrw60J1oVPDJM1snYMD83sN+QavQAzljMoYOar3YRW+z75gZmjxEhfoGggEpyk
         iRtTJBOWA3sqG0ZOyMgr1A9JmnQySodh9VbOmIl2ePjKQol4vaxxWXB2+jg+lFNtGEpC
         P0iYa3Fh1tOvll/kwkHI+dcf6CvViL7HlLsqo05a+Pd7MhA4g2mCWbXJlRTm80zUD3yL
         zezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684322081; x=1686914081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=if7YQ3Jqyx8UU5QrJc7rocl2hzsm+T3skIrYgPJcbZ8=;
        b=MGYm+exnp+IrqAMvmrqcL6Y4WqJ8/BBtbDB9DfM6LJhTxrmnGcDkFTTvd0dBewS3y3
         hHKMkmlPhvRhL+YSQlV8UaazmnqpV2bSPy9VRbUSbhBHFMMa4rtKpnPJbgtvp5pPzem9
         C02r7vvfkfALy21Xnex0ew5KDrSGmQpZAd2601JlOjZz8XtsiFQj2ikDkawHQYfahf92
         ZKa6syKRVlOf3tuE6tbd9VEzPRZvzfOeAJ88xafAZpET/kk3VG5s7Z78443zcVTfAWhF
         hJj/Ie6uW9mXLpeANnyRzeYSEK8+HZCXgJeEjVFRKArtpZ5uWszE2BICDwb9rXDzvhyr
         hdRw==
X-Gm-Message-State: AC+VfDxavvB4/i3QHb9C1zPnkPKD6pJdzCYpAQcIW5+IfdGCsZnr+qxm
	NKyQPteo47E4PjnrwtUqaZMW8A==
X-Google-Smtp-Source: 
 ACHHUZ5y2fv3RY686++601FfyO2aihA2Vrj8kltsyQOYUSLWJ+uJ9GBrL9eipsMCxlpfhVJxYk99QA==
X-Received: by 2002:a17:906:5d11:b0:96f:181b:87da with SMTP id
 g17-20020a1709065d1100b0096f181b87damr66787ejt.69.1684322081001;
        Wed, 17 May 2023 04:14:41 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id
 ml18-20020a170906cc1200b0094f124a37c4sm12326880ejb.18.2023.05.17.04.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 04:14:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 03/12] ASoC: codecs: rt1318: do not store status in state
 container
Date: Wed, 17 May 2023 13:14:07 +0200
Message-Id: <20230517111416.424420-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230517111416.424420-1-krzysztof.kozlowski@linaro.org>
References: <20230517111416.424420-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2YFNH3YUNMPUORNNQDY46D2ZSTAILQ2B
X-Message-ID-Hash: 2YFNH3YUNMPUORNNQDY46D2ZSTAILQ2B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2YFNH3YUNMPUORNNQDY46D2ZSTAILQ2B/>
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

