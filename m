Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A047964DB60
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Dec 2022 13:40:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29D2A219A;
	Thu, 15 Dec 2022 13:39:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29D2A219A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671108047;
	bh=U9NtNlqryxVKKy+CkPYgv3kx1LVUpLwfsFY1Xqn7gWc=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=g0GUNVeqI6LFM1STHoZQjYMGEwJljOX+YGCzg7h7UViP6nJn4KolXLl4IaM4ZXLJq
	 23srDMGyyrOZOAtOZ2uy+tQ7qthyCHMtjOaeeGOr/WioBMFnVVDNAqeE6J+rnmb8g2
	 pmy6ZWbUbrG2LxwdtkpRE6jT5c9fSo3WkrmsLhrc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCA36F801D5;
	Thu, 15 Dec 2022 13:39:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 073D8F804ED; Thu, 15 Dec 2022 13:39:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F404F804CB
 for <alsa-devel@alsa-project.org>; Thu, 15 Dec 2022 13:39:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F404F804CB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ds5pykkc
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 87E0F61DD3;
 Thu, 15 Dec 2022 12:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81630C433EF;
 Thu, 15 Dec 2022 12:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671107968;
 bh=U9NtNlqryxVKKy+CkPYgv3kx1LVUpLwfsFY1Xqn7gWc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ds5pykkcphu6gMoVoZj19lvnV5JhS+WGjNxIvWai5vDPam78gWCoQdY+NYJujww64
 oAPnyboo35qbfhazSA6DhxWfB4ENCjj/wPRkeLfLT9Nl7hkzo7JvaGVNKYUkohMSQN
 FSsCd0UzCbVb4p+7jhTcZ4SGySj+Yly3U8dejeS0s14DEBhAnL7CR1wpyalJ7Az9q8
 Fg0AuJpzbzPxi+CPSxqQMLuTd/AD0eT3SiJnlW63bgOgf05cxoYcF7q6o+Qp38bF/i
 gsZHbg8PCwVgJam4QR5ZjQHfXlLQsL7dP9F4342HSAH6wtNDY8ASKJ03WhttRmiFhN
 zi9u3gVKnr0uA==
Date: Thu, 15 Dec 2022 12:39:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 06/11] ASoC: dt-bindings: ti,pcm3168a: Convert to
 json-schema
Message-ID: <Y5sVewc7ItFBZkn4@sirena.org.uk>
References: <87v8mepyoy.wl-kuninori.morimoto.gx@renesas.com>
 <87mt7qpylw.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdW=_-MyqAjRqaoPyWkoUmdB2VOE1t+wpym7eyOxkzc_7g@mail.gmail.com>
 <Y5sJV2KfX98KoMYZ@sirena.org.uk>
 <CAMuHMdWwP6QDUux62GZtCT7tsFhAhex=Fns5e=n_KTjGXHRy0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Ii5OG8Rj0a5fA7tv"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWwP6QDUux62GZtCT7tsFhAhex=Fns5e=n_KTjGXHRy0Q@mail.gmail.com>
X-Cookie: Today is what happened to yesterday.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 devicetree@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mohan Kumar <mkumard@nvidia.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--Ii5OG8Rj0a5fA7tv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 15, 2022 at 01:10:44PM +0100, Geert Uytterhoeven wrote:
> On Thu, Dec 15, 2022 at 12:47 PM Mark Brown <broonie@kernel.org> wrote:

> > I wouldn't do that, I gather the maintainers for DT bindings are
> > supposed to be people who know and care about the specific binding in
> > particular.

> Sure.  But how can they (still) care, if we cannot reach them?
> There's no email message from Damien to be found during the past
> 7 years.

The most sensible thing seems to be to allow bindings with no maintainer
TBH.

--Ii5OG8Rj0a5fA7tv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmObFXoACgkQJNaLcl1U
h9BTfgf/ebWabKO2Bgc6GL1+Kakz/qNto5vytkLfc52MvuYL5WFYu1dfqYbyQ9jg
TRZBG7YdcdCMa8ZIlRdygIiWkltdYcJ5K2bCqxMWV5JfGBlA+vGc7o0omua1QG3y
snOmxdAckqn6KbF5rVERNFpiSN/C6hsh3UoO8uXrzs84Msn4a06/lDiNwEe66Knm
kRiC7K6T7pIA4vTZsESLoa/NFDpfTRTcchyBz0t57cFnd4+2O3JlPW2fYNe7xsw6
Md+ew3XApoq1afIPDfDuGjYb61WxbWM2JSDITC4Osk3eQBi8KNmphpIzyllmwqAc
G02hikQ7He9SFagvBpXcGTQ1Q7BmOw==
=3PdK
-----END PGP SIGNATURE-----

--Ii5OG8Rj0a5fA7tv--
