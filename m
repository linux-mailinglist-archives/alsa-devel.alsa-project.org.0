Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 540AF777081
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 08:36:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 958CDDF1;
	Thu, 10 Aug 2023 08:35:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 958CDDF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691649388;
	bh=Y1fcRcpHWIf+GBj3CX5Iu+7c7HsEQrzL0f57Uhtp/WU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IUzUOJEgAMU2YFNBoEznT16wpglIArZ/yF66e93Jj3bQBS4iBqZmS2aj50g9YdhLC
	 EDMQAOdP0NacE/BIxu+uUGe8cvzGNU+aHXz8KXfJgd80qzm3i/rccRVr6XaDNqkDID
	 MAKtuPe0Io6pE4Oy5J80G/pQU3603ub6yVfxwEZ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 659EDF80563; Thu, 10 Aug 2023 08:34:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20419F80549;
	Thu, 10 Aug 2023 08:34:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AAD8AF80558; Thu, 10 Aug 2023 08:34:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 725F5F800F4
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 08:33:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 725F5F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=EKOLsf+y
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fe5c0e57d2so4578725e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 09 Aug 2023 23:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691649186; x=1692253986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRK4u/u6GjShtJ9g8bcUM1XPaEOsUKZUUqbfqiifYIs=;
        b=EKOLsf+ykA5qIQjzzOus1wbbzFq81JXaJvdLkG0mm3Ei/C2xTDE/Wu8pEO3Adhv1sB
         a8fYpYw1hxGihI1MFUifamdPmJH45ZV8HDggIKT3v396ZMr2JyDRdg4/D9PmrKPpCvPL
         8EA8uAJyzKgvFa/yGogo535vvEIkekTvq5q7u0arTD8e0FY1RGFxH2bC/gCqRI9mbS9Z
         aXWnnIogjDkXyOz9T65Ds170m+XMLrSZ4mQOUEJGTsXUZGNMpMsdTEyBALGWponNQ0nj
         a+D3erhbaW+s3A1Ll/jbyvpMMzlDhOPzMTwzJf18WEgJkTn53cmJNV7nVbKISH4GEA3+
         zMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691649186; x=1692253986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRK4u/u6GjShtJ9g8bcUM1XPaEOsUKZUUqbfqiifYIs=;
        b=XNAW43VVdSqR/BCdXRjSSkyWYqeY5wGIwL6pei2WFP5XzD1oBKhUAEvLdYZmvqkuKK
         9tNQQ041y72YCanAz5j1Fwm241jBlni/YeAyKuYoVVLmeRY43Wsn+bqg4tryUva9l0Rv
         FTEuL1tnJTvusHwBiWBBvrB1+H1ZHcyN0G+k8MIY3L0l2MkIuAFH+isMPHzmJAJKmy+t
         vswMycUG3DIp1uil8y08f8GLw+K3NWj1mjmHi+oC9kiERf1DcfoxlK8g2WEV5ZmJPKof
         bCqbWjp833KLlPqVP7290+nBWJYWJbs07TQM1sNqmOdOXZoNWc1JQ7Edlr7Ud2Ll/uJh
         7e4Q==
X-Gm-Message-State: AOJu0Yyc9wCupldpkcTx5xevHNhkp3YZONh/cSsLhqMF+QkbC8OwlH5y
	zY3HAze8c3a/OaWk5n60QHbltw==
X-Google-Smtp-Source: 
 AGHT+IF3jK0RC64l2dE7mBJal346hXqt7G4hF0HjJMrFLuF9HMUsWWO06rStb8U1TvYEIzfEW6pMQQ==
X-Received: by 2002:a1c:4b0a:0:b0:3fe:212c:f790 with SMTP id
 y10-20020a1c4b0a000000b003fe212cf790mr962281wma.36.1691649186466;
        Wed, 09 Aug 2023 23:33:06 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003fe2b6d64c8sm4020018wmc.21.2023.08.09.23.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 23:33:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
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
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Rohit kumar <quic_rohkumar@quicinc.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Rao Mandadapu <srivasam@codeaurora.org>,
	Judy Hsiao <judyhsiao@chromium.org>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Jonathan Bakker <xc-racer2@live.ca>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 02/11] ASoC: dt-bindings: mediatek,mt8188-mt6359: use
 common sound card
Date: Thu, 10 Aug 2023 08:32:50 +0200
Message-Id: <20230810063300.20151-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
References: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PL23AM2V35EFPG2FTPXACIC2PV3ZUU4P
X-Message-ID-Hash: PL23AM2V35EFPG2FTPXACIC2PV3ZUU4P
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PL23AM2V35EFPG2FTPXACIC2PV3ZUU4P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The mediatek,mt8188-mt6359 Linux sound machine driver requires the
"model" property, so binding was incomplete.  Reference the common sound
card properties to fix that which also allows to remove duplicated
property definitions.  Leave the relevant parts of "audio-routing"
description.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/mediatek,mt8188-mt6359.yaml  | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index 05e532b5d50a..43b3b67bdf3b 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -9,23 +9,19 @@ title: MediaTek MT8188 ASoC sound card
 maintainers:
   - Trevor Wu <trevor.wu@mediatek.com>
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     enum:
       - mediatek,mt8188-mt6359-evb
       - mediatek,mt8188-nau8825
 
-  model:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: User specified audio sound card name
-
   audio-routing:
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
     description:
-      A list of the connections between audio components. Each entry is a
-      sink/source pair of strings. Valid names could be the input or output
-      widgets of audio components, power supplies, MicBias of codec and the
-      software switch.
+      Valid names could be the input or output widgets of audio components,
+      power supplies, MicBias of codec and the software switch.
 
   mediatek,platform:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -86,7 +82,7 @@ patternProperties:
     required:
       - link-name
 
-additionalProperties: false
+unevaluatedProperties: false
 
 required:
   - compatible
@@ -96,6 +92,7 @@ examples:
   - |
     sound {
         compatible = "mediatek,mt8188-mt6359-evb";
+        model = "MT6359-EVB";
         mediatek,platform = <&afe>;
         pinctrl-names = "default";
         pinctrl-0 = <&aud_pins_default>;
-- 
2.34.1

