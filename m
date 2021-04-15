Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9806360FFE
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 18:19:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 685BC167F;
	Thu, 15 Apr 2021 18:18:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 685BC167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618503586;
	bh=TmC1IQHS1RYCuzCjSF/kPNZCXV/1xAOTKEBh9ar9brU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P5gCHXUikqFT8bknPcOCOJ8I5JRVwZs2R6xPmaS1JWXcYhSft4hrGqRkLRilawfhD
	 5zr2r8z6EMHIEsbzLqFo7TBsgKGvdknLsPOgAqAI+Noyctay1eA+fV9TsR9tNfOUY6
	 Pr821ogMLP7DJaHi73M93MfhvdMjd1VCD0RRiMFQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3A14F8022D;
	Thu, 15 Apr 2021 18:18:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D5A7F80128; Thu, 15 Apr 2021 18:18:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A567FF80128
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 18:18:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A567FF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ub8vMSiR"
Received: by mail.kernel.org (Postfix) with ESMTPSA id F02446115B;
 Thu, 15 Apr 2021 16:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618503486;
 bh=TmC1IQHS1RYCuzCjSF/kPNZCXV/1xAOTKEBh9ar9brU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ub8vMSiRxKNFK170DWbsNpCrmVTcRmruBiWXRaDFcYo9hF7DksN8llVMygQ7d0J4+
 yy91n8KTH6bYkMWu9rZ967MRdMG88tSl5bGLZmFV/hvLowL4TpnAqbqjYroeMUH33q
 oUOHXK+urSUqXPy8ZzQKgDMtTIpLxY/MgJdJi+t3tJSH1DIDUituhwzm01h7qN1n0q
 BX385pRag81rJqjzZ0C9oEqwY8U8Svxo7zN66gJiQUeHhJ1hG8mkKinGLny9jx8LHu
 tlDi5SpfHPfQdEoIFfxUT8iWPKTgUGJaj0uBg6vjksAr+O2Gnq6hvgwEQIsN3mvKCh
 wSIzdFcMYxkKA==
Date: Thu, 15 Apr 2021 17:17:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Codrin.Ciubotariu@microchip.com
Subject: Re: [RFC PATCH 0/3] Separate BE DAI HW constraints from FE ones
Message-ID: <20210415161743.GH5514@sirena.org.uk>
References: <20210323114327.3969072-1-codrin.ciubotariu@microchip.com>
 <a0c862ec-44ba-52e0-551c-0347166ac4e9@perex.cz>
 <5e1fb981-48c1-7d5a-79a6-ba54bac26165@microchip.com>
 <4f401536-5a66-0d65-30cb-7ecf6b235539@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="WRT3RXLOp/bBMgTI"
Content-Disposition: inline
In-Reply-To: <4f401536-5a66-0d65-30cb-7ecf6b235539@microchip.com>
X-Cookie: VMS must die!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, gustavoars@kernel.org,
 mirq-linux@rere.qmqm.pl
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


--WRT3RXLOp/bBMgTI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 14, 2021 at 02:58:10PM +0000, Codrin.Ciubotariu@microchip.com w=
rote:

> How about using a different API for ASoC only, since that's the place of=
=20
> DPCM. Only drivers that do not involve DSPs would have to to be changed=
=20
> to call the new snd_pcm_hw_rule_add() variant.
> Another solution would be to have a different snd_soc_pcm_runtime for BE=
=20
> interfaces (with a new hw_constraints member of course). What do you thin=
k?

I'm really not convinced we want to continue to pile stuff on top of
DPCM, it is just fundamentally not up to modelling what modern systems
are able to do - it's already making things more fragile than they
should be and more special cases seems like it's going to end up making
that worse.  That said I've not seen the code but...

--WRT3RXLOp/bBMgTI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmB4ZyYACgkQJNaLcl1U
h9AydQf/elP8e5y2Rm/NSzV4RiR3KwwNw77ME5V2y+EN09TS7n5uXp7wYsiMCawT
55a3w2sy7ptihU413CYFHA1PepvHIAboGCpAqD/bpTTERQ2Cjh3VrpTNZVbOielO
zZUEO4eUZjU183jsHP+Dn2CpTpt4Hy6ud9icwHqg8qVjHx2TL9yaTzCtD9yi6yND
jsw5DzA43SNy5EnDGcW4O6eU8Uu33v1bNsxPJteqnuVtJ23eDrZ24lAjNF5fytuz
EUw6G/EgcW66sNtLwfc00urm11UPOyRa1zssiQuFxNbrkuZEbJ6wbKqNC7xN0/Mu
lbg0FchJftDPVI1snlP8fvxXuqbGYg==
=cMvM
-----END PGP SIGNATURE-----

--WRT3RXLOp/bBMgTI--
