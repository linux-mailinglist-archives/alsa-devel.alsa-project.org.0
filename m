Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3797C88F0
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Oct 2023 17:42:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F374A836;
	Fri, 13 Oct 2023 17:41:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F374A836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697211769;
	bh=nUoG1ESo3DH+7LyVpGPKHdPdm6b3B0YmkVXnaIiA53w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nGf70Vi7Rp2Bt8BnYRqn8clSxZn1KlwQXMIFG0sGg00MR7o13i0/IxQ+g+xynIO6x
	 aYP45u7K1DQTVcTl85B+p3+SDwm81aLASx00twKHBx0/ReEUTBAYga1vdSESMqo/xn
	 XAubzPj3MZWsWTlNqxcmmatGHXFB6GievwMhDO2o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C077F80552; Fri, 13 Oct 2023 17:41:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21DD8F8027B;
	Fri, 13 Oct 2023 17:41:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BCA8F802BE; Fri, 13 Oct 2023 17:41:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C3DEF8019B
	for <alsa-devel@alsa-project.org>; Fri, 13 Oct 2023 17:41:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C3DEF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cBhSABgl
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 35E1CB82B89;
	Fri, 13 Oct 2023 15:41:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08735C433C8;
	Fri, 13 Oct 2023 15:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697211705;
	bh=nUoG1ESo3DH+7LyVpGPKHdPdm6b3B0YmkVXnaIiA53w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cBhSABglqnHOl5sgPZYvWfJLpH2+OZs1tb9ru0Fh/X+XBXbOfi+bKXXeOFhHjoXxv
	 vFnlYr61NSJxlM3q3XfiEYNtGzUF/tBmNeWh8O6TDO3txQ6o3iW1m6y2qyadVpR4oS
	 efdtAjLerOy8lMO/Pw9n1LUO/4vHlPr1iIuZTAwCYwNK/gNo4QLqJAoWyHvmwaRY7K
	 /v6sqPhs1NPpAjqBdDBZEiXdByytpmRTOxGFSikychtieq97bCUdN15d1zxQcDXrgO
	 +XREBUfYrlbvi20MWyPnmq1kGDJeRXByluspnta6SlyE4Oz/VzPXAFAKnOl2m5n36Z
	 WUtBYd1Tpviyg==
Date: Fri, 13 Oct 2023 16:41:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Conor Dooley <conor@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>, bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/4] dt-bindings: audio-graph-port: add ch-maps
 property
Message-ID: <ZSllNtm4ZnUnkiV2@finisterre.sirena.org.uk>
References: <877cnsy6bl.wl-kuninori.morimoto.gx@renesas.com>
 <871qe0y6aq.wl-kuninori.morimoto.gx@renesas.com>
 <20231012-storage-directory-548905001d10@spud>
 <87wmvr8ioy.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="osYiuKgTjXvEd7Of"
Content-Disposition: inline
In-Reply-To: <87wmvr8ioy.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: OYFELPT5JCP7SLW524D3HQQCCXG2EKEM
X-Message-ID-Hash: OYFELPT5JCP7SLW524D3HQQCCXG2EKEM
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OYFELPT5JCP7SLW524D3HQQCCXG2EKEM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--osYiuKgTjXvEd7Of
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 13, 2023 at 12:33:34AM +0000, Kuninori Morimoto wrote:

> > > +      ch-maps:
> > > +        $ref: /schemas/types.yaml#/definitions/uint32-array

> > I only got this one patch, so I have no context at all for this change.
> > Given that, and since I know almost nothing about sound stuff...
> (snip)
> > ...I have absolutely no idea how I would populate "ch_maps" correctly.
> > Please describe (in the binding) what this property actually does
> > & how to use it. Also, properties use -s not _s.

> Some Sound want to use multiple connections between CPUs (N) and Codecs (=
M).
> Current audio-graph-card2 driver is already supporting 1:N / N:1 / N:N
> connections, this patch expand it.

Some of this explanation needs to go into the binding - someone reading
the binding should really be able to figure out what numbers to put in
there without looking at the code.

> ch-maps =3D <0 0 1> means,=20
> 	cpu0 <-> codec0
> 	cpu1 <-> codec0
> 	cpu2 <-> codec1

> Thank you for your help !!

So probably somthing along the lines of saying "there should be one
element in the array for each CPU DAI, this should be the CODEC number
to route to" (that's probably still a bit unclear but roughly that).

--osYiuKgTjXvEd7Of
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUpZTUACgkQJNaLcl1U
h9Bz4wf+I47hAwk66lq9ARIkLz6rER3uYSb4OKDBqoUhUClsjL34uW/giI0JvF+0
DKV22AA8cmWoJdCUlGxmoKq6/YA5IhTp6Dbb5Jf/Dphm+Xn2AAHw1HQXOwSNPt/H
Jl9ZJwpSqUdLGg7fvT7jwfiFd302+cxEsPDZ92j/YHeIy0zZPL4YOuNOJRaZzBfg
SYJWLHPqUVHsYCM6eya+CxPufK21QD3d5KVJaZTe/+98owQptBStc2C6fM52iopt
+g+Z6pGz35k9clbA+A/E697rUy6gSLM+9fUKYWmc5/2bJPwBaONKhRGRsJq3Cq4t
wgvg+a6BwDnF8ux7BACPVRPhmUkPIA==
=M9cc
-----END PGP SIGNATURE-----

--osYiuKgTjXvEd7Of--
