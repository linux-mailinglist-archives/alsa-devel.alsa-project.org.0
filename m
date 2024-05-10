Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A26BC8C29A8
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2024 20:01:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AB2EE7F;
	Fri, 10 May 2024 20:01:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AB2EE7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715364083;
	bh=oL0ZE4u+o90pm57ksO8EdIx9s68nwnRa4UvvXSY4/Y8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PPBZHLt6Zk4A+D1weoPcoAaOq1p9ldjX5c4jYdT2nixdBkviWJfgXtjDujZGVOqxK
	 6vBbJ8kh2aewyiYBofMrI/Td+ia6toKjAuoSwaZvSu4x9FOW1rrjIbXHPksrG8M8VO
	 xh8/KY5rKjLrJ5Xry/fOtUq/ht7PhFMpyvjhrW8Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0712BF805C2; Fri, 10 May 2024 20:00:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB3B7F805CA;
	Fri, 10 May 2024 20:00:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74943F805B0; Fri, 10 May 2024 19:58:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C811F800E2
	for <alsa-devel@alsa-project.org>; Fri, 10 May 2024 19:58:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C811F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=kTnVXoeA
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-41fc5645bb1so17475525e9.1
        for <alsa-devel@alsa-project.org>;
 Fri, 10 May 2024 10:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715363920; x=1715968720;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVmnmtm03Goey00xQ7Q0Ey8E4WlwT54kpgU8sJUoJVQ=;
        b=kTnVXoeA6HTkT3YJc9sa2KnS0oYdvAPYlt4ZVedIuYFOMnAQWkvgKGEsZj35j5lbmt
         AG8JDaE0tMpmdQpijPQKkJm0oJ/tpeo0JvIlBKuRKz1fZ1O0X/GlHmevyNN4Y/CcjD3M
         po4+upFbjxY7hlt1GfSGk1Vvuhy1y0ooeNqtK/SFekn9iGcAtxF6+3570O2xbVlJI4lO
         BjknMZqjU+NdAdJzm5vdObPuGLSMS+r60x6yuv3Y4NOdwlesDXDGQQcrGuzmwPcaYmbX
         mQUl3bIkPguD8nDPWH7Edgxttst85umUlOtn/DXpGNriTpWItgu+xzy8SG6JIgNYmeP9
         kK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715363920; x=1715968720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVmnmtm03Goey00xQ7Q0Ey8E4WlwT54kpgU8sJUoJVQ=;
        b=iXRi1tKtaC7dYbew1f0mKLGACOBVTCVjVrkfE9l9pXUq139DDAsIUeoVaoPDho2Gym
         f1hqr4u2PUdMHuFYS7dwtF8+vIUgo6mTR8Zt2KtREhWJ9RhK/QfjiAbTkpnCX6atlCis
         aISATx24BrwW2WNs88XVaWZSlRZWXRBSdmvXaoS6ORLbCOKuRGu4cLE+2P/GFh3qj2co
         U3fo6fhgz8cDH4PlHYCpr9ex7q/vmVX9XKHIKn37Hy8Oiy2b8BE46mtPn9C2YqSCtfOS
         i8obgFPCQUB2bRwAwvTa/pe/OFV7fawDWEMMOLCQSgOUP6dV4oLgTsYjjVUD53RvMc8N
         iWpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXjJiNl+LCkIzg88VbNmWE+CeJBD3tyjwb2eKCz/nLVv+/JKrw6IxtTt2b1DOQM5XeeQxQQZrOgihzyAMua9SasmPeP17otWwHiao=
X-Gm-Message-State: AOJu0YzKYh1J4pxB7sla5FMNurGl0mWaPB6ti9EGz21XdVnpaJJ/GsSu
	4Us8jQxxeKiGegRWGzI3Q+I/RWzRx/EcmN1KkxGBJO8fu0D8hiJTBbTwlQ3/CqA=
X-Google-Smtp-Source: 
 AGHT+IE5rOiUfXgda0gPCf68PQbTuzFptYINpDpbaR7aKZ7LwpvnIzaRNJ2A6qhRNUHorUxXobWRlg==
X-Received: by 2002:a05:600c:5859:b0:41a:f9db:88ac with SMTP id
 5b1f17b1804b1-41feaa390a7mr27067015e9.14.1715363920519;
        Fri, 10 May 2024 10:58:40 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4200a8e6846sm11046755e9.15.2024.05.10.10.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 10:58:39 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	neil.armstrong@linaro.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 2/2] ASoC: codec: lpass-rx-macro: add suppor for 2.6 codec
 version
Date: Fri, 10 May 2024 18:58:35 +0100
Message-Id: <20240510175835.286775-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240510175835.286775-1-srinivas.kandagatla@linaro.org>
References: <20240510175835.286775-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: X5BYIBPHHMSFQFT4DHC5IWBVFA4RA2P7
X-Message-ID-Hash: X5BYIBPHHMSFQFT4DHC5IWBVFA4RA2P7
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X5BYIBPHHMSFQFT4DHC5IWBVFA4RA2P7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

LPASS Codec v2.6 has significant changes in the rx register offsets.
Due to this headset playback on SM8550, SM8650, x1e80100 and all SoCs
after SM8450 have only Left working.

This patch adjusts the registers to accomdate 2.6 changes. With this
fixed now L and R are functional on Headset playback.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 565 ++++++++++++++++++++++--------
 1 file changed, 410 insertions(+), 155 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index f35187d69cac..c1724f0830e9 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -158,7 +158,7 @@
 #define CDC_RX_INTR_CTRL_LEVEL0		(0x03C0)
 #define CDC_RX_INTR_CTRL_BYPASS0	(0x03C8)
 #define CDC_RX_INTR_CTRL_SET0		(0x03D0)
-#define CDC_RX_RXn_RX_PATH_CTL(n)	(0x0400 + 0x80 * n)
+#define CDC_RX_RXn_RX_PATH_CTL(rx, n)	(0x0400  + rx->rxn_reg_offset * n)
 #define CDC_RX_RX0_RX_PATH_CTL		(0x0400)
 #define CDC_RX_PATH_RESET_EN_MASK	BIT(6)
 #define CDC_RX_PATH_CLK_EN_MASK		BIT(5)
@@ -166,45 +166,47 @@
 #define CDC_RX_PATH_PGA_MUTE_MASK	BIT(4)
 #define CDC_RX_PATH_PGA_MUTE_ENABLE	BIT(4)
 #define CDC_RX_PATH_PCM_RATE_MASK	GENMASK(3, 0)
-#define CDC_RX_RXn_RX_PATH_CFG0(n)	(0x0404 + 0x80 * n)
+#define CDC_RX_RXn_RX_PATH_CFG0(rx, n)	(0x0404  + rx->rxn_reg_offset * n)
 #define CDC_RX_RXn_COMP_EN_MASK		BIT(1)
 #define CDC_RX_RX0_RX_PATH_CFG0		(0x0404)
 #define CDC_RX_RXn_CLSH_EN_MASK		BIT(6)
 #define CDC_RX_DLY_ZN_EN_MASK		BIT(3)
 #define CDC_RX_DLY_ZN_ENABLE		BIT(3)
 #define CDC_RX_RXn_HD2_EN_MASK		BIT(2)
-#define CDC_RX_RXn_RX_PATH_CFG1(n)	(0x0408 + 0x80 * n)
+#define CDC_RX_RXn_RX_PATH_CFG1(rx, n)	(0x0408  + rx->rxn_reg_offset * n)
 #define CDC_RX_RXn_SIDETONE_EN_MASK	BIT(4)
 #define CDC_RX_RX0_RX_PATH_CFG1		(0x0408)
 #define CDC_RX_RX0_HPH_L_EAR_SEL_MASK	BIT(1)
-#define CDC_RX_RXn_RX_PATH_CFG2(n)	(0x040C + 0x80 * n)
+#define CDC_RX_RXn_RX_PATH_CFG2(rx, n)	(0x040C  + rx->rxn_reg_offset * n)
 #define CDC_RX_RXn_HPF_CUT_FREQ_MASK	GENMASK(1, 0)
 #define CDC_RX_RX0_RX_PATH_CFG2		(0x040C)
-#define CDC_RX_RXn_RX_PATH_CFG3(n)	(0x0410 + 0x80 * n)
+#define CDC_RX_RXn_RX_PATH_CFG3(rx, n)	(0x0410  + rx->rxn_reg_offset * n)
 #define CDC_RX_RX0_RX_PATH_CFG3		(0x0410)
 #define CDC_RX_DC_COEFF_SEL_MASK	GENMASK(1, 0)
 #define CDC_RX_DC_COEFF_SEL_TWO		0x2
-#define CDC_RX_RXn_RX_VOL_CTL(n)	(0x0414 + 0x80 * n)
+#define CDC_RX_RXn_RX_VOL_CTL(rx, n)	(0x0414  + rx->rxn_reg_offset * n)
 #define CDC_RX_RX0_RX_VOL_CTL		(0x0414)
