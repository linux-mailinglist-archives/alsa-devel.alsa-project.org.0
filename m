Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0612291A199
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 10:36:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6453421B3;
	Thu, 27 Jun 2024 10:36:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6453421B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719477371;
	bh=bCCf4NTG7P5SxC8FpmUOBgnk3cZuNbux1yW3Lt1jzSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vA2Ysuhb2/wtWYFqY9VAf4lQD5aC4qfWAPGkb3gAKdDow7JKsQLEnYfSM+BgBCSID
	 MteWraAnEahA64A35p/dalD0tRKZreLCmJg6/BDPWWmfp8yewSfD7JWKKvhhiQaxR3
	 kctDtsO/WyCGSJtlLLQP9Ksu0iu557G6tq5zFNmU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7367F805D3; Thu, 27 Jun 2024 10:35:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D380F805DA;
	Thu, 27 Jun 2024 10:35:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E42E8F80578; Thu, 27 Jun 2024 10:32:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79275F804D6
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 10:32:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79275F804D6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=ghxNEgeK
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 5E1269C5C1B;
	Thu, 27 Jun 2024 04:32:04 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id pbKY6oskguxx; Thu, 27 Jun 2024 04:32:03 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id CCCEA9C5B9C;
	Thu, 27 Jun 2024 04:32:02 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com CCCEA9C5B9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1719477122; bh=PHKgA47jXFiy9zVX3MwoFMuPAn1nA7SfXLhJS9x4y4E=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=ghxNEgeKdA9S0mSxSSPfz1QupIv9RFwTy9MA8KL5419bHMzvArVdGbDJK4Q6vCzUU
	 D1hhf1XiulKC5uD30ywzc/SsqMP+cfbg55iX1QynPl0dyJC7S7YhhSj5iSCiekEWFe
	 IhFNoEHFaU7xJRAzA8JCxespJCZ6/waMn1VwefTnnynO9lXHE7NEpb/rSJvyGgG8UO
	 IxkjijfsonQGke9rSLqvaOO8qqDkUCHUkA8TKGGg9SzyV2y63G9DaKMnOGNHRmUsOJ
	 +xkzN4JZKhfG12j5mqO03ivS7y9/kZREEiTAC771e8Z/Vqrdybv/TBuW1mlj1cyC9b
	 /BIMCXaIrN8aQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id hvfVV7srqD5C; Thu, 27 Jun 2024 04:32:02 -0400 (EDT)
Received: from gerard.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net
 [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id C4EF39C5A22;
	Thu, 27 Jun 2024 04:31:59 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Philip-Dylan <philip-dylan.gleonec@savoirfairelinux.com>
Subject: [PATCH v6 6/7] arm64: dts: imx8m: update spdif sound card node
 properties
Date: Thu, 27 Jun 2024 10:31:03 +0200
Message-Id: <20240627083104.123357-7-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627083104.123357-1-elinor.montmasson@savoirfairelinux.com>
References: <20240627083104.123357-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 7NJEK6ANV5K2ILNSWJJLAKNGSQ34UEEV
X-Message-ID-Hash: 7NJEK6ANV5K2ILNSWJJLAKNGSQ34UEEV
X-MailFrom: elinor.montmasson@savoirfairelinux.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7NJEK6ANV5K2ILNSWJJLAKNGSQ34UEEV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The merge of imx-spdif driver into fsl-asoc-card brought
new DT properties that can be used with the "fsl,imx-audio-spdif"
compatible:
* The "spdif-controller" property from imx-spdif is named "audio-cpu"
  in fsl-asoc-card.
* fsl-asoc-card uses codecs explicitly declared in DT
  with "audio-codec".
  With an S/PDIF, codec drivers spdif_transmitter and
  spdif_receiver should be used.
  Driver imx-spdif used instead the dummy codec and a pair of
  boolean properties, "spdif-in" and "spdif-out".

While backward compatibility is kept to support properties
"spdif-controller", "spdif-in" and "spdif-out", using new properties has
several benefits:
* "audio-cpu" and "audio-codec" are more generic names reflecting
  that the fsl-asoc-card driver supports multiple hardware.
  They are properties already used by devices using the
  fsl-asoc-card driver.
  They are also similar to properties of simple-card: "cpu" and "codec".
* "spdif-in" and "spdif-out" imply the use of the dummy codec in the
  driver. However, there are already two codec drivers for the S/PDIF,
  spdif_transmitter and spdif_receiver.
  It is better to declare S/PDIF Tx and Rx devices in a DT, and then
  reference them with "audio-codec" than using the dummy codec.

For those reasons, this commit updates in-tree DTs to use the new
properties:
* Rename "spdif-controller" property to "audio-cpu".
* Declare S/PDIF transmitter and/or receiver devices, and use them with
  the "audio-codec" property instead of "spdif-out" and/or "spdif-in".

These modifications were tested only on an imx8mn-evk board.

Note that out-of-tree and old DTs are still supported.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 15 +++++++++---
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi | 15 +++++++++---
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts  | 24 +++++++++++++++----
 3 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boo=
t/dts/freescale/imx8mm-evk.dtsi
index 90d1901df2b1..348855a41852 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
@@ -180,12 +180,21 @@ cpu {
 		};
 	};
