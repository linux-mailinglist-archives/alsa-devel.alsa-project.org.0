Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BD2105C59
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Nov 2019 22:53:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BAC717C6;
	Thu, 21 Nov 2019 22:52:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BAC717C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574373214;
	bh=NRipTnziM9fgeO2DbXqSSP/MLAAn8PWzTwuibVp/ueA=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ddOrTZBHPCRe6iOuAmA4TvwdOlV2GInJdDgKI92qHhBI5yoQiRjkn2kvtfo2tKg7i
	 F9W3IT448Hd0tExZFfYct3gI1Yp/g9Lvdq8hLa8MejYr5VZDTI68HnVl/dMwr7DmY/
	 HYr4Mv3NPi3Aq/HfRu/LkWQNP7oCQ/uKtLbZdSOI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75F3CF8014C;
	Thu, 21 Nov 2019 22:51:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84E6FF80146; Thu, 21 Nov 2019 22:51:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8BD3F800C1
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 22:51:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8BD3F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="1L5EhlgD"
Received: from [85.158.142.201] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 42/DA-16077-EE607DD5;
 Thu, 21 Nov 2019 21:51:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WTf0wTZxjHee+u1xNad7RV3hFKYuem22ilK9l
 uOKbJCDQuEv9wmzMiO+SgTcrB2rIVMxHKNvkpRWiGFQEdZUbCJpTODjcTSzdxCyiIgoRu4pqF
 H2EOMA7iRnbXE7f99/k+3+/7PE/evC+ByqbxWIKxWRkzS5tUeCRm2IYnq4fwsczEwJ1N1OiwH
 6GcUyGc8gzViKiHoxUIdbOvGacq++pEVHAug7rwZxfYSegvLNlxvS/YDvTfuIJifc/5Slx/eb
 4D13/VewvTL/XE7xHvFxnZ7ALbeyLD8dX1hfUv28rcdaJSYE+oApEEIN0oLDtZIxLEDxgcfXQ
 VFYQHwEe1KzgvMHIAhaHaZYwXMtKJwMDAsLgKrOPEFICX21iecZKCDQN3wycU5AyAt3xN4cYo
 uQBgYHJIxKfk5BvwVN2nKM8KMhX6PXZc4Jegt/whwjNGPgvnB1sBz1KShnWVS4gw7SPY3dSC8
 byOO7vsvR7uA0glfFDWGWaUjIETodZwHpIkbP9WyEByA5z5dVUk5Bl4zT4OhHoCHBwLPeZNcK
 L75uO8Eo60VnN1guPd0NlCrMVr+oOYwBRsr/4EEyKb4aq/WCgXwsHvjuECPwfv13tFAsfBsal
 A+H4geUcEW75/ABxgm+s/WwucANsuLeICvwg7zsyhrvBNRMNrJ0NYG8DOAyrbbMwzWPNpo0mt
 TUxUa7U69SvqV5M09GF1toYpUh9iWKuZ5kwN/aFFYynOP2TK0bCMtQdwzy3nffFBH6hdnNf4w
 dMEotogdT5zO1O2Prsgp9hAWwxZ5iITY/GDOIJQQWnfEc6LNjN5jC3XaOIe7ZoNCYlKIf2Ft6
 WWQjrfYswTrB+BjnDMnD6LEp7T7rOoDGMLWCY2Rmor4aIkHzUUsU8arX2AEaCMlUtBRESETFL
 ImPON1v/7syCGACq51M13kRhZ65N5s9wqCLdKd9cIv4qV/teKLUVSpd521ZkbSHqwcUvJFaZ5
 rqdzosqjdy1N4m8XtC90jC6QM1f7o8pgykp25fjesR3RyuFJRQnSdT3gu53sST+Qdvz1v1yl5
 /Yf/Hmiqijp79A7zlRH/VtPtcVcbCzLbaObA3J1729N93bcXdiavJGVH7N7cxu+3vdHEtL5fK
 s/vvdAjMqj3T7tK996IuPwa3s/V4x/KUtqzNF7M1e2fKDsLc6qWBnRL19JT2jWmW26S9v74qS
 97i5Vv+dIxdHuxfKUrF3Dn+FpQ+9mOCDCNk9vPHdRfKpTviR5s6P+/mzKrqN7HB9/keySVOc0
 LAY08QU9aerfd0ZZdD/VDt1riLyxL0qFWQy09gXUbKH/AfdfdKh7BAAA
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-25.tower-246.messagelabs.com!1574372953!80932!1
X-Originating-IP: [104.47.6.58]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5399 invoked from network); 21 Nov 2019 21:50:09 -0000
Received: from mail-ve1eur02lp2058.outbound.protection.outlook.com (HELO
 EUR02-VE1-obe.outbound.protection.outlook.com) (104.47.6.58)
 by server-25.tower-246.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Nov 2019 21:50:09 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oT9oj2NaFaPok9RdT5e9necOytTYuiUJE5jhg3TWu6Mb4s3M/zTjKtoMDqZeDXvRTo15PWZaKfPvqeyLhDmgUau/DtoEyhlCNp+qBQXQERnsoM9L5FotHic+wDY+0nHABbzGoktBibEtZzWs3exqaZj0+qyzZDYbU8hE0mzowNs8j01h6lX0aSWSt+cT02PO5qlMWc0L7+UutC7K8+2Jb7lT/kSUqnd/h2ox8ClQG6CecpL/x6eU5bBrZE8Cg+kywBn41vcHelOn2uZBS1Xwfjp9UsgzGyBsyL1OqzGXrZ0RA0t4V3q4XnDelNTBiK84ttidqiE9I8wHWOeGiEafsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOfwAa4ed9hUKHX3JUUWkjn1sVpHwY1krBpg0gsu/YE=;
 b=ce3dSpUyqz3y3z9zBipId/NyI9bi+0sce9oPsOlJoslk5vv5gA2Gjp61a1h/IYYcPxaRifOYcRJqlxqSq7Eh/TSy1FJjFi1Pwt66i0EMlJ6TNWFYf2UYeSM+ygFvU1B9YCu+g9kkYFarTOQ+OKg0mYMRP3XHpNDu/FO0aszKRTBjVf+zUryVegcOuZSf17NzaUieypsAaIzI7uvjHDiI6xfqVrn6n7P9UG/GkJoKsp40AMaL0fi1fd3E8rz6UlOZbNbZLMUhZOtdS7ixtOCbKx5MLqObtLLNXU6JMPXKDALka34NvLuv7Z/ENLlWgEEg1FfOLcBiZw3B8+jTEvD43w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOfwAa4ed9hUKHX3JUUWkjn1sVpHwY1krBpg0gsu/YE=;
 b=1L5EhlgDj6HAIaC5LbRQQxDa/XyDlj4bprtgN6Z+nFVtI3ds0ZuyAsd2CEc3Knad2IFYB0lrzkeEAoe4eHwdoT2GiQoiS0jrcdbFu9C/TxWTp3/6PDEKkhGN+K4wb4f/UL3X3NNdaEL2UFipcqBAkuy8L+b/FI02rHeWpR9W3uU=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1075.EURPRD10.PROD.OUTLOOK.COM (10.169.154.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.21; Thu, 21 Nov 2019 21:49:12 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df%7]) with mapi id 15.20.2474.021; Thu, 21 Nov 2019
 21:49:12 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>, Adam Thomson
 <Adam.Thomson.Opensource@diasemi.com>, Support Opensource
 <Support.Opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>
