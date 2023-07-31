Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12645769215
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 11:45:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A64583A;
	Mon, 31 Jul 2023 11:44:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A64583A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690796703;
	bh=2lRcft2ZoYprtWgiR0VYpwN2mbWU0x3HmJVmPrNgwxU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dDy994uq3hwGVtdxS29qiEUJhXw6B5Na+Jul2O0w07BNfZbIOg25vbE8fpbwrae7g
	 9kviOM+0q35QqHy38ILmLAkVcO4LbxpA6A26QhSR7FMT2HlN9p27B3Eb9HjOgPHPQo
	 rWymIantG/NwBFj6d6EGdszzIgJiQywTmDflk/7k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9041F80553; Mon, 31 Jul 2023 11:43:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E8D3F80149;
	Mon, 31 Jul 2023 11:43:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA6F1F8016D; Mon, 31 Jul 2023 11:43:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 85243F80153
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 11:43:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85243F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=dhc03fGG
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9923833737eso630429566b.3
        for <alsa-devel@alsa-project.org>;
 Mon, 31 Jul 2023 02:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690796594; x=1691401394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6++1atFcJlpU6KcQ6EW+qw2Dj8W42OQi/XJDZGdi1g=;
        b=dhc03fGGpA5as1+HMhYMWdZE3IsL092HC0LprsNTQBPQ7s6TkXj6YxXAQqPWytVh44
         cb7SNFy7YjkMCHLx7fxXAZBDfQvbHE87OLNS2OdhRomqKJJlzT6k6gHtLaZEOZy2CLOx
         2VRDt7SdmllRm1yYORj/MI3aRZbrIwKLb2/6RnHVesH2HAh1d5L6M3ZHrZhtkYl+0Vpm
         OrVV5xkeBfvzo1fxSl3sE/3HPfPBEYMcyLl+L6/C3UMXWC651H+jsnnSOBFAzr8DxI3w
         udHKxhJmN8ichJzsj0QspP+1UYSEPxBXkMJi88MqqrUlzTtP8d81k25fDK4sYQ5R5ls+
         SvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796594; x=1691401394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6++1atFcJlpU6KcQ6EW+qw2Dj8W42OQi/XJDZGdi1g=;
        b=Zt9rnVqm7lauPcIys/af4o1MgJaK3Fdv/ZVBYGQ8fbXFhmaLJuzbU/8WB/dx5ypdGT
         VbD+t0ZZxxB1PVUVe9nQocVuLVRBYxqqo4JH2tfyEFJjBmo3oe20ObRdwnh7yTkdL+AG
         XVNE98oaUw9LjC814RjlDj1GRT6xzYhR9L4XgfytcxBvowPanVDrRx2+ae6pF2dfIo8J
         SL+yn5t/7KC+jVBR9OeBw9MNyx5iDTc3Ey7D7Q4wxboo97nS6KHbDllbkNhtGie694Ya
         uz/w/ZOCpoztTj4YA3DgXm01a1y3eM0nmIMdiBR+QVbQ2yH8a0EPgdR52fT3wTXrApuh
         G2zA==
X-Gm-Message-State: ABy/qLbBhA9T8JIIGTEkLKlfWIw5/LsNahw0zj9FKuOVvCTzINeWClue
	GXEzQ5Pt1VlpdEeghGsne8dtDg==
X-Google-Smtp-Source: 
 APBJJlGWo3hFADwY+WaMzw9Z36mCtTdvjCEOo31rIf0hKufIkRKpCycEbTJFgmy0co12hnDOO35r7Q==
X-Received: by 2002:a17:907:7711:b0:99b:f3ef:f088 with SMTP id
 kw17-20020a170907771100b0099bf3eff088mr6220810ejc.69.1690796594520;
        Mon, 31 Jul 2023 02:43:14 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id
 z17-20020a170906815100b0099bcdfff7cbsm5867547ejw.160.2023.07.31.02.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:43:14 -0700 (PDT)
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
Subject: [PATCH 01/12] ASoC: dt-bindings: amlogic,gx-sound-card: correct
 maxItems constraints
Date: Mon, 31 Jul 2023 11:42:52 +0200
Message-Id: <20230731094303.185067-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RDHL6PIJAFVZNK3URFOH54BNUQZFW6GA
X-Message-ID-Hash: RDHL6PIJAFVZNK3URFOH54BNUQZFW6GA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RDHL6PIJAFVZNK3URFOH54BNUQZFW6GA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

minItems without maxItems implies upper limit, so add some high maxItems
to fix dtbs_check warnings like:

  meson-gxm-s912-libretech-pc.dtb: sound: audio-routing: ['AU2 INL', 'ACODEC LOLN', 'AU2 INR', 'ACODEC LORN', '7J4-14 LEFT', 'AU2 OUTL', '7J4-11 RIGHT', 'AU2 OUTR'] is too long

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/amlogic,gx-sound-card.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
index b358fd601ed3..45d6202d9730 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
@@ -21,6 +21,7 @@ properties:
   audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
     minItems: 2
+    maxItems: 32
     description: |-
       A list of the connections between audio components. Each entry is a
       pair of strings, the first being the connection's sink, the second
@@ -29,6 +30,7 @@ properties:
   audio-widgets:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
     minItems: 2
+    maxItems: 8
     description: |-
       A list off component DAPM widget. Each entry is a pair of strings,
       the first being the widget type, the second being the widget name
-- 
2.34.1

