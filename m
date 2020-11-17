Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5CA2B6BC9
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 18:33:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 777E016E8;
	Tue, 17 Nov 2020 18:32:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 777E016E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605634427;
	bh=puh3//2x5FRyyPnq43WnInpVHdz8HEYsHltDIu2mmpU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g4Dy87C1TRXnI6E5rUANdoK1f5qUlHFV7eDLnEY+2PnXOoP2QqI3nCVouDpxjD//n
	 gVrkwamPRTF6s+J2Ltu+Ybe7dkXU29u4xXUL5zrb5i04MCDRa2QNrUFx3Kt9wtHLKt
	 BX4w4rE5C/K6hzgey6+GTQcuBG/oqtmAfndQWmRI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF676F800FE;
	Tue, 17 Nov 2020 18:32:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58F48F801F5; Tue, 17 Nov 2020 18:32:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8438F800FE
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 18:32:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8438F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="w1fRwMsN"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D28FA24199;
 Tue, 17 Nov 2020 17:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605634325;
 bh=puh3//2x5FRyyPnq43WnInpVHdz8HEYsHltDIu2mmpU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=w1fRwMsNNtfNDzKzE0hwFweDFfYS6APz59ACdZfXGslLozX/M7iDDL3yvPDW6parA
 cGfZCjyX9FUsjBUrRsVtA8JksdX6P/MyECsApSnIr7KY3pSSqEG8NKokaV/DIXRmDV
 L9NEpraxB3OIR2Ndo0aE/3dddWBSLdYvKTKWLH8Y=
Date: Tue, 17 Nov 2020 17:31:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 00/14] ASoC: Intel/SOF: extend run-time driver selection
 to ACPI devices
Message-ID: <20201117173145.GG5142@sirena.org.uk>
References: <20201112223825.39765-1-pierre-louis.bossart@linux.intel.com>
 <0a0854d1ddaf4f9b81ef5569a7d501a5@intel.com>
 <20201113164946.GD4828@sirena.org.uk>
 <2cf7075b-bd51-21a5-2058-3a98e6c488a7@redhat.com>
 <d462c890495e4dda8698b5ba5eb50066@intel.com>
 <f62abcd8-b67f-774b-61b5-e08cfc3d2cc7@linux.intel.com>
 <s5h1rgst6z4.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Zrag5V6pnZGjLKiw"
Content-Disposition: inline
In-Reply-To: <s5h1rgst6z4.wl-tiwai@suse.de>
X-Cookie: Pause for storage relocation.
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


--Zrag5V6pnZGjLKiw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 17, 2020 at 03:04:31PM +0100, Takashi Iwai wrote:
> Pierre-Louis Bossart wrote:

> > Why? Who said it was PCI only? We already take care of DMIC,
> > SoundWire, Google Chromebooks, open platforms, why not ACPI? It's just
> > one API to be used when more than one driver can register to the same
> > device.

> Well, currently intel-dsp-config sits in sound/hda, which isn't really
> intuitive.  Though, Intel driver file paths are already fairly
> scattered, so it doesn't matter too much :)

> I don't mind to move it to another directory, but which one...?
> x86 might match, but shuffling the place won't help for maintenance.

Yeah, I don't have a strong opinion here on location.  I'm not sure
there is any decision which won't have downsides.

> I personally find this move good, at least it makes things easier for
> distros.  There are small details like the above, but technically
> seen, I see no big problem.

Indeed - this isn't ideal but that's more a product of the situation
we're in, this seems to improve it so it seems like a win to me and the
distros and other people dealing with end users seem happy in so far as
they've spoken up.  Would you be OK with me applying the ALSA patches in
here?

--Zrag5V6pnZGjLKiw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+0CQEACgkQJNaLcl1U
h9ASSgf+OTDdY2f/avLS/zN34O/u4g6rH5+xxQtiPB6+1ltTD9lSJhvv81dW7sA1
a8TxPFT/TMlr/IhLOaSAnU/7OfPpuxVLHYKdNRdmBYj1xoscYQzjF+Gtvez2Kv87
u1L9pld6X7mUGoQAxMgyRKt+Xf3NjlPiZyqZfE+up7o1vMtET962rEPJi4MDCVNZ
RkAPL4X3TI/0jIBeb33Q+oeZ8oHKoOKA2SvGdzk2zTjW/RuV+ZqccEMf1woPPEJ3
UkxGJIhJHWs9dyD6+1A19lmJVmoBlG6dDmtyBNkRTEaHdnNjFVtV/7GmsVt5ni6Z
b5gvv1gbZD4iuMMnCIbjaV9K/KH9vA==
=jxlI
-----END PGP SIGNATURE-----

--Zrag5V6pnZGjLKiw--
