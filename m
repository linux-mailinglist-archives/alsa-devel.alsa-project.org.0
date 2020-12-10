Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B592D64BF
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Dec 2020 19:21:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3499083B;
	Thu, 10 Dec 2020 19:20:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3499083B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607624461;
	bh=LmtMg/2OdiA94fg4xZqizpLCmvWpBR6zuvboiaX8kSQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WwXSg4wLnLqPbdCtbXzgjIfaPa1gMHhtJ1xjZGOD68zEQEYu4JyJ+cBnRHkIi7eR6
	 zVlbA9M39T4fw7IV1OcrUOwR+9BK5Sde7SQnP4sR6kDYr6Ws+XGw+tivBKiXPWWWQO
	 e3FtV8z9hZ6FBAGka+2nvSQ6D2zOc2vorsPhB/Eg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DC6CF80105;
	Thu, 10 Dec 2020 19:19:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68E29F80105; Thu, 10 Dec 2020 19:19:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28DBCF80105
 for <alsa-devel@alsa-project.org>; Thu, 10 Dec 2020 19:19:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28DBCF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jLwH0GJV"
Date: Thu, 10 Dec 2020 18:19:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607624358;
 bh=LmtMg/2OdiA94fg4xZqizpLCmvWpBR6zuvboiaX8kSQ=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=jLwH0GJVVOplglTZwmcoZvZ4MuNOSRiZMxUM4aSR9Fy2DUMPMQQtPZMOCw8VmCGYh
 9pk8UovPJXJj5PpNDqYoN/kqzlfHHcAVPxEsy0J8Cl1J3lBPFdMOc2ZWIvzJMzKW1p
 rFrw7E4NzrPqbBfnC2/6WXKDHfY41SpmcOBfYD2Qj2G4hNxIjbs6C6HgN6BbYsgIf/
 dk+GH2ZR3BazVrvtd+3pdoFC7OFtyvNvTP+7saEalv03iA19jvVwWjorornnjiqE62
 tJfVP6WaffQYU3pjJfuYbuNozFWkiSnY7J8P4MnGeRMKM/mOjlVjQ8+aSDOb31dp26
 6uhT/FWfU6ZOQ==
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH v2 1/2] ASoC: rt1015p: move SDB control from trigger to
 DAPM
Message-ID: <20201210181910.GF4747@sirena.org.uk>
References: <20201210033617.79300-1-tzungbi@google.com>
 <20201210033617.79300-2-tzungbi@google.com>
 <20201210153955.GC4747@sirena.org.uk>
 <CA+Px+wV1VkTFdx4WS2Q-r-br3_0BE5pLjanggf0oey1OV8Wuig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="XIiC+We3v3zHqZ6Z"
Content-Disposition: inline
In-Reply-To: <CA+Px+wV1VkTFdx4WS2Q-r-br3_0BE5pLjanggf0oey1OV8Wuig@mail.gmail.com>
X-Cookie: Your step will soil many countries.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ALSA development <alsa-devel@alsa-project.org>
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


--XIiC+We3v3zHqZ6Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 11, 2020 at 12:34:52AM +0800, Tzung-Bi Shih wrote:
> On Thu, Dec 10, 2020 at 11:40 PM Mark Brown <broonie@kernel.org> wrote:

> > Now this is in DAPM it's not in atomic context so it'd be more friendly
> > to use gpiod_set_value_cansleep() so that it'll work even if the GPIO
> > isn't atomic safe.

> Strange, I thought I should get a warning message because of the
> following statement in gpiod_set_value (but it didn't):
> WARN_ON(desc->gdev->chip->can_sleep);

> Also I dumped the value from gpiod_cansleep(rt1015p->sdb), it returned 0.

> Is it safe to call gpiod_set_value_cansleep() even if the GPIO
> controller doesn't support it?  (I guess yes, _cansleep could be just
> an advice)

Yes, absolutely - it's the other way around.  _cansleep() is the caller
saying that they support using a GPIO that might sleep when updating
(eg, one connected over I2C), it works with both GPIOs that might sleep
and GPIOs that are atomic safe.  Without _cansleep() only atomic safe
GPIO controllers can be used.

--XIiC+We3v3zHqZ6Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/SZp0ACgkQJNaLcl1U
h9BxFAf+KeGobhK41DCMlzCO/NHmC79lqz8mPKijLSlbsaqthWf4Em2VFjj2eBT/
7cRRDCaNSkjfcT7fbYhmbOK6OJGwwICv8jUhUbyBCwjMPEDejzSLrsVQ7wf7Mts8
KLOnY7r3V4r3J2KfIGykF0fRa2HfcT2gI70DykEzSd3rS6t78O5WwI30/yoOEPtg
qCZ8wmFSW7VTctiPr7wgi6o+nP0UD3Pa5qyB5kl4lh2Uf481IlOls88Vr03d61S7
oJP8VzLzAL9M8YiQics0HsHerH4+lGIqmOPlklujTYKJIh85P2bnRl6UL5k/vEtn
Pu+OwxgA6DOjgjPEkqP9JjKlJ9q6nA==
=QWK0
-----END PGP SIGNATURE-----

--XIiC+We3v3zHqZ6Z--
