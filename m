Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2645175B5
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 12:12:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CC321AA6;
	Wed,  8 May 2019 12:11:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CC321AA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557310354;
	bh=j7O7dxymPeDOUwR1m8eibYvff+xPh8yLqtAke43UnCI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JYlp1HnPfGmudifg8bB9oD3mnMMISCHCo6x5a/kBfpdc9xYyWbcNmY02X8e2tmodv
	 FleECjo+kkRZWMMQgt/OTFXjNIpc4+Tk+tQg0zfI2UQQUxa8J4OWZniU17R2ZGDXg1
	 QSEyhDBRi+aMFpJrj/Rxf4jeIvtSsGSCNqizGsrc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77921F896FF;
	Wed,  8 May 2019 12:10:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BA6BF896F0; Wed,  8 May 2019 12:10:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4997FF807B5
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 12:10:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4997FF807B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Hl2lBnKu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wmFFpOueGEiFdlEbUOIL3tpiNVIVROHFv3wSXNSyE6Y=; b=Hl2lBnKuvp7xplywQyPUZrMI2
 2g2tRtdIB/YZQPDdZw8k1R4D6uE3u1yWx9WbVxzM48srY/+rUoPKs2adOL/CIt76ld0y69b57c1oj
 Cdd+Y4jqSNDuljAX2/fBoWUhsQhw1r+nUYNkFL4cJ//drldSbH5HwW6sQ5WLbc3uxqdU0=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOJX5-0007q3-F6; Wed, 08 May 2019 10:10:43 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 1E1DE44000C; Wed,  8 May 2019 11:10:29 +0100 (BST)
Date: Wed, 8 May 2019 19:10:29 +0900
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190508101029.GM14916@sirena.org.uk>
References: <20190503064729.GF14916@sirena.org.uk>
 <s5hk1f8m2f1.wl-tiwai@suse.de>
 <20190506042625.GK14916@sirena.org.uk>
 <s5hsgtr6h5y.wl-tiwai@suse.de>
 <20190506140506.GQ14916@sirena.org.uk>
 <s5h4l674n9g.wl-tiwai@suse.de>
 <20190508081006.GZ14916@sirena.org.uk>
 <s5hk1f1nyyh.wl-tiwai@suse.de>
 <20190508085953.GF14916@sirena.org.uk>
 <s5h5zqlnw65.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5h5zqlnw65.wl-tiwai@suse.de>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: Add support for Conexant CX2072X
	CODEC
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
Content-Type: multipart/mixed; boundary="===============4662293116726828677=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4662293116726828677==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zMJiK8ZuAkzScPs5"
Content-Disposition: inline


--zMJiK8ZuAkzScPs5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 08, 2019 at 11:16:18AM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > > there is no i2c irq assigned but only ACPI gpio, as far as I checked.

> > You can map through an ACPI GPIO to an interrupt without worrying about
> > the fact that it's mapped as a GPIO in ACPI IIRC - if you can't there's
> > lots of other drivers are going to have issues.

> But what gives a benefit?  It needs more plumbing between codec and
> machine driver.  The i2c probe doesn't give the irq, so you'd need and
> extra stuff to enable the irq in a different route if you'd need to
> implement the handler in the codec driver.

Handling the interrupt entirely within the CODEC driver *reduces* the
coupling between the CODEC and machine drivers, making it more possible
to use the standard set_jack() interface and generic machine drivers
with the CODEC drivers.

Actually looking a little I think you may need some ACPI specific
parsing code in the probe function to look up the GPIO but that should
just be like all the other DMI quirking stuff, hidden in the CODEC
driver.  It's really sad how bad a job Intel have done of making
firmware interfaces for their audio hardware.  I had thought people had
managed to hide all that stuff but I'm not seeing the code right now.

> Actually, my latest patchset already eliminates the exported stuff by
> moving to set_jack callback like some other drivers do.  If you have
> an idea for further simplification / fixes, let me know.

> I haven't submitted because of the merge window.  The patch is found
> at topic/soc-cx2072x-5.2 branch, the commit is
>   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?h=topic/soc-cx2072x-5.2&id=ca7f4eee5ecbefcf347f5a4984c0a17629360186

I'm on a train with intermittent network connectivity right now (and
getting near to my destination too)...

--zMJiK8ZuAkzScPs5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzSqxQACgkQJNaLcl1U
h9CjuAf9FDK3Qade9+Ul239n1HqfTBwDsqlu+UCYf1No40b1GEDLJJXase3PmfCq
8Ec4KY0BbKmI92OiOFT6hFzDu8uF6GB7TTgHMfqNec5no6B3LCjNi4BY+ZPkEC5a
rogabKe8iQSkLI9rOPXDaNZo87U9qcBwSGmSlTo4wsidfzN9byeIRYDToWMh8Kzi
u6D+zPfDSUbbNtmgaYCcOkcHoRc8EqEkU/4DuEJxDIxv6Ngz6pbNEC8EHzPzQh+n
2tc9Kw2Ac+z5GATdLUwje5xtvk+ME5HkyPHXZgI7TAFAjWotmzgMnlw6Bu7QaJXB
riOlPzYvZaD1joxiWgVUbekF1bTfBw==
=Xyxy
-----END PGP SIGNATURE-----

--zMJiK8ZuAkzScPs5--

--===============4662293116726828677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4662293116726828677==--
