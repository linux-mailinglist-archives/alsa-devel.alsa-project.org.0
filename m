Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FDF272155
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 12:38:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12E971709;
	Mon, 21 Sep 2020 12:37:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12E971709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600684721;
	bh=+RfYBz/Rj8O5KxCb8uCFafkT4TJfTlahyp2IDTlfBgc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V8wvElk8r8ldZbocU9SUrW4EVWiy2WizXjDLXxGQun5vtcpMgmOe30AE+uaK+swjO
	 g7bj4cVSI43s6UMLPsH3hcI8pFrOQR3SM7pWLHccQuwWZpg7cS/mLeZChlmgrshl7z
	 mJptLK196Itz/LZLtL79jVwEM3qQFkW3YRUDpBXs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD9B5F80363;
	Mon, 21 Sep 2020 12:28:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14C6AF80317; Mon, 21 Sep 2020 12:28:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3406BF802E9
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 12:27:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3406BF802E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XZLznLo2"
Received: by mail-wr1-x444.google.com with SMTP id w5so12140646wrp.8
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 03:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dZhYwaoUjzd/wEdIR2SZMGyqDMCzyDmEzzuRB3l0wN4=;
 b=XZLznLo2jfFPdSaxiKZTg7MtS6c3Vq8nSL0BrXqnKhEmEMj4nAXUDkYUKfDZmXkbIG
 Ol7gVNHrY9BHzdGcAN0ZpVljHSGsxU/wYkJOnShoPQNaYW9TZ88kjtkMPtOFBYdqMMPi
 9oWrNASrcn3o9Wjqayz4RqD45Ktso9UkJ3DauPOsjLXD9pBhX9SOvkAJq7MMxkmarkeI
 Baid58BWRKF02WoGgVfD9ozZTDDNpqScPaC9rIhEe3z/VXDAa/iWTqY7bWxhaybT3SLx
 PQLaNaEVBVDG79n0sivqEmY6FDZkajwG2Xs4+sEsWzcShq1INT9d7NNtNNhhqMXnemIi
 7Xvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dZhYwaoUjzd/wEdIR2SZMGyqDMCzyDmEzzuRB3l0wN4=;
 b=HM8QHfYJFsGs5fw7ckSNFsbvdgAm6Mu4rfuyjGYiyOuWriDlgn7Q9huFknNqjAmeQe
 aSMtkFwMITvLuvIuFfJpiqXT/gRMUUhNIv7nnoL/TdmGWDpVMHBS8FYf3xNRRb5JQzl8
 hqoAB11bPImUHILwpj1Ne5kdlHZRCOmfOtYQcARvaGATZu9ZXkeY+SKGnWiWkgBHM3Oj
 bwjV7crJHBQKMG8yjElk2/DEryv913t4sO5sWQ0uQcNpt2mrAWcDs9NMdT4/G60Kb9i5
 caVtBXLE4MnaLjIsbyviftf5G1mtRpMCWYKV606XBz2YUP26e+Al/1FPaVzFafKuJObA
 Gl0w==
X-Gm-Message-State: AOAM530BGyU5XH0R9MmnwtXqRvUca1lGvdKIimku5XGIYdVUmvMuIq3b
 3+uFoDx0fY58cosRZjVTUZQ=
X-Google-Smtp-Source: ABdhPJziKBu3aDQ3wWp2KsJ3eALaG5McqT6UYk+W9KKgrwPnZdByOHcVDimcFNCrrUtfKy+Sxchang==
X-Received: by 2002:a5d:4d82:: with SMTP id b2mr49418820wru.232.1600684076477; 
 Mon, 21 Sep 2020 03:27:56 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id h2sm20713774wrp.69.2020.09.21.03.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 03:27:55 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v4 17/22] arm64: dts: allwinner: a64: Add HDMI audio to Pine64
Date: Mon, 21 Sep 2020 12:27:26 +0200
Message-Id: <20200921102731.747736-18-peron.clem@gmail.com>
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

