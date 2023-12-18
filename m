Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9E2816E1A
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 13:43:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D544BDF3;
	Mon, 18 Dec 2023 13:42:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D544BDF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702903383;
	bh=A4YXoBo3ZnQj28qLW3aBQIRZWLN8dnLpsmz1qKDFEu8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gtr+j4AF6oJf8uaAeIqMONpJ3NFNhtpUa0hG8pIra809LB9LxFLOhtgHaD8IQYTeM
	 oukr0LIOKKqtwqCUEr3IV9mbhmlpVf4lC34ym0omudLE/mx9Jr4Ix6kF8URBMBYwGc
	 BoqbEi7RzN8M8F0GdVX2V1E5HBP+8z44cJUSBxv4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5732F8057F; Mon, 18 Dec 2023 13:42:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E55FF8057B;
	Mon, 18 Dec 2023 13:42:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A260F80431; Mon, 18 Dec 2023 13:42:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90ED9F800D2
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 13:42:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90ED9F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=KC9IcCdB
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id CB7159C04BD;
	Mon, 18 Dec 2023 07:42:09 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id a22CMRJ0P6OD; Mon, 18 Dec 2023 07:42:09 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 22D809C068C;
	Mon, 18 Dec 2023 07:42:09 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 22D809C068C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1702903329; bh=nNJwBxDmzL960mEI1mqFgHu2Oy9OWJ5ye2uPUgqVOL8=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=KC9IcCdB/ndeBn1iClkNzQdFvCYwcAae8mB8HjDOuwe7VNhtuAysf0Iv6nV2CFid3
	 DkpOU2cx0klXMN+DKDOxk8e5e0ixq2mAUckeyG+WHeX0HMe6UFvdS6vptU3NuVN3w1
	 Buxz9EwOLYdfBjg/iEgA4UtCe5oey/qmQdjEU6C4zKRpXHs1q9zZGJA+F+NBEnF0dw
	 r0vOh6SZZXliSB5dt9R7WXiMEIAFVE3xhro3SfHWX/ctYXpktccGcICcIpgsfVPuOm
	 a1vT4MAYhBo7gsLEKK0Dw9QAqWr8piej7xrY6Is2n8gO1A6mDQeUYFKWFp3b8/X/9g
	 yiTaqU9TxyFFA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id OZ6vMlRS6mOD; Mon, 18 Dec 2023 07:42:08 -0500 (EST)
Received: from gerard.rennes.sfl (unknown [192.168.216.3])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id F0A0F9C04BD;
	Mon, 18 Dec 2023 07:42:06 -0500 (EST)
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
Subject: [PATCHv3 RESEND 00/10] ASoC: fsl-asoc-card: compatibility integration
 of a generic codec use case for use with S/PDIF controller
Date: Mon, 18 Dec 2023 13:40:48 +0100
Message-Id: <20231218124058.2047167-1-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: OS43CBJ73AVINV2RXRE6IGPKUJAXU5AF
X-Message-ID-Hash: OS43CBJ73AVINV2RXRE6IGPKUJAXU5AF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OS43CBJ73AVINV2RXRE6IGPKUJAXU5AF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello,

This is the v3 of the series of patch aiming to make the machine driver
"fsl-asoc-card" compatible with use cases where there is no real codec
driver.
It proposes to use the "spdif_receiver" and "spdif_transmitter"
drivers instead of the dummy codec.
This is a first step in using the S/PDIF controller with the ASRC.

The five first patches add compatibility with the pair of codecs
"spdif_receiver" and "spdif_transmitter" with a new compatible,
"fsl,imx-audio-generic".
Codec parameters are set with default values.
Consequently, the driver is modified to work with multi-codec use cases.
It can get 2 codecs phandles from the device tree, and the
"fsl_asoc_card_priv" struct now has 2 "codec_priv" to store properties
of both codecs. It is fixed to 2 codecs as only "fsl,imx-audio-generic"
uses multiple codecs at the moment.
However, the driver now uses for_each_codecs macros when possible to
ease future implementations of multi-codec configurations.

