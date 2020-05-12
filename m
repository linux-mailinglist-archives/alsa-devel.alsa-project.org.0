Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AFB1CF65E
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 16:03:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FF3116A9;
	Tue, 12 May 2020 16:02:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FF3116A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589292195;
	bh=cUvo8Jve4rFbb52xfwmlAz5Y/kEDQMtGYhn+v4XUK88=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J5QxDJD26d0e1pZWf767o3NoVCsR/YduxID9Jp49hGzqVrKFdI9dbWc3S6F9u5iC1
	 C9lnD6WOY+AqSGWg8Pbyr2av/Cn+2HyWXyCzfw3f8lKhxDENDqQEfwxqViFKIMWsbm
	 58cMlys1nLmsKHVvAulQsiLgnd558iwgZXv04I+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CA5EF800B7;
	Tue, 12 May 2020 16:01:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20679F8014C; Tue, 12 May 2020 16:01:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50C2BF800E3
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 16:01:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50C2BF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wQmZMWw3"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04CE1Mk2043470;
 Tue, 12 May 2020 09:01:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1589292082;
 bh=OR75gZnwlt6fdZF5hDS19wyJydL4WevuZucaJhccRRA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=wQmZMWw3QUNf5p89vL84saTSjkWOmuRgAp9tMeHY8E5Pw3ADFjlCl++5v/hzNKC+/
 VoIrpH6eQgBYrVsh3ZmVNQVm7FyEdtD39I8FMH8XFLKPyRJgHS+Xjkz5bs6Ntu1Zk2
 tcUT2aIzMgv04fukjIVfGM8R4X+AqbVerGOVlDsw=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04CE1MG7083187
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 12 May 2020 09:01:22 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 12
 May 2020 09:01:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 12 May 2020 09:01:22 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04CE1Jxb032373;
 Tue, 12 May 2020 09:01:20 -0500
Subject: Re: [PATCH] ASoC: ti: omap-mcbsp: Fix an error handling path in
 'asoc_mcbsp_probe()'
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 <jarkko.nikula@bitmer.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <linux-omap@vger.kernel.org>
References: <20200512134325.252073-1-christophe.jaillet@wanadoo.fr>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
X-Pep-Version: 2.0
Message-ID: <5f1b0172-279c-9368-838e-6ef0e2d67b15@ti.com>
Date: Tue, 12 May 2020 17:01:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200512134325.252073-1-christophe.jaillet@wanadoo.fr>
Content-Type: multipart/mixed; boundary="------------BC4735E1360B906FD979E055"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

--------------BC4735E1360B906FD979E055
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable



On 12/05/2020 16.43, Christophe JAILLET wrote:
> If an error occurs after the call to 'omap_mcbsp_init()', the reference=
 to
> 'mcbsp->fclk' must be decremented, as already done in the remove functi=
on.
>=20
> This can be achieved easily by using the devm_ variant of 'clk_get()'
> when the reference is taken in 'omap_mcbsp_init()'
>=20
> This fixes the leak in the probe and has the side effect to simplify bo=
th
> the error handling path of 'omap_mcbsp_init()' and the remove function.=


Acked-by: Peter Ujfalusi <peter.ujflausi@ti.com>

> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> I've not been able to identify the when the issue has been introduced, =
so
> no Fixes: tag.

I think this is there for a long-long time. It is a theoretical bug, in
practice it never happen (at least never faced with it over the years).

Thanks for the fix!

- P=C3=A9ter

> ---
>  sound/soc/ti/omap-mcbsp.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
> index 0348963f4df7..6c83b9888467 100644
> --- a/sound/soc/ti/omap-mcbsp.c
> +++ b/sound/soc/ti/omap-mcbsp.c
> @@ -686,7 +686,7 @@ static int omap_mcbsp_init(struct platform_device *=
pdev)
>  	mcbsp->dma_data[1].addr =3D omap_mcbsp_dma_reg_params(mcbsp,
>  						SNDRV_PCM_STREAM_CAPTURE);
> =20
> -	mcbsp->fclk =3D clk_get(&pdev->dev, "fck");
> +	mcbsp->fclk =3D devm_clk_get(&pdev->dev, "fck");
>  	if (IS_ERR(mcbsp->fclk)) {
>  		ret =3D PTR_ERR(mcbsp->fclk);
>  		dev_err(mcbsp->dev, "unable to get fck: %d\n", ret);
> @@ -711,7 +711,7 @@ static int omap_mcbsp_init(struct platform_device *=
pdev)
>  		if (ret) {
>  			dev_err(mcbsp->dev,
>  				"Unable to create additional controls\n");
> -			goto err_thres;
> +			return ret;
>  		}
>  	}
> =20
> @@ -724,8 +724,6 @@ static int omap_mcbsp_init(struct platform_device *=
pdev)
>  err_st:
>  	if (mcbsp->pdata->buffer_size)
>  		sysfs_remove_group(&mcbsp->dev->kobj, &additional_attr_group);
> -err_thres:
> -	clk_put(mcbsp->fclk);
>  	return ret;
>  }
> =20
> @@ -1442,8 +1440,6 @@ static int asoc_mcbsp_remove(struct platform_devi=
ce *pdev)
> =20
>  	omap_mcbsp_st_cleanup(pdev);
> =20
> -	clk_put(mcbsp->fclk);
> -
>  	return 0;
>  }
> =20
>=20

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

--------------BC4735E1360B906FD979E055
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

--------------BC4735E1360B906FD979E055--
