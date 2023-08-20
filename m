Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F56781F18
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Aug 2023 19:59:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A3FB83E;
	Sun, 20 Aug 2023 19:58:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A3FB83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692554342;
	bh=Obejx1ffuhLnKN5qTDeu4ICGt73AWmm70PRrK8+/9sA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ungOPweE7pwAaLuS/tybG6tscUMYPSBePVCwbeCBin5JcCqqEET3qLosgSMV5z5fl
	 m8jeZ4PoNRIZFoGgHaUE3/I4H0y3Ffna6GtGBvzqzL3nMDjM2es6BOn8cPOK6zpZb2
	 Ei0U0B2laOhj0k6G7UWlDtrFowgBsMsbs3Hhweo4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35FCAF8056F; Sun, 20 Aug 2023 19:57:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08956F8055C;
	Sun, 20 Aug 2023 19:57:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 351BEF80199; Sun, 20 Aug 2023 19:57:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E0294F80027
	for <alsa-devel@alsa-project.org>; Sun, 20 Aug 2023 19:57:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0294F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=im5B+GZC
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-34bbc5b5381so4500555ab.0
        for <alsa-devel@alsa-project.org>;
 Sun, 20 Aug 2023 10:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692554227; x=1693159027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9/VjGyT9xu6/XWCD38HhKREDTKPLKBqFGrqkI0zss8=;
        b=im5B+GZC1uxApYsNl1L/d6/bMjyk/GD49WVdS2Ksuk+CNTS65K4bucYPA9lYvysQY1
         gX1l2DLllCxq9D1BTKKtQbqCdzTthgQybq2hQLUxhJFU6lsZMGTi4lymWBVU0HSq8hUA
         QJDiFBmxyFoN9fNP8mv/mNZmEIus7hfEYnhkPiRK5ObSYdfyaCVO6LetR47cmuQ+Tu8q
         qyxTPI/39FMJGlorfhrXK1QWIIm8XdmMspDAsrft3kcZu1dGz8RCMGvwCxN10MDIpLSK
         h5tpgTlQaD+CAL8i+56QMrL1+q9KIjdFXlBsvh4ytQgxflKR5I+jYT4Cml0rYV6/tbEo
         /2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692554227; x=1693159027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k9/VjGyT9xu6/XWCD38HhKREDTKPLKBqFGrqkI0zss8=;
        b=QJWP7IvZpDgrGN8NLHvdVC/W/Vhx1JZ3ZB9QWWexGJPmTqr5xlbs+2YNw46fiNxNRa
         mMYxjey0IkGho9B8jHL+W4MsgI6qFdmnq+ikjMoLq0e7ZLxTtuRPCmDa3TL30pHyiebC
         H3SDnD7CHsLOv5dN8K7WaeZr7GpHGbU0Ad6+t8SQnWR/8W5shQOCfLuW7RbVBUCyrNzL
         kjvpF4Rwml6WtmkN1mNfZPJ1bGTTYdGOp6K0Rcw41DMn75kdO3UveRIHGitLzLifmddZ
         eUMuBpP7XMTGuhW9BeNT6e2jj/pWnoD7r8Y+CD2NNHsQZhPB1sQho2XGO3mbCEXTwYHb
         PX0A==
X-Gm-Message-State: AOJu0YzsL0H5f5LUWaWvCbie9yA+jKLg80DBTaSBA5bAIC9JSoKVDUIG
	x8FNaDCX3NRYuAnBTihnHGo=
X-Google-Smtp-Source: 
 AGHT+IGYnv01pqaU6lCB6Z8CIerZ0oYODmvzGcgMvqwE0F7fHU54qcMVI458fWYQekMpwe9GYvOrqQ==
X-Received: by 2002:a05:6e02:1d96:b0:34a:95f9:650c with SMTP id
 h22-20020a056e021d9600b0034a95f9650cmr5574836ila.10.1692554227545;
        Sun, 20 Aug 2023 10:57:07 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:4e93:5643:7a4:7606])
        by smtp.gmail.com with ESMTPSA id
 gn16-20020a0566382c1000b0042b3a328ee0sm692448jab.166.2023.08.20.10.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 10:57:07 -0700 (PDT)
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
Subject: [PATCH 2/3] arm64: dts: imx8mp: Add easrc node
Date: Sun, 20 Aug 2023 12:56:54 -0500
Message-Id: <20230820175655.206723-2-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230820175655.206723-1-aford173@gmail.com>
References: <20230820175655.206723-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Z6QBPCUYENLF4UI323EKSXYCFVIEPTRU
X-Message-ID-Hash: Z6QBPCUYENLF4UI323EKSXYCFVIEPTRU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z6QBPCUYENLF4UI323EKSXYCFVIEPTRU/>
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

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 83d907294fbc..3167706d81e1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1459,6 +1459,26 @@ sai7: sai@30c80000 {
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

