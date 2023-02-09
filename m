Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6386908D5
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 13:30:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 358C8E7F;
	Thu,  9 Feb 2023 13:29:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 358C8E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675945845;
	bh=M0gcUSO2zIaEIwds3waAjnSZncSuOEVNUt/tF9vmCSI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ID2pruVHxvzGsJoYA+42l1LTwPUuA6JGyoViuLnomGr6f0tGVqPQZXF/re+wQTBQ2
	 NbP0xRTplzfztdOU7/77No7rarTO6ngJd8DfI57cP5SH+xr8sDAo3JRf5WCnADDGZK
	 XRQXAi73/umvDZp/yIMtuPUprPBEHuZsPlrc2Q7g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 448BEF80552;
	Thu,  9 Feb 2023 13:28:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0AB44F8053B; Thu,  9 Feb 2023 13:28:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 574B2F80269
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 13:28:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 574B2F80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=G7A7Y63P
Received: by mail-wr1-x42b.google.com with SMTP id j23so1644735wra.0
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 04:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wrxQA0MT8PveUUiIj83RXA4CfwfsCaWsptgakRSOp4=;
        b=G7A7Y63Pa/o5zi3dcrirqZ5NuH8B040ZdYN9DhUJByd+Hhiiv8ctVZ3MC1y7llq/uO
         HMY9oArgm8x8oOqcHx2GQPd8noLxbflJEaj3MJrM7NLA3y5m7EgstDKSP7bdKdLssyER
         6XHp6wlCExu+KLTi4vkq9oX39jkWwjxzm45TZt0wwaU8SgrwgGS7VrQgiZSph9S/ZQs+
         tfHlpu+Gihil+1DOh+6ZgKcBuP1LvfhbFMl1nFK8jpqXDSKPTMRzj+vwRrJiBz2ICSgW
         dO0uRF6n+MgnWHjM8hsgujWZhMy378XvbLg5cWAn0suEpWhxHNoBShzR9W+59oHcfr59
         V3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wrxQA0MT8PveUUiIj83RXA4CfwfsCaWsptgakRSOp4=;
        b=3yO2exwiYCTocqMuluh5DAufXx2uvjGDv++FXOrO0oMKCpPmKJHIf4291FMqdohAYe
         l+pGohArbJrek3ljPtBEVj+MJfcs7lxlUhZtfCvOggyC40hEjawovNly9VyJz9UJVVLk
         k0Y8kspweB2GiGDI4vuaWw54iIsBPFpxx5kmwXzmqjTDSiijDbXjUFvEt9jE9hkkI0Kj
         N9kCMNQoUPH5SMFRCGUf5TtXN6TYK2ox6v9Obt7FOh2LEYBshD5zFv9DF7J4Y9/zFEZE
         vyYAy3l5MwsW5r4JUXwsFqQcollMWc91XtZoF0XopRCQghZ3wdoQWlJS9RdGD1ezweeo
         eN7Q==
X-Gm-Message-State: AO0yUKU4CzDVOn/NBntDuE/OahM5rJYQv0rTuXvnXhwDAHtyXDQB3iSP
	u8JOG9nhiICU3E1oayYIC9wJkA==
X-Google-Smtp-Source: 
 AK7set8h/z/FCq4f7FbIxLwOO/bkyaNdkaxbyR9ezAhEOd+zfvRkunaEBG4oTCzgK8z3dqQj8FS/hA==
X-Received: by 2002:adf:fb05:0:b0:2bf:b199:c7ef with SMTP id
 c5-20020adffb05000000b002bfb199c7efmr9814157wrr.12.1675945702809;
        Thu, 09 Feb 2023 04:28:22 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 o8-20020a5d58c8000000b002c3f0a4ce98sm1134763wrf.98.2023.02.09.04.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 04:28:22 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 6/8] ASoC: codecs: lpass: fix incorrect mclk rate
Date: Thu,  9 Feb 2023 12:28:04 +0000
Message-Id: <20230209122806.18923-7-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230209122806.18923-1-srinivas.kandagatla@linaro.org>
References: <20230209122806.18923-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: N5P23U3N2O2L2C7TS3PAYA3ZZSSOKMBO
X-Message-ID-Hash: N5P23U3N2O2L2C7TS3PAYA3ZZSSOKMBO
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, steev@kali.org, johan+linaro@kernel.org,
 quic_bjorande@quicinc.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N5P23U3N2O2L2C7TS3PAYA3ZZSSOKMBO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For some reason we ended up with incorrect mclk rate which should be
1920000 instead of 96000, So far we were getting lucky as the same clk
is set to 192000 by wsa and va macro. This issue is discovered when there
is no wsa macro active and only rx or tx path is tested.
Fix this by setting correct rate.

Fixes: c39667ddcfc5 ("ASoC: codecs: lpass-tx-macro: add support for lpass tx macro")
Fixes: af3d54b99764 ("ASoC: codecs: lpass-rx-macro: add support for lpass rx macro")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 4 ++--
 sound/soc/codecs/lpass-tx-macro.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index dd6970d5eb8d..8621cfabcf5b 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -366,7 +366,7 @@
 #define CDC_RX_DSD1_CFG2			(0x0F8C)
 #define RX_MAX_OFFSET				(0x0F8C)
 
-#define MCLK_FREQ		9600000
+#define MCLK_FREQ		19200000
 
 #define RX_MACRO_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
 			SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
@@ -3579,7 +3579,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 
 	/* set MCLK and NPL rates */
 	clk_set_rate(rx->mclk, MCLK_FREQ);
-	clk_set_rate(rx->npl, 2 * MCLK_FREQ);
+	clk_set_rate(rx->npl, MCLK_FREQ);
 
 	ret = clk_prepare_enable(rx->macro);
 	if (ret)
diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index b9475ba55e20..2449a2df66df 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -203,7 +203,7 @@
 #define TX_MACRO_AMIC_UNMUTE_DELAY_MS	100
 #define TX_MACRO_DMIC_HPF_DELAY_MS	300
 #define TX_MACRO_AMIC_HPF_DELAY_MS	300
-#define MCLK_FREQ		9600000
+#define MCLK_FREQ		19200000
 
 enum {
 	TX_MACRO_AIF_INVALID = 0,
@@ -2014,7 +2014,7 @@ static int tx_macro_probe(struct platform_device *pdev)
 
 	/* set MCLK and NPL rates */
 	clk_set_rate(tx->mclk, MCLK_FREQ);
-	clk_set_rate(tx->npl, 2 * MCLK_FREQ);
+	clk_set_rate(tx->npl, MCLK_FREQ);
 
 	ret = clk_prepare_enable(tx->macro);
 	if (ret)
-- 
2.21.0

