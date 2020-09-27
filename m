Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C4C27A2E1
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Sep 2020 21:41:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDE911AC7;
	Sun, 27 Sep 2020 21:40:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDE911AC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601235699;
	bh=Rb5wXmBrtBKDogUuv7UZhOrx+urFeYY/Tiyvce3YfbA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=li6jBLtmZmUMDjhJ11nKuIsSbQMy7NaIcB9ouoN5uee37LptrWcpTjh39g3PUOWPN
	 z4uQ0vc68PvRjD73Iph4FbqFsu5o/uH6c1rD+UfLl2K1Oj3Pj+9kYnyFdctBK2LFGE
	 Si47L5eGqj4L7wy+FuYS7u1MQ6GFw+7I+GOcTTyA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BE86F80362;
	Sun, 27 Sep 2020 21:30:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A56E7F80305; Sun, 27 Sep 2020 21:29:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DC25F802DF
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 21:29:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DC25F802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="iZyv2VLE"
Received: by mail-wm1-x342.google.com with SMTP id v12so4627764wmh.3
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 12:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JRfXBGFiqY7c/El7z89zWfrRGF9fF+u62x7PKZnaUzI=;
 b=iZyv2VLEgfXdTf101uh6h3DUe68TxHsCdp8h9PNhz+JBiBd5noYxV5hWSysw3svFrO
 3hzxseVeGw9pxlCAjvA1BEPYcTTNVp8XRSYF73HyhH/NAYotAPrd5ORkSlV3htIziMEV
 bsnAMNkOGupuZWgg++cuyQImqtV6MwB6N9Sd0RWmNtFcYWfqV3VgP2yNKOdZlPy+Nqf0
 nXuHSJBIpvQs/gztfKSdSLSxOO/cWLMnu6a9O+wf3uF8ENpQY+2OSARre3pdmy0RgC0c
 I1gzQj5z6mrTNLZvqlS2y9qNL4XvFDQ+rEawDAYMIWC9K/6G02J3NvyONDaTQlWhN5yB
 QXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JRfXBGFiqY7c/El7z89zWfrRGF9fF+u62x7PKZnaUzI=;
 b=q0sziTjU/RuysKiZz6ty6/laePE0/DDzhCUbfTAZi55N6RRCD43+AWkEjib+ckIhVS
 LmwbdBZMPH9jaA67oIZ3GSj+sOEFyQvjl4BmX7uiMhKRW6Kwn18ONb2olemn8aTPUr/n
 wOPvfK8VjCH/XzcYN88Hgx2gI5MG0hVV8VuBOlrfkW7mQJl3mWP8wS0jByzemENGWQRL
 OgPnDtgvjQS6AD7cci0S9n6113vR9BEVCDtG9ZKNpgPzwUXnuq6WGnahoHhMxF4IjpyT
 I4ukflauAVyVgdKxawP2xqIs4I6vanBfqPTmF9PTzV5PdhoxUKqW4QhT8ctpW7Tq6Dnu
 XXbg==
X-Gm-Message-State: AOAM530R/m8+8qF4knVvQTZNzLziLuFdqLbIFUGsv9JGDuITdqpgacva
 G9SxzrClfQeNCZ3T/OxoZiY=
X-Google-Smtp-Source: ABdhPJyMfhFmZdZRNFIA7hlt5CN0yPE3ZvZ+6BZVp9QyVpTd/nn/PhNL8cZhWvAv4entdLHdnxWazA==
X-Received: by 2002:a7b:c141:: with SMTP id z1mr8285789wmi.79.1601234977829;
 Sun, 27 Sep 2020 12:29:37 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id n21sm6149609wmi.21.2020.09.27.12.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2020 12:29:37 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v5 18/20] arm64: dts: sun50i-h6-orangepi-3: Enable HDMI audio
Date: Sun, 27 Sep 2020 21:29:10 +0200
Message-Id: <20200927192912.46323-19-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200927192912.46323-1-peron.clem@gmail.com>
References: <20200927192912.46323-1-peron.clem@gmail.com>
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

