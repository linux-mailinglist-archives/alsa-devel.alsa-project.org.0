Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 530C42C120C
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 18:37:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6F7E1662;
	Mon, 23 Nov 2020 18:36:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6F7E1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606153062;
	bh=t2YGGL82x7Zjpd7fLpcykD1hzJbbzIVif68gJ6KsBxs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rz9iHfdeCRzwYWAqAZtBHEEL1B7tuKtkyZ9LPE8HwcRjoiWBOiVEkGg/ElnaSJmbr
	 EdolmCrKUpQPNqDpSM6VDWnDUJ/NxgLkd7TZbQcBm1yULaUOIl3aNj1Zy1seKoJgp/
	 nHC/p1gUv4+bY8yo8+PItdsl4yVkVTCwvHW/mzw8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 225FCF80113;
	Mon, 23 Nov 2020 18:36:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39F23F80255; Mon, 23 Nov 2020 18:36:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7010AF80113
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 18:35:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7010AF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZDlY9OS3"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D06332072C;
 Mon, 23 Nov 2020 17:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606152956;
 bh=t2YGGL82x7Zjpd7fLpcykD1hzJbbzIVif68gJ6KsBxs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZDlY9OS3nfKsK8BOA65XiCtQvfCWhbkXzLS2nOOV7JoAKs6gwm8T6yds3k0671Qpv
 jR48XAPdxr5IRSmBLBYNJ73iw66+70ZjVpcbOB0/VDea4/lMpJTcmFFLwU5qo5FgWQ
 o/XFle7WUseDkn/9o879TFSGNBO0glM3F4NBSyl8=
Date: Mon, 23 Nov 2020 17:35:33 +0000
From: Mark Brown <broonie@kernel.org>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>
Subject: Re: [PATCH 00/14] ASoC: Intel/SOF: extend run-time driver selection
 to ACPI devices
Message-ID: <20201123173533.GL6322@sirena.org.uk>
References: <s5h1rgst6z4.wl-tiwai@suse.de>
 <0286c6975f24432082f609d45adaa14c@intel.com>
 <0badb36f-3089-dc34-f7b0-75a73b856f0d@linux.intel.com>
 <d57fa3716a974eb9ba585ddd85dbe14c@intel.com>
 <cd8e5c2f-e1c2-7fbb-bee1-cc76ec14a801@linux.intel.com>
 <d94ccf9a3c61460db88f256df1fa3240@intel.com>
 <20201120164841.GF6751@sirena.org.uk>
 <758af664b89545c5be83ca2bc81078fb@intel.com>
 <20201120180627.GI6751@sirena.org.uk>
 <c8cd5f98e7c941c1b87aaabb850ece4e@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="L1EIGrW/+75u5Nmw"
Content-Disposition: inline
In-Reply-To: <c8cd5f98e7c941c1b87aaabb850ece4e@intel.com>
X-Cookie: Dry clean only.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>, Hans de Goede <hdegoede@redhat.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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


--L1EIGrW/+75u5Nmw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 20, 2020 at 09:02:24PM +0000, Rojewski, Cezary wrote:

> There are no circumstances under which Intel recommends distros to try
> to convert out of catpt though. Don't believe aligning all the drivers
> to some general idea just for the sake of aligning is a good move.
> That's why drivers have their own specifics in the first place -
> their complexity and performance could have been negatively impacted
> otherwise.

It could equally be that someone has stuck with the older, now
deprecated, implementations due to compatibility fears and this could
help them deploy the catpt implementation without worrying so much about
breaking things for users.

--L1EIGrW/+75u5Nmw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+78uQACgkQJNaLcl1U
h9BkFwf+OvRtWJJWGfJzPjvhrx/Szh9xFf/gke7pOimBHSwob9XwHmr5RCTmJO7h
RsrGZ52Xt3xp+7ef7baX+LBIgN8ww/ekrsLtFPkpoXW86sr/miDDnp666jc2d7eg
Nz2MyUHQZTUxRUto7SF73Bn4Cuxqzipu2aGrObRGQafH+e8jYEvzjUH9p94VSH9/
Jix8P66UfAoNVcvqFMUvCe9z4+x011KmKkRJ3TzcYTrmKlcH0g1wReFzLfhzIKEB
lM9pfaVt/VnGRRhjs9cj+wNgqGNCdwetGLFiyaOwlx72rlV5oxFg8QnUEAUt0moa
/sGXBDYjUJTLwCZrHkgI4QyeQXbQmA==
=xzL9
-----END PGP SIGNATURE-----

--L1EIGrW/+75u5Nmw--
