Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CF417DED4
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 12:40:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8BE7166A;
	Mon,  9 Mar 2020 12:39:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8BE7166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583754035;
	bh=3WL4r77fV0BArAsvuax6/21zrerllJQpeyG2UeWUJpk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R2Dto8QakkPT+dPyurfj+FBQOf1CY/mMMrTsoCpWfBVFmqn7nKlWvArSsvntA0TTy
	 loJzuRq3XFL7dNIRGNUiqbgctKpxsB7ool6z7LTZy2ii70Z+2nz903MnLnAvxzhDLN
	 EKVtYhzmSPag6RcHcBeiVydua5XgRSWTduOL4Y70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D43A7F801A3;
	Mon,  9 Mar 2020 12:38:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C4F6F801EB; Mon,  9 Mar 2020 12:38:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 6DC14F800B5
 for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2020 12:38:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DC14F800B5
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B38E31FB;
 Mon,  9 Mar 2020 04:38:46 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35F943F6CF;
 Mon,  9 Mar 2020 04:38:46 -0700 (PDT)
Date: Mon, 9 Mar 2020 11:38:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/7] ASoC: Intel: Skylake: Fix HDaudio and Dmic
Message-ID: <20200309113844.GA4101@sirena.org.uk>
References: <20200305145314.32579-1-cezary.rojewski@intel.com>
 <9d53337b-b02b-efd7-790e-c3db18562346@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline
In-Reply-To: <9d53337b-b02b-efd7-790e-c3db18562346@linux.intel.com>
X-Cookie: Above all things, reverence yourself.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: vkoul@kernel.org, Cezary Rojewski <cezary.rojewski@intel.com>,
 tiwai@suse.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com
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


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 06, 2020 at 02:48:39PM -0600, Pierre-Louis Bossart wrote:

> There's been a couple of accidental regressions already on stable, now
> fixed, and my understanding is that the bar for inclusion is higher, so
> let's assume this counts as a new feature: it never worked before with an

There's been no change in the requirements for stable, those regressions
have come from patches that have been pulled in automatically by the bot
Sasha runs which doesn't pay attention to the requirements but tries to
identify patches automatically.

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5mKsMACgkQJNaLcl1U
h9AwMwf+NSC45WYz1raR2SwiwuMInUILUH6zbeyMZEPWbedUaHQFhrMQRmaxlkVN
gMzr4RT8EJb3l4ZknPkmQ0CDthFV0iz9JIjF8T3WiKcPhzr6+r0ovOXnXkeaWfNn
XlrqUk4CEY5M61EUoXGyWkgthYNipkCaVVdaOKjS/svcMHKzGq7W3Tfn7UoyHqWr
6ZXgOyJEscDHR91N1F+6K0kWR86I1IaSoOZtY3RlGoKKjZOzx7L0IOyIDGa2Qp1x
ClQGSwhHkUvb0p13Ebop4oEXsU+TipYO1KkN84SvibJO9Wjd/JbkRBeS+H6GYkSc
B9aTqqzk/y16xtZFwAlc79UZYrGa1A==
=Npgq
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
