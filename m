Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3D96406C4
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 13:25:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39D391811;
	Fri,  2 Dec 2022 13:24:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39D391811
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669983943;
	bh=8+lTq49DklsFfHxUXDjyDVAmTDe7EwNWUC0jmU1j1wo=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ttec6jvHjDiH4TwISkjzilLgv+b8iOnD35kcSkqifSVPc5gUeIyn7pIh9qand9XkE
	 Vw8q7/DXLHrq0uxoEvd1md82V3uYQ8AvcXAcBGly032Ov6AfrAhmJcp7MCqEwOX8Tj
	 Tuek2umDvzJHfjGqWD70wq+QzCKpqVwo3XFC6IJY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3EA1F80272;
	Fri,  2 Dec 2022 13:24:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A623FF80310; Fri,  2 Dec 2022 13:24:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CC98F80162
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 13:24:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CC98F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="IL4kNpSF"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1669983879; bh=DhGdxpJEkjYywcSuSWVbyLC7MtBW/7xgB641h9cKPo4=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=IL4kNpSFC8k/yBhtt9cknfsI2E6UirQsg42bUDsGBfK8kpkUktkO+W+rP+2ILv1fB
 XmTr7UuDGZXD1uNc5DmvPyPPHCTujbiM1DfbpzmH3SLsrsFhG1ydwVW1Y1Wy2BorM8
 RhKQFoGpme26jd+CHWig9w1cloA39sPCcuwkqT04=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH] ASoC: tas27{64,70}: fix PM ops ordering
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <20221202115855.16483-1-jcalligeros99@gmail.com>
Date: Fri, 2 Dec 2022 13:24:38 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <642B09FF-E7CC-481A-9EC7-88B74FA830CB@cutebit.org>
References: <20221202115855.16483-1-jcalligeros99@gmail.com>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, shenghao-ding@ti.com,
 Takashi Iwai <tiwai@suse.com>, kevin-lu@ti.com
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

(Copying in some TI addresses which may be interested.)

> On 2. 12. 2022, at 12:58, James Calligeros <jcalligeros99@gmail.com> =
wrote:
>=20
> On both tas2764 and tas2770, a write to PWR_CTRL is attempted
> on resume before syncing the regcache to the chip, potentially leaving
> it in an undefined state that causes resume to fail. The codec
> is then unavailable until the next system reset.

I think we need to split this into separate tas2764 and tas2770 changes.
So, concentrating on tas2764 first:

The issue here isn=E2=80=99t that a write is attempted before the device =
is synced
and while the regcache is in cache-only state. That=E2=80=99s on its own =
OK.
The issue here is that all registers including PWR_CTRL are restored in
one go, and that can cause issues since we need the device properly
configured before raising its power state.

> On tas2770 specifically, both suspend and resume ops attempt useless
> register writes on unrestored registers. This causes its state to be
> desynchronised from what ASoC expects it to be in.
>=20
> These two codecs are almost identical, so unify their behaviour
> and reorder the ops so that the codec is always suspended and
> resumed in a known/expected state.

I suggest we make the first commit fix up tas2764 suspend/resume
code to a state that=E2=80=99s OK, then second commit copies that over
to tas2770 to replace what=E2=80=99s there now. (Pointing out some of =
the
things that=E2=80=99s wrong with the old code.)

> Suggested-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
> sound/soc/codecs/tas2764.c | 11 +++++++----
> sound/soc/codecs/tas2770.c | 40 ++++++++++++++++++++------------------
> 2 files changed, 28 insertions(+), 23 deletions(-)
>=20
> diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
> index 2e0ed3e68fa5..51c6b3a940c4 100644
> --- a/sound/soc/codecs/tas2764.c
> +++ b/sound/soc/codecs/tas2764.c
> @@ -32,7 +32,7 @@ struct tas2764_priv {
> 	struct regmap *regmap;
> 	struct device *dev;
> 	int irq;
> -=09
> +

Stray whiteline change here

> 	int v_sense_slot;
> 	int i_sense_slot;
>=20
> @@ -157,14 +157,17 @@ static int tas2764_codec_resume(struct =
snd_soc_component *component)
> 		usleep_range(1000, 2000);
> 	}
>=20
> -	ret =3D tas2764_update_pwr_ctrl(tas2764);
> +	regcache_cache_only(tas2764->regmap, false);
>=20
> +	ret =3D regcache_sync(tas2764->regmap);
> 	if (ret < 0)
> 		return ret;
>=20
> -	regcache_cache_only(tas2764->regmap, false);
> +	ret =3D tas2764_update_pwr_ctrl(tas2764);
> +	if (ret < 0)
> +		return ret;
>=20
> -	return regcache_sync(tas2764->regmap);
> +	return 0;
> }
> #else
> #define tas2764_codec_suspend NULL
> diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
> index 8557759acb1f..5c9e8419b387 100644
> --- a/sound/soc/codecs/tas2770.c
> +++ b/sound/soc/codecs/tas2770.c
> @@ -72,25 +72,21 @@ static int tas2770_codec_suspend(struct =
snd_soc_component *component)
> 	struct tas2770_priv *tas2770 =3D =
snd_soc_component_get_drvdata(component);
> 	int ret =3D 0;
>=20
> +	ret =3D snd_soc_component_update_bits(component, =
TAS2770_PWR_CTRL,
> +						TAS2770_PWR_CTRL_MASK,
> +						=
TAS2770_PWR_CTRL_SHUTDOWN);
> +
> +	if (ret < 0)
> +		return ret;
> +
> 	regcache_cache_only(tas2770->regmap, true);
> -	regcache_mark_dirty(tas2770->regmap);
> +	regcache_sync(tas2770->regmap);
>=20
> -	if (tas2770->sdz_gpio) {
> +	if (tas2770->sdz_gpio)
> 		gpiod_set_value_cansleep(tas2770->sdz_gpio, 0);
> -	} else {
> -		ret =3D snd_soc_component_update_bits(component, =
TAS2770_PWR_CTRL,
> -						    =
TAS2770_PWR_CTRL_MASK,
> -						    =
TAS2770_PWR_CTRL_SHUTDOWN);
> -		if (ret < 0) {
> -			regcache_cache_only(tas2770->regmap, false);
> -			regcache_sync(tas2770->regmap);
> -			return ret;
> -		}
>=20
> -		ret =3D 0;
> -	}
>=20
> -	return ret;
> +	return 0;
> }
>=20
> static int tas2770_codec_resume(struct snd_soc_component *component)
> @@ -98,18 +94,24 @@ static int tas2770_codec_resume(struct =
snd_soc_component *component)
> 	struct tas2770_priv *tas2770 =3D =
snd_soc_component_get_drvdata(component);
> 	int ret;
>=20
> +
> 	if (tas2770->sdz_gpio) {
> 		gpiod_set_value_cansleep(tas2770->sdz_gpio, 1);
> 		usleep_range(1000, 2000);
> -	} else {
> -		ret =3D tas2770_update_pwr_ctrl(tas2770);
> -		if (ret < 0)
> -			return ret;
> 	}
>=20
> 	regcache_cache_only(tas2770->regmap, false);
>=20
> -	return regcache_sync(tas2770->regmap);
> +	ret =3D regcache_sync(tas2770->regmap);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D tas2770_update_pwr_ctrl(tas2770);
> +	if (ret < 0)
> +		return ret;
> +
> +
> +	return 0;
> }
> #else
> #define tas2770_codec_suspend NULL
> --=20
> 2.38.1
>=20

