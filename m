Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 957F216A90C
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Feb 2020 16:00:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED5DD1686;
	Mon, 24 Feb 2020 16:00:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED5DD1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582556456;
	bh=HiNkFTbFJ2/C3bMn0xGyCjSOV4y16QQb/ODkKZ2h314=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CpzLyb79r4IjtwVyYmMibrqEYM+46egTWQtBS5gEhyMujPUCMQrfMvM6JuwiJfgxK
	 68p5ZMtWEF/dynBpSi7Ac4+eVKTUcPcB1ezRSIbeEHnX7dfCQ/3CguZFtFwj2Yuqk6
	 k85IJaVlcOFSpLzvHnZ/JFLsKJwK8CrMMY6nzg0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FEA4F8014D;
	Mon, 24 Feb 2020 15:58:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C0E1F8027D; Mon, 24 Feb 2020 15:58:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1CF1F80090
 for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2020 15:58:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1CF1F80090
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="lcWN9cUq"
Received: by mail-wr1-x442.google.com with SMTP id e8so10742339wrm.5
 for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2020 06:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eR8sRZ0eNtaE7U9M/Ye9eF8UlxBXj3WB9fmrHU+msXI=;
 b=lcWN9cUqpNnTBKxLL1DcDeE96TbfbhNrt4m4Zx+HhxEUh4/4IfxF+6fPGTklNwHtBV
 jNbp8eSsTC1LMdNWtEMJF6cwYJ0LM8mGwpEyzrNbUxd/RKJPZaWX1tNhbIvtJqZU6AHK
 im1JpjWuiJRALN2PkArUCotAgTMzlxnXW/1C4IrXSz6IRS4m3BmJ62w8DChEng86uLVO
 KmoB9kUfLuVae0i7qIM7uOfcV+h2J5yye52aLZZJ9Mrhl0hqq0szE3IUNRhhuOd3MWFy
 RBdNpRUZIhVY5ImD4FlGsQniP5+y8xIpyPGLN9iAoTm6DvQzkuJwKWfwBf3Fxnx9baYK
 gAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eR8sRZ0eNtaE7U9M/Ye9eF8UlxBXj3WB9fmrHU+msXI=;
 b=ouoTxZGIdPGaYYr3E9jWQ/pJIBqb4bz6TFZUONFM5Sr9mmX1SL21Dyq06Bnqzbqiz0
 dZ2yF8fmswM6toWkjLOY7p/zhNK0fGuuPMhtaRCSy5CyBVkDNx9q0M3bFlcxW9PHkOOg
 LP+KMH4Db1lUzzOzZ5mH4y5D9KLjmEK3byq4UPHJ+V8RPEOYBl8/Kt8K93ZgX+vlg+Ra
 ApnH3rIUNlgV1TROJOk8lsRyACAzRXVXcDhtUcbIvo0bSYCcgh/grjDgPipK2NpBRpvx
 vYMA6mv9M0z0F0Q+d+blQL9Hs4ECNfrkE1wKm2lsCglaXEAjeYFMSUjrCFZ49oHoN0Mz
 IzLA==
X-Gm-Message-State: APjAAAXFRPZuoDSTKqFrmXFCo2ZHFt3BLONTCs+oseBLd9Gi4G0rjGZw
 34T5B11WY2AeRC0F4TtNyBmnFw==
X-Google-Smtp-Source: APXvYqyY/zCmUw3P89UUJMhoBFx2AFHF7hUSFeRrBu9pIR4glCF3WbIF9YxgUdR8YOokcfi9ViiMYg==
X-Received: by 2002:a05:6000:110b:: with SMTP id
 z11mr14887981wrw.252.1582556305282; 
 Mon, 24 Feb 2020 06:58:25 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j12sm8035127wrt.35.2020.02.24.06.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 06:58:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 1/9] ASoC: meson: gx-card: fix sound-dai dt schema
Date: Mon, 24 Feb 2020 15:58:13 +0100
Message-Id: <20200224145821.262873-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200224145821.262873-1-jbrunet@baylibre.com>
References: <20200224145821.262873-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

There is a fair amount of warnings when running 'make dtbs_check' with
amlogic,gx-sound-card.yaml.

Ex:
arch/arm64/boot/dts/amlogic/meson-gxm-q200.dt.yaml: sound: dai-link-0:sound-dai:0:1: missing phandle tag in 0
arch/arm64/boot/dts/amlogic/meson-gxm-q200.dt.yaml: sound: dai-link-0:sound-dai:0:2: missing phandle tag in 0
arch/arm64/boot/dts/amlogic/meson-gxm-q200.dt.yaml: sound: dai-link-0:sound-dai:0: [66, 0, 0] is too long

The reason is that the sound-dai phandle provided has cells, and in such
case the schema should use 'phandle-array' instead of 'phandle', even if
the property expects a single phandle.

Fixes: fd00366b8e41 ("ASoC: meson: gx: add sound card dt-binding documentation")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Hi Mark,

 The statement above is based on this LKML discussion I found:
 https://lkml.org/lkml/2019/9/30/382

 To be honest, I don't really get why the consumer should know whether
 the phandle will have cells or not. AFAIK, the consumer does not care
 about this ...

 .../devicetree/bindings/sound/amlogic,gx-sound-card.yaml      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
index fb374c659be1..a48222e8cd08 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
@@ -57,7 +57,7 @@ patternProperties:
           rate
 
       sound-dai:
-        $ref: /schemas/types.yaml#/definitions/phandle
+        $ref: /schemas/types.yaml#/definitions/phandle-array
         description: phandle of the CPU DAI
 
     patternProperties:
@@ -71,7 +71,7 @@ patternProperties:
 
         properties:
           sound-dai:
-            $ref: /schemas/types.yaml#/definitions/phandle
+            $ref: /schemas/types.yaml#/definitions/phandle-array
             description: phandle of the codec DAI
 
         required:
-- 
2.24.1