=20
+	spdif_out: spdif-out {
+		#sound-dai-cells =3D <0>;
+		compatible =3D "linux,spdif-dit";
+	};
+
+	spdif_in: spdif-in {
+		#sound-dai-cells =3D <0>;
+		compatible =3D "linux,spdif-dir";
+	};
+
 	sound-spdif {
 		compatible =3D "fsl,imx-audio-spdif";
 		model =3D "imx-spdif";
-		spdif-controller =3D <&spdif1>;
-		spdif-out;
-		spdif-in;
+		audio-cpu =3D <&spdif1>;
+		audio-codec =3D <&spdif_out>, <&spdif_in>;
 	};
 };
=20
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi b/arch/arm64/boo=
t/dts/freescale/imx8mn-evk.dtsi
index 9e0259ddf4bc..6a47e09703a7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
@@ -124,12 +124,21 @@ sound-wm8524 {
 			"Line Out Jack", "LINEVOUTR";
 	};
=20
+	spdif_out: spdif-out {
+		#sound-dai-cells =3D <0>;
+		compatible =3D "linux,spdif-dit";
+	};
+
+	spdif_in: spdif-in {
+		#sound-dai-cells =3D <0>;
+		compatible =3D "linux,spdif-dir";
+	};
+
 	sound-spdif {
 		compatible =3D "fsl,imx-audio-spdif";
 		model =3D "imx-spdif";
-		spdif-controller =3D <&spdif1>;
-		spdif-out;
-		spdif-in;
+		audio-cpu =3D <&spdif1>;
+		audio-codec =3D <&spdif_out>, <&spdif_in>;
 	};
=20
 	sound-micfil {
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot=
/dts/freescale/imx8mq-evk.dts
index 7507548cdb16..b953865f0b46 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
@@ -125,19 +125,33 @@ link_codec: simple-audio-card,codec {
 		};
 	};
=20
+	spdif_out: spdif-out {
+		#sound-dai-cells =3D <0>;
+		compatible =3D "linux,spdif-dit";
+	};
+
+	spdif_in: spdif-in {
+		#sound-dai-cells =3D <0>;
+		compatible =3D "linux,spdif-dir";
+	};
+
 	sound-spdif {
 		compatible =3D "fsl,imx-audio-spdif";
 		model =3D "imx-spdif";
-		spdif-controller =3D <&spdif1>;
-		spdif-out;
-		spdif-in;
+		audio-cpu =3D <&spdif1>;
+		audio-codec =3D <&spdif_out>, <&spdif_in>;
+	};
+
+	hdmi_arc_in: hdmi-arc-in {
+		#sound-dai-cells =3D <0>;
+		compatible =3D "linux,spdif-dir";
 	};
=20
 	sound-hdmi-arc {
 		compatible =3D "fsl,imx-audio-spdif";
 		model =3D "imx-hdmi-arc";
-		spdif-controller =3D <&spdif2>;
-		spdif-in;
+		audio-cpu =3D <&spdif2>;
+		audio-codec =3D <&hdmi_arc_in>;
 	};
 };
=20
--=20
2.34.1

