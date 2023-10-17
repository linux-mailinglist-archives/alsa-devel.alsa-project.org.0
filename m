Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A498D7CC01E
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Oct 2023 12:06:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC89384B;
	Tue, 17 Oct 2023 12:05:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC89384B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697537166;
	bh=ORx4TiHbziD8NTKPwE8OIL+NEWrOQyZcTLBjWa2HhFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SpRr7uAnT6/5ysZ2TpH1UqUqIT8UMagHsR24b98KQkRtxG3B6B/pJOl7KFsj7VoCe
	 b36Q3OXwGC8WAGp6xojXAOS0JztkQazYUuHLAK5q39icv9+XbhJqBlxsXDfO6bSAN/
	 vGElZxVzRjoIqQC5QPgcU9TPEeovaq99cZ7MjMCo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69CF3F8025F; Tue, 17 Oct 2023 12:05:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD29DF8024E;
	Tue, 17 Oct 2023 12:05:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 791EBF8025F; Tue, 17 Oct 2023 12:05:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B97D4F8019B
	for <alsa-devel@alsa-project.org>; Tue, 17 Oct 2023 12:05:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B97D4F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bzWiZmVb
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8E0FAB81D17;
	Tue, 17 Oct 2023 10:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCAAFC433C7;
	Tue, 17 Oct 2023 10:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697537100;
	bh=ORx4TiHbziD8NTKPwE8OIL+NEWrOQyZcTLBjWa2HhFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bzWiZmVblW+dKRRPci1CWqNE/MpTQ7bdISzBXNTRIeF7P98FNsDlQQmZbqIqIZjfg
	 5pCaDS006V42rbl4xZFemx7S1ITFkpYOn70MLbCsdcnOZaJuUUpR7OkvCwcLi+oySi
	 aqTBIw12FIDJkcDdw+/GM0iOOeE3RUxyAxpfjk/f1gCc1fUytiQ31A5kCo/sAywbsw
	 yTKP49tEmU8HDhStyuWUR4tjNFEHDLFiK2/jKlz8Bgh0iMHRC0R/RSw3mDTJl9EIXa
	 UdF2TFB5qOmR1GF22V6Y1vK4+u3LZwS/BtGgou7Pm0qrC7xjx36o6GCACQD2JHIY+p
	 JruPNGujk+9rQ==
Date: Tue, 17 Oct 2023 11:04:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>, bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/4] dt-bindings: audio-graph-port: add ch-maps
 property
Message-ID: <20231017-darkness-jackknife-5cf32246a079@spud>
References: <877cnsy6bl.wl-kuninori.morimoto.gx@renesas.com>
 <871qe0y6aq.wl-kuninori.morimoto.gx@renesas.com>
 <20231012-storage-directory-548905001d10@spud>
 <87wmvr8ioy.wl-kuninori.morimoto.gx@renesas.com>
 <ZSllNtm4ZnUnkiV2@finisterre.sirena.org.uk>
 <20231013-planner-irate-8e411cc54a48@spud>
 <874jirxul6.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mK+KFz/ZbekWv+fv"
Content-Disposition: inline
In-Reply-To: <874jirxul6.wl-kuninori.morimoto.gx@renesas.com>
Message-ID-Hash: VMTSX3Q36OP3GP4RBMKMEH7D2NCTG3TU
X-Message-ID-Hash: VMTSX3Q36OP3GP4RBMKMEH7D2NCTG3TU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VMTSX3Q36OP3GP4RBMKMEH7D2NCTG3TU/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--mK+KFz/ZbekWv+fv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2023 at 12:46:29AM +0000, Kuninori Morimoto wrote:
>=20
> Hi Conor
>=20
> > > Some of this explanation needs to go into the binding - someone readi=
ng
> > > the binding should really be able to figure out what numbers to put in
> > > there without looking at the code.
> >=20
> > Absolutely :)
>=20
> Indeed :) will do in v4
>=20
> > > > ch-maps =3D <0 0 1> means,=20
> > > > 	cpu0 <-> codec0
> > > > 	cpu1 <-> codec0
> > > > 	cpu2 <-> codec1
> >=20
> > What happens when you want to convey that codec0 & codec1 are both
> > connected to cpu0 & codec2 is connected to cpu1?
> > How would that be described in a DT?
> > Or is that not something anyone would even want to do?
>=20
> In such case, ch-maps is from codec. it will be like below.
> It is judged by number of cpu vs codec. [PATCH 3/4] has both case sample.
>=20
> 	cpu >=3D codec : CPU   base
> 	cpu <  codec : Codec base
>=20
> 	ch-maps =3D <0 0 1>
> 	codec0 <-> cpu0
> 	codec1 <-> cpu0
> 	codec2 <-> cpu1

That seems like a very unintuitive interface. If there were 32 CPUs and
30 codecs, then it'd be very inconvenient for a human reader to grok the
configuration. CPUs were to be disabled in the DT, could the meaning of
the property invert?

I am not really the best when it comes to audio (or media) bindings, but
I am wondering if a phandle based approach would be better, where the
codecs have phandles for their associated CPUs. Maybe Mark, Rob etc could
comment if doing that sort of thing is not feasible.

Cheers,
Conor.


--mK+KFz/ZbekWv+fv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZS5cSAAKCRB4tDGHoIJi
0mMMAP9g7XeYeu+IjQ9VTU/Ky8piEtPBsAymq6J4HNo8rFtciAD/chwXcCzMp49B
DMP2Bf4p73/0wUi4X7vBX6zGRrN2Jg8=
=Un8b
-----END PGP SIGNATURE-----

--mK+KFz/ZbekWv+fv--
