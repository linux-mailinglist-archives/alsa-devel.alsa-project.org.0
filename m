Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F34F7647
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 15:22:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17A3D1676;
	Mon, 11 Nov 2019 15:21:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17A3D1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573482123;
	bh=spg2rSJQDxnXjBnwflZLocdSJJOC8+fujlynWCcVBX0=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F6gBUvGkPw0XS4C2/yb7zZNyFZ2PcTAwkBQhDIPsf6WIGI16vxSqAAIBtchlbNTJK
	 4scKfH4DgzbBE3L7ISy+cCtfKQrrrJqk0z9uIycj/2c0X8tLkBAL+VdRjOqcjWYxC7
	 wRf5yeh724oUYrROXieN4C0mKwMh1qbl3SX3O8cw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79DC8F80518;
	Mon, 11 Nov 2019 15:20:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E303F804FF; Mon, 11 Nov 2019 15:20:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB4C5F80275
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 15:20:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB4C5F80275
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="Fo+M9VS9"
Received: from [46.226.52.98] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-a.eu-west-1.aws.symcld.net id D8/D0-18233-C1E69CD5;
 Mon, 11 Nov 2019 14:20:12 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSfVBUZRTGeffevVyMxZdlgdO2NLpCTcgurDT
 OBXVypmz2jzRm+tCciC5wZXdYFtq7KNBkaOAHX24ZaQRJBgyipIM2CqkTyGeCDt/ItCCf5Rqk
 i9mkQO3dC1b//c55nvecZ945NCGfoJQ0l2HlLGbWpKZWkIZwOkqjNHfERiyWeDN93U0Spnhsk
 mLO3yiQMg/7DkmY3oZSijnccETK2O9uY879WYs20/pzc/sp/SV7BdLXl9g99XU1hyn91ZkqSn
 /2Qj+pn6t7NsZzp9Rojk/NeF9qmJ9dn3ZrTUZvzhfSbFQQlIdW0AhXEtDdMCQVi1YSekbKJWJ
 xHsHjwr8ooSBxOwFzUxNIKOS4WAJTjnJKLMYQlF0rJPKQF01hBo6233YLCnwBQbXzlHsYge8j
 aP75hlRw+eGXwXHGIRFYgV+BQ+M3Xa9pF6+DMeGxl2tfCDicpzwFlmEW+kc73QvkeC9k5w+62
 QtvgdzcfW4/wkHwYN9pd5/AgTA8ecI9HjCGiss3CZH94c7EolT0c9CxfwiJ/TDoGpxcYjV8Xd
 a8xEHQcyJ/ibfC3O9F0mX/uL1yqc9ARX4uKcQHHAyLTZliOw2GZqZJkZ+DfmfLEqugvvhv95c
 Adkgh/9tR0obCS/4TW+QwKP/BSYm8Fqq+uUuUuL/CFzq+nCTLEVmDmHiLMclgTWGNJo0uIkKj
 063T6KIiNTomUstmaVgtl67Zw/FWjU7L7uG1fGZKgilRa+asdch1b4lpjRcvocY/ZrRN6Glao
 vaXLZxtj5X7xKcmZhpY3hBnSTdxfBNS0bQaZBtTOmLlvhYuicvYZTS5rnZZBtpbrZCFCrKMT2
 NTeGOSKP2ENLTtTtlJQk6aU82cMlBWY3KZsGAypJufjFi+/R4UpPSTIQ8PD7l3GmdJMVr/rzt
 QII3UfrK3hCneRrP1ySaHK4TEFeLHrlYhhJX9V1JmS7Kqc/yq72/pPLIY+JISj89v6kqq7euN
 flE9PVPbffKZx9/h4arMuDqfkrbPd74aUpgsiVF/8Hz3rMLzYXRccH2nyn4v0Pbx6tqg+ISWA
 vzmVIjGvvIKO5A5+8unG459Zo3fnSPhw18LWFCdweT1eyMvJCc8Ghv98PvgtpCeqwF8/frgSH
 uk3Nm46vID/XBW9cKqto8qi8Iu2pS1B2JYVbRqPnlhcMPeNz45/lupImOg+Nrcu8c2Nq30297
 8zkjd1iu3fTc7lQfU0+/ZvtLtgO4W/1bH0dctx7NHQtceVNxy7Crw8d2R/dTApt1Zj6rzOOr6
 2/CrLOp0ADFsXxPHH2wo3T5W1K8meQOrCyUsPPsPBud7PnYEAAA=
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-6.tower-262.messagelabs.com!1573482009!1029916!1
X-Originating-IP: [104.47.8.57]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20721 invoked from network); 11 Nov 2019 14:20:10 -0000
Received: from mail-am5eur03lp2057.outbound.protection.outlook.com (HELO
 EUR03-AM5-obe.outbound.protection.outlook.com) (104.47.8.57)
 by server-6.tower-262.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Nov 2019 14:20:10 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PNR+2HLqZr79zCHIdAI2IEBqF1EsuIp4MVsqwnGRktvpkPi3/buX5XPXXfM9vbP17h49A3Fr4zCBp1qk8bPvVHzM27LCgpwUbIxHqECsfSx0uoB8DWObLF4/BsTT+QOSiW3EZ5KGQjL6QwJdILPGBprGth/QuC2oHl6pAAnnYvF8wAry6iz+KVl+N6AcBlfZaC0mAbEsQ1I5GTo/IybFUe2RUUKcv54NstTkQkjN3jb+kkgZ+iebCpck7qjLulAgpePfhzIcG90wiW0dJASzJT/kHtDtBB5uSAXbauKaMtzMLh+A6bHLWdr1acJTXVqiwW7yq7J4qx7Md/p9PkAY4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0jc9RCf24plIFbcP3TR4KsIrVtKIiBbqnzdqbGz2sE=;
 b=QRR+vHQ5H3/0gckYox6D6LUCG8JVqolOkiYOAiOvFTWpkR8/5xVhdo28IQakdq+Cyv9kshY/0THBdfqqG053BNIcWt9wl1YrfIBu7ZA3+B8jbMoMMnypFGSKZQHh3LSJyj2D6GPMhKK4GW6yv8tqP8k0pFHeQRf0oucp63kle3OFA9GbaNSA2kbymt3cpIwNdG1VaIPNDlYC+KxFZ/ruy4iuBF/UYnnOAtoqKY7VrDcrwEgYeTsTS+UT0x1TCF1qvI6Zr+3sLL3cAG4BVoc0AqFGli1MR6GQp3OBPi3pHvHhZW/CQtoZGG3rdbOcW/3dGaOc5uYUbj89ih1pgL3IUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0jc9RCf24plIFbcP3TR4KsIrVtKIiBbqnzdqbGz2sE=;
 b=Fo+M9VS9EwhonnSS2WX//Pw+npqf30kL8m4B8u77cfbO1EtjMfjQtA5XOvmsC4MzCk/UNgod8WQYOxF37/pqsxhrUMbhrKC1eGn9Rh5ylZk25HNUKMiOjdV5V/mO/lJwKWDhaMpvKeoOYWNtOHO/TLI+pkRetWyQmUB9zd4JI0w=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1204.EURPRD10.PROD.OUTLOOK.COM (10.169.154.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.25; Mon, 11 Nov 2019 14:20:07 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df%7]) with mapi id 15.20.2430.027; Mon, 11 Nov 2019
 14:20:07 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>, Support Opensource
 <Support.Opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>
