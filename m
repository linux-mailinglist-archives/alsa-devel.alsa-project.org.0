Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2C0197A69
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 13:10:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3D9E166F;
	Mon, 30 Mar 2020 13:09:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3D9E166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585566634;
	bh=WL2SAcJ07tqeaHrcoiJOVclBP6sdo1/MfZfFRQwwchs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FkvRneeFCTuxcL9n0nTzWxaCT0aO3rLr3Pa756xXj8f9/+imAm013n7OzjdYEiYPu
	 DQUtV9mmpwggNUL83apn2HUYnj3PUqVJSu9+uh+oW32+6JaniXqVz9d5ps87UKgo1y
	 G7IUHe6eUPClWaVwDb9KhizPRzj9VvDwB171m6nE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12A40F80145;
	Mon, 30 Mar 2020 13:08:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91FD6F80148; Mon, 30 Mar 2020 13:08:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 8C7D1F800EB
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 13:08:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C7D1F800EB
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C90EB31B;
 Mon, 30 Mar 2020 04:08:45 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DC103F52E;
 Mon, 30 Mar 2020 04:08:45 -0700 (PDT)
Date: Mon, 30 Mar 2020 12:08:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v3 5/8] ASoC: soc-pcm: call
 snd_soc_dai_startup()/shutdown() once
Message-ID: <20200330110843.GC4792@sirena.org.uk>
References: <87d0anceze.wl-kuninori.morimoto.gx@renesas.com>
 <875zgfcey5.wl-kuninori.morimoto.gx@renesas.com>
 <54b81b41-f4cf-c28c-0ec5-363e2c62796b@linux.intel.com>
 <df297c98-74a4-fe61-9c61-563a5bae2615@linux.intel.com>
 <87lfnibqba.wl-kuninori.morimoto.gx@renesas.com>
 <d7f0fc98-afbf-c6ea-22d2-690f988b1d1a@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Pk6IbRAofICFmK5e"
Content-Disposition: inline
In-Reply-To: <d7f0fc98-afbf-c6ea-22d2-690f988b1d1a@linux.intel.com>
X-Cookie: Ahead warp factor one, Mr. Sulu.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


--Pk6IbRAofICFmK5e
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2020 at 09:25:31AM +0200, Amadeusz S=C5=82awi=C5=84ski wrot=
e:
> On 3/30/2020 3:10 AM, Kuninori Morimoto wrote:

> > But, I will re-try this issue (for DAI, for Component) again.
> > Let's just revert it so far.
> > Is it OK for you ?

> I tested patch from Pierre and it works for me, I'm also ok with revert.

Pierre's patch makes sense to me and this is the only reported issue so
I'd be happy with that.  Whichever way can one (or both!) of you please
send a patch?

--Pk6IbRAofICFmK5e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6B0zsACgkQJNaLcl1U
h9DohAf/SolB2Gl6Ao7M83er50+1W6fM6/xgtstjT7GLYRCtDd2jNag7x6+jvhtV
cEcSGmj+OskmuXtZTwL4ClM4JEemso5rzUYqTa+HS2vhRHAfntECiQTXH6iBPH4o
Y4WW2Y+n869ASI25m/yhWdtK/ovY7CX4cqsoRVvqEcXImqtkiWHAf2CAQl6NEWXe
XO6ZVeDYxtM3LoVYu/OmLkzHkW9eP0BYUPfDYclWTJwfb0jLSABuN2PcETxVGrKh
bI78UKHuO25EtnsuwjgfWFjUjylRniHl1oApb0uhTMSBWq+n3ljuBpbUspmdkung
kKiNajhCvXRV2hvy86CQDb/Px7fXuw==
=pEZ9
-----END PGP SIGNATURE-----

--Pk6IbRAofICFmK5e--
