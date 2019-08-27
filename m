Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD39A1CEC
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:37:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69AB71696;
	Thu, 29 Aug 2019 16:36:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69AB71696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567089432;
	bh=3L0dIg0jjuYNZbR5D7H78MJadqsJ0L4PtGpFxiQbv2g=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oXB/fSf75j/6QnHZOHXZl+67f590Y0+stldGYe3ldtO+DGJYrR1neIBCXrq5HL6OR
	 bneXBQ2N0Mzn4U64hACWSDqgtaaL/64kgqGnDCieWGui5ewouVgo7xHydlFYl3NQ+H
	 REZDlR9ZEgtXreCeEF4jnBhGwELCqtO0qNCxisRg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CBA0F80611;
	Tue, 27 Aug 2019 21:20:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E06BF80633; Tue, 27 Aug 2019 21:20:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14E6BF80610
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 21:20:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14E6BF80610
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="YKHuvk+N"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=agDj2rD+Hu0qPAYsTmlI1MYZeKQevzHtpVg+7Jk0wlY=; b=YKHuvk+Ney5xpSsZEnLGCkeF5
 mgwaS6JTGBO9xfZQiRn17QkmBxX6Z4c+0j5GRf8SXj9aUR1y5vzygJpLALKltBhG8Ws1w8X7md7Ez
 x933F/Wu1CuZ5we0S84Cvmvgg049DAiz/BftpdvTppSSlZ4CUSxdPVhTeXy5PQYt5SyEA=;
Received: from 188.28.18.107.threembb.co.uk ([188.28.18.107]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i2h1B-000133-Ue; Tue, 27 Aug 2019 19:20:38 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id F1DB5D02CE6; Tue, 27 Aug 2019 20:20:36 +0100 (BST)
Date: Tue, 27 Aug 2019 20:20:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190827192036.GM23391@sirena.co.uk>
References: <330b6be6-21c2-2eb8-9959-7d494841b3d6@linux.intel.com>
 <15484165-d751-b60e-f703-de7c1fa1ad17@linux.intel.com>
 <a95ac4d7-1c6a-ac19-59b3-cfb9ab058520@intel.com>
 <47683473-c177-055b-03fe-2f01feeb4016@linux.intel.com>
 <92ddf26a-f0ca-469d-2ccd-68a3e9cb2e6a@linux.intel.com>
 <49d056e3-e1f6-039b-5265-82a4052af577@linux.intel.com>
 <e91d8bf1-e832-7a4d-f056-a5105648a056@intel.com>
 <c67909a4-aae4-64f2-6e55-d513030fe085@linux.intel.com>
 <d3474fdb-9479-b6f7-07fb-9f7c2d4ccbe3@intel.com>
 <85f46beb-1218-4159-2abd-3ab804247a31@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <85f46beb-1218-4159-2abd-3ab804247a31@linux.intel.com>
X-Cookie: Don't SANFORIZE me!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 "Kaczmarski, Filip" <filip.kaczmarski@intel.com>, lgirdwood@gmail.com,
 tiwai@suse.com, "Wasko, Michal" <michal.wasko@linux.intel.com>, "Wasko,
 Michal" <michal.wasko@intel.com>
Subject: Re: [alsa-devel] [PATCH 00/35] ASoC: Intel: Clenaup SST
 initialization
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
Content-Type: multipart/mixed; boundary="===============3413793217593020614=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3413793217593020614==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ze9Y2znYQNnn3X7a"
Content-Disposition: inline


--ze9Y2znYQNnn3X7a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 27, 2019 at 12:18:12PM -0500, Pierre-Louis Bossart wrote:

> Mark suggested:
> "We could have a wrapper which tries to load the newer firmware and uses
> the fixed driver code if that's there, otherwise tries the old driver
> with the existing firmware paths."

> Maybe that's too complicated, I had in mind some sort of opt-in Kconfig
> where you only use the new firmware/topology when the user/distro gives a
> clear hint than it's fine to use newer stuff.

To be clear I don't think this is a *good* idea, but I'm not sure
that there are any options that are good ideas.

> I also wonder how you are going to deal with all these topology files with a
> name derived from the OEM/NHLT. There's just so many of them...For upstream
> you probably want to provide ONE per platform variant, which limits you to
> the number of machine drivers supported.

Unless the way they're generated is consistent (or often
consistent) in which case you can just derive it?

--ze9Y2znYQNnn3X7a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1lgoQACgkQJNaLcl1U
h9AQUAf/WF79J5PutYyTq69omnKk2K+0WC4++54rupZ8YKxbduuw/9L1WMVjIWC4
QusQXEqu29kX9rsXaeuC4nsfzh6Sbk9xIWWgUfC2DRhvi5dlmVzXuCXq4wpFVfO1
N+CTV645sGBVJ3gqJCm3Xfs/qZ7enVV9/F4x3cPiq9jnREQdeVHZ/X++4+OJ7MAr
2CpBNKKjmgyXhhh7HBtzr04G0CfHyfSHQlZMk3+/pqY3rhnOO3Ec9R24vaWKU3jG
XBU7Hj8X1YHJCzI6w0rpqgO0TpS4rKAoETAFOtmaethfPahYopyyLQjis6TGgwoz
40bxGpKabIXDqMlEFvPIgFaZPGj/Ag==
=vSyg
-----END PGP SIGNATURE-----

--ze9Y2znYQNnn3X7a--

--===============3413793217593020614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3413793217593020614==--
