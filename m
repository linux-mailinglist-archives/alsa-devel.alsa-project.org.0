Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F29A7381154
	for <lists+alsa-devel@lfdr.de>; Fri, 14 May 2021 22:00:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B6D41763;
	Fri, 14 May 2021 22:00:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B6D41763
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621022453;
	bh=kvpM2wP0uIglMvvx7Q23dMMBxKa2Vo33yjfFPo9LiLQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PSLRpb1sJEAhYj3GDD1qyhbq/3bkYupHcOYGMm27TuHrt5oAtfETI/XfoAQPxxwL3
	 auBsyAg2STnRzT4rfUMlNgQ+cugMmt1PyEyDbq9tydl4C6KmybZqXG+ZnNXVsnwdL9
	 q0oHXFMBFuIPT6S0i8VlPvGMNELKtla6I2B/yZSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 866FAF800BF;
	Fri, 14 May 2021 21:59:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 565C9F80240; Fri, 14 May 2021 21:59:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8BE8F800BF
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 21:59:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8BE8F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="O1WtW9Sf"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 25B7361574;
 Fri, 14 May 2021 19:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621022356;
 bh=kvpM2wP0uIglMvvx7Q23dMMBxKa2Vo33yjfFPo9LiLQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O1WtW9SfpMHAjK+C5VCcOBrmdexpWk18bUjozXxg5NNigk+ATDstnA8GiZ8CrMJBE
 Bzpl/ejl47SjBh4Dg+4EsuQIN9vMbZYEXgKLzhpzoCl5m6WvDpZsHVExQb1aBwO41F
 AHxsW9bxzm8aXtNDS6oeAdN0Hge2MIoDq7lINRpgldCFi3uW4WvqC9M1H4RO12Ldvu
 bdeBnRZdRYkpejr5mt765gXxNEau/svpcwYSZcvAIBW9+qrpM3ZgP0XfI7tMxv7D7v
 7E1huwY7iaIDs149Fb0kEh0vQmqe1YD8R0ku1pyRNezMNCJAltFcG3h9f3qUu4rKTG
 grrWg1tlG/qVA==
Date: Fri, 14 May 2021 20:58:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH v10 2/4] ASoC: Add Rockchip rk817 audio CODEC support
Message-ID: <20210514195835.GD6516@sirena.org.uk>
References: <20210514171940.20831-1-macroalpha82@gmail.com>
 <20210514171940.20831-3-macroalpha82@gmail.com>
 <20210514174958.GC6516@sirena.org.uk>
 <20210514183324.GA20917@wintermute.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZJcv+A0YCCLh2VIg"
Content-Disposition: inline
In-Reply-To: <20210514183324.GA20917@wintermute.localdomain>
X-Cookie: Necessity is a mother.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 heiko@sntech.de, devicetree@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, jbx6244@gmail.com,
 lee.jones@linaro.org, maccraft123mc@gmail.com
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


--ZJcv+A0YCCLh2VIg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 14, 2021 at 01:33:24PM -0500, Chris Morgan wrote:
> On Fri, May 14, 2021 at 06:49:58PM +0100, Mark Brown wrote:

> > > +	if (!node) {
> > > +		dev_err(dev, "%s() dev->parent->of_node is NULL\n",
> > > +			__func__);

> > There's no need to fail the probe here, you won't be able to read any DT
> > properties but that shouldn't stop the driver binding.

> If I'm not mistaken this is actually telling us to fail if the parent
> device (the PMIC itself) isn't present. I think I'll remove this as not
> necessary since if the parent node isn't present the mfd driver will
> never load, meaning this driver will never load either.

So it is - I edited incorrectly when I went to reply.

> Below this line however we're failing if the codec node isn't present.
> Are you telling me we want to bind the driver if the node isn't present
> (such as in the edge case where the driver is present and the PMIC is a
> rk817, but the CODEC is not in use)? I will remove the return code if

Yes.

> you think that is what needs to be done. My concern there though is if
> we do that we'll either be in a position to again report a bunch of
> errors for the edge case of users who want to use the PMIC but not the
> codec (in this case missing clocks and whatnot) if we try to bind the

Why would there be any errors?

--ZJcv+A0YCCLh2VIg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCe1moACgkQJNaLcl1U
h9BDCgf/fcUp6NX1vj4DehSa1d/ysInM3TiL047VkuC5a5gJXUHV+mazQKyvfx7p
4HM9osvdJP9DxW0DMRceJuGUOAMAaZtSi6lpkF95RElw5FUQ46U+lnKcQwWyKyRp
lbqHNiIdwkdoGj9cHr1wp0sQPyQyMUFTMrIydZ6SHaTUkk4i4jOlqsBeMg7f4OGy
itcLEGC8BtzddPnNFM//0oiqDSZfGj7S0yzqyAwtULqndz6E1xQ79hG9IazoFn5C
S8pRJqdITTk/hB+azI+x52JzZrG4Cs1hHezvR8tIY6iSrFjG2SOITEK+KDiVq74/
42JnTRAyk8OYBqh1+b/u3QlvAFAzqQ==
=wmN+
-----END PGP SIGNATURE-----

--ZJcv+A0YCCLh2VIg--
