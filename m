Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F997816E40
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 13:45:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E4C5E86;
	Mon, 18 Dec 2023 13:45:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E4C5E86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702903554;
	bh=LZmYwa5LHN+DsiJFj22hCc9pBAlyk8nJoEcQXHi/X5A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cWKwPQWjP/EEjjJnJH3DkG0dI+/T74hC/HRcLda2UCmi8UPBih/kVNhSFEaQJ1LJx
	 vbQh6+s2DlqDUIpOCuS7AWfFtjCKl34io8r2tbuJ5TJF18kDzOKv3+QT8dJyFI3wIq
	 A3zZ8im5zPLy3xWcAGJ8Tv9FYs3Dqy3nsZi6owdc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E52F2F805DF; Mon, 18 Dec 2023 13:43:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D674F80587;
	Mon, 18 Dec 2023 13:43:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8DE8F805C2; Mon, 18 Dec 2023 13:43:47 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C7339F8067F
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 13:43:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7339F8067F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=T9Tmnvru
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id DA0369C4175;
	Mon, 18 Dec 2023 07:43:21 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id ethDY8EeKLA6; Mon, 18 Dec 2023 07:43:21 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 631589C4178;
	Mon, 18 Dec 2023 07:43:21 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 631589C4178
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1702903401; bh=wnU4drmFs7+PVEutyZt+DCTB9q3agXsjLpBTQyLApvY=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=T9TmnvruNIl4t4Op3/Y2/W9aUZPE+HcsO+j1x8JOB52g3jC/RemmU9bw+HpMV95d8
	 bnclPCk9MAx8fYVxkC6OwDdCfjEs7OskD84H+bOrIeZEFnpqs9e+ncFDGIpB+Dfdc+
	 XmbzUyyGnPwFT4geXDErwJ2DCIYIndCoB8KCh6KO7DveHhnE7xp6T1s4TFEDNJFCE7
	 HHAcruJ2LSSyIlrCbtVubRWzkl7qWWslGObn8yLArclOWotY1Fjp2GEfVQsL/AWdFF
	 JVg3m4gSyirpeVZbOT2tVvjQoKpC5yIOtEc7NJDKqTEvpZ83PNfkwr5u7X8Nfw9B2E
	 Ba2eG9owpO9lQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id gKx4X9ZVQ8Q4; Mon, 18 Dec 2023 07:43:21 -0500 (EST)
Received: from gerard.rennes.sfl (unknown [192.168.216.3])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 5FF919C4175;
	Mon, 18 Dec 2023 07:43:19 -0500 (EST)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Philip-Dylan <philip-dylan.gleonec@savoirfairelinux.com>
Subject: [PATCHv3 RESEND 10/10] ASoC: dt-bindings: fsl-asoc-card: add
 compatible for generic codec
Date: Mon, 18 Dec 2023 13:40:58 +0100
Message-Id: <20231218124058.2047167-11-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231218124058.2047167-1-elinor.montmasson@savoirfairelinux.com>
References: <20231218124058.2047167-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: BSCVWEZMPYOE5HH6AJKZMYWKK4G2FX7T
X-Message-ID-Hash: BSCVWEZMPYOE5HH6AJKZMYWKK4G2FX7T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BSCVWEZMPYOE5HH6AJKZMYWKK4G2FX7T/>
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

