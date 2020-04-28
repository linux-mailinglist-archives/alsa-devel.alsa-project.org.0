Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C96251BBCA6
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 13:42:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5527D169C;
	Tue, 28 Apr 2020 13:41:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5527D169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588074155;
	bh=Kjm23SZJiJ+3VY7y6c1gvwu8cJZSxZpJO5YS0Gs4qhs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AHjJyXB/Ff5RA6ofbRNFmhal+y5KhTQMYBuKFd3PxD5hKzbOhVbt4vTzRlKZSTAy6
	 9zwCTq3yp0DKFDRQvopXjytrJkuhnYTdB9UG04Rq6+0G2YkpagTruPrImNAWhtqCA4
	 TwBtv6P/18yKp8m2wPyrf+FK6uEIhr33JI50iCKs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72B81F80136;
	Tue, 28 Apr 2020 13:40:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A237FF801DB; Tue, 28 Apr 2020 13:40:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22331F8010A
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 13:40:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22331F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="wv+0koz2"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9EC65206A1;
 Tue, 28 Apr 2020 11:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588074047;
 bh=Kjm23SZJiJ+3VY7y6c1gvwu8cJZSxZpJO5YS0Gs4qhs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wv+0koz2d8FuCTwTLv7oTUrTUcRw1GwWUG21VkFpTbOuvBzFlGsj06C6f0Iwv5S46
 QaevCB31Jcoj/nu9F606+R5hT20GAdVm99e5zj0y66ns00YcBPQYutax+yQuJrNoYV
 HJQqekEdjkpddpsxDhlPhwmkTykOdF26dgdMZBB4=
Date: Tue, 28 Apr 2020 12:40:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH] ASoC: core: Make sure component driver names are unique
Message-ID: <20200428114044.GF5677@sirena.org.uk>
References: <20200427193306.31198-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/aVve/J9H4Wl5yVO"
Content-Disposition: inline
In-Reply-To: <20200427193306.31198-1-ranjani.sridharan@linux.intel.com>
X-Cookie: Eschew obfuscation.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com
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


--/aVve/J9H4Wl5yVO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 27, 2020 at 12:33:06PM -0700, Ranjani Sridharan wrote:

> When registering a component, make sure that the driver names
> are unique. This will ensure that the snd_soc_rtdcom_lookup()
> function returns the right component based on the name.

I would not expect driver names to be unique, you can have multiple
instances of the same device on a board for example when two mono
speaker drivers are used for stereo playback.

--/aVve/J9H4Wl5yVO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6oFjsACgkQJNaLcl1U
h9ABowf+Lkdik/y6wUtdwlKBCxU39myfe+GmZR07pnqs57X3vRTa8e9ZmXWFMCm8
K1gkzK3B2q0OVcMHnRvdCaLzl8lKa9VBMVqdLzEXIkk863GaYJ9rH7jQzYdiFvxM
Q92whCfuIPB2ZcWXe0opwDgu0n3oJ3VoKnj8hoBpN/hLyROF9XFeIEStBHX5GofM
mSF1O0H+vvTrk9tPiIQhreGA6fZViG9uyZreOeMyScwBBP9m/gAA67p7xdlKJSEC
flRI60yprF+MUr2CE7TEz8S/s5P6NVeUyb6g4njGlNNu+R0NSL9PGsByszM9F/ph
HstVw7IzY6lxKe0gIqzm5MB/k1iB1w==
=3CVe
-----END PGP SIGNATURE-----

--/aVve/J9H4Wl5yVO--
