Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4763F10CDE3
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Nov 2019 18:30:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8A6816E5;
	Thu, 28 Nov 2019 18:29:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8A6816E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574962227;
	bh=KFkdAoR4d4krT1r4AtZ3IuITVsL4AX3Cj5dqgdOOSR4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SO/OTj8PxrZPQEifw7GzAm+BFIPXGc0rXQZqcDjHgRwLuWLoSNGQEHmHdsDeAHxzm
	 MARGfef3DxHp5dIGB/tU32e0op+uSu77ZfeDYO375eNIoK7K/lJtBLgWogA0IHEqmW
	 B0RRb54vH+gY0thQih7nIXR2Nzkr66He9vP15hh4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F09D7F800CB;
	Thu, 28 Nov 2019 18:28:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CE80F80149; Thu, 28 Nov 2019 18:28:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id C40EBF800CB
 for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2019 18:28:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C40EBF800CB
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36EDF1FB;
 Thu, 28 Nov 2019 09:28:34 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A60333F6C4;
 Thu, 28 Nov 2019 09:28:33 -0800 (PST)
Date: Thu, 28 Nov 2019 17:28:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Curtis Malainey <cujomalainey@google.com>
Message-ID: <20191128172832.GF4210@sirena.org.uk>
References: <20191128011358.39234-1-cujomalainey@chromium.org>
 <s5hlfs0ld25.wl-tiwai@suse.de>
 <20191128134901.GE4210@sirena.org.uk>
 <CAOReqxj1V475mbfSEWNn3NrMJDttO+23KjboBR01tGhzAAJmBw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOReqxj1V475mbfSEWNn3NrMJDttO+23KjboBR01tGhzAAJmBw@mail.gmail.com>
X-Cookie: Do not dry clean.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 ALSA development <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: core: only flush inited work during
 free
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
Content-Type: multipart/mixed; boundary="===============5367001664063580662=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5367001664063580662==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iBwuxWUsK/REspAd"
Content-Disposition: inline


--iBwuxWUsK/REspAd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 28, 2019 at 08:23:21AM -0800, Curtis Malainey wrote:
> On Thu, Nov 28, 2019 at 5:49 AM Mark Brown <broonie@kernel.org> wrote:

> > > For this delayed_work, the situation is a bit complex, though.
> > > Usually the work is set up to point to a fixed function, but in the
> > > case of ASoC, it seems serving for different purposes depending on the
> > > component type.  I guess the cleaner way would be a redirect call
> > > like:

> > Yes, or just separate fields for each.


> Sounds good, I will refactor this change and send a new version next
> week as US is on holiday rest of this week.

I applied the change as-is already since like Takashi says it is an
improvement in itself but obviously doing something more complete and
thorough on top of it would be great if you have the time!

--iBwuxWUsK/REspAd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3gA78ACgkQJNaLcl1U
h9BRMwf/UD3krPBZmo6rY0x3AwyPI0SZW0T8ajK0HBMMRbivNWp+0PRRoIOaAOSe
ZWK6mLQuOvos/OhOFDzexLd5APLIelSJoV7gFG1Pb0UTdWNaziNT0vpHeJTVinc6
DFX+q6SrO+EqJWue+IXJy/bl5Z8PWySS6XjlZNSL+n+k2S/VGM2haiLnESsQ1Yrl
dsXqAH3lIeWGxEG7AtoWJRNsEDmF2udBfje4lG1j0MW2kg9EIjb7dRNRmwR/HK0z
6Ue2h318tklzgVEycoGyu9CSopkIMtrRPU5OQfXAs+1IQLgVJJp+UYWg7tWdMF4W
emzrZEGh6soyfKiUFPKyDHKbxuNZHQ==
=N4Fl
-----END PGP SIGNATURE-----

--iBwuxWUsK/REspAd--

--===============5367001664063580662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5367001664063580662==--
