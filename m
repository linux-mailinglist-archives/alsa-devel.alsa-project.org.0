Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2801510A331
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Nov 2019 18:12:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B24EA176F;
	Tue, 26 Nov 2019 18:11:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B24EA176F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574788325;
	bh=XyOK12+p4RPpQTg2g52wDTiTVXlnJAE48VV93JieA00=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AiyFgIVIDq226W9Bk88C+eSDt3sqhCxbRIzlWJnPJ9+6Cmk0sCbtgyY4vUNObbHvw
	 8/pOdKGRJ/y7z/z6cRbRBeELgpeaI1tOBY7E9PeKAda6C3o8w4iDR4N2H0CXIdWJm5
	 J2unWtBOBStbgu64Q/HLThUb/fKPIu1VJEwZTZ8g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCEA8F801F2;
	Tue, 26 Nov 2019 18:10:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5975AF80109; Tue, 26 Nov 2019 18:10:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E22AF80109
 for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2019 18:10:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E22AF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="qRilvSiF"
Received: from [85.158.142.108] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 4D/5E-12040-88C5DDD5;
 Tue, 26 Nov 2019 17:10:32 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSbVBUZRTH97lve2FYvbwIJ4Zlpk1sMnYBlbw
 4fsCZGtc0hGZyLFzjAjd2J1iW3csE1gfenEQgqLQCNYgAJ0FwoEled4AxhiUEQ4gwd5LYGXlx
 nVFeTDHq3r1g9e13zv//nPOfZw6N+/1BBdN8jsBbzVy6hvImjBGKGO2pY05D5PUWnB3/uR9jz
 067KLZtpJRkV8ZPYezNzvMUW9xZTrLOhTj2yqPLKJbWX1ksoPTtzjqk76hyKvWtl4opvd3dQO
 lbvp8g9IutofHKd0iTOTkzJ4k0fvvLMGWp2pzTV/EZykNun9PIm0ZMPQ55pXWEXAwQ8Pf5WaV
 ctCFYLXtMSQXBDOJgz5/ApMKPOYtBx5JbtHmJxTSChtMHJKYYFj4fvON5EcDMIZho/4qUCpx5
 gODa7RFScvkzr0KZ4wkucQDzGhTWlYvbaZF3wOMRXmoTTBg0fdnjWaBiOJhasmPyso/g/nIDJ
 bGXOOZmbR8hMWLUsJTf6BmJM0Fwy1Xt8QPDQF33KC7zFpibWSNlPw+Ogl+R3A+H65OuddbA1x
 eurbMaxqpL1vkNmC3pJjb8RcU96zNZqCs56YkPzFZY68+V2xYo/unueoRt0FX0l1LmEJjvG/V
 8IjA3SHh6ow1VoIiq/8SWORxquh5SMr8MDd8s4FWer/AFR6WLqEHEJbQ72WpKMwoZnCldGxUZ
 qY2K2qmN1O7WcSe0nI7P1qbwZsHKiZqO+8Cms+VmpKSn6sy80IrEc0vNUijb0ckVt64fPUdjm
 i2qBKXT4LcpOTM118jZjO9as9N5Wz8KoWkNqIREUfO18ml8znumdPFoN2SgfTQBKrskq2wWLs
 NmSpOlIaSlK+Yu1OJ+hDnTzAcHqeIlEyOZjNnmZyM2Tn8MqYP9VUihUPj5WHhrhkn4vz6Pgmi
 k8VfVSFN8TGbh2aZ5MQQmhsAqb0khBO5fKTgPC/OdqX+b+vDi7R3LLw28HrsSqCfxFxLCGyOb
 db0Hm86tDP+5v79jvLwlayB16JNuy4mo7t7w3+8mRx/3f6tyQHU4xnHgcFN9cHNMUeF2NuCLs
 dWHvx1dvnzsXGiA44f5Ta/UfhzY6d43rdj1aNe2xOb3QxaefJo5swzqe/tnCwJ9V0MTHGG5bC
 X2fKLtaSFT2dq1MyI/L2TPd5Y3D2VFJCzCjwZyprercCilWYi33cGcU5stS0l7adOe2UFDclz
 4aCfix6pd7qPxk1u9xlYOmV+cTsraC8qFooFG0ntYQEVHynpcuqnZB3HRR86klF+8qo4+XjoZ
 a796T73v/trUGUFj0BA2Ixe1HbfauH8AicwKsnUEAAA=
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-3.tower-233.messagelabs.com!1574788231!1222!1
X-Originating-IP: [104.47.0.57]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11330 invoked from network); 26 Nov 2019 17:10:31 -0000
Received: from mail-he1eur01lp2057.outbound.protection.outlook.com (HELO
 EUR01-HE1-obe.outbound.protection.outlook.com) (104.47.0.57)
 by server-3.tower-233.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Nov 2019 17:10:31 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BhBVzMS4rVq7olBxmvxRbLRyPL8XESvotmYzMg9OX5YE37jENiQtpwOEhANt1yc+SeNQRve/mv+9Jtu73b8M5vfU6tP7VpmUHzIZ0GRlq5ZemKuu+c+q6vWQg2049Y5/plyKYleHLhR0beByjRECAmOkqZ1b6Z42HAhFzFVq/cF/thDMcMF615xIf4tmFBMZ91g3nKoXaLzljkLmyL3wYMsHuFpnOQdWNveiA4K2U3Xik1zjTeFOWBgQICOGvPLA/R7HABKI3UnupQHK9l16qP4E+9CaHZ4Uzt0Adskg9kld82C/wlrHcLWV2l2KT9Oh8KB35g+f6LvBq1qcOg7v+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWhqvSXZ+iWGe0CIjXJsHht1wOF7J9VBp4swlIYbCMQ=;
 b=GSmFbUKxkEJjavzOGuLacMdE14OtaGbVLuu7IeHkTim/UTBm4dSBU4RKB8FDPgWnAMdg5dLiqrXeD5Mbb3dFzbvuXwSSWbGOKO9gBVZQgcc/4wyuB/FeV05KF5NPSNWhm8o8Ci2eBBMqbsjWt2XvZTy5/ytLvRxCyNX9FGWpXLfUq/WPeeoqZjeKNWM8PnhmJfyIBWv1USO2VENfir83wG7ues0eMtSLC8MaYX5sWhuOMZPILzMJt2gDsYJSN0zLvRIuyoUO9X8VR/NoMNlQ6UrgJn4MThqfTx5v9Z040B7yb0q1oLNPURLelp8kRIMhVzjyWdWn27+C0lY3cBu4ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWhqvSXZ+iWGe0CIjXJsHht1wOF7J9VBp4swlIYbCMQ=;
 b=qRilvSiFBdvez9fDat/CDV1G1LWp2kFRGslLq8oddqrdlchgbizcPg7R8eE5O+XP9We+Z8eGPsw+j3ZnUUzTTuUNGQKcVSyquvvlfWC3ym1M6Vq5zaRxtBxNRdlqwMdD3RrDJAhfUXz53lyglWVXX38pI/weuy/Wov1jCSNOsLs=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1041.EURPRD10.PROD.OUTLOOK.COM (10.169.155.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Tue, 26 Nov 2019 17:10:30 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df%7]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 17:10:30 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>, Adam Thomson
 <Adam.Thomson.Opensource@diasemi.com>, Support Opensource
 <Support.Opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>
