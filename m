Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F65E45B520
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 08:15:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFF30178C;
	Wed, 24 Nov 2021 08:14:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFF30178C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637738105;
	bh=yN5v/ksH+/i7Kc2NikgDUOw2ePKQ2SBTXHTlo8gWoxA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TapVIvHbP4oXx16/HV+983CUpSHWS++Dz6LZMe8fvU+5edn6HziiDEaUeaSacQ3OM
	 WWf91MYlXCOIFTQQ9W/unWMZD50FlBKkxCoJkC07bCmhbUtcdFjw4XbgOfFum2evpv
	 Xt51HyrHSBrA0nxyIvYQ0q/spmKso9cGZGr4EKw0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EA99F805C7;
	Wed, 24 Nov 2021 08:06:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07C77F8049E; Tue, 23 Nov 2021 18:53:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D5ABF800E7
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 18:53:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D5ABF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Nnw3WWlu"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6A3AA60F42;
 Tue, 23 Nov 2021 17:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637689994;
 bh=yN5v/ksH+/i7Kc2NikgDUOw2ePKQ2SBTXHTlo8gWoxA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nnw3WWluGs1MwQ8YensIJzFnsFs9naMNTTXEf73dRJHQ2dkyx80IURcsycHoUC1k4
 9qVkRQ7x/w+ng7cQ0/CZ7C1BWtICIkNEmQOOm8TMZiOgCuXJOpbKkGlP67NBBfIcZj
 I8gfkcdeejgAxnP2z0NCKgwmrolY1SfYEVWPRdHme50fAVSRukmheYWZi4B0U3OjwW
 52x5AtrcYwjmY1BUPuJNkU1ONLD+JpQERButoiXiBsiLNWFP9OfkNek16SurXnHUud
 V05BMiT8CUZRc2HUSADQZmjeWyKtKir1Kuw01FIa3ozECn349WDceKZV8CxeVlk4cL
 vHbT+Zcpard3w==
Date: Tue, 23 Nov 2021 17:53:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Lucas Tanure <tanureal@opensource.cirrus.com>
Subject: Re: [PATCH 02/11] ASoC: cs35l41: Convert tables to shared source code
Message-ID: <YZ0qgjJnoljpmc9s@sirena.org.uk>
References: <20211123163149.1530535-1-tanureal@opensource.cirrus.com>
 <20211123163149.1530535-3-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kBarSnr2m61LE+g9"
Content-Disposition: inline
In-Reply-To: <20211123163149.1530535-3-tanureal@opensource.cirrus.com>
X-Cookie: A closed mouth gathers no foot.
X-Mailman-Approved-At: Wed, 24 Nov 2021 08:05:53 +0100
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Elia Devito <eliadevito@gmail.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 alsa-devel@alsa-project.org, Werner Sembach <wse@tuxedocomputers.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Shuming Fan <shumingf@realtek.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
 Jeremy Szu <jeremy.szu@canonical.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, linux-acpi@vger.kernel.org,
 Sami Loone <sami@loone.fi>, Len Brown <lenb@kernel.org>,
 platform-driver-x86@vger.kernel.org, Chris Chiu <chris.chiu@canonical.com>,
 Arnd Bergmann <arnd@arndb.de>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Cameron Berkenpas <cam@neo-zeon.de>,
 Jack Yu <jack.yu@realtek.com>, Kailang Yang <kailang@realtek.com>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, David Rhodes <david.rhodes@cirrus.com>
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


--kBarSnr2m61LE+g9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 23, 2021 at 04:31:40PM +0000, Lucas Tanure wrote:

> --- a/sound/soc/codecs/Makefile
> +++ b/sound/soc/codecs/Makefile
> @@ -54,8 +54,8 @@ snd-soc-cs35l33-objs := cs35l33.o
>  snd-soc-cs35l34-objs := cs35l34.o
>  snd-soc-cs35l35-objs := cs35l35.o
>  snd-soc-cs35l36-objs := cs35l36.o
> -snd-soc-cs35l41-spi-objs := cs35l41-spi.o cs35l41.o cs35l41-tables.o
> -snd-soc-cs35l41-i2c-objs := cs35l41-i2c.o cs35l41.o cs35l41-tables.o
> +snd-soc-cs35l41-spi-objs := cs35l41-spi.o cs35l41.o cs35l41-lib.o
> +snd-soc-cs35l41-i2c-objs := cs35l41-i2c.o cs35l41.o cs35l41-lib.o
>  snd-soc-cs42l42-objs := cs42l42.o
>  snd-soc-cs42l51-objs := cs42l51.o
>  snd-soc-cs42l51-i2c-objs := cs42l51-i2c.o

As was already called out on the HDA part of this patch I was expecting
this to be more like how we handle sharing the PXA2xx driver code
between the ASoC and AC'97 implementations - making it a library rather
than linking the object files directly into both drivers.  I'm not sure
that the current approach would DTRT if one or both of the drivers is
built in.

--kBarSnr2m61LE+g9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGdKoEACgkQJNaLcl1U
h9Cr4gf+LNGWPCz+MX/96IXsUS+wPozdceAjKSn80yGpnRSItYewxSIzu2F97cvm
dnB0JfE7YXIR1bYMLulAWnpYyGWoJzI+uTiJJnxXdIfUSpPEMm1t7s7fZqrqhFGz
2ABLlyV0gWZcj6ZGq1X1msELcdJuFgdQUpQZcnCXA/d/dhfadc7DGlBkuKQGpWos
xardpAPBRITGzwQ6ool8+uCrCNcDAiUUMM6m9mzKXCzJ3gGb/hTjpgLymN0Twn/r
oYqINRYJGZCpMPXY3mnDZZjAluSVQ15MT7MfQZx1vjQxTEMZm6crjbTQf1O5Xnd2
WBukoE/U9Mfa1d9uYmqOjP4S9ZPgMA==
=vneV
-----END PGP SIGNATURE-----

--kBarSnr2m61LE+g9--
