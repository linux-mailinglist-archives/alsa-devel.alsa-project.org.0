Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E051D2AF8
	for <lists+alsa-devel@lfdr.de>; Thu, 14 May 2020 11:09:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 875FE166F;
	Thu, 14 May 2020 11:08:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 875FE166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589447377;
	bh=LQ9s3nrFwB24ZcAnIhiIKa+7Inn7DuUM8uznpGTM/gE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AaaWMo02eTg4mU3F2UudIWD9XVxUqXjs+6N3euCbkFNnSfgpr32Ke3sRQJkG+pLZC
	 7POddr3xAylVl5sblFVQhhk3/2+eMs3LhRPl0BR8kqtRkFT2vE3wNynQ3aBr+DV2jE
	 MCyQrcc//2D2n2/AUViSm+/iEm3sK4j+dDm8KPuk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E403F80101;
	Thu, 14 May 2020 11:07:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76D4EF801DB; Thu, 14 May 2020 11:07:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79C63F800E3
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 11:07:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79C63F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nJzJ0Xxq"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04E97hwE077021;
 Thu, 14 May 2020 04:07:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1589447263;
 bh=Gss6pOmUw7MRS/zF4loJG2KRE4hIIm8G1tf4rhJnPG4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=nJzJ0XxqkZN+74xAR9gbJh7iARm/s/LMn2+TfFWZVMwo6jTlfvligITIyiVnFiF/T
 xEKCatg3wCrJ5qTxv2qrdaR8xskgD/xXDoj72USTuXRXmkq43fDhzbrU7xNxxPUtYZ
 InRPlsvhSaIzid4wKbXL6VWooUxbD3EJUemJIB+k=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04E97hfN095250
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 14 May 2020 04:07:43 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 14
 May 2020 04:07:42 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 14 May 2020 04:07:42 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04E97fns038007;
 Thu, 14 May 2020 04:07:42 -0500
Subject: Re: [PATCH v2 18/21] ASoC: ti: use snd_soc_xxx_active()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
References: <87blmq9alx.wl-kuninori.morimoto.gx@renesas.com>
 <87lflu7vqd.wl-kuninori.morimoto.gx@renesas.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
X-Pep-Version: 2.0
Message-ID: <7a56e94c-442a-96e0-25b7-eb8d8915c3d4@ti.com>
Date: Thu, 14 May 2020 12:08:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <87lflu7vqd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: multipart/mixed; boundary="------------FFDBEBBEE2B27120BFAB6450"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

--------------FFDBEBBEE2B27120BFAB6450
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable



On 14/05/2020 11.43, Kuninori Morimoto wrote:
>=20
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>=20
> We have snd_soc_dai/dai_stream/component_active() macro
> This patch uses it.

Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

