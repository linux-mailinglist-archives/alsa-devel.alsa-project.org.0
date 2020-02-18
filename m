Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 926EE162592
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 12:33:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13D2F1685;
	Tue, 18 Feb 2020 12:32:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13D2F1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582025588;
	bh=8WkN91dF10R9dU3UUKInMSQT9P5vGw2Ef1L600nK0Ns=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LzUesFBi72v+wsNj1chk9pghRyUNWJbekBgGpbena4fg4rDldLg1lOFjUVGbplNOz
	 71j0szRyUR6cqQG8pZL1jKDh800iGpgwBntRhnHgw4qHGuHcfR3u98jhXfvZPL8JfL
	 CRtf0ZDVCXs68MiA10J3jEpZc//L2dO90DulvAj8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3277FF80145;
	Tue, 18 Feb 2020 12:31:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA171F80148; Tue, 18 Feb 2020 12:31:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 9756FF80135
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 12:31:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9756FF80135
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E82FC1FB;
 Tue, 18 Feb 2020 03:31:18 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 689AA3F703;
 Tue, 18 Feb 2020 03:31:18 -0800 (PST)
Date: Tue, 18 Feb 2020 11:31:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: linux-next: Tree for Feb 18 (sound/soc/codecs/wm5110.c)
Message-ID: <20200218113116.GA4232@sirena.org.uk>
References: <20200218152853.67e2482a@canb.auug.org.au>
 <89ef264f-12c9-ccb0-5cdd-ee5f70a469dd@infradead.org>
 <c2273472-18af-e206-c942-fd460e0d192c@infradead.org>
 <20200218100959.GD108283@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Content-Disposition: inline
In-Reply-To: <20200218100959.GD108283@ediswmail.ad.cirrus.com>
X-Cookie: No alcohol, dogs or horses.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 moderated for non-subscribers <alsa-devel@alsa-project.org>,
 patches@opensource.cirrus.com, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, geert@linux-m68k.org
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


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 18, 2020 at 10:09:59AM +0000, Charles Keepax wrote:

> 1) We could update the machine drivers to do an imply as well,
> like the changes to SND_SOC_ALL_CODECS. I think this will
> generally work but doesn't really feel right as you can end up with
> the machine driver built without the CODEC.

Yes, that's not helpful.

> 2) We could update the machine drivers to a depends on and make
> the CODEC symbols manually selectable. I guess this also has the
> advantages that it would be necessary for the simple card stuff
> that seems to be everyones first choice for machine drivers these
> days.

That's not good, it means people have to know exactly what CODECs and
DAIs are on their board to even see the config option.

> Mark do you have any strong feelings on this I am leaning towards
> 2?

Why not just continue adding the relevant dependencies to the machine
drivers like we've always done?

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5LywEACgkQJNaLcl1U
h9AQnAf+IcyipTOOekTpGzSP0PublqszzzDvjqI/SqswbhVz0Fb5VezH/l0EzXGp
sWyeL2oNPFybvE8Xd9LbEAI66gVLOSdF8gMWW8yjcbdYyg5XdnTpqYXh8N2yN9oR
M9i+fw5hHShLfI068Qo8lyFA79zYFy8gV9v/nAoOiDEXDZvIwVvk2/xVY4FGDSZo
W+v/vFhzwVjuTdJv27MeL/x+VSTu9iavIQK1oRGWyrQabWqcsk6+IAmGlUquCIk1
4j94Yv48rL/gZ1xGw2VeExKJjWFaRxEfIX97UTRl9nl8gt9xk5+V7E0qH3Dmj/lO
PI5UAs5PnWPsuP4IlEmz3pmmuGwvTw==
=r3LA
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
