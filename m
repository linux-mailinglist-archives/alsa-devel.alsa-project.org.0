Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B609741988A
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 18:08:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D13E16AD;
	Mon, 27 Sep 2021 18:07:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D13E16AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632758919;
	bh=NmY4iLNblD48EfXVuBOk1k1y1Qzj+Md2ets+P1dvEok=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OP92+uRjrWO5YBRu7VgaICmQdqMnEYmygw/2fn79O3pmdUvhlStVZjy2UZY2ot6b0
	 b2Esci102zTIHbWBk2bvbqtY7gBeg9pqXqLBfSYO12CV8XrcrpS7Gzrn2Mq4ZR9qcg
	 s15ywGLED580JlvgHYh5nQUeRSJWllE7RjqlFZNc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71335F8026D;
	Mon, 27 Sep 2021 18:07:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CB8DF80227; Mon, 27 Sep 2021 18:07:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E64EF80147
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 18:07:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E64EF80147
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AImongPC"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5E6E760D42;
 Mon, 27 Sep 2021 16:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632758830;
 bh=NmY4iLNblD48EfXVuBOk1k1y1Qzj+Md2ets+P1dvEok=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AImongPCxDdB9rtE5RHS2TDHbWWnS7ISlbCeL8vzS5LvxeIiUhJdkLx1Knbpg0wVx
 ZSqwTxgvhn0GM+DjuD5nKG6xugu1JAunUf10QwfyaOOIT243gHqKYh+w7i6CDFkyVw
 LTDyIfJeSHS7vX8uC3zRFQeVZHPOKDwBVmBsU9GG66x/9FKJIYY19AAa9rwCpWy0XT
 7oOZm8YLFtbJWZcUdJH8lymjVAvqM7YPPvY9WDUxt4WGi7TbnBzyJLXcdDlXEJZrX+
 +euGvY7J5b1+ilfN5KajUH7toIS78c7Ws/Ox+Lofx72wsjzS2Wqj0n4/as2LpEpSVB
 htDaB53owQoMg==
Date: Mon, 27 Sep 2021 17:06:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Ryan Lee <RyanS.Lee@maximintegrated.com>
Subject: Re: [EXTERNAL] Re: [PATCH] ASoC: max98373: Mark cache dirty before
 entering sleep
Message-ID: <20210927160622.GE4199@sirena.org.uk>
References: <20210924221305.17886-1-ryans.lee@maximintegrated.com>
 <1b21bbf1-12c7-726d-bff8-76ec88ff8635@linux.intel.com>
 <SJ0PR11MB566107A6AB3D18ABDEDCF245E7A79@SJ0PR11MB5661.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="so9zsI5B81VjUb/o"
Content-Disposition: inline
In-Reply-To: <SJ0PR11MB566107A6AB3D18ABDEDCF245E7A79@SJ0PR11MB5661.namprd11.prod.outlook.com>
X-Cookie: 98% lean.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "guennadi.liakhovetski@linux.intel.com"
 <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "ryan.lee.maxim@gmail.com" <ryan.lee.maxim@gmail.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "sathya.prakash.m.r@intel.com" <sathya.prakash.m.r@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>
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


--so9zsI5B81VjUb/o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 27, 2021 at 04:01:25PM +0000, Ryan Lee wrote:

> > >       regcache_cache_only(max98373->regmap, true);
> > > +     regcache_mark_dirty(max98373->regmap);

> > We already do the following sequence in max98373_io_init() when the
> > amplifier re-attaches:

> >         if (max98373->first_hw_init) {
> >                 regcache_cache_bypass(max98373->regmap, false);
> >                 regcache_mark_dirty(max98373->regmap);
> >         }

> > I don't see what marking the cache as dirty on suspend might do, we wil=
l do a
> > sync only in the resume step.

> > IIRC this is a patch that we've seen before and removed since it wasn't
> > aligned with any other codec driver.

> Yes, it does. There was an mute problem report due to amp register reset
> during suspend/resume. and we confirmed that the modification=20
> is effective. (https://partnerissuetracker.corp.google.com/issues/1944723=
31)
> The added code helps to re-write valid values in cache to the amp hardware
> when audio resume. Same code was there on i2c driver, but not on Soundwire
> driver.

More specifically what it does is make the invalidation of the register
cache unconditional.  It doesn't really matter if the invalidation is
done on suspend or resume, so long as it happens before we attempt to
resync - this could also be done by deleting the first_hw_init check.

--so9zsI5B81VjUb/o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFR6/0ACgkQJNaLcl1U
h9AlVwf+IFJDbNWUe4RoO59zrin1rMYzfMBrOCqZ4s3F5LddOm6lSsgx+egvR3G1
6zSrQ1Ze7Wlui5zSmWWag3gH5pMASA2VIt47B9jkVteXt5DMAnTxtriHEAW7ra0T
Sv7oyYOcAhn8PO1Iu4es+og0VAxrkGnftmfTAvfMYMe6FKFSZZHC7+5wc2qEWve3
/TdY2tettc5/aXnOlW5RBMn1iw488FN3nrMH/WZTxLyQShx77+UxSnAwSDSPo3fs
/gY8WNN/OUnP+XQ40zfOKymHDzsTv4lsl3hIAeuTEbiLbaN+U/iYVqETfBjNPAS5
lU/dYbfgOuYgmjZNyr3xG8SCKxTFTQ==
=VaTn
-----END PGP SIGNATURE-----

--so9zsI5B81VjUb/o--
