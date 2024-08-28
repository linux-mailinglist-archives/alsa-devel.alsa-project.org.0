Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7A7962960
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Aug 2024 15:55:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31FDEE66;
	Wed, 28 Aug 2024 15:55:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31FDEE66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724853317;
	bh=H+G0uR0uGtkQ/5/97rdsSRom5F7Ggvn+WvWc7nnJ2JY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uXxxm0ypLJl+Hy2pn9aFhWKJDcQ56YzYnMtzgad6xjUMUNd5olFwZ1MvXz7Y21wcm
	 usqD24nEGaGZoaTJwPxhbZRBuNZ8YL3lsrDccBGTl2WCFlZK8Mu2a5ZSE5ZrVGrenn
	 NfFB9QPQvxqtcS7sBLAnbgoOALvbFz09zuXWtHBI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3C34F8060E; Wed, 28 Aug 2024 15:54:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0731DF805EF;
	Wed, 28 Aug 2024 15:54:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4369F80528; Wed, 28 Aug 2024 15:54:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CA83F8025E
	for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2024 15:54:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CA83F8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=BdapqkTy
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3718c176ed7so3791250f8f.2
        for <alsa-devel@alsa-project.org>;
 Wed, 28 Aug 2024 06:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724853243; x=1725458043;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TTWHuW86NTs+103uuN2zaYjUY11Ov5iBD80i8ni2ivs=;
        b=BdapqkTyr7h8cRDnbg17PKV5ESGIuYLbCS+rE4JwGCrtiX2BJlolHFCQKu9Sv97ni3
         REIQSNxAMzalYbfyXL99N+VGX/rPjBeOBsvFKyWPIxZwl5eQOh5hmAEaNFfdIujaop6h
         b3w8tFlr8dlQTKF9m0WILmvrddqly4D96RaKoC1yAuiu5TnRhGGBp7BBPI6fu0AdlS6y
         a9nkIviLBsdf16yMkRn1iIyyhVMlfYdOOSS4b1lJLAM7XvaVnG3nTwLwainDQW3AjkKi
         Q6JgUOQZXGOxZu7OcMAaM439jQ50LfHe+0B70E5E7S+nkrQKyIIF2UjqK9ub/OZQ8IkK
         2l0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724853243; x=1725458043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TTWHuW86NTs+103uuN2zaYjUY11Ov5iBD80i8ni2ivs=;
        b=Sbq/50vGaZC7QwKlRWeI3E+O8wqpzdQvuqZf7fg5oKL8tbVwaXFCIPTiJ7ufNElVE8
         pxjX2GfzaNl5kXckZfl0GA7zBxc+NxFVdBijK2yrbBUXOFAv7qss+/nrr0vBD4dQ6wEv
         lNBJZwl3BWCIf5dHCjsk0xT6FcaRUkJACDlAaExuuRt4CaFmwo0Qq+QdbdLIbGwW6nbO
         vLrrzjBL/sGZ0+8Mt2IptRNzl+Df+Xfmc8eqP/jk+ISNGIL/t/Tg/nRuB6qBS3KZUsQT
         d/zk7LQsmV3ZVKKKVjNaGX8Cy9X4Zwrcdav/jjzrV3cyQDCYreWcOJiZna6l23acaNuR
         5lXA==
X-Gm-Message-State: AOJu0YyYoiKggUaFAjts7JRg1N79iOY2e4dOkvlsxh1B0z+3wueHwmGx
	5eFhhB98T2aIBiVpe9QrAeqvlXTN6bSZXnvd8pVP6R6i9v6SLJ/V9HIFnD8/QBE=
X-Google-Smtp-Source: 
 AGHT+IEIRP7AywU7RW8H7GuK91sm441qq/B1K30YGS/4flS761qiJ+wLNYFmEH4P9KhRRx0bXPBEsg==