Thread-Topic: [PATCHv2 5/6] ASoC: da7213: Move set_pll to codec level
Thread-Index: AQHVn7aZYunDUNduG0GLgu04GIRlm6eduQdg
Date: Tue, 26 Nov 2019 17:10:30 +0000
Message-ID: <AM5PR1001MB0994314E2EBEDBCB99220C3B80450@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191120152406.2744-1-sebastian.reichel@collabora.com>
 <20191120152406.2744-6-sebastian.reichel@collabora.com>
In-Reply-To: <20191120152406.2744-6-sebastian.reichel@collabora.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 435677f8-f499-4b80-842d-08d772938ab1
x-ms-traffictypediagnostic: AM5PR1001MB1041:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB10414E03DA5C6C15A057B4DCA7450@AM5PR1001MB1041.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
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
x-microsoft-antispam-message-info: jDKXn7O0KbpkkaOlEfTewvhsjy2hUdVMSh3l/ObKKm55lSmouq/kjB7+xgJJ2lO2108dlU5doWL2A+Vtaiip/XjdHGAmUnVByFVANKR/+P7m7tJLisPYZ86kvosRpaZ63mBEAaASTk5MTmBH93riHVuQ4eWT73jhNsjuyYeb8Tk+5Wme8fan91ubQE81AsEva91sXcjMWdzJjEIGsck1FGBJAREnxXPn1NNHaXkqTB3nctNRjBfltITvFdR30XV/jBVUa4NUxAPXyjlhOk3nNmdlzhJdT5TOfmn+wajrheK6hSnI9goVEbjYxwNLbjfbl8GAam7OQioZ36+p/YSIEsia76ayRuZCuoV0tBlULIAuQsYlawDAb22gfaj+dbHYW/EmicPdrjHMg2wjcfex8uuKINA09NQzvlv2ubASr3CkwBCXulkh5zOQnpyiZmgJ
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 435677f8-f499-4b80-842d-08d772938ab1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2019 17:10:30.6973 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qttv2Es493cGrSzewiXkL/O0+kwUfymWUkCK9Ty9ui8+v43J4szbhTYAG1GUIBjPtD5ASRfMp0q9NGsW0wteirw8NKudxwM762iboMSoHQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1041
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kernel@collabora.com" <kernel@collabora.com>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCHv2 5/6] ASoC: da7213: Move set_pll to codec
	level
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