Thread-Topic: [PATCHv1 5/5] ASoC: da7213: add default clock handling
Thread-Index: AQHVllzQw2CNfaAmcE6K1Kk6A2rmoqeGBqQQ
Date: Mon, 11 Nov 2019 14:20:07 +0000
Message-ID: <AM5PR1001MB099473C446536341366A70A680740@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191108174843.11227-1-sebastian.reichel@collabora.com>
 <20191108174843.11227-6-sebastian.reichel@collabora.com>
In-Reply-To: <20191108174843.11227-6-sebastian.reichel@collabora.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b494a57-76f0-4c0c-eab2-08d766b240ba
x-ms-traffictypediagnostic: AM5PR1001MB1204:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB12040456E3013F92304C6126A7740@AM5PR1001MB1204.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0218A015FA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(396003)(376002)(366004)(39850400004)(199004)(189003)(9686003)(74316002)(305945005)(7736002)(26005)(6246003)(478600001)(486006)(66066001)(81166006)(81156014)(476003)(55016002)(14454004)(8676002)(4326008)(8936002)(25786009)(55236004)(52536014)(86362001)(76116006)(66446008)(64756008)(446003)(66556008)(66476007)(6436002)(3846002)(6116002)(11346002)(256004)(14444005)(66946007)(186003)(110136005)(71200400001)(71190400001)(5660300002)(229853002)(2906002)(6506007)(316002)(99286004)(102836004)(53546011)(33656002)(54906003)(76176011)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR1001MB1204;
 H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7WvMjzs55njJbwXofFR17TQ+svYHwtP1kDn4kJeu42pzjJ/ZYZu+YX0IyMxvH5wkPv06ZAa1V+eoJZ6gy1poIUUxi+gIK+AS5Dgc70FNPSUIRda6/OrGzGv0k6Xp48Av3Y2OZBDxQggYr1PRVVLjqHS4wZCFzPWq0fyLe643GRcRwgr2C9AtqZLfSbN/zT3n4gpQAjBUGtcE22g8wNOWx7TkRA9NZPY7tPPFLtol+heRk6mNfqbYf/zR6+m/e6t/JDulONHtvDSQ5L289umpVBh+3Wyz4r7Mbt42uZtBq2ATXSXmPuM+IkowEO/ywOATUk3zVZ+f618614mT1MuXldJNHIIO+hX/ukyYv6aTOPHaPTsSyT7TiARNpfNkveJ8I6pGMZF6VOrumJvG0pyiIJNAHzPGlc9JoeaIp/0XMru/WQ0KaRP7F+kykgIyCbE7
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b494a57-76f0-4c0c-eab2-08d766b240ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2019 14:20:07.0458 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wrGkDJDjKx5xOcTRmrbhawkKrP+bXXGbFHzjBfOhvFUTmJkQP7+/Txyi4F+/a4xWk5vZhNnT1VVAFiJhniugfNew9JdDHAxAObFVxI7SN6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1204
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kernel@collabora.com" <kernel@collabora.com>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCHv1 5/5] ASoC: da7213: add default clock
	handling
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

