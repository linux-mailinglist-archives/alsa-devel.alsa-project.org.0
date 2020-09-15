Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3947226A910
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Sep 2020 17:49:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96E321676;
	Tue, 15 Sep 2020 17:48:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96E321676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600184982;
	bh=J7nP3T7lsrE/sKq6YXt1lyfPigmOJ4Hm7RJIV5FMhgw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qjeEnrTRPMKefI5k5fAhIHYyh1u8HjWWdbpDGIUJ4fE3Xcoil81c8s2mMTuefSnwX
	 56zXOr1Ze81xeqIGp54nQE5nBnF5a8i2ZsUUn17/+sWzF998IHPww1wFwbjTAWWLkm
	 U4Fj2voh0xDNHF2bdLNc/Jl2x9ASt4Csx3zxsDMg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3B84F8025E;
	Tue, 15 Sep 2020 17:48:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3243F80212; Tue, 15 Sep 2020 17:47:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C3BEF80146
 for <alsa-devel@alsa-project.org>; Tue, 15 Sep 2020 17:47:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C3BEF80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qMuxCJIN"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BE02E206A1;
 Tue, 15 Sep 2020 15:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600184866;
 bh=J7nP3T7lsrE/sKq6YXt1lyfPigmOJ4Hm7RJIV5FMhgw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qMuxCJINcntVKNrVdGyngDXzCMeQz63bTwZO98dhVLsFCc8OVvxRBT1TLF/bDfQ8u
 Os5gE23Fx1Rrn7vjOqzGtZEBRfupVjGHHusecAVc4hmsLfnenLgmoYfNtlirO+AZY7
 9V0bw8u/X/+259WywbhxGrs7VEErZaPGcjtsbksk=
Date: Tue, 15 Sep 2020 16:46:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 3/3] ASoC: tlv320aic32x4: Enable fast charge
Message-ID: <20200915154656.GC4913@sirena.org.uk>
References: <20200911173140.29984-1-miquel.raynal@bootlin.com>
 <20200911173140.29984-4-miquel.raynal@bootlin.com>
 <20200915082602.GH4230@piout.net>
 <20200915115034.GA5576@sirena.org.uk>
 <20200915130207.GA9675@piout.net>
 <20200915141025.GB4913@sirena.org.uk>
 <20200915161401.54f6d4f3@xps13> <20200915142743.GB9675@piout.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6zdv2QT/q3FMhpsV"
Content-Disposition: inline
In-Reply-To: <20200915142743.GB9675@piout.net>
X-Cookie: Linux is obsolete
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
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


--6zdv2QT/q3FMhpsV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 15, 2020 at 04:27:43PM +0200, Alexandre Belloni wrote:
> On 15/09/2020 16:14:01+0200, Miquel Raynal wrote:

> > Indeed, it is just affecting the ramp (peak current is bigger).

> However, forcing powerup at probe time versus at play time means that
> you consume power even when not playing audio.

With older VMID referenced devices like this one seems to be there's
usually not really any good tradeoffs.  You have to balance audible
noise on the outputs when starting audio, idle power consumption and the
time taken to get the device live either on starting a stream or boot.
Generally for a given device there's a fairly clear optimum and trying
to support multiple options makes things more complex and less robust.

--6zdv2QT/q3FMhpsV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9g4fAACgkQJNaLcl1U
h9DdOAf9EVOfUlhMpdtlwozgCQMUiBstCWWdfsHuYkiaenqDqEclIDYnBhtmN2Cc
MliADocQVfBqlOkfLxmwSgRoCaHaIc76NuTNqgjtqeU09o/sET6wOiBUPH9GN721
SyBQjncjYFYPbbAg0Fph7wouJOFFNz7kG2mhvGZnDHZNJr5h2cgEbo34uoD29e2W
sD2t5jnRUcjnV3u3t25hEcEpAoAhJJ2BZDonislVQTai3qizCU3W0KMFEjKm2jNz
tjL/JCUqp8u+Gg5KMCw8r7BTCEXVsFbu51I7OPLiJnPZtjhOyz9P985lJNtn6N0c
9SMOCPxvAKoxhxjwCbg99BTcb3Difw==
=lTzY
-----END PGP SIGNATURE-----

--6zdv2QT/q3FMhpsV--