The remaining patches add configuration options for the device tree.
They configure the CPU DAI when using "fsl,imx-audio-generic".
These options are usually hard-coded in "fsl-asoc-card.c" for each
audio codec.
Because the generic codec could be used with other CPU DAIs than
the S/PDIF controller, setting these parameters could be required.

This series of patch was successfully built for arm64 and x86 on top of
the latest for-next branch of the ASoC git tree on the 14th of December.
These modifications have also been tested on an i.MX8MN evaluation
board, with a linux kernel RT v6.1.26-rt8.


We also have a few questions, following remarks made by
Krzysztof Kozlowski in a previous email for patch 10/10:

> >>> The compatible list for this generic sound card currently:
> >>> @@ -48,6 +51,8 @@ The compatible list for this generic sound card
> >>> currently:
> >>>
> >>> "fsl,imx-audio-nau8822"
> >>>
> >>> + "fsl,imx-audio-generic"
> >>
> >> Generic does not look like hardware specific.
> >
> > Even if our end goal is to use it with the S/PDIF controller, this ne=
w
> > support can be used with different hardware that doesn't
> > require a codec. Thus, we don't really want to specify "spdif" in it.
> >
> > Is this compatible string not suitable ?
> > Should we rename it to something else, like "fsl,imx-audio-no-codec" =
?
>=20
> Maybe Mark or Rob will help here, but for me "imx-audio" is just way to=
o
> generic.

* Which generic name should we use ? Or how should we change it?
=20
> Also, you add several new properties, so I really expect either
> converting old binding to DT schema first or adding new device in DT
> schema format.

* fsl-asoc-card.txt currently follows the old dt-bindings format.
Should we update it to DT schema format in this patch series
before adding my new properties?


Best regards,
Elinor Montmasson


Changelog:
v2 -> v3:
* when the bitmaster or framemaster are retrieved from the device tree,
  the driver will now compare them with the two codecs possibly given in
  the device tree, and not just the first codec.
* improve driver modifications to use multiple codecs for better
  integration of future multi-codec use cases:
    * use for_each_codec macros when possible.
    * "fsl_asoc_card_priv" struct now has 2 "codec_priv" as the driver
      can currently retrieve 2 codec phandles from the device tree.
* fix subject of patch 10/10 to follow the style of the subsystem and
  previous commits of the file.
* v2 patch series at:
https://lore.kernel.org/alsa-devel/20231027144734.3654829-1-elinor.montma=
sson@savoirfairelinux.com/

v1 -> v2:
* replace use of the dummy codec by the pair of codecs
  "spdif_receiver" / " spdif_transmitter".
* adapt how dai links codecs are used to take into account the
  possibility for multiple codecs per link.
* change compatible name.
* adapt driver to be able to register two codecs given in the device
  tree.
* v1 patch series at:
https://lore.kernel.org/alsa-devel/20230901144550.520072-1-elinor.montmas=
son@savoirfairelinux.com/


Elinor Montmasson (10):
  ASoC: fsl-asoc-card: add support for dai links with multiple codecs
  ASoC: fsl-asoc-card: add second dai link component for codecs
  ASoC: fsl-asoc-card: add compatibility to use 2 codecs in dai-links
  ASoC: fsl-asoc-card: add new compatible for a generic codec use case
  ASoC: fsl-asoc-card: set generic codec as clock provider
  ASoC: fsl-asoc-card: add dts property "cpu-slot-width"
  ASoC: fsl-asoc-card: add dts property "cpu-slot-num"
  ASoC: fsl-asoc-card: add dts properties "cpu-sysclk-freq"
  ASoC: fsl-asoc-card: add dts properties "cpu-sysclk-dir-out"
  ASoC: bindings: fsl-asoc-card: add compatible for generic codec

 .../bindings/sound/fsl-asoc-card.txt          |  28 +-
 sound/soc/fsl/fsl-asoc-card.c                 | 299 +++++++++++-------
 2 files changed, 218 insertions(+), 109 deletions(-)

--=20
2.25.1

