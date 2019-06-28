Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29289597D4
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 11:47:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A106A1698;
	Fri, 28 Jun 2019 11:46:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A106A1698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561715233;
	bh=SAHA3TiytGr5XoOmkHR3wJSQ23qfGhbj2jyXJ/7BSOw=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q23FgF+DrFWi0oW9AiPmFnvA0U0q6hKOQIQzqPWIt6KrN2vlr36hxMF2miYQ8A4vm
	 fkHZ1/6WkvRn+vYvunvpq4zxouGfJ8UmN13tQrrjhEO/gvAlKdsByvLZlDOOEO4Iek
	 ozVxRpjG8TuwkzjXzN6sUk7W0WH7peN77K9hx/NY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C7B0F896B7;
	Fri, 28 Jun 2019 11:45:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2123DF896B9; Fri, 28 Jun 2019 11:45:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa2.microchip.iphmx.com (esa2.microchip.iphmx.com
 [68.232.149.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C747F80058
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 11:45:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C747F80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="HwinBS3I"
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="Codrin.Ciubotariu@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.63,427,1557212400"; d="scan'208";a="39298962"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Jun 2019 02:45:18 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex01.mchp-main.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 28 Jun 2019 02:45:12 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 28 Jun 2019 02:45:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=oVUBi6oaiLeO0EcjRWN4wcyFzeE6tfakSnGNf6IJzYCz83bSTvEVV8FshlPagbTPiCKFjm7WspXEmxybwR+5EBdhJXQC6M5FH0Mu+i79sersxKEbreT63zP/n8AfIspdoCRwNRkiHbGS6e9e8CtIr4unoOCDu9VE8JQ6bPxksWY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zoVK4xTZy8dVd9KdJT8b9CkfIMAsLcAsB9zbBVW+tM=;
 b=eA337PX8K6P4EBkXhkUV+Z2ADOtYf9Z+L7aD1NQnYFJNuduYWjhWjXqmZv/5LHVt+l1Gs1j4/bdYBXwt4c6FkFsjhpjTBvqPJJIBSeZfUsODLwEVYS269sIgMX9Cj/XL62mLCRH60gtXK3hhVEat/SxG/ocKODHdtlhc7RWzRL0=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zoVK4xTZy8dVd9KdJT8b9CkfIMAsLcAsB9zbBVW+tM=;
 b=HwinBS3Id/6l/FUT1OBv0yuvFdi7Wj9vXcydLIKfJj86MyY55/XVnr3knQG/Tw+T0ydfWv9yGgCfcvP1YCLt74x6Uxey8YD3nPZ2x0ZpOcLohGY72RTYHpTptJLfXntEMI39cx3eMnf+BD7IWpGqd0sjUX6bvp+wSfq7/zvLK/Y=
Received: from BN6PR11MB0051.namprd11.prod.outlook.com (10.161.153.153) by
 BN6PR11MB3873.namprd11.prod.outlook.com (10.255.131.101) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Fri, 28 Jun 2019 09:45:11 +0000
Received: from BN6PR11MB0051.namprd11.prod.outlook.com
 ([fe80::b979:a7e7:97e:7098]) by BN6PR11MB0051.namprd11.prod.outlook.com
 ([fe80::b979:a7e7:97e:7098%2]) with mapi id 15.20.2008.017; Fri, 28 Jun 2019
 09:45:11 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <kuninori.morimoto.gx@renesas.com>, <broonie@kernel.org>
Thread-Topic: [alsa-devel] [PATCH v2 01/23] ASoC: atmel: atmel-pcm-dma.c: use
 devm_snd_dmaengine_pcm_register()
Thread-Index: AQHVLZYtRYljVJ3Qvku2PjP2zfIroA==
Date: Fri, 28 Jun 2019 09:45:10 +0000
Message-ID: <919a7eda-8b5b-1749-2733-93b3489f4269@microchip.com>
References: <87blyitky2.wl-kuninori.morimoto.gx@renesas.com>
 <87a7e2tkx5.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a7e2tkx5.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0102CA0009.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::22) To BN6PR11MB0051.namprd11.prod.outlook.com
 (2603:10b6:405:65::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f60f23d6-3ead-4f4f-641b-08d6fbad4fc2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR11MB3873; 
x-ms-traffictypediagnostic: BN6PR11MB3873:
x-microsoft-antispam-prvs: <BN6PR11MB3873EFAB7D4EC4775ABAC820E7FC0@BN6PR11MB3873.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1107;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(346002)(376002)(396003)(39860400002)(199004)(189003)(66556008)(8676002)(81156014)(68736007)(66476007)(5660300002)(6246003)(81166006)(99286004)(66446008)(86362001)(486006)(316002)(2906002)(305945005)(3846002)(6116002)(4326008)(66066001)(7736002)(31686004)(11346002)(64756008)(478600001)(2616005)(6436002)(256004)(25786009)(14444005)(71190400001)(229853002)(8936002)(446003)(6486002)(6512007)(26005)(386003)(31696002)(186003)(14454004)(72206003)(52116002)(36756003)(76176011)(53546011)(6506007)(71200400001)(102836004)(476003)(73956011)(66946007)(110136005)(53936002)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB3873;
 H:BN6PR11MB0051.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: X7wl2sfgLxAg3XkWEtdL2sPhYE7WLXaXnGMMzs1mHLx9IAC1qsJTYbCgqPmwxYIaXkyMj4agm/h+uGFwooUUNhAaCzQhDnZ7amove3ky3Zm2vsD0vplYVtyaw9wZfWu/gKWs1gJZwMOx8D+Xon8wgloFwg8TW4EkfXLbx96z7sUytfKlhk4EDCVOJV6KhT9VyRa2LTyg9Yal3LCr6XpGyWTjoKmVAszmgHx+Nrgpb+NCSNrUQlHYLHglboz6XGLLZj375KdIKa8cFUVdBfdCy3YgmsTvB/f9Cw1kQC4fc8QgDfHt5UdRM6vo3HHwM9/pH3v1PnyIFilEqEm8fLzULAqj1kOzbXHHMH/QCDltfsav7CHYMhSCd9QJlH6zP9p73vJWNHK3uWpP03wRIexBnXgWpsk0OGcGudXMNMSxZ7I=
Content-ID: <7E71BC3BECDD3B4E87436EB179C191D8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f60f23d6-3ead-4f4f-641b-08d6fbad4fc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 09:45:10.9675 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Codrin.Ciubotariu@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3873
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH v2 01/23] ASoC: atmel: atmel-pcm-dma.c: use
 devm_snd_dmaengine_pcm_register()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 28.06.2019 07:07, Kuninori Morimoto wrote:
> External E-Mail
> 
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> We have devm_xxx version of snd_dmaengine_pcm_register,
> let's use it.
> 
> This patch also removes related empty functions
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Reviewed-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>

Thanks again!

Best regards,
Codrin

> v1 -> v2
> 
> 	- remove empty functions
> 
>   sound/soc/atmel/atmel-pcm-dma.c |  9 ++-------
>   sound/soc/atmel/atmel-pcm-pdc.c |  5 -----
>   sound/soc/atmel/atmel-pcm.h     |  8 --------
>   sound/soc/atmel/atmel_ssc_dai.c | 11 -----------
>   4 files changed, 2 insertions(+), 31 deletions(-)
> 
> diff --git a/sound/soc/atmel/atmel-pcm-dma.c b/sound/soc/atmel/atmel-pcm-dma.c
> index 042e593..db67f5b 100644
> --- a/sound/soc/atmel/atmel-pcm-dma.c
> +++ b/sound/soc/atmel/atmel-pcm-dma.c
> @@ -111,16 +111,11 @@ static const struct snd_dmaengine_pcm_config atmel_dmaengine_pcm_config = {
>   
>   int atmel_pcm_dma_platform_register(struct device *dev)
>   {
> -	return snd_dmaengine_pcm_register(dev, &atmel_dmaengine_pcm_config, 0);
> +	return devm_snd_dmaengine_pcm_register(dev,
> +					&atmel_dmaengine_pcm_config, 0);
>   }
>   EXPORT_SYMBOL(atmel_pcm_dma_platform_register);
>   
> -void atmel_pcm_dma_platform_unregister(struct device *dev)
> -{
> -	snd_dmaengine_pcm_unregister(dev);
> -}
> -EXPORT_SYMBOL(atmel_pcm_dma_platform_unregister);
> -
>   MODULE_AUTHOR("Bo Shen <voice.shen@atmel.com>");
>   MODULE_DESCRIPTION("Atmel DMA based PCM module");
>   MODULE_LICENSE("GPL");
> diff --git a/sound/soc/atmel/atmel-pcm-pdc.c b/sound/soc/atmel/atmel-pcm-pdc.c
> index 7e9aa70..ed095af 100644
> --- a/sound/soc/atmel/atmel-pcm-pdc.c
> +++ b/sound/soc/atmel/atmel-pcm-pdc.c
> @@ -393,11 +393,6 @@ int atmel_pcm_pdc_platform_register(struct device *dev)
>   }
>   EXPORT_SYMBOL(atmel_pcm_pdc_platform_register);
>   
> -void atmel_pcm_pdc_platform_unregister(struct device *dev)
> -{
> -}
> -EXPORT_SYMBOL(atmel_pcm_pdc_platform_unregister);
> -
>   MODULE_AUTHOR("Sedji Gaouaou <sedji.gaouaou@atmel.com>");
>   MODULE_DESCRIPTION("Atmel PCM module");
>   MODULE_LICENSE("GPL");
> diff --git a/sound/soc/atmel/atmel-pcm.h b/sound/soc/atmel/atmel-pcm.h
> index 5173c9b..2e64874 100644
> --- a/sound/soc/atmel/atmel-pcm.h
> +++ b/sound/soc/atmel/atmel-pcm.h
> @@ -72,28 +72,20 @@ struct atmel_pcm_dma_params {
>   
>   #if IS_ENABLED(CONFIG_SND_ATMEL_SOC_PDC)
>   int atmel_pcm_pdc_platform_register(struct device *dev);
> -void atmel_pcm_pdc_platform_unregister(struct device *dev);
>   #else
>   static inline int atmel_pcm_pdc_platform_register(struct device *dev)
>   {
>   	return 0;
>   }
> -static inline void atmel_pcm_pdc_platform_unregister(struct device *dev)
> -{
> -}
>   #endif
>   
>   #if IS_ENABLED(CONFIG_SND_ATMEL_SOC_DMA)
>   int atmel_pcm_dma_platform_register(struct device *dev);
> -void atmel_pcm_dma_platform_unregister(struct device *dev);
>   #else
>   static inline int atmel_pcm_dma_platform_register(struct device *dev)
>   {
>   	return 0;
>   }
> -static inline void atmel_pcm_dma_platform_unregister(struct device *dev)
> -{
> -}
>   #endif
>   
>   #endif /* _ATMEL_PCM_H */
> diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ssc_dai.c
> index b66c778..6f89483 100644
> --- a/sound/soc/atmel/atmel_ssc_dai.c
> +++ b/sound/soc/atmel/atmel_ssc_dai.c
> @@ -1012,16 +1012,6 @@ static int asoc_ssc_init(struct device *dev)
>   	return 0;
>   }
>   
> -static void asoc_ssc_exit(struct device *dev)
> -{
> -	struct ssc_device *ssc = dev_get_drvdata(dev);
> -
> -	if (ssc->pdata->use_dma)
> -		atmel_pcm_dma_platform_unregister(dev);
> -	else
> -		atmel_pcm_pdc_platform_unregister(dev);
> -}
> -
>   /**
>    * atmel_ssc_set_audio - Allocate the specified SSC for audio use.
>    */
> @@ -1050,7 +1040,6 @@ void atmel_ssc_put_audio(int ssc_id)
>   {
>   	struct ssc_device *ssc = ssc_info[ssc_id].ssc;
>   
> -	asoc_ssc_exit(&ssc->pdev->dev);
>   	ssc_free(ssc);
>   }
>   EXPORT_SYMBOL_GPL(atmel_ssc_put_audio);
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
