Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F2952546F
	for <lists+alsa-devel@lfdr.de>; Thu, 12 May 2022 20:07:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDD7E1ACD;
	Thu, 12 May 2022 20:06:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDD7E1ACD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652378833;
	bh=83vUfm3ZikxPpHjFp109l55fFYJKEUuIno5M1ZN/WrI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HPu8XKLEkba/RqecdF6BZkkIxwISwU9L01vUZzSZOdUl6oSCpvlbpiGIyi5H7c8rV
	 WbT2CyKZw4WKWchDAungzJnUSiSfCb+hL92fwZaQoCg5PzKSq6GpqZtjZZgOXhK2R7
	 03qRRFLV+LDaC2ycgRHL8J/O142cVJDUXeDduTow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66E88F80154;
	Thu, 12 May 2022 20:06:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C06CDF80245; Thu, 12 May 2022 20:06:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34537F800BB
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 20:06:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34537F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RvsSdlLp"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DD6D9B82A74;
 Thu, 12 May 2022 18:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFAFCC385B8;
 Thu, 12 May 2022 18:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652378766;
 bh=83vUfm3ZikxPpHjFp109l55fFYJKEUuIno5M1ZN/WrI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RvsSdlLp6edX0R2ymP2p1B++RKmfgzVI6zVB2AdeTG1rSpp4vvMhO0Cq94XCEGVM7
 16IEtXt/01gClQBGV8Yn5+i8dAEpiFsN7tZJavAXUGX6AlTlfyDBnZRDhg35eoHRJ5
 NfEqF0JIIwUD8pM+j/wKSTh5DIjZeK7cts2G0lsfg0MeO4yPaekwQUpAPhVkEo9wR/
 aXwAVrMgZ2wOzWtCOMyITv+arL8VkuUz35htwm+6HAgjZWdGZVEj5+Ahnq+BM5jwqP
 LwLbU0ccs1QgIC7fMymciBOHCnhyFyWd+XItpdaHrClNx98N2U5p/wl2VrL/YRRSHl
 49o5I8CXtqYyw==
Date: Thu, 12 May 2022 19:06:01 +0100
From: Mark Brown <broonie@kernel.org>
To: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
Subject: Re: [PATCH 1/2] Revert "ASoC: amd: acp: Set gpio_spkr_en to None for
 max speaker amplifer in machine driver"
Message-ID: <Yn1MiX/Ie3SJg733@sirena.org.uk>
References: <20220512154023.1185311-1-Vsujithkumar.Reddy@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="XRdbk5RIeb/De7+r"
Content-Disposition: inline
In-Reply-To: <20220512154023.1185311-1-Vsujithkumar.Reddy@amd.com>
X-Cookie: Oh, wow!  Look at the moon!
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, ajitkumar.pandey@amd.com,
 Vijendar.Mukunda@amd.com
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


--XRdbk5RIeb/De7+r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 12, 2022 at 09:10:22PM +0530, V sujith kumar Reddy wrote:
> RT1019 codec has two ways of controlling the en_spkr.
> one way is controlling through gpio pin method the another way is through=
 codec register update.
>=20
> Now Speaker enable/disable is controlled  through register update in BIOS.
> So this patch reverse gpio logic, which is no longer in use.

Surely this needs to be keyed off BIOS version otherwise we'll break
things for systems where the user hasn't updated their BIOS?

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--XRdbk5RIeb/De7+r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ9TIgACgkQJNaLcl1U
h9CLpQf+Lhj94+VvxLgNWw1WXO8prMykqoePk0vwe0mGpV/LE7ggzbAq4vyGqvU7
usn/3CHfVhy21WDvU3MTl9Jwm/NclV2SgfYePB9ALJ1mPhJLvBnqOViNfVv8L54G
3chRQbgVvjVMKbsdV/8xRX/xkVT/pHnrCCQSwOBVV72fcKXqd+3SWi3/5AZKfwE4
nSL+JiYWtI6kMpoXsIyPN8XhXFm6UnMDKRNMLeHj+WYgLw6SS5rl63xzyE6erapL
Uknw1G7nY8mrT4K7V29m38Yru0WMKaDXpIqZyJE14NZcZ+uKoeMK7uJCAenxdyGp
p7mYwOP05Mvnfnyxe7zsdIj6IYRv4w==
=FzUd
-----END PGP SIGNATURE-----

--XRdbk5RIeb/De7+r--
