Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 234167E063E
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 17:18:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F26E0825;
	Fri,  3 Nov 2023 17:18:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F26E0825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699028338;
	bh=Xbndmf0YHZtHbgihlgFeAtlSxG6+gcLz/SED146ciUw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kItDe216MbkOVatKpaujtd1zTtQg7tKcZNNu7SzRcSlqlxkp/rCINOkFjHwjWs12x
	 XyrijISPoZwgAXE7a9UfWdQJpxObWlSH0p7JyrmDanSGy3b3G8VMZ/dxoT9OsfdZHu
	 9WPwoEoukTe1cZusTLRxNAfz7o+iskhR6S5/+9Gw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7981DF8055A; Fri,  3 Nov 2023 17:18:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86657F8020D;
	Fri,  3 Nov 2023 17:18:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38554F8019B; Fri, 27 Oct 2023 16:49:04 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 36C45F8012B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 16:48:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36C45F8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=bdifzZP1
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 93C729C3343;
	Fri, 27 Oct 2023 10:48:33 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id jVSwdsYHtvBd; Fri, 27 Oct 2023 10:48:33 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id E2D5E9C3358;
	Fri, 27 Oct 2023 10:48:32 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com E2D5E9C3358
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1698418112; bh=7kqjp328TkSpD1fPn6USaBZ8q2jA86DsTY2+9fl5Pd0=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=bdifzZP1J8nFyLoBOr3Y1BDWVbrwQlV70bAbjtf802fJDZQoDup5olklNmpciZMYQ
	 20ALyt+k60LaPAe2IK1V9iqVOmcw90RG2JQf6eSQ5pEnKrs06NpOGc2pg/107whh4T
	 m1x89IX3SYSl3uxOEmC7kWyBmaUV0wXmqu9DRwp4iY7Luq+7YK1bNQGfgLelp1Rgdb
	 3vfrkdYmgaINVyNqdDmtsyUEQDeCxtrLO0tGYXmjcair/inPblPXLLxK1fkSLhitwG
	 XXRqNy+A7jOGv6Cci8RglWWGADuI1ok0oPN+A7QQlHAAorW2c929qPQWjTP08J/1s9
	 USMFqVV1/RMkQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id DtHiefBbywFW; Fri, 27 Oct 2023 10:48:32 -0400 (EDT)
Received: from gerard.rennes.sfl
 (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id F37379C3343;
	Fri, 27 Oct 2023 10:48:31 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	broonie@kernel.org
Cc: elinor.montmasson@savoirfairelinux.com,
	alsa-devel@alsa-project.org,
	philip-dylan.gleonec@savoirfairelinux.com
Subject: [PATCHv2 00/10] ASoC: fsl-asoc-card: compatibility integration of a
 generic codec use case for use with S/PDIF controller
Date: Fri, 27 Oct 2023 16:47:24 +0200
Message-Id: <20231027144734.3654829-1-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MailFrom: elinor.montmasson@savoirfairelinux.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3BZSWBNL6Q2OGNQ76AAD4YWH6YTECSNV
X-Message-ID-Hash: 3BZSWBNL6Q2OGNQ76AAD4YWH6YTECSNV
X-Mailman-Approved-At: Fri, 03 Nov 2023 16:18:02 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3BZSWBNL6Q2OGNQ76AAD4YWH6YTECSNV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello,

This is the v2 of the series of patch aiming to make the machine driver f=
sl-asoc-card compatible with use cases where there is no real codec drive=
r. It proposes to use the spdif_receiver and spdif_transmitter drivers in=
stead of the dummy codec.
This is a first step in using the S/PDIF controller with the ASRC.

The five first patches add compatibility with the pair of codecs spdif_re=
ceiver and spdif_transmitter with a new compatible, "fsl,imx-audio-generi=
c". Codec parameters are set with default values.

The remaining patches add configuration options for the device tree. They=
 configure the CPU DAI when using "fsl,imx-audio-generic". These are usua=
lly hard-coded in fsl-asoc-card for each audio codec. Because the generic=
 codec could be used with other CPU DAI than the S/PDIF controller, setti=
ng these parameters could be required.

This series of patch was successfully built for arm64 and x86 on top of t=
he latest for-next branch of the ASoC git tree on the 24/10.
These modifications have also been tested on an i.MX8MN evaluation board,=
 with a linux kernel RT v6.1.26-rt8.

We also have a few questions :

* We named the compatible "fsl,imx-audio-generic" as, for the moment, it =
could work with any CPU DAI, even if it uses S/PDIF codecs. Is it prefera=
ble to keep these modifications specific to the S/PDIF, thus specifying "=
spdif" in the compatible ? Or is it okay to keep the actual name of the c=
ompatible, and the generic purpose of this compatible ?

* Part of the dai_fmt variable hold information on the codec provider or =
consumer status for bit/frame clocks. In patch 03/10, as we add compatibi=
lity for multiple codecs, we make the test about bit/frame clock provider=
 only check with codec[0]. That way we assure compatibility with all alre=
ady existing compatibles. As it was never intended before to have multipl=
e codecs for this test, is there a better way to handle it ? Should we ma=
ke this test check if any codec is clock provider ? Or should we let code=
c[0] be the default possibility ? That way, future compatibles that could=
 encounter this specific case with multi-codecs should adapt the test for=
 their needs.

Best regards,
Elinor Montmasson

Changelog:
v1 -> v2:
* replace use of the dummy codec by the pair of codecs spdif_receiver / s=
pdif_transmitter
* adapt how dai links codecs are used to take into account the possibilit=
y for multiple codecs per link
* change compatible name
* adapt driver to be able to register two codecs given in the device tree
* v1 patch series at:
https://lore.kernel.org/alsa-devel/20230901144550.520072-1-elinor.montmas=
son@savoirfairelinux.com/

Elinor Montmasson (10):
  ASoC: fsl-asoc-card: add support for dai links with multiple codecs
  ASoC: fsl-asoc-card: add second dai link component for codecs
  ASoC: fsl-asoc-card: add compatibility to use 2 codecs from device
    tree
  ASoC: fsl-asoc-card: add new compatible for a generic codec use case
  ASoC: fsl-asoc-card: set generic codec as clock provider
  ASoC: fsl-asoc-card: add dts property "cpu-slot-width"
  ASoC: fsl-asoc-card: add dts property "cpu-slot-num"
  ASoC: fsl-asoc-card: add dts properties "cpu-sysclk-freq"
  ASoC: fsl-asoc-card: add dts properties "cpu-sysclk-dir-out"
  Documentation: fsl-asoc-card: add documentation for generic codec case

 .../bindings/sound/fsl-asoc-card.txt          |  26 +++-
 sound/soc/fsl/fsl-asoc-card.c                 | 128 ++++++++++++------
 2 files changed, 114 insertions(+), 40 deletions(-)

--=20
2.25.1
