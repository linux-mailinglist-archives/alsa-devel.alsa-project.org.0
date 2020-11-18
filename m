Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D16A2B7E57
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 14:34:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03439172C;
	Wed, 18 Nov 2020 14:33:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03439172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605706450;
	bh=hvtQkfWxcopZmZIcl+HTGZIsFTWrhJShM1GeN3gVZIg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ztu2pbXSgCmFIX2mrgpZTGNRefML6PCO13SRfrg7DoAteA4bBXSv38pSiOG4X5GUv
	 UrHgFK0pWLCgr4eIpmvU4yNlHSWH6kK9i6KmaiBGxQc0b6d2vSJNeCS81g5vtiUXsx
	 liBjOz1dIvvPnRkYPnLQEt7KNoXnh9gVij5PJR2s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 662AEF8016D;
	Wed, 18 Nov 2020 14:32:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01202F8016C; Wed, 18 Nov 2020 14:32:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C1C5F80158
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 14:32:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C1C5F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ocsEuCU7"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 10C992168B;
 Wed, 18 Nov 2020 13:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605706340;
 bh=hvtQkfWxcopZmZIcl+HTGZIsFTWrhJShM1GeN3gVZIg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ocsEuCU7sXC+spW7uGDTQF6R9YJTiOmKpxwumxyHLk0vdK1hVsk8dQiInXlW6VA8j
 1VpLCH4XkaYxdkC3Wed0/0+L4MjfhsfAIUlRFdt/HZa4YFN3/AjxI2ZiSrYrSXc5LW
 FRs19BwK/jYdDJLN3LGZG7oAfdWHFOWb7LHVS/DI=
Date: Wed, 18 Nov 2020 13:31:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 06/14] ASoC: Intel: byt/cht: set pm ops dynamically
Message-ID: <20201118133159.GD4827@sirena.org.uk>
References: <20201112223825.39765-1-pierre-louis.bossart@linux.intel.com>
 <20201112223825.39765-7-pierre-louis.bossart@linux.intel.com>
 <20201117171842.GF5142@sirena.org.uk>
 <da03823b-baa0-91b6-c2b0-85733192af68@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sgneBHv3152wZ8jf"
Content-Disposition: inline
In-Reply-To: <da03823b-baa0-91b6-c2b0-85733192af68@linux.intel.com>
X-Cookie: A nuclear war can ruin your whole day.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Rander Wang <rander.wang@linux.intel.com>
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


--sgneBHv3152wZ8jf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 17, 2020 at 11:39:48AM -0600, Pierre-Louis Bossart wrote:
> On 11/17/20 11:18 AM, Mark Brown wrote:
> > On Thu, Nov 12, 2020 at 04:38:17PM -0600, Pierre-Louis Bossart wrote:

> > > +	/* set pm ops */
> > > +	if (sof_parent)
> > > +		pdev->dev.driver->pm = &snd_soc_pm_ops;

> > This might need revisiting in future since we should be able to have the
> > driver PM ops be static const and hence unwritable but that's more of a
> > robustness thing for the time being given that only a limited set of
> > systems have this hardware and we know that there can't be multiple
> > devices.

> FWIW it's been done in other places, e.g.

> drivers/net/wireless/ti/wlcore/main.c:  wl->dev->driver->pm =
> &wlcore_pm_ops;
> drivers/net/wireless/ti/wlcore/main.c:  wl->dev->driver->pm = NULL;

> The alternative would be to add an .ops whose callbacks conditionally call
> snd_soc_suspend/resume/poweroff. Not much cleaner, is it?

It's not really about cleanliness, it's about being able to mark the ops
struct as const and therefore make it read only which the security
people like.

> The check on the 'sof_parent' was not present in initial versions, I had an
> additional 'machine parameter' set by the SOF driver. But early reviewers
> suggested a check on the parent name was enough. It achieves the same thing
> in the end, make sure that we don't change anything for power management
> when the Atom/SST driver is used.

The check is fine.

--sgneBHv3152wZ8jf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+1Ik4ACgkQJNaLcl1U
h9A19Af/foKXtJGA35It+ihuhu4mDIYho/hYPTyqOpC2yHZy9c928aDvyWEE96Iv
fTSA1iTo7/BCbQWRZ2gtwEPP8kFr6GY8xR07V7UHIjHQNSOo/JysKyJPrVkytwZX
iNCL0nl1FlgUt2FzLbZUtAj6lNqgfX7jHvwpFpCYDAU2pPWJdcEqmDfWZ26hHNiP
UyzWyZ1GqxAPjMIqeweitFt3Yfk1AI8qq4hoXAe844+mi7SVIJqTK4z89e2cnRGx
m4bx1vO6cL+emmzvRZTetu7Mr0R2ujRL8+uSsi7GxA8gpvYeV+dp80UInTGuRIs8
766popCR3geNBAOl0FgVe3hTEUGfCg==
=2u7c
-----END PGP SIGNATURE-----

--sgneBHv3152wZ8jf--
