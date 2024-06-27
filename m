Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BBE91A19B
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 10:36:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04BFE21A3;
	Thu, 27 Jun 2024 10:36:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04BFE21A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719477393;
	bh=yznvF9D1CYld7pI4oKQ8pBtszytKW/Cp/rmZ4H2IQgw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hGvCM/mfB/qdyVs+fteGn7CSyTZLz8vetu6OjkONOy4DabwVOK/JFKMBfOx8EFsua
	 JYLGx+zN4TYgyCkYHC/ASqQerk4Btmwcaaar4efqjb9ioOfKNxR59E84qyJs+ml4DP
	 mTUpE28BJgNLlZB4FIajyWSQeKvgxNxYHd5stRG0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44D6EF805FF; Thu, 27 Jun 2024 10:35:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EB76F80600;
	Thu, 27 Jun 2024 10:35:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF1CFF804F2; Thu, 27 Jun 2024 10:32:15 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 78BB4F800E4
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 10:32:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78BB4F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=npd7vSd3
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 396639C5C62;
	Thu, 27 Jun 2024 04:32:08 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id Uw-mgDOsMtnL; Thu, 27 Jun 2024 04:32:05 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 94AF89C595F;
	Thu, 27 Jun 2024 04:32:05 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 94AF89C595F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1719477125; bh=in6IlZSz4u1A6Sdo+5vdYe+Hej/Bf0/2z5MF/7fUtI8=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=npd7vSd3aPZO0zjIEEt0c/y2QbwHjMu5Z6IwfyKV1oSmbjtDKLelKapCxns99VKsl
	 jRfoxhQV8Ehqldk+w/1yUznoInrSrSJrK4ZsNohtZNuPSUSEAOVmaT4vWdRAK8fIPQ
	 fLA4jgOME9yVNPOO5pYLtveAp97pxwdo9jmcb9eJwajj8lhMTgNyjzgYMfadHLEJtp
	 yUBuDCHHyfNcjU43FILvdjqEOf/UMkG+bQIU1YKn63qVyZ2/Pl4ywbPirDE60ClIW3
	 5/Ki5l4loPth7Ic1SHFsVapD5b13jgyUeVEvYYlvt2ifYexbyMlRpPjJ9kAlHyKr5e
	 oD1j6HNAymcig==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id n7lck1uqRWV0; Thu, 27 Jun 2024 04:32:05 -0400 (EDT)
Received: from gerard.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net
 [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id B1E369C5B16;
	Thu, 27 Jun 2024 04:32:02 -0400 (EDT)
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
Subject: [PATCH v6 7/7] ARM: dts: imx6: update spdif sound card node
 properties
Date: Thu, 27 Jun 2024 10:31:04 +0200
Message-Id: <20240627083104.123357-8-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627083104.123357-1-elinor.montmasson@savoirfairelinux.com>
References: <20240627083104.123357-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: NHDICRYV57NKZBVZ6LONBGXYXRJFMVAZ
X-Message-ID-Hash: NHDICRYV57NKZBVZ6LONBGXYXRJFMVAZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NHDICRYV57NKZBVZ6LONBGXYXRJFMVAZ/>
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
 arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts        | 15 ++++++++++++---
 arch/arm/boot/dts/nxp/imx/imx6q-prti6q.dts        | 15 ++++++++++++---
 arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts       |  9 +++++++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi     | 15 ++++++++++++---
 arch/arm/boot/dts/nxp/imx/imx6qdl-apf6dev.dtsi    |  9 +++++++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi    | 15 ++++++++++++---
 arch/arm/boot/dts/nxp/imx/imx6qdl-cubox-i.dtsi    |  9 +++++++--
 .../boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi    |  9 +++++++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi  |  9 +++++++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi  |  9 +++++++--
 arch/arm/boot/dts/nxp/imx/imx6sx-sabreauto.dts    |  9 +++++++--
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi         |  9 +++++++--
 12 files changed, 104 insertions(+), 28 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts b/arch/arm/boot/dts=
/nxp/imx/imx6q-cm-fx6.dts
index 95b49fc83f7b..5c664c0f2169 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts
@@ -127,12 +127,21 @@ simple-audio-card,codec {
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
-		spdif-controller =3D <&spdif>;
-		spdif-out;
-		spdif-in;
+		audio-cpu =3D <&spdif>;
+		audio-codec =3D <&spdif_out>, <&spdif_in>;
 	};
 };
