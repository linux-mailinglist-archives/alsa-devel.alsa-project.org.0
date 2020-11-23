Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C6B2C0A97
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 14:52:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BD3C167B;
	Mon, 23 Nov 2020 14:51:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BD3C167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606139530;
	bh=0/IHxMdwzZirfFUEDtxYhKAxBqnvOfBcXnmhGHLZwE8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VIErdwaacEpQTZ9KrCxGZbrbwuiXXeVoOEDO/DQxQl3f9JvYjwVxM/WDuAsQGiQf1
	 vDCprTs/P8s6SUaq3PaDv840syc72HrEeFZ374e+2/MMMWBdIyOXa475eorVvLZg1f
	 0RDKQFJnoLmbUO0FqaeE+cXO9ByGf2oNnRpVirkI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9593CF8015F;
	Mon, 23 Nov 2020 14:50:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C2F9F80255; Mon, 23 Nov 2020 14:50:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F18CDF80128
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 14:50:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F18CDF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KidfIMQV"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 84CC520729;
 Mon, 23 Nov 2020 13:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606139430;
 bh=0/IHxMdwzZirfFUEDtxYhKAxBqnvOfBcXnmhGHLZwE8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KidfIMQVoIvcZVCdv8NPn4bJAaldX8rRH154qtqRm8yuUbNji3PZla9WdPLrOlm3h
 F1mDMPCM5axhytJBPc4EjO1N/K8MQxJargxBN2Wv+1d+7ngs9BrQjj6UdHBebEuxSb
 5Ysex+lthxVAeCqAhX7FXksR4WsNPBDOw4BZZyF8=
Date: Mon, 23 Nov 2020 13:50:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 01/38] ASoC: ak5558: drop of_match_ptr from of_device_id
 table
Message-ID: <20201123135006.GE6322@sirena.org.uk>
References: <20201120161653.445521-1-krzk@kernel.org>
 <20201120165202.GG6751@sirena.org.uk>
 <20201120194245.GA2925@kozik-lap>
 <20201120200429.GJ6751@sirena.org.uk>
 <20201122105813.GA3780@kozik-lap>
 <20201123104832.GY4077@smile.fi.intel.com>
 <20201123123731.GA6322@sirena.org.uk>
 <20201123124129.GA170000@kozik-lap>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FN+gV9K+162wdwwF"
Content-Disposition: inline
In-Reply-To: <20201123124129.GA170000@kozik-lap>
X-Cookie: Dry clean only.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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


--FN+gV9K+162wdwwF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 23, 2020 at 01:41:29PM +0100, Krzysztof Kozlowski wrote:
> On Mon, Nov 23, 2020 at 12:37:31PM +0000, Mark Brown wrote:

> > That feels like something that should be done with Kconfig dependencies
> > like a direct OF dependency (possibly a !PRP0001 dependency?) for the
> > driver or possibly with having a variant of_match_ptr() for things that
> > really don't want to support PRP0001.  Just removing all the use of
> > of_match_ptr() is both noisy and confusing in that it looks like it's
> > creating issues to fix, it makes it hard to understand when and why one
> > should use the macro.

> For the OF-only drivers (without other ID table), there is no point to
> use the macro. Driver can bind only with DT, so what is the point of
> of_match_ptr? To skip the OF table when building without OF? Driver
> won't be usable at all in such case. So maybe for compile testing?
> There is no need to remove OF table for simple build tests.

If nothing else it means you don't have to check if the driver is OF
only or not.  I can see not bothering to add it but actively going round
removing some instances of it doesn't seem great, and it seems like
people will constantly be adding new uses on the basis that it's just
such an obviously correct thing to do.

--FN+gV9K+162wdwwF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+7vg0ACgkQJNaLcl1U
h9Cg2AgAgW1CZvFTYqc5Dxt0wi6xknuc2q+AJ8IrulpzeW3y6wYvug/gq0UKnGe0
RhSfcXLgfzBLImnU7WdT72POVxtH3NahdaxVuRUy8yLpaEjq9HJMfw4FH+gTvQAP
qfb/mcZMdXxAG8iXe6RuxOFXAd/CvMSnVvsSNPIX/wZxKDls6jK37ZbhAAJ/GQfT
swW+LkfyQoT+f2ydE9CPZmZJyBrNsfVPNaWPbWS+Ifa+abSI8gyuj6yvy+6Fwire
/dMRJ1mjJ3ge0TZ++pDKRIi4VOLH6xays9NNMdJh1ioJwmGvR8JkBcJEvmmxk1V5
5ZCPCtoZpqkr8kw4+tevTm0Xz849KA==
=1/dD
-----END PGP SIGNATURE-----

--FN+gV9K+162wdwwF--
