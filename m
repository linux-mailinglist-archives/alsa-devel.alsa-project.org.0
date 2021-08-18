Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 994993F053F
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Aug 2021 15:50:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 366311686;
	Wed, 18 Aug 2021 15:49:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 366311686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629294606;
	bh=0JN4PN4tbkcM834D1zmXbpBdVxfX6OE1teF1op5KPZo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E4gQ1sJm2mEYJGi4tD/HiYL04k7MNsXNRknAPccaUoGRgqxsIbQmfep5vWDfzh8zD
	 hzpsi+f5LERvwhAw4ee41QIFlxDG+pe/LtGDOWIrV9RQKjqSBXWUb8fDPWCzgWfP+c
	 c9BbaOS5igNdlGHn2wFd4hrcQ68so36oxvuGXioI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83C26F80259;
	Wed, 18 Aug 2021 15:48:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE090F80249; Wed, 18 Aug 2021 15:48:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CEEFF80163
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 15:48:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CEEFF80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RzB8jq+K"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5669B6109F;
 Wed, 18 Aug 2021 13:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629294517;
 bh=0JN4PN4tbkcM834D1zmXbpBdVxfX6OE1teF1op5KPZo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RzB8jq+KqDoZy4T1vdam1qn0CBnITBxKoejFRpEPJaJc+3VNSl3vOvdEFWzCdWr+5
 VHy9Els32tdBjtFktRZv6Kf39PbdOzN2ysJaLyL+nYBjjCdAv4nByek+c7Je1J+MQz
 R9SXcJa/uv9SXFUGdBTwcfO1b/9/sifB7ruw0pzXOvdph6vsXNz+SH53MqTthbAday
 V8iSY//Dvc4tsfnF/lgVsqvOCvQoCaalxma0z3GsrzWIGp+FBFDT84W0PkDXK5PgT8
 AwpqfdQ2Ae9BkAi3ajSGwm3/8ZRvrN86rHjOnXpt3YNqrYrWyBwHvE/NhBRI7cphVB
 oEWh3d75Feqsw==
Date: Wed, 18 Aug 2021 14:48:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RFC PATCH 1/2] driver core: export
 driver_deferred_probe_trigger()
Message-ID: <20210818134814.GF4177@sirena.org.uk>
References: <20210817190057.255264-1-pierre-louis.bossart@linux.intel.com>
 <20210817190057.255264-2-pierre-louis.bossart@linux.intel.com>
 <YRyeR6imvSwOOasQ@kroah.com> <20210818115736.GA4177@sirena.org.uk>
 <YR0Ji7DQXoo0z4vP@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="AH+kv8CCoFf6qPuz"
Content-Disposition: inline
In-Reply-To: <YR0Ji7DQXoo0z4vP@kroah.com>
X-Cookie: She sells cshs by the cshore.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 vkoul@kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christoph Hellwig <hch@lst.de>
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


--AH+kv8CCoFf6qPuz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 18, 2021 at 03:22:19PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Aug 18, 2021 at 12:57:36PM +0100, Mark Brown wrote:

> > The issue is that the driver core is using drivers completing probe as a
> > proxy for resources becoming available.  That works most of the time
> > because most probes are fully synchronous but it breaks down if a
> > resource provider registers resources outside of probe, we might still
> > be fine if system boot is still happening and something else probes but
> > only through luck.

> The driver core is not using that as a proxy, that is up to the driver
> itself or not.  All probe means is "yes, this driver binds to this
> device, thank you!" for that specific bus/class type.  That's all, if
> the driver needs to go off and do real work before it can properly
> control the device, wonderful, have it go and do that async.

Right, which is what is happening here - but the deferred probe
machinery in the core is reading more into the probe succeeding than it
should.

> So if you know you should be binding to the device, great, kick off some
> other work and return success from probe.  There's no reason you have to
> delay or defer for no good reason, right?

The driver that's deferring isn't the one that takes a long time to
probe - the driver that's deferring depends on the driver that takes a
long time to probe, it defers because the resource it needs isn't
available when it tries to probe as the slow device is still doing it's
thing asynchronously.  The problem is that the driver core isn't going
back and attempting to probe the deferred device again once the driver
that took a long time has provided resources.

> But yes, if you do get new resources, the probe should be called again,
> that's what the deferred logic is for (or is that the link logic, I
> can't recall)  This shouldn't be a new thing, no needing to call the
> driver core directly like this at all, it should "just happen", right?

How specifically does new resources becoming available directly cause
a new probe deferral run at the moment?  I can't see anything that
resource provider APIs are doing to say that a new resource has become
available, this patch is trying to provide something they can do.

--AH+kv8CCoFf6qPuz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEdD50ACgkQJNaLcl1U
h9DvcQf7ByAlmoXWhkLU3DIqWbUI/qYSjhgG6r9B0oaU0bZjJvbxEDCAt7n66jdJ
XtuJ7GQ6iG2EnYiYkFwu8tiVLH8jbiIjSiWmKalz3e7FHawVg7fwTdGxw13Fh9Z0
YpJjFbLf1OKO2OmYjtcDOAx0LXDvAIYDg+fd6dYf3tqH8gheT3hfMpvqJ0DANOAG
LwLiexLkX8ZIpZo2Utksj5XAnSBaoSmDTbVwWJPz7EKOKj9UA93n1wB+voxJxMmZ
Z4wlTQgpcJ/a28ZxhfS5auZ5bouxlnER2dfdEGUCFTl3MqgfYrh1068SKpFZexUV
9JFTsoDZ8OoP8vjCwqA4AmJmi198fw==
=NcUi
-----END PGP SIGNATURE-----

--AH+kv8CCoFf6qPuz--
