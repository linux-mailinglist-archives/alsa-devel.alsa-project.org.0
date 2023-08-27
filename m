Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6522F789AFD
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Aug 2023 04:34:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED235AEA;
	Sun, 27 Aug 2023 04:33:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED235AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693103646;
	bh=mGhtWSzoPTusRWci884ej+oSaEZ8ctuPjimuqlXXMJI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Je+/VoKMqXGC34wVflszZ5XC7Rh8HyVDCctwlp1WnUOj1g++HvHbAe6S7NmunYJDU
	 V9ZosxpVioQNSutZbWduBvjNB+GcvyznBJCA98TCEfxJfZ7NJwaOdO+KK+Ez3Rfldi
	 ZajSiQB0fTUJkHdDFNSWCuH1X6pT3jERCkZLloic=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DA75F8056F; Sun, 27 Aug 2023 04:32:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4A11F80563;
	Sun, 27 Aug 2023 04:32:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3AA8F80158; Sun, 27 Aug 2023 04:32:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD6A7F80155
	for <alsa-devel@alsa-project.org>; Sun, 27 Aug 2023 04:32:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD6A7F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=lo9ZFtZg
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-77a62a84855so76417439f.1
        for <alsa-devel@alsa-project.org>;
 Sat, 26 Aug 2023 19:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693103528; x=1693708328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6JljaP6ydDpiKUAUEr2HJLofyqFW0MhNueQ/UlFehE=;
        b=lo9ZFtZglKjl08HKkE5t0WneBOqBkXhXzXR2N778Blp7gbLP1XcXlyM4hoSYaQwg9H
         jhiTL1MUwwo6IDuqSdhw1lTCA7YuQP/qjtmKjXsJ9uTKgvLZVW/ynSbudpOhq2nuexJJ
         Q8LCxVUg0XTp3hx7uQL8K2rOXFXiHwH1S7W/HBw1KjJegELDdErKqDdf5CBjsQzFc1MR
         7266uEIsBXOMz1QLbq2L/ok+QJ7TF5Xny/ed/31KrvO9D8dJKZiiBw2iVWpJRV+m6M/U
         piKEifYVVVblXXC6TGJI+ltxrq/jqsopS1UA48bDufRMq8TMQ1kPRo4v/1u1ZQYLW8cj
         iz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693103528; x=1693708328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E6JljaP6ydDpiKUAUEr2HJLofyqFW0MhNueQ/UlFehE=;
        b=KbCr7onmmm5EEQr5Xoh1+JZIb1WpDbJgVXosiCHN0crSYzY9FRZcKU+zqlaVBYUjPS
         kGgeTHFmRmIIOimMWHFBH7QJaQBCkZhox3HuJgpKILPxTrB0Lu71kqgK3YVsj31ps67S
         tJZKH9Mf1ETlYkW/ucn/j7k9GNmes6BbT8Cp0hyGTMk+RmeGQroelbaNtk8LUyOVoA9r
         cuenmq2xuS3zr2WBerxtlN+Dton5BjzKbBblYq5NY2AOQguI2GHeiDTEn0Hd9vCVptMB
         P+6T6J1RPRgFREp7ulJduWT3Cg3zipiJvzvmc4BVl9Pv1kDW0RUO4IEgMdfsXNe21gkM
         rh1Q==
X-Gm-Message-State: AOJu0Yx68hSHiN6u21zeBZvyiv+mKG+9a26tG4ZNiDufFEd4xHxfSGR8
	JxXJv3sPB46z14Cg+CwQ1j0=
X-Google-Smtp-Source: 
 AGHT+IFHmtefwiknYqi7kY+GlLeufxz2ZPziMtQjJxWIMqW4V/Lw28aZlw4f8ngVDEGD8Ckeq39R/Q==
X-Received: by 2002:a05:6e02:ca7:b0:34b:b024:a07c with SMTP id
 7-20020a056e020ca700b0034bb024a07cmr11373658ilg.5.1693103528163;
        Sat, 26 Aug 2023 19:32:08 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:80ee:1859:87ec:6d31])
        by smtp.gmail.com with ESMTPSA id
 n18-20020a056e0208f200b0034202d05fadsm1581533ilt.72.2023.08.26.19.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 19:32:07 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 2/3] arm64: dts: imx8mp: Add easrc node
Date: Sat, 26 Aug 2023 21:31:54 -0500
Message-Id: <20230827023155.467807-2-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827023155.467807-1-aford173@gmail.com>
References: <20230827023155.467807-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: E2I46JAEFHM6HELOITBNU27U4OC73WAY
X-Message-ID-Hash: E2I46JAEFHM6HELOITBNU27U4OC73WAY
X-MailFrom: aford173@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E2I46JAEFHM6HELOITBNU27U4OC73WAY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The i.MX8MP has an asynchronous sample rate converter which seems
to be the same as what is available on the i.MX8M Nano.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  No change

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 6f2f50e1639c..79cdd4c066c8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1453,6 +1453,26 @@ sai7: sai@30c80000 {
 					interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
 					status = "disabled";
 				};
+
+				easrc: easrc@30c90000 {
+					compatible = "fsl,imx8mp-easrc", "fsl,imx8mn-easrc";
+					reg = <0x30c90000 0x10000>;
+					interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_ASRC_IPG>;
+					clock-names = "mem";
+					dmas = <&sdma2 16 23 0> , <&sdma2 17 23 0>,
+					       <&sdma2 18 23 0> , <&sdma2 19 23 0>,
+					       <&sdma2 20 23 0> , <&sdma2 21 23 0>,
+					       <&sdma2 22 23 0> , <&sdma2 23 23 0>;
+					dma-names = "ctx0_rx", "ctx0_tx",
+						    "ctx1_rx", "ctx1_tx",
+						    "ctx2_rx", "ctx2_tx",
+						    "ctx3_rx", "ctx3_tx";
+					firmware-name = "imx/easrc/easrc-imx8mn.bin";
+					fsl,asrc-rate  = <8000>;
+					fsl,asrc-format = <2>;
+					status = "disabled";
+				};
 			};
 
 			sdma3: dma-controller@30e00000 {
-- 
2.39.2

