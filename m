Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6295781F17
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Aug 2023 19:59:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A844683A;
	Sun, 20 Aug 2023 19:58:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A844683A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692554340;
	bh=utWJC2u0/TBOd5YB38fmztzrVKBNiwuxPROqRgaQklM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CGDzx4U53jq+p1ToEHBsi8GOYYrlZPVzo1mZ5VyHOz4eZl1687clrHCJiuPAgPD8f
	 RSxY6MpUegJG5Da49Kv5QPgTAnPOicemR7v/vAgtEcyG6HwHT+5WqOfVyneilWJ0cq
	 xKvUkYfa2CNlq0XJ/0N/j9w3fuUY3W0MKJxloG3U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2C9FF80549; Sun, 20 Aug 2023 19:57:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4213AF80549;
	Sun, 20 Aug 2023 19:57:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57381F8025E; Sun, 20 Aug 2023 19:57:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1596AF8016C
	for <alsa-devel@alsa-project.org>; Sun, 20 Aug 2023 19:57:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1596AF8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=KzURO5AJ
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-791262638ffso101480739f.1
        for <alsa-devel@alsa-project.org>;
 Sun, 20 Aug 2023 10:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692554229; x=1693159029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tixiGJ6i1PZ9SXymw91nUfc5toP1B5evyHhJBDgTIcE=;
        b=KzURO5AJkuZp/OhmQyOo1d8V2X6FoW20Z2nCtaLzHqQ/RX/RTlAGMgkZD7GdeZgKR+
         Ofo8EXRQHmBcqqEqBcGxbq0vc9/Wq+gP8746e/ve+o9RTCqdD2855yUU4QDlYDxH6Pfn
         B9opvvhUnEM/8XhpnpYZqTbFSCXaqRdvap/t0ht5PwRu0tWEBINVRmlMLhViBKZC7xYH
         8dJb4MzFDJPWqjIoLsRb7MMwYKUaDNDYMqBLXhGwVJMjM2H7E4qzjjuXAsp3HL9NuRuU
         17yBWhiLjJTwY7WEI3L0D12VQAI+OnW6M4c2Re3Odzsg8gUQFv/Ootq2Xs7t6uq/AZV9
         5X5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692554229; x=1693159029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tixiGJ6i1PZ9SXymw91nUfc5toP1B5evyHhJBDgTIcE=;
        b=PZ+IvVmOStWlvADlwG23HzM0zrL7AKfzse0AU+d6nLNLDVGTC74BEU5c4Fooq/hMfe
         wHlmQlbalmAxA6QU4clB675YWwo5YEmE813u9ApGC8jg+nZRZ/iQUrh5gHOwy9jrZnlt
         6OagBKj64HiBFEqGBzQWO33g8m6EN/2WyBvIpXuM/u1Py6ZC5Ute/rSLrWNp60rV/Fw1
         J8lGxO9chb1dPOru32zeHlm7PB9jm75VF9QURcGexY+Bfcm0Y89/xkRFhjFnWQVZqbAs
         rMJeGp1jX6APzXPeoYZL70ZGB8AbelyowQxJGWRxX3whe+PU7AGq5SdXonvNx20Eoi5u
         gHQg==
X-Gm-Message-State: AOJu0YzXBAT7ENy3l4AkCq7LnmIWT5CREjFRKWqBfsiSUsfKGmxZv1xY
	tXAiOBolYV/wZQvvsAKcnWA=
X-Google-Smtp-Source: 
 AGHT+IGWLY4seK8Yz4fCltg3UPUf1L7ZFcoSQFhnD7/SFAe5DcEU6KPIaA2isCb1s4XdIKKKXj4hGg==
X-Received: by 2002:a6b:dd16:0:b0:791:8d:91de with SMTP id
 f22-20020a6bdd16000000b00791008d91demr6510760ioc.13.1692554228984;
        Sun, 20 Aug 2023 10:57:08 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:4e93:5643:7a4:7606])
        by smtp.gmail.com with ESMTPSA id
 gn16-20020a0566382c1000b0042b3a328ee0sm692448jab.166.2023.08.20.10.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 10:57:08 -0700 (PDT)
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
Subject: [PATCH 3/3] arm64: dts: imx8mp: Add micfil node
Date: Sun, 20 Aug 2023 12:56:55 -0500
Message-Id: <20230820175655.206723-3-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230820175655.206723-1-aford173@gmail.com>
References: <20230820175655.206723-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VFJ2W2UGLFQ2MTUY2ULV33MXPG76W6SX
X-Message-ID-Hash: VFJ2W2UGLFQ2MTUY2ULV33MXPG76W6SX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VFJ2W2UGLFQ2MTUY2ULV33MXPG76W6SX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The i.MX8MP has a micfil controller which is used for interfacing
with a pulse density microphone. Add the node and mark it as
disabled by default.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 3167706d81e1..a6f5b8526698 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1479,6 +1479,27 @@ easrc: easrc@30c90000 {
 					fsl,asrc-format = <2>;
 					status = "disabled";
 				};
+
+				micfil: audio-controller@30ca0000 {
+					compatible = "fsl,imx8mp-micfil";
+					reg = <0x30ca0000 0x10000>;
+					#sound-dai-cells = <0>;
+					interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
+						     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_PDM_IPG>,
+						 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_PDM_ROOT>,
+						 <&clk IMX8MP_AUDIO_PLL1_OUT>,
+						 <&clk IMX8MP_AUDIO_PLL2_OUT>,
+						 <&clk IMX8MP_CLK_EXT3>;
+					clock-names = "ipg_clk", "ipg_clk_app",
+						      "pll8k", "pll11k", "clkext3";
+					dmas = <&sdma2 24 25 0x80000000>;
+					dma-names = "rx";
+					status = "disabled";
+				};
+
 			};
 
 			sdma3: dma-controller@30e00000 {
-- 
2.39.2

