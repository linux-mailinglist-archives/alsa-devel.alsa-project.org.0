Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE5021359D
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 10:00:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 270EE16D2;
	Fri,  3 Jul 2020 10:00:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 270EE16D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593763250;
	bh=Uir5HRsEaAIQuDuskoIqOnUU+BYP1mPCuUeVlbjqMYk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ki4loI/aQ2f0I3XcUtLo+rTBwU9aSNOm+ne0nnhgG2p3kgGUdAie6rP1vNh8S91fF
	 TT/EoiGK9Fp4VLtudA55DtM6ySaMtaOmzH3iEnu1p9zuZln2usmhQQDGWne+DESNeO
	 X8zDGq263gAredw0kpVa0iliTbOiFOvd0waxvLRA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D593F800ED;
	Fri,  3 Jul 2020 09:59:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 118EDF80217; Fri,  3 Jul 2020 09:59:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E74AEF800E0
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 09:59:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E74AEF800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RJajxqja"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0637wv62049460;
 Fri, 3 Jul 2020 02:58:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1593763137;
 bh=hRJk4qExkZmvzEg1cgK9sURYCcpGTnP5CZ1jdi0sLm0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=RJajxqjaSvfdCZBLLTpNvGjpgM/SJyVwjTHopxbF9qAscEtreGY/BkVdSmtCsaZFm
 uZXD1wAfnH9GLc/FOS1l0yi0hlp0ilj/Y+BYaUFuOy2a4fT15LJ21bDwVx0DL5NSnD
 R1lbKGGSLer/UIZRLSZjEHqnBlLq9AdL0p6Fha+w=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0637wvJH090818
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 Jul 2020 02:58:57 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 3 Jul
 2020 02:58:57 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 3 Jul 2020 02:58:57 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0637wtXp122879;
 Fri, 3 Jul 2020 02:58:55 -0500
Subject: Re: [PATCH -next] ASoC: ti: j721e-evm: Fix missing unlock on error in
 j721e_audio_hw_params()
To: Wei Yongjun <weiyongjun1@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>
References: <20200703030910.75047-1-weiyongjun1@huawei.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
X-Pep-Version: 2.0
Message-ID: <8ab2ddf8-88db-a5e5-b97a-76b4fe014bdd@ti.com>
Date: Fri, 3 Jul 2020 10:59:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200703030910.75047-1-weiyongjun1@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hulk Robot <hulkci@huawei.com>, alsa-devel@alsa-project.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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



On 03/07/2020 6.09, Wei Yongjun wrote:
> Add the missing unlock before return from function j721e_audio_hw_param=
s()
> in the error handling case.

I'm not sure how that return made it in there in the first place..

Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

> Fixes: 6748d0559059 ("ASoC: ti: Add custom machine driver for j721e EVM=
 (CPB and IVI)")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  sound/soc/ti/j721e-evm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/sound/soc/ti/j721e-evm.c b/sound/soc/ti/j721e-evm.c
> index 3a2a8b1f3aa3..174306cf53ad 100644
> --- a/sound/soc/ti/j721e-evm.c
> +++ b/sound/soc/ti/j721e-evm.c
> @@ -330,7 +330,7 @@ static int j721e_audio_hw_params(struct snd_pcm_sub=
stream *substream,
>  		ret =3D snd_soc_dai_set_tdm_slot(codec_dai, 0x3, 0x3, 2,
>  					       slot_width);
>  		if (ret && ret !=3D -ENOTSUPP)
> -			return ret;
> +			goto out;
>  	}
> =20
>  	ret =3D j721e_configure_refclk(priv, domain_id, params_rate(params));=

>=20
>=20
>=20

- P=C3=A9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

