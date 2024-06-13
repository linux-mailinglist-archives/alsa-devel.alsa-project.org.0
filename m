Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D01A906A72
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 12:50:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90FEBE9A;
	Thu, 13 Jun 2024 12:50:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90FEBE9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718275858;
	bh=Q5qXrkmMMKvYiQVQS+98K9kxshLYVF15IXhA4UaxwHU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ctYgcO0PVemhUi65DXjWhQh7KFcDPyQJTqBSX49bs+qqOr+xACzmfBB4QkhC6XYK6
	 HbJYlTST+35VLzhfI+dlFZVCE3+Z2YPzxEp8t5sxbb7iHrAHIp7tKMTnitb9LZOFb0
	 /kPGTXHHQRW85mCE/GUCB3poVqcIir1VS7ieVi24=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAF77F80606; Thu, 13 Jun 2024 12:49:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E38CF805F7;
	Thu, 13 Jun 2024 12:49:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99F2DF80580; Thu, 13 Jun 2024 12:49:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9FEB9F80579
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 12:49:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FEB9F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=nWP9x6ql
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ebed33cbaeso8006991fa.1
        for <alsa-devel@alsa-project.org>;
 Thu, 13 Jun 2024 03:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718275786; x=1718880586;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+EFZ7aGP5K8ollcI2eEzGJdE98yax1we/UmwmsJYk5M=;
        b=nWP9x6qlp+nRSsna/0cpwJ+wsIHp9Sngmu8JqI2Tag+ebISY8dW5sk/2YHa4IZPAxu
         9+wXcvPgVBuka7Uy4oR7tFu/Eks1Z8Q1rQ55FbPrrOTb+ZQ0jglKJGO1qW9sve8zWy8y
         LJIR8DzJSmX0fsRdfaq1oV5q2NO68V8x+8wrdvgUNJxNXwvu/R95Q0k2Tl/frHEb3Rk8
         0PwoDweYIBkg48k3GtuvDEhE2mvT7/GSNA+pKwvf19iAxaNf7kEIiPCGdABKMXsYVX0R
         1od6NFHBeJ1keSXmFZuHvCYyWSMURfMIM/MS9pWxmCKQKy+2qYm/7u6kcorvOwmAD2l7
         4h+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718275786; x=1718880586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+EFZ7aGP5K8ollcI2eEzGJdE98yax1we/UmwmsJYk5M=;
        b=gDxoiZjnz/EgZTI6DaCq63q/yvoqIw5rdoaEk2fQ2PVwcNJwI7VpeKPn9InbzQKhzp
         e6sxKfHq3P+e3N7dDQPXkqsZtiAeB7jR8E7NuasyfLNH5mPm/eOrIVECUX4ohEegHa11
         NyuQxjzSTB9nb7DHKnbyISxGMa4uapirDMaLhz3KoBz2280lTnSmGC3ICpVrP68yduUi
         cfg2kcOeNBWaTxfA2M1o2r/4r+b7dUdbEke01qLgCYeer0Bw0zOL0Vie5PMZNHrPjcnV
         pzeGWpYeoKTvUKnBEPtdGVMYAGRaNqifLmsfXLXokDxG8fMTPhiqg3lOUTKNLQzTYwIT
         srAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLHrwn5WGPJxhLZ23KOKe5FZdGLAVlbsyUKEZ2IKSPlqytvniLkgvaFEsmY/SR+w1QvZsuaTU3Th5zylYcg+uLiQBSL8xNm8bDsNY=
X-Gm-Message-State: AOJu0YybHffcXXn67CZHuet2Va+KBJ9pxiq7mWQo0GSOzTmWz57JQ34Q
	pDtC2W/t0+J+5ssFdofygfpX+7BuGyK+1u7CBroVeci7vwwSOf9lvqvFX0bYXGI=
X-Google-Smtp-Source: 
 AGHT+IEo0/iwZawg1zUJqiJfhp3mWJ6WuqCeA7on9TRDsYPTsORcLXQl+8T8rl/FlvDttieQdP7p6A==
X-Received: by 2002:a2e:be90:0:b0:2e9:841d:dacb with SMTP id
 38308e7fff4ca-2ebfca55763mr31590221fa.40.1718275786409;
        Thu, 13 Jun 2024 03:49:46 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72cdf2bsm762618a12.17.2024.06.13.03.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 03:49:44 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Thu, 13 Jun 2024 11:49:33 +0100
