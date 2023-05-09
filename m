Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 260686FC6FA
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 14:44:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86CC610DE;
	Tue,  9 May 2023 14:43:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86CC610DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683636285;
	bh=tp88HJl0MZP0Ztf4+/1qTIUaxoYMbjacldrgGklZsak=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nd5098QI4B2QxHXSgoFidNDmLWIyOSkwwb2rT5fGKmPAOVje5a/CoiJBTwifnlFph
	 iODUE80FC6WmXP7ttdjOpDboU49ZwmWtbjWuR8lPAgHEx+GeAsOuIr/GBpNEX1Ga4t
	 fVs6BbUopgL0X9MzEd0HfzpM4OEVtu/9Mvw8kzwE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 32E39F80544;
	Tue,  9 May 2023 14:43:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43EE7F80310; Tue,  9 May 2023 14:42:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60AAEF8032D
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 14:42:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60AAEF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=M8kM4F50
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f18335a870so37124315e9.0
        for <alsa-devel@alsa-project.org>;
 Tue, 09 May 2023 05:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683636165; x=1686228165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZplJga8URR6w22NuOXzuaUfxRbCk+zusrF2eonp43Ic=;
        b=M8kM4F50Y4QTpse4LTLaTC1p2lmcHK/sWrXz58Uxbdofq75cCK6nNc6tPZC5QyUyuq
         itS6L8KsQbXQLFbX6rssoOqIJTKrxa+d5P4RUpP1y7jwIU+ae5TyoANwDKjMR2GfM1uz
         DQEmnv60HVaZyyHeULYvT/yZqvXaV8N3/nRaVtvvnuFsm9gMqt9M5UsjptXzOcC8aLJe
         5VFkMJrUx1QzSQO1wBTorV4wBjQH/lJxtQ4HN9zf52oYG5ZFLVHp5maEVBBKuWh0G5fa
         M7/eIHccCIzaMzXED2bvBJYGn00JlpH1Y9bpXKsjk/1lmnhZGyl2HTv6acFjYShVQZWV
         5U7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683636165; x=1686228165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZplJga8URR6w22NuOXzuaUfxRbCk+zusrF2eonp43Ic=;
        b=DmBs/rTZqQXzs3/a/33egQih+MCvaEmY6zFcx06ArvrC/kZhE4PFjXVAUNTVA6yg0w
         nhbMzl0wuLFToAoW8EGkSxDrHD7lEgd8XpnhbAxBxNuwqBkmmMErrToyowTYpYALIyZn
         mHcsLwCVpyew1o/BNf/8ukCqEdjW4tE8tIoGKELtji8c4Zte2hz3KwuTRZDLM4dCSrsS
         nZzemlQ/CLpsOnMybwBv3ld65typQ/mLeHjOU36erFu/sFa15dt6nozXGwRct/gA8a+T
         gciaFCa/pEJh87/z/bRaeObnc+V30G5Log68ucQglJmYIbW6zUE6Vp8hPR5w3PKgVBHH
         lB+w==
X-Gm-Message-State: AC+VfDyTVIx1Ph7jKNQoNFawQ0qBsUVpvsbxDOxaHCecEsMNiq1E1hAL
	vz6rSW3WxMV/VbDkGTlR9ts=
X-Google-Smtp-Source: 
 ACHHUZ5JuGl0TT7zoc5WZviOsoU/R1kF0RdwnsYbTD5iMTaRYgFq5PeC4oHx05osceUHEJ0tdlmpXw==
X-Received: by 2002:a05:600c:22d9:b0:3f0:9a90:a5e7 with SMTP id
 25-20020a05600c22d900b003f09a90a5e7mr8961042wmg.28.1683636165108;
        Tue, 09 May 2023 05:42:45 -0700 (PDT)
Received: from localhost ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id
 f1-20020a1cc901000000b003f25b40fc24sm19933419wmb.6.2023.05.09.05.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 05:42:44 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	paul@crapouillou.net
Subject: [PATCH v1 3/3] mips: dts: ingenic: x1000: Add AIC device tree node
Date: Tue,  9 May 2023 13:42:38 +0100
Message-Id: <20230509124238.195191-3-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20230509124238.195191-1-aidanmacdonald.0x0@gmail.com>
References: <20230509124238.195191-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: S6S4JSA56OBF23QFRMFGZ6A4VFEVZAHI
X-Message-ID-Hash: S6S4JSA56OBF23QFRMFGZ6A4VFEVZAHI
X-MailFrom: aidanmacdonald.0x0@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S6S4JSA56OBF23QFRMFGZ6A4VFEVZAHI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a node for the on-board I2S audio controller.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 arch/mips/boot/dts/ingenic/x1000.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi b/arch/mips/boot/dts/ingenic/x1000.dtsi
index 42e69664efd9..cc264cfff826 100644
--- a/arch/mips/boot/dts/ingenic/x1000.dtsi
+++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
@@ -417,4 +417,22 @@ otg: usb@13500000 {
 
 		status = "disabled";
 	};
+
+	aic: audio-controller@10020000 {
+		compatible = "ingenic,x1000-i2s";
+		reg = <0x10020000 0x38>;
+
+		#sound-dai-cells = <0>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <1>;
+
+		clocks = <&cgu X1000_CLK_AIC>,
+			 <&cgu X1000_CLK_I2S>;
+		clock-names = "aic", "i2s";
+
+		dmas = <&pdma X1000_DMA_I2S0_RX 0xffffffff>,
+			   <&pdma X1000_DMA_I2S0_TX 0xffffffff>;
+		dma-names = "rx", "tx";
+	};
 };
-- 
2.39.2