> Move set_pll function to component level, so that it can be used at
> both component and DAI level.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

> ---
>  sound/soc/codecs/da7213.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
> index 9686948b16ea..3e6ad996741b 100644
> --- a/sound/soc/codecs/da7213.c
> +++ b/sound/soc/codecs/da7213.c
> @@ -1392,10 +1392,10 @@ static int da7213_set_component_sysclk(struct
> snd_soc_component *component,
>  }
> 
>  /* Supported PLL input frequencies are 32KHz, 5MHz - 54MHz. */
> -static int da7213_set_dai_pll(struct snd_soc_dai *codec_dai, int pll_id,
> -			      int source, unsigned int fref, unsigned int fout)
> +static int da7213_set_component_pll(struct snd_soc_component *component,
> +				    int pll_id, int source,
> +				    unsigned int fref, unsigned int fout)
>  {
> -	struct snd_soc_component *component = codec_dai->component;
>  	struct da7213_priv *da7213 =
> snd_soc_component_get_drvdata(component);
> 
>  	u8 pll_ctrl, indiv_bits, indiv;
> @@ -1507,7 +1507,6 @@ static int da7213_set_dai_pll(struct snd_soc_dai
> *codec_dai, int pll_id,
>  static const struct snd_soc_dai_ops da7213_dai_ops = {
>  	.hw_params	= da7213_hw_params,
>  	.set_fmt	= da7213_set_dai_fmt,
> -	.set_pll	= da7213_set_dai_pll,
>  	.digital_mute	= da7213_mute,
>  };
> 
> @@ -1845,6 +1844,7 @@ static const struct snd_soc_component_driver
> soc_component_dev_da7213 = {
>  	.dapm_routes		= da7213_audio_map,
>  	.num_dapm_routes	= ARRAY_SIZE(da7213_audio_map),
>  	.set_sysclk		= da7213_set_component_sysclk,
> +	.set_pll		= da7213_set_component_pll,
>  	.idle_bias_on		= 1,
>  	.use_pmdown_time	= 1,
>  	.endianness		= 1,
> --
> 2.24.0
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
