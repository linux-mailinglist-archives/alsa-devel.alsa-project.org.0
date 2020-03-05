Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F13017A6FA
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 15:00:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F004D1667;
	Thu,  5 Mar 2020 15:00:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F004D1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583416858;
	bh=NHyugrWgfPaMwJRkzHX24mDdRa0kzZFhD6+uzPitkwE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D4D/lKM9nptG86Itxx96u7/+79QIuvG78f1PFiJ4LXrVbijxKD32Le042uFTQ1UDW
	 y7PUNwwp+xMCuOagzVRDuSogwcJdNiq46q07rH/KbecCE79NnTlGmutdRxQxSRVC9c
	 w4pLoC9vhaj9bXJUl7cr+BNfUTdwemzs0QwozZr4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25CDDF80245;
	Thu,  5 Mar 2020 14:59:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C692F8025F; Thu,  5 Mar 2020 14:59:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id EDD63F800D8
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 14:59:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDD63F800D8
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BFDD1FB;
 Thu,  5 Mar 2020 05:59:10 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8347A3F534;
 Thu,  5 Mar 2020 05:59:09 -0800 (PST)
Date: Thu, 5 Mar 2020 13:59:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 2/3] ASoC: Intel: bdw-rt5677: fix module load/unload
 issues
Message-ID: <20200305135908.GF4046@sirena.org.uk>
References: <20200305130616.28658-1-pierre-louis.bossart@linux.intel.com>
 <20200305130616.28658-3-pierre-louis.bossart@linux.intel.com>
 <20200305133638.GE4046@sirena.org.uk>
 <13857c7b-f7d2-9be2-c1e1-a577a774773e@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FeAIMMcddNRN4P4/"
Content-Disposition: inline
In-Reply-To: <13857c7b-f7d2-9be2-c1e1-a577a774773e@linux.intel.com>
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


--FeAIMMcddNRN4P4/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 05, 2020 at 07:47:47AM -0600, Pierre-Louis Bossart wrote:
> On 3/5/20 7:36 AM, Mark Brown wrote:

> > In what way are the dependencies not well managed and why aren't we
> > requesting the GPIO on device model probe anyway?

> there are a couple of machine drivers where the gpios are requested from the
> machine driver. I have no idea what it is done this way, maybe the codec
> exposes a gpiochip that's used later? I was hoping that Andy can help, I
> don't fully get the acpi mapping and all.

This doesn't answer the question: why is the machine driver not
requesting the GPIO on device model probe?

> The issue happens when running our test scripts, which do a set a rmmod in a
> specific order: rmmod of the machine driver, then doing an rmmod of the
> codec driver. Somehow the second fails with the 'module in use error'.

> It's probably because the devm_ release does not happen when the card is
> unregistered and the machine driver resources released since we use the
> component device. There might very well be a bug somewhere in the devm_
> handling, I just don't have a clue how to debug this - and the .exit() makes
> sense regardless in other cases unrelated to GPIOs.

So you've removed the driver which will have unbound the device but devm
actions don't seem to have fired?  That seems worrying...

--FeAIMMcddNRN4P4/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5hBasACgkQJNaLcl1U
h9D+Ewf+OAs10iKzTXHly6epyseacF3HGYph7wOeSOqawctOASo/32lS0l4J7cCe
DIYEKg5NQtvua7zxkG0QtT8bY+sfZdOILvZtfK96i42REjVOypFMYPImnG2DYOKG
2rAzg8Dq7NjnWRmQlGN0Ed9O6MPIK6wVlEs+PKlnvMPyjgOEM/fAztwu81ilcvce
AiFbQjegGJU+cT8aDxi9Vc35JZP8I41NLA9PKbdXtC4yxdp28tzSqJeyBt5dtJi2
VamtFf1vFeEZ/acb9t2Pqsqrl/Na/WXHCN0IZCi5Pb7Uqwx4w12W0xoOnJIkeDPF
RN6WnSIC2gwtw5+RGSZ4A6c+YFdu3Q==
=4w0X
-----END PGP SIGNATURE-----

--FeAIMMcddNRN4P4/--
