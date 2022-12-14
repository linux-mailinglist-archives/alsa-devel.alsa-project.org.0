Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD1E64CC08
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 15:20:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7DB82A21;
	Wed, 14 Dec 2022 15:20:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7DB82A21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671027657;
	bh=dtD4at3QvmKceCkqefCGm/sNHM/GgIfcJcHylU8opnU=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Q0gxpJ1Zj5d1id7kcHQM9AUMpZZ21H9N8uDrrBiug7st8p7+56tcipAFAc9SqHw0l
	 lXXXQyY2ISyQoGXyIurLPzq9cYeg/BOlM5ZxjG4z91+iJBqg/fTdL/RVwob2aWD0P9
	 Y57doOhNtWTf8OIIJ+s304GgMdwxjOjghTJG7Iwo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72865F80141;
	Wed, 14 Dec 2022 15:20:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B745F804E0; Wed, 14 Dec 2022 15:19:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0026F80141
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 15:19:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0026F80141
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=k7myidlt
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 010A0B818B7;
 Wed, 14 Dec 2022 14:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D67AC433EF;
 Wed, 14 Dec 2022 14:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671027589;
 bh=dtD4at3QvmKceCkqefCGm/sNHM/GgIfcJcHylU8opnU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k7myidlt1qjkQT9UJa7xFBC7ymZusEbAJhR7EL6cmq3r66pJjeFH0FiJZid8k7Wb/
 Wh4NTEW4i2iRc7/jYpUjEATvPMcnLKHPcxgam8bbO6J7y4f7SflONwWFmwX159t1JU
 GXf0lV79rb94sgo+94H2Godo5Xa7lM8TnX/FW5k3w9P+Cr07XJMXi30xnNeTEO3AN9
 q7s1LRl1QvnQeZp9qrm2ClJCdt1qfqTaKfvAjNKMmmoVyb6y4Wj6UHFooByhHhM/Bz
 G+dRZMpAOfvBrqT0sg+dV7iHzfPbkKlow92rXmZQNwoIEvq0qOErFfo18enDt9lTRd
 7VbdMh4DBGMEQ==
Date: Wed, 14 Dec 2022 14:19:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH 3/4] ASoC: wm8940: Mute also the speaker output
Message-ID: <Y5nbf72ksywcXK65@sirena.org.uk>
References: <20221214123743.3713843-1-lukma@denx.de>
 <20221214123743.3713843-4-lukma@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6/ZnCXYOB14izKmh"
Content-Disposition: inline
In-Reply-To: <20221214123743.3713843-4-lukma@denx.de>
X-Cookie: I disagree with unanimity.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Stephen Kitt <steve@sk2.org>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--6/ZnCXYOB14izKmh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 14, 2022 at 01:37:42PM +0100, Lukasz Majewski wrote:
> Without this change the BTL speaker produces some
> "distortion" noise when test program
> (speaker-test -t waw) is ended with ctrl+c.

> As our design uses speaker outputs to drive BTL speaker,
> it was necessary to also mute the speaker via the codec
> internal WM8940_SPKVOL register with setting
> WM8940_SPKMUTE bit.

> @@ -465,9 +465,18 @@ static int wm8940_mute(struct snd_soc_dai *dai, int =
mute, int direction)
>  {

> +	spkvol_reg &=3D ~WM8940_SPKMUTE;
> +	if (mute) {
>  		mute_reg |=3D 0x40;
> +		spkvol_reg |=3D WM8940_SPKMUTE;
> +	}
> +
> +	ret =3D snd_soc_component_write(component, WM8940_SPKVOL, spkvol_reg);
> +	if (ret)
> +		return ret;
> =20
>  	return snd_soc_component_write(component, WM8940_DAC, mute_reg);

In addition to the issue Charles raised this is simply not what the mute
callback should do, the mute callback should specifically mute the
digital input (with the goal of masking any glitching on there while
clocks are started/stopped).  Looking at the driver the device supports
analogue bypass paths to the speaker - these will be broken by your
patch so if you genuinely need some workaround in this area I'd be
looking at the Speaker Mixer PCM Playback Switch rather than muting the
speaker as a whole.  If the device just can't cope without an input then
ignore_mdown_time might be what you're looking for, it looks like the
device doesn't have any lengthy sleeps in the power up/down paths so
that should be fine so long as it doesn't pop/click.

I'd also check there's not some other system configuration issue here
which is more obvious when the input from the DAC stops getting input,
check that you don't see similar issues when silence is played for
example.  It might be worth checking that none of the analogue bypass
paths are enabled.

--6/ZnCXYOB14izKmh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOZ238ACgkQJNaLcl1U
h9BgmAf/WFppJCmZ/1kHJn/v0qAcUP8bEn0HUM+iMjhzmkLvqvnXswGGEfsHWWkW
fagQVLQQBHDDzZWKP4ziGtKIfRyiut0gVlccgLR54UrBjkXGtl+DcgAjiAB8iyLm
FkD+JG2PnU+39oBYK8LGcUb9cZj8H+szHlRqzdW4AB/rSyRtU9VujPvU78HSQCIr
bL6ZBqdFwv5IfbThyp26AC20e3GqXpebEiJJTbSJbRr7wKsqTAKJKtJeWl2KZLQL
Lyry6wMHzbAei1vl2U3BOoPCVQ0M4zlnz4o6aOfVE9yna/fplZZttJsbYyLwx6jl
Z/SA7YiEJZB2VQXDc3wJN9ay2QnORQ==
=BDk1
-----END PGP SIGNATURE-----

--6/ZnCXYOB14izKmh--
