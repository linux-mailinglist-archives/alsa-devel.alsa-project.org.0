Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DB06886BD
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 19:39:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FBAEEC8;
	Thu,  2 Feb 2023 19:38:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FBAEEC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675363140;
	bh=WEtxX57XVTZg/EgliAw1vcWrKC2IXlVbqsmFQH8mVVY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bYA3cKmKdyrpScGSKiRWpyu9pmivf1LnFqM/PZvBm0Pb02xFbk2PdFpDA71lFyd81
	 8ctIz3awHHwLJ0IfFpLfYxbWuiYzmr1ShRWOV0aWYQyPmujokbcBaI0HR64Sjl83BF
	 Oo2tsBxlZ1Db47mZxO6TM/pi0hY2u4xTalkgbDCg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3C2BF80552;
	Thu,  2 Feb 2023 19:37:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B9A5F804DF; Thu,  2 Feb 2023 19:37:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C89EEF80271
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 19:37:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C89EEF80271
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=l06A1cmX
Received: by mail-wr1-x435.google.com with SMTP id q5so2606059wrv.0
 for <alsa-devel@alsa-project.org>; Thu, 02 Feb 2023 10:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QeIfWHDa2fvM5jUnMkL8MI7fcZ0bv0i4OOCgMKL446E=;
 b=l06A1cmXwgKENlFdGLp7sC4/eyJqhQGFvt4WqG9szuR7KAzjP3ilZlD2hOQqUJNRqD
 y3ckO43HNJ3hiNoIuABaBoCYWYdHAr2oVhJXGyhd0e3wQfZdsBGSaJJleNkYc+7imVdc
 jQrNTRkmnSzPebl/3WAjEkdFAkMP81O7guCTHQzCMtxl09H0Q2KgM7/MCLQDnpg5DCBj
 +dGns2SgfBT/jHvrCuq1PRHBINCr7tyy/gk/Erwt2XpcxqtESE3Qz8vzRbe/KQzjqJzF
 DRUXob7GENdxln0PH2KRCPhBsLN3/lzLRlG9s5jKXszXTeTJY073AMpEBT8ZL6ApjJ8Y
 xzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QeIfWHDa2fvM5jUnMkL8MI7fcZ0bv0i4OOCgMKL446E=;
 b=O4W6rY77yW1/5t8y8HoNlxi0lm/QpAW/qCpK1Ti6Gyi5xwYrIhxoPXtULiLPGSb+T4
 vDe87c25JHeqlgR/qTMUjAYtEXq9rzR0MxNHiy3OzQbhf2vNIGn6Wzv9mBQ4XyP4zcyh
 HgJrAZCcOx8kLKt+ezFsvPJg3BVM1GshUZDXlt/N8uilNHxycmtI3stWbUWmXTT9mb74
 bVXYlEeHmljyCbA0Y6UgVsGJsodnVHZXNwJRKjNJ6ei1xyWQxnOJwxaZpNJRbMGrod37
 t6zdXRkcCXfO3vlL6Y0PFDBCKHyLBuAOV+Xwh+y/8SRqiFiqN7VWhI/RLIUsd5GNS1sN
 ExJQ==
X-Gm-Message-State: AO0yUKXVqVHD2zhOaYTt78Yc4I3tAOhRsd3BiDuD+YX3SJC6QlGZoY0k
 FNTHpxguoWvOBmwc/U7HvVMPru9tmJsfJy64
X-Google-Smtp-Source: AK7set/gl7mkCo0fFqVVU8e+mU0M0fxQBGITq/co13H8UNB+GuXOO3uWbLmrv5x5yRG3W+gngOal/Q==
X-Received: by 2002:adf:9c8e:0:b0:2c1:28dc:1561 with SMTP id
 d14-20020adf9c8e000000b002c128dc1561mr6380662wre.44.1675363050459; 
 Thu, 02 Feb 2023 10:37:30 -0800 (PST)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net.
 [82.65.169.74]) by smtp.googlemail.com with ESMTPSA id
 p12-20020a5d48cc000000b00241fab5a296sm164664wrs.40.2023.02.02.10.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 10:37:30 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
Subject: [PATCH 2/9] ASoC: dt-bindings: meson: fix gx-card codec node regex
Date: Thu,  2 Feb 2023 19:36:46 +0100
Message-Id: <20230202183653.486216-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230202183653.486216-1-jbrunet@baylibre.com>
References: <20230202183653.486216-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

'codec' is a valid node name when there is a single codec
in the link. Fix the node regular expression to apply this.

Fixes: fd00366b8e41 ("ASoC: meson: gx: add sound card dt-binding documentation")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/sound/amlogic,gx-sound-card.yaml        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
index 5b8d59245f82..b358fd601ed3 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
@@ -62,7 +62,7 @@ patternProperties:
         description: phandle of the CPU DAI
 
     patternProperties:
-      "^codec-[0-9]+$":
+      "^codec(-[0-9]+)?$":
         type: object
         additionalProperties: false
         description: |-
-- 
2.39.0

