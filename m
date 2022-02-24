Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB434C2AB3
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 12:19:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB2661838;
	Thu, 24 Feb 2022 12:19:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB2661838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645701593;
	bh=g4hY5B5uYPkp+dRtTHSyZy9GYAPQNAC2Im1pVYuhAHA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QniUJFJfRgo+R03H/F0pKe/1qKHGkKGg1T6OpJba64bcDdYeYAR+Tp4GUNkL+4dgd
	 VQBubEaM5mem6nwgzT4Mrxp0N4YxqRnIzXnD/HHO0jBmngm3ZQXC9PHvcgRWt92qGU
	 ew7Jb2XXewaSSreqJ4BZs0fAwGof55PV8t1g6EP0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D16BEF80525;
	Thu, 24 Feb 2022 12:17:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34A5CF8051F; Thu, 24 Feb 2022 12:17:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33C1EF800B6
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 12:17:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33C1EF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="s2cKWb6E"
Received: by mail-wm1-x330.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so1023664wmp.5
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 03:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9GMeWI1tNkbi4OC/4dfJqIUQ1pnya35dc/9sZ3BiKI4=;
 b=s2cKWb6EDkhhedxiJav26MCdH3kvZL4oXoyUzVMDonmIlmWO8HCeGGC/4VuT+12jqv
 Xx+8Gkx3sK87+vHG1TQp6IZ1deqaUQIJCfaqJSjOXZqK1TG8CH11fJnor5dYAgAE8YyV
 H5sP0w3jdVZNugAAyib2SRUfEQOrcGRRXkIIBphxMDA3SLNEd8Jn8h7B+IX/kMMe46xr
 qt4551B+yXJMx+Kg6Jy+WFujN8b3Qv5z3Lx6bpcaNoSLPPSnbSdIjxjMCtof6ehq6F1D
 AVIP7oRMiFnh9E1I4/V6zlZy1HvfW4dhn2EzQ3A+wY801E4gUs6gHyCCPG5vhMUVEG6e
 YydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9GMeWI1tNkbi4OC/4dfJqIUQ1pnya35dc/9sZ3BiKI4=;
 b=U1c8zMMdkKPNwn3lFTq64gWflwOXjsx6Sxx79gn5J9lDi5IkbxyTkrQHw4h/9xjkOn
 nwmJcXbvqEkfEo28BGQqDINDO4SQzfiyc/ZR3cNLodPrVKoRnISwzieQX9i9a0x1NXou
 Ii+axPIr/hHI7alAeSbFzR9OO2vcUHmu6gqfJiIh0inoo80pwrJCelfKSPIqArwlZ+I+
 z7kgt8puPGcIIi6QCI4hfvg0so0CmG5vQNGZtBKoSrRVhDNxC/6D7Qzog6CXv39PY40e
 u5Y/LPm4NNzcNNteiwCXSUWuJ2S2bFRRvnSLEPdu+CvOixztSpG8KeO1jOaF6hj3PKqr
 udfQ==
X-Gm-Message-State: AOAM531qX1B8dMQWyEoxmBEE+dvNPT7y+oNVudNNRPUfYMsG6SmMcHJp
 UZA99BplvH/9bDPi0/DC8WWOAg==
X-Google-Smtp-Source: ABdhPJwOYHMnZNvU9zDMlws3RLTrnptEO39DLfuc1HloQdZsLISrYC/aqj4jFlONbQulW1YEZbcU0Q==
X-Received: by 2002:a05:600c:4f54:b0:37b:fe6a:ea9c with SMTP id
 m20-20020a05600c4f5400b0037bfe6aea9cmr1900585wmq.169.1645701450266; 
 Thu, 24 Feb 2022 03:17:30 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id t4sm2245737wmj.10.2022.02.24.03.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 03:17:29 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 07/16] ASoC: codecs: wsa-macro: setup soundwire clks
 correctly
Date: Thu, 24 Feb 2022 11:17:09 +0000
Message-Id: <20220224111718.6264-8-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220224111718.6264-1-srinivas.kandagatla@linaro.org>
References: <20220224111718.6264-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 quic_srivasam@quicinc.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

For SoundWire Frame sync to be generated correctly we need both MCLK
and MCLKx2 (npl). Without pm runtime enabled these two clocks will remain on,
however after adding pm runtime support its possible that NPl clock could be
turned off even when SoundWire controller is active.

Fix this by enabling mclk and npl clk when SoundWire clks are enabled.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index ac5f94fff0a9..2586d6350f20 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2260,6 +2260,13 @@ static int wsa_swrm_clock(struct wsa_macro *wsa, bool enable)
 	struct regmap *regmap = wsa->regmap;
 
 	if (enable) {
+		int ret;
+
+		ret = clk_prepare_enable(wsa->mclk);
+		if (ret) {
+			dev_err(wsa->dev, "failed to enable mclk\n");
+			return ret;
+		}
 		wsa_macro_mclk_enable(wsa, true);
 
 		/* reset swr ip */
@@ -2284,6 +2291,7 @@ static int wsa_swrm_clock(struct wsa_macro *wsa, bool enable)
 		regmap_update_bits(regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
 				   CDC_WSA_SWR_CLK_EN_MASK, 0);
 		wsa_macro_mclk_enable(wsa, false);
+		clk_disable_unprepare(wsa->mclk);
 	}
 
 	return 0;
@@ -2354,7 +2362,7 @@ static int wsa_macro_register_mclk_output(struct wsa_macro *wsa)
 	struct clk_init_data init;
 	int ret;
 
-	parent_clk_name = __clk_get_name(wsa->mclk);
+	parent_clk_name = __clk_get_name(wsa->npl);
 
 	init.name = clk_name;
 	init.ops = &swclk_gate_ops;
-- 
2.21.0