On 08 November 2019 17:49, Sebastian Reichel wrote:

> This adds default clock/PLL configuration to the driver
> for usage with generic drivers like simple-card for usage
> with a fixed rate clock.
> 
> Upstreaming this requires a good way to disable the automatic
> clock handling for systems doing it manually to avoid breaking
> existing setups.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  sound/soc/codecs/da7213.c | 34 +++++++++++++++++++++++++++++++++-
>  sound/soc/codecs/da7213.h |  1 +
>  2 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
> index 197609691525..a4ed382ddfc7 100644
> --- a/sound/soc/codecs/da7213.c
> +++ b/sound/soc/codecs/da7213.c
> @@ -1163,6 +1163,8 @@ static int da7213_hw_params(struct
> snd_pcm_substream *substream,
>  			    struct snd_soc_dai *dai)
>  {
>  	struct snd_soc_component *component = dai->component;
> +	struct da7213_priv *da7213 =
> snd_soc_component_get_drvdata(component);
> +	int freq = 0;
>  	u8 dai_ctrl = 0;
>  	u8 fs;
> 
> @@ -1188,38 +1190,54 @@ static int da7213_hw_params(struct
> snd_pcm_substream *substream,
>  	switch (params_rate(params)) {
>  	case 8000:
>  		fs = DA7213_SR_8000;
> +		freq = DA7213_PLL_FREQ_OUT_98304000;
>  		break;
>  	case 11025:
>  		fs = DA7213_SR_11025;
> +		freq = DA7213_PLL_FREQ_OUT_90316800;
>  		break;
>  	case 12000:
>  		fs = DA7213_SR_12000;
> +		freq = DA7213_PLL_FREQ_OUT_98304000;
>  		break;
>  	case 16000:
>  		fs = DA7213_SR_16000;
> +		freq = DA7213_PLL_FREQ_OUT_98304000;
>  		break;
>  	case 22050:
>  		fs = DA7213_SR_22050;
> +		freq = DA7213_PLL_FREQ_OUT_90316800;
>  		break;
>  	case 32000:
>  		fs = DA7213_SR_32000;
> +		freq = DA7213_PLL_FREQ_OUT_98304000;
>  		break;
>  	case 44100:
>  		fs = DA7213_SR_44100;
> +		freq = DA7213_PLL_FREQ_OUT_90316800;
>  		break;
>  	case 48000:
>  		fs = DA7213_SR_48000;
> +		freq = DA7213_PLL_FREQ_OUT_98304000;
>  		break;
>  	case 88200:
>  		fs = DA7213_SR_88200;
> +		freq = DA7213_PLL_FREQ_OUT_90316800;
>  		break;
>  	case 96000:
>  		fs = DA7213_SR_96000;
> +		freq = DA7213_PLL_FREQ_OUT_98304000;
>  		break;
>  	default:
>  		return -EINVAL;
>  	}
> 
> +	/* setup PLL */
> +	if (da7213->fixed_clk_auto) {
> +		snd_soc_component_set_pll(component, 0,
> DA7213_SYSCLK_PLL,
> +					  da7213->mclk_rate, freq);
> +	}
> +

Are we happy with the PLL being always enabled? Seems like a power drain,
especially if you're using an MCLK which is a natural harmonic for the SR in 
question in which case the PLL can be bypassed. Also the bias level function in
this driver will enable and disable the MCLK, if it has been provided, so it's a
bit strange to have the PLL enabled but it's clock source taken away.

>  	snd_soc_component_update_bits(component, DA7213_DAI_CTRL,
> DA7213_DAI_WORD_LENGTH_MASK,
>  			    dai_ctrl);
>  	snd_soc_component_write(component, DA7213_SR, fs);
> @@ -1700,10 +1718,10 @@ static struct da7213_platform_data
>  	return pdata;
>  }
> 
> -
>  static int da7213_probe(struct snd_soc_component *component)
>  {
>  	struct da7213_priv *da7213 =
> snd_soc_component_get_drvdata(component);
> +	int ret;
> 
>  	pm_runtime_get_sync(component->dev);
> 
> @@ -1836,6 +1854,20 @@ static int da7213_probe(struct snd_soc_component
> *component)
>  			return PTR_ERR(da7213->mclk);
>  		else
>  			da7213->mclk = NULL;
> +	} else {
> +		/* Store clock rate for fixed clocks for automatic PLL setup */
> +		ret = clk_prepare_enable(da7213->mclk);
> +		if (ret) {
> +			dev_err(component->dev, "Failed to enable mclk\n");
> +			return ret;
> +		}

I've not gone through the clk framework code but surprised to see the need to
enable a clock to retrieve it's rate.

> +
> +		da7213->mclk_rate = clk_get_rate(da7213->mclk);
> +
> +		clk_disable_unprepare(da7213->mclk);
> +
> +		/* assume fixed clock until set_sysclk() is being called */
> +		da7213->fixed_clk_auto = true;

I don't see any code where 'fixed_clk_auto' is set to false so it seems that
previous operational usage is being broken here.

>  	}
> 
>  	return 0;
> diff --git a/sound/soc/codecs/da7213.h b/sound/soc/codecs/da7213.h
> index 97a250ea39e6..00aca0126cdb 100644
> --- a/sound/soc/codecs/da7213.h
> +++ b/sound/soc/codecs/da7213.h
> @@ -532,6 +532,7 @@ struct da7213_priv {
>  	bool master;
>  	bool alc_calib_auto;
>  	bool alc_en;
> +	bool fixed_clk_auto;
>  	struct da7213_platform_data *pdata;
>  };
> 
> --
> 2.24.0.rc1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