>=20
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> v1 -> v2
> 	- adjust to latest patch-set
>=20
>  sound/soc/ti/davinci-mcasp.c | 2 +-
>  sound/soc/ti/omap-dmic.c     | 4 ++--
>  sound/soc/ti/omap-mcbsp.c    | 4 ++--
>  sound/soc/ti/omap-mcpdm.c    | 8 ++++----
>  4 files changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.=
c
> index 734ffe925c4d..f3a99f016557 100644
> --- a/sound/soc/ti/davinci-mcasp.c
> +++ b/sound/soc/ti/davinci-mcasp.c
> @@ -1577,7 +1577,7 @@ static void davinci_mcasp_shutdown(struct snd_pcm=
_substream *substream,
>  	if (mcasp->op_mode =3D=3D DAVINCI_MCASP_DIT_MODE)
>  		return;
> =20
> -	if (!cpu_dai->active) {
> +	if (!snd_soc_dai_active(cpu_dai)) {
>  		mcasp->channels =3D 0;
>  		mcasp->max_format_width =3D 0;
>  	}
> diff --git a/sound/soc/ti/omap-dmic.c b/sound/soc/ti/omap-dmic.c
> index 913579c43e9d..01abf1be5d78 100644
> --- a/sound/soc/ti/omap-dmic.c
> +++ b/sound/soc/ti/omap-dmic.c
> @@ -95,7 +95,7 @@ static int omap_dmic_dai_startup(struct snd_pcm_subst=
ream *substream,
> =20
>  	mutex_lock(&dmic->mutex);
> =20
> -	if (!dai->active)
> +	if (!snd_soc_dai_active(dai))
>  		dmic->active =3D 1;
>  	else
>  		ret =3D -EBUSY;
> @@ -114,7 +114,7 @@ static void omap_dmic_dai_shutdown(struct snd_pcm_s=
ubstream *substream,
> =20
>  	cpu_latency_qos_remove_request(&dmic->pm_qos_req);
> =20
> -	if (!dai->active)
> +	if (!snd_soc_dai_active(dai))
>  		dmic->active =3D 0;
> =20
>  	mutex_unlock(&dmic->mutex);
> diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
> index 0348963f4df7..a9785d4916b7 100644
> --- a/sound/soc/ti/omap-mcbsp.c
> +++ b/sound/soc/ti/omap-mcbsp.c
> @@ -788,7 +788,7 @@ static int omap_mcbsp_dai_startup(struct snd_pcm_su=
bstream *substream,
>  	struct omap_mcbsp *mcbsp =3D snd_soc_dai_get_drvdata(cpu_dai);
>  	int err =3D 0;
> =20
> -	if (!cpu_dai->active)
> +	if (!snd_soc_dai_active(cpu_dai))
>  		err =3D omap_mcbsp_request(mcbsp);
> =20
>  	/*
> @@ -843,7 +843,7 @@ static void omap_mcbsp_dai_shutdown(struct snd_pcm_=
substream *substream,
> =20
>  	mcbsp->latency[stream1] =3D 0;
> =20
> -	if (!cpu_dai->active) {
> +	if (!snd_soc_dai_active(cpu_dai)) {
>  		omap_mcbsp_free(mcbsp);
>  		mcbsp->configured =3D 0;
>  	}
> diff --git a/sound/soc/ti/omap-mcpdm.c b/sound/soc/ti/omap-mcpdm.c
> index f2dbadea33bb..d482b62f314a 100644
> --- a/sound/soc/ti/omap-mcpdm.c
> +++ b/sound/soc/ti/omap-mcpdm.c
> @@ -253,7 +253,7 @@ static int omap_mcpdm_dai_startup(struct snd_pcm_su=
bstream *substream,
> =20
>  	mutex_lock(&mcpdm->mutex);
> =20
> -	if (!dai->active)
> +	if (!snd_soc_dai_active(dai))
>  		omap_mcpdm_open_streams(mcpdm);
> =20
>  	mutex_unlock(&mcpdm->mutex);
> @@ -271,7 +271,7 @@ static void omap_mcpdm_dai_shutdown(struct snd_pcm_=
substream *substream,
> =20
>  	mutex_lock(&mcpdm->mutex);
> =20
> -	if (!dai->active) {
> +	if (!snd_soc_dai_active(dai)) {
>  		if (omap_mcpdm_active(mcpdm)) {
>  			omap_mcpdm_stop(mcpdm);
>  			omap_mcpdm_close_streams(mcpdm);
> @@ -462,7 +462,7 @@ static int omap_mcpdm_suspend(struct snd_soc_compon=
ent *component)
>  {
>  	struct omap_mcpdm *mcpdm =3D snd_soc_component_get_drvdata(component)=
;
> =20
> -	if (component->active) {
> +	if (snd_soc_component_active(component)) {
>  		omap_mcpdm_stop(mcpdm);
>  		omap_mcpdm_close_streams(mcpdm);
>  	}
> @@ -484,7 +484,7 @@ static int omap_mcpdm_resume(struct snd_soc_compone=
nt *component)
>  		while (mcpdm->pm_active_count--)
>  			pm_runtime_get_sync(mcpdm->dev);
> =20
> -		if (component->active) {
> +		if (snd_soc_component_active(component)) {
>  			omap_mcpdm_open_streams(mcpdm);
>  			omap_mcpdm_start(mcpdm);
>  		}
>=20

- P=C3=A9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

--------------FFDBEBBEE2B27120BFAB6450
Content-Type: application/pgp-keys; name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

mQENBFki4nsBCAD3BM+Ogt951JlaDloruEjoZk/Z+/37CjP0fY2mqLhBOzkpx95u
X1Fquf0KfVk+ZzCd25XGOZEtpZNlXfbxRr2iRWPS5RW2FeLYGvg2TTJCpSr+ugKu
OOec6KECCUotGbGhpYwBrbarJNEwDcAzPK7UJYa1rhWOmkpZJ1hXF1hUghB84q35
8DmN4sGLcsIbVdRFZ1tWFh4vGBFV9LsoDZIrnnANb6/XMX78s+tr3RG3GZBaFPl8
jO5IIv0UIGNUKaYlNVFYthjGCzOqtstHchWuK9eQkR7m1+Vc+ezh1qK0VJydIcjn
OtoMZZL7RAz13LB9vmcJjbQPnI7dJojz/M7zABEBAAG0JlBldGVyIFVqZmFsdXNp
IDxwZXRlci51amZhbHVzaUB0aS5jb20+iQFOBBMBCAA4FiEE+dBcpRFvJjZw+uta
LCayis85LN4FAlki4nsCGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQLCay
is85LN4QjggAzxxxXqiWpA3vuj9yrlGLft3BeGKWqF8+RzdeRvshtNdpGeIFf+r5
AJVR71R1w89Qeb4DGXus7qsKiafdFGG7yxbuhw8a5wUm+ZncBXA+ETn3OyVtl8g8
r/ZcPX420jClBNTVuL0sSnyqDFDrt5f+uAFOIwsnHdpns174Zu9QhgYxdvdZ+jMh
Psb745O9EVeNvdfUIRdrVjb4IhJKNIzkb0Tulsz5xeCJReUYpxZU1jzEq3YZqIou
+fi+oS4wlJuSoxKKTmIXtSeEy/weStF1XHMo6vLYqzaK4FyIuclqeuYUYSVy2425
7TMXugaI+O85AEI6KW8MCcu1NucSfAWUabkBDQRZIuJ7AQgAypKq8iIugpHxWA2c
Ck6MQdPBT6cOEVK0tjeHaHAVOUPiw9Pq+ssMifdIkDdqXNZ3RLH/X2svYvd8c81C
egqshfB8nkJ5EKmQc9d7s0EwnYT8OwsoVb3c2WXnsdcKEyu2nHgyeJEUpPpMPyLc
+PWhoREifttab4sOPktepdnUbvrDK/gkjHmiG6+L2owSn637N+Apo3/eQuDajfEu
kybxK19ReRcp6dbqWSBGSeNB32c/zv1ka37bTMNVUY39Rl+/8lA/utLfrMeACHRO
FGO1BexMASKUdmlB0v9n4BaJFGrAJYAFJBNHLCDemqkU7gjaiimuHSjwuP0Wk7Ct
KQJfVQARAQABiQE2BBgBCAAgFiEE+dBcpRFvJjZw+utaLCayis85LN4FAlki4nsC
GwwACgkQLCayis85LN7kCwgAoy9r3ZQfJNOXO1q/YQfpEELHn0p8LpwliSDUS1xL
sswyxtZS8LlW8PjlTXuBLu38Vfr0vGav7oyV7TkhnKT3oBOLXanyZqwgyZSKNEGB
PB4v3Fo7YTzpfSofiwuz03uyfjTxiMGjonxSb+YxM7HBHfzjrOKKlg02fK+lWNZo
m5lXugeWD7U6JJguNdYfr+U4zYIblelUImcIE+wnR0oLzUEVDIWSpVrl/OqS3Rzo
mw8wBsHksTHrbgUnKL0SCzYc90BTeKbyjEBnVDr+dlfbxRxkB8h9RMPMdjodvXzS
Gfsa9V/k4XAsh7iX9EUVBbnmjA61ySxU/w98h96jMuteTg=3D=3D
=3DeQmw
-----END PGP PUBLIC KEY BLOCK-----

--------------FFDBEBBEE2B27120BFAB6450--