X-Received: by 2002:adf:a416:0:b0:371:8d47:c174 with SMTP id
 ffacd0b85a97d-37311865093mr10293637f8f.30.1724853242544;
        Wed, 28 Aug 2024 06:54:02 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3730813c44asm15613395f8f.34.2024.08.28.06.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 06:54:02 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 28 Aug 2024 15:53:55 +0200
Subject: [PATCH v2 2/3] ASoC: dt-bindings: amlogic,gx-sound-card: document
 clocks property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240828-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v2-2-58159abf0779@linaro.org>
References: 
 <20240828-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v2-0-58159abf0779@linaro.org>
In-Reply-To: 
 <20240828-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v2-0-58159abf0779@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1722;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=H+G0uR0uGtkQ/5/97rdsSRom5F7Ggvn+WvWc7nnJ2JY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmzyv2GqTu1q87S0Q2rSDxbQeeYYgHw/Riu2gqWSyE
 6fyZXPGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZs8r9gAKCRB33NvayMhJ0QPDD/
 9WZk9izqKs6sRDdw/RiFAlLH3jgXyr8Oen2cHF65E/3nU+f0raTKs8LFYUXB4keLMiIPjka4JMJ+qT
 Kq7U0XPlmrLBw+975gaJMTgvS347fDb9Lyy5925kgoniTSsUiQ7dFxSC8jHi8ag/FRTAE7hVDsy344
 pYCtFpDbcGbdFIqe4XiIBasUsV5d4cr0aMpde+pWil+jzt0fV3vUw4m0ZHO8u54FxV8vFApmMuqIpv
 oeOQdoUIzP3hmOFDjwV5N/CeX2fEB5YOcHupvL1toZyr1Z9cG1ih1IGQg4okSvoxeP/u9o1/hB5GX6
 atENd4NA66+Aa/uDTzZZS+VNIhkDxrhtLiA1RV1kgnnZ3TyeZogfz+hlTRLrWK1L6AM8s9A+DMtCHW
 zp4lL22MVI0tobGLNnzUAFdoF79ywKYXF8hGJj50NUOOSWWXddV/5I5mbDDi+kWUi+1WeUemaGeqTy
 O5e1X90OQP8GwSQ+1O1pLSSTHGPfVABg/NWSOzKytNNK8CVbTrMmLPHwAZTp2gssbn3Z06fayAKDxg
 GuTpXrh0m2b/gWmrqxaYDOz30LO2OrZnAZGufIpgiEZhou0WRyh4FmFdGOMeOsIe3mP9H5oKGaHesx
 WgrGpPI7vhohkcivoGL9ksfQ7YFP+fBABfp2a8u97oT2ZJJTqcASilQYZiYw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Message-ID-Hash: F5S6UWERMNAI4Y2F3M4NKYZQ7A6FYMZB
X-Message-ID-Hash: F5S6UWERMNAI4Y2F3M4NKYZQ7A6FYMZB
X-MailFrom: neil.armstrong@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F5S6UWERMNAI4Y2F3M4NKYZQ7A6FYMZB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The sound card design is based on reference PLL frequencies that
are the root of all clock rates calculations.

Today, those frequencies are currently specified in DT via assigned-clocks,
because they correspond to the basic audio use-case.

It makes no sense to setup clock rates for a sound card without
referencing the clocks for the sound card, mainly because at
some point more complex audio use cases will be supported
and those root rates would need to change.

To solve this situation, let's legitimize the presence of assigned-clocks
in the sound card by documenting those clocks, as it describes a true
dependency of the sound card and paths the way of more complex
audio uses-cases involving those root frequencies.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
index 0ecdaf7190e9..413b47778181 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
@@ -27,6 +27,13 @@ properties:
       A list off component DAPM widget. Each entry is a pair of strings,
       the first being the widget type, the second being the widget name
 
+  clocks:
+    minItems: 1
+    maxItems: 3
+    description:
+      Base PLL clocks of audio susbsytem, used to configure base clock
+      frequencies for different audio use-cases.
+
 patternProperties:
   "^dai-link-[0-9]+$":
     type: object

-- 
2.34.1

