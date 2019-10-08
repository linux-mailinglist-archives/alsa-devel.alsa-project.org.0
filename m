Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F1DCFA24
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 14:40:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BA251657;
	Tue,  8 Oct 2019 14:39:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BA251657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570538429;
	bh=q8H58rAhap1jcZPdrbntUnbZq/zPnQQ61RkjKOxmou0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KTvqUKcr8aU/vw4t0lTnSNpgRo00M1YUP9mjthq/la0PjcD76Tu7+/KtvWV2lmBHx
	 1jPtNrjLJvbQlbvdbF988vJ0oA36T9lxriVPrNQ1o4GrQ+W82z1QLiLDnl70/cEhJ8
	 m9MxwHPWd+HIl2T7unIsXq/B6cEfX4htJtEqta4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A385F8045E;
	Tue,  8 Oct 2019 14:38:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF175F8038F; Tue,  8 Oct 2019 14:38:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89152F80135
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:38:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89152F80135
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="NEn7pVo3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XCRqrE/2wFsLdYy7LCWtwbzFTzuN+bJ6NPUhISRg/+c=; b=NEn7pVo3NzrSTlTkfh3cRQ09n
 4wIsRY45dmBmn5n9cNtD0ref5gCFA4QHNrme6us45WTWbET85LtDY8CQaOuoCRwzgE7CVqYyNJ492
 Jmj+k+BrvM7fBFQOfLVtb4DtG1WmWYW+gazptdKy4i4BCy0u0pbg0NdZLIFP6XVoKKvis=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHol9-0008JO-LL; Tue, 08 Oct 2019 12:38:35 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id DF22C2740D48; Tue,  8 Oct 2019 13:38:34 +0100 (BST)
Date: Tue, 8 Oct 2019 13:38:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Cheng-yi Chiang <cychiang@chromium.org>
Message-ID: <20191008123834.GI4382@sirena.co.uk>
References: <8f933cee57fc4420875e1e2ba14f1937@realtek.com>
 <20191008105138.GC4382@sirena.co.uk>
 <CAFv8NwJ+g+ESJJ5JxaLHADhBASKsjTE7pqY=HhcZZcT2Yy+Ygw@mail.gmail.com>
 <20191008110643.GD4382@sirena.co.uk>
 <CAFv8Nw+68LkmCmPnq5+rvf3Ffnh1kRROdjrx=nN8tgMTGEq+xQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFv8Nw+68LkmCmPnq5+rvf3Ffnh1kRROdjrx=nN8tgMTGEq+xQ@mail.gmail.com>
X-Cookie: Do not disturb.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, SteveS.Lee@maximintegrated.com,
 George.Song@maximintegrated.com, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 pierre-louis.bossart@linux.intel.com, "M R,
 Sathya Prakash" <sathya.prakash.m.r@intel.com>, jinho.ahn@maximintegrated.com,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
 Dylan Reid <dgreid@chromium.org>, "Flove\(HsinFu\)" <flove@realtek.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: rt1011: export r0 and temperature
	config
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
Content-Type: multipart/mixed; boundary="===============7568904205338259817=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7568904205338259817==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qLni7iB6Dl8qUSwk"
Content-Disposition: inline


--qLni7iB6Dl8qUSwk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 08, 2019 at 07:22:17PM +0800, Cheng-yi Chiang wrote:

> The VPD is not part of the codec.
> It is a binary blob in system firmware where we can store important
> information per-device.
> The calibration data is written to RO section of VPD in the factory
> during calibration step.

Ugh, this is not idiomatic for a DT system :(

> The codec driver is not suitable of reading this information directly
> because the string format written into VPD is customized per board.
> For example on cml_rt1011_rt5682.c there are four R0 values for four

The expected model for a DT system is that this stuff should just come
in through DT properties, if for system design/manufacturing reasons it
needs to be stored separately then you'd expect it to be merged into the
main DT by the bootloader or something else earlier on in boot.

> speakers, and one temperature values . So in this case, there are
> totally 5 values in a VPD dsm_calib key. In VPD, the format is like
> "dsm_calib"="0x00278F09 0x00251E1B 0x0021AFE6 0x0022720A 0x0000012E"
> We put all the information into one string to allow arbitrary
> calibration data needed for smart amp calibration in the future.
> On other system using smart amp, there might be two speakers, with two
> temperature values..etc. The format will be changed accordingly.
> Number of temperature values depends on number of temperature sensor
> available near the speakers.
> Since machine driver knows the combination of speakers and the
> available temperature sensor, we think that machine driver is the
> better place to put this per-board logic.

I'm not sure why they all need to be in one property?  That's a
secondary problem though.

--qLni7iB6Dl8qUSwk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2cg0oACgkQJNaLcl1U
h9DLegf+OMHE3OKMfnhkxLZeVAELDJ0QQnAGWR38mLUcQf0bbBwmQAxI+8qv+oc8
RFbx1/uqzRo4wj6BpMdjlopkFUmEIFbVpC86NOeRRI2kTAi7/aIdYCpWE2YNjsh0
Qz7tVxXYISFA0ELT/PV/QubmRVqZFJvUCJbvLwplKn7I4dLj1yDBeU3bHprSWE1v
cANV0wY28Ug7P7JvpLQfNwpYQMZrH5SEbEyT/Oe0k2sdE7KjEGSRVRdY1yLxJ5g5
8ffyUP60mBFScMszpeZP5KXsHgztj5eQMApdtBIGve88JF24AWLuOFeGmErE8i7A
nWQCAj0oCKBZJbGimWqGYS/0rynCWQ==
=NQog
-----END PGP SIGNATURE-----

--qLni7iB6Dl8qUSwk--

--===============7568904205338259817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7568904205338259817==--