Thread-Topic: [PATCHv2 6/6] ASoC: da7213: Add default clock handling
Thread-Index: AQHVn7aXMyQuMXvm70+jyJLut64noaeWIihw
Date: Thu, 21 Nov 2019 21:49:12 +0000
Message-ID: <AM5PR1001MB0994720A0D615339A978E35C804E0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191120152406.2744-1-sebastian.reichel@collabora.com>
 <20191120152406.2744-7-sebastian.reichel@collabora.com>
In-Reply-To: <20191120152406.2744-7-sebastian.reichel@collabora.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.69]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f244e30b-ae78-4870-2d85-08d76ecca594
x-ms-traffictypediagnostic: AM5PR1001MB1075:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB1075FE6333CB595BA72DE154A74E0@AM5PR1001MB1075.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0228DDDDD7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(189003)(199004)(9686003)(7696005)(76176011)(6246003)(33656002)(64756008)(99286004)(8936002)(66446008)(4326008)(66556008)(66946007)(86362001)(66476007)(66066001)(81166006)(81156014)(8676002)(25786009)(6506007)(55016002)(53546011)(55236004)(6436002)(76116006)(5660300002)(11346002)(446003)(478600001)(74316002)(52536014)(2906002)(229853002)(316002)(14454004)(54906003)(102836004)(110136005)(6116002)(71200400001)(71190400001)(3846002)(305945005)(7736002)(186003)(26005)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR1001MB1075;
 H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dOpIsRblgCBtKZ4FQIIZpKhg7GYBDqvK2E+0prbqg2XwXxBuubdw0b+CezL/VEiXqr+v1PcQTnuiJIqFNezIz6xuInshZF8ohNn8kZz51CnzrGrkBc9/sscYE4cCjTsn5mhxI28en5YXVxmiB9cL0xFVNr/bWjwVoBb2WxInTjiNdV3086vA70DrJ7TFy5SBQIl0d0ocC8Au0EPpqlueo8NEUuuDiRCAPZluLLA7G6frGe0K+uZCUXVD0aAgqxdBNGHz+aLXg0Ewkuy00CCsEojN4Fq2R2NrgJ2uGrMtEK3QK9bnlgTfHnc8hxoLLJ9dNGbwUxcV0upD+k+KEbXvuKBhw2gqzFv17qhFTZ0ep7roFKyiVwj8fSgWd28DBVk7juKCHtn+z5/RM9OHXPPjXnxUoPnDSnc01IgmyODc29whvFq2gkL67dhuAWmJzg2+
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f244e30b-ae78-4870-2d85-08d76ecca594
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2019 21:49:12.5310 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OwMElrN8Fez8EJKMlVMsk3dS4a/jIJE73j76s84S4alYEVk1/VlUBewLJWl7TTb/82VUyvHheF6lNwIF0SgiEQyf8ohBoUsz7zsUO1+urPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1075
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kernel@collabora.com" <kernel@collabora.com>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCHv2 6/6] ASoC: da7213: Add default clock
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

