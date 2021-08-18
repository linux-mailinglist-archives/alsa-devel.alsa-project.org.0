Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D113F0A96
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Aug 2021 19:54:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1902816AE;
	Wed, 18 Aug 2021 19:53:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1902816AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629309282;
	bh=1PdxaWp06Zf1Xx0MXjBNoAEoceqXLG1oWGBvQ2KKlOc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=toLwQsTm/nivkkTwteBnxYbqulmN8sq6iak0G52oeRyfESMU4j81eVI/aT1hDFEky
	 u4Fhjiu+3zedfQim+ftNKCSsi315rE3zMPYW+tTbSaQON2bsUKiwoYPIGuY9uYRvaZ
	 71Pizex4YpjihlG/5Ycn8LR61wv9cJnoEioopZpk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71AC2F80169;
	Wed, 18 Aug 2021 19:53:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D7F5F80249; Wed, 18 Aug 2021 19:53:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 570E0F800EC
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 19:53:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 570E0F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SLd31OBj"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E0707610FE;
 Wed, 18 Aug 2021 17:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629309192;
 bh=1PdxaWp06Zf1Xx0MXjBNoAEoceqXLG1oWGBvQ2KKlOc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SLd31OBjz0uHbH9KlXK8JfjhPgOz+fH3TPjxJpsFbRnXfcn7OiQ87tgPBI27jOhi0
 +WrXL+xU+PO//dKLvHCTGnBxVmCl1SWh8Efs26bI9aOpHZVpczVpdmF8k5WrLp+QXM
 7XQgbPEjfwMVwWrZvP12m0WXRKYK7GSiCwvSnCkf4g0iyJ13REzyfK78DM/VZsonV2
 0LTs45/dt6pPeFqxrcrXFRqJpL6JLm3mlQyNkpAB6/wIo84cnCu8/KxryEo8jo4vjG
 o/kep2w6uY4h+do1hGEi8mMMMziO89FDzVvcS8nBgagD63cSjdhF8bNPWepurPyrok
 nOmYyfgtEZ4Cg==
Date: Wed, 18 Aug 2021 18:52:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RFC PATCH 1/2] driver core: export
 driver_deferred_probe_trigger()
Message-ID: <20210818175248.GH4177@sirena.org.uk>
References: <20210817190057.255264-1-pierre-louis.bossart@linux.intel.com>
 <20210817190057.255264-2-pierre-louis.bossart@linux.intel.com>
 <YRyeR6imvSwOOasQ@kroah.com> <20210818115736.GA4177@sirena.org.uk>
 <YR0Ji7DQXoo0z4vP@kroah.com> <20210818134814.GF4177@sirena.org.uk>
 <14235b8d-d375-6e2d-cae9-33adf9c48120@linux.intel.com>
 <YR0nAcC3wJd3b4Vu@kroah.com>
 <be1ea414-b2ad-162d-192a-7b55e40b3754@linux.intel.com>
 <YR06L+gTzyiYY/rG@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="CNfT9TXqV7nd4cfk"
Content-Disposition: inline
In-Reply-To: <YR06L+gTzyiYY/rG@kroah.com>
X-Cookie: She sells cshs by the cshore.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 tiwai@suse.de, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Dan Williams <dan.j.williams@intel.com>,
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


--CNfT9TXqV7nd4cfk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 18, 2021 at 06:49:51PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Aug 18, 2021 at 10:53:07AM -0500, Pierre-Louis Bossart wrote:

> > It's been that way for a very long time (2015?) for HDAudio support, see
> > sound/pci/hda/hda_bind.c. It's my understanding that it was a conscious
> > design decision to use vendor-specific modules, if available, and
> > fallback to generic modules if the first pass failed.

> If it has been this way for so long, what has caused the sudden change
> to need to export this and call this function?

The usage predates the hardware that requires firmware downloads -
that's very new.

--CNfT9TXqV7nd4cfk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEdSPAACgkQJNaLcl1U
h9DBxgf/amTh9hfO6aFUgwqDOv0qsAVXUkdiweHKmeTccre1+YQ2bhp2YsUM/gB4
hUEYHxhRPUJcTiEN9dxicfru+l/6Rm0tMpdUok8KtpVa+x7NK87yy14ce02vpjiS
G9G3k6IHU/R9xP9sXYLFTkY1+Odq1JJYNok+vgdsl39D1pXXOEDpOa0ynOOmAR0+
/Hs6Rsr+D4SwEjpBHPPeW/xW4g+MnXNzoIh/WP+K+goZAvRXfBIFo60ZjzPf7aHv
Taq3g9xwOdFXHHHFmTyrZ+4wSNxsEQokzq0O6qKLN79ITljb0hjiy43MN20yeDsG
h6ygHH2+gfeAdDG2rcHpinneo56wLg==
=69mB
-----END PGP SIGNATURE-----

--CNfT9TXqV7nd4cfk--
