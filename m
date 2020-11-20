Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 657502BB214
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 19:08:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAAF51727;
	Fri, 20 Nov 2020 19:07:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAAF51727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605895722;
	bh=JpEWWXwKuu3eYo/fWcRB9xZ3GHl2NTClYCNL5gn1rP8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b0ubV7oYUMpbplKv+ue3ZPVdpywRUzyYkMYP51f/sYst7S0NXRh2qltIsX63odsMS
	 WsHotxgrO1gztWskqymxttfEt/e9z1ZDtq2JfFFDCwn8QPthSbgPpiRibwENk06rib
	 L+oA3ieGcSmsho3mEgtKEy2dknc/t9kiCzgIJCuI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D133F8016D;
	Fri, 20 Nov 2020 19:07:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFD44F8016C; Fri, 20 Nov 2020 19:06:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6823F800F3
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 19:06:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6823F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sq2YWRyS"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 36E3C2240B;
 Fri, 20 Nov 2020 18:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605895608;
 bh=JpEWWXwKuu3eYo/fWcRB9xZ3GHl2NTClYCNL5gn1rP8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sq2YWRySh5K77za00B+9b12DPoqWXl0k+yv7CF3YaPVbC0koMVsOs6ONsvFWzSZlC
 JrtDrdxa0v05SwigafaXXUWgwenku+wM18hDT0TGA3I1kKb/L9jFutp1ew1SwEgtCq
 GbRDHaCy1MA0K7Al6fyeBFX/OpQFmQqdyFM+E5Gc=
Date: Fri, 20 Nov 2020 18:06:27 +0000
From: Mark Brown <broonie@kernel.org>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>
Subject: Re: [PATCH 00/14] ASoC: Intel/SOF: extend run-time driver selection
 to ACPI devices
Message-ID: <20201120180627.GI6751@sirena.org.uk>
References: <d462c890495e4dda8698b5ba5eb50066@intel.com>
 <f62abcd8-b67f-774b-61b5-e08cfc3d2cc7@linux.intel.com>
 <s5h1rgst6z4.wl-tiwai@suse.de>
 <0286c6975f24432082f609d45adaa14c@intel.com>
 <0badb36f-3089-dc34-f7b0-75a73b856f0d@linux.intel.com>
 <d57fa3716a974eb9ba585ddd85dbe14c@intel.com>
 <cd8e5c2f-e1c2-7fbb-bee1-cc76ec14a801@linux.intel.com>
 <d94ccf9a3c61460db88f256df1fa3240@intel.com>
 <20201120164841.GF6751@sirena.org.uk>
 <758af664b89545c5be83ca2bc81078fb@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZrCu0B0FMx3UnjE2"
Content-Disposition: inline
In-Reply-To: <758af664b89545c5be83ca2bc81078fb@intel.com>
X-Cookie: Have at you!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>, Hans de Goede <hdegoede@redhat.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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


--ZrCu0B0FMx3UnjE2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 20, 2020 at 05:10:30PM +0000, Rojewski, Cezary wrote:
> On 2020-11-20 5:48 PM, Mark Brown wrote:

> > People care about any code that's in the kernel, especially people doing
> > anything treewide.  The fewer configurations people need to build to get
> > code coverage the better.

> Sure, but in this particular case there really shouldn't be "another
> option". If catpt is the sole option, why add intel-dsp-config
> dependency? The alternative shouldn't even exist in the kernel and be
> instead removed just like /haswell/ and /baytrail/ were.

If all the alternatives actually get removed then there'd be no need for
it, while they're there it is reasonable to have it - it does make it
easier for people like distros to try converting, it means they can
deploy the recommended setup without needing to ship new binaries to
people who run into trouble.  Besides TBH while there's several DSP
implementations in the tree having the code there makes it obvious that
this case works the same way as all the others to anyone looking at the
code.

--ZrCu0B0FMx3UnjE2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+4BaIACgkQJNaLcl1U
h9DN9Qf/T3HnA0gqx1J6AUz7BBOPC9ZGXMBC1u7ZfjZIIsCN4UEPjIoSTvBVMqyj
usSigROBEYnrbTqEg6mVvckBww0rv2QeMtEs96faWb9J9lbnKTV6HK2Kzo/3JeDQ
gz3DNajdZozB7XFD80EY8DWDePkNlWLWm2YGUBK3g9ph795uZpa9NmC+VKcC+uiV
rF8UgcA1qq2+DeF1mj+WPDEd0UUp4ZsGEjNfKHHgl+Yr9+lR8SC1k5EcB0Mm+X4Q
minErFBdcDSYVmZuIwS0E5uOfyyUmdPoxWg9QnAwEwjDqzQsPhXBLw5uRfMN7PWc
FMSLT/QFwSqNU6ZwXpzXHxowEDLf8Q==
=cnGO
-----END PGP SIGNATURE-----

--ZrCu0B0FMx3UnjE2--