=20
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-prti6q.dts b/arch/arm/boot/dts=
/nxp/imx/imx6q-prti6q.dts
index a7d5693c5ab7..8491d656ef17 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-prti6q.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-prti6q.dts
@@ -111,12 +111,21 @@ simple-audio-card,codec {
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
-		spdif-controller =3D <&spdif>;
-		spdif-in;
-		spdif-out;
+		audio-cpu =3D <&spdif>;
+		audio-codec =3D <&spdif_out>, <&spdif_in>;
 	};
 };
=20
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts b/arch/arm/boot/dt=
s/nxp/imx/imx6q-tbs2910.dts
index 7c298d9aa21e..ea9a98887c7b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts
@@ -90,11 +90,16 @@ sound-sgtl5000 {
 		ssi-controller =3D <&ssi1>;
 	};
=20
+	spdif_out: spdif-out {
+		#sound-dai-cells =3D <0>;
+		compatible =3D "linux,spdif-dit";
+	};
+
 	sound-spdif {
 		compatible =3D "fsl,imx-audio-spdif";
 		model =3D "On-board SPDIF";
-		spdif-controller =3D <&spdif>;
-		spdif-out;
+		audio-cpu =3D <&spdif>;
+		audio-codec =3D <&spdif_out>;
 	};
 };
