Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8672716FA
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Sep 2020 20:15:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF1131681;
	Sun, 20 Sep 2020 20:14:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF1131681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600625737;
	bh=K4dmeNGtrcbmftZRBPeJGLx+M++AXOW7aIu4gnDm/Kk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dsmNBcTTiaDg/SyzyOZm5yLe/1v1KHhbWR8NGm4DbOP1HoHIQY+BAd3ePsT9lN2Hn
	 w+jTW9BwLbelNaSaT0kbGRcgPoPQDInVVFWrWBuvFYdimwLDyCnAmDvkXBH1nTPNwn
	 vC68ZqTcNQ8iXffNAa9GqXefX89jAvGcR76+ch+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12F70F8032A;
	Sun, 20 Sep 2020 20:08:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8794F802E9; Sun, 20 Sep 2020 20:08:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8D6AF80234
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 20:08:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8D6AF80234
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DTugHYDQ"
Received: by mail-wm1-x344.google.com with SMTP id k18so10328470wmj.5
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 11:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4HdI15SBEuyVNQNB+e23d+K5pgBDpyUoqfbF257aXR4=;
 b=DTugHYDQurkLCf7YEB23JZoq9hjCg3G438oz6nsSwpc3SFB/4a0OpEghykeDOF0weK
 cJAHjsQubS/fikJTAO/56fbHqZ+2asoz8AjWGIYOUs5GM9YfSWJ4BbJGnPa7Q3pxIUDr
 lUCuUrMMNbNsgJFxR1Dv4VUydRlvRuTi60AkTGQuv+yFF6x4o1pjat9OzsExfXCyokI1
 SZM5nG8EviAP9TvUyQFg80Rgupk8YH5z1hcr/Fy4Bo3+w6wDjWT9slQoq/T5kT0NpgrD
 orRO/Ab1BXyOqQ9XphBqrWQZPW+YKKAaN3ofMJ6JQTrswWwvAGmh6XyQnxkS2Uyq/Yvz
 iMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4HdI15SBEuyVNQNB+e23d+K5pgBDpyUoqfbF257aXR4=;
 b=Egco7H7+b4kX+QBINxCup2DYDs/FLbafgNBhyigPOcUmxQEb45ANVDkR3QdXtGNeWe
 Ci0E1O8KoacV9uVX0YjjtjG5RDyWZN0gz70Mul68sYsTsT1ndhLd3SVDsoSiLDAF1aTi
 ZI0nzzD4FarT0daktvCplvbQdjuYWSEcDkTJoiYv9QaEMKidT0iEJViExu9Labiw/RWA
 siUsm0S6wwaeaZjmxqZlyPNvK9fKRdYc9unpM18WEGepKRT0+qZacGlcbRboPWMgLmAV
 aT3kPLcopYIj8AjJttNoLa6bZ0iBQbtmDwKl/0p/iv2kwae+QVej9hXJnW4lsmgbX+vo
 n9Rg==
X-Gm-Message-State: AOAM533lKEu19rTL8rq2k9PMA6957INXzUApyIn1m94qbJOklB2iAISi
 63tD9UNjmEAZrHjk2miRKDjpLV1E08rQFhjd
X-Google-Smtp-Source: ABdhPJz2QaNPDpWIrkvJtScA2IDVibZUxsVBjTipRV+CaMx06zYvvxwXowqoa9Omn92mxSTZEr8IhA==
X-Received: by 2002:a7b:cb81:: with SMTP id m1mr27631898wmi.140.1600625306214; 
 Sun, 20 Sep 2020 11:08:26 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id 18sm15142782wmj.28.2020.09.20.11.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 11:08:25 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v3 13/19] arm: sun8i: h3: Add HDMI audio to Orange Pi 2
Date: Sun, 20 Sep 2020 20:07:52 +0200
Message-Id: <20200920180758.592217-14-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200920180758.592217-1-peron.clem@gmail.com>
References: <20200920180758.592217-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Marcus Cooper <codekipper@gmail.com>,
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

Enable HDMI audio on the Orange Pi 2.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm/boot/dts/sun8i-h3-orangepi-2.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
index 597c425d08ec..64e8e2829f27 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-2.dts
@@ -144,6 +144,14 @@ hdmi_out_con: endpoint {
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
 	pinctrl-names = "default";
 	pinctrl-0 = <&r_ir_rx_pin>;
-- 
2.25.1

