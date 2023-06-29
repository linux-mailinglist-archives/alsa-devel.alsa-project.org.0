Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 956DD742A73
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 18:17:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 878577F4;
	Thu, 29 Jun 2023 18:17:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 878577F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688055470;
	bh=RyrvUeSls0qvEKZJFoV24QIDqfyNFR3a9bEQhu56rhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f63Vjt0bdzKk0Wps+9GuWpy3f8BYpIp/nCsYwURXDBy0zWL89YRpUeILIhL5kRwQw
	 9pOlah0Dwo7D2LDZjUY0bXVYnSx2I71s/uxetAe6fFYp/qNxiuuhrD2BaYPV0KMESL
	 8glpdvnEAlwCIKWHl5C+tTMX210XijIipFOu3AnE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCC3AF800E3; Thu, 29 Jun 2023 18:16:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C5FDF80212;
	Thu, 29 Jun 2023 18:16:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08A9AF80246; Thu, 29 Jun 2023 18:16:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9EB52F800E3
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 18:16:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EB52F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=i1/e5Mlx
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8C6C161512;
	Thu, 29 Jun 2023 16:16:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27D71C433C8;
	Thu, 29 Jun 2023 16:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688055412;
	bh=RyrvUeSls0qvEKZJFoV24QIDqfyNFR3a9bEQhu56rhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i1/e5Mlxfsmwuko+4qXrz9N4uq2VK/X1Fk2A4GyX1SoMGZXg6YAYLjnC4s/tdwImf
	 gQeOzq8r66+glvUi7Cafu3rcunkJzaBRr2GDZDzAfuCAeEIdDRMIjtKbH06QB0NlL7
	 u6WcqL7EDUviSWEdGlNosZ50rn/ocLoT1+iv3tPfSKZ9BNLFpjOrarKi0SUDvmMTER
	 +pRP917Z08QQzGYBeInW4oej+M+aOzUThA1N/HwVrTnA/YQtEZZX6RvrzucosebSDc
	 LhP7fHdU5qs/B1uRbg1kLb3p519Q+EQ4Q43EvtuhxMwGTviphgBJGbJ11WGgjhlObY
	 RnjBO+5vlalXg==
Date: Thu, 29 Jun 2023 17:16:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	johan+linaro@kernel.org, perex@perex.cz, tiwai@suse.com,
	lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
	Stable@vger.kernel.org
Subject: Re: [PATCH] ASoC: qdsp6: q6apm: use dai link pcm id as pcm device
 number
Message-ID: <9699a960-74b0-4064-b264-6cde06cd16fc@sirena.org.uk>
References: <20230628092404.13927-1-srinivas.kandagatla@linaro.org>
 <c22fcc94-aa41-4ffd-bfe8-f0b9f15a76c0@sirena.org.uk>
 <2023062940-snore-brick-419b@gregkh>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="waVp8T61GontOc/b"
Content-Disposition: inline
In-Reply-To: <2023062940-snore-brick-419b@gregkh>
X-Cookie: Surprise due today.  Also the rent.
Message-ID-Hash: VGIF4X46LDGMIOZ2XOPBBPHEP2JTGCTP
X-Message-ID-Hash: VGIF4X46LDGMIOZ2XOPBBPHEP2JTGCTP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VGIF4X46LDGMIOZ2XOPBBPHEP2JTGCTP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--waVp8T61GontOc/b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 29, 2023 at 06:06:05PM +0200, Greg KH wrote:
> On Thu, Jun 29, 2023 at 04:43:57PM +0100, Mark Brown wrote:

> > Won't this be an ABI change?  That seems like it'd disrupt things in
> > stable.

> ABI changes should disrupt things just the same in Linus's tree, why is
> stable any different?

This is a numbering resulting from enumeration thing so it gets to be
like the issues we've had with the order in which block and ethernet
devices appear, it's on the edge the extent to which people might be
relying on it.  If it's causing some problem as is and there's a reason
to do something (see the first half of my reply...) but the case gets
even harder to make with stable.

--waVp8T61GontOc/b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSdrmwACgkQJNaLcl1U
h9D4vwf/fXMdNGrJPn2JH9J6748ugvE0hNd8LXepjctqeXsD5EzrA7KlHE+5Hcqj
FTGN1gBEhcjOp9fSqdi/mELLWVe2MXlYtyXv5iO5RU2Z9OJu1XjrSM6Jnx0ljKnu
D5oXlY6ai/ohFCHiOO1Zbk1pDyLeUvfG+D/bAOWroHjlQVPYXZwKxINuwK1MfeAj
wEWnl9DMSGWK6/PN7dNtapwreM1RN+a5k7REd9jFH4jVPBmX17YhEYBBEb41TBVR
u7fZZBEYo0Ja0TfAdEc601yfdqpe0N4AAL+aav/EaMA93JVnhhvugFqbFxIc6ArF
1x/LABsliWTKZpEoKyjLdGRba/zVUw==
=W9gZ
-----END PGP SIGNATURE-----

--waVp8T61GontOc/b--
