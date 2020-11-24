Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6252C2C78
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 17:14:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA67116B9;
	Tue, 24 Nov 2020 17:13:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA67116B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606234478;
	bh=NJhoVASNd7/JWQhcAFF4c0LJoaEzghFfZPOpCrT53po=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=niLZgCOTO8J91EfRLb/WnsnwA78qWODSZ9xfnA5OshcYn5FmcGobuzHlNFyzHfTAz
	 V00WLoHUuoKbcwyww9fuPbYjyhI5vxfHzuGQZ8s9kX7Yngpe+FYss2s6pDOCfxxrUZ
	 r1W9tJWv3K/R59HUtlOt9hhwwKajqpDZUGVFukWc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A0EBF80161;
	Tue, 24 Nov 2020 17:13:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A9CFF80165; Tue, 24 Nov 2020 17:13:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3263F800C1
 for <alsa-devel@alsa-project.org>; Tue, 24 Nov 2020 17:12:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3263F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Y7U539Wh"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AAE7C20715;
 Tue, 24 Nov 2020 16:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606234377;
 bh=NJhoVASNd7/JWQhcAFF4c0LJoaEzghFfZPOpCrT53po=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y7U539WhGPHRMb7erTGQc+W5KD/xjSP7QM0QmpnJYqdlEUDKwn7yeZg8x00w2a6p4
 A9ZA103IhmYwIc/gJRFyGCUj6y1FE4bs9BwszJk6JbB9v41EXakLijcLT12U4FA4Ld
 4THIeStzyOu2WLbTbhVBF6MnFlgzMR51LHvhyZo8=
Date: Tue, 24 Nov 2020 16:12:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 00/14] ASoC: Intel/SOF: extend run-time driver selection
 to ACPI devices
Message-ID: <20201124161233.GF4933@sirena.org.uk>
References: <cd8e5c2f-e1c2-7fbb-bee1-cc76ec14a801@linux.intel.com>
 <d94ccf9a3c61460db88f256df1fa3240@intel.com>
 <20201120164841.GF6751@sirena.org.uk>
 <758af664b89545c5be83ca2bc81078fb@intel.com>
 <20201120180627.GI6751@sirena.org.uk>
 <c8cd5f98e7c941c1b87aaabb850ece4e@intel.com>
 <20201123173533.GL6322@sirena.org.uk>
 <41fbc38fa46f41f49b4ff846f9f7b5b2@intel.com>
 <20201124140119.GC4933@sirena.org.uk>
 <s5hsg8yrgcp.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aFi3jz1oiPowsTUB"
Content-Disposition: inline
In-Reply-To: <s5hsg8yrgcp.wl-tiwai@suse.de>
X-Cookie: Who was that masked man?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Hans de Goede <hdegoede@redhat.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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


--aFi3jz1oiPowsTUB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 24, 2020 at 03:15:18PM +0100, Takashi Iwai wrote:

> I guess Cezary's point is that CATPT is the only driver for Haswell,
> hence the intel-dsp-config is useless for it.

> But I thought CATPT also covers Broadwell, and Broadwell can be
> supported by both CATPT and SOF?  If so, the dynamic switching makes
> sense.

Right, like I said previously if there's only one option upstream then
we can drop this stuff entirely - like you say I understood that there
were some SoCs that could use both.

--aFi3jz1oiPowsTUB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+9MPAACgkQJNaLcl1U
h9C2YwgAgzXITJ85gi9N78HbKog7TNYKAezYDTGS+YOedVlDBQz5txbrdg5gTm1y
87mLHVz38knx0F8FxjfN9Y3IBz5VZuoQsK5HKYvTgWAUm+02//Ktl2OhySkWg8xs
Ehfo7o5szXApQJgKf4/c5fxdsQfxSSAwaD6elXXhGr4rlSBQcmwlmx3oj2hC5G8o
cdcdw3DG46aL3Mb7W3TOZbu4GU55bOzSR0DvEU+RsA0ce0cFsz11RTh1TRNWnVaL
maoGbLTgElsZQSli/EzlVXfSYU+6HGO5mIBceiiYYN7jdyqI155/T4coOAt5gmGO
GLflnx89wR4buVi3kAi+4nGNjm2sPA==
=NyWp
-----END PGP SIGNATURE-----

--aFi3jz1oiPowsTUB--
