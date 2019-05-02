Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AD0140E2
	for <lists+alsa-devel@lfdr.de>; Sun,  5 May 2019 17:57:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A6B31836;
	Sun,  5 May 2019 17:56:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A6B31836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557071831;
	bh=HnvBXx7C4lEkOrsV2KRHe/74RCbg2hfS24CBwDDJHU4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=caiwFonD8d15tHDGTNusBzunKev2K9XvOU5tu8qKVlTNQ/X9DDcB8e+v0siJc7Deh
	 Aon9aEoGvCvIjnhVtRmXNZN9hL9yCaPuprSPYIzOeEpSlzIVk1EaP04J9hx1DAfgcf
	 mCCH6hIglFLe3LGG+s8YOwBgK742iIkGktfXupFk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95259F89727;
	Sun,  5 May 2019 17:54:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 704DDF896EA; Thu,  2 May 2019 14:10:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64A66F896AA
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 14:10:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64A66F896AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="fGFv2mw4"
Received: by mail-wr1-x444.google.com with SMTP id k16so3013401wrn.5
 for <alsa-devel@alsa-project.org>; Thu, 02 May 2019 05:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WV5PITTv1apIvGOQpl0Oue1rXCYUzZjLQa3jrOACL0k=;
 b=fGFv2mw4iL0cv2bG/GRA7d1X4HgNeWqkFUlKM+Y/IqRoYZkLd0lJQcSAr9hZhYwfJ6
 hOPQ2Lvq9gbk+Sd5w5JijwJEeNRrewo04HsjsjC4UFrKfgiKFa9pYpbbdZ3VFnEkmYtV
 7apA/VD3apl7Qf0l8II8mQYF0IM7z5F7ujT3GPaile4zDTk/anUVf5ndCF1HvidAejb9
 RDNZpwoYffe52dGwv0N9zyhFGxjRfihGe58Cb++wdZZwKD9NW1ztJc36uCy3vE+0uRn5
 tZDcSJcNeWAmC+5W/TabQR/vaJWPWnNCVawCbNyKLSflnfO05LztfL+RP8FkKJh4TDuV
 9hFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WV5PITTv1apIvGOQpl0Oue1rXCYUzZjLQa3jrOACL0k=;
 b=miASzcYTrzqMPSQ7A30crluFMmSEzdhRqvECAnAe0thE8t/6zZhtofvp1VEZdXjnbF
 FTMDw6d2jiZxFbhMPki9bapluq0CdC4eZ6fFBQB0A3s0pSf557G+F8yy32rnsjdm7CVv
 SnKtL+EyXbV/e1qiAtCNB7s51sNrAwHzp6ZYp0Cbu5ZRowBUzinmJ5dvxW7rhI0cSxqO
 JpK/zoyDx22oPK0Ro1ox7686UKxp3RcKOYn20Y71hINxzgcAh6mkPm/GgQg2tEtr5C86
 nzw0KJ6Pgl88lTHSsmbZYVcSmUZ70GVYg4TERClWABsFpwmn7n0buqJKKlqs15HFSeeW
 BtoQ==
X-Gm-Message-State: APjAAAVOVMtBoVQOsV/7AInhoQeLFU0woKegoVblzBSGx/w19yUgf+ms
 w2BK/h6HN7GrHJHYtA6cvQErgw==
X-Google-Smtp-Source: APXvYqxHbdw86DQT9DLiLhVUZhwVSNryaz0tC87K271cS45Tz+OjI7rgzVXULNJc92nQD2UrLXWBOQ==
X-Received: by 2002:a5d:5383:: with SMTP id d3mr2573633wrv.105.1556799055563; 
 Thu, 02 May 2019 05:10:55 -0700 (PDT)
Received: from localhost.localdomain
 (aputeaux-684-1-8-187.w90-86.abo.wanadoo.fr. [90.86.125.187])
 by smtp.gmail.com with ESMTPSA id u9sm3648348wmd.14.2019.05.02.05.10.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 05:10:54 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 mark.rutland@arm.com, matthias.bgg@gmail.com, perex@perex.cz,
 tiwai@suse.com, kaichieh.chuang@mediatek.com, shunli.wang@mediatek.com
Date: Thu,  2 May 2019 14:10:38 +0200
Message-Id: <20190502121041.8045-3-fparent@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502121041.8045-1-fparent@baylibre.com>
References: <20190502121041.8045-1-fparent@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 05 May 2019 17:54:01 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH 2/5] dt-bindings: sound: Add MT8516 AFE PCM
	bindings
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

Add documentation for the bindings of the MT8516 AFE PCM driver.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 .../bindings/sound/mt8516-afe-pcm.txt         | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8516-afe-pcm.txt

diff --git a/Documentation/devicetree/bindings/sound/mt8516-afe-pcm.txt b/Documentation/devicetree/bindings/sound/mt8516-afe-pcm.txt
new file mode 100644
index 000000000000..c5fb3c55a7f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt8516-afe-pcm.txt
@@ -0,0 +1,28 @@
+Mediatek AFE PCM controller for mt8516
+
+Required properties:
+- compatible:  "mediatek,mt8516-audio"
+- interrupts: should contain AFE interrupt
+- clocks: Must contain an entry for each entry in clock-names
+- clock-names: should have these clock names:
+		"top_pdn_audio",
+		"aud_dac_clk",
+		"aud_dac_predis_clk",
+		"aud_adc_clk";
+
+Example:
+
+
+	afe: mt8516-afe-pcm@11140000  {
+		compatible = "mediatek,mt8516-audio";
+		reg = <0 0x11140000 0 0x1000>;
+		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&topckgen CLK_TOP_AUDIO>,
+			 <&audiotop CLK_AUD_DAC>,
+			 <&audiotop CLK_AUD_DAC_PREDIS>,
+			 <&audiotop CLK_AUD_ADC>;
+		clock-names = "top_pdn_audio",
+			      "aud_dac_clk",
+			      "aud_dac_predis_clk",
+			      "aud_adc_clk";
+	};
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
