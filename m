Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A54FD82DF35
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jan 2024 19:21:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 001F61FF;
	Mon, 15 Jan 2024 19:21:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 001F61FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705342877;
	bh=uTV3fMQBEmjsZDn7ukfrJz1LkbPuevUUZnv8o3pf2jQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XKXQet/cMNJ2bYV0GoVjgJqzJ+Nok3ZewEmrRCuCXhv5xmfExYmhGHPohkZYLIL5w
	 AmkCGle0ZVzzwoPiqlvleiiw6PXXNCngJWb8OPDfMqNTMegWoAVn5jeAXtT8RraF3p
	 yVSid6rjjeWfdMBX+RR0qsnM2wXTWH45iBudUeM8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B6CCF8057D; Mon, 15 Jan 2024 19:20:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC7BAF8057E;
	Mon, 15 Jan 2024 19:20:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F163AF801F5; Mon, 15 Jan 2024 19:20:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DCA0AF800C1
	for <alsa-devel@alsa-project.org>; Mon, 15 Jan 2024 19:20:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCA0AF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=eDgR/Qid
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-55817a12ad8so6782281a12.2
        for <alsa-devel@alsa-project.org>;
 Mon, 15 Jan 2024 10:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705342822; x=1705947622;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vfqDNdJii/JwczmpCcKHtey65uDHFKVGPKm3GAmlP5s=;
        b=eDgR/QidEy98ZNRdehG7/0JApiqn9tNXhKWeG3/qX9EGo4kcYhUl6MwU9wJbfDICTR
         HG7efVzCOEl+13bi0FfXvg6FnV8ZmHgKkHnEpG5/q/M6S3xqZa00cVViupvjkPMUVpGU
         GV4md2zw5QfUrhHy7qQTC1W8DhoFncVzx/UVhpIxJnZuG/OpYjRUV2SxtBn1Thi3OtMM
         wO4Dyvc3+Zw1AcdXM+4Dhq5zNIPLLxMK0eypxA4KQtq2NeFKmfueTBzZ5DC3vytM55ak
         3JfpaxNSco9KUZFgGAwJwfP/SDuFOS12/WTutrFsdJXQVTH1YY/D4f+FpHEImLqb2/0u
         WLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705342822; x=1705947622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfqDNdJii/JwczmpCcKHtey65uDHFKVGPKm3GAmlP5s=;
        b=SpwBxFcVrPEJRrZ6JxQqFN/e8F5QBPRA+EtmWVoVTnM1NcnrCWT7+YChrVdzHv3rpi
         InyjsBW3R9J4J1w2xi27D0Cm3V3+xhwAYN5SFKwJjSOe39al18ek5yS6eeiKhKqNY6Hg
         o7OFWJLOylLILN6NGY8/1IPW4zvRUWUfvnKdUskyiqLDeTg0x9ns+CTmpHCgEWYq3cR3
         XfhMXLumcOWhkFO+hQVOjOgYtqYnHizAV/lggfMH0yrRVm909yJ812oTkzes51dn5xOH
         x9Ve9G+CeHMLfPXq7xWGAtIuKeWwFR42gpc643AJBB7OJETi7snQiunQNcIzfEDJ31Rb
         b6XQ==
X-Gm-Message-State: AOJu0YxsnsHD3dKr0JMIh/nm3irjeA1kmuLY0ToBtDLifT7dbf/5sMal
	J500e63Amd3hTNNO3z4JkNkN7Sr3HvCgsQ==
X-Google-Smtp-Source: 
 AGHT+IH4iiT1305wjSx0qw7+JZyagxUkxX2NGFDlrUVaieyWX/cQtizfU3/Ag65NHQO/QGBhgiuxeA==
X-Received: by 2002:aa7:d80d:0:b0:559:565a:8fb0 with SMTP id
 v13-20020aa7d80d000000b00559565a8fb0mr751869edq.84.1705342822468;
        Mon, 15 Jan 2024 10:20:22 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id
 l26-20020aa7c3da000000b005546ba152f4sm5761795edr.71.2024.01.15.10.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 10:20:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: dt-bindings: Do not override firmware-name $ref
Date: Mon, 15 Jan 2024 19:20:17 +0100
Message-Id: <20240115182017.1610055-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2PYFMBDZNMLM2UNKPOVX2NI4TDN56TIY
X-Message-ID-Hash: 2PYFMBDZNMLM2UNKPOVX2NI4TDN56TIY
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2PYFMBDZNMLM2UNKPOVX2NI4TDN56TIY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dtschema package defines firmware-name as string-array, so individual
bindings should not make it a string but instead just narrow the number
of expected firmware file names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/fsl,easrc.yaml        | 4 ++--
 Documentation/devicetree/bindings/sound/infineon,peb2466.yaml | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
index a680d7aff237..0782f3f9947f 100644
--- a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
@@ -51,8 +51,8 @@ properties:
       - const: ctx3_tx
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
-    const: imx/easrc/easrc-imx8mn.bin
+    items:
+      - const: imx/easrc/easrc-imx8mn.bin
     description: The coefficient table for the filters
 
   fsl,asrc-rate:
diff --git a/Documentation/devicetree/bindings/sound/infineon,peb2466.yaml b/Documentation/devicetree/bindings/sound/infineon,peb2466.yaml
index 66993d378aaf..5e11ce2c13ac 100644
--- a/Documentation/devicetree/bindings/sound/infineon,peb2466.yaml
+++ b/Documentation/devicetree/bindings/sound/infineon,peb2466.yaml
@@ -51,7 +51,7 @@ properties:
     maxItems: 1
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
     description:
       Filters coefficients file to load. If this property is omitted, internal
       filters are disabled.
-- 
2.34.1

