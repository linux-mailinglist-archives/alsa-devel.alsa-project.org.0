Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3712A217F2F
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 07:40:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3A161661;
	Wed,  8 Jul 2020 07:39:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3A161661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594186847;
	bh=lGyN1e29cwGChUnCFiPOFocJftOcTJV8cM2VhNPzdlM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=quXoFRpAQPiLZwWX0hrrL2xkg9Msr/ewq0SNN6xKrBiX44Ss09ub7Z3aXvr9W/2W+
	 ExdOBvdfdxu/SLcEDvlkgW+pX9uWrVga1EcnrZcehKN7chanh30S2NchOs+95cSaeh
	 5QsOrycBhQIowDs5wRuUFhny+xWnVQVRQQe89me0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE281F80150;
	Wed,  8 Jul 2020 07:39:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F165EF8015A; Wed,  8 Jul 2020 07:39:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76F58F8011F
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 07:38:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76F58F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="eEYSrpLt"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0685cmGR004469;
 Wed, 8 Jul 2020 00:38:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1594186728;
 bh=LifHd+6VnWqpYV3vbn/ZBl2W0YOQxwd/c5VBQf9Tt30=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=eEYSrpLtcBUNQwFoOOwVcKUz/yJUsZy08VTQfBZeIG8fYDlaP5UAJ/zcegsBR7ILJ
 ah+Jmo/fJjDJJUzdnEs0286zV8bUIF/WqW0GXtv6pOokDIcD7Gfa5CfmnPGM/18dam
 Fs2z/n+ceQ6JhhKKM2sbndBAHfMZPM/KpR+MGTls=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0685cmLp093876
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 8 Jul 2020 00:38:48 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 8 Jul
 2020 00:38:47 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 8 Jul 2020 00:38:47 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0685cieM073282;
 Wed, 8 Jul 2020 00:38:45 -0500
Subject: Re: [PATCH v3 09/13] ASoC: ti: omap-mcbsp-st: Remove set, but unused
 variable 'w'
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20200707190612.97799-1-pierre-louis.bossart@linux.intel.com>
 <20200707190612.97799-10-pierre-louis.bossart@linux.intel.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
X-Pep-Version: 2.0
Message-ID: <f386522e-04b3-21e8-bf9b-c5431622693f@ti.com>
Date: Wed, 8 Jul 2020 08:39:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200707190612.97799-10-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: tiwai@suse.de, open list <linux-kernel@vger.kernel.org>,
 Samuel Ortiz <samuel.ortiz@nokia.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, broonie@kernel.org,
 linux-omap@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
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



On 07/07/2020 22.06, Pierre-Louis Bossart wrote:
> From: Lee Jones <lee.jones@linaro.org>
>=20
> Looks like 'w' has remained unchecked since the driver's inception.
>=20
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  sound/soc/ti/omap-mcbsp-st.c: In function =E2=80=98omap_mcbsp_st_chgai=
n=E2=80=99:
>  sound/soc/ti/omap-mcbsp-st.c:145:6: warning: variable =E2=80=98w=E2=80=
=99 set but not used [-Wunused-but-set-variable]
>=20
> Peter suggested that the whole read can be removed, so that's
> been done too.

Thank you,

Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

>=20
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Cc: Jarkko Nikula <jarkko.nikula@bitmer.com>
> Cc: Samuel Ortiz <samuel.ortiz@nokia.com>
> Cc: linux-omap@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.c=
om>
> ---
>  sound/soc/ti/omap-mcbsp-st.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/sound/soc/ti/omap-mcbsp-st.c b/sound/soc/ti/omap-mcbsp-st.=
c
> index 5a32b54bbf3b..0bc7d26c660a 100644
> --- a/sound/soc/ti/omap-mcbsp-st.c
> +++ b/sound/soc/ti/omap-mcbsp-st.c
> @@ -142,11 +142,8 @@ static void omap_mcbsp_st_fir_write(struct omap_mc=
bsp *mcbsp, s16 *fir)
> =20
>  static void omap_mcbsp_st_chgain(struct omap_mcbsp *mcbsp)
>  {
> -	u16 w;
>  	struct omap_mcbsp_st_data *st_data =3D mcbsp->st_data;
> =20
> -	w =3D MCBSP_ST_READ(mcbsp, SSELCR);
> -
>  	MCBSP_ST_WRITE(mcbsp, SGAINCR, ST_CH0GAIN(st_data->ch0gain) |
>  		       ST_CH1GAIN(st_data->ch1gain));
>  }
>=20

- P=C3=A9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

