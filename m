Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7B65B8191
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 08:44:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0332E17F2;
	Wed, 14 Sep 2022 08:43:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0332E17F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663137864;
	bh=1b/PA4WI0mcwVHv/tjSCbTy//qqEX0UZ2pdy1K47ODE=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EYfR4VqlcZTW/He449s4ZkWsmFM3ELHM6PzEscDd7ELkq+bEOkb0adFtj31pt6NzS
	 4IZRsSnjJxCVTtn8Lxhpnwy539jmnu5T2erB4drrKtCycidu2FLKbrRn4mF71sfZKv
	 DEWms1hNJRZ/ZQJPfCTEQwaO8gx7sAdZYb0j2Sik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 826DCF800FE;
	Wed, 14 Sep 2022 08:43:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19D0FF800FE; Wed, 14 Sep 2022 08:43:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E69C1F800C0
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 08:43:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E69C1F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="Kk/rGJv2"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1663137794; bh=fAYvnnsuKh0viKPZ5Vl/NA0UgUQt+5jgfiRQuA+Yvs8=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=Kk/rGJv2vIOU3j7a0RG40c4nna/CgZgncTvJpIpgucUSkNQGZdaQod03Br+h6TL+M
 9jbxnz6sa3IHAEGqr0JIBkkbsoeSN+EQ4DusCQoqiFLws2aBqEM3+0n9mlOH6S/QXj
 ABzJVCr3oOGOwWnaYfCLhbClQrmwP3jgFAvPylv0=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH] ASoC: tas2562: Propagate the error in tas2562_dac_event()
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <20220913231706.516849-1-festevam@gmail.com>
Date: Wed, 14 Sep 2022 08:43:12 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <31E14BDD-FD8C-4DBE-8056-5F2351DC392C@cutebit.org>
References: <20220913231706.516849-1-festevam@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Fabio Estevam <festevam@denx.de>, alsa-devel@alsa-project.org,
 broonie@kernel.org
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


> On 14. 9. 2022, at 1:17, Fabio Estevam <festevam@gmail.com> wrote:
>=20
> From: Fabio Estevam <festevam@denx.de>
>=20
> Since commit 2848d34c3ba1 ("ASoC: tas2562: Fix mute/unmute") the
> following build warning is seen:
>=20
> sound/soc/codecs/tas2562.c:442:13: warning: variable 'ret' set but not =
used [-Wunused-but-set-variable]
>=20
> Fix the warning by returning the 'ret' variable.
>=20
> Fixes: 2848d34c3ba1 ("ASoC: tas2562: Fix mute/unmute")
> Signed-off-by: Fabio Estevam <festevam@denx.de>

That=E2=80=99s right, ret should be propagated. Thanks!

Reviewed-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>

> ---
> sound/soc/codecs/tas2562.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
> index 66149055aba9..b486d0bd86c9 100644
> --- a/sound/soc/codecs/tas2562.c
> +++ b/sound/soc/codecs/tas2562.c
> @@ -439,7 +439,7 @@ static int tas2562_dac_event(struct =
snd_soc_dapm_widget *w,
> 	struct snd_soc_component *component =3D
> 					=
snd_soc_dapm_to_component(w->dapm);
> 	struct tas2562_data *tas2562 =3D =
snd_soc_component_get_drvdata(component);
> -	int ret;
> +	int ret =3D 0;
>=20
> 	switch (event) {
> 	case SND_SOC_DAPM_POST_PMU:
> @@ -455,7 +455,7 @@ static int tas2562_dac_event(struct =
snd_soc_dapm_widget *w,
> 		return -EINVAL;
> 	}
>=20
> -	return 0;
> +	return ret;
> }
>=20
> static int tas2562_volume_control_get(struct snd_kcontrol *kcontrol,
> --=20
> 2.25.1
>=20

