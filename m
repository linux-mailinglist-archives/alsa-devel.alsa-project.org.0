Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 890E510A32C
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Nov 2019 18:11:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13FF9176C;
	Tue, 26 Nov 2019 18:10:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13FF9176C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574788279;
	bh=wA+6zDmGhjZJUzgoZjEz8lfIWUfSFSQRbIboMvAVSB4=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WbICHayzVUNgKqGp2DA0nxD4rl7RkQJj7tBOMJOlPmOpumdNPZSeLzLamDbzW8lHP
	 JAP62UOqoCjf6puGM4rJk0DcYJePACPEnZupD/n2FJc1M9sYoLGrKqg5nBERIjabSZ
	 DXRHLNeuv1LM7LyAOKy2vekp5SFYc5mFiYnASReE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1799EF8020B;
	Tue, 26 Nov 2019 18:09:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F244F801F5; Tue, 26 Nov 2019 18:09:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 803D0F800DD
 for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2019 18:09:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 803D0F800DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="cjpkddwP"
Received: from [46.226.52.200] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-6.bemta.az-b.eu-west-1.aws.symcld.net id B7/96-19153-53C5DDD5;
 Tue, 26 Nov 2019 17:09:09 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIJsWRWlGSWpSXmKPExsWSoc9gpWsSczf
 WoKXd0OLKxUNMFlMfPmGz2Hyuh9Xi25UOJovLu+awWXTu6me1uPvaz2LD97WMDhweGz43sXns
 uLuE0WPnrLvsHptWdbJ57Hu7jM1j/ZarLB6fN8kFsEexZuYl5VcksGZcXZ1Q8FG8YuaT66wNj
 B+Euxi5OBgFljJLPDx3kQnCOcYiMfHYVFYIZzOjxO/en2wgDovACaCy3x1gjpDAVCaJp6t3MU
 M4Dxkllmw/C5Th5GATsJCYfOIBWJWIwEtGias7ZoANYxb4yChx5M45VpAqYQF3ieeXPgFVcQB
 VeUhs3eIIEhYRMJJoe7SDHcRmEVCVuHXvEhOIzSuQKHF/xxqwViGBGomX31eDxTkFXCTeTX4J
 tphRQFbiS+NqZhCbWUBc4taT+WA1EgICEkv2nGeGsEUlXj7+xwpRnypxsukGI0RcR+Ls9SdQt
 pLEvLlHoGxZiUvzuxlBzpQQ8JVoveYEU97SuRdqpIXEku5WFogSFYl/hyohwgUSa868Z4Ow1S
 QutxyCmigj8ergeXBYSwhcYJX4c2Ez4wRG/VlIroawdSQW7P7EBmFrSyxb+Jp5FjgkBCVOznz
 CsoCRZRWjeVJRZnpGSW5iZo6uoYGBrqGhka6hpYWukYVeYpVukl5qqW55anGJrqFeYnmxXnFl
 bnJOil5easkmRmBqSyk4JrODsePTW71DjJIcTEqivIHsd2OF+JLyUyozEosz4otKc1KLDzHKc
 HAoSfCWRAPlBItS01Mr0jJzgGkWJi3BwaMkwrsPJM1bXJCYW5yZDpE6xajLMeHl3EXMQix5+X
 mpUuK8ASBFAiBFGaV5cCNgKf8So6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeBSBTeDLzSuA
 2vQI6ggnoCKaZt0COKElESEk1MOmvUmTfp/swwpKTcQOX3ooCedX5bZncvFr2onfnv1w+WzF2
 HttpC0P3OQqZevNmrbi0v1RZmpPbRPrRy+LQyI/hHn8UGRvnKn/I2DRl4ye7EAHFTQtWq8+0t
 LmkLX4o0Mrm6/vwU47+058/9ulU9FT9t8fQiCdVSvHnzLf7ZLpcrxyQbH9gl7ZO3Or6TksR3y
 dW/l8DC9x/hB55uo2jZDvXynygG3eKrfQ+oe/Y0bjIQULN/qmpopZrz6cXEaU9JnqVXya9nH6
 hyiUhT/4AW0Ep2+wKteRZR9fPWrYxek1SgYFEq+n7NbUdh5ZyzT0+0Tn1dY6+qlaLRn+TZXOi
 W+/iM0cvrJLyWfoy/ZYSS3FGoqEWc1FxIgAI1wMmdAQAAA==
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-15.tower-288.messagelabs.com!1574788148!384261!1
X-Originating-IP: [104.47.0.58]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26206 invoked from network); 26 Nov 2019 17:09:08 -0000
Received: from mail-he1eur01lp2058.outbound.protection.outlook.com (HELO
 EUR01-HE1-obe.outbound.protection.outlook.com) (104.47.0.58)
 by server-15.tower-288.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Nov 2019 17:09:08 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=duMAW/D4/9ZSaXzuCxlJhDCRJCtZ9sje1o0VXi1QRbLIlvHDC5Z0zMvpgDp3Ee8ZgiEurZhNLWOOvjDLRL++0EtMKiA0OLadBy3imT3WiJXQCzbYuCU0e5GIalt232TPEJuINa/DFQCMRWA791onwEJvi1u9sa4VIVFTnbS+K+Cn4qfDQLVvqnN5PweVsIHZwSph5rLQP6CBhPwAMJwpu5C6Q3Yn5atcGnuIzKUMecYE5/9fpvhRLCR4sPLkovNZaUZdiohPCFd0An0GEfWrtkBRjGBqrvMDuPf+nBUcw5PtAeV8PniY4DFRQ5MQ3u76SySy7crzgI0W5eM8+Nmqaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESL2msQHjUumA/FF7ssFRHnSPTztIwj34g78Rr8GH2A=;
 b=YWdGyykQbZ8gWljdPwDfe5FAIZSm/V3+7evvt7D6gjVTq5GhkgP5neT+PzqrX+Jl/a45PpB6XMrfkKu0Yaz7KmcO6J+pyNaddHm8E3l3WFdvrmxVWGfLY9XhXqhcxrGb7SPG2n9CUcsjed+jlfjT08ZZ4NnjmQzz/qYuabCpBSA4Tus3cThJfr4lc614cBPht0kBv1mJsljDULwCyFw5ZyGh1hTw/p5lZ9IXw/X0IaZvr58TDRygDAGf7fsV1dIBgoFKN7MdmF4kgOMtcHIl+PmIimmXPSRZSVqm2sHwl/QlERpntIimqEm5Y2GLpKyKVu42PrOKqC1xDHc8gQy0ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESL2msQHjUumA/FF7ssFRHnSPTztIwj34g78Rr8GH2A=;
 b=cjpkddwPwfDkGtZbmaFvatS+uLye7Xu8N2uAmDAUwwrK63V5vZT3oUsfHnUs9CTX5reijpmxNhGDBvBVxhJ9csuP0daChYUIBQM69+Uvf6/XfTYh7Ajz6AUyQlZ+9DBGzTGp1z0pRO/dXRpcibiPWIEp0jGo6+GeiJGeDNbDK7g=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1041.EURPRD10.PROD.OUTLOOK.COM (10.169.155.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Tue, 26 Nov 2019 17:09:06 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df%7]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 17:09:06 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>, Adam Thomson
 <Adam.Thomson.Opensource@diasemi.com>, Support Opensource
 <Support.Opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>
