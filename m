Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEA67CE664
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 20:27:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 541B082B;
	Wed, 18 Oct 2023 20:26:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 541B082B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697653648;
	bh=97E3yC4BQi+fmr4qzJQxTJ5rxTwt5RTXRGszFzVrnzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vIgKCPhV8OPwipFcnN9YFy+MueNWL+jlzAUODsX4ni/3YY4GT0uJ593TkfwedcoWr
	 IlT6qzHSUMzEv5pkfUD1XdrKd0S768jdm5UcDyTpZD3ijdgbd4Q6oHDNm3fd3G6S00
	 A+WrNS6KJebMCrAFPpx/T9fqN90uFZ4bWhm2SpEk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD10EF8019B; Wed, 18 Oct 2023 20:26:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E1A7F8024E;
	Wed, 18 Oct 2023 20:26:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A91DF8025F; Wed, 18 Oct 2023 20:25:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 033BEF8019B
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 20:25:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 033BEF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WY9p+aUw
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CDC5CCE2686;
	Wed, 18 Oct 2023 18:25:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE47EC433C9;
	Wed, 18 Oct 2023 18:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697653508;
	bh=97E3yC4BQi+fmr4qzJQxTJ5rxTwt5RTXRGszFzVrnzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WY9p+aUwVDj4FKNmX4fn0l7t9KvSIKR+Skerlsrm2aRfjVeQIBS5/qloXWzYJAi06
	 mJ8/XaNnSiVN+ozyUO5qNfIl+hupnUVwAUX0LXHhaaq1Rd5DxcX8hTOpuqjRoFBQ5k
	 l73MaDt0vlbR765bg8evALISkDv4PyJ8vujwjMNG2nRAgMzgkOeohSZIHToGrV2y0v
	 n3+XRLDOo0UV1/Oot3LVgkLCwGarOe+q2g7dYP/n3sgoNgxpABYahFe2oBtor/Owjg
	 FsT1dXL7PuAl2DcICUOCI0a9GE0G3m6ro1K4HxXpo8dD2sx42iG8/Ea4i/zTtBlwXO
	 0ZT+/YnwlCc4Q==
Date: Wed, 18 Oct 2023 19:25:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>, bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/4] dt-bindings: audio-graph-port: add ch-maps
 property
Message-ID: <77d3d1e5-7120-4a5b-99c0-c34407f63d5b@sirena.org.uk>
References: <877cnsy6bl.wl-kuninori.morimoto.gx@renesas.com>
 <871qe0y6aq.wl-kuninori.morimoto.gx@renesas.com>
 <20231012-storage-directory-548905001d10@spud>
 <87wmvr8ioy.wl-kuninori.morimoto.gx@renesas.com>
 <ZSllNtm4ZnUnkiV2@finisterre.sirena.org.uk>
 <20231013-planner-irate-8e411cc54a48@spud>
 <874jirxul6.wl-kuninori.morimoto.gx@renesas.com>
 <20231017-darkness-jackknife-5cf32246a079@spud>
 <871qdskbuu.wl-kuninori.morimoto.gx@renesas.com>
 <20231018-object-renewable-6e03bce41ff4@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6a3rttStc9U4TCn4"
Content-Disposition: inline
In-Reply-To: <20231018-object-renewable-6e03bce41ff4@spud>
X-Cookie: Santa Claus is watching!
Message-ID-Hash: JJTIA74EPKULOOGPGGODBVH4VRE22WUL
X-Message-ID-Hash: JJTIA74EPKULOOGPGGODBVH4VRE22WUL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JJTIA74EPKULOOGPGGODBVH4VRE22WUL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--6a3rttStc9U4TCn4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2023 at 08:57:17AM +0100, Conor Dooley wrote:
> On Wed, Oct 18, 2023 at 12:34:01AM +0000, Kuninori Morimoto wrote:

> > > That seems like a very unintuitive interface. If there were 32 CPUs a=
nd
> > > 30 codecs, then it'd be very inconvenient for a human reader to grok =
the
> > > configuration.

> > I don't think such huge number connection will be used...

I suspect that if we run into systems with very large numbers of devices
on a single bus they'll either want to do something more dynamic and use
it as a switch or be very regular which makes writing things a lot more
manageable.

> Your binding allows for that though!
> I really don't like the number of elements inverting the meaning of the
> property.

I have to say I'm not a big fan of that either.  It might be easier to
map each channel to a slot number on the link, each DAI could then have
an independent map and the kernel could compare DAI slots to join things
up. =20

--6a3rttStc9U4TCn4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUwIv4ACgkQJNaLcl1U
h9D+8Af/S4jMsPVirXuX4PyvmGux12iiyC7NaZ+7jP4zLFKHWVhrm4DWkGe9bNiW
iGeelPWcgE17AVNBkIPLdb6EP6GNiaESxJl4j2RgzHbKY0VQkrKZdqK2Mnm9RMAa
n2KQ2+7xM7JvspApaG+yu6TvLFqKPxCUS/VV65dfdcbei6lI4aKmt/aQFd8ZuhvC
cvSFH7/d1YnvYKB8YI+7DBFcoG5ZiXfKe1kVNUaMmfYGM+6KTvIV5y/7aSqzLApp
BO7B3o1YwCO4K2JKV4vg0keZNopxufaKAD2T8xmrZZmmiXouUdidHlbHEOex9621
wyBsHSbMHCkABSmEijwdVJjitIZzpg==
=+teJ
-----END PGP SIGNATURE-----

--6a3rttStc9U4TCn4--
