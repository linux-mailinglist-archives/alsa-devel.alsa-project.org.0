Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A89271707
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Sep 2020 20:19:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 755671675;
	Sun, 20 Sep 2020 20:19:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 755671675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600625999;
	bh=Rb5wXmBrtBKDogUuv7UZhOrx+urFeYY/Tiyvce3YfbA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Afn+1yj4y66qwTcduFgF8cIt2sLuTG2PmxUFaWO27NMprgdWofSj5knl1/V8ttSaZ
	 7+WTyrUb87q4M8GGetdgeuwziZsUHULbH9WO+Rc8ztfumD+ssWPC+CJlO7mwOyGEWZ
	 UBpkbVTMfzzsrKZWrS+eGdYwEIeYPf8bNHo8qFoA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7802FF8036B;
	Sun, 20 Sep 2020 20:09:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 142CCF80323; Sun, 20 Sep 2020 20:08:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C32DBF802FB
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 20:08:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C32DBF802FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ci0BaInx"
Received: by mail-wr1-x443.google.com with SMTP id e16so10471922wrm.2
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 11:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JRfXBGFiqY7c/El7z89zWfrRGF9fF+u62x7PKZnaUzI=;
 b=ci0BaInx4i0YAj07xhRBAGBgHj11UknO8IdNfJXLb0LyAVQ1/pyz8f2RtTmRLtQ5Ec
 bOpPp88FsBEagAOovQlTLt1Cs1NVN1jrnNYE8+Qek/cqqaYrTBeF+9xoP1hhI/pJNYeE
 BdX6yx6gjsPg8f+loFV7se4PzTmTFlXtY5OHXuJtqnY2/+Unpq07c6HGN1TPveZ9lmHl
 T6YFuek6A+aMeJNVwKmcyewsDmrxxW11dsSywzXfHX6atUeka5SPBvLtVEPtPI7y/KrB
 hWgVQLCdXya+Usz+kVLoq7oWmwU1NuzttR71+NS6yKC43TLXwlpoNLitP1JLGZNYLvse
 7dTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JRfXBGFiqY7c/El7z89zWfrRGF9fF+u62x7PKZnaUzI=;
 b=SOHidIYsl+UydgUG1ZVswSagCQjY8PwlVAA081j06VMj5Va9SmEl3uun1jAH5tRm8N
 dS3MEa3d5VWOk7upS4vafguL43BV8NMobejYCMAz/uqzqhF0MZtbPEs9EYLxK6iHriwS
 HT94Lc2thMXBoIR4c0cZXBeL7KKFGEHHFFV7o04h0/ycTZnRQeunRCQXnuirMmLB/fVc
 x4en8rFrN9zCqGUpJPF60PAso1ObwLzpTqOUhbd6Vwasd4eL/s7pEUluuaZ9u5NEs34r
 2tgWGS/AXDGeH6N9Sf8dar3ZsRmpW2NWkp4F1DRLDPCPZzxJrskyeIUQHI5+Jwa/gDGh
 Zlug==
X-Gm-Message-State: AOAM530KwDZCL7hnULc0G23hiZiHWOU/474bPp++hOZHuz0O4CIftC5R
 bVWiJTjzwTibsUuWyj6GWGQ=
X-Google-Smtp-Source: ABdhPJzxcgu7TWf5cYHeTfhFnuc/qvk2kIvyK8lXjRxHnrRoPIonBO0Sjr7s1mE7mgOJ/X6RyVy4Ew==
X-Received: by 2002:adf:f6c8:: with SMTP id y8mr51770353wrp.217.1600625313922; 
 Sun, 20 Sep 2020 11:08:33 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id 18sm15142782wmj.28.2020.09.20.11.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 11:08:33 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v3 18/19] arm64: dts: sun50i-h6-orangepi-3: Enable HDMI audio
Date: Sun, 20 Sep 2020 20:07:57 +0200
Message-Id: <20200920180758.592217-19-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200920180758.592217-1-peron.clem@gmail.com>
References: <20200920180758.592217-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Marcus Cooper <codekipper@gmail.com>, linux-sunxi@googlegroups.com,
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

From: Ondrej Jirman <megous@megous.com>

The board has HDMI output, enable audio on it.

Signed-off-by: Ondrej Jirman <megous@megous.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
index 15c9dd8c4479..193587e78031 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
@@ -128,6 +128,14 @@ hdmi_out_con: endpoint {
 	};
 };
 
+&hdmi_sound {
+	status = "okay";
+};
+
+&i2s1 {
+	status = "okay";
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_cldo1>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
-- 
2.25.1

