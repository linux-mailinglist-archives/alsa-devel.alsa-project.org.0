Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B2E16478C
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 15:56:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6151C169F;
	Wed, 19 Feb 2020 15:56:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6151C169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582124211;
	bh=yUZXolpqCAZH46QWupdgcTiTf30FDecbps3Oweo/RYQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oSlZZ4wO8+IOsVAl1j7ChYiZ+ibW5R0PgoZuymsgcC7V+RP5zORVv0xYeEc9DjNlr
	 BxKQw5ShGReadqeM3eAgiF2QHz7+B70ZNTyry9vUncFyWYUMQ8Z320fBPT4UUWTft4
	 /FP0SORvTIYJoXwBsswv+KAsEUd2RPQR4wxyeJlQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E7D1F801F5;
	Wed, 19 Feb 2020 15:55:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAB92F80273; Wed, 19 Feb 2020 15:55:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 0FB1DF801F5
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 15:55:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FB1DF801F5
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED8391FB;
 Wed, 19 Feb 2020 06:55:02 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 725113F68F;
 Wed, 19 Feb 2020 06:55:02 -0800 (PST)
Date: Wed, 19 Feb 2020 14:55:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 2/2] ASoC: meson: add t9015 internal DAC driver
Message-ID: <20200219145500.GC4488@sirena.org.uk>
References: <20200219133646.1035506-1-jbrunet@baylibre.com>
 <20200219133646.1035506-3-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="KN5l+BnMqAQyZLvT"
Content-Disposition: inline
In-Reply-To: <20200219133646.1035506-3-jbrunet@baylibre.com>
X-Cookie: FORTH IF HONK THEN
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
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


--KN5l+BnMqAQyZLvT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 19, 2020 at 02:36:46PM +0100, Jerome Brunet wrote:

Looks good, couple of small things below:

> +static const struct snd_kcontrol_new t9015_snd_controls[] = {
> +	/* Volume Controls */
> +	SOC_SINGLE("Playback Mute", VOL_CTRL1, DAC_SOFT_MUTE, 1, 0),

This should be Switch (see control-names.rst).

> +	SOC_SINGLE("Volume Ramp Enable", VOL_CTRL1, VC_RAMP_MODE, 1, 0),
> +	SOC_SINGLE("Mute Ramp Enable", VOL_CTRL1, MUTE_MODE, 1, 0),
> +	SOC_SINGLE("Unmute Ramp Enable", VOL_CTRL1, UNMUTE_MODE, 1, 0),

These too.

> +	/* Channel Src */
> +	SOC_ENUM("Right DAC Source", dacr_in_enum),
> +	SOC_ENUM("Left DAC Source",  dacl_in_enum),

Ideally these would be moved into DAPM (using an AIF_IN widget for the
DAI).

--KN5l+BnMqAQyZLvT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5NTEQACgkQJNaLcl1U
h9Dlbwf9G+Zx9LnUXQiK9vVqNnfJy5o7uz95sBnsBro99NHp8ldxwtBqNpYjnE5w
AT6qUKHSPUuGzRcTYuvILXhcp16Pmcl9TARppPrU3dnOxy+CMf4UfCdQvkU2Z+9z
nVgs2o0WHFrwJaJb1LP8w9onR7Dj0sDx5q63FqSwkp5nTOjxDiwWtnFNcHx8aozG
tL/ADQlqRABlDjvNz+/knxzF3ZIIbIbyYvGMrHTUWCCP8sn2oOUBeqg1wbJ2pFLf
iFSl0OFtrYfRAlAMGwxLZl5utpkWU5DG94EceGpx/fK9hXuomNoeLscr+24dnqko
f/W3R4gTxgSNrt43vmW2os6ejWa6Yg==
=+YY/
-----END PGP SIGNATURE-----

--KN5l+BnMqAQyZLvT--
