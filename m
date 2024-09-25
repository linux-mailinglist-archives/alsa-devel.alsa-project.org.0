Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6971698BC34
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 14:37:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CC34DF8;
	Tue,  1 Oct 2024 14:37:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CC34DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727786248;
	bh=vcbtUAz7yhwWjWdeSyDPvePJuJQCbBjXfWfwU0OxtHI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gm/2mxZvi3ye9cX1GWgPgLf250F3K+ozuCMfW49sy6KfpWfHF/VZy33ewS/dWmwit
	 9HfNq8KlF54vfgxzxmhjQUWciIeJNPbk4BpCy7qroeU343Ptoed9rzVe66Fj8L8KGk
	 q+VGa4o2z8fS5dFBsICLMFDipL7JRCOVF3YvYmr4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D45AF806B5; Tue,  1 Oct 2024 14:35:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DA69F806B5;
	Tue,  1 Oct 2024 14:35:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 918DDF8047C; Wed, 25 Sep 2024 06:38:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B3092F8010B
	for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2024 06:38:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3092F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=dhnJ9F3M
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a8a7b1c2f2bso1026136166b.0
        for <alsa-devel@alsa-project.org>;
 Tue, 24 Sep 2024 21:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727239106; x=1727843906;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D/oxZoO71PQ5m5Ow+SV5/SV/jvpv3lxQQXCYtby61Bc=;
        b=dhnJ9F3MQogCigSWSXqeLPWqfUgMbEHxjrVe10JiUq/R6NkDrwY+73rkxJCnG5nnov
         wIOD7SCW2RqkDGjcnxVImR1zxGvXrB2RQPUjDsGh6yr+mG8Ab+hxluyJISBcKvfWq/+G
         9pmsuP3fL56sSbiLC5IhpxcNntF1ofwNeXug8anuyCIBLm+yY+4P3FNhraD0JL28vyn2
         edgdvXTBZrB1P/rBSEY/tsH3a9lg+U1McOzMoz6w4A2zK8yBuIISxFRA83fe+yT93moa
         qMN83O89Zbz3+jizee4eqoFj/T0OyE+fv87XyYHA79eZvCB4LhCSpQuPjR1Jl6jy0tF4
         AmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727239106; x=1727843906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D/oxZoO71PQ5m5Ow+SV5/SV/jvpv3lxQQXCYtby61Bc=;
        b=IixcpHSSJ+SuCKZ57rF03VHAkDC5BPqkr4zUqCEt41wemFL1eE/gaYWL/57QIjl7nt
         W9X+h10SuJnSQZgcUht5/vbrssGsiKw83maNQge4Gu2j8dYIG9Mio8wJXi9A5jIrhyA/
         YZTb4SBKIcK7s++xu82pwO0rarUfwvgbgvQ1RxaJVDqN3sSmBChpLRGQJflpJF7huTRA
         x04TwfAAvmd9mKX1YvfcC42mBdDIM7cjuEEgHZ6/1jM2Z7XbSk8vyfDP+qCoDQ0aO4IZ
         BJhZ0FSFva6Hacn0D55Vnyf/lWvb47ECFxMEO+kXyzQS914xWMK+p9knTjht+b5rHNLL
         LWWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUX53RgL8jtfki35vnZmmtmf12wKUXFGJjOhTMYZyfLHEddmghEAfuPxsQ4DniZFjBw49pY+AecKf6+@alsa-project.org
X-Gm-Message-State: AOJu0Yx3eXdGLLo3HChz1ofR9ymIaSYG2ynftIuVc9dUgeiG/NplLees
	n+ObPyBBn8oTBkMYPzx86SwmZFKr1OIwQ6cZFKboID1LLvYnox5mrL5ja/9tYmI=
X-Google-Smtp-Source: 
 AGHT+IHwdF5ljDQfVen2bB2i+DqTGyQ8nFc+SavdlwPgLOgvH9bEIVuNClRBPu4Uwc0aZm3GruhGCg==
X-Received: by 2002:a17:906:730a:b0:a8d:e49:c530 with SMTP id
 a640c23a62f3a-a93a05eda5fmr124902866b.42.1727239106340;
        Tue, 24 Sep 2024 21:38:26 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f346casm164857466b.24.2024.09.24.21.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 21:38:25 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: srinivas.kandagatla@linaro.org,
	a39.skl@gmail.com,
	linux-sound@vger.kernel.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	vkoul@kernel.org,
	klimov.linux@gmail.com
