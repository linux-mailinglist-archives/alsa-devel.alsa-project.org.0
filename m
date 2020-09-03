Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE4C25CB43
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 22:40:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 034CE1AAA;
	Thu,  3 Sep 2020 22:39:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 034CE1AAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599165605;
	bh=Ffu0p009uCbD0lcNfaK6xKfJNWxF0SG5XCL5X9Lp6GY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NhpV+sr4SP9KT6UNikJVQYrLQymwUqffBIokLjSGiNh5hCGh0y27SomQ06wAYo0tu
	 RccEOqaJ/dvIgx6FLsgcxzEZ8AYzo6C2udGfQRs8hqgW+qDPmKAD1+vPMdlUBaF/Zz
	 TNGICaxfcF5nrfy3iLSbKwNAdZyE4B6uznk6upKc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25D7AF8034F;
	Thu,  3 Sep 2020 22:31:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20EBCF80346; Thu,  3 Sep 2020 22:31:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D775F802C4
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 22:31:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D775F802C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="O0aIAKeZ"
Received: by mail-wm1-x343.google.com with SMTP id w2so4134419wmi.1
 for <alsa-devel@alsa-project.org>; Thu, 03 Sep 2020 13:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZKqv9b9ye6nXeHQ0sv780xJ1tkZxHw2igrPZLKbetcg=;
 b=O0aIAKeZyRNk7s9q8EZqQBEC/clHIDc8DdK7q9xpLt4BdmEh5sK9RmICcgAEITQigF
 IjzCcyi0HtNrESluB8FrQS36PWGA5qUgjamBvc35j2hh37RYxg0PF2EmgMxN9mkRbx1s
 hRwQ8y+6iMxrUOduNrhX6aTGkgSc+663j5tTNlAc7iM+rF9afhNH5cpkOxfpN8YaAV2j
 FynxtTlWPmvEJ39aOTTFJ4fBbGrkDWP3xbKsZt2H07yOzd4zkA4zc+yemiP90EkDAVfj
 gmV6c/KRgxIMO8mM36+4DOG1gfa+YTfswGvilmcURlve/J41Jw0OqFq+N0XOD4SE4Yis
 VNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZKqv9b9ye6nXeHQ0sv780xJ1tkZxHw2igrPZLKbetcg=;
 b=Wbr1AFJBSQPHvx4YQek8wEWsFHDoHfTpWua29EuAM2uAUfvpwKV2MkC7my//UxMqjb
 MQEJubjaFpl2DWrOQXWSNVnA1NWtZxu2pCrWr+DdBlnV8Z4v5CzP5su+iKI2+iPHy/0K
 XrrTNtFywhGC3GqgBhT6OkIxVyISrKegbq2j0w/+hCY1OR/rwEboyqz9LFfQCC8QOoxJ
 jkRrBoJsW0u8Ncof4XnDpptICCjrfxPTWMSojt0uOy7s9lQUtxXrWyDBq8vlcOhqimnV
 KEU4vU2E9TFAYWyn4C7cKUmhbWRzEyW6sxtR83ME+vq/gYauQCIJopLWJSluu1X6cfWq
 tw2w==
X-Gm-Message-State: AOAM530z5dBNNTZmxevFKG9iEPvkAnBgmKNtdCekgAZObwG7XN09+NtU
 xXjMKnEGMz+KVlD0kfg5f/Q=
X-Google-Smtp-Source: ABdhPJxa1EVUcgTCV2q8x5mnFjfUNgDGgjSILnbXs8nPpEpQiRI50TKDBegx1b73F86O67npyqTcCA==
X-Received: by 2002:a1c:8003:: with SMTP id b3mr4498954wmd.121.1599165060920; 
 Thu, 03 Sep 2020 13:31:00 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id q186sm6818274wma.45.2020.09.03.13.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 13:31:00 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2 15/20] arm: sun8i: h3: Add HDMI audio to Beelink X2
Date: Thu,  3 Sep 2020 22:30:29 +0200
Message-Id: <20200903203034.1057334-16-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200903203034.1057334-1-peron.clem@gmail.com>
References: <20200903203034.1057334-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi@googlegroups.com,
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
@@ -142,6 +142,14 @@ hdmi_out_con: endpoint {
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
2.25.1

