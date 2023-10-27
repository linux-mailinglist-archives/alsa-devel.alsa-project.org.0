Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CF97E064D
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 17:22:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE55EE80;
	Fri,  3 Nov 2023 17:21:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE55EE80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699028528;
	bh=o8JQysd/JZOnDrTABNRgpwZo/7aUN04KPooA2CRnuLc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GpFWpwk3wyyWGCPXvuFLYTxVaEbqj/1rFPA81k2i0hFnKwul6huwJASERltdwtcfd
	 u4l2VKYiOoqU2O3VzHnPKl2uQb2Q6qli4XRUCenQIZzR5w5KeGhwBWlY43TkXY+JlZ
	 az9CTckxyFplzm6zTKK3kSDu4KZ/lKtp6/hixNnw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E162F80290; Fri,  3 Nov 2023 17:20:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BADDDF80494;
	Fri,  3 Nov 2023 17:20:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B761EF8019B; Fri, 27 Oct 2023 16:51:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0668EF8010B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 16:51:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0668EF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=nZP1ASwX
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 147729C3343;
	Fri, 27 Oct 2023 10:51:46 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id rUDogE_3mM6o; Fri, 27 Oct 2023 10:51:45 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 701E09C3376;
	Fri, 27 Oct 2023 10:51:45 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 701E09C3376
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1698418305; bh=gKwzk+vvqTgoX4YzWIt1F4jA+IvQZyd5fgEw+5A6Hrk=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=nZP1ASwX2dIaGJd4cGJHNCmoNSXIvi1aIbKyulFqsYUCegVWcEYdJh2NMgQsFfsR0
	 A4zHk+cWLUaj6e8FJGpAySYZCIFjivt5B5qVUb+OCJ0BAhBBhKpilxpHjnqaWg+ItO
	 3vPvLbtbiGO81hA+RJ+IYEQX/KejNQoB0yKP4wWoUkcUkxxbopvCK5ZIV3Is+1KT+Z
	 6efnlKt/d3I74mW5YFT/4ACDTjkf2FF4k2PGGK5IcCP+/eqNWIhhniYoSrEI46QRHb
	 O35we+jrAwSZF+MXTxTwlyJBEnfGk3KurVx5h8vIwCbmqA6d2crY11mNrDB76cnE0T
	 ZeWY8PqXPA3KQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 4AQ0ATc-K0yT; Fri, 27 Oct 2023 10:51:45 -0400 (EDT)
Received: from gerard.rennes.sfl
 (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 7D9049C3343;
	Fri, 27 Oct 2023 10:51:44 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	broonie@kernel.org
Cc: elinor.montmasson@savoirfairelinux.com,
	alsa-devel@alsa-project.org,
	philip-dylan.gleonec@savoirfairelinux.com
Subject: [PATCHv2 10/10] Documentation: fsl-asoc-card: add documentation for
 generic codec case
Date: Fri, 27 Oct 2023 16:47:35 +0200
Message-Id: <20231027144734.3654829-11-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231027144734.3654829-1-elinor.montmasson@savoirfairelinux.com>
References: <20231027144734.3654829-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MailFrom: elinor.montmasson@savoirfairelinux.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: N3WX2TBGIY3W4IVYGJU6CK6XJDVGDYA6
X-Message-ID-Hash: N3WX2TBGIY3W4IVYGJU6CK6XJDVGDYA6
X-Mailman-Approved-At: Fri, 03 Nov 2023 16:20:06 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N3WX2TBGIY3W4IVYGJU6CK6XJDVGDYA6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add documentation about new dts bindings following new support
for compatible "fsl,imx-audio-generic".

Some CPU DAI don't require a real audio codec. The new compatible
"fsl,imx-audio-generic" allows to use the driver with codec drivers
SPDIF DIT and SPDIF DIR as dummy codecs.
It also allows to use not pre-configured audio codecs which
don't require specific control through a codec driver.

The new dts properties give the possibility to set some parameters
about the CPU DAI usually set through the codec configuration.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Co-authored-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelin=
ux.com>
---
 .../bindings/sound/fsl-asoc-card.txt          | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt b/=
Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
index 4e8dbc5abfd1..274319bf7ff7 100644
--- a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
+++ b/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
@@ -17,6 +17,9 @@ Note: The card is initially designed for those sound ca=
rds who use AC'97, I2S
       and PCM DAI formats. However, it'll be also possible to support th=
ose non
       AC'97/I2S/PCM type sound cards, such as S/PDIF audio and HDMI audi=
o, as
       long as the driver has been properly upgraded.
+      To use CPU DAIs that do not require a codec such as an S/PDIF cont=
roller,
+      or to use a DAI to output or capture raw I2S/TDM data, you can
+      use the compatible "fsl,imx-audio-generic".
=20
=20
 The compatible list for this generic sound card currently:
@@ -48,6 +51,8 @@ The compatible list for this generic sound card current=
ly:
=20
  "fsl,imx-audio-nau8822"
=20
+ "fsl,imx-audio-generic"
+
 Required properties:
=20
   - compatible		: Contains one of entries in the compatible list.
@@ -56,7 +61,11 @@ Required properties:
=20
   - audio-cpu		: The phandle of an CPU DAI controller
=20
-  - audio-codec		: The phandle of an audio codec
+  - audio-codec		: The phandle of an audio codec.
+			  If using the "fsl,imx-audio-generic" compatible,
+			  give instead a pair of phandles with the
+			  spdif_transmitter first (driver SPDIF DIT) and the
+			  spdif_receiver second (driver SPDIF DIR).
=20
 Optional properties:
=20
@@ -88,6 +97,21 @@ Optional properties:
   - bitclock-inversion	: dai-link uses bit clock inversion, for details =
see simple-card.yaml.
   - mclk-id		: main clock id, specific for each card configuration.
=20
+Optional, relevant only with the "fsl,imx-audio-generic" compatible:
+
+  - cpu-slot-width	: Indicates a specific TDM slot width in bits.
+  - cpu-slot-num	: Indicates a specific number of TDM slots per frame.
+
+  - cpu-sysclk-freq-rx	: Frequency of the CPU DAI sys clock for Rx.
+  - cpu-sysclk-freq-tx	: Frequency of the CPU DAI sys clock for Tx.
+
+  - cpu-sysclk-dir-rx-out	: Boolean property. Specifies sys clock direct=
ion
+				  as 'out' on initialization for Rx.
+				  If not set, default direction is 'in'.
+  - cpu-sysclk-dir-tx-out	: Boolean property. Specifies sys clock direct=
ion
+				  as 'out' on initialization for Tx.
+				  If not set, default direction is 'in'.
+
 Optional unless SSI is selected as a CPU DAI:
=20
   - mux-int-port	: The internal port of the i.MX audio muxer (AUDMUX)
--=20
2.25.1
