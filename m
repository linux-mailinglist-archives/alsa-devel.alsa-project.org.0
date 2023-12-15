Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB471814AE6
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Dec 2023 15:45:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88B18E0F;
	Fri, 15 Dec 2023 15:44:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88B18E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702651503;
	bh=LZmYwa5LHN+DsiJFj22hCc9pBAlyk8nJoEcQXHi/X5A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vrbR3/j9uZyZ1l2hMUGgAxCCLGXevrysNncWlzGVnCbs2P3sRGHwOSKRaP8oQQZ1Y
	 T7Vc92y8iTVmI5AsIGEIhXlBD3mfITBgUWQ8/C9/SFtWnOyFoMjtKlj6NOec5h89cj
	 p2iRbV8kc04AItfPw5TS/rvf+XPqOLutmceybX/8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65F14F805C3; Fri, 15 Dec 2023 15:42:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11195F806E8;
	Fri, 15 Dec 2023 15:42:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 877E1F805B5; Fri, 15 Dec 2023 15:42:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E369F80568
	for <alsa-devel@alsa-project.org>; Fri, 15 Dec 2023 15:42:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E369F80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=p4LoiDxy
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id B37D99C330F;
	Fri, 15 Dec 2023 09:42:27 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 1jlQhslCdQGa; Fri, 15 Dec 2023 09:42:27 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 495B69C2A93;
	Fri, 15 Dec 2023 09:42:27 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 495B69C2A93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1702651347; bh=wnU4drmFs7+PVEutyZt+DCTB9q3agXsjLpBTQyLApvY=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=p4LoiDxyIIacNk5QPStgVni9+19KozcIkM88/sOlC7VxXMDFUn0K1ELaxNxZdDKs5
	 bH7ygMNVEkPBnHfAl2nYyySw2YI/MS8bWjwp7BRf3TaHJyhXhReRgrVvfCdpWF3/g+
	 Y+E2tqEFO7/kuwf3rBD/r+5KCk5n8AJ65qzRrIHBg7K/iJ69f2MDVv6cTdJlPQB77Q
	 iOyENT7kEiTUtVvJDc0bqZ+lY6lI1iyEpjD//SmCK1dp7lIVuF5z3OAYT+pdzzHKqk
	 asbfc3WqDkYIcnAMnXe5C5LV0baUboEzAyolPf9XkAO8hhVy3SdExthxYrjlVJ3i48
	 qP+C09FnjZZkA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 1SajDL0HTNBN; Fri, 15 Dec 2023 09:42:27 -0500 (EST)
Received: from gerard.rennes.sfl (unknown [192.168.216.3])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 5BC399C330F;
	Fri, 15 Dec 2023 09:42:26 -0500 (EST)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	broonie@kernel.org
Cc: elinor.montmasson@savoirfairelinux.com,
	alsa-devel@alsa-project.org,
	philip-dylan.gleonec@savoirfairelinux.com
Subject: [PATCHv3 10/10] ASoC: bindings: fsl-asoc-card: add compatible for
 generic codec
Date: Fri, 15 Dec 2023 15:40:05 +0100
Message-Id: <20231215144005.934728-11-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231215144005.934728-1-elinor.montmasson@savoirfairelinux.com>
References: <20231215144005.934728-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: M5P5I5I7LC5F6IZZHZDYDD5Y3SADHUGI
X-Message-ID-Hash: M5P5I5I7LC5F6IZZHZDYDD5Y3SADHUGI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M5P5I5I7LC5F6IZZHZDYDD5Y3SADHUGI/>
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
"fsl,imx-audio-generic" allows using the driver with codec drivers
SPDIF DIT and SPDIF DIR as dummy codecs.
It also allows using not pre-configured audio codecs which
don't require specific control through a codec driver.

The new dts properties give the possibility to set some parameters
about the CPU DAI usually set through the codec configuration.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Co-authored-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelin=
ux.com>
---
 .../bindings/sound/fsl-asoc-card.txt          | 28 ++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt b/=
Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
index 4e8dbc5abfd1..f137ef2154e3 100644
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
@@ -87,6 +96,23 @@ Optional properties:
   - frame-inversion	: dai-link uses frame clock inversion, for details s=
ee simple-card.yaml.
   - bitclock-inversion	: dai-link uses bit clock inversion, for details =
see simple-card.yaml.
   - mclk-id		: main clock id, specific for each card configuration.
+			  For multi-codec configurations, an array of ids can be
+			  given, one for each codec.
+
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
=20
 Optional unless SSI is selected as a CPU DAI:
=20
--=20
2.25.1

