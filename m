Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9560B334678
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 19:19:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 273571715;
	Wed, 10 Mar 2021 19:18:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 273571715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615400344;
	bh=seX8IHJ8PXMUIRxGxRB5hNS0RqETp5JirlEF/xT6KjY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vWz1/gVQLsOGbiogq25Gw88igUft0tpLKhXVmcyTBGqjwdyNQJomiGt6v1Vm5/S1m
	 9mvX23FmtWRhCcPvhAGSk2hkr2VF2n8p1m79zmjsDbCh3qOfTBqIED2HrJ6lguvJpT
	 XFLrgBAwKbPP8Iv0KCdJw8AXTgnuFj8phSw3z7TQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85906F801ED;
	Wed, 10 Mar 2021 19:17:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD5C7F801D8; Wed, 10 Mar 2021 19:17:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC224F8010D
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 19:17:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC224F8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hcCOJA3u"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 066D564DC4;
 Wed, 10 Mar 2021 18:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615400244;
 bh=seX8IHJ8PXMUIRxGxRB5hNS0RqETp5JirlEF/xT6KjY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hcCOJA3udo3Mgm3NqixPmgYiFXxPg0m3SKW6TtBCx+zFNLB5iBWqXECCQvI4FsBNW
 nMtqzstKw2DDsGCBkVMDtOhDLFoon2gpixwHm+UuanSzFlecBEHt9xS+kH/bM1Y76f
 2cJMcZuOW0OmqmZdKlgj2odBWupbStSQrpdBSVcVJntM17Hh+Ixp9lgGpV44yJCfjJ
 cGgj21wTcBYc05AbrNrbMGs+097PD+4xcNPtOkGPPl7omM+18OolZO/UMiaH9HWae0
 CRvtU4j2a6jObwLc42QU/MyOMfwthRp5uu2wPVgAJ+W3noJSZQsLvngNaWGDiAzceO
 Cz1rAxazj1ttA==
Date: Wed, 10 Mar 2021 18:16:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH V2] ASoC: soc-core: Prevent warning if no DMI table is
 present
Message-ID: <20210310181611.GE28564@sirena.org.uk>
References: <20210303115526.419458-1-jonathanh@nvidia.com>
 <91480f92-a3f5-e71f-acdc-ea74488ab0a1@linux.intel.com>
 <20210310133534.GD4746@sirena.org.uk>
 <6a2352e6-f2b7-def1-de58-52fbeb7846e5@linux.intel.com>
 <20210310161814.GA28564@sirena.org.uk>
 <s5hzgzbvube.wl-tiwai@suse.de>
 <9b073d01-f2fe-a99b-e53c-4a0b3f95ca05@linux.intel.com>
 <20210310165235.GD28564@sirena.org.uk>
 <cf03ce61-1501-e0e7-6887-d921c7d1af62@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="TD8GDToEDw0WLGOL"
Content-Disposition: inline
In-Reply-To: <cf03ce61-1501-e0e7-6887-d921c7d1af62@linux.intel.com>
X-Cookie: Yow!  Are we laid back yet?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>
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


--TD8GDToEDw0WLGOL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 10, 2021 at 11:50:13AM -0600, Pierre-Louis Bossart wrote:
> On 3/10/21 10:52 AM, Mark Brown wrote:

> > Build time dependencies aren't going to help anything, arm64 (and to my
> > understanding some future x86 systems, LynxPoint IIRC) supports both DT
> > and ACPI and so you have kernels built with support for both.

> well, that's what I suggested initially:
>        if (is_of_node(card->dev->fwnode))

> I used the of_node test as a proxy for 'no DMI' since I am not aware of any
> means to detect if DMI is enabled at run-time.

Can we not fix the DMI code so it lets us check dmi_available either
directly or with an accessor?  I don't understand why all the proposals
are dancing around local bodges here.

--TD8GDToEDw0WLGOL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBJDOoACgkQJNaLcl1U
h9D+lQf/cbnPJjsJ3ygPrp1tnP/Rp54Yib+fQFY62oCWapnvaBTHjolxWqtrddTO
wswX/BLf4uVVueVQ7AUTuaARx+aan0MAK1/xWU+lyeHcGk0fGy+mV9LFnhGUEEv5
Rke4xQJOwGazHSMb0IBGlfILV9cIJ+G7VTh5pLWvGMrFPT+yw1T35LacGOFwQFvX
gCCwqVqJ70jKVcKqD6BFb/YxsceAAmcp5UgzIs2+fa9UUVF5TxDxXO5EDKAh37Ru
0bedE12aOkCKMoS/UVosteXqppBn5If4QhZGZKojq38ueWyBxZ2Mg3/ZKhHPydgo
W+aXdVobyPhQPKWXhA9GZoFSVwoVAA==
=NWjC
-----END PGP SIGNATURE-----

--TD8GDToEDw0WLGOL--
