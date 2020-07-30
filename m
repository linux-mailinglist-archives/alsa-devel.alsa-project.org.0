Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E142330F6
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 13:32:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 963A91781;
	Thu, 30 Jul 2020 13:31:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 963A91781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596108729;
	bh=b6nM0yi9ipmNNzpI+dXWUsg87OuQIhhGIvUTNerwXn8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OAs1ZnMPaUeiw0J9PMEiriiEUqHc78WFA6qUM+4C4U+aQDw3FGeuxd3Z7O42NuUUD
	 Dn5E7rlL+On1H+/ulfcgvdrHrhR9MTjlgZYUDxnMvqh+Plg7uPX7yvi9oTyqiHVq0C
	 3o8bCcS+f87yAuKNI6ym3kELkoupSMjRE43Jd3/E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3FF2F8021C;
	Thu, 30 Jul 2020 13:30:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D093F8021E; Thu, 30 Jul 2020 13:30:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59ABEF800C9
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 13:30:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59ABEF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WrEu4pXG"
Received: from localhost (cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 [82.37.168.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 523E52074B;
 Thu, 30 Jul 2020 11:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596108608;
 bh=b6nM0yi9ipmNNzpI+dXWUsg87OuQIhhGIvUTNerwXn8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WrEu4pXGjXJHMcGugDNNGkwJ6zOUUOh37QE2D4FMpbUK5XEsvx6vY5NLCQTbGrfWP
 HE0Qya1H/UyoCgrB7DE2EfQGlYexPi/k5xVRknwvaoenzHmER0u7fEGSGFB3hxy4q6
 BANvvahtwQgWRCFRmvBADN1TuD1Ev3IvH7RwqyVM=
Date: Thu, 30 Jul 2020 12:29:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Subject: Re: [PATCH 4/4] dt-bindings: sound: intel,keembay-i2s: Add
 channel-max property
Message-ID: <20200730112948.GB5055@sirena.org.uk>
References: <20200730055319.1522-1-michael.wei.hong.sit@intel.com>
 <20200730055319.1522-5-michael.wei.hong.sit@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kXdP64Ggrk/fb43R"
Content-Disposition: inline
In-Reply-To: <20200730055319.1522-5-michael.wei.hong.sit@intel.com>
X-Cookie: Alex Haley was adopted!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: pierre-louis.bossart@linux.intel.com, cezary.rojewski@intel.com,
 andriy.shevchenko@intel.com, alsa-devel@alsa-project.org,
 jee.heng.sia@intel.com, tiwai@suse.com, liam.r.girdwood@linux.intel.com
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


--kXdP64Ggrk/fb43R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 30, 2020 at 01:53:19PM +0800, Michael Sit Wei Hong wrote:

> Add a property that configures the interface to the desired max number
> of capture channels. The platform may have multiple interfaces with
> different number of capture channels.

Why?  None of the other platforms which support many channels need this
defining and the constraint code and/or machine driver would normally be
where this would be handled.

--kXdP64Ggrk/fb43R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8irysACgkQJNaLcl1U
h9AAbQf7BPCUuR2WzP9eJg5l5lN5/5KLvmPA8FlR4KkG+X21O8/l5xMmw8se6GMk
lNhuAmksk9CJOub04xN4GMmvq3ah57Xkqgbw369SsmdbhwSF2Eukrry4wuU9cWS9
BpiNM9cYcuwTskE8jfR+dVw837/cLrHrL/Bv6gtyYzfBd4o3PwSmIY4/t0ZdWcom
uNGF1yi1iL6zWOixXyzUtPJVWU+CudpX+sv+1jv7dWV4kqwS6nGDQ5xhShperjN1
Et/7QbyCGJH1go1S5mIhREWBTTK73B8GPj5ysHdg6dvaw4yJUSGT1846r9QcKNS4
e5NXWC6Wd+Wc2RKmwI57iSxN5d69Fg==
=MFV0
-----END PGP SIGNATURE-----

--kXdP64Ggrk/fb43R--
