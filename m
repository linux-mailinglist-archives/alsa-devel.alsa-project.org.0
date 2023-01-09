Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E27A966200D
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 09:34:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EB6F9544;
	Mon,  9 Jan 2023 09:33:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EB6F9544
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673253251;
	bh=PzPOEWCvdD0XWQejc6+hdBT46Q1VtrmTcALHhO8HkLE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=CMDH8YrU3ry2Q0T4Zkwj2+QkgRnSSbMzyU4AaA59boL79j2JTJ/fNlkaQ8iSnj/cA
	 vXpHQxUC1QBOilPhzpKDjV1IeysVhh6l6JcfIa01QkyUs9L4INpPCC32J+AUxh4wpY
	 TKFoxS1AZr2WxFB469Me/SuJqsK4dtSuNtX9gQAM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2129DF800C7;
	Mon,  9 Jan 2023 09:33:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34F97F8030F; Mon,  9 Jan 2023 09:33:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE977F80245
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 09:33:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE977F80245
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=fpkQU3VD
Received: by mail-wm1-x336.google.com with SMTP id l26so5681392wme.5
 for <alsa-devel@alsa-project.org>; Mon, 09 Jan 2023 00:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kDytp4ppEMXSrwGkxdHQ2/Mw1kec/DZDS/Y2CvEOddk=;
 b=fpkQU3VDvUACOj+YNaC9ZvbLMA+CAtC9Tvdv8hxMA4sNEcnjNRoBkA7F3xE6gbn2vM
 k6sQLcmL4g4o6cWK0qvxUc0h77czTT/3swoeaLSf2HitylMjS1J07hUlwLywdTjbcZu5
 TiwVxKZfBbgPPb8e1B6vbM+WBIm0BKoXrndfrXkmHz4kAZruAmgUbUy/WyJB0qIaJASr
 9dP9YbKO+tsWV6j4t2RS/XsLzRJWI2wZRz5OXs8ncm8CuZ4KumOynT7DmVN5Bq5N7xpx
 bT/syfsvZu3JHh9bhMwoCKY09uMFG5SfdLDAIC7r7uD1fR6nxpFw+x4cDxcg0HhU196k
 2TMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kDytp4ppEMXSrwGkxdHQ2/Mw1kec/DZDS/Y2CvEOddk=;
 b=WOkYlGIabdNKdy/+U29e2xrUqb+6GgaTYnu6b6xBu5dLVaXN5XLylGBU0qv0vuLg2V
 zXdP4u4rZl/QmMZj/8KKL03e+JiefdlY0vQv4acT8FtILTXD0235MLEgX5T8TQNdBBck
 0JBZI0iIpHeo/ucMrl+iGJ2XLpU2I6L91Whx342yQjn12U+7Kjb7jOIJ33MtJv1Te9m6
 QfVGE0LUeshlQ4SKy0z1xSWvDKNKFl4JdQk+mFZNW+kdFjbu17h8BrNWGSsCgupUgJpF
 5qJO7sKWLLPDgjm8YjoqrtCo59UFjZlTov6DwbsCMrMBXOSotDV3xeAcR4icddvgXbwe
 NZ7g==
X-Gm-Message-State: AFqh2koO00S3XiiwaZoYMD7KepZ5ocVQMNuK7ckDzX2VvZ0mORrPvKss
 YWMN6d4pHP5zMAoK+FL39fWOnw==
X-Google-Smtp-Source: AMrXdXsLwyWAEbdbQRoBmwjSYWVjlFKmD8qGN6kpAD3cSTddXE5MW9DFn4WfCzGRxhPU8bOsceAXRQ==
X-Received: by 2002:a05:600c:4998:b0:3cf:68d3:3047 with SMTP id
 h24-20020a05600c499800b003cf68d33047mr44934987wmp.41.1673253185638; 
 Mon, 09 Jan 2023 00:33:05 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 f28-20020a05600c491c00b003d9bd56e9c1sm10031744wmp.11.2023.01.09.00.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 00:33:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: simple-card: correct DAI subnodes pattern
Date: Mon,  9 Jan 2023 09:33:01 +0100
Message-Id: <20230109083301.76282-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The simple-audio-card,dai-link node does not allow address/size-cells
thus children (cpu, codec) should come without unit addresses.  For
cases with multiple nodes of same type, require a dash before index
(e.g. cpu-x) and add trailing $ to the pattern to disallow other
characters.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/simple-card.yaml       | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
index ed19899bc94b..08743741b09e 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
@@ -244,9 +244,9 @@ patternProperties:
         maxItems: 1
 
     patternProperties:
-      "^cpu(@[0-9a-f]+)?":
+      "^cpu(-[0-9]+)?$":
         $ref: "#/definitions/dai"
-      "^codec(@[0-9a-f]+)?":
+      "^codec(-[0-9]+)?$":
         $ref: "#/definitions/dai"
     additionalProperties: false
 
@@ -462,16 +462,16 @@ examples:
 
             convert-channels = <8>; /* TDM Split */
 
-            sndcpu1: cpu0 {
+            sndcpu1: cpu-0 {
                 sound-dai = <&rcar_sound 1>;
             };
-            cpu1 {
+            cpu-1 {
                 sound-dai = <&rcar_sound 2>;
             };
-            cpu2 {
+            cpu-2 {
                 sound-dai = <&rcar_sound 3>;
             };
-            cpu3 {
+            cpu-3 {
                 sound-dai = <&rcar_sound 4>;
             };
             codec {
-- 
2.34.1

