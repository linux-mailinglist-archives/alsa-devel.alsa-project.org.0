Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF40902061
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2024 13:29:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8A3D851;
	Mon, 10 Jun 2024 13:29:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8A3D851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718018987;
	bh=Ufe1ZLLoSpV2K0MaHShy7dxkB+4myYMOF10kUQW4gXo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eGT0E1GjqjF6IX27jkZRkvcSyd84vBCTmMlmQvCShWsFvqBraA/TsQAd0usLSOZiJ
	 ZkL+pQEci1i53NevkKTUPROdSvNNWHmqPLRYRi6H5TFx/TaoZpnx2v6Weia6a6babq
	 AUnyPD3Kq+5Ydw+mvYr4MA+aij5zIiOFh6B33PTY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88E0EF80589; Mon, 10 Jun 2024 13:29:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE6E4F80579;
	Mon, 10 Jun 2024 13:29:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8A41F8028D; Mon, 10 Jun 2024 13:28:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 305FAF80130
	for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2024 13:28:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 305FAF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Y11qWq30
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 89AB660AC4;
	Mon, 10 Jun 2024 11:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ACDEC2BBFC;
	Mon, 10 Jun 2024 11:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718018879;
	bh=Ufe1ZLLoSpV2K0MaHShy7dxkB+4myYMOF10kUQW4gXo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Y11qWq30JfF1hbZ5lW8q94mVwGFAZz6WmQi0tGPt8JvvCOaPT0ZAdTvd5G0BHLHvJ
	 jDM3zjchO1oHI6T0VewH68UTOMNfJmxyyaycTTV1hIuPqRpF3fd74/GSbD/7HuAywg
	 kySI4Q4zETEwS/G1Dwc0r0KHbTJ2ZWEIJPgeDXO4UAB1B+MdDKZPhSLkC6kuRdpOGd
	 e+xdffUGjXR8cfHK+ojVrTA7NnxN/I1nbyOnRq9G5vzQFaiwdC8dzG7pnvaC1l4cIa
	 abou26jaw2GdG+3zqZy07fFf38Kz+U7aUSHMXMAGxVkeNrsSkoMQpyZh/bhFv84zJ2
	 uu3p1QGPoIi7A==
Date: Mon, 10 Jun 2024 05:27:58 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Vladimir Zapolskiy <vz@mleia.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20240610102415.79740-1-piotr.wojtaszczyk@timesys.com>
References: <20240610102415.79740-1-piotr.wojtaszczyk@timesys.com>
Message-Id: <171801887810.1852058.9889760011059594602.robh@kernel.org>
Subject: Re: [PATCH] ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs
Message-ID-Hash: RJHS6OWU23XDE7FAESBX22ELCF6TUZON
X-Message-ID-Hash: RJHS6OWU23XDE7FAESBX22ELCF6TUZON
X-MailFrom: robh@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RJHS6OWU23XDE7FAESBX22ELCF6TUZON/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 10 Jun 2024 12:24:07 +0200, Piotr Wojtaszczyk wrote:
> This driver was ported from an old version in linux 2.6.27 and adjusted
> for the new ASoC framework and DMA API.
> 
> Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> ---
>  .../bindings/sound/nxp,lpc3220-i2s.yaml       |  50 +++
>  arch/arm/boot/dts/lpc32xx.dtsi                |   4 +
>  arch/arm/mach-lpc32xx/phy3250.c               |  60 +++
>  sound/soc/fsl/Kconfig                         |   7 +
>  sound/soc/fsl/Makefile                        |   2 +
>  sound/soc/fsl/lpc3xxx-i2s.c                   | 411 ++++++++++++++++++
>  sound/soc/fsl/lpc3xxx-i2s.h                   |  94 ++++
>  sound/soc/fsl/lpc3xxx-pcm.c                   |  75 ++++
>  8 files changed, 703 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
>  create mode 100644 sound/soc/fsl/lpc3xxx-i2s.c
>  create mode 100644 sound/soc/fsl/lpc3xxx-i2s.h
>  create mode 100644 sound/soc/fsl/lpc3xxx-pcm.c
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml: 'maintainers' is a required property
	hint: Metaschema for devicetree binding documentation
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240610102415.79740-1-piotr.wojtaszczyk@timesys.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

