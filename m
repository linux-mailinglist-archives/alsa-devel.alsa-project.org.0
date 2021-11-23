Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCDC45B515
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 08:14:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0C39174B;
	Wed, 24 Nov 2021 08:13:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0C39174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637738068;
	bh=/G+mVBj47X83QR9mIcyKQRD0Fz7890CtgMMwf9Gixyo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O62wtxgrnS5i+0l5C2F0lr88jmmbGzIARP4jznMsJ8/25st1cUQCFWi25WlzR6QjH
	 uuw6nLbU367qk8Q4vjvALP/39owxssNeTZYcz2tBM+XHvnnsFG9mI392n1asLUN4xo
	 aZBoCFt5xwWSJTWETIk9oQTGo9Fr7tVYALm52Exs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E401F805BB;
	Wed, 24 Nov 2021 08:06:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C0CAF8049E; Tue, 23 Nov 2021 18:21:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0E28F80154
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 18:20:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0E28F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="H7RZpT6G"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6ABAD60F51;
 Tue, 23 Nov 2021 17:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637688050;
 bh=/G+mVBj47X83QR9mIcyKQRD0Fz7890CtgMMwf9Gixyo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H7RZpT6GkJZcb8+lI1ZHaaEHtAOSQHGfnF9mmMU3ZQFpCKLONZiSlwwcywW+gbDec
 L+qTXG8aNyDlQHDLpsQsH/7lfJ4G62WaFOb4nEVFG4t2+Gxp3ZIn9SRB4lWcQbTtUS
 tswFuXi23ri2opUa9mCaLdlh+Du4UP2dtoMQYjivyE3/762DP0IwCMYmKEJP5I++oi
 BRbkbFEpH5PQrEAm7MBiHLBvoI4eNjLbaibwoPICkXEDwewi/PJ3L4l7c0WrJ08+hC
 ej9I1hPMxjjWWIkFC44PvG4hJ/utbjh7hHTTolJPFmugcMUoerCT3ekYu1C21VlLir
 W5RDlA7y0WqDA==
Date: Tue, 23 Nov 2021 17:20:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Lucas Tanure <tanureal@opensource.cirrus.com>
Subject: Re: [PATCH 03/11] ASoC: cs35l41: Move regmap config struct to shared
 code
Message-ID: <YZ0i6TbgIW9qNUQt@sirena.org.uk>
References: <20211123163149.1530535-1-tanureal@opensource.cirrus.com>
 <20211123163149.1530535-4-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/JJvFVvi2fOow9X8"
Content-Disposition: inline
In-Reply-To: <20211123163149.1530535-4-tanureal@opensource.cirrus.com>
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


--/JJvFVvi2fOow9X8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 23, 2021 at 04:31:41PM +0000, Lucas Tanure wrote:
> Move regmap configs to external include so CS35L41 HDA
> driver can re-use it.
>=20
> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> ---
>  include/sound/cs35l41.h        |  6 +++++-
>  sound/soc/codecs/cs35l41-i2c.c | 15 ---------------
>  sound/soc/codecs/cs35l41-lib.c | 34 ++++++++++++++++++++++++++++++++--
>  sound/soc/codecs/cs35l41-spi.c | 16 ----------------
>  sound/soc/codecs/cs35l41.h     |  6 ------

It looks like they actually end up in a .c file rather than an include
which is what I'd expect (and I don't see anything fishy like including
=2Ec files).

> -const struct reg_default cs35l41_reg[CS35L41_MAX_CACHE_REG] =3D {
> +const struct reg_default cs35l41_reg[] =3D {

This isn't quite a straight move - it's worth calling that out in the
changelog.

--/JJvFVvi2fOow9X8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGdIugACgkQJNaLcl1U
h9D0jAf/T6kAe6qc0e/9no1UElASij34INfN+tMs32FkKXP8wT0TKaG+Hi+pXHZX
SieRilPX1ESToPEt4HgGH/S3lSZHVr2FRQjkKnfgOAPY+7YG0FwpfVewXuHKRH59
aRlok441ye3fj9pPYJSlIz0JHw2bo42jf2g7864fpQ+KLe1Tu+ghfAHzNHiKqJOw
5CBXqurSLagUH7Xql/6vbOdXuSLf/+lb19eJqy7mPjWoeElxQU1Z6bLoODrjuLSG
DP8wNwcmYLfpIOpD+laTl6Go3U7EEVDzsIQzJnVl6eOZrKkWaiKigujrbF7J0F/w
hkWA6xUDUArYhsr4nb0qsxrplmjSjw==
=Ok88
-----END PGP SIGNATURE-----

--/JJvFVvi2fOow9X8--