On 20 November 2019 15:24, Sebastian Reichel wrote:

> This adds default clock/PLL configuration to the driver
> for usage with generic drivers like simple-card for usage
> with a fixed rate clock.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  sound/soc/codecs/da7213.c | 75
> ++++++++++++++++++++++++++++++++++++---
>  sound/soc/codecs/da7213.h |  2 ++
>  2 files changed, 73 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
> index 3e6ad996741b..ff1a936240be 100644
> --- a/sound/soc/codecs/da7213.c
> +++ b/sound/soc/codecs/da7213.c
> @@ -1156,6 +1156,7 @@ static int da7213_hw_params(struct
> snd_pcm_substream *substream,
>  			    struct snd_soc_dai *dai)
>  {
>  	struct snd_soc_component *component = dai->component;
> +	struct da7213_priv *da7213 =
> snd_soc_component_get_drvdata(component);
>  	u8 dai_ctrl = 0;
>  	u8 fs;
> 
> @@ -1181,33 +1182,43 @@ static int da7213_hw_params(struct
> snd_pcm_substream *substream,
>  	switch (params_rate(params)) {
>  	case 8000:
>  		fs = DA7213_SR_8000;
> +		da7213->out_rate = DA7213_PLL_FREQ_OUT_98304000;
>  		break;
>  	case 11025:
>  		fs = DA7213_SR_11025;
> +		da7213->out_rate = DA7213_PLL_FREQ_OUT_90316800;
>  		break;
>  	case 12000:
>  		fs = DA7213_SR_12000;
> +		da7213->out_rate = DA7213_PLL_FREQ_OUT_98304000;
>  		break;
>  	case 16000:
>  		fs = DA7213_SR_16000;
> +		da7213->out_rate = DA7213_PLL_FREQ_OUT_98304000;
>  		break;
>  	case 22050:
>  		fs = DA7213_SR_22050;
> +		da7213->out_rate = DA7213_PLL_FREQ_OUT_90316800;
>  		break;
>  	case 32000:
>  		fs = DA7213_SR_32000;
> +		da7213->out_rate = DA7213_PLL_FREQ_OUT_98304000;
>  		break;
>  	case 44100:
>  		fs = DA7213_SR_44100;
> +		da7213->out_rate = DA7213_PLL_FREQ_OUT_90316800;
>  		break;
>  	case 48000:
>  		fs = DA7213_SR_48000;
> +		da7213->out_rate = DA7213_PLL_FREQ_OUT_98304000;
>  		break;
>  	case 88200:
>  		fs = DA7213_SR_88200;
> +		da7213->out_rate = DA7213_PLL_FREQ_OUT_90316800;
>  		break;
>  	case 96000:
>  		fs = DA7213_SR_96000;
> +		da7213->out_rate = DA7213_PLL_FREQ_OUT_98304000;
>  		break;
>  	default:
>  		return -EINVAL;
> @@ -1392,9 +1403,9 @@ static int da7213_set_component_sysclk(struct
> snd_soc_component *component,
>  }
> 
>  /* Supported PLL input frequencies are 32KHz, 5MHz - 54MHz. */
> -static int da7213_set_component_pll(struct snd_soc_component *component,
> -				    int pll_id, int source,
> -				    unsigned int fref, unsigned int fout)
> +static int _da7213_set_component_pll(struct snd_soc_component
> *component,
> +				     int pll_id, int source,
> +				     unsigned int fref, unsigned int fout)
>  {
>  	struct da7213_priv *da7213 =
> snd_soc_component_get_drvdata(component);
> 
> @@ -1503,6 +1514,16 @@ static int da7213_set_component_pll(struct
> snd_soc_component *component,
>  	return 0;
>  }
> 
> +static int da7213_set_component_pll(struct snd_soc_component *component,
> +				    int pll_id, int source,
> +				    unsigned int fref, unsigned int fout)
> +{
> +	struct da7213_priv *da7213 =
> snd_soc_component_get_drvdata(component);
> +	da7213->fixed_clk_auto_pll = false;
> +
> +	return _da7213_set_component_pll(component, pll_id, source, fref,
> fout);
> +}
> +
>  /* DAI operations */
>  static const struct snd_soc_dai_ops da7213_dai_ops = {
>  	.hw_params	= da7213_hw_params,
> @@ -1532,6 +1553,43 @@ static struct snd_soc_dai_driver da7213_dai = {
>  	.symmetric_rates = 1,
>  };
> 
> +static int da7213_set_auto_pll(struct snd_soc_component *component, bool
> enable)
> +{
> +	struct da7213_priv *da7213 =
> snd_soc_component_get_drvdata(component);
> +	int mode;
> +
> +	if (!da7213->fixed_clk_auto_pll)
> +		return 0;
> +
> +	da7213->mclk_rate = clk_get_rate(da7213->mclk);
> +
> +	if (enable)
> +		mode = DA7213_SYSCLK_PLL;
> +	else
> +		mode = DA7213_SYSCLK_MCLK;

If we're the clock slave, and we're using an MCLK that's not a harmonic then
SRM is required to synchronise the PLL to the incoming WCLK signal. I assume
simple sound card should allow for both master and slave modes? If so we'll
need to do something here to determine this as well.

> +
> +	switch (da7213->out_rate) {
> +	case DA7213_PLL_FREQ_OUT_90316800:
> +		if (da7213->mclk_rate == 11289600 ||
> +		    da7213->mclk_rate == 22579200 ||
> +		    da7213->mclk_rate == 45158400)
> +			mode = DA7213_SYSCLK_MCLK;
> +		break;
> +	case DA7213_PLL_FREQ_OUT_98304000:
> +		if (da7213->mclk_rate == 12288000 ||
> +		    da7213->mclk_rate == 24576000 ||
> +		    da7213->mclk_rate == 49152000)
> +			mode = DA7213_SYSCLK_MCLK;
> +
> +		break;
> +	default:
> +		return -1;
> +	}
> +
> +	return _da7213_set_component_pll(component, 0, mode,
> +					 da7213->mclk_rate, da7213->out_rate);
> +}
> +
>  static int da7213_set_bias_level(struct snd_soc_component *component,
>  				 enum snd_soc_bias_level level)
>  {
> @@ -1551,6 +1609,8 @@ static int da7213_set_bias_level(struct
> snd_soc_component *component,
>  						"Failed to enable mclk\n");
>  					return ret;
>  				}
> +
> +				da7213_set_auto_pll(component, true);

I've thought more about this and for the scenario where a machine driver
controls the PLL through a DAPM widget associated with this codec (like some
Intel boards do), then the PLL will be configured once here and then again
when the relevant widget is called. I don't think that will matter but I will
take a further look just in case this might cause some oddities. 

>  			}
>  		}
>  		break;
> @@ -1562,8 +1622,10 @@ static int da7213_set_bias_level(struct
> snd_soc_component *component,
>  					    DA7213_VMID_EN | DA7213_BIAS_EN);
>  		} else {
>  			/* Remove MCLK */
> -			if (da7213->mclk)
> +			if (da7213->mclk) {
> +				da7213_set_auto_pll(component, false);
>  				clk_disable_unprepare(da7213->mclk);
> +			}
>  		}
>  		break;
>  	case SND_SOC_BIAS_OFF:
> @@ -1829,6 +1891,11 @@ static int da7213_probe(struct snd_soc_component
> *component)
>  			return PTR_ERR(da7213->mclk);
>  		else
>  			da7213->mclk = NULL;
> +	} else {
> +		/* Do automatic PLL handling assuming fixed clock until
> +		 * set_pll() has been called. This makes the codec usable
> +		 * with the simple-audio-card driver. */
> +		da7213->fixed_clk_auto_pll = true;
>  	}
> 
>  	return 0;
> diff --git a/sound/soc/codecs/da7213.h b/sound/soc/codecs/da7213.h
> index 3890829dfb6e..97ccf0ddd2be 100644
> --- a/sound/soc/codecs/da7213.h
> +++ b/sound/soc/codecs/da7213.h
> @@ -535,10 +535,12 @@ struct da7213_priv {
>  	struct regulator_bulk_data supplies[DA7213_NUM_SUPPLIES];
>  	struct clk *mclk;
>  	unsigned int mclk_rate;
> +	unsigned int out_rate;
>  	int clk_src;
>  	bool master;
>  	bool alc_calib_auto;
>  	bool alc_en;
> +	bool fixed_clk_auto_pll;
>  	struct da7213_platform_data *pdata;
>  };
> 
> --
> 2.24.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
