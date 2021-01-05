Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A982EAF60
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jan 2021 16:50:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C31116B4;
	Tue,  5 Jan 2021 16:49:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C31116B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609861805;
	bh=exjbVXJp44u+pVE6fQ5+LZ7JcUb4ur3YJ8VVpBtZA/E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KU2S/Ry5Xf2DkttSnKAenxB06ygyfDMPO7h8Px5uxUpcQb9si68jBWJTer5tPti38
	 /OZdUjPM9pGwaLf0hzjvP+xb4p4ylsmvW+iO+5Lbk6DGFr8tSr78T+bIKb5HotjIqf
	 IlViDetWhHSwGqW6qZ4zkIp0cNMLwyKOEp9a8qXY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04B76F80268;
	Tue,  5 Jan 2021 16:48:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D09A9F80258; Tue,  5 Jan 2021 16:48:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA905F8015B
 for <alsa-devel@alsa-project.org>; Tue,  5 Jan 2021 16:48:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA905F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gMRuCgsY"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 856B72070C;
 Tue,  5 Jan 2021 15:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609861704;
 bh=exjbVXJp44u+pVE6fQ5+LZ7JcUb4ur3YJ8VVpBtZA/E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gMRuCgsYekpNaoOTme7BOK9BV4pd7gsOFdyDiEVCa4L97sPaGG7c5xNcmISFOhh18
 7WIEBCovZf9nMpVrKZafXj1Ch/Sd28l5gh/6wm4lpx5UIFhpicBXqmlG0v4GLpgAU2
 zBoYOYkU8MfArhPNSyUt9B8Lfz78obrgmu5D9AHJi//KPeUIwkRm+xCaf9y0cceDrU
 722lR8FPtXsRzLGu42WosALrUJO8pUaSBrtXM3mvtsHg6ERA/VLS06N9864Yn50r3K
 ZZfLaM9sEJR+fSgby2mq9c6DgYi+khhvHYwdu1mUROSxvVwG5L+nI8JDQT2XJ5kJD2
 Z9Q1LEZyyU+dg==
Date: Tue, 5 Jan 2021 15:47:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [resend/standalone PATCH v4] Add auxiliary bus support
Message-ID: <20210105154756.GF4487@sirena.org.uk>
References: <20201218180310.GD5333@sirena.org.uk>
 <20201218184150.GY552508@nvidia.com>
 <20201218203211.GE5333@sirena.org.uk>
 <20201218205856.GZ552508@nvidia.com>
 <20201221185140.GD4521@sirena.org.uk>
 <20210104180831.GD552508@nvidia.com>
 <20210104211930.GI5645@sirena.org.uk>
 <20210105001341.GL552508@nvidia.com>
 <20210105134256.GA4487@sirena.org.uk>
 <20210105143627.GT552508@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Y1L3PTX8QE8cb2T+"
Content-Disposition: inline
In-Reply-To: <20210105143627.GT552508@nvidia.com>
X-Cookie: I'm ANN LANDERS!!  I can SHOPLIFT!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, lee.jones@linaro.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kiran Patil <kiran.patil@intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-rdma <linux-rdma@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Martin Habets <mhabets@solarflare.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, Netdev <netdev@vger.kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Dave Ertman <david.m.ertman@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Shiraz Saleem <shiraz.saleem@intel.com>, David Miller <davem@davemloft.net>,
 Leon Romanovsky <leonro@nvidia.com>, Parav Pandit <parav@mellanox.com>
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


--Y1L3PTX8QE8cb2T+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 05, 2021 at 10:36:27AM -0400, Jason Gunthorpe wrote:
> On Tue, Jan 05, 2021 at 01:42:56PM +0000, Mark Brown wrote:

> > You're missing the point there.  I2C is enumerated by firmware in
> > exactly the same way as the platform bus is, it's not discoverable from
> > the hardware (and similarly for a bunch of other buses).  If we were to

> No, I understand how I2C works and I think it is fine as is because
> the enumeration outcome is all standard. You always end up with a
> stable I2C device address (the name) and you always end up with the
> I2C programming API. So it doesn't matter how I2C gets enumerated, it
> is always an I2C device.

I don't follow this logic at all, sorry - whatever the platonic ideal of
what a platform device actually turns out to be when we get down to
using the hardware it's the same hardware which we interact with in the
same way no matter how we figured out that it was present.

--Y1L3PTX8QE8cb2T+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/0iisACgkQJNaLcl1U
h9BB8wf+Nvnu4y6NJYvpzLoo2IgcymvT/prWQ1KEuyqHcAvdeu1xjdLu9OAfjsoy
pMF/Jm/JOZ0IFRHxXoUZFJV9xvCMn872QTO0DcCPdR+fM5h77AYQK8rgtimD/Ub8
EFDtt/K2ISvp4cA+YV9ERnZwi+LGpbUY9r5D9KYUJP4U+qJO1MgMq6YfXqrB2shL
l1ZUB5CF1y5gsuHe4oIT7h510NcjGaOhz8heNjXlfVM2w4gyZjgXvitT9uIxmIzC
TkqwF419JQgTFrNq6BsGB/19WH6AyMEokj987mDVEmeOJsvmZMRtExB4bL0UfgD/
PA6KL84AFXMSXgjzqeapAd8MOcTBnw==
=jQX1
-----END PGP SIGNATURE-----

--Y1L3PTX8QE8cb2T+--
