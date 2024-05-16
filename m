Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9338C75B8
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2024 14:12:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C7BD857;
	Thu, 16 May 2024 14:12:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C7BD857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715861537;
	bh=vzWty9Z112mKSwQmpKl9H1kFTMkTlX2pGHRLOpUzc/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bsWFSHun38tvrH3ZvanFv69DDjQs0ul6NOZGUXSvsYr3vEMcR0fRM0KJEBUGMUvKn
	 Xw7rQYq7rhP5V3caMIFutRhNYSrr+X0fAWaJT5+EMhFtgvLELmUJTil5Y5mNhVQj4s
	 Srj6uzrRCiyWYKn48cxp5W8/blArRwHBsn8CCqCA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F047F80563; Thu, 16 May 2024 14:11:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE5DFF8059F;
	Thu, 16 May 2024 14:11:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71057F8024C; Thu, 16 May 2024 14:11:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 52224F800E2
	for <alsa-devel@alsa-project.org>; Thu, 16 May 2024 14:11:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52224F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MFGv9a8x
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1FCE4CE18AB;
	Thu, 16 May 2024 12:11:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE16C113CC;
	Thu, 16 May 2024 12:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715861477;
	bh=vzWty9Z112mKSwQmpKl9H1kFTMkTlX2pGHRLOpUzc/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MFGv9a8xqo8bIibuLTC9Sb22GP+YNQKltzSiK5BkAxKn0wNtLMgfSglvsKWq8NCFn
	 2p66bCe8JEZjQtBko0q30KPK5AEzNRLzP8+9Ybw2o/zP2GFmWoqGXdtMT+7ullrGHM
	 KsFRznanFdd7euh+hybdzmSQGcdITWEBsycbxu8GmiVmHbk/jrJXQUsgtR4MGWKPYi
	 aeKu03Xzz8FiBxjPfCL5MqFn9JRzfSdeGQ3b3a2r9C+qwOjRBWfTQRJFP/nHf9LdVA
	 Ujd3ycfgTKc6iR/hkJDzhkWpL6UkTirq8EiK1I5/EnNlQcy9QyxtdmikyTkTapXMno
	 cU/ARVbKxuyEQ==
Date: Thu, 16 May 2024 13:11:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCHv4 9/9] ASoC: dt-bindings: fsl-asoc-card: add compatible
 for generic codec
Message-ID: <ce9a87c6-4a5c-4f0a-a8df-1fdce8c1f5df@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
 <20240515135411.343333-10-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XZeYRrKEjeLfbFL9"
Content-Disposition: inline
In-Reply-To: <20240515135411.343333-10-elinor.montmasson@savoirfairelinux.com>
X-Cookie: I'm having a MID-WEEK CRISIS!
Message-ID-Hash: JEAVKNMXINYLNENXVPMZXPRGCDHW72CY
X-Message-ID-Hash: JEAVKNMXINYLNENXVPMZXPRGCDHW72CY
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JEAVKNMXINYLNENXVPMZXPRGCDHW72CY/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--XZeYRrKEjeLfbFL9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 15, 2024 at 03:54:11PM +0200, Elinor Montmasson wrote:

> Add documentation about new dts bindings following new support
> for compatible "fsl,imx-audio-generic".

>    audio-codec:
> -    $ref: /schemas/types.yaml#/definitions/phandle
> -    description: The phandle of an audio codec
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      The phandle of an audio codec.
> +      If using the "fsl,imx-audio-generic" compatible, give instead a pair of
> +      phandles with the spdif_transmitter first (driver SPDIF DIT) and the
> +      spdif_receiver second (driver SPDIF DIR).
> +    items:
> +      maxItems: 1

This description (and the code) don't feel like they're actually generic
- they're clearly specific to the bidrectional S/PDIF case.  I'd expect
something called -generic to cope with single CODECs as well as double,
and not to have any constraints on what those are.

--XZeYRrKEjeLfbFL9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZF994ACgkQJNaLcl1U
h9B7owf/abYbh4drI6QTSdLIrmNMdhFX4cLfs8jwRLolmoqXOy0BxV3+SchLf/aR
T+1Cls7jAUyeAqoS8Z4NyDeCa/5Y17c7+QVmcgr53BmGgWjkKhxiyOjrl6q6gEXy
VMZBcrNghdW1k5rzO3OCOiO38eFODTZ6RzBL0sh3iThDf+qQLKwgKWeZgL7tsuNz
zJWwE0UVPkuiX9iR2pNWfWb0Q4VuEY9LieR9Onw5+rusb0xLF1PxGD6FaZIHLBBT
CeeFfhBmLKorYQzK0o8oROWKEIx2o+HFCt/VO4aVmT+xFS5qK2wAOm4u/GtwnQLD
6C87130dv/yD0+qYIIG6L3mTkpJ29A==
=nO6y
-----END PGP SIGNATURE-----

--XZeYRrKEjeLfbFL9--
