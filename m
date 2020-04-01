Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 911D019A797
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Apr 2020 10:41:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 456D31677;
	Wed,  1 Apr 2020 10:40:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 456D31677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585730469;
	bh=bCAkbcSaYfiEPE7qWQeomak3DUc5F4qOM0M2cfGxkEc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=faBZakmvCsb3BZkh8XiR8KXvc/YKim0bNh6FS+FadtSdWLzlk+9t+WLwRN6d3WGz8
	 fGcWfreHLABli2+1R3X/5oeLV4M6jNCUuiWTmO57SR7/CJCMK+qqDlwCcIyHFbiFmW
	 9erxYuylN61BYRaGA9wK02OMFQg6R+Gd2fGIG060=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85E1EF8014A;
	Wed,  1 Apr 2020 10:39:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4246F8014B; Wed,  1 Apr 2020 10:39:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id CC4BFF80110
 for <alsa-devel@alsa-project.org>; Wed,  1 Apr 2020 10:39:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC4BFF80110
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 335D831B;
 Wed,  1 Apr 2020 01:39:22 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A77653F52E;
 Wed,  1 Apr 2020 01:39:21 -0700 (PDT)
Date: Wed, 1 Apr 2020 09:39:20 +0100
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] ASoC: rt5682: Fix build error without CONFIG_I2C
Message-ID: <20200401083920.GB4943@sirena.org.uk>
References: <20200401082540.21876-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="E39vaYmALEf/7YXx"
Content-Disposition: inline
In-Reply-To: <20200401082540.21876-1-yuehaibing@huawei.com>
X-Cookie: The Ranger isn't gonna like it, Yogi.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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


--E39vaYmALEf/7YXx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 01, 2020 at 04:25:40PM +0800, YueHaibing wrote:

> -static const char *rt5682_supply_names[RT5682_NUM_SUPPLIES] =3D {
> -	"AVDD",
> -	"MICVDD",
> -	"VBAT",
> -};
> -

I imagine that the device is going to need power even when use with
slimbus, even if the regulator support isn't wired up at the minute.
For things like this __maybey_unused annotations tend to be better,=20
this stops warnings about things not being used but doesn't need ifdefs
or big code moves.

--E39vaYmALEf/7YXx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6EUzcACgkQJNaLcl1U
h9ANrgf/f7gocQPtQBlwwICg0sIaoabV0i7a4QjmUQl+hyL/r1q0weR9P42brmMZ
EQwcm89LZOJJG8pLSonMGPeoIH0gePFlBqN4AbFl0h+uUBDfvuSZbuFnZS+AEVyd
pa2KTzaM3LAbzuwfAH0R8AkWn2WE9LmetNEGuWluP4yKYsRWLNmGsalDm/kw7ww7
zexY9Z9eOZZddfn2PBAWfqHcy7HFFXy0bB4rG2LR6KevIGp+8ZwJvs5BwllnpqiU
/O6tIY282GqwsuPFg1nktHVgUP35cQVkAF+mjddMvPI3pGMdYvAdd3YWcGmwOzJr
ZXnMzVEKsd1L8e4v9nty0/z7Fk7YUA==
=lx3U
-----END PGP SIGNATURE-----

--E39vaYmALEf/7YXx--
