Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA47280386
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 18:06:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39BCE190F;
	Thu,  1 Oct 2020 18:05:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39BCE190F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601568372;
	bh=k4LUeccxTyHBjp9xcKUI8+JNCP+9Mh4BzhM5Hup6HN0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tXeSVJhSnuwxDulpBDAzsMuQfzEUgm5VZqxX71hwbwZmaP0iiBLEpg1UTHNNbtmo3
	 4qFjM8UtsAXYHVDYeo/NubUzwlO2Wad06vYm1rjf9pZG/9whGe2qZiKfKxoQLoeAXS
	 mTKCv4PTwmP9ojEPbAFkMDRediDKQMHOYzsVtVl0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A736F800AB;
	Thu,  1 Oct 2020 18:04:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29064F801F5; Thu,  1 Oct 2020 18:04:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D907CF800AB
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 18:04:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D907CF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CSXQffwe"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9D17C208C7;
 Thu,  1 Oct 2020 16:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601568256;
 bh=k4LUeccxTyHBjp9xcKUI8+JNCP+9Mh4BzhM5Hup6HN0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CSXQffweE1ofXKcOzcGEU/T7VT6NfPf4jmEUlhkT5eZ4huEyWi1APZqS1+BAoKxtA
 j27YVBTdOqnRqqZIOO4NhQj/Pd6pmXvnSfZ0Ee4IBU4IGmLDdNEssFt09EjlRsoATs
 FVgApKeG50D2bM50bBRoLvRlKkU0lpbqvfNSYH+o=
Date: Thu, 1 Oct 2020 17:03:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Message-ID: <20201001160316.GL6715@sirena.org.uk>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20201001125038.GC6715@sirena.org.uk>
 <20201001131252.GA2382269@kroah.com>
 <20201001144019.GJ6715@sirena.org.uk>
 <20201001153207.GA2414635@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="YZQs1kEQY307C4ut"
Content-Disposition: inline
In-Reply-To: <20201001153207.GA2414635@kroah.com>
X-Cookie: Stay away from flying saucers today.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, ranjani.sridharan@intel.com,
 pierre-louis.bossart@linux.intel.com, parav@nvidia.com, jgg@nvidia.com,
 Dave Ertman <david.m.ertman@intel.com>
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


--YZQs1kEQY307C4ut
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 01, 2020 at 05:32:07PM +0200, Greg KH wrote:
> On Thu, Oct 01, 2020 at 03:40:19PM +0100, Mark Brown wrote:

> > Right, so my concern is that as soon as we decide we want to pass some
> > resources or platform data through to one of the subdevices it needs to
> > move over into being a platform device and vice versa.  That feels like
> > something that's going to add to the mess for some of the uses.

> There shouldn't be a need for resources or platform data to be passed
> that way as they are all "owned" by the parent device that creates
> these.

> I don't want to see platform devices become children of real devices
> (like PCI and USB and others), which is the goal here.  platform devices
> are overloaded and abused enough as it is, let's not make it worse.

How does this interact with the situation where someone makes a PCI
device that's basically a bunch of IPs glued together in a PCI memory
region (or similarly for other buses)?  The IPs all have distinct
memory regions and other resources like interrupt lines which makes them
unsuitable for auxilliary devices as proposed, especially in cases where
there's more than one copy of the IP instantiated.  There's a bunch of
PCI MFDs in tree already of admittedly varying degrees of taste, and
MFDs on other buses also use the resource passing stuff.

--YZQs1kEQY307C4ut
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl91/cMACgkQJNaLcl1U
h9D5dwf/b1Bb0BhUOvKUjU0uQSfvUjms78axj0AAUXDziWiR72NPR6y5LWFoCSn5
SnaIeZwTnJlR64t8H15eGrcaFRmhr620EiLzr/eFEO1VQhZ4/XEk3AeFF+5g5O3c
HULXJzeX9p7ppiJoKBz/WmIxxJiHu4pW+IMZg700weQOJ6tjL1R4jpa5qVRffMQa
xj2vkBH6TzfWYSB4GIkuu1SFmS2e9FCBd9hiwd7G85l7h4idk5teg4tIBmkg4RSR
wZA8t6pzp5GarG6NRhK0qGhcrRV2Jh92QxBP0voN+iTvE1kPRVww1dIglH59uddt
2ddmyUO4WoUs0yPv6EJ0GSwwvIbWCQ==
=rHn7
-----END PGP SIGNATURE-----

--YZQs1kEQY307C4ut--
