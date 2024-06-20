Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DDC9105E5
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2024 15:28:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC12315FA;
	Thu, 20 Jun 2024 15:28:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC12315FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718890124;
	bh=OpuwintoCNqMbOwPYmNqSpB1Q1QE/dZMPckWqmWaZ5w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BSZZE3l7VjFuNGg04zYNIY6oUxA6v/CxwcdZUQ4v3aNMLbjbTmHm0WPlxFioMRJZR
	 D4+DbMzap+PNP0ZVQAvweJyyGWUkJ0s+B4BgiixBdr7qVW96m5o7QYxfcUsx0E8AtW
	 cLxuqPvo3maxvdeZlXyEQQisS00r+b3sE2tiRf+0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81487F8068F; Thu, 20 Jun 2024 15:27:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2736F805B5;
	Thu, 20 Jun 2024 15:27:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 783A4F8061E; Thu, 20 Jun 2024 15:27:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9EDBAF80154
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 15:26:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EDBAF80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=ojeiqJwi
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A97F09C58D7;
	Thu, 20 Jun 2024 09:26:49 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id mVnkXbwPQLFa; Thu, 20 Jun 2024 09:26:47 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id B055C9C5BD4;
	Thu, 20 Jun 2024 09:26:47 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com B055C9C5BD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1718890007; bh=wMBIxtHD5DWQCm5yMo9elsvS37fBplDSFRj07FHeIK8=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=ojeiqJwirSAl17lfBgivSN/hj50KVsOOGVe49J4XP9YmypRqdmvo2N9+dUvncQeRX
	 BMpXs7V1Kd+dlZGNCegDCatT4HYlZiW143HNiPwHmeqkpmorCrt62k5edbx6bJUF6c
	 4bz/R7YzBco7+EF5m24sSLdU6NOddvZsvK3rrm8lqEAZmeVxyzoGY5nVHTZrzH2sJI
	 Sd6SYKabmKo4PeALeMOvnnskAirKGv4z/ZaK3ktuLABXI1yKhsv9G/u/KfP+TJQ1pM
	 Lvv6yrXNFqJp1REX8yrwcBgG2orR2g+3aq5fqyrq835PP6F13zRHWWZ0/zfrHssWh3
	 MVX8oQXo2Ri6A==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 6WItdj3i4wLd; Thu, 20 Jun 2024 09:26:47 -0400 (EDT)
Received: from gerard.rennes.sfl
 (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id AFBD99C5BD3;
	Thu, 20 Jun 2024 09:26:44 -0400 (EDT)
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
Subject: [PATCHv5 9/9] ARM: dts: imx6: update spdif sound card node properties
Date: Thu, 20 Jun 2024 15:25:11 +0200
Message-Id: <20240620132511.4291-10-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620132511.4291-1-elinor.montmasson@savoirfairelinux.com>
References: <20240620132511.4291-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: PEPCBASQBI7JMGQGCOKPZFIFK2GH4QBL
X-Message-ID-Hash: PEPCBASQBI7JMGQGCOKPZFIFK2GH4QBL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PEPCBASQBI7JMGQGCOKPZFIFK2GH4QBL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Following merge of imx-spdif driver into fsl-asoc-card:
* update properties to match those used by fsl-asoc-card.
* S/PDIF in/out dummy codecs must now be declared explicitly, add and
  use them.

These modifications were tested only on an imx8mn-evk board.

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