-#define CDC_RX_RXn_RX_PATH_MIX_CTL(n)	(0x0418 + 0x80 * n)
+#define CDC_RX_RXn_RX_PATH_MIX_CTL(rx, n)	(0x0418  + rx->rxn_reg_offset * n)
 #define CDC_RX_RXn_MIX_PCM_RATE_MASK	GENMASK(3, 0)
 #define CDC_RX_RXn_MIX_RESET_MASK	BIT(6)
 #define CDC_RX_RXn_MIX_RESET		BIT(6)
 #define CDC_RX_RXn_MIX_CLK_EN_MASK	BIT(5)
 #define CDC_RX_RX0_RX_PATH_MIX_CTL	(0x0418)
 #define CDC_RX_RX0_RX_PATH_MIX_CFG	(0x041C)
-#define CDC_RX_RXn_RX_VOL_MIX_CTL(n)	(0x0420 + 0x80 * n)
+#define CDC_RX_RXn_RX_VOL_MIX_CTL(rx, n)	(0x0420  + rx->rxn_reg_offset * n)
 #define CDC_RX_RX0_RX_VOL_MIX_CTL	(0x0420)
 #define CDC_RX_RX0_RX_PATH_SEC1		(0x0424)
 #define CDC_RX_RX0_RX_PATH_SEC2		(0x0428)
 #define CDC_RX_RX0_RX_PATH_SEC3		(0x042C)
+#define CDC_RX_RXn_RX_PATH_SEC3(rx, n)	(0x042c  + rx->rxn_reg_offset * n)
 #define CDC_RX_RX0_RX_PATH_SEC4		(0x0430)
 #define CDC_RX_RX0_RX_PATH_SEC7		(0x0434)
+#define CDC_RX_RXn_RX_PATH_SEC7(rx, n)	(0x0434  + rx->rxn_reg_offset * n)
 #define CDC_RX_DSM_OUT_DELAY_SEL_MASK	GENMASK(2, 0)
 #define CDC_RX_DSM_OUT_DELAY_TWO_SAMPLE	0x2
 #define CDC_RX_RX0_RX_PATH_MIX_SEC0	(0x0438)
 #define CDC_RX_RX0_RX_PATH_MIX_SEC1	(0x043C)
-#define CDC_RX_RXn_RX_PATH_DSM_CTL(n)	(0x0440 + 0x80 * n)
+#define CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n)	(0x0440  + rx->rxn_reg_offset * n)
 #define CDC_RX_RXn_DSM_CLK_EN_MASK	BIT(0)
 #define CDC_RX_RX0_RX_PATH_DSM_CTL	(0x0440)
 #define CDC_RX_RX0_RX_PATH_DSM_DATA1	(0x0444)
@@ -213,6 +215,7 @@
 #define CDC_RX_RX0_RX_PATH_DSM_DATA4	(0x0450)
 #define CDC_RX_RX0_RX_PATH_DSM_DATA5	(0x0454)
 #define CDC_RX_RX0_RX_PATH_DSM_DATA6	(0x0458)
+/* RX offsets prior to 2.6 codec version */
 #define CDC_RX_RX1_RX_PATH_CTL		(0x0480)
 #define CDC_RX_RX1_RX_PATH_CFG0		(0x0484)
 #define CDC_RX_RX1_RX_PATH_CFG1		(0x0488)
@@ -259,10 +262,58 @@
 #define CDC_RX_RX2_RX_PATH_MIX_SEC0	(0x0544)
 #define CDC_RX_RX2_RX_PATH_MIX_SEC1	(0x0548)
 #define CDC_RX_RX2_RX_PATH_DSM_CTL	(0x054C)
+
+/* LPASS CODEC version 2.6 rx reg offsets */
+#define CDC_2_6_RX_RX1_RX_PATH_CTL		(0x04c0)
+#define CDC_2_6_RX_RX1_RX_PATH_CFG0		(0x04c4)
+#define CDC_2_6_RX_RX1_RX_PATH_CFG1		(0x04c8)
+#define CDC_2_6_RX_RX1_RX_PATH_CFG2		(0x04cC)
+#define CDC_2_6_RX_RX1_RX_PATH_CFG3		(0x04d0)
+#define CDC_2_6_RX_RX1_RX_VOL_CTL		(0x04d4)
+#define CDC_2_6_RX_RX1_RX_PATH_MIX_CTL		(0x04d8)
+#define CDC_2_6_RX_RX1_RX_PATH_MIX_CFG		(0x04dC)
+#define CDC_2_6_RX_RX1_RX_VOL_MIX_CTL		(0x04e0)
+#define CDC_2_6_RX_RX1_RX_PATH_SEC1		(0x04e4)
+#define CDC_2_6_RX_RX1_RX_PATH_SEC2		(0x04e8)
+#define CDC_2_6_RX_RX1_RX_PATH_SEC3		(0x04eC)
+#define CDC_2_6_RX_RX1_RX_PATH_SEC4		(0x04f0)
+#define CDC_2_6_RX_RX1_RX_PATH_SEC7		(0x04f4)
+#define CDC_2_6_RX_RX1_RX_PATH_MIX_SEC0		(0x04f8)
+#define CDC_2_6_RX_RX1_RX_PATH_MIX_SEC1		(0x04fC)
+#define CDC_2_6_RX_RX1_RX_PATH_DSM_CTL		(0x0500)
+#define CDC_2_6_RX_RX1_RX_PATH_DSM_DATA1	(0x0504)
+#define CDC_2_6_RX_RX1_RX_PATH_DSM_DATA2	(0x0508)
+#define CDC_2_6_RX_RX1_RX_PATH_DSM_DATA3	(0x050C)
+#define CDC_2_6_RX_RX1_RX_PATH_DSM_DATA4	(0x0510)
+#define CDC_2_6_RX_RX1_RX_PATH_DSM_DATA5	(0x0514)
+#define CDC_2_6_RX_RX1_RX_PATH_DSM_DATA6	(0x0518)
+
+#define CDC_2_6_RX_RX2_RX_PATH_CTL		(0x0580)
+#define CDC_2_6_RX_RX2_RX_PATH_CFG0		(0x0584)
+#define CDC_2_6_RX_RX2_RX_PATH_CFG1		(0x0588)
+#define CDC_2_6_RX_RX2_RX_PATH_CFG2		(0x058C)
+#define CDC_2_6_RX_RX2_RX_PATH_CFG3		(0x0590)
+#define CDC_2_6_RX_RX2_RX_VOL_CTL		(0x0594)
+#define CDC_2_6_RX_RX2_RX_PATH_MIX_CTL		(0x0598)
+#define CDC_2_6_RX_RX2_RX_PATH_MIX_CFG		(0x059C)
+#define CDC_2_6_RX_RX2_RX_VOL_MIX_CTL		(0x05a0)
+#define CDC_2_6_RX_RX2_RX_PATH_SEC0		(0x05a4)
+#define CDC_2_6_RX_RX2_RX_PATH_SEC1		(0x05a8)
+#define CDC_2_6_RX_RX2_RX_PATH_SEC2		(0x05aC)
+#define CDC_2_6_RX_RX2_RX_PATH_SEC3		(0x05b0)
+#define CDC_2_6_RX_RX2_RX_PATH_SEC4		(0x05b4)
+#define CDC_2_6_RX_RX2_RX_PATH_SEC5		(0x05b8)
+#define CDC_2_6_RX_RX2_RX_PATH_SEC6		(0x05bC)
+#define CDC_2_6_RX_RX2_RX_PATH_SEC7		(0x05c0)
+#define CDC_2_6_RX_RX2_RX_PATH_MIX_SEC0		(0x05c4)
+#define CDC_2_6_RX_RX2_RX_PATH_MIX_SEC1		(0x05c8)
+#define CDC_2_6_RX_RX2_RX_PATH_DSM_CTL		(0x05cC)
+
 #define CDC_RX_IDLE_DETECT_PATH_CTL	(0x0780)
 #define CDC_RX_IDLE_DETECT_CFG0		(0x0784)
 #define CDC_RX_IDLE_DETECT_CFG1		(0x0788)
 #define CDC_RX_IDLE_DETECT_CFG2		(0x078C)
+
 #define CDC_RX_IDLE_DETECT_CFG3		(0x0790)
 #define CDC_RX_COMPANDERn_CTL0(n)	(0x0800 + 0x40 * n)
 #define CDC_RX_COMPANDERn_CLK_EN_MASK	BIT(0)
