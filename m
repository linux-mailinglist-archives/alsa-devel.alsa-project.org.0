Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6DB5E384
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2019 14:09:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0421D1699;
	Wed,  3 Jul 2019 14:08:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0421D1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562155783;
	bh=GqUVtDpfaqPvcD11SsJbfWOXQDn2IrKZkdzWvm6mY+I=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VZw3iYdGFOSJ2rowRC7j1V0yZAZedIwSgILq0yK/GGm0c+YcCkg0xLB4HWuWjYcer
	 xCjddCObozgkJTCml8zZ0YQtRXFT9MHriKSHLYlnqFP6j46SjRsFLqIxUt8DooXtlq
	 QRbKDE3Qpkt3E1VUJV7nUXffyjQADShM4kVoKsIY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 244B3F80111;
	Wed,  3 Jul 2019 14:08:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 529C2F800F3; Wed,  3 Jul 2019 14:07:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96249F80058
 for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2019 14:07:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96249F80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="BWYV3U42"
Received: by mail-wm1-x342.google.com with SMTP id z23so2109480wma.4
 for <alsa-devel@alsa-project.org>; Wed, 03 Jul 2019 05:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3nDWpJDfpOQfXawVusespJk2SyBgud3JYRZ5ZXC0wU4=;
 b=BWYV3U428Gc8QR7aKZY4nWtDDgoYNuQo2A3i0xocI7A1OdX/bXOHlzZbpoM9HpZmu5
 w2eYh3sthQswiY9VQBzBrJA/+2OlKshkF9G/8p28Jf9knhlhOXiQd6jE/8WJgbvP5mzO
 8jyDCL1dq/c999yNYGKrDCJssPk/zSlvY4AQrzN68K3tX50+QFWAfb6I+LneNIxK1CVp
 75CXk6f1JvxnxN6ria/lK5C9QmHE3C1pGG2a+/8V7UjhZ7VtfjD2HVJp8v3+ICLd3189
 6Ocyz1v/BB5Zms/+78h+0r1N4ckL3eh/r0S3CTS9XS8F6LUiDwoZSOUpilo/CwiEA7JP
 C7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3nDWpJDfpOQfXawVusespJk2SyBgud3JYRZ5ZXC0wU4=;
 b=F0LAVldGjhEzE7CaNuxhpRLCO+E1ClVLb4UZ6HuS6WgGt5lMXXimdG4okxAI613cMH
 XWhMpJdaFKOv4flII0Wq1tbtPOJi6ECxnj8Roe+CjUb1XeUfg5QO4q8/+I8aq/63bN/0
 2ZXbbv50lOHXqsX55uLLOPGWAysa+uXmy3HiA0Y9TRKSaPuoYXHHxZrETe266tw+5hLR
 XWBVCwT64biTGs7mQQalaKUzkGPWWRgAaqOE2O6k3+YmjkV7imqvS/i0awd6E5RpkVrB
 Rr0BR0YIOUce9giHwP8wWHweFWIaeuo3iLq3kbeAGW0sl6Q+y+cs7Qf7dy82FTNJF771
 gFHQ==
X-Gm-Message-State: APjAAAVqTMi1uAT4DqYl/6EdjbaFJMu/3k7LjwA55Mm4ARq7AVbwEw12
 xkJJIMoZz8rpIgQ5gXXi2bdbzQ==
X-Google-Smtp-Source: APXvYqzol6Ot5n5vTIYz4kULwGeZdgCKUF/deXcHiE+/rQ3Rb/Lb4EzxU0wc9AZz6JzdmHnS4EQ/7g==
X-Received: by 2002:a1c:4041:: with SMTP id n62mr8190423wma.100.1562155674760; 
 Wed, 03 Jul 2019 05:07:54 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z126sm2767638wmb.32.2019.07.03.05.07.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 05:07:54 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Date: Wed,  3 Jul 2019 14:07:48 +0200
Message-Id: <20190703120749.32341-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703120749.32341-1-jbrunet@baylibre.com>
References: <20190703120749.32341-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 1/2] ASoC: meson: axg-tdm-formatter: add reset
	to the bindings documentation
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add an optional reset property to the tdm formatter bindings. The
dedicated reset line is present on some SoC families, such as the g12a.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/amlogic,axg-tdm-formatters.txt           | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
index 3b94a715a0b9..8835a43edfbb 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
@@ -15,11 +15,15 @@ Required properties:
   * "lrclk"    : sample clock
   * "lrclk_sel": sample clock input multiplexer
 
-Example of TDMOUT_A on the A113 SoC:
+Optional property:
+- resets: phandle to the dedicated reset line of the tdm formatter.
+
+Example of TDMOUT_A on the S905X2 SoC:
 
 tdmout_a: audio-controller@500 {
 	compatible = "amlogic,axg-tdmout";
 	reg = <0x0 0x500 0x0 0x40>;
+	resets = <&clkc_audio AUD_RESET_TDMOUT_A>;
 	clocks = <&clkc_audio AUD_CLKID_TDMOUT_A>,
 		 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK>,
 		 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK_SEL>,
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