=20
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi b/arch/arm/boot/=
dts/nxp/imx/imx6qdl-apalis.dtsi
index ea40623d12e5..6f4546c59d38 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
@@ -197,11 +197,20 @@ sound {
 		ssi-controller =3D <&ssi1>;
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
 	sound_spdif: sound-spdif {
 		compatible =3D "fsl,imx-audio-spdif";
-		spdif-controller =3D <&spdif>;
-		spdif-in;
-		spdif-out;
+		audio-cpu =3D <&spdif>;
+		audio-codec =3D <&spdif_out>, <&spdif_in>;
 		model =3D "imx-spdif";
 		status =3D "disabled";
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apf6dev.dtsi b/arch/arm/boot=
/dts/nxp/imx/imx6qdl-apf6dev.dtsi
index 3a46ade3b6bd..6aa6b152c3ae 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apf6dev.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apf6dev.dtsi
@@ -121,11 +121,16 @@ sound {
 		mux-ext-port =3D <3>;
 	};
=20
+	spdif_out: spdif-out {
+		#sound-dai-cells =3D <0>;
+		compatible =3D "linux,spdif-dit";
+	};
+
 	sound-spdif {
 		compatible =3D "fsl,imx-audio-spdif";
 		model =3D "imx-spdif";
-		spdif-controller =3D <&spdif>;
-		spdif-out;
+		audio-cpu =3D <&spdif>;
+		audio-codec =3D <&spdif_out>;
 	};
 };
=20
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi b/arch/arm/boot=
/dts/nxp/imx/imx6qdl-colibri.dtsi
index d3a7a6eeb8e0..07f15726f203 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
@@ -142,12 +142,21 @@ sound {
 		ssi-controller =3D <&ssi1>;
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
 	/* Optional S/PDIF in on SODIMM 88 and out on SODIMM 90, 137 or 168 */
 	sound_spdif: sound-spdif {
 		compatible =3D "fsl,imx-audio-spdif";
-		spdif-controller =3D <&spdif>;
-		spdif-in;
-		spdif-out;
+		audio-cpu =3D <&spdif>;
+		audio-codec =3D <&spdif_out>, <&spdif_in>;
 		model =3D "imx-spdif";
 		status =3D "disabled";
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-cubox-i.dtsi b/arch/arm/boot=
/dts/nxp/imx/imx6qdl-cubox-i.dtsi
index 761566ae3cf5..28afa8a0188b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-cubox-i.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-cubox-i.dtsi
@@ -100,12 +100,17 @@ v_usb1: regulator-v-usb1 {
 		vin-supply =3D <&v_5v0>;
 	};
=20
+	spdif_out: spdif-out {
+		#sound-dai-cells =3D <0>;
+		compatible =3D "linux,spdif-dit";
+	};
+
 	sound-spdif {
 		compatible =3D "fsl,imx-audio-spdif";
 		model =3D "Integrated SPDIF";
 		/* IMX6 doesn't implement this yet */
-		spdif-controller =3D <&spdif>;
-		spdif-out;
+		audio-cpu =3D <&spdif>;
+		audio-codec =3D <&spdif_out>;
 	};
=20
 	gpio-keys {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi b/arch/arm=
/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi
index a955c77cd499..67f2a007a592 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi
@@ -140,12 +140,17 @@ sound_codec: simple-audio-card,codec {
 		};
 	};
=20
+	spdif_out: spdif-out {
+		#sound-dai-cells =3D <0>;
+		compatible =3D "linux,spdif-dit";
+	};
+
 	sound-spdif {
 		compatible =3D "fsl,imx-audio-spdif";
 		model =3D "On-board SPDIF";
 		/* IMX6 doesn't implement this yet */
-		spdif-controller =3D <&spdif>;
-		spdif-out;
+		audio-cpu =3D <&spdif>;
+		audio-codec =3D <&spdif_out>;
 	};
 };
=20
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi b/arch/arm/bo=
ot/dts/nxp/imx/imx6qdl-sabreauto.dtsi
index 6656e2e762a1..48dfd8151150 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi
@@ -143,12 +143,17 @@ sound-cs42888 {
 			"AIN2R", "Line In Jack";
 	};
=20
+	spdif_in: spdif-in {
+		#sound-dai-cells =3D <0>;
+		compatible =3D "linux,spdif-dir";
+	};
+
 	sound-spdif {
 		compatible =3D "fsl,imx-sabreauto-spdif",
 			     "fsl,imx-audio-spdif";
 		model =3D "imx-spdif";
-		spdif-controller =3D <&spdif>;
-		spdif-in;
+		audio-cpu =3D <&spdif>;
+		audio-codec =3D <&spdif_in>;
 	};
=20
 	backlight {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi b/arch/arm/bo=
ot/dts/nxp/imx/imx6qdl-wandboard.dtsi
index 38abb6b50f6c..5a4b9ced297a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi
@@ -26,11 +26,16 @@ sound {
 		mux-ext-port =3D <3>;
 	};
=20
+	spdif_out: spdif-out {
+		#sound-dai-cells =3D <0>;
+		compatible =3D "linux,spdif-dit";
+	};
+
 	sound-spdif {
 		compatible =3D "fsl,imx-audio-spdif";
 		model =3D "imx-spdif";
-		spdif-controller =3D <&spdif>;
-		spdif-out;
+		audio-cpu =3D <&spdif>;
+		audio-codec =3D <&spdif_out>;
 	};
=20
 	reg_1p5v: regulator-1p5v {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-sabreauto.dts b/arch/arm/boot=
/dts/nxp/imx/imx6sx-sabreauto.dts
index b0c27b9b0244..d2cc8b4e8b00 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-sabreauto.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-sabreauto.dts
@@ -97,11 +97,16 @@ sound-cs42888 {
 			"AIN2R", "Line In Jack";
 	};
=20
+	spdif_in: spdif-in {
+		#sound-dai-cells =3D <0>;
+		compatible =3D "linux,spdif-dir";
+	};
+
 	sound-spdif {
 		compatible =3D "fsl,imx-audio-spdif";
 		model =3D "imx-spdif";
-		spdif-controller =3D <&spdif>;
-		spdif-in;
+		audio-cpu =3D <&spdif>;
+		audio-codec =3D <&spdif_in>;
 	};
 };
=20
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi b/arch/arm/boot/dts/=
nxp/imx/imx6sx-sdb.dtsi
index 7d4170c27732..a8c1fc02eddb 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
@@ -183,12 +183,17 @@ panel_in: endpoint {
 		};
 	};
=20
+	spdif_out: spdif-out {
+		#sound-dai-cells =3D <0>;
+		compatible =3D "linux,spdif-dit";
+	};
+
 	sound-spdif {
 		compatible =3D "fsl,imx6sx-sdb-spdif",
 			     "fsl,imx-audio-spdif";
 		model =3D "imx-spdif";
-		spdif-controller =3D <&spdif>;
-		spdif-out;
+		audio-cpu =3D <&spdif>;
+		audio-codec =3D <&spdif_out>;
 	};
=20
 };
--=20
2.34.1