Subject: [PATCH v4 3/3] ASoC: codec: lpass-rx-macro: add support for 2.5
 codec version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-lpass-codec-v25-v4-3-f63d3676dbc4@linaro.org>
References: <20240612-lpass-codec-v25-v4-0-f63d3676dbc4@linaro.org>
In-Reply-To: <20240612-lpass-codec-v25-v4-0-f63d3676dbc4@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11767;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=Q5qXrkmMMKvYiQVQS+98K9kxshLYVF15IXhA4UaxwHU=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmas7E+sPjEpcG5qIMu8TlnucpB+aedEuBBHIpQ
 H1WTRgCbkqJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZmrOxAAKCRB6of1ZxzRV
 N13aB/9xtAjRcCvZTtQqy6qrfVwfEmp4ZuM9k21caEBhHFoSfkfqYGMAz29tBD5GuwEdtmB0lqy
 F8fbznZOFFq8hl62vogaUgRispeVx3slVwN6qfy4tVRv+HmzHSkwFAM8lHMy9a1E27KgK1oqYVI
 XTkbb940KWQZFufbljl76vFqID5CcrjlxBDHbxPNzUJfJO4286MSq+cHeT2xFh+myOtXx76sC5V
 ruENdAzVGMPhDlwfrpU7xxOjiyJx07c8wl6D+BGVpv6y/wZ14GMA/hJwzx40LIwxGjP15cqN0eJ
 7JpgIjIqU2VbLNjRPMaYRIv0yJttmnkFK0tjPbQkAxZzum07
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Message-ID-Hash: V2HVUDPLJ6U6NM37KRWJHUPUXJKEATPM
X-Message-ID-Hash: V2HVUDPLJ6U6NM37KRWJHUPUXJKEATPM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V2HVUDPLJ6U6NM37KRWJHUPUXJKEATPM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

LPASS Codec v2.5 has significant changes in the rx register strides.
Due to this headset playback on SM8550, SM8650, x1e80100 and all SoCs
after SM8450 have only Left working.

