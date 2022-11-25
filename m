Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71696638EF2
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 18:23:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07AAC1754;
	Fri, 25 Nov 2022 18:22:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07AAC1754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669397006;
	bh=d0urDLI5NxzyVTnv8OatpL68VU2mJ/46Kljqj9ZcblU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ioZwT4Gj+8xrpbpkrY/h37Izu2E03pFKWH98zCwdupa4HjoEuJ/6+i63IRyY/sBIx
	 mlCt4c/c6yqyfERL926QLPABe6VqrXTuwHv5DwKDMRWbzF9d8YEKwjF/DAfXqZ1lZ9
	 uvaM8SwH8uVsaWBrLgrloMGzGNBHc3ijAWkWx2XY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABF8EF8047C;
	Fri, 25 Nov 2022 18:22:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30AACF80236; Fri, 25 Nov 2022 18:22:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91D1DF800F4
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 18:22:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91D1DF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rL2pH4Cv"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D7FFECE2EED;
 Fri, 25 Nov 2022 17:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90CE3C433D6;
 Fri, 25 Nov 2022 17:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669396941;
 bh=d0urDLI5NxzyVTnv8OatpL68VU2mJ/46Kljqj9ZcblU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rL2pH4Cvby5RGJJx3K0u/2kbiYb28b/2Dnod9tBsqCx2oC+Mj1NhIWuNM5CaWik1E
 +5NkDBq/PbzG8iBXA1NMS4KJCLBLXad3v/3xQKm9SZkmX68SJk88XF3VXp4sLb3A36
 hJSyOcHhbgU989J62wgp3XrlE2l16ajTrB95VPnZBd6kMH0R2zsLRMG/8DAm9RUu/4
 s+OjjqRjx6F4PSdkxzskRGtimHrsTZzGb6otIwnwWg39vORf6xi5XM8NvUOHwI35mI
 7W1H5j7NnsYy6u1NB2lUlpvJj56kZyMyInWB1IduD24J8sZyb3yo3dlGvUnRp5Adss
 Uvjy1HQxldANg==
Date: Fri, 25 Nov 2022 17:22:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: Unable to open hostless PCM device after introduction of commit
 - ASoC: Stop dummy from overriding hwparams
Message-ID: <Y4D5yGfvZbgAZqqm@sirena.org.uk>
References: <6b152096-608c-1b3c-e1bc-f83149af1198@quicinc.com>
 <7b383dde-e391-b4c8-1087-fd6105bfb852@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="HUl3QIjGhIGNJsM5"
Content-Disposition: inline
In-Reply-To: <7b383dde-e391-b4c8-1087-fd6105bfb852@linux.intel.com>
X-Cookie: Time and tide wait for no man.
Cc: alsa-devel@alsa-project.org, vinod.koul@linaro.org,
 Cezary Rojewski <cezary.rojewski@intel.com>, srinivas.kandagatla@linaro.org,
 quic_rohkumar@quicinc.com, Patrick Lai <quic_plai@quicinc.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--HUl3QIjGhIGNJsM5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 21, 2022 at 04:29:19PM +0100, Amadeusz S=C5=82awi=C5=84ski wrot=
e:

> And finally "snd-soc-dummy" which as mentioned above calls dummy_dma_open
> which originally overridden hwparams set in avs_component_open() with its
> own limited ones.

=2E..

> However, looking at it again, I would consider the existence of
> dummy_dma_open() to be scope creep. If component is really a dummy one it
> should not affect any other components in any way. And if any drivers
> depends on dummy setting parameters for it, I would consider it partially
> broken. And would say that issue should rather be fixed on driver side by
> making a dedicated component for it instead of using a dummy one.

That's not such a clear statement in this case.  The thing with the
hostless links Qualcomm are trying to use here is that we don't actually
want to do any DMA ops at all, these paths never go to memory.  Really
they're CODEC to CODEC links but done in an older way.  There's only DMA
ops there because we need something to keep userspace happy, they don't
actually mean anything and we'd never want them to be used if anything
else is providing actual parameters.

It would be cleaner if these systems were to use a CODEC to CODEC link
but I'm not sure how well that plays with DPCM - the whole thing is a
bit of a house of cards there.

In any case, any news on a fix for this?  The suggestion of a
custom/variant version of the dummy component that explicitly flags that
it's supposed to be used in a hostless configuration does seem like the
least fragile thing.

--HUl3QIjGhIGNJsM5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOA+ccACgkQJNaLcl1U
h9CUkQf/SB+F/fJRMkW/r8eddijO5Ln3I0fISd1tXTRik+cP9XteKX6wTXe4QHeB
uPUEKoA4w9btnikUh5TR79Zi6EzRROBDYPR9LHu9WhEmfsUVRaP5BhpO53UTMNlh
kRDGc+af2gxk3p+I58Tt+l+kUz1+7Yv9v48C354dPuak+Iseclzp6oKBjBS5GSAe
D4Iy1V1XrYF6EOB095zbL0Gbi0Xl4vinJCx/XTIYD/b5sgsvmKZEQMfwjzmKrmee
WwePtPsx1ARZr5MagPizfMqvX0wtHXRrV0R2vZZ2br/Q1+Zu6GrM7GpMD/5GMt5Y
SmD18kWR8r8v6dy+bZ76mQImNVkYCA==
=G2Ly
-----END PGP SIGNATURE-----

--HUl3QIjGhIGNJsM5--
