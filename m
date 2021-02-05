Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 471E3310DF9
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 17:38:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7B7D1677;
	Fri,  5 Feb 2021 17:37:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7B7D1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612543080;
	bh=atgG6ZN8qTkgFk4Rn2oN6WjAYzQG6orMRi//pvIqDSs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cs9TzNJ64FjuDuk80cSbVvxnYNuuRoD9fk+Ckmm3WxSonDjKzwHonhVcpK50V2/dX
	 lgO9gqOzKQZC3xqPLUmTrmzMw3oL7NL/rpgYxBjGWzyu3cIVDNXW/+LWuKKT7AQEjK
	 NJJReYTckuqcUK06d5qqtM+tyFWhlgixO5Csg1hI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E4CBF8016E;
	Fri,  5 Feb 2021 17:36:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E67DF8015A; Fri,  5 Feb 2021 17:36:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A51A4F80139
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 17:36:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A51A4F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Suw0L4OF"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B990E64EBF;
 Fri,  5 Feb 2021 16:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612542975;
 bh=atgG6ZN8qTkgFk4Rn2oN6WjAYzQG6orMRi//pvIqDSs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Suw0L4OFlWHxsGatQ0G/fzxfOHKBWS21NjPqgYMKhurs+7au00bODMYEq8NuKUeXO
 Kt4ZF4oezNdls43RyfoX/lqGi/G41v+aP4F+ZMhtMC6P3GjQQvom8HUamdDWWKByrt
 aDZCsXJwlM+VszFDTsufprtIYC8UIJyeE5ijCaPP8NFZSMZ77+wKJmqVEvaHdmUp5t
 whuO0XHvNfuVaEzXs4cjwBMeGCiGIGm8FoM+HD9ukewheTmxH/ZegBOafSU3j1R1Lt
 SLDX3kmSwYRPeGWiQSX3pD/wvxGZwNwX7pzQB+DrbD4BkIKxe1PIyaIhNu5MebjZTk
 xfBMlQ5c7f/LA==
Date: Fri, 5 Feb 2021 16:35:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Sia Jee Heng <jee.heng.sia@intel.com>
Subject: Re: [PATCH RFC 0/4] Add HDMI support for Intel KeemBay I2S
Message-ID: <20210205163525.GH4720@sirena.org.uk>
References: <20210204014258.10197-1-jee.heng.sia@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Yia77v5a8fyVHJSl"
Content-Disposition: inline
In-Reply-To: <20210204014258.10197-1-jee.heng.sia@intel.com>
X-Cookie: Huh?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com
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


--Yia77v5a8fyVHJSl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 04, 2021 at 09:42:54AM +0800, Sia Jee Heng wrote:
> The below patch series are to support Audio over HDMI.
> The modification in this patch series shall allow I2S driver
> to playback standard PCM format and IEC958 encoded format to
> the ADV7511 HDMI chip.

This seems fine - what's the plan for getting the DRM patch merged?  I
can apply it if that's best for people.

--Yia77v5a8fyVHJSl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAdc8wACgkQJNaLcl1U
h9DaZAf/SF4ZKmjHzIITNbEZmHIzkGIGwD62llRkhiFWft7j3wJVsmSfBAbMwi8M
5Gg8O0govo2CjmxFWdqbmU4AG7m3GKINIYt1us5u0+DHUOEKbWqr6/iHaWK3vUqE
yKPyHzbuKmFp5p9/gVWswJu2WK28UNcVuGNXEYtMr7DzvsyAsKCwbs1MzdrnvVd0
7Jh9Nwygks4xEqpe7tOIXHNgpmd3Kkj62iWgqpfL3jJ6ADFmvW0R7OyVa+ahETAW
QazkM8+O9vpZDhSBLzF5TeMp4FCQTPNmnh330s5UNNvEbx6YL49k1OdgREIED7HM
ZVr9tN2pzsmo2Dtuu2PN65uWRRQnMg==
=+IvZ
-----END PGP SIGNATURE-----

--Yia77v5a8fyVHJSl--
