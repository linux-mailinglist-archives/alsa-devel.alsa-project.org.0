Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D72797CD5D0
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 09:58:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F75FA4D;
	Wed, 18 Oct 2023 09:57:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F75FA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697615907;
	bh=hHnGKBe2emsDrWB85Q2GbtTeoWz6TCrEfOKba41zLeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YXY9K0HPf4X4SBrHxDqbl6mTx4O7ahgA7ophSz8uNonVK+iCTjmH8ajVI5893DZ1L
	 wuXQfYmOIkGT/ipVdw9UhdoqXRCyBZ9bHWhIsa5BHvX1IZTaCCxM+X8z4rNG+PsoQC
	 h6pj6qYfp20xv+X7rZ+LAiG+7tGlAIrDnLXeil7k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8692AF80536; Wed, 18 Oct 2023 09:57:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28A76F8024E;
	Wed, 18 Oct 2023 09:57:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9067F8025F; Wed, 18 Oct 2023 09:57:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF6ABF8019B
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 09:57:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF6ABF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=c57W3SXA
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 552C9CE238D;
	Wed, 18 Oct 2023 07:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83285C433C7;
	Wed, 18 Oct 2023 07:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697615842;
	bh=hHnGKBe2emsDrWB85Q2GbtTeoWz6TCrEfOKba41zLeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c57W3SXA7Y9CMEosf1v+TYWdgEbo3PwPpebiZbvKfHrgqx9cvxX4LpkjcXA6AV0yb
	 khr1zYLsF/vOQ9aE2zGEAav+xgOf9P7Dc4DieAsAM0W269+0E8KpGp2xgcvyeMLqRN
	 i9sHLM/TmTdVBhFdWfFY6kbEBlDcbUDhGBkwQyMudUi8Xmx6sx3a3u2G0Q3FDEP4aV
	 lFzwOUDwH9/7fvVr48e/NqNnOLdoCe6r5yd0zQK/dY1qeCM3HoACS5NmySFZshW0uz
	 7X0MD2Hb6DpfJlarXpaquBhnW4ZPyelLPq7MUlrf548eTj/0ZUC3hX3ZzB4y4+fRoW
	 PS4LcbgBddMiw==
Date: Wed, 18 Oct 2023 08:57:17 +0100
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
Message-ID: <20231018-object-renewable-6e03bce41ff4@spud>
References: <877cnsy6bl.wl-kuninori.morimoto.gx@renesas.com>
 <871qe0y6aq.wl-kuninori.morimoto.gx@renesas.com>
 <20231012-storage-directory-548905001d10@spud>
 <87wmvr8ioy.wl-kuninori.morimoto.gx@renesas.com>
 <ZSllNtm4ZnUnkiV2@finisterre.sirena.org.uk>
 <20231013-planner-irate-8e411cc54a48@spud>
 <874jirxul6.wl-kuninori.morimoto.gx@renesas.com>
 <20231017-darkness-jackknife-5cf32246a079@spud>
 <871qdskbuu.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+PVmEthYiTJgsBmG"
Content-Disposition: inline
In-Reply-To: <871qdskbuu.wl-kuninori.morimoto.gx@renesas.com>
Message-ID-Hash: 7TXKMVTLBMFF3PMO3VGNJOGUNBXS5BIW
X-Message-ID-Hash: 7TXKMVTLBMFF3PMO3VGNJOGUNBXS5BIW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7TXKMVTLBMFF3PMO3VGNJOGUNBXS5BIW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--+PVmEthYiTJgsBmG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2023 at 12:34:01AM +0000, Kuninori Morimoto wrote:
>=20
> Hi Conor
>=20
> > That seems like a very unintuitive interface. If there were 32 CPUs and
> > 30 codecs, then it'd be very inconvenient for a human reader to grok the
> > configuration.
>=20
> I don't think such huge number connection will be used...

Your binding allows for that though!
I really don't like the number of elements inverting the meaning of the
property.

Also, this was not the only item in my mail. Why did you not respond to
the other comments?

Cheers,
Conor.

> Thank you for your help !!
>=20
> Best regards
> ---
> Kuninori Morimoto

--+PVmEthYiTJgsBmG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZS+P3QAKCRB4tDGHoIJi
0tCFAQD0V51gPF8vA/PWe7k5s+YCmPinkuodkdq5yw4ww1P4eQEAoMQ/Pu66tViV
pp29y4YWrYzXn4I3JMz0tIdQw9rTpQ4=
=1MPg
-----END PGP SIGNATURE-----

--+PVmEthYiTJgsBmG--
