Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 581183D3C3D
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jul 2021 17:13:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA66A172C;
	Fri, 23 Jul 2021 17:12:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA66A172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627053194;
	bh=UfHQXrEk7TFR823g8mDFH8097GvkG1bn6Rz7DKgHvRw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=huJCAYgW6kbbJOP+FQalsDFXOxhH+Rb7jNuy22zOaRk/070Wzcpg7tu7ufEAftiDq
	 jLqnviAmaxeDx6nFrB3BaIW1d1aroBiOUk4DVp3p0N5BSIZKKaiEs1aWLkyvQZeIMX
	 uEHgy9wIVOytU4QG4Toz8BrNGqTbVMqL+pcpx4Yw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A71BF804AD;
	Fri, 23 Jul 2021 17:11:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBCE1F804AC; Fri, 23 Jul 2021 17:11:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76828F80086
 for <alsa-devel@alsa-project.org>; Fri, 23 Jul 2021 17:11:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76828F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jKLpAx4a"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 17B8360F02;
 Fri, 23 Jul 2021 15:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627053096;
 bh=UfHQXrEk7TFR823g8mDFH8097GvkG1bn6Rz7DKgHvRw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jKLpAx4atwaNIoeQ8vMbB/s/LmeS0kfSmFaUnWjFHQIAedznav1w7rxqW13S69/RY
 5fXBbE/SWxXG0f1qbShojkD2UYtWp2wfVBNCE7ruqymI71pyNZsT4gUOVUO/Oqj3Zh
 gOM7sSG4GjZFKf4fU2OwsMkNL89MB/BPUV9FR5nHBOx3IR7IZYwRD5vYXe1Uu4akRT
 m/mUmbstKIzLj8EB0bFXHFxR3A7nj0PORmNIQNV6mNqFvw2d+q4zjhcrtH57gPRCnD
 FZEhfr+H+w2z9vhCMGVgI3lwz5UWc/QwfrOPxmTjqZkshJdR21oEleS9kHqAWMlk+t
 xS8wRPSk7K5Gw==
Date: Fri, 23 Jul 2021 16:11:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Frederick Gotham <cauldwell.thomas@gmail.com>
Subject: Re: tlv320aic3x audio driver -- possible bug
Message-ID: <20210723151129.GG5221@sirena.org.uk>
References: <CALtZhhNG9LrZM69_gjZV5d37ygyfZPtL0GMNZd3-5j_EOL3mKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="I3tAPq1Rm2pUxvsp"
Content-Disposition: inline
In-Reply-To: <CALtZhhNG9LrZM69_gjZV5d37ygyfZPtL0GMNZd3-5j_EOL3mKA@mail.gmail.com>
X-Cookie: Integrity has no need for rules.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com
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


--I3tAPq1Rm2pUxvsp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 23, 2021 at 02:29:51PM +0100, Frederick Gotham wrote:

> When the device is powered back on, the previous setting for
> microphone bias (MICBIAS) is lost. If it was previously set to 2 volts
> or 2.5 volts, then when it's powered back on it becomes Off.

If this is configured in a volatile register (I don't know off hand)
then it needs to be specifically saved and restored separately, I know
this is an issue with the accessory detection - I've got a patch from
talking to someone else about an issue they were having there.

> However I think that the call to "regcache_cache_only" should come
> before the soft reset takeS place. The setting for MICBIAS is lost at
> this line:

>     snd_soc_component_write(component, AIC3X_RESET, SOFT_RESET);

> And so I think that the call to "regcache_cache_only" should be moved
> up above "snd_soc_component_write", as follows:

> 		/*
> 		 * Do soft reset to this codec instance in order to clear
> 		 * possible VDD leakage currents in case the supply regulators
> 		 * remain on
> 		 */
> 		regcache_cache_only(aic3x->regmap, true);
> 		snd_soc_component_write(component, AIC3X_RESET, SOFT_RESET);

I don't understand how you think this will fix things - we're still
powering off the regulators (if they're controllable or if that happens
over suspend) so we'll still loose all the register state and exactly
the same thing will happen when we try to restore, at best this will
mean the reset that's being done there doesn't actually happens so we've
got the risk of having higher power consumption over suspend if the
supplies are maintained over suspend.

--I3tAPq1Rm2pUxvsp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmD63CEACgkQJNaLcl1U
h9CyJgf/Sj9bV04mQq/r79d2iyNHrjjwRmDqplgaO96JjHi741XM+K/r72FSmkEW
MZItH0tV5u+DcNCpdNUZGh0WkJa/9oClwvvJefr9mc3P1yeJgMtn/AJIThURXEk1
GBUDeOuT5nIvANxBD4huU69QO24jmi+6Fcjkz6aRW9eL1RsuoZUh+zdgCGAd/w3t
G7pU/8Po9nRCg/AXsJbwMZCfPnYU35bkltna7ivES35RoW6i5AXRftshKRZJqoYO
kMgbsctCjpiAydFBPxk2jeJF69bgxJt+xXMAQPqiqxz+RqKNnS/ChKV2rx9fpAaD
McW4wzzAGzCHGcpajWNZ/215wG05jw==
=Ybc/
-----END PGP SIGNATURE-----

--I3tAPq1Rm2pUxvsp--
