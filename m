Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E30576479
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 17:34:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E12BD1925;
	Fri, 15 Jul 2022 17:33:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E12BD1925
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657899259;
	bh=9aHm1Fu3V4PgkcOae+20k1x/4kckqaUx81hhfHgpEas=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ViBUyWDoysJ5co+x7H4RvetskBfQ63dR7zukKm2RA46FynO38z2UVEDTtuR+lrhwk
	 Pr3i5jkOlVBJE6x7+3zhNSeSWYaHpxA1juldUA9JRHh28CFNmMZ/riF1b+kDgP1ZY9
	 pRFGD+KCbwTZOMxaYmePvf7ZWMjJT2pvjKbpA62o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53888F80212;
	Fri, 15 Jul 2022 17:33:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 073C7F8015B; Fri, 15 Jul 2022 17:33:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98F82F8012F
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 17:33:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98F82F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cDw9C/OE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C7095B82B40;
 Fri, 15 Jul 2022 15:33:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59F67C34115;
 Fri, 15 Jul 2022 15:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657899190;
 bh=9aHm1Fu3V4PgkcOae+20k1x/4kckqaUx81hhfHgpEas=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cDw9C/OEmqdqfd+aWY52ugJk967wQveESgwRiptkC2sFO866Dbbow6rV998GZwwWm
 jQbrmdeP9Vg9/E0TH2Hx6oy3fLADYXF2BE9bgJDpaQPbh/RHlgywU8QPaa40Fi+/O1
 sQekSjokfj96p2EI+jpwIOtH5zTKoT43IlVEk/CD+7TkDO5CU80Q/a7KvGwPu+ueN2
 XJk8GhYjmGvBEZ6px+ZieaDFOQZYnNy5JlTwucHk/9OdxWYaZqBhGVefLEZ8SDRVNm
 /zhf0YuBXWsecuecRh7b8apTyXeCFVNhll2TdgVUtLrFRtUJV4RYqth8/LWq62GzgY
 aXQ1d2SFE2B+w==
Date: Fri, 15 Jul 2022 16:33:02 +0100
From: Mark Brown <broonie@kernel.org>
To: "li_jessen2016@gmail.com li" <lijessen2016@gmail.com>
Subject: Re: FAIL: alsa/Makefile dependency check
Message-ID: <YtGIrl/RIuI2TBps@sirena.org.uk>
References: <CAK0WjkiJb9_mTmTMWUb2dX-B6_52Fr4stxXrgaW=07RjfMzvZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fEtqbAyeOk6CacDc"
Content-Disposition: inline
In-Reply-To: <CAK0WjkiJb9_mTmTMWUb2dX-B6_52Fr4stxXrgaW=07RjfMzvZw@mail.gmail.com>
X-Cookie: You dialed 5483.
Cc: alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org
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


--fEtqbAyeOk6CacDc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 15, 2022 at 10:47:16PM +0800, li_jessen2016@gmail.com li wrote:

> FAIL: alsa/Makefile dependency check: $(shell
> FAIL: alsa/Makefile dependency check: pkg-config

..

> So I wonder why the FAIL info appears in the presence of *$(shell
> pkg-config --libs alsa) *in alsa/Makefile. Is it some sort of bug or
> did I miss something?

I think that's a bug in this tool you're running - it's not
understanding the $(shell ...) and generating false positives, not 100%
sure what it's trying to do but it's fairly clearly parsing every
element in the statement as a dependency of some kind.

--fEtqbAyeOk6CacDc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLRiK0ACgkQJNaLcl1U
h9CkCgf+L4Jui8awFZT9usl0KInbgUG5TQ68toB0FGI/85vtxRbjTRFsOLheddam
QRSnLA2AaCyZID+nsneRsxV7y7HbIBmuLKMiMrpJxCc0cbqxxHlHUZuhQ8VWhH2Z
Kwg0WRRTmn2JoicAV388LcKAQw2KOulViwnpjPMFm2lPkYO6OWoCDHfGbtEvu9YV
aPH361LmJY75jNhYFhQ44Kc3ZAVXAm1qt0VRrYo8ZSXWMISEJgm+3ZYhcu9eFrEz
eh6uwcDkbsjMDTbH/+smHbz4uCSDHdsjd4XTuDI5g8Ul15cwWsbuL3KizZBnFT0F
ZufXcvuBNC/dBvSgGpr9P2gEPiSHUQ==
=sura
-----END PGP SIGNATURE-----

--fEtqbAyeOk6CacDc--
