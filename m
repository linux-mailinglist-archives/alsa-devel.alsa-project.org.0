Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB874216AC0
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 12:49:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 643FF1697;
	Tue,  7 Jul 2020 12:48:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 643FF1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594118971;
	bh=vk9jR+Q9qynsTW3RGwZMwkvsjz5AeiN68oRmbekC0EA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MBhQ09oQAEHyP/OchmhkHfIgLvoLJ2cj2UhYVBmtlE4JeFGzGqwh1xuktCXJ8/8mW
	 fL+JFfaRLJ0GGcXwH729DpLi2Gi5BZWSYHF6YUKoOtnOQ1cNEPkmXjrbFQd/RrFZU+
	 UNygFj91PrLC1Z5I0wKe6HSb2fZnZVnSYuR/qBAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F888F80257;
	Tue,  7 Jul 2020 12:47:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD3AAF80216; Tue,  7 Jul 2020 12:47:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38C68F8011F
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 12:47:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38C68F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="W7I/bYA4"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 067AlXf7075713;
 Tue, 7 Jul 2020 05:47:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1594118854;
 bh=T+nHlhZOidYOCH29bUqU/Pu9XpetYy0kEACSndhggaU=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=W7I/bYA4P+vOJYQQssbhsAL3EojexiAa+4hA8Ips/b9sVXRZ/lf/JiINNDnpVcyce
 H9Ag4yjTH4rD48TwtCQnQEMC68gIMgROVFVlMQv/fuv2rMJPGwM3tBNQb9sa95Twlg
 sMzpFHxXjUXoh1/9xLoHvg3Ag5nFJR5SnOGcWFNI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 067AlXG4099736
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 7 Jul 2020 05:47:33 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 7 Jul
 2020 05:47:33 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 7 Jul 2020 05:47:33 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 067AlVc2096354;
 Tue, 7 Jul 2020 05:47:31 -0500
Subject: Re: [PATCH 21/28] ASoC: ti: omap-mcbsp-st: Remove set, but unused
 variable 'w'
To: Lee Jones <lee.jones@linaro.org>, <broonie@kernel.org>,
 <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>
References: <20200707101642.1747944-1-lee.jones@linaro.org>
 <20200707101642.1747944-22-lee.jones@linaro.org>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
X-Pep-Version: 2.0
Message-ID: <61d554e7-0579-3c6c-b9e1-30b135d5927c@ti.com>
Date: Tue, 7 Jul 2020 13:48:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200707101642.1747944-22-lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, Samuel Ortiz <samuel.ortiz@nokia.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, Jarkko Nikula <jarkko.nikula@bitmer.com>
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

Hi Lee,

On 07/07/2020 13.16, Lee Jones wrote:
> Looks like 'w' has remained unchecked since the driver's inception.
>=20
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  sound/soc/ti/omap-mcbsp-st.c: In function =E2=80=98omap_mcbsp_st_chgai=
n=E2=80=99:
>  sound/soc/ti/omap-mcbsp-st.c:145:6: warning: variable =E2=80=98w=E2=80=
=99 set but not used [-Wunused-but-set-variable]
>=20
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Cc: Jarkko Nikula <jarkko.nikula@bitmer.com>
> Cc: Samuel Ortiz <samuel.ortiz@nokia.com>
> Cc: linux-omap@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  sound/soc/ti/omap-mcbsp-st.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/sound/soc/ti/omap-mcbsp-st.c b/sound/soc/ti/omap-mcbsp-st.=
c
> index 5a32b54bbf3bb..643ef7eb68fc8 100644
> --- a/sound/soc/ti/omap-mcbsp-st.c
> +++ b/sound/soc/ti/omap-mcbsp-st.c
> @@ -142,10 +142,9 @@ static void omap_mcbsp_st_fir_write(struct omap_mc=
bsp *mcbsp, s16 *fir)
> =20
>  static void omap_mcbsp_st_chgain(struct omap_mcbsp *mcbsp)
>  {
> -	u16 w;
>  	struct omap_mcbsp_st_data *st_data =3D mcbsp->st_data;
> =20
> -	w =3D MCBSP_ST_READ(mcbsp, SSELCR);
> +	MCBSP_ST_READ(mcbsp, SSELCR);

The read can be removed at the same time.

>  	MCBSP_ST_WRITE(mcbsp, SGAINCR, ST_CH0GAIN(st_data->ch0gain) |
>  		       ST_CH1GAIN(st_data->ch1gain));
>=20

- P=C3=A9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

