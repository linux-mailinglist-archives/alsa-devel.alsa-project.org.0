Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE7E272146
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 12:37:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 262551710;
	Mon, 21 Sep 2020 12:36:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 262551710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600684623;
	bh=NdGyoRYkKZvP01+kEb44ZuymONqz4VyR72Pt7Pzwt3k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CzErUXOzAvIPutfBh+07ya4AYaOBFXp2nG/yUtLJQP6B4IeTbZVKPECjEuFFjMETJ
	 4mOp7pwjrkCiMpW0CojJl6AYKzfsmLShWee+t187FgIbtM69w8QMvCv9WfLfAHEOg6
	 foaOpVY0GLhw6+LM7NoZa6vHFoXlleDkeNpvP8Yo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD382F8034E;
	Mon, 21 Sep 2020 12:28:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 062E9F80316; Mon, 21 Sep 2020 12:28:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A31CDF802DD
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 12:27:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A31CDF802DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Gt5MPgd+"
Received: by mail-wr1-x444.google.com with SMTP id t10so12155926wrv.1
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 03:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sjb20+qzG//QXYZPPH3YllTlMZ4wlxmmKse+Y7AgH+E=;
 b=Gt5MPgd+eGWukOpWw3gbzAbL/PMs4sfkNXWEj1w69UzlkmLKPkcHZeZasIzmb1EkoU
 8Wn3kISsGZC+6gp3TOi5DFPsEr2e0Hit+oIaKb+m+eDAlwXaEYwaygKvHnLhupgDSTEc
 zZEf1ju1cx0aEbHoIntF4ShFl04am+xCvdxE+zcsnMDTz6QGReRqugsf9gWC7+CRa/lX
 08XS3vFRbOTlVi7keYC/7pBxmphOJqYEmKIYPLA6fK25bTNF01GyqvkW33Wl0HsgpYFz
 3KCiWyXJUfeYNplFTh5xZpEglbWdi6JcV6JxZgggAvUbsafJXsTPD/4tsDO7dr1w7J7s
 nPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sjb20+qzG//QXYZPPH3YllTlMZ4wlxmmKse+Y7AgH+E=;
 b=QYg1e8JZ10LpNeQ2FxR3jVxa9DWNpAsTPiQc6MUwfHRqEB+Fd5xz4gED0eros+XhwV
 8DCpQu2zi6IUnU2H0xtKHPsFFaCDYE+74WagDLabUUSelfTsHbQejFyPiSRQIkUEN7ID
 a+OucZsHrya8c4lWQHk9Z8AZBvskyNr3QdPDiuoxyPNTEuRf7FcHAWxtJrbzcI3a1pYM
 M8RfYME+n5E0ATqsmV2szn1uP1OkavKL67t+HF4KuJbMqoEZu1vgI0tiVqYY7wM019cs
 iK5VKw8xtlTo2KQ9UfaUIhFcCZYfw7GqktTIO4IzxNJkxGRr8ZqyRrYCmHT1Bx3nhA63
 nonQ==
X-Gm-Message-State: AOAM5304G8VzPLFMhUXC1qNkw3VBqlpqgkMC9ovCzzUbGkrfscgg4ElU
 YKWHV//sFcHr1EcR7uYLtkw=
X-Google-Smtp-Source: ABdhPJzA1z3pUFLEYQEpVnYpNBuM/NODfBo4WWIgEhPHBWxV0uyy/NRr5b+d/VxrtgC/ZJKR3iLlGw==
X-Received: by 2002:adf:e481:: with SMTP id i1mr51402018wrm.391.1600684070367; 
 Mon, 21 Sep 2020 03:27:50 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id h2sm20713774wrp.69.2020.09.21.03.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 03:27:49 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v4 12/22] arm: dts: sunxi: h3/h5: Add HDMI audio
Date: Mon, 21 Sep 2020 12:27:21 +0200
Message-Id: <20200921102731.747736-13-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200921102731.747736-1-peron.clem@gmail.com>
References: <20200921102731.747736-1-peron.clem@gmail.com>
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

Add a simple-soundcard to link audio between HDMI and I2S.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm/boot/dts/sunxi-h3-h5.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
index 3dca6d89cab9..7168e9412410 100644
--- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
@@ -105,6 +105,25 @@ de: display-engine {
 		status = "disabled";
 	};
 
+	hdmi_sound: hdmi-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,name = "sun8i-h3-hdmi";
+		simple-audio-card,mclk-fs = <128>;
+		simple-audio-card,frame-inversion;
+		status = "disabled";
+
+		simple-audio-card,codec {
+			sound-dai = <&hdmi>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s2>;
+			dai-tdm-slot-num = <2>;
+			dai-tdm-slot-width = <32>;
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -806,6 +825,7 @@ csi: camera@1cb0000 {
 		};
 
 		hdmi: hdmi@1ee0000 {
+			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun8i-h3-dw-hdmi",
 				     "allwinner,sun8i-a83t-dw-hdmi";
 			reg = <0x01ee0000 0x10000>;
-- 
2.25.1