Thread-Topic: [PATCHv2 4/6] ASoC: da7213: Move set_sysclk to codec level
Thread-Index: AQHVn7aaBTnjqncJ80WQRHaMl2nGI6eduAyw
Date: Tue, 26 Nov 2019 17:09:06 +0000
Message-ID: <AM5PR1001MB0994623216C6B8690E2112DE80450@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191120152406.2744-1-sebastian.reichel@collabora.com>
 <20191120152406.2744-5-sebastian.reichel@collabora.com>
In-Reply-To: <20191120152406.2744-5-sebastian.reichel@collabora.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 458004dc-854d-4f62-660b-08d7729358a8
x-ms-traffictypediagnostic: AM5PR1001MB1041:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB10414651CDA1F26675C4031EA7450@AM5PR1001MB1041.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 0233768B38
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(39860400002)(376002)(396003)(346002)(199004)(189003)(256004)(6506007)(53546011)(110136005)(478600001)(229853002)(52536014)(66066001)(316002)(55236004)(2906002)(71190400001)(74316002)(71200400001)(446003)(6246003)(102836004)(6116002)(86362001)(25786009)(33656002)(305945005)(6436002)(7736002)(3846002)(11346002)(186003)(54906003)(26005)(5660300002)(99286004)(76176011)(8676002)(81156014)(81166006)(14454004)(55016002)(8936002)(7696005)(66946007)(66446008)(9686003)(64756008)(66556008)(66476007)(4326008)(76116006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR1001MB1041;
 H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5Q5x/9udccSnsZIjP1KsazVtKgXV8YsgHlmr89nu/RY1tZm80r3lcUHrcW8oba/r+Ezkc7ZUD2VQ76+14mrEk3Ossw1N9F4qKMQXKT7fzHn00fS52wz0lqYjsomCTjo1dxO18hnW0U9/BTq2cIwRf93bBj4CdkH/DJkUmaPMYNE1W8bh5/m4uS6om759JD47QZWoh6E5eEu7K3tMg9Luh0c2MdcEOlhHdyX+sHloNGbncEyAlppFMtGREPNxbms78d/FuJ3CE791V9dxT8zV4e3BDsIyNksK6cF/anYIGRylaOVkw7M7hJScNiYPMeXE8qRxezdH18Vkgmi8FG629DpjNHUPSbpebpFqReq/mNBrYJy/FPizEz66RZ/BoAM2mRLcP+Ll2BACx2lPHKKz438GXDmPEWbKddtemnehmbRaG5EW3ISe+gB03u/OBzOm
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 458004dc-854d-4f62-660b-08d7729358a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2019 17:09:06.8225 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N4PtW7N6zGbt1u1VVlwtVPXQlZMlJO3IQtdYUnh4ldLQnjwXDkGZTbYpK1sVtiRIa6PzYOTgAT0fuNRrph7ZxG4uv8mgB56Djrnz3U9gk38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1041
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kernel@collabora.com" <kernel@collabora.com>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCHv2 4/6] ASoC: da7213: Move set_sysclk to
	codec level
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

On 20 November 2019 15:24, Sebastian Reichel wrote:

> Move set_sysclk function to component level, so that it can be used at
> both component and DAI level.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

> ---
>  sound/soc/codecs/da7213.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
> index 0359249118d0..9686948b16ea 100644
> --- a/sound/soc/codecs/da7213.c
> +++ b/sound/soc/codecs/da7213.c
> @@ -1343,10 +1343,10 @@ static int da7213_mute(struct snd_soc_dai *dai, int
> mute)
>  #define DA7213_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |
> SNDRV_PCM_FMTBIT_S20_3LE |\
>  			SNDRV_PCM_FMTBIT_S24_LE |
> SNDRV_PCM_FMTBIT_S32_LE)
> 
> -static int da7213_set_dai_sysclk(struct snd_soc_dai *codec_dai,
> -				 int clk_id, unsigned int freq, int dir)
> +static int da7213_set_component_sysclk(struct snd_soc_component
> *component,
> +				       int clk_id, int source,
> +				       unsigned int freq, int dir)
>  {
> -	struct snd_soc_component *component = codec_dai->component;
>  	struct da7213_priv *da7213 =
> snd_soc_component_get_drvdata(component);
>  	int ret = 0;
> 
> @@ -1354,7 +1354,7 @@ static int da7213_set_dai_sysclk(struct snd_soc_dai
> *codec_dai,
>  		return 0;
> 
>  	if (((freq < 5000000) && (freq != 32768)) || (freq > 54000000)) {
> -		dev_err(codec_dai->dev, "Unsupported MCLK value %d\n",
> +		dev_err(component->dev, "Unsupported MCLK value %d\n",
>  			freq);
>  		return -EINVAL;
>  	}
> @@ -1370,7 +1370,7 @@ static int da7213_set_dai_sysclk(struct snd_soc_dai
> *codec_dai,
>  				    DA7213_PLL_MCLK_SQR_EN);
>  		break;
>  	default:
> -		dev_err(codec_dai->dev, "Unknown clock source %d\n", clk_id);
> +		dev_err(component->dev, "Unknown clock source %d\n",
> clk_id);
>  		return -EINVAL;
>  	}
> 
> @@ -1380,7 +1380,7 @@ static int da7213_set_dai_sysclk(struct snd_soc_dai
> *codec_dai,
>  		freq = clk_round_rate(da7213->mclk, freq);
>  		ret = clk_set_rate(da7213->mclk, freq);
>  		if (ret) {
> -			dev_err(codec_dai->dev, "Failed to set clock rate %d\n",
> +			dev_err(component->dev, "Failed to set clock rate
> %d\n",
>  				freq);
>  			return ret;
>  		}
> @@ -1507,7 +1507,6 @@ static int da7213_set_dai_pll(struct snd_soc_dai
> *codec_dai, int pll_id,
>  static const struct snd_soc_dai_ops da7213_dai_ops = {
>  	.hw_params	= da7213_hw_params,
>  	.set_fmt	= da7213_set_dai_fmt,
> -	.set_sysclk	= da7213_set_dai_sysclk,
>  	.set_pll	= da7213_set_dai_pll,
>  	.digital_mute	= da7213_mute,
>  };
> @@ -1845,6 +1844,7 @@ static const struct snd_soc_component_driver
> soc_component_dev_da7213 = {
>  	.num_dapm_widgets	= ARRAY_SIZE(da7213_dapm_widgets),
>  	.dapm_routes		= da7213_audio_map,
>  	.num_dapm_routes	= ARRAY_SIZE(da7213_audio_map),
> +	.set_sysclk		= da7213_set_component_sysclk,
>  	.idle_bias_on		= 1,
>  	.use_pmdown_time	= 1,
>  	.endianness		= 1,
> --
> 2.24.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