This patch adjusts the registers to accomdate 2.5 changes. With this
fixed now L and R are functional on Headset playback.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
---
 sound/soc/codecs/lpass-rx-macro.c | 198 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 198 insertions(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 360c9003a890..d962a9599694 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -262,6 +262,53 @@
 #define CDC_RX_RX2_RX_PATH_MIX_SEC0	(0x0544)
 #define CDC_RX_RX2_RX_PATH_MIX_SEC1	(0x0548)
 #define CDC_RX_RX2_RX_PATH_DSM_CTL	(0x054C)
+
+/* LPASS CODEC version 2.5 rx reg offsets */
+#define CDC_2_5_RX_RX1_RX_PATH_CTL		(0x04c0)
+#define CDC_2_5_RX_RX1_RX_PATH_CFG0		(0x04c4)
+#define CDC_2_5_RX_RX1_RX_PATH_CFG1		(0x04c8)
+#define CDC_2_5_RX_RX1_RX_PATH_CFG2		(0x04cC)
+#define CDC_2_5_RX_RX1_RX_PATH_CFG3		(0x04d0)
+#define CDC_2_5_RX_RX1_RX_VOL_CTL		(0x04d4)
+#define CDC_2_5_RX_RX1_RX_PATH_MIX_CTL		(0x04d8)
+#define CDC_2_5_RX_RX1_RX_PATH_MIX_CFG		(0x04dC)
+#define CDC_2_5_RX_RX1_RX_VOL_MIX_CTL		(0x04e0)
+#define CDC_2_5_RX_RX1_RX_PATH_SEC1		(0x04e4)
+#define CDC_2_5_RX_RX1_RX_PATH_SEC2		(0x04e8)
+#define CDC_2_5_RX_RX1_RX_PATH_SEC3		(0x04eC)
+#define CDC_2_5_RX_RX1_RX_PATH_SEC4		(0x04f0)
+#define CDC_2_5_RX_RX1_RX_PATH_SEC7		(0x04f4)
+#define CDC_2_5_RX_RX1_RX_PATH_MIX_SEC0		(0x04f8)
+#define CDC_2_5_RX_RX1_RX_PATH_MIX_SEC1		(0x04fC)
+#define CDC_2_5_RX_RX1_RX_PATH_DSM_CTL		(0x0500)
+#define CDC_2_5_RX_RX1_RX_PATH_DSM_DATA1	(0x0504)
+#define CDC_2_5_RX_RX1_RX_PATH_DSM_DATA2	(0x0508)
+#define CDC_2_5_RX_RX1_RX_PATH_DSM_DATA3	(0x050C)
+#define CDC_2_5_RX_RX1_RX_PATH_DSM_DATA4	(0x0510)
+#define CDC_2_5_RX_RX1_RX_PATH_DSM_DATA5	(0x0514)
+#define CDC_2_5_RX_RX1_RX_PATH_DSM_DATA6	(0x0518)
+
+#define CDC_2_5_RX_RX2_RX_PATH_CTL		(0x0580)
+#define CDC_2_5_RX_RX2_RX_PATH_CFG0		(0x0584)
+#define CDC_2_5_RX_RX2_RX_PATH_CFG1		(0x0588)
+#define CDC_2_5_RX_RX2_RX_PATH_CFG2		(0x058C)
+#define CDC_2_5_RX_RX2_RX_PATH_CFG3		(0x0590)
+#define CDC_2_5_RX_RX2_RX_VOL_CTL		(0x0594)
+#define CDC_2_5_RX_RX2_RX_PATH_MIX_CTL		(0x0598)
+#define CDC_2_5_RX_RX2_RX_PATH_MIX_CFG		(0x059C)
+#define CDC_2_5_RX_RX2_RX_VOL_MIX_CTL		(0x05a0)
+#define CDC_2_5_RX_RX2_RX_PATH_SEC0		(0x05a4)
+#define CDC_2_5_RX_RX2_RX_PATH_SEC1		(0x05a8)
+#define CDC_2_5_RX_RX2_RX_PATH_SEC2		(0x05aC)
+#define CDC_2_5_RX_RX2_RX_PATH_SEC3		(0x05b0)
+#define CDC_2_5_RX_RX2_RX_PATH_SEC4		(0x05b4)
+#define CDC_2_5_RX_RX2_RX_PATH_SEC5		(0x05b8)
+#define CDC_2_5_RX_RX2_RX_PATH_SEC6		(0x05bC)
+#define CDC_2_5_RX_RX2_RX_PATH_SEC7		(0x05c0)
+#define CDC_2_5_RX_RX2_RX_PATH_MIX_SEC0		(0x05c4)
+#define CDC_2_5_RX_RX2_RX_PATH_MIX_SEC1		(0x05c8)
+#define CDC_2_5_RX_RX2_RX_PATH_DSM_CTL		(0x05cC)
+
 #define CDC_RX_IDLE_DETECT_PATH_CTL	(0x0780)
 #define CDC_RX_IDLE_DETECT_CFG0		(0x0784)
 #define CDC_RX_IDLE_DETECT_CFG1		(0x0788)
@@ -764,6 +811,8 @@ static SOC_ENUM_SINGLE_DECL(rx_int0_dem_inp_enum, CDC_RX_RX0_RX_PATH_CFG1, 0,
 			    rx_int_dem_inp_mux_text);
 static SOC_ENUM_SINGLE_DECL(rx_int1_dem_inp_enum, CDC_RX_RX1_RX_PATH_CFG1, 0,
 			    rx_int_dem_inp_mux_text);
+static SOC_ENUM_SINGLE_DECL(rx_2_5_int1_dem_inp_enum, CDC_2_5_RX_RX1_RX_PATH_CFG1, 0,
+			    rx_int_dem_inp_mux_text);
 
 static SOC_ENUM_SINGLE_DECL(rx_macro_rx0_enum, SND_SOC_NOPM, 0, rx_macro_mux_text);
 static SOC_ENUM_SINGLE_DECL(rx_macro_rx1_enum, SND_SOC_NOPM, 0, rx_macro_mux_text);
@@ -1083,6 +1132,52 @@ static const struct reg_default rx_defaults[] = {
 	{ CDC_RX_DSD1_CFG2, 0x96 },
 };
 
+static const struct reg_default rx_2_5_defaults[] = {
+	{ CDC_2_5_RX_RX1_RX_PATH_CTL, 0x04 },
+	{ CDC_2_5_RX_RX1_RX_PATH_CFG0, 0x00 },
+	{ CDC_2_5_RX_RX1_RX_PATH_CFG1, 0x64 },
+	{ CDC_2_5_RX_RX1_RX_PATH_CFG2, 0x8F },
+	{ CDC_2_5_RX_RX1_RX_PATH_CFG3, 0x00 },
+	{ CDC_2_5_RX_RX1_RX_VOL_CTL, 0x00 },
+	{ CDC_2_5_RX_RX1_RX_PATH_MIX_CTL, 0x04 },
+	{ CDC_2_5_RX_RX1_RX_PATH_MIX_CFG, 0x7E },
+	{ CDC_2_5_RX_RX1_RX_VOL_MIX_CTL, 0x00 },
+	{ CDC_2_5_RX_RX1_RX_PATH_SEC1, 0x08 },
+	{ CDC_2_5_RX_RX1_RX_PATH_SEC2, 0x00 },
+	{ CDC_2_5_RX_RX1_RX_PATH_SEC3, 0x00 },
+	{ CDC_2_5_RX_RX1_RX_PATH_SEC4, 0x00 },
+	{ CDC_2_5_RX_RX1_RX_PATH_SEC7, 0x00 },
+	{ CDC_2_5_RX_RX1_RX_PATH_MIX_SEC0, 0x08 },
+	{ CDC_2_5_RX_RX1_RX_PATH_MIX_SEC1, 0x00 },
+	{ CDC_2_5_RX_RX1_RX_PATH_DSM_CTL, 0x08 },
+	{ CDC_2_5_RX_RX1_RX_PATH_DSM_DATA1, 0x00 },
+	{ CDC_2_5_RX_RX1_RX_PATH_DSM_DATA2, 0x00 },
+	{ CDC_2_5_RX_RX1_RX_PATH_DSM_DATA3, 0x00 },
+	{ CDC_2_5_RX_RX1_RX_PATH_DSM_DATA4, 0x55 },
+	{ CDC_2_5_RX_RX1_RX_PATH_DSM_DATA5, 0x55 },
+	{ CDC_2_5_RX_RX1_RX_PATH_DSM_DATA6, 0x55 },
+	{ CDC_2_5_RX_RX2_RX_PATH_CTL, 0x04 },
+	{ CDC_2_5_RX_RX2_RX_PATH_CFG0, 0x00 },
+	{ CDC_2_5_RX_RX2_RX_PATH_CFG1, 0x64 },
+	{ CDC_2_5_RX_RX2_RX_PATH_CFG2, 0x8F },
+	{ CDC_2_5_RX_RX2_RX_PATH_CFG3, 0x00 },
+	{ CDC_2_5_RX_RX2_RX_VOL_CTL, 0x00 },
+	{ CDC_2_5_RX_RX2_RX_PATH_MIX_CTL, 0x04 },
+	{ CDC_2_5_RX_RX2_RX_PATH_MIX_CFG, 0x7E },
+	{ CDC_2_5_RX_RX2_RX_VOL_MIX_CTL, 0x00 },
+	{ CDC_2_5_RX_RX2_RX_PATH_SEC0, 0x04 },
+	{ CDC_2_5_RX_RX2_RX_PATH_SEC1, 0x08 },
+	{ CDC_2_5_RX_RX2_RX_PATH_SEC2, 0x00 },
+	{ CDC_2_5_RX_RX2_RX_PATH_SEC3, 0x00 },
+	{ CDC_2_5_RX_RX2_RX_PATH_SEC4, 0x00 },
+	{ CDC_2_5_RX_RX2_RX_PATH_SEC5, 0x00 },
+	{ CDC_2_5_RX_RX2_RX_PATH_SEC6, 0x00 },
+	{ CDC_2_5_RX_RX2_RX_PATH_SEC7, 0x00 },
+	{ CDC_2_5_RX_RX2_RX_PATH_MIX_SEC0, 0x08 },
+	{ CDC_2_5_RX_RX2_RX_PATH_MIX_SEC1, 0x00 },
+	{ CDC_2_5_RX_RX2_RX_PATH_DSM_CTL, 0x00 },
+};
+
 static const struct reg_default rx_pre_2_5_defaults[] = {
 	{ CDC_RX_RX1_RX_PATH_CTL, 0x04 },
 	{ CDC_RX_RX1_RX_PATH_CFG0, 0x00 },
@@ -1236,6 +1331,58 @@ static bool rx_pre_2_5_is_rw_register(struct device *dev, unsigned int reg)
 	return false;
 }
 
+static bool rx_2_5_is_rw_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case CDC_2_5_RX_RX1_RX_PATH_CTL:
+	case CDC_2_5_RX_RX1_RX_PATH_CFG0:
+	case CDC_2_5_RX_RX1_RX_PATH_CFG1:
+	case CDC_2_5_RX_RX1_RX_PATH_CFG2:
+	case CDC_2_5_RX_RX1_RX_PATH_CFG3:
+	case CDC_2_5_RX_RX1_RX_VOL_CTL:
+	case CDC_2_5_RX_RX1_RX_PATH_MIX_CTL:
+	case CDC_2_5_RX_RX1_RX_PATH_MIX_CFG:
+	case CDC_2_5_RX_RX1_RX_VOL_MIX_CTL:
+	case CDC_2_5_RX_RX1_RX_PATH_SEC1:
+	case CDC_2_5_RX_RX1_RX_PATH_SEC2:
+	case CDC_2_5_RX_RX1_RX_PATH_SEC3:
+	case CDC_2_5_RX_RX1_RX_PATH_SEC4:
+	case CDC_2_5_RX_RX1_RX_PATH_SEC7:
+	case CDC_2_5_RX_RX1_RX_PATH_MIX_SEC0:
+	case CDC_2_5_RX_RX1_RX_PATH_MIX_SEC1:
+	case CDC_2_5_RX_RX1_RX_PATH_DSM_CTL:
+	case CDC_2_5_RX_RX1_RX_PATH_DSM_DATA1:
+	case CDC_2_5_RX_RX1_RX_PATH_DSM_DATA2:
+	case CDC_2_5_RX_RX1_RX_PATH_DSM_DATA3:
+	case CDC_2_5_RX_RX1_RX_PATH_DSM_DATA4:
+	case CDC_2_5_RX_RX1_RX_PATH_DSM_DATA5:
+	case CDC_2_5_RX_RX1_RX_PATH_DSM_DATA6:
+	case CDC_2_5_RX_RX2_RX_PATH_CTL:
+	case CDC_2_5_RX_RX2_RX_PATH_CFG0:
+	case CDC_2_5_RX_RX2_RX_PATH_CFG1:
+	case CDC_2_5_RX_RX2_RX_PATH_CFG2:
+	case CDC_2_5_RX_RX2_RX_PATH_CFG3:
+	case CDC_2_5_RX_RX2_RX_VOL_CTL:
+	case CDC_2_5_RX_RX2_RX_PATH_MIX_CTL:
+	case CDC_2_5_RX_RX2_RX_PATH_MIX_CFG:
+	case CDC_2_5_RX_RX2_RX_VOL_MIX_CTL:
+	case CDC_2_5_RX_RX2_RX_PATH_SEC0:
+	case CDC_2_5_RX_RX2_RX_PATH_SEC1:
+	case CDC_2_5_RX_RX2_RX_PATH_SEC2:
+	case CDC_2_5_RX_RX2_RX_PATH_SEC3:
+	case CDC_2_5_RX_RX2_RX_PATH_SEC4:
+	case CDC_2_5_RX_RX2_RX_PATH_SEC5:
+	case CDC_2_5_RX_RX2_RX_PATH_SEC6:
+	case CDC_2_5_RX_RX2_RX_PATH_SEC7:
+	case CDC_2_5_RX_RX2_RX_PATH_MIX_SEC0:
+	case CDC_2_5_RX_RX2_RX_PATH_MIX_SEC1:
+	case CDC_2_5_RX_RX2_RX_PATH_DSM_CTL:
+		return true;
+	}
+
+	return false;
+}
+
 static bool rx_is_rw_register(struct device *dev, unsigned int reg)
 {
 	struct rx_macro *rx = dev_get_drvdata(dev);
@@ -1461,6 +1608,11 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
 	case LPASS_CODEC_VERSION_1_2:
 	case LPASS_CODEC_VERSION_2_0:
 		return rx_pre_2_5_is_rw_register(dev, reg);
+	case LPASS_CODEC_VERSION_2_5:
+	case LPASS_CODEC_VERSION_2_6:
+	case LPASS_CODEC_VERSION_2_7:
+	case LPASS_CODEC_VERSION_2_8:
+		return rx_2_5_is_rw_register(dev, reg);
 	default:
 		break;
 	}
