Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C05B3625B2
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 18:33:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F24E216C8;
	Fri, 16 Apr 2021 18:32:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F24E216C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618590816;
	bh=jur2fTEdYRNCY9C314G21CAjYJzcRNFZKz3QbNsHrdw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fK+8dnUcuazTfW3fEm0lb7MclviVPDKpPf019BqiMT0V3EtvEoEiZCmIRuCNzyTZa
	 3rb+pU53obKRtmRRL7WKi1Y7w9Q1fgWri52RGLdzfWq78fDyhXlvlhkCGqAi6FyzGx
	 swg6Nwg5lXlj9n2EZkpHfgMGptXsmtzbvDhhhhbQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D2F7F80271;
	Fri, 16 Apr 2021 18:32:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9908FF8025B; Fri, 16 Apr 2021 18:32:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BCF7F80128
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 18:31:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BCF7F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SQ2M3ReX"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3618861002;
 Fri, 16 Apr 2021 16:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618590715;
 bh=jur2fTEdYRNCY9C314G21CAjYJzcRNFZKz3QbNsHrdw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SQ2M3ReXMpR06PJpEQU1pIiWAML+ojYlvdMpWtZb/6H63Zqh6KzyNlLHZUP6KJEQs
 /T6ufATom9vfHolMAM3+jK9RkdImi4MjQ7wDCPzHVovNwskoE4oL1CgJgaIyTzPwp4
 3jAalUaJZjxcURIwwMWZQEJeC0813m7D5sWfkAnkSskX0ykTqhDcph1f55A71TMj7v
 C84uSqwkbBW6Te65lXxLibl9uUgzPexzTluts03UW0Q08QihHgGKZpqcGJ/4r2Ks0P
 vsEJxsnC8csgLKEcpvTRULqwbFtH035ZT2E5PQyaZdn+4wZP7cvn0J+dGNo7KRv8dx
 +IOSaVG6A0RxQ==
Date: Fri, 16 Apr 2021 17:31:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Codrin.Ciubotariu@microchip.com
Subject: Re: [RFC PATCH 0/3] Separate BE DAI HW constraints from FE ones
Message-ID: <20210416163131.GI5560@sirena.org.uk>
References: <20210323114327.3969072-1-codrin.ciubotariu@microchip.com>
 <a0c862ec-44ba-52e0-551c-0347166ac4e9@perex.cz>
 <5e1fb981-48c1-7d5a-79a6-ba54bac26165@microchip.com>
 <4f401536-5a66-0d65-30cb-7ecf6b235539@microchip.com>
 <20210415161743.GH5514@sirena.org.uk>
 <1aff49d4-5691-67cb-3fe7-979d476f1edb@microchip.com>
 <20210415172554.GI5514@sirena.org.uk>
 <ad5d556b-601f-c6f6-347e-86a235237c02@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+ZmrHH5cGjskQnY1"
Content-Disposition: inline
In-Reply-To: <ad5d556b-601f-c6f6-347e-86a235237c02@microchip.com>
X-Cookie: Snow Day -- stay home.
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


--+ZmrHH5cGjskQnY1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 16, 2021 at 04:03:05PM +0000, Codrin.Ciubotariu@microchip.com w=
rote:

> Thank you for the links! So basically the machine driver disappears and=
=20
> all the components will be visible in user-space.

Not entirely - you still need something to say how they're wired
together but it'll be a *lot* simpler for anything that currently used
DPCM.

> If there is a list with the 'steps' or tasks to achieve this? I can try=
=20
> to pitch in.

Not really written down that I can think of.  I think the next steps
that I can think of right now are unfortunately bigger and harder ones,
mainly working out a way to represent digital configuration as a graph
that can be attached to/run in parallel with DAPM other people might
have some better ideas though.  Sorry, I appreciate that this isn't
super helpful :/

--+ZmrHH5cGjskQnY1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmB5u+MACgkQJNaLcl1U
h9C7gwf+LLB68ItVQbC2IRYlF2Sl8tu40UQ5YKNuZNaWzg6h195x+OiLY3Wb5Ok3
h90k1H+NLLAj2VLjychn83Z6gS617Zmm9Ti41SjGp7glW2aCdzzPXkRlTUvuxYf5
alsSTimD5tFa5PqiM1YWu3l9BKVOrM9cG7qdNKHjaJDuEdiDUF1F80Xskey8/yga
7vO/kGT+0qmtS/oECPf2JSsYlPcWjKMS3Zph74/j70WlHWuSSf6iazxZUZW8eHid
6E3dM6KGD51C2ZqYgv9HzyDmd7lcAkpEZWAOSvVA+w91B+NSDCGiL8Ps5NBEwRdw
j+dYkIs39Iq8VrPxC7QP/a7IVea29A==
=3vRx
-----END PGP SIGNATURE-----

--+ZmrHH5cGjskQnY1--
