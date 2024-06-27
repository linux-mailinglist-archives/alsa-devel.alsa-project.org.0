Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DF991B18A
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 23:26:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 410A5210E;
	Thu, 27 Jun 2024 23:26:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 410A5210E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719523573;
	bh=sw6QJkUOx6dnvHnOUYkmwDviR+5bis7nK5kklIGe8B4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Uxgdiu5RYV0vgtCqNGofNz1iMwkWSN86BojV1ViwQ85xKjY+FOr0SE6K4ImaSGPzj
	 Wv+0bnGRyIcYAhtO94AEtdgTKGBpCCIrm2o/zbgc9ONwF9dvNfAAuN/G7XQUsBddvs
	 zeR1zqssrgJyHdncJcg4WsbB+jCXFWxLtaIe+gHw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61DA4F805AF; Thu, 27 Jun 2024 23:25:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1922F805AF;
	Thu, 27 Jun 2024 23:25:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB9A8F80423; Thu, 27 Jun 2024 23:25:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5530F8013D
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 23:25:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5530F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mqrAhONa
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2289DCE1B5F;
	Thu, 27 Jun 2024 21:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37D25C2BBFC;
	Thu, 27 Jun 2024 21:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719523520;
	bh=sw6QJkUOx6dnvHnOUYkmwDviR+5bis7nK5kklIGe8B4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mqrAhONa3b8WIQ5LFtilKlUEIBKRc58ZejXGCuDCIhhNavv15R6ocbrxAtJdukAq3
	 FaqCGgq5D79cWs7DpsS+7Dt9z+vMkhEkIv9NTJ1tc7U3z/LVPxmwONgM+sqOEZP+Se
	 IrGOAiEUFtUcGpGg/2u5TXujcynjDQc3mJ2yY2PXRd3vTKnuSXgSGlu5HXcPWpNpwC
	 gCU+kumkVWCX/RNvlXnBhnDwiszNVrbQaBPuZCAxxpFSqAoO275PVFEzqXvv/NdqfX
	 Tt17cLoclyJ5KHzaBcD6uGse95ob/oOeubV3ic+nWUAhu6H2Dy0oTXl87QuTF5COsB
	 KQeM8DU5j5zGg==
Date: Thu, 27 Jun 2024 15:25:18 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, Xiubo Li <Xiubo.Lee@gmail.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>, devicetree@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
	linuxppc-dev@lists.ozlabs.org, Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, Qiang Zhao <qiang.zhao@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 09/10] dt-bindings: sound: fsl,qmc-audio: Add support for
 multiple QMC channels per DAI
Message-ID: <171952351643.593434.7474652355291518276.robh@kernel.org>
References: <20240620084300.397853-1-herve.codina@bootlin.com>
 <20240620084300.397853-10-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620084300.397853-10-herve.codina@bootlin.com>
Message-ID-Hash: HYKMGRYEHJORKQIEDCCLZCA73F2GP2GI
X-Message-ID-Hash: HYKMGRYEHJORKQIEDCCLZCA73F2GP2GI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HYKMGRYEHJORKQIEDCCLZCA73F2GP2GI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Thu, 20 Jun 2024 10:42:56 +0200, Herve Codina wrote:
> The QMC audio uses one QMC channel per DAI and uses this QMC channel to
> transmit interleaved audio channel samples.
> 
> In order to work in non-interleave mode, a QMC audio DAI needs to use
> multiple QMC channels. In that case, the DAI maps each QMC channel to
> exactly one audio channel.
> 
> Allow QMC audio DAIs with multiple QMC channels attached.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/sound/fsl,qmc-audio.yaml         | 41 ++++++++++++++++---
>  1 file changed, 35 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

