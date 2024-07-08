Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B53492A510
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jul 2024 16:48:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75FA6857;
	Mon,  8 Jul 2024 16:48:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75FA6857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720450121;
	bh=+vH5Wl2pf2rKsw1/NxNTENPBRL2nLneoS1IPUz/ojvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gq9i4Jxiq/DIhSWI/3cFOoQcp2JxRwMwDKc+kEnWOT9jBDXsfzb/ziDKL9O7i3SUz
	 rd0OO/pGrf6TPJz/W3pPFvH4zXvY/rgJA9vOMQ16OuMUvdMAMGkPYvBnUS4kwac2GX
	 ZX89/w/HYGm2PoXpc1HzU8ykdTEyARvqwry9AUgo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D72A8F80494; Mon,  8 Jul 2024 16:48:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BCC6F8059F;
	Mon,  8 Jul 2024 16:48:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90314F801F5; Mon,  8 Jul 2024 16:48:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9D4AF8013D
	for <alsa-devel@alsa-project.org>; Mon,  8 Jul 2024 16:47:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9D4AF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jc5AjsVs
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D103BCE0DA3;
	Mon,  8 Jul 2024 14:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23C65C116B1;
	Mon,  8 Jul 2024 14:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720450046;
	bh=+vH5Wl2pf2rKsw1/NxNTENPBRL2nLneoS1IPUz/ojvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jc5AjsVsDc+SYPNGAWZ3Ost1NVoAo4ADtJwYBoKm7KKgJebfDvDfxFGeKFx+u0w4X
	 ocJDEfZ749lyVO+vQE8+bqZRP3iiZGaVm7WJYbngnkqmwIrqZquE89a72M+NiNAp0l
	 zJUAWN2pUilGM8R7aFaKUK4b88rYnXtjYSZXTs/mwhAAjx4YCVfFfKbQUYdDNg24ah
	 ukJlyiV8d5UM2gxY3ReeqGsGtREqYr1vXBR/N0mSsCGoAT5NHhQcnCdzk+ucMEpwHC
	 ljesqdK27ntzO+EPHiQjNnpnOFV9wdL68scZxZm1v6XjHSYWe9eblBVPXSBKxlyPtP
	 c73m3wWsUDSsQ==
Date: Mon, 8 Jul 2024 08:47:25 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	imx@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>,
	devicetree@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Xiubo Li <Xiubo.Lee@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Will Deacon <will@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Russell King <linux@armlinux.org.uk>, linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Philip-Dylan <philip-dylan.gleonec@savoirfairelinux.com>
Subject: Re: [PATCH v6 5/7] ASoC: dt-bindings: update fsl-asoc-card bindings
 after imx-spdif merge
Message-ID: <172045004389.3168553.9456011538931000974.robh@kernel.org>
References: <20240627083104.123357-1-elinor.montmasson@savoirfairelinux.com>
 <20240627083104.123357-6-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627083104.123357-6-elinor.montmasson@savoirfairelinux.com>
Message-ID-Hash: WOG6E6YFXED7WS2CARI7N5RIWJ5YA6OG
X-Message-ID-Hash: WOG6E6YFXED7WS2CARI7N5RIWJ5YA6OG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WOG6E6YFXED7WS2CARI7N5RIWJ5YA6OG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Thu, 27 Jun 2024 10:31:02 +0200, Elinor Montmasson wrote:
> The S/PDIF audio card support with compatible "fsl,imx-audio-spdif"
> was merged from imx-spdif into the fsl-asoc-card driver.
> It makes possible to use an S/PDIF with an ASRC.
> 
> This merge introduces new DT bindings to use with compatible
> "fsl,imx-audio-spdif" to follow the way fsl-asoc-card works:
> * the "spdif-controller" property from imx-spdif is named "audio-cpu"
>   in fsl-asoc-card.
> * fsl-asoc-card uses codecs explicitly declared in DT
>   with "audio-codec".
>   With an SPDIF, codec drivers spdif_transmitter and
>   spdif_receiver should be used.
>   Driver imx-spdif used instead the dummy codec and a pair of
>   boolean properties, "spdif-in" and "spdif-out".
> 
> In an upcoming commit, in-tree DTs will be modified to follow these new
> properties:
> * Property "spdif-controller" will be renamed "audio-cpu".
> * spdif_transmitter and spdif_receiver nodes will be declared
>   and linked to the fsl-asoc-card node with the property "audio-codec".
> 
> To keep backward compatibility with other DTs, support for
> "spdif-controller", "spdif-in" and "spdif-out" properties is kept.
> However, it is recommended to use the new properties if possible.
> It is better to declare transmitter and/or receiver
> in DT than using the dummy codec.
> 
> DTs using compatible "fsl,imx-audio-spdif" are still supported, and
> fsl-asoc-card will behave the same as imx-spdif for these DTs.
> 
> Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
> ---
>  .../bindings/sound/fsl,imx-audio-spdif.yaml   | 66 -------------------
>  .../bindings/sound/fsl-asoc-card.yaml         | 53 +++++++++++++--
>  2 files changed, 49 insertions(+), 70 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/fsl,imx-audio-spdif.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