Subject: [PATCH REVIEW 1/2] ASoC: codecs: lpass-rx-macro: fix RXn(rx,n) macro
 for DSM_CTL and SEC7 regs
Date: Wed, 25 Sep 2024 05:38:22 +0100
Message-ID: <20240925043823.520218-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: alexey.klimov@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OW24PPV6ZBMT2OQP3IPKCJHP6QDL2VPU
X-Message-ID-Hash: OW24PPV6ZBMT2OQP3IPKCJHP6QDL2VPU
X-Mailman-Approved-At: Tue, 01 Oct 2024 12:35:05 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OW24PPV6ZBMT2OQP3IPKCJHP6QDL2VPU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Turns out some registers of pre-2.5 version of rxmacro codecs are not
located at the expected offsets but 0xc further away in memory.
So far the detected registers are CDC_RX_RX2_RX_PATH_SEC7 and
CDC_RX_RX2_RX_PATH_DSM_CTL.

CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n) macro incorrectly generates the address
0x540 for RX2 but it should be 0x54C and it also overwrites
CDC_RX_RX2_RX_PATH_SEC7 which is located at 0x540.
The same goes for CDC_RX_RXn_RX_PATH_SEC7(rx, n).

Fix this by introducing additional rxn_reg_stride2 offset. For 2.5 version
and above this offset will be equal to 0.
With such change the corresponding RXn() macros will generate the same
values for 2.5 codec version for all RX paths and the same old values
for pre-2.5 version for RX0 and RX1. However for the latter case with RX2 path
it will also add 2 * rxn_reg_stride2 on top.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 71e0d3bffd3f..9288ddb705fe 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -202,12 +202,14 @@
 #define CDC_RX_RXn_RX_PATH_SEC3(rx, n)	(0x042c  + rx->rxn_reg_stride * n)
 #define CDC_RX_RX0_RX_PATH_SEC4		(0x0430)
 #define CDC_RX_RX0_RX_PATH_SEC7		(0x0434)
-#define CDC_RX_RXn_RX_PATH_SEC7(rx, n)	(0x0434  + rx->rxn_reg_stride * n)
+#define CDC_RX_RXn_RX_PATH_SEC7(rx, n)		\
+	(0x0434 + rx->rxn_reg_stride * n + n * (n - 1) * rx->rxn_reg_stride2)
 #define CDC_RX_DSM_OUT_DELAY_SEL_MASK	GENMASK(2, 0)
 #define CDC_RX_DSM_OUT_DELAY_TWO_SAMPLE	0x2
 #define CDC_RX_RX0_RX_PATH_MIX_SEC0	(0x0438)
 #define CDC_RX_RX0_RX_PATH_MIX_SEC1	(0x043C)
-#define CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n)	(0x0440  + rx->rxn_reg_stride * n)
+#define CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n)	\
+	(0x0440 + rx->rxn_reg_stride * n + n * (n - 1) * rx->rxn_reg_stride2)
 #define CDC_RX_RXn_DSM_CLK_EN_MASK	BIT(0)
 #define CDC_RX_RX0_RX_PATH_DSM_CTL	(0x0440)
 #define CDC_RX_RX0_RX_PATH_DSM_DATA1	(0x0444)
@@ -645,6 +647,7 @@ struct rx_macro {
 	int rx_mclk_cnt;
 	enum lpass_codec_version codec_version;
 	int rxn_reg_stride;
+	int rxn_reg_stride2;
 	bool is_ear_mode_on;
 	bool hph_pwr_mode;
 	bool hph_hd2_mode;
@@ -3821,6 +3824,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_0:
 	case LPASS_CODEC_VERSION_2_1:
 		rx->rxn_reg_stride = 0x80;
+		rx->rxn_reg_stride2 = 0x6;
 		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_pre_2_5_defaults);
 		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
 		if (!reg_defaults)
@@ -3834,6 +3838,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
 		rx->rxn_reg_stride = 0xc0;
+		rx->rxn_reg_stride2 = 0x0;
 		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
 		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
 		if (!reg_defaults)
-- 
2.45.2

