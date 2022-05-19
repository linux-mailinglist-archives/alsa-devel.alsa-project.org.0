Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CBC52DE16
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 22:08:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80E8117F5;
	Thu, 19 May 2022 22:07:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80E8117F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652990911;
	bh=VjzLZNFWnq32OoJjiMnVfMTg9IEgi4OMPr67a9sVT3I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kXfLaP0X30KZGP8cMtz73AEirPS9xN/Edx7xrrXBabp3Rz/uzXDRVBcMfQf6+DVQ8
	 6QKLZmBDTqL+G9o6tN6OOkf+DnBTMH7gp6ro1f8hUEcDDCmtgzQc4PDsv6QI2LHMbD
	 ZGlb4lbwvJx5oYfP1ZvyLoAv++8vAMe7KHETx3VA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBA5CF80269;
	Thu, 19 May 2022 22:07:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C04C8F8025D; Thu, 19 May 2022 22:07:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98596F800D1
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 22:07:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98596F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="q7JCdV/7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CB36AB827DC;
 Thu, 19 May 2022 20:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 032B7C385AA;
 Thu, 19 May 2022 20:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652990847;
 bh=VjzLZNFWnq32OoJjiMnVfMTg9IEgi4OMPr67a9sVT3I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q7JCdV/77UEkDqiOpRsCd+YOdaFP5aV4PZSTcuZs5m4pwtuUuzfC0UK76GwekffzR
 h+cFXDQw9e46VY4aK0TjDV5DtodUPSgG/qJQUgdGR3wGNzcG1FKqjPKuYmNPD/v1xN
 UzgAUs0TP/8hbnRaz/8LYvKF4WBeUKZcUJUPKwrFl9RDr+hpYELOHr0ygH2KHD10jo
 fci8ilsYXqWMhMIwjH1IvrTFXCyOohou3d4FlxkM5CnTehuiwi5UO1vroGzil4+Zq5
 ve8OJOL0ljGdLL9XDzxEmBTo2RIGenwYIwxZ7pxltyJoGxybFEr10gWl88FjrH65s6
 rshP6r3hP236g==
Date: Thu, 19 May 2022 21:07:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexey Khoroshilov <khoroshilov@ispras.ru>
Subject: Re: [PATCH] ASoC: max98090: Remove unneeded check in
 max98090_put_enab_tlv()
Message-ID: <YoajesD+D1W3ZV7/@sirena.org.uk>
References: <1652980212-21473-1-git-send-email-khoroshilov@ispras.ru>
 <YoZ+dmprwb5Ohto3@sirena.org.uk>
 <fd58c07c-488e-1c90-a755-194f714bbe45@ispras.ru>
 <YoaEXWGEY4s14je+@sirena.org.uk>
 <ce6853a9-6789-f151-3193-59b7dd73bd27@ispras.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jJAdLz6GK64fEyDl"
Content-Disposition: inline
In-Reply-To: <ce6853a9-6789-f151-3193-59b7dd73bd27@ispras.ru>
X-Cookie: Some restrictions may apply.
Cc: ldv-project@linuxtesting.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
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


--jJAdLz6GK64fEyDl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 19, 2022 at 09:27:25PM +0300, Alexey Khoroshilov wrote:
> On 19.05.2022 20:54, Mark Brown wrote:

> > Oh, the check won't be working properly - it's just that like I say the
> > fix is to move rather than remove it so it's operating on the signed
> > value.

> Do you mean something like this?

That looks about right.

--jJAdLz6GK64fEyDl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKGo3kACgkQJNaLcl1U
h9Bajwf/eGaouPOu8j/aU4kLc3j8bxbcRDfzLtUFL2wwu3VPEXy8/ToXspVWxomp
JfUUtlcpdCahhDwSJ0uZ2aKUkWwmbPhjKH6iUrz2Kn/a4+m4MhROZMRUf1VAj+O8
r8YFZ6arWauRMQRPSVWfznlJlvnipMkfUMzFwYR0DeCWOt8+wrbybaEvFx3bQVG5
z0SMkWqoR75sL4e7lhy+aW+uENAMND8ghqbZu3+uxhvKdhkHEMlj/pHoj5AeAGya
FjP+osfPtRa6nR0kM373UhZHyADEV/A16xLf6ttYbn1m6/g2mPAkypZ5axYaAnAM
8XQvvNrRZkoQqKQijhGeztx0I+0LjQ==
=/nHu
-----END PGP SIGNATURE-----

--jJAdLz6GK64fEyDl--