@@ -598,6 +649,8 @@ struct rx_macro {
 	int rx_mclk_users;
 	int clsh_users;
 	int rx_mclk_cnt;
+	int codec_version;
+	int rxn_reg_offset;
 	bool is_ear_mode_on;
 	bool hph_pwr_mode;
 	bool hph_hd2_mode;
@@ -755,11 +808,15 @@ static SOC_ENUM_SINGLE_DECL(rx_int1_2_interp_enum, SND_SOC_NOPM, 0,
 			    rx_int1_2_interp_mux_text);
 static SOC_ENUM_SINGLE_DECL(rx_int2_2_interp_enum, SND_SOC_NOPM, 0,
 			    rx_int2_2_interp_mux_text);
+
 static SOC_ENUM_SINGLE_DECL(rx_int0_dem_inp_enum, CDC_RX_RX0_RX_PATH_CFG1, 0,
 			    rx_int_dem_inp_mux_text);
 static SOC_ENUM_SINGLE_DECL(rx_int1_dem_inp_enum, CDC_RX_RX1_RX_PATH_CFG1, 0,
 			    rx_int_dem_inp_mux_text);
 
+static SOC_ENUM_SINGLE_DECL(rx_2_6_int1_dem_inp_enum, CDC_2_6_RX_RX1_RX_PATH_CFG1, 0,
+			    rx_int_dem_inp_mux_text);
+
 static SOC_ENUM_SINGLE_DECL(rx_macro_rx0_enum, SND_SOC_NOPM, 0, rx_macro_mux_text);
 static SOC_ENUM_SINGLE_DECL(rx_macro_rx1_enum, SND_SOC_NOPM, 0, rx_macro_mux_text);
 static SOC_ENUM_SINGLE_DECL(rx_macro_rx2_enum, SND_SOC_NOPM, 0, rx_macro_mux_text);
@@ -976,49 +1033,6 @@ static const struct reg_default rx_defaults[] = {
 	{ CDC_RX_RX0_RX_PATH_DSM_DATA4, 0x55 },
 	{ CDC_RX_RX0_RX_PATH_DSM_DATA5, 0x55 },
 	{ CDC_RX_RX0_RX_PATH_DSM_DATA6, 0x55 },
-	{ CDC_RX_RX1_RX_PATH_CTL, 0x04 },
-	{ CDC_RX_RX1_RX_PATH_CFG0, 0x00 },
-	{ CDC_RX_RX1_RX_PATH_CFG1, 0x64 },
-	{ CDC_RX_RX1_RX_PATH_CFG2, 0x8F },
-	{ CDC_RX_RX1_RX_PATH_CFG3, 0x00 },
-	{ CDC_RX_RX1_RX_VOL_CTL, 0x00 },
-	{ CDC_RX_RX1_RX_PATH_MIX_CTL, 0x04 },
-	{ CDC_RX_RX1_RX_PATH_MIX_CFG, 0x7E },
-	{ CDC_RX_RX1_RX_VOL_MIX_CTL, 0x00 },
-	{ CDC_RX_RX1_RX_PATH_SEC1, 0x08 },
-	{ CDC_RX_RX1_RX_PATH_SEC2, 0x00 },
-	{ CDC_RX_RX1_RX_PATH_SEC3, 0x00 },
-	{ CDC_RX_RX1_RX_PATH_SEC4, 0x00 },
-	{ CDC_RX_RX1_RX_PATH_SEC7, 0x00 },
-	{ CDC_RX_RX1_RX_PATH_MIX_SEC0, 0x08 },
-	{ CDC_RX_RX1_RX_PATH_MIX_SEC1, 0x00 },
-	{ CDC_RX_RX1_RX_PATH_DSM_CTL, 0x08 },
-	{ CDC_RX_RX1_RX_PATH_DSM_DATA1, 0x00 },
-	{ CDC_RX_RX1_RX_PATH_DSM_DATA2, 0x00 },
-	{ CDC_RX_RX1_RX_PATH_DSM_DATA3, 0x00 },
-	{ CDC_RX_RX1_RX_PATH_DSM_DATA4, 0x55 },
-	{ CDC_RX_RX1_RX_PATH_DSM_DATA5, 0x55 },
-	{ CDC_RX_RX1_RX_PATH_DSM_DATA6, 0x55 },
-	{ CDC_RX_RX2_RX_PATH_CTL, 0x04 },
-	{ CDC_RX_RX2_RX_PATH_CFG0, 0x00 },
-	{ CDC_RX_RX2_RX_PATH_CFG1, 0x64 },
-	{ CDC_RX_RX2_RX_PATH_CFG2, 0x8F },
-	{ CDC_RX_RX2_RX_PATH_CFG3, 0x00 },
-	{ CDC_RX_RX2_RX_VOL_CTL, 0x00 },
-	{ CDC_RX_RX2_RX_PATH_MIX_CTL, 0x04 },
-	{ CDC_RX_RX2_RX_PATH_MIX_CFG, 0x7E },
-	{ CDC_RX_RX2_RX_VOL_MIX_CTL, 0x00 },
-	{ CDC_RX_RX2_RX_PATH_SEC0, 0x04 },
-	{ CDC_RX_RX2_RX_PATH_SEC1, 0x08 },
-	{ CDC_RX_RX2_RX_PATH_SEC2, 0x00 },
-	{ CDC_RX_RX2_RX_PATH_SEC3, 0x00 },
-	{ CDC_RX_RX2_RX_PATH_SEC4, 0x00 },
-	{ CDC_RX_RX2_RX_PATH_SEC5, 0x00 },
-	{ CDC_RX_RX2_RX_PATH_SEC6, 0x00 },
-	{ CDC_RX_RX2_RX_PATH_SEC7, 0x00 },
-	{ CDC_RX_RX2_RX_PATH_MIX_SEC0, 0x08 },
-	{ CDC_RX_RX2_RX_PATH_MIX_SEC1, 0x00 },
-	{ CDC_RX_RX2_RX_PATH_DSM_CTL, 0x00 },
 	{ CDC_RX_IDLE_DETECT_PATH_CTL, 0x00 },
 	{ CDC_RX_IDLE_DETECT_CFG0, 0x07 },
 	{ CDC_RX_IDLE_DETECT_CFG1, 0x3C },
@@ -1121,6 +1135,99 @@ static const struct reg_default rx_defaults[] = {
 	{ CDC_RX_DSD1_CFG2, 0x96 },
 };
 
+static const struct reg_default rx_2_6_defaults[] = {
+	{ CDC_2_6_RX_RX1_RX_PATH_CTL, 0x04 },
+	{ CDC_2_6_RX_RX1_RX_PATH_CFG0, 0x00 },
+	{ CDC_2_6_RX_RX1_RX_PATH_CFG1, 0x64 },
+	{ CDC_2_6_RX_RX1_RX_PATH_CFG2, 0x8F },
+	{ CDC_2_6_RX_RX1_RX_PATH_CFG3, 0x00 },
+	{ CDC_2_6_RX_RX1_RX_VOL_CTL, 0x00 },
+	{ CDC_2_6_RX_RX1_RX_PATH_MIX_CTL, 0x04 },
+	{ CDC_2_6_RX_RX1_RX_PATH_MIX_CFG, 0x7E },
+	{ CDC_2_6_RX_RX1_RX_VOL_MIX_CTL, 0x00 },
+	{ CDC_2_6_RX_RX1_RX_PATH_SEC1, 0x08 },
+	{ CDC_2_6_RX_RX1_RX_PATH_SEC2, 0x00 },
+	{ CDC_2_6_RX_RX1_RX_PATH_SEC3, 0x00 },
+	{ CDC_2_6_RX_RX1_RX_PATH_SEC4, 0x00 },
+	{ CDC_2_6_RX_RX1_RX_PATH_SEC7, 0x00 },
+	{ CDC_2_6_RX_RX1_RX_PATH_MIX_SEC0, 0x08 },
+	{ CDC_2_6_RX_RX1_RX_PATH_MIX_SEC1, 0x00 },
+	{ CDC_2_6_RX_RX1_RX_PATH_DSM_CTL, 0x08 },
+	{ CDC_2_6_RX_RX1_RX_PATH_DSM_DATA1, 0x00 },
+	{ CDC_2_6_RX_RX1_RX_PATH_DSM_DATA2, 0x00 },
+	{ CDC_2_6_RX_RX1_RX_PATH_DSM_DATA3, 0x00 },
+	{ CDC_2_6_RX_RX1_RX_PATH_DSM_DATA4, 0x55 },
+	{ CDC_2_6_RX_RX1_RX_PATH_DSM_DATA5, 0x55 },
+	{ CDC_2_6_RX_RX1_RX_PATH_DSM_DATA6, 0x55 },
+	{ CDC_2_6_RX_RX2_RX_PATH_CTL, 0x04 },
+	{ CDC_2_6_RX_RX2_RX_PATH_CFG0, 0x00 },
+	{ CDC_2_6_RX_RX2_RX_PATH_CFG1, 0x64 },
+	{ CDC_2_6_RX_RX2_RX_PATH_CFG2, 0x8F },
+	{ CDC_2_6_RX_RX2_RX_PATH_CFG3, 0x00 },
+	{ CDC_2_6_RX_RX2_RX_VOL_CTL, 0x00 },
+	{ CDC_2_6_RX_RX2_RX_PATH_MIX_CTL, 0x04 },
+	{ CDC_2_6_RX_RX2_RX_PATH_MIX_CFG, 0x7E },
+	{ CDC_2_6_RX_RX2_RX_VOL_MIX_CTL, 0x00 },
+	{ CDC_2_6_RX_RX2_RX_PATH_SEC0, 0x04 },
+	{ CDC_2_6_RX_RX2_RX_PATH_SEC1, 0x08 },
+	{ CDC_2_6_RX_RX2_RX_PATH_SEC2, 0x00 },
+	{ CDC_2_6_RX_RX2_RX_PATH_SEC3, 0x00 },
+	{ CDC_2_6_RX_RX2_RX_PATH_SEC4, 0x00 },
+	{ CDC_2_6_RX_RX2_RX_PATH_SEC5, 0x00 },
+	{ CDC_2_6_RX_RX2_RX_PATH_SEC6, 0x00 },
+	{ CDC_2_6_RX_RX2_RX_PATH_SEC7, 0x00 },
+	{ CDC_2_6_RX_RX2_RX_PATH_MIX_SEC0, 0x08 },
+	{ CDC_2_6_RX_RX2_RX_PATH_MIX_SEC1, 0x00 },
+	{ CDC_2_6_RX_RX2_RX_PATH_DSM_CTL, 0x00 },
+};
+
+static const struct reg_default rx_pre_2_6_defaults[] = {
+	{ CDC_RX_RX1_RX_PATH_CTL, 0x04 },
+	{ CDC_RX_RX1_RX_PATH_CFG0, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_CFG1, 0x64 },
+	{ CDC_RX_RX1_RX_PATH_CFG2, 0x8F },
+	{ CDC_RX_RX1_RX_PATH_CFG3, 0x00 },
+	{ CDC_RX_RX1_RX_VOL_CTL, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_MIX_CTL, 0x04 },
+	{ CDC_RX_RX1_RX_PATH_MIX_CFG, 0x7E },
+	{ CDC_RX_RX1_RX_VOL_MIX_CTL, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_SEC1, 0x08 },
+	{ CDC_RX_RX1_RX_PATH_SEC2, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_SEC3, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_SEC4, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_SEC7, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_MIX_SEC0, 0x08 },
+	{ CDC_RX_RX1_RX_PATH_MIX_SEC1, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_DSM_CTL, 0x08 },
+	{ CDC_RX_RX1_RX_PATH_DSM_DATA1, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_DSM_DATA2, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_DSM_DATA3, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_DSM_DATA4, 0x55 },
+	{ CDC_RX_RX1_RX_PATH_DSM_DATA5, 0x55 },
+	{ CDC_RX_RX1_RX_PATH_DSM_DATA6, 0x55 },
+	{ CDC_RX_RX2_RX_PATH_CTL, 0x04 },
+	{ CDC_RX_RX2_RX_PATH_CFG0, 0x00 },
+	{ CDC_RX_RX2_RX_PATH_CFG1, 0x64 },
+	{ CDC_RX_RX2_RX_PATH_CFG2, 0x8F },
+	{ CDC_RX_RX2_RX_PATH_CFG3, 0x00 },
+	{ CDC_RX_RX2_RX_VOL_CTL, 0x00 },
+	{ CDC_RX_RX2_RX_PATH_MIX_CTL, 0x04 },
+	{ CDC_RX_RX2_RX_PATH_MIX_CFG, 0x7E },
+	{ CDC_RX_RX2_RX_VOL_MIX_CTL, 0x00 },
+	{ CDC_RX_RX2_RX_PATH_SEC0, 0x04 },
+	{ CDC_RX_RX2_RX_PATH_SEC1, 0x08 },
+	{ CDC_RX_RX2_RX_PATH_SEC2, 0x00 },
+	{ CDC_RX_RX2_RX_PATH_SEC3, 0x00 },
+	{ CDC_RX_RX2_RX_PATH_SEC4, 0x00 },
+	{ CDC_RX_RX2_RX_PATH_SEC5, 0x00 },
+	{ CDC_RX_RX2_RX_PATH_SEC6, 0x00 },
+	{ CDC_RX_RX2_RX_PATH_SEC7, 0x00 },
+	{ CDC_RX_RX2_RX_PATH_MIX_SEC0, 0x08 },
+	{ CDC_RX_RX2_RX_PATH_MIX_SEC1, 0x00 },
+	{ CDC_RX_RX2_RX_PATH_DSM_CTL, 0x00 },
+
+};
+
 static bool rx_is_wronly_register(struct device *dev,
 					unsigned int reg)
 {
@@ -1175,8 +1282,114 @@ static bool rx_is_volatile_register(struct device *dev, unsigned int reg)
 	return false;
 }
 
+static bool rx_2_2_is_rw_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case CDC_RX_RX1_RX_PATH_CTL:
+	case CDC_RX_RX1_RX_PATH_CFG0:
+	case CDC_RX_RX1_RX_PATH_CFG1:
+	case CDC_RX_RX1_RX_PATH_CFG2:
+	case CDC_RX_RX1_RX_PATH_CFG3:
+	case CDC_RX_RX1_RX_VOL_CTL:
+	case CDC_RX_RX1_RX_PATH_MIX_CTL:
+	case CDC_RX_RX1_RX_PATH_MIX_CFG:
+	case CDC_RX_RX1_RX_VOL_MIX_CTL:
+	case CDC_RX_RX1_RX_PATH_SEC1:
+	case CDC_RX_RX1_RX_PATH_SEC2:
+	case CDC_RX_RX1_RX_PATH_SEC3:
+	case CDC_RX_RX1_RX_PATH_SEC4:
+	case CDC_RX_RX1_RX_PATH_SEC7:
+	case CDC_RX_RX1_RX_PATH_MIX_SEC0:
+	case CDC_RX_RX1_RX_PATH_MIX_SEC1:
+	case CDC_RX_RX1_RX_PATH_DSM_CTL:
+	case CDC_RX_RX1_RX_PATH_DSM_DATA1:
+	case CDC_RX_RX1_RX_PATH_DSM_DATA2:
+	case CDC_RX_RX1_RX_PATH_DSM_DATA3:
+	case CDC_RX_RX1_RX_PATH_DSM_DATA4:
+	case CDC_RX_RX1_RX_PATH_DSM_DATA5:
+	case CDC_RX_RX1_RX_PATH_DSM_DATA6:
+	case CDC_RX_RX2_RX_PATH_CTL:
+	case CDC_RX_RX2_RX_PATH_CFG0:
+	case CDC_RX_RX2_RX_PATH_CFG1:
+	case CDC_RX_RX2_RX_PATH_CFG2:
+	case CDC_RX_RX2_RX_PATH_CFG3:
+	case CDC_RX_RX2_RX_VOL_CTL:
+	case CDC_RX_RX2_RX_PATH_MIX_CTL:
+	case CDC_RX_RX2_RX_PATH_MIX_CFG:
+	case CDC_RX_RX2_RX_VOL_MIX_CTL:
+	case CDC_RX_RX2_RX_PATH_SEC0:
+	case CDC_RX_RX2_RX_PATH_SEC1:
+	case CDC_RX_RX2_RX_PATH_SEC2:
+	case CDC_RX_RX2_RX_PATH_SEC3:
+	case CDC_RX_RX2_RX_PATH_SEC4:
+	case CDC_RX_RX2_RX_PATH_SEC5:
+	case CDC_RX_RX2_RX_PATH_SEC6:
+	case CDC_RX_RX2_RX_PATH_SEC7:
+	case CDC_RX_RX2_RX_PATH_MIX_SEC0:
+	case CDC_RX_RX2_RX_PATH_MIX_SEC1:
+	case CDC_RX_RX2_RX_PATH_DSM_CTL:
+		return true;
+	}
+
+	return false;
+}
+
+static bool rx_2_6_is_rw_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case CDC_2_6_RX_RX1_RX_PATH_CTL:
+	case CDC_2_6_RX_RX1_RX_PATH_CFG0:
+	case CDC_2_6_RX_RX1_RX_PATH_CFG1:
+	case CDC_2_6_RX_RX1_RX_PATH_CFG2:
+	case CDC_2_6_RX_RX1_RX_PATH_CFG3:
+	case CDC_2_6_RX_RX1_RX_VOL_CTL:
+	case CDC_2_6_RX_RX1_RX_PATH_MIX_CTL:
+	case CDC_2_6_RX_RX1_RX_PATH_MIX_CFG:
+	case CDC_2_6_RX_RX1_RX_VOL_MIX_CTL:
+	case CDC_2_6_RX_RX1_RX_PATH_SEC1:
+	case CDC_2_6_RX_RX1_RX_PATH_SEC2:
+	case CDC_2_6_RX_RX1_RX_PATH_SEC3:
+	case CDC_2_6_RX_RX1_RX_PATH_SEC4:
+	case CDC_2_6_RX_RX1_RX_PATH_SEC7:
+	case CDC_2_6_RX_RX1_RX_PATH_MIX_SEC0:
+	case CDC_2_6_RX_RX1_RX_PATH_MIX_SEC1:
+	case CDC_2_6_RX_RX1_RX_PATH_DSM_CTL:
+	case CDC_2_6_RX_RX1_RX_PATH_DSM_DATA1:
+	case CDC_2_6_RX_RX1_RX_PATH_DSM_DATA2:
+	case CDC_2_6_RX_RX1_RX_PATH_DSM_DATA3:
+	case CDC_2_6_RX_RX1_RX_PATH_DSM_DATA4:
+	case CDC_2_6_RX_RX1_RX_PATH_DSM_DATA5:
+	case CDC_2_6_RX_RX1_RX_PATH_DSM_DATA6:
+	case CDC_2_6_RX_RX2_RX_PATH_CTL:
+	case CDC_2_6_RX_RX2_RX_PATH_CFG0:
+	case CDC_2_6_RX_RX2_RX_PATH_CFG1:
+	case CDC_2_6_RX_RX2_RX_PATH_CFG2:
+	case CDC_2_6_RX_RX2_RX_PATH_CFG3:
+	case CDC_2_6_RX_RX2_RX_VOL_CTL:
+	case CDC_2_6_RX_RX2_RX_PATH_MIX_CTL:
+	case CDC_2_6_RX_RX2_RX_PATH_MIX_CFG:
+	case CDC_2_6_RX_RX2_RX_VOL_MIX_CTL:
+	case CDC_2_6_RX_RX2_RX_PATH_SEC0:
+	case CDC_2_6_RX_RX2_RX_PATH_SEC1:
+	case CDC_2_6_RX_RX2_RX_PATH_SEC2:
+	case CDC_2_6_RX_RX2_RX_PATH_SEC3:
+	case CDC_2_6_RX_RX2_RX_PATH_SEC4:
+	case CDC_2_6_RX_RX2_RX_PATH_SEC5:
+	case CDC_2_6_RX_RX2_RX_PATH_SEC6:
+	case CDC_2_6_RX_RX2_RX_PATH_SEC7:
+	case CDC_2_6_RX_RX2_RX_PATH_MIX_SEC0:
+	case CDC_2_6_RX_RX2_RX_PATH_MIX_SEC1:
+	case CDC_2_6_RX_RX2_RX_PATH_DSM_CTL:
+		return true;
+	}
+
+	return false;
+}
+
 static bool rx_is_rw_register(struct device *dev, unsigned int reg)
 {
+	struct rx_macro *rx = dev_get_drvdata(dev);
+
 	switch (reg) {
 	case CDC_RX_TOP_TOP_CFG0:
 	case CDC_RX_TOP_SWR_CTRL:
@@ -1306,49 +1519,6 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
 	case CDC_RX_RX0_RX_PATH_DSM_DATA4:
 	case CDC_RX_RX0_RX_PATH_DSM_DATA5:
 	case CDC_RX_RX0_RX_PATH_DSM_DATA6:
-	case CDC_RX_RX1_RX_PATH_CTL:
-	case CDC_RX_RX1_RX_PATH_CFG0:
-	case CDC_RX_RX1_RX_PATH_CFG1:
-	case CDC_RX_RX1_RX_PATH_CFG2:
-	case CDC_RX_RX1_RX_PATH_CFG3:
-	case CDC_RX_RX1_RX_VOL_CTL:
-	case CDC_RX_RX1_RX_PATH_MIX_CTL:
-	case CDC_RX_RX1_RX_PATH_MIX_CFG:
-	case CDC_RX_RX1_RX_VOL_MIX_CTL:
-	case CDC_RX_RX1_RX_PATH_SEC1:
-	case CDC_RX_RX1_RX_PATH_SEC2:
-	case CDC_RX_RX1_RX_PATH_SEC3:
-	case CDC_RX_RX1_RX_PATH_SEC4:
-	case CDC_RX_RX1_RX_PATH_SEC7:
-	case CDC_RX_RX1_RX_PATH_MIX_SEC0:
-	case CDC_RX_RX1_RX_PATH_MIX_SEC1:
-	case CDC_RX_RX1_RX_PATH_DSM_CTL:
-	case CDC_RX_RX1_RX_PATH_DSM_DATA1:
-	case CDC_RX_RX1_RX_PATH_DSM_DATA2:
-	case CDC_RX_RX1_RX_PATH_DSM_DATA3:
-	case CDC_RX_RX1_RX_PATH_DSM_DATA4:
-	case CDC_RX_RX1_RX_PATH_DSM_DATA5:
-	case CDC_RX_RX1_RX_PATH_DSM_DATA6:
-	case CDC_RX_RX2_RX_PATH_CTL:
-	case CDC_RX_RX2_RX_PATH_CFG0:
-	case CDC_RX_RX2_RX_PATH_CFG1:
-	case CDC_RX_RX2_RX_PATH_CFG2:
-	case CDC_RX_RX2_RX_PATH_CFG3:
-	case CDC_RX_RX2_RX_VOL_CTL:
-	case CDC_RX_RX2_RX_PATH_MIX_CTL:
-	case CDC_RX_RX2_RX_PATH_MIX_CFG:
-	case CDC_RX_RX2_RX_VOL_MIX_CTL:
-	case CDC_RX_RX2_RX_PATH_SEC0:
-	case CDC_RX_RX2_RX_PATH_SEC1:
-	case CDC_RX_RX2_RX_PATH_SEC2:
-	case CDC_RX_RX2_RX_PATH_SEC3:
-	case CDC_RX_RX2_RX_PATH_SEC4:
-	case CDC_RX_RX2_RX_PATH_SEC5:
-	case CDC_RX_RX2_RX_PATH_SEC6:
-	case CDC_RX_RX2_RX_PATH_SEC7:
-	case CDC_RX_RX2_RX_PATH_MIX_SEC0:
-	case CDC_RX_RX2_RX_PATH_MIX_SEC1:
-	case CDC_RX_RX2_RX_PATH_DSM_CTL:
 	case CDC_RX_IDLE_DETECT_PATH_CTL:
 	case CDC_RX_IDLE_DETECT_CFG0:
 	case CDC_RX_IDLE_DETECT_CFG1:
@@ -1435,7 +1605,10 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
 		return true;
 	}
 
-	return false;
+	if (rx->codec_version == LPASS_CODEC_VERSION_2_6)
+		return rx_2_6_is_rw_register(dev, reg);
+
+	return rx_2_2_is_rw_register(dev, reg);
 }
 
 static bool rx_is_writeable_register(struct device *dev, unsigned int reg)
