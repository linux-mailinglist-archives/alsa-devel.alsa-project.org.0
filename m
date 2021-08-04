Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CB23E06DA
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Aug 2021 19:39:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 599C31691;
	Wed,  4 Aug 2021 19:38:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 599C31691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628098767;
	bh=7EfYknk6uq+SifGYvcFWeYzpHthr9+bUaWN104v666g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GbU+WVXDRW7mnCxmpqHAdOtfzhTrKGguUk6ODpQoxSGvt345SnSktvYy+1qiU3LGW
	 KAXwmR3+JPwOBW+TVkZFIfzzzUSsA7vznvyjSNLpFYEIM9b7l/OSbncyPnT/5CyVrG
	 arfsbU8U8gM3uB8uYgTEktqWcXJwZJRq7parRJwg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9089AF8010A;
	Wed,  4 Aug 2021 19:37:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E47C0F8025F; Wed,  4 Aug 2021 19:37:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 893CFF8010A
 for <alsa-devel@alsa-project.org>; Wed,  4 Aug 2021 19:37:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 893CFF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cZJbmLST"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F77860F35;
 Wed,  4 Aug 2021 17:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628098667;
 bh=7EfYknk6uq+SifGYvcFWeYzpHthr9+bUaWN104v666g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cZJbmLST2mWitiCZBBOnf1Z60d/9ABrQ6BejQJn3G/7tZJz0gq8EH/a63UpGjRSgz
 D1rVcZ/gTOZFc/eEaLa6hjn30blTMjF9KtwMC9AIjMBGg9Ia/H9JCnFdTqWpaIHPad
 W1CeK2EE+PPKXHSMdl5xsqCTMXNSrit+/zmZ/s1bhe9qcVBMb404Lman1hahLad3VA
 8Eq/VFjLkJXg2THQk0wZ1sDql/smmHSdn/xAfkpsU5Cy++BmhoeOc5MnsorQEnDlNi
 UVg43lkc8a9kf2dgKyicvcE0eYP4M3NG66kCC3QUfISpUBy2UfSwQJl4iMJjGx7/fQ
 SSKUzNhBGlHMg==
Date: Wed, 4 Aug 2021 18:37:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 02/14] ASoC: test-component: add Test Component for
 Sound debug/test
Message-ID: <20210804173731.GD26252@sirena.org.uk>
References: <87a6mhwyqn.wl-kuninori.morimoto.gx@renesas.com>
 <877dhlwyoz.wl-kuninori.morimoto.gx@renesas.com>
 <20210803170817.GP4668@sirena.org.uk>
 <87o8aeulpt.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6WlEvdN9Dv0WHSBl"
Content-Disposition: inline
In-Reply-To: <87o8aeulpt.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: MOUNT TAPE U1439 ON B3, NO RING
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, robh+dt@kernel.org
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


--6WlEvdN9Dv0WHSBl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 04, 2021 at 08:55:58AM +0900, Kuninori Morimoto wrote:

[Verbosity flags]
> I'm assuming that "verbose" version will be used for test/debug purpose,
> and it is needed for boot-time too.
> Thus, switching it runtime is unfortunately not good.

I was thinking about something like a command line option so that'd be
fine for boot.

> I'm OK to use flag property for it if DT rule/maintainer was OK.

OK, let's see if Rob has thoughts on this.

--6WlEvdN9Dv0WHSBl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEK0FsACgkQJNaLcl1U
h9AqpAf/YjX9xf76GWKcBkhwBfHcHUHPocWSE89iSZXcpXGGSZlz6QevQNkG6WJ6
5xl9B9G2UVaxLDzcTqBqOuDNFvUqfbi2MAm1lFF7reHOnKu7qPebJXFx0zkcSecJ
5yvLVDZQ9iUSqzGCNX21kHVFYEHGcImzFciNXr/XTu9zcfd5mST+pA/Teg9iSsu/
LPdsFDzcDIdHSrrcPm75Ub6lQbsIkJf9Wyw2M5owTFGZeQEuFmtl15dK8DdEtCQ/
04ry5OxBwbX7TVNpsq+/2zmzES1m3EF4gJEhgCOeBZDHzGEOyoA8Tab7pP7nGUq3
4Sg0kZ4TevMlIfg1OQNWpBz2EZYloQ==
=Vo9u
-----END PGP SIGNATURE-----

--6WlEvdN9Dv0WHSBl--