@@ -1563,6 +1715,10 @@ static const struct snd_kcontrol_new rx_int1_dem_inp_mux =
 		SOC_DAPM_ENUM_EXT("rx_int1_dem_inp", rx_int1_dem_inp_enum,
 		  snd_soc_dapm_get_enum_double, rx_macro_int_dem_inp_mux_put);
 
+static const struct snd_kcontrol_new rx_2_5_int1_dem_inp_mux =
+		SOC_DAPM_ENUM_EXT("rx_int1_dem_inp", rx_2_5_int1_dem_inp_enum,
+		  snd_soc_dapm_get_enum_double, rx_macro_int_dem_inp_mux_put);
+
 static int rx_macro_set_prim_interpolator_rate(struct snd_soc_dai *dai,
 					       int rate_reg_val, u32 sample_rate)
 {
@@ -2847,6 +3003,18 @@ static const struct snd_kcontrol_new rx_macro_def_snd_controls[] = {
 			  -84, 40, digital_gain),
 };
 
+static const struct snd_kcontrol_new rx_macro_2_5_snd_controls[] = {
+
+	SOC_SINGLE_S8_TLV("RX_RX1 Digital Volume", CDC_2_5_RX_RX1_RX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX_RX2 Digital Volume", CDC_2_5_RX_RX2_RX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX_RX1 Mix Digital Volume", CDC_2_5_RX_RX1_RX_VOL_MIX_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX_RX2 Mix Digital Volume", CDC_2_5_RX_RX2_RX_VOL_MIX_CTL,
+			  -84, 40, digital_gain),
+};
+
 static const struct snd_kcontrol_new rx_macro_snd_controls[] = {
 	SOC_SINGLE_S8_TLV("RX_RX0 Digital Volume", CDC_RX_RX0_RX_VOL_CTL,
 			  -84, 40, digital_gain),
@@ -2968,6 +3136,12 @@ static int rx_macro_enable_echo(struct snd_soc_dapm_widget *w,
 
 	return 0;
 }
+
+static const struct snd_soc_dapm_widget rx_macro_2_5_dapm_widgets[] = {
+	SND_SOC_DAPM_MUX("RX INT1 DEM MUX", SND_SOC_NOPM, 0, 0,
+			 &rx_2_5_int1_dem_inp_mux),
+};
+
 static const struct snd_soc_dapm_widget rx_macro_def_dapm_widgets[] = {
 	SND_SOC_DAPM_MUX("RX INT1 DEM MUX", SND_SOC_NOPM, 0, 0,
 			 &rx_int1_dem_inp_mux),
@@ -3476,6 +3650,15 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
 		widgets = rx_macro_def_dapm_widgets;
 		num_widgets = ARRAY_SIZE(rx_macro_def_dapm_widgets);
 		break;
+	case LPASS_CODEC_VERSION_2_5:
+	case LPASS_CODEC_VERSION_2_6:
+	case LPASS_CODEC_VERSION_2_7:
+	case LPASS_CODEC_VERSION_2_8:
+		controls = rx_macro_2_5_snd_controls;
+		num_controls = ARRAY_SIZE(rx_macro_2_5_snd_controls);
+		widgets = rx_macro_2_5_dapm_widgets;
+		num_widgets = ARRAY_SIZE(rx_macro_2_5_dapm_widgets);
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -3646,6 +3829,21 @@ static int rx_macro_probe(struct platform_device *pdev)
 		memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
 				rx_pre_2_5_defaults, sizeof(rx_pre_2_5_defaults));
 		break;
+	case LPASS_CODEC_VERSION_2_5:
+	case LPASS_CODEC_VERSION_2_6:
+	case LPASS_CODEC_VERSION_2_7:
+	case LPASS_CODEC_VERSION_2_8:
+		rx->rxn_reg_stride = 0xc0;
+		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
+		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
+		if (!reg_defaults) {
+			ret = -ENOMEM;
+			goto err;
+		}
+		memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
+		memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
+				rx_2_5_defaults, sizeof(rx_2_5_defaults));
+		break;
 	default:
 		dev_err(rx->dev, "Unsupported Codec version (%d)\n", rx->codec_version);
 		ret = -EINVAL;

-- 
2.25.1

