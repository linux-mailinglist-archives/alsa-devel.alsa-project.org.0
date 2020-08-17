Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D61F524737F
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 20:57:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75CD416F3;
	Mon, 17 Aug 2020 20:56:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75CD416F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597690635;
	bh=Nc5tx9MY3htbvFK8fcEZIYObQdndgngLn3mqn/2Jm8g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hCljran6zoj/JpXcPaMJbO4Hn5VWFJRXvkTief9SPfQoapwXQiJqTOlRIC1VarSH4
	 LujPceSlECg3qzrHM44nt4pzL7UaZzBPRRTSQdyCE1gZMNubKv2ZwJxxt71k3ARc8M
	 MrT9UL33i1LDU4pXP2PlrAisZWq/h/tazCzpGLUI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2C0FF80255;
	Mon, 17 Aug 2020 20:55:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B71FF80218; Mon, 17 Aug 2020 20:55:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 940C4F800EF
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 20:55:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 940C4F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="A0bXs+cm"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 526CD204EC;
 Mon, 17 Aug 2020 18:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597690519;
 bh=Nc5tx9MY3htbvFK8fcEZIYObQdndgngLn3mqn/2Jm8g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A0bXs+cmMaz+IbHH0jThM9KPgbp0OfRNEdfGKERKyDN4N0Hc9/krruMRvLp3nM8kK
 jqY7AZo0rMrjylwNTSTsci5ZBCxl/ym8+tHueg9I6XTPZLS6q+4Cg8MWF8ADrqTdja
 bh3UggiivNDFxUGoZZfr5Wuk/S8FlkdWaU3aLHS8=
Date: Mon, 17 Aug 2020 19:54:48 +0100
From: Mark Brown <broonie@kernel.org>
To: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Subject: Re: Enabling DAPM for Dummy DAIs
Message-ID: <20200817185448.GB6661@sirena.org.uk>
References: <DM6PR11MB290561D66CB13F86B419004CE8430@DM6PR11MB2905.namprd11.prod.outlook.com>
 <20200814123712.GB4783@sirena.org.uk>
 <1a8e6e8872692ea88bd7905ed5ae0e8e2a8c0414.camel@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="61jdw2sOBCFtR2d/"
Content-Disposition: inline
In-Reply-To: <1a8e6e8872692ea88bd7905ed5ae0e8e2a8c0414.camel@intel.com>
X-Cookie: Ignore previous fortune.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "tiwai@suse.de" <tiwai@suse.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "bard.liao@linux.intel.com" <bard.liao@linux.intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>
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


--61jdw2sOBCFtR2d/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 17, 2020 at 05:45:59PM +0000, Sridharan, Ranjani wrote:

> Thanks, Mark. But I am still confused by what you mean by a simple
> codec here. Would this simple codec be registered by the SOF platform
> driver?

Any CODEC driver that doesn't require software control.  I have no idea
what would register something with the whole probing situation you have
- ideally you'd just be able to use the actual configuration of the
board you're on.  Given you're already registering platform devices for
things not described in ACPI whatever does that is probably the right
place.

--61jdw2sOBCFtR2d/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl860ngACgkQJNaLcl1U
h9CkdQf/UgL6BlsjzD8utdr9uAg92V9W5fT+vEB0C5kkUiGnAk4Rb+X54ATC7Sew
0FAgnNS61U7SEjCN+M5N0MLP+XOU2BlyiQBizYJvZL2hedtjJY6CpBGClCgusChO
8VFxcXgUyw3FEpKkh5fOXL/+epIJ5JsqwfjsgqNvtNVPotFnToN/FsERRmRG0TVn
GjiT0h/rx4FGSrt1EqpIJxLZdGmIw6d0le6qHDiMB6FkTcgT3oIiaKwoju1Ve8gj
i/rfbQqjiUVt8KMBKjmhZkYcmGD7HlU8VGs2meApnt6KuxFFw7rNNIEOd/s1g1pQ
2r0f85kOIqBeviMPnpBQPxAe1sFHKQ==
=KQLv
-----END PGP SIGNATURE-----

--61jdw2sOBCFtR2d/--
