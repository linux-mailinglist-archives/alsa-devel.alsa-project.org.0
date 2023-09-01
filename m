Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB79E79178E
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 14:50:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F8D97F1;
	Mon,  4 Sep 2023 14:49:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F8D97F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693831802;
	bh=cGdtjB5519yeTVlVXWlEyo79rsXcri52zW4tD4gvfZ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nBpf7POAdOkPQRHUaNqjrzPyNnbtze22/hfBLnOHk0VuwM2ia0rvRuroeWKXkJ4mL
	 Duh66IAygICwW1gprIBvIP1PdQHWVV5rOytSM1ZUa/V8kcBbBol6ysEQZ+0VNVZ0nc
	 nW4hX6dF70jDOjq3MTMP6ob4pswA/s+0z6KQSOFM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6055BF80431; Mon,  4 Sep 2023 14:48:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B7D0F80236;
	Mon,  4 Sep 2023 14:48:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4E10F80245; Fri,  1 Sep 2023 16:47:04 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0BC8AF80074
	for <alsa-devel@alsa-project.org>; Fri,  1 Sep 2023 16:47:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BC8AF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=IbLKalNp
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 1750A9C2A63;
	Fri,  1 Sep 2023 10:46:59 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id TNIYF28YmTYr; Fri,  1 Sep 2023 10:46:58 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 1346F9C2A69;
	Fri,  1 Sep 2023 10:46:58 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 1346F9C2A69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1693579618; bh=+R+Al6d3HNTV3XoXsMBeRdaFhxAr1k+2+WXp5UmdN9I=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=IbLKalNpNhOpvLTeXDh0LfHlVcNrawSnPyODlg/xLcdLOJzPZRx4t0MzntpZ7vfo5
	 bLiKc3DG9LJpBc0cpYAeJ3Nik/oeOPZfhGc+U5UHO+znhXW2XUIn1ZT6sp8Cy64ueB
	 D5RpU6GFg+BsCb5kSdGyWmzW5dyAneS8RpDx2wCx8V3knBSLNfH+5a+FlKNVVSJUHE
	 8amDvv3Mi8R3li/xIG/Cg5CymvpJqR3wNip/jWHYxOBVnCTB4ovi3h0/MVzH58gBuo
	 HGHZe3yyZP35FMjjW060Ox7bOnLimijNr2oWfA4V/rVMbU1if/sUaf1M15G6xJZkvg
	 bqo8JsGuP0DUg==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id JnAPuSj471aI; Fri,  1 Sep 2023 10:46:58 -0400 (EDT)
Received: from gerard.rennes.sfl
 (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 3B7599C2A6B;
	Fri,  1 Sep 2023 10:46:57 -0400 (EDT)
From: elinor.montmasson@savoirfairelinux.com
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com
Cc: alsa-devel@alsa-project.org,
	philip-dylan.gleonec@savoirfairelinux.com,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Subject: [PATCH 10/10] Documentation: fsl-asoc-card: add documentation for
 dummy-codec support
Date: Fri,  1 Sep 2023 16:45:50 +0200
Message-Id: <20230901144550.520072-11-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230901144550.520072-1-elinor.montmasson@savoirfairelinux.com>
References: <20230901144550.520072-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MailFrom: elinor.montmasson@savoirfairelinux.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4N4PNRLTCNJJD7744FLGSKLOGNFXIHCU
X-Message-ID-Hash: 4N4PNRLTCNJJD7744FLGSKLOGNFXIHCU
X-Mailman-Approved-At: Mon, 04 Sep 2023 12:48:48 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4N4PNRLTCNJJD7744FLGSKLOGNFXIHCU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>

Add documentation about new dts bindings following new support
for compatible "fsl,imx-audio-dummy-codec".

Some CPU DAI don't require a real audio codec. The new compatible
"fsl,imx-audio-dummy-codec" makes the driver use the dummy codec driver
provided by the ASoC utils.
It also allows to use not pre-configured audio codecs which
don't require specific control through a codec driver.

The new dts properties give the possibility to set some parameters
about the CPU DAI usually set through the codec configuration.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Co-authored-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelin=
ux.com>
---
 .../bindings/sound/fsl-asoc-card.txt          | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt b/=
Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
index 4e8dbc5abfd1..2e081a62d29d 100644
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
+      use the compatible "fsl,imx-audio-dummy-codec".
=20
=20
 The compatible list for this generic sound card currently:
@@ -48,6 +51,8 @@ The compatible list for this generic sound card current=
ly:
=20
  "fsl,imx-audio-nau8822"
=20
+ "fsl,imx-audio-dummy-codec"
+
 Required properties:
=20
   - compatible		: Contains one of entries in the compatible list.
@@ -56,6 +61,8 @@ Required properties:
=20
   - audio-cpu		: The phandle of an CPU DAI controller
=20
+Required, unless "fsl,imx-audio-dummy-codec" compatible is used:
+
   - audio-codec		: The phandle of an audio codec
=20
 Optional properties:
@@ -88,6 +95,19 @@ Optional properties:
   - bitclock-inversion	: dai-link uses bit clock inversion, for details =
see simple-card.yaml.
   - mclk-id		: main clock id, specific for each card configuration.
=20
+Optional, relevant only with the "fsl,imx-audio-dummy-codec" compatible:
+
+  - cpu-slot-width	: Indicates a specific TDM slot width in bits.
+  - cpu-slot-num	: Indicates a specific number of TDM slots per frame.
+
+  - cpu-sysclk-freq-rx	: Frequency of the CPU DAI sys clock for Rx.
+  - cpu-sysclk-freq-tx	: Frequency of the CPU DAI sys clock for Tx.
+
+  - cpu-sysclk-dir-rx-out	: Boolean property. Specifies sys clock direct=
ion
+  			  as 'out' on initialization for Rx. If not set, default direction =
is 'in'.
+  - cpu-sysclk-dir-tx-out	: Boolean property. Specifies sys clock direct=
ion
+  			  as 'out' on initialization for Tx. If not set, default direction =
is 'in'.
+
 Optional unless SSI is selected as a CPU DAI:
=20
   - mux-int-port	: The internal port of the i.MX audio muxer (AUDMUX)
--=20
2.25.1

