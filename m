Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACC33A7E25
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 14:24:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98856169F;
	Tue, 15 Jun 2021 14:23:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98856169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623759889;
	bh=XoQTzRQwmuh1QMzbvDAjue3zCh0UzzKehg+0IFfhvGo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ihqq40lOyPMp4eQe05A6CKslCFN8kEohqq/d/2WXB5rX3CFtTQlmQaj/8JM8UDFjw
	 rPFtvPEYM0z/uJwgORuJlYjKkQmwR0gDOL+ylYip5fGBiWErfV7UKAniGWMrEvhzFY
	 iTy7p0tXIyYd/3u+VSI8/qq6GcZmz+Y1Vq/i7gSY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32A07F8016D;
	Tue, 15 Jun 2021 14:23:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C5E3F80171; Tue, 15 Jun 2021 14:23:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34180F80165
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 14:23:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34180F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bGLRYens"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E544D6143E;
 Tue, 15 Jun 2021 12:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623759792;
 bh=XoQTzRQwmuh1QMzbvDAjue3zCh0UzzKehg+0IFfhvGo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bGLRYensvx/zi4r6Mx2V2HC6zErvM45s9pbLPp77nMCCF2+qERLvi+GQ4AAe4DiC6
 sr1v+AUxBvRpppYNu4sgDmUejW95H3wDHVQDQ/JnOh9R4p7FMGrxT0Oy26RVuDrgQ6
 25oewW1KeEG0g4MVv1ukCbq8JMmvnhP8dTp7eS2QB0w3ZEYhZEf0gLqtxhs/HIswRb
 wzTeweIfMy494Fupq3x3B8La21M6OgoZeDdhPSBvIAFy8e4WkrQc//GKJ2rOegriCx
 nTcEl4m021zdct1jkxVqLiAChTrb5+xTZKrz1A7muf3mwF+I0gOkdML52f9vrzula+
 FooX6VE8DUOzA==
Date: Tue, 15 Jun 2021 13:22:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Claudius Heine <ch@denx.de>
Subject: Re: [PATCH 2/3] ASoC: tlv320aic32x4: add support for TAS2505
Message-ID: <20210615122241.GE5149@sirena.org.uk>
References: <20210615094933.3076392-1-ch@denx.de>
 <20210615094933.3076392-3-ch@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7LkOrbQMr4cezO2T"
Content-Disposition: inline
In-Reply-To: <20210615094933.3076392-3-ch@denx.de>
X-Cookie: See store for details.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Marek Vasut <marex@denx.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Sia Jee Heng <jee.heng.sia@intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Annaliese McDermond <nh6z@nh6z.net>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
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


--7LkOrbQMr4cezO2T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 15, 2021 at 11:49:31AM +0200, Claudius Heine wrote:

> +static int aic32x4_tas2505_spkdrv_putvol(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> +	struct soc_mixer_control *mc =
> +		(struct soc_mixer_control *)kcontrol->private_value;
> +	u8 val;
> +
> +	val = (ucontrol->value.integer.value[0] & 0x7f);
> +	val = mc->invert ? mc->max - val : val;
> +	val = (val < 0) ? 0 : val;
> +	snd_soc_component_write(component, TAS2505_SPKVOL1, val);
> +
> +	return 0;
> +}

Controls should return a boolean indicating if they changed their value
when written.  Other than the hard coded register what's device specific
here?  It looks like a normal control with a maximum value, it is
unclear why this is being open coded.

> +	SOC_DOUBLE_R_S_TLV("HP Driver Gain Playback Volume", AIC32X4_HPLGAIN,
> +			AIC32X4_HPLGAIN, 0, -0x6, 0x1d, 5, 0,
> +			tlv_driver_gain),

Drop the Gain.  See control-names.rst.

--7LkOrbQMr4cezO2T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDIm5AACgkQJNaLcl1U
h9BiHAf/fliuYAge5Ukx/NgOlna7YT+TGmHxRUEyKrNyrw2Y7IQKgptR3dElp3Ep
IZ1bbWar9WT8777vi7UXKL2muaNwSjPvf1kmVTkVAvJAHwtOOPFCfiRplZiTBUg0
sm2KLjkLuyF6sUO2x88AEUHrqDlgINzoIo59/hhAxU/RJpKOI9S3ghmV8NRFJvW6
B9eM0EMx8W4E5Rqi3P5LC+ki/T7+0qg8Y50EydvKbtCCV//HLlMgxABh8D2wzd0P
2rV+5l+du08/mm3rhBiuh003+NSz4nI481WvrLu2MdUmBPb71aoJYQLiGwXzomah
DaPpUm0KFW8qDnG9jyGJ1Bl+6W22Cw==
=rv4N
-----END PGP SIGNATURE-----

--7LkOrbQMr4cezO2T--
