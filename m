Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B26124F45
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 18:27:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C01D91670;
	Wed, 18 Dec 2019 18:26:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C01D91670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576690065;
	bh=wq5QMPkgucoGkkTxEeetRXiq/UuFVmiOlINuqbmbfKw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d9zS7kugClIh5s4fi9lMd6MwNHUtUUkwvflYMINM5WkySilCfznXCor0YV896PXuy
	 C1ue6TygF1ir8Ggk7oLXMn5v4kKTWirCojKwbGYq5+fl20OYAEAcjMeoedjkHN+kYy
	 Fd+x3c+oksV2wtTaaWnTrsP5LVlk7dtehFwlwP+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46893F80271;
	Wed, 18 Dec 2019 18:24:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1461BF8026A; Wed, 18 Dec 2019 18:24:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CCF9F80247
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 18:24:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CCF9F80247
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="Aq11DQQz"
Received: by mail-wr1-x442.google.com with SMTP id c14so3161547wrn.7
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 09:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tSV0U+WsxMuhIA7h8z+p35tUgb5H1eC3kU9lrnCcoSE=;
 b=Aq11DQQzGzUVMcpWF0JLC2YC8sZjcaX3sfuiLmMCNRh+4c7+JI34s4KpbzVuBJAHhU
 h5+qSCTuVinAqS2kS5fTfta1r86RCr1OoBFcIbsSOYGA4dTisxrZ67amFumwgvYNMu6i
 PNay5IKLqsKRt2sGA5KLjCcDNArAXPXSwVMKRQXPVctl7oH0fH08hM2qFAQUmhE4ycgT
 8gScSfV2FbRmb5BcHVFOFtO0xdqNAM46Z9Uyz4CjV38JT4PmakxTTk5RfsutAf472msv
 9d6kV3z6w/sM6/o1V7cJsXSmXmAmxw6tLaFTekzis8EWAKgU8DoTZVv+vU52P4vvqOh5
 L9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tSV0U+WsxMuhIA7h8z+p35tUgb5H1eC3kU9lrnCcoSE=;
 b=grMtT/jvseiNNikdnePYJh0KHbF02a1S2dnsy+2ig+8t5Jc1Xbma5EW7DtyI/Okk88
 SxgXQPoh1pi3F4q4tibHbDuCrIiXz2rqJDaOzl/XtUttB1wcT7Bj3ajW2sNoIBEGg4FN
 2YpWNrNX9EALV16MBoOfYTklvVT5REX7dQsqv0S64xDIuX+XBOMN+VNapz790juNequ6
 +H6xQpPO9Yb2WBcwQ0lIEInji/IfW5pSaiKjkuEGMScQTvpzUxTwYCu6g1a46NFqY0Lo
 HsT2jqiG8BczM3sWTUE6TA75HnTHOiBaCmJLiewAry581POP+x6MKn4JISGfjjV6EU7B
 Un7A==
X-Gm-Message-State: APjAAAWhYUa6w5PdCGtjXA6lCNAgELmZEm/Ac4NAvSPPwqLiE0q5QF+T
 pLhIsajx9CowC8XvsQUm47kLEA==
X-Google-Smtp-Source: APXvYqzR3OHiC1qb2gmKaVTY+JWZnRqg1+/NxiFB3m8W82gVRRtbYJi73MwFBkCdV+TgNGVWs/ce9Q==
X-Received: by 2002:adf:e8ca:: with SMTP id k10mr4149822wrn.50.1576689869279; 
 Wed, 18 Dec 2019 09:24:29 -0800 (PST)
Received: from localhost.localdomain (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id 4sm2883231wmg.22.2019.12.18.09.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 09:24:28 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Wed, 18 Dec 2019 18:24:18 +0100
Message-Id: <20191218172420.1199117-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191218172420.1199117-1-jbrunet@baylibre.com>
References: <20191218172420.1199117-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 2/4] ASoC: meson: axg-fifo: add fifo depth to
	the bindings documentation
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

Add a new property with the depth of the fifo in bytes. This is useful
since some instance of the fifo, even on the same SoC, may have different
depth. The depth is useful is set some parameters of the fifo.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
index 3080979350a0..fa4545ed81ca 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
@@ -17,6 +17,9 @@ Required properties:
   * "arb" : memory ARB line (required)
   * "rst" : dedicated device reset line (optional)
 - #sound-dai-cells: must be 0.
+- amlogic,fifo-depth: The size of the controller's fifo in bytes. This
+  		      is useful for determining certain configuration such
+		      as the flush threshold of the fifo
 
 Example of FRDDR A on the A113 SoC:
 
@@ -27,4 +30,5 @@ frddr_a: audio-controller@1c0 {
 	interrupts = <GIC_SPI 88 IRQ_TYPE_EDGE_RISING>;
 	clocks = <&clkc_audio AUD_CLKID_FRDDR_A>;
 	resets = <&arb AXG_ARB_FRDDR_A>;
+	fifo-depth = <512>;
 };
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
