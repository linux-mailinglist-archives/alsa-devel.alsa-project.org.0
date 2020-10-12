Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B50B928BFB6
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 20:27:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32C93168D;
	Mon, 12 Oct 2020 20:27:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32C93168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602527279;
	bh=4+xhWzBeY5XLTaQye2QrxMhVi+sVMIFBiPg2Rpn92cc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cvyz4fM4GoyD6YJzVB1hMso38uDWpByS8QB72r4J1y6zDyCRbv0X1tqZRjfLt/ZGd
	 eIWYNI3K9ElEEQ9PK7c+y+y9WNis1xad+t+32R0KmDKXA8Uq+kHdXzcOfGJhUZz4OW
	 WDV7SK27sEq/XA0FRJxFtXM2aFMm32yMdvt9Z9pc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE575F80141;
	Mon, 12 Oct 2020 20:26:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A047F80217; Mon, 12 Oct 2020 20:26:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 988A1F800D8
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 20:26:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 988A1F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VZAJa/c+"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D9EDB20708;
 Mon, 12 Oct 2020 18:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602527169;
 bh=4+xhWzBeY5XLTaQye2QrxMhVi+sVMIFBiPg2Rpn92cc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VZAJa/c+W5KKbY60ex/UuFMJ1GNbapojwPBCPrrfgv7RYQ2lWXve7gzJt5ZtS9O+5
 BA4n0qLNSeXJ+h3ks7npv+tsF4p+LrpBLeuRQn+hdklcOl8FHRdrx1KCZpGXtNfYec
 YX9tIcF6eyawfurO/oW88rHSMu6Nr4AfjDOyv/+4=
Date: Mon, 12 Oct 2020 19:26:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH] ASoC: dmaengine: Document support for TX only or RX only
 streams
Message-ID: <20201012182604.GH4332@sirena.org.uk>
References: <20201008161105.21804-1-broonie@kernel.org>
 <20201009102751.GS4077@smile.fi.intel.com>
 <20201009103124.GT4077@smile.fi.intel.com>
 <20201012133745.GD4332@sirena.org.uk>
 <20201012135527.GW4077@smile.fi.intel.com>
 <20201012154803.GG4332@sirena.org.uk>
 <20201012163147.GD4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="o71xDhNo7p97+qVi"
Content-Disposition: inline
In-Reply-To: <20201012163147.GD4077@smile.fi.intel.com>
X-Cookie: Fremen add life to spice!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Stephen Warren <swarren@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Michael Wei Hong Sit <michael.wei.hong.sit@intel.com>
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


--o71xDhNo7p97+qVi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 12, 2020 at 07:31:47PM +0300, Andy Shevchenko wrote:
> On Mon, Oct 12, 2020 at 04:48:03PM +0100, Mark Brown wrote:
> > On Mon, Oct 12, 2020 at 04:55:27PM +0300, Andy Shevchenko wrote:

> > > 	if (ret != DMA mode ok)
> > > 		ret = try PIO mode;

> > > which makes OF dependent parts gone along with relying on the properties rather
> > > than real resource availability.

> > I don't understand the blocker to writing that code at the minute?

> Return code in both cases DMA okay, DMA is not okay is 0.

Ah, right - we don't really expose the resulting component to the
drivers.  Although we don't appear to have any drivers doing the open
coding you suggest?  The active use case we have is for drivers
(currently only the STM32 SAI AFAICT) that always do DMA but only do one
direction (not half duplex, a single direction on a given DAI).  They
don't want to fall back to PIO, they want to know which channel is
valid.  It's not just a DMA/no DMA question, it's also which of the DMA
channels are valid.

--o71xDhNo7p97+qVi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+En7sACgkQJNaLcl1U
h9DLNgf7B+s2Q5VEKdXCgJJRpuFbD/mJ68LXOjKLkipzzuEfEEaHZUO1NOf4C+XE
1r2Pswtu1hs2i4xBHTwgd7r9I0xtQC/BG9FGl46Q6w5x6Zg0MbfZvf8Sa3nCqZ9B
hHGw1qdVuyHC4Tr7rV0c3WKWoRpvIZxqC8pT1fu9f4xi+3pQdhLJpFDnw0I0wOK1
XdCAlQzTaYy5aYtltwE2y8DG+I8yj9tNy+rMrD+d585TLMebCxwpraMdfhN9YxLW
Oaa6O+ZDuZvRy4dqcKmCWqoij01H78Vpr4Es9UhToxxMeGKeUOzt8nPjWLKEqy4A
NjZnUY1DELlfo7ZiYRMXJ56tbjuJgg==
=Kanm
-----END PGP SIGNATURE-----

--o71xDhNo7p97+qVi--
