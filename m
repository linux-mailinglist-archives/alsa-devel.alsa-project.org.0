Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AAC814AC1
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Dec 2023 15:42:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 120FDE7A;
	Fri, 15 Dec 2023 15:42:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 120FDE7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702651339;
	bh=KIqUJtcQAeVNj7LufLzBhALLpX6lmp5ouAOaUySaj98=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=b2uw64bp6B7Cvhbb/bitAGgimQTbJtnakf+YV01VZdSgG6TCCRV6nWQzhWiZAUEZ9
	 D5R0v0ZOYR4N/sJIugY0Fd/geq7giYHcdXZrWPFynH+pceiokC1j3XuEPbLwkHeb+m
	 PfzQTK73+vc/CaUk7XUzQgd+X6XwET5b/zHS03oQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38A2EF8057E; Fri, 15 Dec 2023 15:41:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08F74F80571;
	Fri, 15 Dec 2023 15:41:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A60F3F8016A; Fri, 15 Dec 2023 15:41:31 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 84494F80114
	for <alsa-devel@alsa-project.org>; Fri, 15 Dec 2023 15:41:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84494F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=EGOU63j7
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 321009C284E;
	Fri, 15 Dec 2023 09:41:19 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id zcChLUFl3JJK; Fri, 15 Dec 2023 09:41:18 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A6CF39C2C7D;
	Fri, 15 Dec 2023 09:41:18 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com A6CF39C2C7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1702651278; bh=vfZKw4jnkY9FWDRkFPVjPBhiaSS6dSG1yAeVWklGAr4=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=EGOU63j7uwa1EN1BmGjCuhaTlGslIy0EOvKZ21/O9Wt8EMtwTSuI+gZ35JNnlSpym
	 ybREU1KsHvJIys5I5m7kTjcPFNirDFaH4oKLYbEdsjEnosKYs+C/Ut7uSzrai6flBw
	 qiPhWfLNy7P9QxPH/DUlHFsvsFfbSaVD4aUStEmo7s98AxfW294ZMBPtiwJKiXpJiP
	 HAiP4JEdQ0q3sfikl2zUBAfgR1RkVy7vSxFLMliWcmjzViqXN9z7Pi8hXpkfGdoeIf
	 3F0JTq3YYNqFPjbd4esL8lNslZe02H511FYEXuMegqLiPrceUvaDiZ3meDPaRlnm5r
	 +bK0SbkgLpXdg==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id toWEancgtTin; Fri, 15 Dec 2023 09:41:18 -0500 (EST)
Received: from gerard.rennes.sfl (unknown [192.168.216.3])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id B3BEC9C284E;
	Fri, 15 Dec 2023 09:41:17 -0500 (EST)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	broonie@kernel.org
Cc: elinor.montmasson@savoirfairelinux.com,
	alsa-devel@alsa-project.org,
	philip-dylan.gleonec@savoirfairelinux.com
Subject: [PATCHv3 00/10] ASoC: fsl-asoc-card: compatibility integration of a
 generic codec use case for use with S/PDIF controller
Date: Fri, 15 Dec 2023 15:39:55 +0100
Message-Id: <20231215144005.934728-1-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 7BITVVO6HILOWY5Q4RAOHMHLAVH7L5QM
X-Message-ID-Hash: 7BITVVO6HILOWY5Q4RAOHMHLAVH7L5QM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7BITVVO6HILOWY5Q4RAOHMHLAVH7L5QM/>
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

