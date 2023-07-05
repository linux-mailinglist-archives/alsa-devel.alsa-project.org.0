Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F15D3748482
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 14:58:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01F347F1;
	Wed,  5 Jul 2023 14:57:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01F347F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688561912;
	bh=CBtQCsUGSp8mQ2kL3T5gFfwUd8AE4eU1+kB5VFYt8kc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=X2lFPS91YTI7BqZ1EzLxd7z5IVzCcv7CZIso+uNiZGNXe5ruSj6QGN0f+j9LxQCyJ
	 XpOj0XQ/LirCRVgy4ncrKZLleE/0K7ZjKvdd01fHTYVhUvK0YfdYrm6HuDQiErXpCg
	 COzQVQ61mqr7CqQFqCRI6i0QKYdwUGkXcZLfvxls=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77BBAF80124; Wed,  5 Jul 2023 14:57:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21FA8F80124;
	Wed,  5 Jul 2023 14:57:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D94EF80125; Wed,  5 Jul 2023 14:57:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6CFA7F800E4
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 14:57:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CFA7F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Npwz7cfc
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fa93d61d48so79032525e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 05 Jul 2023 05:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688561846; x=1691153846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xhg4Btd/0KybnmhVesqfMosrv9Aez9Q8GYSJ7Z38kYc=;
        b=Npwz7cfcZgmC0s2V6ezJBOFdy4P05NRAP4wOB0hnf08Cx3+flkWy/1N5uEYlx3AXT1
         3paPunOjWfJO30Lvj/A4owjC32Jk4fMUQ5FKxtW/43Y9yPSva/2jwLRFy/uKgDNvvCre
         D6Oebsi5p9u9DATB8WMm+4OCKjoSvZLkASmtEgaVykWt6yPublzxBxL9g/72jY8nPq4/
         uO+IqlKDtL8VO4AWCiGie2dpM/JHRH2HHcpEgrySVWCs6JylK/crCzIcJIxP7/WKbpXM
         +v/BFUHKADoIbw5JNt+9pU2HR/yhDScol9ZBRHFfuk/KaF8/VjG7UBdtr2KJsw3lq4Ya
         HlzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688561846; x=1691153846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhg4Btd/0KybnmhVesqfMosrv9Aez9Q8GYSJ7Z38kYc=;
        b=W51vX2doE/uOS7OFK/patDEMhXlGlNecxi4p+cjFwiwUi0cSZgcK94+4SHxGOQCPFJ
         2hMeK3ZUbQ0Hrj6OEulDnvgPaKmF7Khn6cGj+4v4CoRVdCOJxyCB/Zz9fUAvYmzfY+Rd
         V+BlgAUNFmGJ1lgbTmBVM5s1A1H/G+dWlJkVCkOOQb5v0pdjt7quis87Z0pJhZ3gsuFh
         lhLu6eNtgPsO0W7bjZ1Iu9Vis1yb/7go/kQguL81mX62Xxdx8rhTsaTb77tShWm26F4s
         YuzmF0zPFZNY3Na1cmnx0723rDJD/VZ7vpLGjoc/B0kp3kOGHJMxG2so5wcCCW38PMc1
         IQGw==
X-Gm-Message-State: AC+VfDxLGQzKxmjwqlfUrbl0b1yEgwlfAET7Qa8nQLatzH9rs7cj3P36
	OH56kND4Pz0Up46SiZTdm66Paw==
X-Google-Smtp-Source: 
 ACHHUZ5h1fIf4kmzcOsJi/+UT0HCUmr1gk3pOMIu5hkWvxLrSVetBvxtazlzvE/ayYYEUXK+sA76CA==
X-Received: by 2002:a1c:7903:0:b0:3fa:c3e8:901a with SMTP id
 l3-20020a1c7903000000b003fac3e8901amr13883895wme.25.1688561846413;
        Wed, 05 Jul 2023 05:57:26 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 y6-20020a7bcd86000000b003fbb346279dsm2100555wmj.38.2023.07.05.05.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 05:57:25 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] ASoC: codecs: wcd938x: fix dB range for HPHL and HPHR
Date: Wed,  5 Jul 2023 13:57:23 +0100
Message-Id: <20230705125723.40464-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QDPQ4BUVJKO57F5LM34ZBEWEZJIRY7Z4
X-Message-ID-Hash: QDPQ4BUVJKO57F5LM34ZBEWEZJIRY7Z4
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QDPQ4BUVJKO57F5LM34ZBEWEZJIRY7Z4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dB range for HPHL and HPHR gains are from +6dB to -30dB in steps of
1.5dB with register values range from 0 to 24.

Current code maps these dB ranges incorrectly, fix them to allow proper
volume setting.

Fixes: e8ba1e05bdc0("ASoC: codecs: wcd938x: add basic controls")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index faa15a5ed2c8..3a3360711f8f 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -210,7 +210,7 @@ struct wcd938x_priv {
 };
 
 static const SNDRV_CTL_TLVD_DECLARE_DB_MINMAX(ear_pa_gain, 600, -1800);
-static const SNDRV_CTL_TLVD_DECLARE_DB_MINMAX(line_gain, 600, -3000);
+static const DECLARE_TLV_DB_SCALE(line_gain, -3000, 150, -3000);
 static const SNDRV_CTL_TLVD_DECLARE_DB_MINMAX(analog_gain, 0, 3000);
 
 struct wcd938x_mbhc_zdet_param {
@@ -2655,8 +2655,8 @@ static const struct snd_kcontrol_new wcd938x_snd_controls[] = {
 		       wcd938x_get_swr_port, wcd938x_set_swr_port),
 	SOC_SINGLE_EXT("DSD_R Switch", WCD938X_DSD_R, 0, 1, 0,
 		       wcd938x_get_swr_port, wcd938x_set_swr_port),
-	SOC_SINGLE_TLV("HPHL Volume", WCD938X_HPH_L_EN, 0, 0x18, 0, line_gain),
-	SOC_SINGLE_TLV("HPHR Volume", WCD938X_HPH_R_EN, 0, 0x18, 0, line_gain),
+	SOC_SINGLE_TLV("HPHL Volume", WCD938X_HPH_L_EN, 0, 0x18, 1, line_gain),
+	SOC_SINGLE_TLV("HPHR Volume", WCD938X_HPH_R_EN, 0, 0x18, 1, line_gain),
 	WCD938X_EAR_PA_GAIN_TLV("EAR_PA Volume", WCD938X_ANA_EAR_COMPANDER_CTL,
 				2, 0x10, 0, ear_pa_gain),
 	SOC_SINGLE_EXT("ADC1 Switch", WCD938X_ADC1, 1, 1, 0,
-- 
2.25.1

