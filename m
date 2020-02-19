Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 625B1164C6F
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 18:47:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF54216AD;
	Wed, 19 Feb 2020 18:46:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF54216AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582134470;
	bh=6jQXc7OQT6Tcx9ZaYTOFIo+N/ctZIbnsTNU0Eriz2NY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FxF6kny1X3NEgXJDSvNGaY2puR4wZFY7lZ9eyymMblfOqnHcM3XxO/cspfTiHPRUA
	 BytqpFBQJ2m5FTBL4mRQ5fheoCG7tjMzYU23YkJ/GSEQMiZKqNvRas6DXwq4xCTm4w
	 RFBxP+XAxLOMf92Mkc2yuyXzWB+64m+fnnqyTczY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6FDAF801F5;
	Wed, 19 Feb 2020 18:46:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24FA6F80273; Wed, 19 Feb 2020 18:46:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id A7B8FF80142
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 18:46:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7B8FF80142
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B19E131B;
 Wed, 19 Feb 2020 09:46:02 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35EC33F703;
 Wed, 19 Feb 2020 09:46:02 -0800 (PST)
Date: Wed, 19 Feb 2020 17:46:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] ASoC: cpcap: Implement set_tdm_slot for voice call support
Message-ID: <20200219174600.GH4488@sirena.org.uk>
References: <20200211181005.54008-1-tony@atomide.com>
 <ae2b7d9e-d05e-54ac-4f18-27cc8c4e81a0@ti.com>
 <20200212144620.GJ64767@atomide.com>
 <9a060430-5a3e-61e1-3d2c-f89819d9436f@ti.com>
 <20200217232325.GD35972@atomide.com>
 <8fc1dded-6d28-f5cd-f2f9-3a6810571119@ti.com>
 <20200218153211.GI35972@atomide.com>
 <20200218170628.r47xc3yydg6xx2yh@earth.universe>
 <20200218174258.GK4232@sirena.org.uk>
 <20200219173902.GA37466@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+Z7/5fzWRHDJ0o7Q"
Content-Disposition: inline
In-Reply-To: <20200219173902.GA37466@atomide.com>
X-Cookie: FORTH IF HONK THEN
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Merlijn Wajer <merlijn@wizzup.org>,
 Takashi Iwai <tiwai@suse.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Pavel Machek <pavel@ucw.cz>, linux-omap@vger.kernel.org,
 "Arthur D ." <spinal.by@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
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


--+Z7/5fzWRHDJ0o7Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 19, 2020 at 09:39:02AM -0800, Tony Lindgren wrote:
> * Mark Brown <broonie@kernel.org> [200218 17:43]:

> > you to address for system enablement.  OTOH if you manage to get one of
> > the generic cards working well that'd be excellent!

> Well to me it seems that we just already have all the data needed with
> the graph binding and snd-soc-audio-graph-card + codec2codec support.

> I don't think we have cases where the cpcap codec is not the master,
> so as long as the cpcap codec knows what's going on then there
> may not be a need for machine driver.

> I guess the the bluetooth to modem path is the one to check to see
> what provides the clocks..

Usually in telephony cases it's the modem that's the clock master FWIW.

--+Z7/5fzWRHDJ0o7Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5NdFcACgkQJNaLcl1U
h9BHgQf/WmvIam0UASnfG1o54i1CWeWsvsmiCK7/+FWgq77+E+b2l7WNCZLeu/4r
g7DR1qjj+5Ogl5aUXofhX4nOIBziyJTk1uEjy4MNFr5fIzexu4zaV2hNPuzcJ8YF
21g7bpU3IrsVnaldU5zh4e6olPpVwfBsB7UboCb2fWidPqe3d525T2L+pj3l1HfZ
9TEr58a2UEpQh9f+33kJKhmMmNhwh1ycKm2A9bRrRGfNOneX3mw0CfDGby6QpAfU
F80CcEmoDlHYzrLcE7osxHLLWdIR+f2iMi1LXR4QfyM4oz7J8f2imPHKOZDXPqjB
Z43rTMLpES32bQjaMY/bDBxDi36EdQ==
=fNVj
-----END PGP SIGNATURE-----

--+Z7/5fzWRHDJ0o7Q--
