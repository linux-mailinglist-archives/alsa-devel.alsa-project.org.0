Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F0F2807B4
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 21:26:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F41F1AB5;
	Thu,  1 Oct 2020 21:25:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F41F1AB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601580366;
	bh=rVwhWht7vfND61ye/VBOaSfKC68t3EvQYJd/G43r5Es=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K14DeatQx/5IC9NP6vQbXp6BnnBwOkikkS0kXvT5PkhwD5hja5yuo+nZsyqiuC28u
	 DkHVifsUfC6/U8zHogZ/FHblW+4sYGdrE6yfRqq30seUK/CzplLVGuXjOd/I/BfQ7U
	 +dKPTbTkqG8Uckn5XJG0TR5YHTeCg8K0ve73orKI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DED1F801DB;
	Thu,  1 Oct 2020 21:24:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29724F801F5; Thu,  1 Oct 2020 21:24:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6936F80105
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 21:24:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6936F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XTTaNqw0"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9EE2A20759;
 Thu,  1 Oct 2020 19:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601580251;
 bh=rVwhWht7vfND61ye/VBOaSfKC68t3EvQYJd/G43r5Es=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XTTaNqw0ppxcvwSfF+Lf61pYR+tn0y36CenqtDyeWrU0w4GammyAIkOqHNsxnxrKY
 XuZ7RoIhocepQ1fB6gXRb32NBkKhBkL4/zeZrCDGWGquUACBVwFy4CWP+KFTjGh6SL
 uGhHf4G1tqmVFxJzsKjLSW0fUrTREBoGI9PzExqs=
Date: Thu, 1 Oct 2020 20:23:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Message-ID: <20201001192311.GV6715@sirena.org.uk>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20201001125038.GC6715@sirena.org.uk>
 <ddb019b8-4370-eca8-911f-38adf0531076@linux.intel.com>
 <20201001152450.GK6715@sirena.org.uk>
 <2ba29c19-205b-6d0a-3a28-f9d5cc32adfe@linux.intel.com>
 <20201001165137.GQ6715@sirena.org.uk>
 <20201001180448.GB816047@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="b9dEYEwnDXkv9lSy"
Content-Disposition: inline
In-Reply-To: <20201001180448.GB816047@nvidia.com>
X-Cookie: Stay away from flying saucers today.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 ranjani.sridharan@intel.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, parav@nvidia.com,
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


--b9dEYEwnDXkv9lSy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 01, 2020 at 03:04:48PM -0300, Jason Gunthorpe wrote:
> On Thu, Oct 01, 2020 at 05:51:37PM +0100, Mark Brown wrote:

> > As you'll have seen from this thread and the prior version (which was
> > the first time I became aware of this stuff) I'm not clear how that
> > desire maps on to hardware, as soon as subdevices start needing to get
> > regions and interrupts mapped then we're going to end up reinventing
> > resources and regmaps AFAICT.

> I think the truth is MFD and anciallary bus are solving almost the
> same problem and could meet in the middle at some point.

I do too, which is why I am pushing back.

> Since Greg has completely NAK'd using pci_device inside MFD it looks
> like this is the preference.

I know Greg has said he doesn't want this, I would like to if not change
his mind at least understand why so we can understand what we are
supposed to be doing here and ideally capture it in the documentation.

> If people have a use case for regmaps/IRQs then they should add them
> here. Right now the places I know of don't need this.

If it is actually the case that we're not supposed to instantiate
platform devices as children of devices on actual physical buses then
there's a huge chunk of existing MFDs that are use cases, including some
PCI ones (though the PCI ones aren't great for the most part).  If it is
just PCI and USB devices then it becomes difficult to articulate the
underlying logic about why those bus types in particular.  I would
expect at least some devices instantiated on PCI attached FPGAs to also
need resources (it looks like at least one of the PCI MFDs that's been
in the tree for a long time, timberdale, is actually such a device
although not very dynamic like they could be).

I think the fundamental problem here is that this is all representing
hardware which doesn't fit neatly into abstractions and that trying to
separate out things based on abstract criteria (especially poorly
defined abstract criteria) is going to leave us with a pile of sharp
edges for people to run into, at least in terms of confusion and hassle.
The messiness that exists is I fear a reflection of reality.

--b9dEYEwnDXkv9lSy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl92LJ4ACgkQJNaLcl1U
h9CxhQf7BFUc1ImKlSDGXyUAbLPo/MdbyUpiKTras0WNUTmDIpbMnwdMCFzFg5HE
HKTN3RlBCpgWnlIfcDnO1kjkKSceeRxFo0P8bg+/PMCpBkKWo1ZxKywr5+bGW/VP
xwSfqw6jkjY46LNBlJJjWUhJG9woX/A0NGgCio5c43C4nmvdzjjHQZlbc+FeRbQo
HPRvaz+DkpsHAkHEtrNV4M64I4+3ZUiDqU+521j9x2oblvxfubTfv/XyXlVi8IiF
x7RuB0cz+bhH/Fue4Imwg3gsFEAwYaiJNJl4DqXw1dFbeObEIgzHQlWAr+1g8Gyo
drTrozC6WDswENHZWwRF/IGfRdDFrA==
=u6Sh
-----END PGP SIGNATURE-----

--b9dEYEwnDXkv9lSy--
