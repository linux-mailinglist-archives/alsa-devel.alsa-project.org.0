Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC15A76921E
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 11:45:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19ACC93A;
	Mon, 31 Jul 2023 11:44:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19ACC93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690796729;
	bh=xheSYN4uDISoR0sQ+VarM24YrbwEG/12eAQp5WM9hZ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VtfURIvuIJPerF0+n7N30rb1uZorxaJdAvxV+XTpI2c1Palw71vfqE+ARfNuGPel8
	 Cqu1Y23ulhK1LjSV+rsSGqQRQ2OzjAp+iFtZzyfF4Kum70fYVYSmfYw3LJ/7S+XzjC
	 tgp9sddjaPu2xfnTt5UeVanKWDVdHjDogzCCDWHE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91BEDF80579; Mon, 31 Jul 2023 11:43:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9275EF80579;
	Mon, 31 Jul 2023 11:43:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46D2CF8015B; Mon, 31 Jul 2023 11:43:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F623F8015B
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 11:43:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F623F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=tn4w2YQm
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-51e28cac164so11466352a12.1
        for <alsa-devel@alsa-project.org>;
 Mon, 31 Jul 2023 02:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690796599; x=1691401399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMkdpsehTQiUEk5WvbiE/NK1y+1H3B3yrpjwlG6gOYw=;
        b=tn4w2YQmJTk0uY8ChJCamrtd1NcK7DH3BQF48MS47k8eGNen03b0H8BrqpxyZcEvWK
         TPXsdcjEnmC3fTAo3UDqvw+henD34TO1onisgORuIUrwequZeMPv+n4uHfY13ORotoiv
         rLN4hAb0lP69zVN/jHC6pzdlKqoort8C/+dXokjQYsHxgXt3tOsQCl2anHisRU5ep80I
         RwGS8Pj1HR0lFBDLxSDNQeJZ/KbUg1sttYQb4MsMbazqmlM2tlYaauEfC/Z/7ycQHL+i
         b7Tpp2/WI5HuL5GbF+kt7pzxeXCyFL3aUWSs5UGq6gO8A6RiVb4h03SE/3b8kEceXusx
         XMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796599; x=1691401399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMkdpsehTQiUEk5WvbiE/NK1y+1H3B3yrpjwlG6gOYw=;
        b=APmQegHeeofR9zzjnK5tNzfN2+gjg1BhNfSU6iCUxivCJmSTRwOYPhpz3FryXkYTpU
         wCc8YeM4rSDIAzX84AKGSMGeNCq2B9pL7VfHFE52cvuwr6ePOB8HPgxxpH1+HfKJd4zI
         xomTtc313Wa3RzBzAz9AW/MHlxiGeniKfIuC00AzoIzOYfUl7yujxktL1TglIRFEZgcY
         wix3sTx1O5vZD3Z9WtlxZUQmWegBgzIRqChg0qo0mYlbuMKMJlusfqIpxBGXH/BTnwFz
         jgjBHG77W5eBom0OBS/NCCB6q1b3Mu294+KPSX6K64vlVS0DezJmdKVIa1gnL5N+d9PG
         eqUw==
X-Gm-Message-State: ABy/qLZl2mswoUQkkk9RHN1AI5Uyh9vmeh0bLV+IBWgSu2Zt4+hLyocw
	AzGiDfWWzvjAg6Hmn01RlTOqkw==
X-Google-Smtp-Source: 
 APBJJlEHS8HRS+DJX1TaYBtav0YDH5TTIyB34YjlvE4tjVqyDckc7nADYmMtp8qDuz0QDDXeqOSJhQ==
X-Received: by 2002:a17:906:309b:b0:993:da87:1c81 with SMTP id
 27-20020a170906309b00b00993da871c81mr6791657ejv.20.1690796599396;
        Mon, 31 Jul 2023 02:43:19 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id
 z17-20020a170906815100b0099bcdfff7cbsm5867547ejw.160.2023.07.31.02.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:43:19 -0700 (PDT)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 03/12] ASoC: dt-bindings: mediatek,mt8188-mt6359: use common
 sound card
Date: Mon, 31 Jul 2023 11:42:54 +0200
Message-Id: <20230731094303.185067-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FN3YJAHWTM5VT2B3D6IQ6U6YCUBIDM2R
X-Message-ID-Hash: FN3YJAHWTM5VT2B3D6IQ6U6YCUBIDM2R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FN3YJAHWTM5VT2B3D6IQ6U6YCUBIDM2R/>
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

