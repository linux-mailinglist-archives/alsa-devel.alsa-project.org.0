Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9121B8FBF
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Apr 2020 14:09:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A6B5166D;
	Sun, 26 Apr 2020 14:08:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A6B5166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587902981;
	bh=e788LFi/Pcs803Mg6wOAUZVRfFmm9WQIduojgAg8t2I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EOWUFy6IOFXvXiIo3Wpo5lDTDel/o/1jXVibFder5GqiKrXknOYxBZrx72cUvZlPi
	 q4yw5b2suH9xo0naPDZqWa5l6jeKl4PvzaHhZCH1A2RBrAx8Ly5RX/wEmOm8M1BLAs
	 xqqrchychlEqpZCRxmO+efIYJH1IGQdAMJ/jZgmU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15DA5F802BC;
	Sun, 26 Apr 2020 14:05:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D85DF8029B; Sun, 26 Apr 2020 14:05:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25D20F8028C
 for <alsa-devel@alsa-project.org>; Sun, 26 Apr 2020 14:04:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25D20F8028C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pShhOnlm"
Received: by mail-wm1-x343.google.com with SMTP id h4so3107414wmb.4
 for <alsa-devel@alsa-project.org>; Sun, 26 Apr 2020 05:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9HRQH21sjnH214q9XNZxwKqQbpfMImzTXqPykucLUEM=;
 b=pShhOnlmWPoYXwtI7svu9Gkn0lqpZ/bj+bp16sYHcB+J+6SmDLIQRlOrmx4nwK47Hw
 8yz8EbV0XefUllxTBINE1PMV4qLftxO4nM+zHMZnKL+08QyomXVyHUahRjowx3eHauqi
 uKyDYgBlZbQ8vzvyL1B3ouK2g4XCsMM5mKbAG15z5Ty3sMJILGNCrYuTIKOwSLNXZdjy
 KONr5WZDL65AtDYUeydesSkCaajICba6JguBf8HULRHgUa0nxp9yX+Kepc45irwEFEHd
 76e1uZZbiUWjh3/xsYjw1yYhkIuzKaP2CAmAynvOcbOQiDB+58JJtueKVBid24A3RZrq
 pzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9HRQH21sjnH214q9XNZxwKqQbpfMImzTXqPykucLUEM=;
 b=Wbsq34cY0qQhQpkIpDn2a57vRGKX6+1V2WQ/iTB1G90ERabSK66BuLofF/MkPE3vS7
 ZV2DEpvcyHp2lDqquhoO0QXdz/EoBtHf5+VVFlU2upHqwb4O4jWxWeANzmz1uSepGZxN
 i/0pA35DRRLypgYpAPqKCeRZSqwhG/pIrY+p5D08eMQd6WV1nToHDV2oqWbRqj/eXbAS
 hppqdMdfjSEnW2Og+PqTonaQ1ZrjH3XfZd4WPEPvMNFqcGVxlyEIogYkE6KMj1ALoEf7
 y3cC5aFpU5x8cLU89zdtPfXtgMixd9LS4Us1LZOBEWIbV55JR6MFkggdL9/DoJRUcQ/t
 FC2g==
X-Gm-Message-State: AGi0Puaceo9KVwNF2jv9FCHL0nTjevh5YXJW40uAW6YGT1Ptc1XpLgh+
 pG1XbyZV+OyJGDwEgfLKi3U=
X-Google-Smtp-Source: APiQypIu+g4/wwMFCZy1TJKiDdgrbhdng4uU6Go4ZSBkM4nLAOTBSTggxG+2rj3Jejua2K4t3jZ1QA==
X-Received: by 2002:a1c:2042:: with SMTP id g63mr20587018wmg.70.1587902693276; 
 Sun, 26 Apr 2020 05:04:53 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0:59f6:22c5:d1f3:662d])
 by smtp.gmail.com with ESMTPSA id
 s24sm11120026wmj.28.2020.04.26.05.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2020 05:04:52 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 6/7] arm: sun8i: h3: Add HDMI audio to Beelink X2
Date: Sun, 26 Apr 2020 14:04:41 +0200
Message-Id: <20200426120442.11560-7-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200426120442.11560-1-peron.clem@gmail.com>
References: <20200426120442.11560-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

From: Marcus Cooper <codekipper@gmail.com>

Enable HDMI audio on the Beelink X2.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm/boot/dts/sun8i-h3-beelink-x2.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts b/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
index 45a24441ff18..f9bec6935120 100644
--- a/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
+++ b/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
@@ -142,6 +142,14 @@
 	};
 };
 
+&hdmi_sound {
+	status = "okay";
+};
+
+&i2s2 {
+	status = "okay";
+};
+
 &ir {
 	linux,rc-map-name = "rc-tanix-tx3mini";
 	pinctrl-names = "default";
-- 
2.20.1

