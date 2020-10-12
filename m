Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC03228BCEB
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 17:50:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55A2C168F;
	Mon, 12 Oct 2020 17:49:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55A2C168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602517804;
	bh=z1S87ktylseQKQ2C0edBKSXICGAQB4ZCIIdZx1AwT9Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K7CSl0qVA7P2T8OXe2b8nma0VQbayGZ4pwngkuaJarawMysjQE3qztyzOdjLg4irv
	 N8ttJDBs+uAR9YBBOmorN21gZYwW/Qccqw2/y8MrfKXs+lmB3xl1HoyvF9oB6+kv/E
	 x/zzsL+rhKeP2KnI3x4vPEN4mwd+MvpPjg8MujiU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0492BF8021D;
	Mon, 12 Oct 2020 17:48:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0418F80217; Mon, 12 Oct 2020 17:48:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FCB1F80141
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 17:48:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FCB1F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bRDFwfa3"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 393FA2076E;
 Mon, 12 Oct 2020 15:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602517687;
 bh=z1S87ktylseQKQ2C0edBKSXICGAQB4ZCIIdZx1AwT9Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bRDFwfa3thK1Qxe6zJNqltoE0YMJSysda/Aqr8mij4LsljNAzBETbEIqrNQIO8BAD
 7g8KLlKKLc5ooT5Yeb6Yk6BmsAupaI14oGAQB1MbrvBPV/2lOmzmYPmILl4ZjxhVgt
 +aoUC7sSX9324qiriFd/iXpJ0aT9GTTNJcBUM4Uk=
Date: Mon, 12 Oct 2020 16:48:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH] ASoC: dmaengine: Document support for TX only or RX only
 streams
Message-ID: <20201012154803.GG4332@sirena.org.uk>
References: <20201008161105.21804-1-broonie@kernel.org>
 <20201009102751.GS4077@smile.fi.intel.com>
 <20201009103124.GT4077@smile.fi.intel.com>
 <20201012133745.GD4332@sirena.org.uk>
 <20201012135527.GW4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="GdbWtwDHkcXqP16f"
Content-Disposition: inline
In-Reply-To: <20201012135527.GW4077@smile.fi.intel.com>
X-Cookie: Fremen add life to spice!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Stephen Warren <swarren@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Michael Wei Hong Sit <michael.wei.hong.sit@intel.com>
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


--GdbWtwDHkcXqP16f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 12, 2020 at 04:55:27PM +0300, Andy Shevchenko wrote:

> Currently those drivers need to do something like:

> 	if (of_property_is_present("dma-names"))
> 		ret = try DMA mode;
> 	else
> 		ret = try PIO mode;

> but this seems to me a bit stricter than needed. What if DMA mode fails, shall
> we fail the probe of the driver?

They can also just try registering DMA and fall back to PIO.

> If ASoC supports optional DMA resources, above can be simplified to something
> like:

> 	ret = try DMA mode;
> 	if (ret != DMA mode ok)
> 		ret = try PIO mode;

> which makes OF dependent parts gone along with relying on the properties rather
> than real resource availability.

I don't understand the blocker to writing that code at the minute?

--GdbWtwDHkcXqP16f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+EerIACgkQJNaLcl1U
h9DcRQf9Hoj2lj2P5He02ekSNsYrE5vg4gCydyiUhJLIiIYTf5p3wZHbwV/3H8Av
GJxJrqIrISAlGzOTg8v29vnBZQUrRePPsyXdAiJwOWy9rtW8eN1Uo6Qb+4Xhdd58
FBTifYaT17DibXmr7j2zjDom9/j5G5Nc9NjJ8RkqbFbPCQ7j2T/8I1dBdMYzECQJ
CwVb+38sgK1fVGh5BFgaEme26RLbncR20r0l19+MGGhVDiVcqXChFlpGjRpp4itv
ZiRHnYMaC4ZMqe/NBBtI11/kfKp7W9znxrdsl8cPYjbvucK5lKk8W0IUbu2E0un5
n4EP/lK1Z7SYwnPrkmz3D8vh2IAw2A==
=wUAQ
-----END PGP SIGNATURE-----

--GdbWtwDHkcXqP16f--