@@ -1485,14 +1658,12 @@ static bool rx_is_readable_register(struct device *dev, unsigned int reg)
 	return rx_is_rw_register(dev, reg);
 }
 
-static const struct regmap_config rx_regmap_config = {
+static struct regmap_config rx_regmap_config = {
 	.name = "rx_macro",
 	.reg_bits = 16,
 	.val_bits = 32, /* 8 but with 32 bit read/write */
 	.reg_stride = 4,
 	.cache_type = REGCACHE_FLAT,
-	.reg_defaults = rx_defaults,
-	.num_reg_defaults = ARRAY_SIZE(rx_defaults),
 	.max_register = RX_MAX_OFFSET,
 	.writeable_reg = rx_is_writeable_register,
 	.volatile_reg = rx_is_volatile_register,
@@ -1504,16 +1675,17 @@ static int rx_macro_int_dem_inp_mux_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
 	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned short look_ahead_dly_reg;
 	unsigned int val;
 
 	val = ucontrol->value.enumerated.item[0];
 
-	if (e->reg == CDC_RX_RX0_RX_PATH_CFG1)
-		look_ahead_dly_reg = CDC_RX_RX0_RX_PATH_CFG0;
-	else if (e->reg == CDC_RX_RX1_RX_PATH_CFG1)
-		look_ahead_dly_reg = CDC_RX_RX1_RX_PATH_CFG0;
+	if (e->reg == CDC_RX_RXn_RX_PATH_CFG1(rx, 0))
+		look_ahead_dly_reg = CDC_RX_RXn_RX_PATH_CFG0(rx, 0);
+	else if (e->reg == CDC_RX_RXn_RX_PATH_CFG1(rx, 1))
+		look_ahead_dly_reg = CDC_RX_RXn_RX_PATH_CFG0(rx, 1);
 
 	/* Set Look Ahead Delay */
 	if (val)
@@ -1534,6 +1706,10 @@ static const struct snd_kcontrol_new rx_int1_dem_inp_mux =
 		SOC_DAPM_ENUM_EXT("rx_int1_dem_inp", rx_int1_dem_inp_enum,
 		  snd_soc_dapm_get_enum_double, rx_macro_int_dem_inp_mux_put);
 
+static const struct snd_kcontrol_new rx_2_6_int1_dem_inp_mux =
+		SOC_DAPM_ENUM_EXT("rx_int1_dem_inp", rx_2_6_int1_dem_inp_enum,
+		  snd_soc_dapm_get_enum_double, rx_macro_int_dem_inp_mux_put);
+
 static int rx_macro_set_prim_interpolator_rate(struct snd_soc_dai *dai,
 					       int rate_reg_val, u32 sample_rate)
 {
@@ -1567,7 +1743,7 @@ static int rx_macro_set_prim_interpolator_rate(struct snd_soc_dai *dai,
 			if ((inp0_sel == int_1_mix1_inp + INTn_1_INP_SEL_RX0) ||
 			    (inp1_sel == int_1_mix1_inp + INTn_1_INP_SEL_RX0) ||
 			    (inp2_sel == int_1_mix1_inp + INTn_1_INP_SEL_RX0)) {
-				int_fs_reg = CDC_RX_RXn_RX_PATH_CTL(j);
+				int_fs_reg = CDC_RX_RXn_RX_PATH_CTL(rx, j);
 				/* sample_rate is in Hz */
 				snd_soc_component_update_bits(component, int_fs_reg,
 							      CDC_RX_PATH_PCM_RATE_MASK,
@@ -1600,7 +1776,7 @@ static int rx_macro_set_mix_interpolator_rate(struct snd_soc_dai *dai,
 									CDC_RX_INTX_2_SEL_MASK);
 
 			if (int_mux_cfg1_val == int_2_inp + INTn_2_INP_SEL_RX0) {
-				int_fs_reg = CDC_RX_RXn_RX_PATH_MIX_CTL(j);
+				int_fs_reg = CDC_RX_RXn_RX_PATH_MIX_CTL(rx, j);
 				snd_soc_component_update_bits(component, int_fs_reg,
 							      CDC_RX_RXn_MIX_PCM_RATE_MASK,
 							      rate_reg_val);
@@ -1719,6 +1895,7 @@ static int rx_macro_get_channel_map(struct snd_soc_dai *dai,
 static int rx_macro_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 {
 	struct snd_soc_component *component = dai->component;
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 	uint16_t j, reg, mix_reg, dsm_reg;
 	u16 int_mux_cfg0, int_mux_cfg1;
 	u8 int_mux_cfg0_val, int_mux_cfg1_val;
@@ -1729,9 +1906,9 @@ static int rx_macro_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 	case RX_MACRO_AIF3_PB:
 	case RX_MACRO_AIF4_PB:
 		for (j = 0; j < INTERP_MAX; j++) {
-			reg = CDC_RX_RXn_RX_PATH_CTL(j);
-			mix_reg = CDC_RX_RXn_RX_PATH_MIX_CTL(j);
-			dsm_reg = CDC_RX_RXn_RX_PATH_DSM_CTL(j);
+			reg = CDC_RX_RXn_RX_PATH_CTL(rx, j);
+			mix_reg = CDC_RX_RXn_RX_PATH_MIX_CTL(rx, j);
+			dsm_reg = CDC_RX_RXn_RX_PATH_DSM_CTL(rx, j);
 
 			if (mute) {
 				snd_soc_component_update_bits(component, reg,
@@ -1748,7 +1925,7 @@ static int rx_macro_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 			}
 
 			if (j == INTERP_AUX)
-				dsm_reg = CDC_RX_RX2_RX_PATH_DSM_CTL;
+				dsm_reg = CDC_RX_RXn_RX_PATH_DSM_CTL(rx, 2);
 
 			int_mux_cfg0 = CDC_RX_INP_MUX_RX_INT0_CFG0 + j * 8;
 			int_mux_cfg1 = int_mux_cfg0 + 4;
@@ -1956,10 +2133,11 @@ static int rx_macro_enable_main_path(struct snd_soc_dapm_widget *w,
 					int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 	u16 gain_reg, reg;
 
-	reg = CDC_RX_RXn_RX_PATH_CTL(w->shift);
-	gain_reg = CDC_RX_RXn_RX_VOL_CTL(w->shift);
+	reg = CDC_RX_RXn_RX_PATH_CTL(rx, w->shift);
+	gain_reg = CDC_RX_RXn_RX_VOL_CTL(rx, w->shift);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -1991,7 +2169,7 @@ static int rx_macro_config_compander(struct snd_soc_component *component,
 	if (comp == INTERP_AUX)
 		return 0;
 
-	pcm_rate = snd_soc_component_read(component, CDC_RX_RXn_RX_PATH_CTL(comp)) & 0x0F;
+	pcm_rate = snd_soc_component_read(component, CDC_RX_RXn_RX_PATH_CTL(rx, comp)) & 0x0F;
 	if (pcm_rate < 0x06)
 		val = 0x03;
 	else if (pcm_rate < 0x08)
@@ -2002,11 +2180,11 @@ static int rx_macro_config_compander(struct snd_soc_component *component,
 		val = 0x00;
 
 	if (SND_SOC_DAPM_EVENT_ON(event))
-		snd_soc_component_update_bits(component, CDC_RX_RXn_RX_PATH_CFG3(comp),
+		snd_soc_component_update_bits(component, CDC_RX_RXn_RX_PATH_CFG3(rx, comp),
 					      CDC_RX_DC_COEFF_SEL_MASK, val);
 
 	if (SND_SOC_DAPM_EVENT_OFF(event))
-		snd_soc_component_update_bits(component, CDC_RX_RXn_RX_PATH_CFG3(comp),
+		snd_soc_component_update_bits(component, CDC_RX_RXn_RX_PATH_CFG3(rx, comp),
 					      CDC_RX_DC_COEFF_SEL_MASK, 0x3);
 	if (!rx->comp_enabled[comp])
 		return 0;
@@ -2019,14 +2197,14 @@ static int rx_macro_config_compander(struct snd_soc_component *component,
 					      CDC_RX_COMPANDERn_SOFT_RST_MASK, 0x1);
 		snd_soc_component_write_field(component, CDC_RX_COMPANDERn_CTL0(comp),
 					      CDC_RX_COMPANDERn_SOFT_RST_MASK, 0x0);
-		snd_soc_component_write_field(component, CDC_RX_RXn_RX_PATH_CFG0(comp),
+		snd_soc_component_write_field(component, CDC_RX_RXn_RX_PATH_CFG0(rx, comp),
 					      CDC_RX_RXn_COMP_EN_MASK, 0x1);
 	}
 
 	if (SND_SOC_DAPM_EVENT_OFF(event)) {
 		snd_soc_component_write_field(component, CDC_RX_COMPANDERn_CTL0(comp),
 					      CDC_RX_COMPANDERn_HALT_MASK, 0x1);
-		snd_soc_component_write_field(component, CDC_RX_RXn_RX_PATH_CFG0(comp),
+		snd_soc_component_write_field(component, CDC_RX_RXn_RX_PATH_CFG0(rx, comp),
 					      CDC_RX_RXn_COMP_EN_MASK, 0x0);
 		snd_soc_component_write_field(component, CDC_RX_COMPANDERn_CTL0(comp),
 					      CDC_RX_COMPANDERn_CLK_EN_MASK, 0x0);
@@ -2125,13 +2303,13 @@ static int rx_macro_config_aux_hpf(struct snd_soc_component *component,
 		/* Update Aux HPF control */
 		if (!rx->is_aux_hpf_on)
 			snd_soc_component_update_bits(component,
-				CDC_RX_RX2_RX_PATH_CFG1, 0x04, 0x00);
+				CDC_RX_RXn_RX_PATH_CFG1(rx, 2), 0x04, 0x00);
 	}
 
 	if (SND_SOC_DAPM_EVENT_OFF(event)) {
 		/* Reset to default (HPF=ON) */
 		snd_soc_component_update_bits(component,
-			CDC_RX_RX2_RX_PATH_CFG1, 0x04, 0x04);
+			CDC_RX_RXn_RX_PATH_CFG1(rx, 2), 0x04, 0x04);
 	}
 
 	return 0;
@@ -2157,7 +2335,6 @@ static int rx_macro_config_classh(struct snd_soc_component *component,
 
 	if (!SND_SOC_DAPM_EVENT_ON(event))
 		return 0;
-
 	rx_macro_enable_clsh_block(rx, true);
 	if (interp_n == INTERP_HPHL ||
 		interp_n == INTERP_HPHR) {
@@ -2183,7 +2360,7 @@ static int rx_macro_config_classh(struct snd_soc_component *component,
 				CDC_RX_CLSH_DECAY_CTRL,
 				CDC_RX_CLSH_DECAY_RATE_MASK, 0x0);
 		snd_soc_component_write_field(component,
-				CDC_RX_RX0_RX_PATH_CFG0,
+				CDC_RX_RXn_RX_PATH_CFG0(rx, 0),
 				CDC_RX_RXn_CLSH_EN_MASK, 0x1);
 		break;
 	case INTERP_HPHR:
@@ -2199,15 +2376,15 @@ static int rx_macro_config_classh(struct snd_soc_component *component,
 				CDC_RX_CLSH_DECAY_CTRL,
 				CDC_RX_CLSH_DECAY_RATE_MASK, 0x0);
 		snd_soc_component_write_field(component,
-				CDC_RX_RX1_RX_PATH_CFG0,
+				CDC_RX_RXn_RX_PATH_CFG0(rx, 1),
 				CDC_RX_RXn_CLSH_EN_MASK, 0x1);
 		break;
 	case INTERP_AUX:
 		snd_soc_component_update_bits(component,
-				CDC_RX_RX2_RX_PATH_CFG0,
+				CDC_RX_RXn_RX_PATH_CFG0(rx, 2),
 				CDC_RX_RX2_DLY_Z_EN_MASK, 1);
 		snd_soc_component_write_field(component,
-				CDC_RX_RX2_RX_PATH_CFG0,
+				CDC_RX_RXn_RX_PATH_CFG0(rx, 2),
 				CDC_RX_RX2_CLSH_EN_MASK, 1);
 		break;
 	}
@@ -2218,16 +2395,17 @@ static int rx_macro_config_classh(struct snd_soc_component *component,
 static void rx_macro_hd2_control(struct snd_soc_component *component,
 				 u16 interp_idx, int event)
 {
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 	u16 hd2_scale_reg, hd2_enable_reg;
 
 	switch (interp_idx) {
 	case INTERP_HPHL:
-		hd2_scale_reg = CDC_RX_RX0_RX_PATH_SEC3;
-		hd2_enable_reg = CDC_RX_RX0_RX_PATH_CFG0;
+		hd2_scale_reg = CDC_RX_RXn_RX_PATH_SEC3(rx, 0);
+		hd2_enable_reg = CDC_RX_RXn_RX_PATH_CFG0(rx, 0);
 		break;
 	case INTERP_HPHR:
-		hd2_scale_reg = CDC_RX_RX1_RX_PATH_SEC3;
-		hd2_enable_reg = CDC_RX_RX1_RX_PATH_CFG0;
+		hd2_scale_reg = CDC_RX_RXn_RX_PATH_SEC3(rx, 1);
+		hd2_enable_reg = CDC_RX_RXn_RX_PATH_CFG0(rx, 1);
 		break;
 	}
 
@@ -2482,7 +2660,7 @@ static int rx_macro_hphdelay_lutbypass(struct snd_soc_component *component,
 		if (interp_idx == INTERP_HPHL) {
 			if (rx->is_ear_mode_on)
 				snd_soc_component_write_field(component,
-					CDC_RX_RX0_RX_PATH_CFG1,
+					CDC_RX_RXn_RX_PATH_CFG1(rx, 0),
 					CDC_RX_RX0_HPH_L_EAR_SEL_MASK, 0x1);
 			else
 				snd_soc_component_write_field(component,
@@ -2499,7 +2677,7 @@ static int rx_macro_hphdelay_lutbypass(struct snd_soc_component *component,
 
 	if (hph_lut_bypass_reg && SND_SOC_DAPM_EVENT_OFF(event)) {
 		snd_soc_component_write_field(component,
-					CDC_RX_RX0_RX_PATH_CFG1,
+					CDC_RX_RXn_RX_PATH_CFG1(rx, 0),
 					CDC_RX_RX0_HPH_L_EAR_SEL_MASK, 0x0);
 		snd_soc_component_update_bits(component, hph_lut_bypass_reg,
 					CDC_RX_TOP_HPH_LUT_BYPASS_MASK, 0);
@@ -2516,11 +2694,13 @@ static int rx_macro_enable_interp_clk(struct snd_soc_component *component,
 	u16 main_reg, dsm_reg, rx_cfg2_reg;
 	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 
-	main_reg = CDC_RX_RXn_RX_PATH_CTL(interp_idx);
-	dsm_reg = CDC_RX_RXn_RX_PATH_DSM_CTL(interp_idx);
+	main_reg = CDC_RX_RXn_RX_PATH_CTL(rx, interp_idx);
+	dsm_reg = CDC_RX_RXn_RX_PATH_DSM_CTL(rx, interp_idx);
+
 	if (interp_idx == INTERP_AUX)
-		dsm_reg = CDC_RX_RX2_RX_PATH_DSM_CTL;
-	rx_cfg2_reg = CDC_RX_RXn_RX_PATH_CFG2(interp_idx);
+		dsm_reg = CDC_RX_RXn_RX_PATH_DSM_CTL(rx, 2);
+
+	rx_cfg2_reg = CDC_RX_RXn_RX_PATH_CFG2(rx, interp_idx);
 
 	if (SND_SOC_DAPM_EVENT_ON(event)) {
 		if (rx->main_clk_users[interp_idx] == 0) {
@@ -2587,10 +2767,11 @@ static int rx_macro_enable_mix_path(struct snd_soc_dapm_widget *w,
 				    struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 	u16 gain_reg, mix_reg;
 
-	gain_reg = CDC_RX_RXn_RX_VOL_MIX_CTL(w->shift);
-	mix_reg = CDC_RX_RXn_RX_PATH_MIX_CTL(w->shift);
+	gain_reg = CDC_RX_RXn_RX_VOL_MIX_CTL(rx, w->shift);
+	mix_reg = CDC_RX_RXn_RX_PATH_MIX_CTL(rx, w->shift);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -2621,17 +2802,18 @@ static int rx_macro_enable_rx_path_clk(struct snd_soc_dapm_widget *w,
 				       struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		rx_macro_enable_interp_clk(component, event, w->shift);
-		snd_soc_component_write_field(component, CDC_RX_RXn_RX_PATH_CFG1(w->shift),
+		snd_soc_component_write_field(component, CDC_RX_RXn_RX_PATH_CFG1(rx, w->shift),
 					      CDC_RX_RXn_SIDETONE_EN_MASK, 1);
-		snd_soc_component_write_field(component, CDC_RX_RXn_RX_PATH_CTL(w->shift),
+		snd_soc_component_write_field(component, CDC_RX_RXn_RX_PATH_CTL(rx, w->shift),
 					      CDC_RX_PATH_CLK_EN_MASK, 1);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		snd_soc_component_write_field(component, CDC_RX_RXn_RX_PATH_CFG1(w->shift),
+		snd_soc_component_write_field(component, CDC_RX_RXn_RX_PATH_CFG1(rx, w->shift),
 					      CDC_RX_RXn_SIDETONE_EN_MASK, 0);
 		rx_macro_enable_interp_clk(component, event, w->shift);
 		break;
@@ -2801,20 +2983,34 @@ static int rx_macro_iir_filter_info(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-static const struct snd_kcontrol_new rx_macro_snd_controls[] = {
-	SOC_SINGLE_S8_TLV("RX_RX0 Digital Volume", CDC_RX_RX0_RX_VOL_CTL,
-			  -84, 40, digital_gain),
+static const struct snd_kcontrol_new rx_macro_def_snd_controls[] = {
 	SOC_SINGLE_S8_TLV("RX_RX1 Digital Volume", CDC_RX_RX1_RX_VOL_CTL,
 			  -84, 40, digital_gain),
 	SOC_SINGLE_S8_TLV("RX_RX2 Digital Volume", CDC_RX_RX2_RX_VOL_CTL,
 			  -84, 40, digital_gain),
-	SOC_SINGLE_S8_TLV("RX_RX0 Mix Digital Volume", CDC_RX_RX0_RX_VOL_MIX_CTL,
-			  -84, 40, digital_gain),
 	SOC_SINGLE_S8_TLV("RX_RX1 Mix Digital Volume", CDC_RX_RX1_RX_VOL_MIX_CTL,
 			  -84, 40, digital_gain),
 	SOC_SINGLE_S8_TLV("RX_RX2 Mix Digital Volume", CDC_RX_RX2_RX_VOL_MIX_CTL,
 			  -84, 40, digital_gain),
+};
+
+static const struct snd_kcontrol_new rx_macro_2_6_snd_controls[] = {
+
+	SOC_SINGLE_S8_TLV("RX_RX1 Digital Volume", CDC_2_6_RX_RX1_RX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX_RX2 Digital Volume", CDC_2_6_RX_RX2_RX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX_RX1 Mix Digital Volume", CDC_2_6_RX_RX1_RX_VOL_MIX_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX_RX2 Mix Digital Volume", CDC_2_6_RX_RX2_RX_VOL_MIX_CTL,
+			  -84, 40, digital_gain),
+};
 
+static const struct snd_kcontrol_new rx_macro_snd_controls[] = {
+	SOC_SINGLE_S8_TLV("RX_RX0 Digital Volume", CDC_RX_RX0_RX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX_RX0 Mix Digital Volume", CDC_RX_RX0_RX_VOL_MIX_CTL,
+			  -84, 40, digital_gain),
 	SOC_SINGLE_EXT("RX_COMP1 Switch", SND_SOC_NOPM, RX_MACRO_COMP1, 1, 0,
 		rx_macro_get_compander, rx_macro_set_compander),
 	SOC_SINGLE_EXT("RX_COMP2 Switch", SND_SOC_NOPM, RX_MACRO_COMP2, 1, 0,
@@ -2932,6 +3128,16 @@ static int rx_macro_enable_echo(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static const struct snd_soc_dapm_widget rx_macro_2_6_dapm_widgets[] = {
+	SND_SOC_DAPM_MUX("RX INT1 DEM MUX", SND_SOC_NOPM, 0, 0,
+			 &rx_2_6_int1_dem_inp_mux),
+};
+
+static const struct snd_soc_dapm_widget rx_macro_def_dapm_widgets[] = {
+	SND_SOC_DAPM_MUX("RX INT1 DEM MUX", SND_SOC_NOPM, 0, 0,
+			 &rx_int1_dem_inp_mux),
+};
+
 static const struct snd_soc_dapm_widget rx_macro_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_IN("RX AIF1 PB", "RX_MACRO_AIF1 Playback", 0,
 		SND_SOC_NOPM, 0, 0),
@@ -2948,6 +3154,8 @@ static const struct snd_soc_dapm_widget rx_macro_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_OUT("RX AIF_ECHO", "RX_AIF_ECHO Capture", 0,
 		SND_SOC_NOPM, 0, 0),
 
+	SND_SOC_DAPM_MUX("RX INT0 DEM MUX", SND_SOC_NOPM, 0, 0,
+			 &rx_int0_dem_inp_mux),
 	SND_SOC_DAPM_MUX("RX_MACRO RX0 MUX", SND_SOC_NOPM, RX_MACRO_RX0, 0,
 			 &rx_macro_rx0_mux),
 	SND_SOC_DAPM_MUX("RX_MACRO RX1 MUX", SND_SOC_NOPM, RX_MACRO_RX1, 0,
@@ -3001,10 +3209,6 @@ static const struct snd_soc_dapm_widget rx_macro_dapm_widgets[] = {
 	SND_SOC_DAPM_MIXER("SRC1", CDC_RX_SIDETONE_SRC1_ST_SRC_PATH_CTL,
 		4, 0, NULL, 0),
 
-	SND_SOC_DAPM_MUX("RX INT0 DEM MUX", SND_SOC_NOPM, 0, 0,
-			 &rx_int0_dem_inp_mux),
-	SND_SOC_DAPM_MUX("RX INT1 DEM MUX", SND_SOC_NOPM, 0, 0,
-			 &rx_int1_dem_inp_mux),
 
 	SND_SOC_DAPM_MUX_E("RX INT0_2 MUX", SND_SOC_NOPM, INTERP_HPHL, 0,
 		&rx_int0_2_mux, rx_macro_enable_mix_path,
@@ -3399,32 +3603,53 @@ static const struct snd_soc_dapm_route rx_audio_map[] = {
 
 static int rx_macro_component_probe(struct snd_soc_component *component)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
+	const struct snd_soc_dapm_widget *widgets;
+	const struct snd_kcontrol_new *controls;
+	unsigned int num_controls;
+	int ret, num_widgets;
 
 	snd_soc_component_init_regmap(component, rx->regmap);
 
-	snd_soc_component_update_bits(component, CDC_RX_RX0_RX_PATH_SEC7,
+	snd_soc_component_update_bits(component, CDC_RX_RXn_RX_PATH_SEC7(rx, 0),
 				      CDC_RX_DSM_OUT_DELAY_SEL_MASK,
 				      CDC_RX_DSM_OUT_DELAY_TWO_SAMPLE);
-	snd_soc_component_update_bits(component, CDC_RX_RX1_RX_PATH_SEC7,
+	snd_soc_component_update_bits(component, CDC_RX_RXn_RX_PATH_SEC7(rx, 1),
 				      CDC_RX_DSM_OUT_DELAY_SEL_MASK,
 				      CDC_RX_DSM_OUT_DELAY_TWO_SAMPLE);
-	snd_soc_component_update_bits(component, CDC_RX_RX2_RX_PATH_SEC7,
+	snd_soc_component_update_bits(component, CDC_RX_RXn_RX_PATH_SEC7(rx, 2),
 				      CDC_RX_DSM_OUT_DELAY_SEL_MASK,
 				      CDC_RX_DSM_OUT_DELAY_TWO_SAMPLE);
-	snd_soc_component_update_bits(component, CDC_RX_RX0_RX_PATH_CFG3,
+	snd_soc_component_update_bits(component, CDC_RX_RXn_RX_PATH_CFG3(rx, 0),
 				      CDC_RX_DC_COEFF_SEL_MASK,
 				      CDC_RX_DC_COEFF_SEL_TWO);
-	snd_soc_component_update_bits(component, CDC_RX_RX1_RX_PATH_CFG3,
+	snd_soc_component_update_bits(component, CDC_RX_RXn_RX_PATH_CFG3(rx, 1),
 				      CDC_RX_DC_COEFF_SEL_MASK,
 				      CDC_RX_DC_COEFF_SEL_TWO);
-	snd_soc_component_update_bits(component, CDC_RX_RX2_RX_PATH_CFG3,
+	snd_soc_component_update_bits(component, CDC_RX_RXn_RX_PATH_CFG3(rx, 2),
 				      CDC_RX_DC_COEFF_SEL_MASK,
 				      CDC_RX_DC_COEFF_SEL_TWO);
 
+	if (rx->codec_version == LPASS_CODEC_VERSION_2_6) {
+		controls = rx_macro_2_6_snd_controls;
+		num_controls = ARRAY_SIZE(rx_macro_2_6_snd_controls);
+		widgets = rx_macro_2_6_dapm_widgets;
+		num_widgets = ARRAY_SIZE(rx_macro_2_6_dapm_widgets);
+	} else {
+		controls = rx_macro_def_snd_controls;
+		num_controls = ARRAY_SIZE(rx_macro_def_snd_controls);
+		widgets = rx_macro_def_dapm_widgets;
+		num_widgets = ARRAY_SIZE(rx_macro_def_dapm_widgets);
+	}
+
 	rx->component = component;
 
-	return 0;
+	ret = snd_soc_add_component_controls(component, controls, num_controls);
+	if (ret)
+		return ret;
+
+	return snd_soc_dapm_new_controls(dapm, widgets, num_widgets);
 }
 
 static int swclk_gate_enable(struct clk_hw *hw)
@@ -3523,11 +3748,12 @@ static const struct snd_soc_component_driver rx_macro_component_drv = {
 
 static int rx_macro_probe(struct platform_device *pdev)
 {
+	struct reg_default *reg_defaults;
 	struct device *dev = &pdev->dev;
 	kernel_ulong_t flags;
 	struct rx_macro *rx;
 	void __iomem *base;
-	int ret;
+	int ret, def_count;
 
 	flags = (kernel_ulong_t)device_get_match_data(dev);
 
@@ -3567,6 +3793,33 @@ static int rx_macro_probe(struct platform_device *pdev)
 		goto err;
 	}
 
+	rx->codec_version = lpass_macro_get_codec_version();
+	switch (rx->codec_version) {
+	case LPASS_CODEC_VERSION_2_6:
+		rx->rxn_reg_offset = 0xc0;
+		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_6_defaults);
+		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
+		if (!reg_defaults)
+			return -ENOMEM;
+		memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
+		memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
+				rx_2_6_defaults, sizeof(rx_2_6_defaults));
+		break;
+	default:
+		rx->rxn_reg_offset = 0x80;
+		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_pre_2_6_defaults);
+		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
+		if (!reg_defaults)
+			return -ENOMEM;
+		memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
+		memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
+				rx_pre_2_6_defaults, sizeof(rx_pre_2_6_defaults));
+		break;
+	}
+
+	rx_regmap_config.reg_defaults = reg_defaults,
+	rx_regmap_config.num_reg_defaults = def_count;
+
 	rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
 	if (IS_ERR(rx->regmap)) {
 		ret = PTR_ERR(rx->regmap);
@@ -3629,6 +3882,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clkout;
 
+	kfree(reg_defaults);
 	return 0;
 
 err_clkout:
@@ -3642,6 +3896,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 err_dcodec:
 	clk_disable_unprepare(rx->macro);
 err:
+	kfree(reg_defaults);
 	lpass_macro_pds_exit(rx->pds);
 
 	return ret;
-- 
2.25.1

