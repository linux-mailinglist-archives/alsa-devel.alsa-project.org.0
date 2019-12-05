Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7CB113DB3
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Dec 2019 10:21:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A670A167B;
	Thu,  5 Dec 2019 10:20:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A670A167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575537708;
	bh=6GywMJ9k7ib5xaorZWiLHDXCI5IFRVv/4cvji20DOCs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XULUDUcwMtIhvIIpau23WRzEQ055enM+q/2Ka00bqFFZauzq76JjrXiw8gNxttgiq
	 1HeSmF9enC79jzICVGeoXOi8kUZBc45vkLp0kV8/tPix13MqbO9U1/QTD7SaZJKG5B
	 cWhjtNSLqPrvYoNLduHGzaJJIDC1ADSxwD3+9Sj8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49827F80245;
	Thu,  5 Dec 2019 10:20:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2E47F8022C; Thu,  5 Dec 2019 10:19:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CB96F800B4
 for <alsa-devel@alsa-project.org>; Thu,  5 Dec 2019 10:19:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CB96F800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="gnx9s1fd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5U8TegFluTbXCrCwEcNxpm0MihEhH2xMS3CC0HZsHqA=; b=gnx9s1fdMwrxhFEgHlNLsv+RU
 PZWCp6/LU8Al+FY9BHKrGF3Li50wOyHOUUxpkBcjnQOouy9heU1H4KvJ3Mbu8Wdk6NzN2fAsdFyXi
 gWUHJ5asqscu4p9IlL5FOoCa2k5IjorQFNMLk6Xk50gINA+6Jvn8fv6NAWOxsKjxuqHY4=;
Received: from fw-tnat-cam4.arm.com ([217.140.106.52]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1icnIe-0006O4-MU; Thu, 05 Dec 2019 09:19:52 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 69BA6D00466; Thu,  5 Dec 2019 09:19:52 +0000 (GMT)
Date: Thu, 5 Dec 2019 09:19:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Message-ID: <20191205091952.GA1998@sirena.org.uk>
References: <20191205001605.229405-1-cujomalainey@chromium.org>
 <7205cec0f9d6082b0f3c1b9922f28b23696246f6.camel@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <7205cec0f9d6082b0f3c1b9922f28b23696246f6.camel@linux.intel.com>
X-Cookie: Cleanliness is next to impossible.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Hui Wang <hui.wang@canonical.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Ben Zhang <benzh@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Alexios Zavras <alexios.zavras@intel.com>, Mac Chiang <mac.chiang@intel.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Naveen Manohar <naveen.m@intel.com>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>, Jon Flatley <jflat@chromium.org>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: intel: Add Broadwell rt5650
 machine driver
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
Content-Type: multipart/mixed; boundary="===============9129924788672294174=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============9129924788672294174==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hk/xWDG3xnLTY+FR"
Content-Disposition: inline


--hk/xWDG3xnLTY+FR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2019 at 05:22:42PM -0800, Ranjani Sridharan wrote:
> On Wed, 2019-12-04 at 16:15 -0800, Curtis Malainey wrote:
> > From: Ben Zhang <benzh@chromium.org>
> >=20
> > Add machine driver for Broadwell + rt5650.
> >=20
> > v2 (Curtis):
> > * Addressed Pierre's comments
> >   * Added SOF dependencies
> >   * Added platform override
> >   * Fixed Kconfig
> > * Moved to devm register

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--hk/xWDG3xnLTY+FR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3oy7cACgkQJNaLcl1U
h9BrWQf9HpcQxLVn03AjPDYvrIn7D1TiiXkLxru6RzGu6iADA0JxZ3O244hcLFJd
V3nITeydfbk0Z9roERa3cjoLFa6rhtEF/Ay1BIoKjVyHbNO2MkZyV22rZ1pZfdaK
cvv3tLpzSAsIfs+534v6xIJi4qRaLFvJy28yd8FNTwBK9U1WzscC+Oo3KKKPV3Ay
6BkmgrbgGLbgC40IBhzgItCqwchrFuPecTn9hL/yxfWMVWMVGj8ONmniytJsujje
VIlD44Qfe5zNvEWMuKgC3kJL7J3uVXzORSqb0fergD0vFHVcS2zdmQTz5KMtFsE6
N0MmIhch0/mcEQnTXHGtCAEcsGSkpg==
=bUS2
-----END PGP SIGNATURE-----

--hk/xWDG3xnLTY+FR--

--===============9129924788672294174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============9129924788672294174==--
