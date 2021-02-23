Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69258322BCD
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 15:00:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E69F1676;
	Tue, 23 Feb 2021 14:59:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E69F1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614088823;
	bh=N7pRsfKvnIjaU6V3nuvVQn6NWEWodh8pbeMNi0MByaQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DxfxZK2tTogpGX/J2XUURVt0xXihWfE0cZXAC91tOm9dMcE1SJxedWetZHNlYBjiG
	 a+GrM3Vi0JK1558uTYzyXuZoLjfA0RwqSpGA/wWKOPQ9EOJhZ+YrjwFTHUrOOovl8a
	 KngnWnVgV/4V1CtKnfJfNAbbZZXjx7SklDy8pjtc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48D68F80129;
	Tue, 23 Feb 2021 14:58:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3E25F80167; Tue, 23 Feb 2021 14:58:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3612EF80167
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 14:58:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3612EF80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LbkyyceC"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B308064D9A;
 Tue, 23 Feb 2021 13:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614088725;
 bh=N7pRsfKvnIjaU6V3nuvVQn6NWEWodh8pbeMNi0MByaQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LbkyyceCKkoYQg+Jq2BeSVgAhXXNijvEvedbd7ZMRYcqMN62thS0DED9ervGK0bsd
 tPLgRv83OfZ667Anbk983TMyrmMH0kdG++kA7wL311RkOJUpbUszzxHoUg3kC9PZGe
 Js4vlcE3mdg2qCZ+/SnCUzZj9EK1l+Eii4uDgFPbtUco6OlFL3IPcNcFV5Knrkk0eg
 onl+DlYfpDNO4E3gWtIoyFAqZSISSNzqhL4Xz4lF8O7efWFfgcCDJIODXQrYyWi+Y2
 L/48kzDjF0jusQEofm9LNtGPv9iBjHZgDH4cF22DhKDRRt5FePJ06jd2vslILg9vpa
 b3NM11S8GmPFw==
Date: Tue, 23 Feb 2021 13:57:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: ASoc: soc_core.c stream direction from snd_soc_dai
Message-ID: <20210223135743.GG5116@sirena.org.uk>
References: <5598a2fc-9b49-ad5e-2265-fbc0593ead1b@flatmax.org>
 <0d9a9459-9cd7-d384-b1ff-72860895ad13@linux.intel.com>
 <73148789-58f7-2228-ae42-465cdafcff4c@flatmax.org>
 <52e1a640-b46f-b494-2047-849c1999eb28@flatmax.org>
 <7607dd99-0d54-2bab-7407-836a42647f4c@metafoo.de>
 <CAA+D8ANpWEggM4128p7=wzFNLdn6YF4JWQpm0fMbk_WWZGKBTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FoLtEtfbNGMjfgrs"
Content-Disposition: inline
In-Reply-To: <CAA+D8ANpWEggM4128p7=wzFNLdn6YF4JWQpm0fMbk_WWZGKBTA@mail.gmail.com>
X-Cookie: Kilroe hic erat!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Matt Flax <flatmax@flatmax.org>
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


--FoLtEtfbNGMjfgrs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 20, 2021 at 05:29:03PM +0800, Shengjiu Wang wrote:

> One of the suggestions is to use two DAIs.  but sometimes the
> CPU/CODEC may have the same format for playback and capture,
> then one DAI is enough.  it means that we need to define 3 DAIs
> for the CPU/CODEC,  one supports playback and capture, another
> two support capture and playback separately, is it some kind of
> duplicate?

> So I'd like to extend the set_fmt() interface, but this impacts all
> the drivers.

I'm not sure having two DAIs is an issue if you have them running the
smae format - does it cause any practical problems or is it just that it
doesn't seem elegant to you?  There were quite a few devices that pretty
much just had two unidirectional DAIs, in those cases it seems like a
sensible representation for the hardware.  If you can set unrelated
formats on transmit and receive then it's not clear that it's actually
the same DAI in anything except logical labelling.

--FoLtEtfbNGMjfgrs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA1CdYACgkQJNaLcl1U
h9AdEAf8C33U34qpu5gJhxIp9W1jaZKE9wmL5lKfmMfyH/5CuxVLb6KaSZWUBf2Q
twQhJkM0TqPAoFwlbQd9R/MDlxZn+bO5YIHjW+SlQ9+0bDyZaveUctyOC7tn9xLg
FT2GHyKgGjVq7WEEpv0lYHT4hbv1U0OAn6MMk9SfM9i5ecpW76K9dW8hI8lH13E4
dfKleU4tW6m8kbKTuYZd+fJ0VOodorlRZBlYz3pSnvYuzs0U4MeyGLhg6mL7T3cN
VXz6GmWe5kcpkwNVOpE0XzNkAXeab4kT8kKOzGeZ7xttthlXLUOZOF6BRamX10s7
tVDzi1jehwL+U7GJlRtSHHHmXd0DdQ==
=2Zyf
-----END PGP SIGNATURE-----

--FoLtEtfbNGMjfgrs--
