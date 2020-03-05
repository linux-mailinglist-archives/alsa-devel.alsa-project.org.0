Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DB217AD7F
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 18:45:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDF031668;
	Thu,  5 Mar 2020 18:44:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDF031668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583430315;
	bh=1+qvSSoGckfodaUngNSxPmFxXFWk8fiU4NVMBpDzreM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KlBmBqaMwF4/zHW4OOL7gryiLawMYseuSY5W/dsse2pyUhJjZJ8fQ/Xo99KvDRFzw
	 ObcIwcFEgPNSBvc4RZJgZOB+FTHhDaZGZL5/iqNNUohU6m3Y8jMOpNHU9BKQe7hAUe
	 F3PgkZmDhaPHgWGw0wSnwrCYeibPIDY+54JN6WpM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7BABF80266;
	Thu,  5 Mar 2020 18:43:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7453F8025F; Thu,  5 Mar 2020 18:43:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 8CFBFF800D8
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 18:43:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CFBFF800D8
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F24830E;
 Thu,  5 Mar 2020 09:43:26 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3B793F534;
 Thu,  5 Mar 2020 09:43:25 -0800 (PST)
Date: Thu, 5 Mar 2020 17:43:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 2/3] ASoC: Intel: bdw-rt5677: fix module load/unload
 issues
Message-ID: <20200305174324.GH4046@sirena.org.uk>
References: <20200305130616.28658-1-pierre-louis.bossart@linux.intel.com>
 <20200305130616.28658-3-pierre-louis.bossart@linux.intel.com>
 <20200305133638.GE4046@sirena.org.uk>
 <13857c7b-f7d2-9be2-c1e1-a577a774773e@linux.intel.com>
 <20200305135908.GF4046@sirena.org.uk>
 <c1419cb1-c1d6-897d-05a4-48e57a3e15db@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Hlh2aiwFLCZwGcpw"
Content-Disposition: inline
In-Reply-To: <c1419cb1-c1d6-897d-05a4-48e57a3e15db@linux.intel.com>
X-Cookie: When among apes, one must play the ape.
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


--Hlh2aiwFLCZwGcpw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 05, 2020 at 08:51:03AM -0600, Pierre-Louis Bossart wrote:

> > This doesn't answer the question: why is the machine driver not
> > requesting the GPIO on device model probe?

> I *think* it's due to the need to use the codec component->dev, which is
> only available with the dailink callbacks - not on platform device probe
> which ends with the card registration.

Why do you have this need?  This is sounding a lot like the CODEC ought
to be requesting it...

> > So you've removed the driver which will have unbound the device but devm
> > actions don't seem to have fired?  That seems worrying...

> Well, the devm uses the component device, not the card device, so when
> removing the machine driver nothing should happen. The problem seems to be
> in the removal of the codec and component drivers.

Right, it's always a bad idea to do allocations with devm_ on a device
other than the one that you're currently working with - that clearly
leads to lifetime issues.

> We tried to use the card device instead but then the gpiod_get fails.

I think you need to take a step back and work out what you're actually
doing here.  It doesn't sound like the problem has been fully understood
so there's no clear articulation of what you're trying to do.

--Hlh2aiwFLCZwGcpw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5hOjsACgkQJNaLcl1U
h9B4bgf9GG+D0LfJIbX19I8Oll3DmCwten2xWnqqVKVIQf6YAYRkmXlEJ3QP6VuO
zqifCzy5bkUiZNhXMFRt/OI+Hmh7SfmdHpmqovYtW43suOTqSsyT7GxGAsf5ffwJ
HaULffoX9/9Jml7evvVcvPU7xs/yJEZ+gBFnmC/lajYW0FUdz1b8RvjseJLR4Fi0
kclwZwBh0D0kBFS/a5zrw70FOmQmvpiS6OWUXdbXnVtSzZ+AVEiwkeO3Ji4XVDae
cE8AApwFCy+O/ADdMe6kcmN4/fEK6Qp9IahxSiHEdNcWZUZwjQC+RfIGiXj/5+T9
2k6OJSjNdw+KquRQQOz2JBmsbN14Rw==
=ceQg
-----END PGP SIGNATURE-----

--Hlh2aiwFLCZwGcpw--
