Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E36027A2D1
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Sep 2020 21:36:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A22CE17E6;
	Sun, 27 Sep 2020 21:35:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A22CE17E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601235373;
	bh=eWiiq5Url4azgTOk6WrrOLGo89ieP4u00auyyK+0BG8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LUsu7ge3a952U8Hp6Jzlt0yIwDJZqkzgr4odGedOnW2GEeia9AgJl5AyZCgfeE1Ot
	 /6aG7lycT8NUAGtFLNq7NDWblfnVuCt+7TzDS3Iz57HkQhxS+tBtwgm8or7wr5comi
	 IaipqBsYgH999Mv/X2Jy+DiI1rZxb7I+QlX90zqc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F173F80317;
	Sun, 27 Sep 2020 21:30:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 409DFF80292; Sun, 27 Sep 2020 21:29:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA062F8029A
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 21:29:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA062F8029A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YOWcmmkG"
Received: by mail-wm1-x342.google.com with SMTP id v12so4627354wmh.3
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 12:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x/iq/UaybIFP5fVA6Ln+hpouuRJu9kADukrtHp3BLVg=;
 b=YOWcmmkGZkoo0xR3hpRolwIz5WB4o72C2m4j4wWLhP0awIseYW8VrNkbz5M7TVqAh7
 nzd/4xyciScgGAlNkp9Qienl1nb0Qe+wKzdkBpQ4VEIKGvw6slRNbX17TpNhy+o3yuLA
 +RQKKcnSbAqRio0HVhoUxiTb6xRZCuTjtNpwih+iNRagzwKS7LOTXj/zGGWCu2TU1JvT
 TQSmgpe5GuKC5SBoCRJF6DwO/kuBq6xZ36INr0g9z35eJUU83TwGviF01wpNuhaQNnjH
 K80ks2dao6LktdmUIGf9WJ6O7Xg0TF3onlpPgSoyS6+crm70EbqY0FetjCIgX6krXfkw
 cgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x/iq/UaybIFP5fVA6Ln+hpouuRJu9kADukrtHp3BLVg=;
 b=je4AKVoYS9ktshVwTGzWtt1Pv2vWMZzXfZ/NFrpiZTmvwpb5fPRz2QXbEpKcfUiuwz
 a7aMX2jQq1FkAB6bJe0QylsegCAQsZwciQS4Us1M2p4F4nSAwlZs/FwShwkOUIdwLRqd
 RpkQeUqTgIcaO/sA0NlgfB9DFHMUYmzd5v5wmrtkXw/8cAOhxNaGM3L//C8L7E6CFs4F
 VY/0EBJ4Vmt1QKbE5lbb4hel7FHx42h4tUaSQWulRXD9v4a0zHWWnqnQcaYTikMEeBOU
 ON1Kim0+Yjrjvjos0tenB1bHTKXm5DvdAglFnKzT4r8dJEb7seyBENaLx2dPSdMI6ECt
 VOrg==
X-Gm-Message-State: AOAM5300kaiQdwtXcOWMvGk9+59HW2TdFRPW2D3bB33izK8L0VWSpib6
 K2kzqJ+o8qkAwwS/riJXHqU=
X-Google-Smtp-Source: ABdhPJwEVVny6H3wcCVbC8vChEo/WrPglNZDmGptdt4Kmi1gaRlgOVezaOJH6sDtWeJkUL30HiHAbg==
X-Received: by 2002:a7b:c453:: with SMTP id l19mr7779709wmi.163.1601234969221; 
 Sun, 27 Sep 2020 12:29:29 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id n21sm6149609wmi.21.2020.09.27.12.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2020 12:29:28 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v5 10/20] arm64: dts: allwinner: h6: Enable HDMI sound for
 Beelink GS1
Date: Sun, 27 Sep 2020 21:29:02 +0200
Message-Id: <20200927192912.46323-11-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200927192912.46323-1-peron.clem@gmail.com>
References: <20200927192912.46323-1-peron.clem@gmail.com>
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

Now that HDMI sound node is available in the SoC dtsi.
Enable it for this board.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
index 3f7ceeb1a767..049c21718846 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
@@ -118,6 +118,14 @@ hdmi_out_con: endpoint {
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
 &mdio {
 	ext_rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
-- 
2.25.1

