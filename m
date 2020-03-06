Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D0817BDE3
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 14:14:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF27D847;
	Fri,  6 Mar 2020 14:13:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF27D847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583500450;
	bh=10+fp27zx5x8gzvQjl3gWJvMtgiWIkAAXz+voV5b37s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ERBm3Z7Z6i0UeV+wYnnEqwA/Fqm5N5vzkZxUwl3EkloNWuaVfSx6ZSUNyApmLnU5W
	 ohrR9b5aSELznO7VSXkcImgemAOfyIvicGGBDc6U+8PRrajEFHCDyGtSM5E9s8+0nF
	 XKlP929DvOrbaSm9VujnYJFwWem275xt4l3KrcRk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E18F9F8012D;
	Fri,  6 Mar 2020 14:12:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B0D7F801ED; Fri,  6 Mar 2020 14:12:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 972B2F8012D
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 14:12:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 972B2F8012D
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A6D131B;
 Fri,  6 Mar 2020 05:12:16 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C28593F6CF;
 Fri,  6 Mar 2020 05:12:15 -0800 (PST)
Date: Fri, 6 Mar 2020 13:12:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 2/3] ASoC: Intel: bdw-rt5677: fix module load/unload
 issues
Message-ID: <20200306131214.GB4114@sirena.org.uk>
References: <20200305130616.28658-3-pierre-louis.bossart@linux.intel.com>
 <20200305133638.GE4046@sirena.org.uk>
 <13857c7b-f7d2-9be2-c1e1-a577a774773e@linux.intel.com>
 <20200305135908.GF4046@sirena.org.uk>
 <c1419cb1-c1d6-897d-05a4-48e57a3e15db@linux.intel.com>
 <20200305174324.GH4046@sirena.org.uk>
 <7c52ff6f-76ef-7c55-65e6-9c0437bb983a@linux.intel.com>
 <20200305183335.GK4046@sirena.org.uk>
 <20200305191059.GL4046@sirena.org.uk>
 <865dfd0f-38e1-2f27-5fd1-d6bcbd6d30a8@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VrqPEDrXMn8OVzN4"
Content-Disposition: inline
In-Reply-To: <865dfd0f-38e1-2f27-5fd1-d6bcbd6d30a8@linux.intel.com>
X-Cookie: fortune: No such file or directory
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


--VrqPEDrXMn8OVzN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 05, 2020 at 03:48:42PM -0600, Pierre-Louis Bossart wrote:

> I don't know how to move all the gpio handling in the codec driver, since
> there are platform-dependent ACPI mappings.

The idiomatic thing for ACPI is to have a DMI table in the driver that
selects the behaviour needed on a given system.

> I also tested a different solution (attached) based on your input where the
> gpiod handing is performed in the machine driver probe, after the card
> registration, and the gpiod_put() called from remove. This is simple enough
> but there might be some issues left with the jack/input handling - not sure
> why the logs for jacks are missing.

> Does this clarify the issue and options?

I think I preferred the original version - this does mechanically move
things to the device model probe but not really in an idiomatic fashion
(we're still requesting a GPIO for the CODEC from the machine driver) so
I'm not sure it really helps.  The changelog is definitely a lot better
though.

--VrqPEDrXMn8OVzN4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5iTC0ACgkQJNaLcl1U
h9Ca/wf/QORVfavfY/RxEiB9C4vD6sBRXY7+lgo6f/SvAXTxYnj+r278oQbSi4US
qL1sN+mOfXRzxaG2Cjv8rXkuoArcvbAcjDoplsvmUA8Eq6RgQ+TZ4tnRhYekfIhu
Mt5IEOgdsrbM3b7jggovN9gtiimlpF1QRXou4JNYy9Ps/Ao9d48zYJWFIH9yopob
3OkNm4de91jVvg5Vmx6YG4SSyS2Ds8YRxSKoZwJoX9LiuW/l7OnKk8H1h0SjoAuT
wlnJL8Ms1AfkEEdzikeyg5vGRuAyAuPI2Pu66yZSpRLhzizIrFuJ6L9EqKtkPH0a
APgr+hWj1kW3hZYbqZJDWDNErqXoMw==
=eInb
-----END PGP SIGNATURE-----

--VrqPEDrXMn8OVzN4--
