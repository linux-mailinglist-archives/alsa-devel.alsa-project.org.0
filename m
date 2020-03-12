Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C55A183008
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 13:17:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A108716E7;
	Thu, 12 Mar 2020 13:16:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A108716E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584015461;
	bh=P8DnN0U+hkIWJa16Oo7Db85ABuJcv3lcI1XlkeC4U8Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NOytl9O54Ws77s7kV978YIkgxuH5KTJMSZcLEkR9jUDPtTlB0aPYPdwTLOIU4UG23
	 CVvvPq3jKAcN2S12tMo+IItuDPrmae56eMhBuj+duI45kxwKgQ09HpzQ+9Ym680GMu
	 +497GPB3yjmHV3OLraVdOi78njPOW3v9wcQv976M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9B9DF8021C;
	Thu, 12 Mar 2020 13:16:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50DB4F8020C; Thu, 12 Mar 2020 13:15:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 96581F80086;
 Thu, 12 Mar 2020 13:15:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96581F80086
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B43D631B;
 Thu, 12 Mar 2020 05:15:51 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37E043F67D;
 Thu, 12 Mar 2020 05:15:51 -0700 (PDT)
Date: Thu, 12 Mar 2020 12:15:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: Re: [PATCH 0/3] [RESEND] ASoC: SOF: preparatory patches
Message-ID: <20200312121549.GB4038@sirena.org.uk>
References: <20200309170749.32313-1-guennadi.liakhovetski@linux.intel.com>
 <9cfc4182-1f22-9f28-52d8-f8aac1f7bc0b@linux.intel.com>
 <20200310125055.GF4106@sirena.org.uk>
 <20200312114536.GA15167@ubuntu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Yylu36WmvOXNoKYn"
Content-Disposition: inline
In-Reply-To: <20200312114536.GA15167@ubuntu>
X-Cookie: Security check: INTRUDER ALERT!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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


--Yylu36WmvOXNoKYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2020 at 12:45:37PM +0100, Guennadi Liakhovetski wrote:
> On Tue, Mar 10, 2020 at 12:50:56PM +0000, Mark Brown wrote:

> > How does this relate to the virtio audio spec that's currently under
> > review?

> The spec under discussion is only for simple audio virtualisation with fi=
xed=20
> roles and topologies. With our approach guests get access to advanced DSP=
=20
> capabilities. The virtualisation approach under discussion can be a fallb=
ack=20
> for cases when no DSP has been detected on the host.

So they're orthogonal :/  Have you proposed your spec yet?

> > It looks to be doing something much lower level than that.
> > I am concerned that this looks to be exposing DPCM as a virtio ABI,
> > we're trying to replace it as an internal API never mind ABI.

> You mean that our approach works at the widget level, which is a part of =
the=20
> DPCM API? Well there is a translation layer between our ABI and DPCM. And=
 by=20
> virtue of the same argument don't we already have DPCM as an ABI on the=
=20
> opposite side of SOF - in its IPC ABI? Largely this virtualisation approa=
ch=20
> doesn't add new interfaces, it re-uses the SOF IPC ABI, which is also one=
 of=20
> its advantages.

Please bear in mind that the page you linked to is very high level and
I've not seen the actual spec or anything.  The page and your mails both
talk about DPCM so it sounds like that's a part of the interface.

--Yylu36WmvOXNoKYn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5qJ/QACgkQJNaLcl1U
h9DULAf/Ywq+o0olRo6zvo8a7A3VRGwQwVEjdKqu1TOHteMgiHxxAnGlDRS0YlgG
p9vqFweGtnlEzoxtVKRPH7kCnrrzEl2j7Z8oQFcYDusJbDw795RaR5Ot8hFpFqTo
VhhcUVXtw1EsnPDrabcCyTcoLWCdy0t3FypO9+tR+Zj4FMRX7chDwZTfTXrO0e+c
aRTFm//r6g1Krg6J8O1AIn1bCH171dIiLQtGJmB5PHIJS0oCSRiHws0Vng6GkyEQ
y3LFBXTb/w7FCmy+sxwueWNX0C/lCE6vBmmPhLKwU2k3GiSiDhYzJA6xYaHKMc2U
UvXeQPdvnNIrdRzOdQNWQOGTpFwLXg==
=DtJx
-----END PGP SIGNATURE-----

--Yylu36WmvOXNoKYn--
