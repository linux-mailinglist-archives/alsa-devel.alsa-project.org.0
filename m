Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A14F271701
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Sep 2020 20:17:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10FF816AB;
	Sun, 20 Sep 2020 20:16:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10FF816AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600625851;
	bh=+RfYBz/Rj8O5KxCb8uCFafkT4TJfTlahyp2IDTlfBgc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FEUb8F/ywGhvhtzM2J3QbVk+UlHeQTD7J8cWJ/g8LB5VIHeoyxkvPR9lDHiHvxX62
	 D34AKvOhSzWGaulGHWSEUG9cugd27lFrINhpkossq0PAs5CF04MTCXxbAJPjHzfO1t
	 k+m3QMEvhINiPfhfHjKFniyj1NQAYOvEY/sKSAvs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FCBBF80344;
	Sun, 20 Sep 2020 20:08:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17A30F80306; Sun, 20 Sep 2020 20:08:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E689F802DC
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 20:08:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E689F802DC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cbSqHIX9"
Received: by mail-wm1-x343.google.com with SMTP id e17so9971312wme.0
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 11:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dZhYwaoUjzd/wEdIR2SZMGyqDMCzyDmEzzuRB3l0wN4=;
 b=cbSqHIX9aRG5K5ZMCUbuVkVSOWfBJ3Gox32yJYQ0M3IE9X75NOg6MOKWHMhqCTOj4W
 i1zamfmrZhnA06kC85WVJYrliSBH7fooKs/tN19iGL8DOm/UF08na/0axh8Cnq1qLOxI
 9g27nxVFXSBrTinbvRxXomr/v/Ky4nE5Ig6GSDRxM0mB9LGz//xUHWOMfeeQQebxi9CK
 b5tJ71MBB/1Q7T4jAwbnIJ7Uoe66WT6zp8scsvnf7LssZTNHUm0Bjh68mSMjt6cnnvBq
 PxYbgg+9g1VTNCUgYMyGwJRX8bhcLmXNF7/rSWk84f7voahQ4jPvlpUUd1WwhH/Qe8il
 pyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dZhYwaoUjzd/wEdIR2SZMGyqDMCzyDmEzzuRB3l0wN4=;
 b=nt/BadtGvAzHKoigqNwy8SQIAoT4NTqspt5jIhorep3K2+0Axr6nfbYouXBzeLdgmI
 Uz5LkI7zKEUmDeTOmMOmKy4n99hcCWeeURdxVNBn8v9852kF2w8IyJUzOfCpky9MzlpI
 PyJC/cgiyKNtqfs1X3vauq8ypc+Ct2cogQs9XXNHMEZyKhR3J1r9kHzHr6A3BgOpzXoo
 94SZ48IQS4VRpGQTDW/9w9+eAiKsH7MEOr8cyPZjVZgmAld8v6NqRfzSZEH4Adla8Axi
 52ZWc9KznEYI41HiB7WMqOd66+hGz82wHweD26xxYWaQ5y1aswln7mQMxH6TBb1R9DgU
 afBQ==
X-Gm-Message-State: AOAM5304CU4lF2x8CULlW253JUcHwoqtshuP1M932JC+P6MnM/rrP/6l
 DxhKUenBTuZfFH3uDFTO6rQ=
X-Google-Smtp-Source: ABdhPJzzr58B0gbR4UpjbCunENpo2Bl0uHmKEBGheR6tULQdmKdmZ/eQz9KOEaH7BFLvpN2SKKXjMA==
X-Received: by 2002:a05:600c:ce:: with SMTP id
 u14mr27169163wmm.137.1600625309982; 
 Sun, 20 Sep 2020 11:08:29 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id 18sm15142782wmj.28.2020.09.20.11.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 11:08:29 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v3 15/19] arm64: dts: allwinner: a64: Add HDMI audio to Pine64
Date: Sun, 20 Sep 2020 20:07:54 +0200
Message-Id: <20200920180758.592217-16-peron.clem@gmail.com>
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

Enable HDMI audio on Pine64.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
index 329cf276561e..b54b02e59085 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
@@ -99,6 +99,10 @@ hdmi_out_con: endpoint {
 	};
 };
 
+&hdmi_sound {
+	status = "okay";
+};
+
 &i2c1 {
 	status = "okay";
 };
@@ -107,6 +111,10 @@ &i2c1_pins {
 	bias-pull-up;
 };
 
+&i2s2 {
+	status = "okay";
+};
+
 &mdio {
 	ext_rmii_phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
-- 
2.25.1

