Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8399328DB3
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 20:17:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 475411676;
	Mon,  1 Mar 2021 20:16:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 475411676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614626269;
	bh=8wHOzgLsEIcyTqc4NXd46snZZoBhB+wX/gJbuqvAqU0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kq/E0M4J/WLsV5NYIOaIgp6Ae6xcYhB3gdJmieQrOUd8SwVAJqBAagaZGJD+ZDtVh
	 pzAjiP1B6IjKDSSctibE2sIhFOsJUvDXxqNkm8JMDsyQaRE+yWa3wxqI1Qjj8hXPSS
	 5BUoWVr3jkl2zFbQ+USR7HWlcdKypiVPJc0eP7fo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A484F80150;
	Mon,  1 Mar 2021 20:16:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5691F8025E; Mon,  1 Mar 2021 20:16:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99756F80150
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 20:16:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99756F80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="F7KO2K+p"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 945806148E;
 Mon,  1 Mar 2021 19:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614626170;
 bh=8wHOzgLsEIcyTqc4NXd46snZZoBhB+wX/gJbuqvAqU0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F7KO2K+p7B/pJtCtX5NT/l8G9dZAFy0qMwLEWTtEKw8ThKY+wbknEPL4nie0yooHl
 65NQDk8Kl1NZtT0Vmi8X6Y2aMeiCmI6PbSWqB2RbRHi+Ttmvjn1XbDzJoebI14WEAk
 03mQN9yCE99+SD8fXgTkQGAdl0uCWgN+g8V5YLJlyI6iaZ9Q0xTfIQjrVY4ldPC3yz
 MqzGoPgPQXPeEGz8B/VMB0RdmzLm/R5WcUTrKc7Y9nRHPc4XhLmbAeArCuziSjOCEP
 sSvLfRbC3DqJWPCBz4ezDDgx3YuKaNXydFjIUUnmMgXgeJKXfE/PxMaseUPYVmVRgN
 w4gFIoduEeK5g==
Date: Mon, 1 Mar 2021 19:15:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC 2/2] ASoC: rt5670: Add LED trigger support
Message-ID: <20210301191503.GI4628@sirena.org.uk>
References: <20210223172055.GI5116@sirena.org.uk>
 <fe2941de-02ce-9ed0-70ff-d7967aeecc44@redhat.com>
 <20210224125927.GB4504@sirena.org.uk>
 <e47c7fa5-cb1a-f8a3-bfe4-1f6bca6a7d80@redhat.com>
 <20210224193626.GF4504@sirena.org.uk>
 <56ea1110-c129-5f3a-264b-fb389f615dbe@redhat.com>
 <20210225145901.GB5332@sirena.org.uk>
 <c785af21-8170-62ca-6f08-0a9a1a9071bb@redhat.com>
 <20210301132352.GA4628@sirena.org.uk>
 <76103f3e-c416-c988-7bc2-d7657e1868bd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qLni7iB6Dl8qUSwk"
Content-Disposition: inline
In-Reply-To: <76103f3e-c416-c988-7bc2-d7657e1868bd@redhat.com>
X-Cookie: Body by Nautilus, Brain by Mattel.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <bard.liao@intel.com>
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


--qLni7iB6Dl8qUSwk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 01, 2021 at 02:39:46PM +0100, Hans de Goede wrote:
> On 3/1/21 2:23 PM, Mark Brown wrote:

> > I don't want to get stuck in a cycle of "why can't my system just do
> > what this other system does", or worse end up with problems due to
> > competing system requirements when patches go in on more flexible
> > devices because I didn't notice that the device wasn't a good fit for
> > this sort of thing but people have the expectation that the kernel will
> > transparently handle things.

> So what do you want / how do you want this to work ?

Off the top of my head something like writing a control name into a
sysfs file might work, it doesn't scale if you need to use multiple
controls as rt5640 does though.  We could also do something like have
drivers make a list of all output stage mutes and then use that to build
a standard global mute control which functions similarly to this one and
could be force wired to the LED trigger input, seems like a big hammer
but it'd be reasonably consistent.

--qLni7iB6Dl8qUSwk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA9PTYACgkQJNaLcl1U
h9AR8AgAhZC4A7yZV9Fck8Vb+9ukmEQgKn6a8KtdX8ri5DdkmCUOHw8YKvlh6jWF
c25N5hcpa+10hHrXBWfAgUfniHREEjch4Qquxp6HkGIAst2CDTYCJ+TbY26SLgHo
d7bP7cQbH3ONiud046P/Xp30Tg1pybSY+NaCdal/GLxbHPQEZDu9SMFvVSUkokIA
02W4pZRDMBnGbS0g/ao8ijMnKRZQQUvffIjqWu6mAhLKh2WY5ZyIotysu8eYIV5H
zmM4wkxxwMvZtdAZtc1O5LgRQDmxYT0FrPqvY3vVgI3H2yFcvZCYIxjMGS24pw4h
UHVudSE0IhSiHTofZp4SOSJTufMy6Q==
=iSsr
-----END PGP SIGNATURE-----

--qLni7iB6Dl8qUSwk--
