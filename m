Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A457C8A9E
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Oct 2023 18:16:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8612A84A;
	Fri, 13 Oct 2023 18:15:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8612A84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697213809;
	bh=eZ+fvPLkMyb+DJfFUnuMWJsRKI1Y554XSjCKOcKo0bw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y5VduTyZtYQbuUxYlACftilO0yopgL35saem9iLa/Rt+MPGqzhmi4g+KjbSfGSGbc
	 KtxD9BY5K7+3Oa+o8QwPJdOp/IR0A1Y40y46wKrdnIdUIYKFl/aKy6Q+OyUZ4h9c1v
	 IvKvUVRok8kAI1m4eIqkB9Bc1l7XdONAqXMltmnE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFACAF8015B; Fri, 13 Oct 2023 18:15:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98186F8027B;
	Fri, 13 Oct 2023 18:15:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75D03F802BE; Fri, 13 Oct 2023 18:13:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F04BFF8015B
	for <alsa-devel@alsa-project.org>; Fri, 13 Oct 2023 18:13:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F04BFF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KHTGGbsS
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id C3442B82BA2;
	Fri, 13 Oct 2023 16:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B01C433C8;
	Fri, 13 Oct 2023 16:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697213560;
	bh=eZ+fvPLkMyb+DJfFUnuMWJsRKI1Y554XSjCKOcKo0bw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KHTGGbsSkL6J3HabN3JEbUMbtfWYVI+0YkRkcWfsynfc1mr/Un8+/xkFMUYNPT2VZ
	 sYFk2sMnK8RJNENBt5m9VlwBeQvJgYNHbpJ6opUh6572YB8Z5hyYWRZE5GER1Pu+fL
	 7yaefd6AV1raTSy+XU3HLJQbdw5X7h8RmmDl1ETDRzVK4FACVvT87ij/F/+dDTvtba
	 3ahRbpEvVnobrvdLe4ce5uyRvNSYNLN9gsxRpcIyhiEihXj1MeAQGAOf4j4kd/foAT
	 yiAcmMp4Iap6+dIybibxd3Bqmy1UXYBMtyGbDYFsrhpu8f2JaF8uGOw41rPS1M7EFK
	 kQB5fooRvJwDA==
Date: Fri, 13 Oct 2023 17:12:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>, bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/4] dt-bindings: audio-graph-port: add ch-maps
 property
Message-ID: <20231013-planner-irate-8e411cc54a48@spud>
References: <877cnsy6bl.wl-kuninori.morimoto.gx@renesas.com>
 <871qe0y6aq.wl-kuninori.morimoto.gx@renesas.com>
 <20231012-storage-directory-548905001d10@spud>
 <87wmvr8ioy.wl-kuninori.morimoto.gx@renesas.com>
 <ZSllNtm4ZnUnkiV2@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YKanpJSQoSs+i+/r"
Content-Disposition: inline
In-Reply-To: <ZSllNtm4ZnUnkiV2@finisterre.sirena.org.uk>
Message-ID-Hash: PAOTC3L7IQL65MN5VTGRKFJHAZR5SYXF
X-Message-ID-Hash: PAOTC3L7IQL65MN5VTGRKFJHAZR5SYXF
X-MailFrom: conor@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PAOTC3L7IQL65MN5VTGRKFJHAZR5SYXF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--YKanpJSQoSs+i+/r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 13, 2023 at 04:41:42PM +0100, Mark Brown wrote:
> On Fri, Oct 13, 2023 at 12:33:34AM +0000, Kuninori Morimoto wrote:
>=20
> > > > +      ch-maps:
> > > > +        $ref: /schemas/types.yaml#/definitions/uint32-array
>=20
> > > I only got this one patch, so I have no context at all for this chang=
e.
> > > Given that, and since I know almost nothing about sound stuff...
> > (snip)
> > > ...I have absolutely no idea how I would populate "ch_maps" correctly.
> > > Please describe (in the binding) what this property actually does
> > > & how to use it. Also, properties use -s not _s.
>=20
> > Some Sound want to use multiple connections between CPUs (N) and Codecs=
 (M).
> > Current audio-graph-card2 driver is already supporting 1:N / N:1 / N:N
> > connections, this patch expand it.
>=20
> Some of this explanation needs to go into the binding - someone reading
> the binding should really be able to figure out what numbers to put in
> there without looking at the code.

Absolutely :)

> > ch-maps =3D <0 0 1> means,=20
> > 	cpu0 <-> codec0
> > 	cpu1 <-> codec0
> > 	cpu2 <-> codec1

What happens when you want to convey that codec0 & codec1 are both
connected to cpu0 & codec2 is connected to cpu1?
How would that be described in a DT?
Or is that not something anyone would even want to do?

> > Thank you for your help !!
>=20
> So probably somthing along the lines of saying "there should be one
> element in the array for each CPU DAI, this should be the CODEC number
> to route to" (that's probably still a bit unclear but roughly that).


--YKanpJSQoSs+i+/r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSlscwAKCRB4tDGHoIJi
0mMmAP9Nb483b0dBaBUFHXG0WX2fOcV2+9tOiuO5YHM7z5uF2wD/c5bcMJsmpzS0
yqb+QJFoKLGVpbitjhIhLtUc975zRgk=
=88E7
-----END PGP SIGNATURE-----

--YKanpJSQoSs+i+/r--
