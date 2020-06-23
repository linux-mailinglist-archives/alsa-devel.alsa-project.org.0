Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CB2206EA7
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 10:08:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 939FB1883;
	Wed, 24 Jun 2020 10:07:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 939FB1883
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592986107;
	bh=zb+Ratdsse8YglfxUtBKrqucnPiUwpHogaDnqHky12I=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Td5Jve7khcqNr23FpEQkxaqspnng2dpjEZmx438jGXoZv/tdU+EeaRYxNUltw7Zma
	 aZC3vA5P3VlQj7HjiDt2Vzkm4YuWGk/t5xo0RN1Be//PIJ8IM25nxvwN4UJ9Uxfw+G
	 WfX8nbyP5pvx8Y9zj7qYl3WFROjxpxYPbQ1v1Cb8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99966F8015A;
	Wed, 24 Jun 2020 09:50:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1D32F80234; Tue, 23 Jun 2020 17:16:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10063.outbound.protection.outlook.com [40.107.1.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C0FAF800B2
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 17:16:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C0FAF800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="Tzdts/BH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZF5i6Yc+RcUvMlLOEAfn7jQjXJ7kIBVzKX/2JteNClvK1rhep7Lzr2e/gdIxcQJfGAlAscLoI05LtRPvbYSorAgx0Akjr3kUiE217dGLvoAb9hB20a9/+fVEtKNhlYF4nLshRjwPHhuqvkcNrinsDGLzDUadogK/JHvo5+7C970DPzaDz8OesFhlnv5sGD+wab3RS8qH0Z1hR8g4LPDVBBHNDiOmR/PQzF8fG48anglZ7C6hN23XGgIY4QLqG/Xq7PWhd0Td2BOL5VM8/h42SNgARxeVUlx9lGAPM784zIaaDVKyKu7bgamVwDuyZyAK/H4Rp5xjUO4nphpmZWCHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wtn40sEOkuH2HY0Cn3+LO/qrr+MKKW0z5fyyijnA75c=;
 b=jRduNpVzOy+yCQup6CXHOwtCpn/ElM3CIB+MfE8UEM/Aso3v+ovis1vadlGnayAUNOysTGqgenGDZTYgFMpngFLNCrXVvtEkHEQVb30jPGQZf+q8ankqGzaZ3hUHEH1uknbUYw3Yywlmreyhu0XyeD2CsOXzthZoYwgqaOTpZZl1Vg4vQDqjlcKZEwKJxxxGftWKZHCMqQyUToF/F2mDA9QOSRFuMtx0UpmUSDzM5fq6PspiXf1cCOEOpxoWb/9+UjGXCnoY/kj4jOpuZXW2sIZxvVWlaM2YXA0KIvFwvCxHZ7utaP8pPNC7GprOM+OJosuL1jRkUPPEnSEOR8/TCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wtn40sEOkuH2HY0Cn3+LO/qrr+MKKW0z5fyyijnA75c=;
 b=Tzdts/BH87U2/a0J5up1xohbe3bpxBiJkXdXInK+z/TCtuZBbkxwBm/xUDXr40bY4nVAy/zCDUZseouH38xumo5uKq6MhkQGM2eSTHt4P/ccCqZ8oTt3gsPndR+pWl9fQ7B+0w5C7YBqQwb1HKIEPqIvevONQvpwLus4aEaV3a0=
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:52::13)
 by AM6PR10MB3399.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:ed::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Tue, 23 Jun
 2020 15:16:39 +0000
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6d54:9ddd:f235:d379]) by AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6d54:9ddd:f235:d379%5]) with mapi id 15.20.3109.027; Tue, 23 Jun 2020
 15:16:39 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Subject: RE: [PATCH 15/19] ASoC: codecs: da*: merge .digital_mute() into
 .mute_stream()
Thread-Topic: [PATCH 15/19] ASoC: codecs: da*: merge .digital_mute() into
 .mute_stream()
Thread-Index: AQHWSPyLyhgsp3kA4kG+7417QBiOg6jmUJDg
Date: Tue, 23 Jun 2020 15:16:35 +0000
Message-ID: <AM6PR10MB226320A3D7ED6B9A573D2EB280940@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
References: <87ftam37ko.wl-kuninori.morimoto.gx@renesas.com>
 <87tuz21sso.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tuz21sso.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: renesas.com; dkim=none (message not signed)
 header.d=none;renesas.com; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [146.199.34.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8dc2d37-f1eb-49df-b1d7-08d817886dd9
x-ms-traffictypediagnostic: AM6PR10MB3399:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR10MB3399B96B7BD8F3E3EDB77FD3A7940@AM6PR10MB3399.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:913;
x-forefront-prvs: 04433051BF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AetIqWgl0+t/H+RfFPzG/S7iDQJeS+RQn+pEQuj93mwxeZwlZ4vym7dSqOC5ACo7mmu2OVzujxVNNWWme8H4wb3cQIfo/MiOkRPsaexs4hS973qd6cx+PrHZpuTpEqoEm/m/MZgvm0XNOZskcX9V3vezdxfpr4mTmGmE/amA7lEw8c2prMSDy8GUPmc3ppqQZstiPJPtbdNs9rAxwJIalVyEDzPy1xxGxZ02ij2k16moDd5SS9qsc4Fyd6wCJgriDcISt3S1dIWQTtr2AzQAxqFGT0kiy+149HpH6KmAzJVduCi0aYCr7rtd3RDoisokmiiW56SMoxzcLJOJKlSXYMOnMqUWIbAcRjYHwfhQ8ojUxZqYeTV9bftnKf9O+TSImNcuMo8ak8y8UNcmhH8EJg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(86362001)(2906002)(6666004)(8676002)(8936002)(71200400001)(76116006)(66556008)(64756008)(83380400001)(66446008)(66476007)(66946007)(5660300002)(52536014)(4326008)(7696005)(9686003)(498600001)(54906003)(110136005)(55016002)(26005)(7366002)(7336002)(186003)(7416002)(7406005)(33656002)(6506007)(53546011)(142923001)(21314003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: VHt4bjXYRs/gH+xRRHjYIUFXTCBl5Cc45J4g2Y4ekdNfq597+eaA6xUmVMAJpS1LT+VC1f2IYCd50hWh4qre+aOuuL6n0vW2td4O2vnTdWuwfERZXzZusNgv+ZkyEn47Cg9eFmar+TWWM00VeHrDRWADnVi6sHmNPC1IbN7OAdnbRQaWQa8j7XITwtws6SCcokuCO0Mvo7tTlCuoRDzTrMQzVJOxGCk4aBAZU6iT4Pn4GnFE/gcJO9M5Ca2AuuKJ6EjssVsZuIxoXb9TOxOmhKnRnsxUVdY/8sVLqDeHDKN6XbfMsUGvUye30xBy4glLd3bz0oWRCu+Q9dOgiDdOWp/aciTm5lTjH7UE8vHIgrZf4pkj0oMZKON5OuyaC18Eslpwun9xeOgFOuVMerSGld2qDIIXjJD+nYgJhgppiYRPaXYxoq8jCFxv28GQPlu49DPgUnMV30DdxRh7NesXYx69yqCfl71ArVuWJ2DwKZevucEz6m3npnKQhqdAaLhU
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8dc2d37-f1eb-49df-b1d7-08d817886dd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2020 15:16:38.3768 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G8ohAOftk1F1QZEmKH/FFA7wfHh/IsTFgQapu2lmo0z+45AQwVUgUbh9N++wPwmZlwbmk3ALmup95wcSbQn4PdsavkltD8uAi5vwpFB42iI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB3399
X-Mailman-Approved-At: Wed, 24 Jun 2020 09:49:30 +0200
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Michael Walle <michael@walle.cc>,
 =?iso-8859-2?Q?=22Heiko_St=FCbner=22?= <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 =?iso-8859-2?Q?=22Micha=B3_Miros=B3aw=22?= <mirq-linux@rere.qmqm.pl>,
 Jonghwan Choi <charlie.jh@kakaocorp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Paul Cercueil <paul@crapouillou.net>, Andrzej Hajda <a.hajda@samsung.com>,
 Frank Shi <shifu0704@thundersoft.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 "Andrew F. Davis" <afd@ti.com>, Fabio Estevam <festevam@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Matthias Reichl <hias@horus.com>, Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 Kevin Hilman <khilman@baylibre.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, Daniel Drake <drake@endlessm.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Kukjin Kim <kgene@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Dinghao Liu <dinghao.liu@zju.edu.cn>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Chuhong Yuan <hslester96@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 James Schulman <james.schulman@cirrus.com>, Inki Dae <inki.dae@samsung.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Dan Murphy <dmurphy@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 =?iso-8859-2?B?Ik51bm8gU+Ei?= <nuno.sa@analog.com>,
 Vincent Abriou <vincent.abriou@st.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Support Opensource <Support.Opensource@diasemi.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Jason Yan <yanaijie@huawei.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 David Rhodes <david.rhodes@cirrus.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Sandy Huang <hjc@rock-chips.com>, Pavel Dobias <dobias@2n.cz>,
 Philipp Puschmann <p.puschmann@pironex.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Vishwas A Deshpande <vishwas.a.deshpande@ti.com>,
 Daniel Vetter <daniel@ffwll.ch>, Colin Ian King <colin.king@canonical.com>,
 Kevin Cernekee <cernekee@chromium.org>, Lucas Stach <l.stach@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Peter Rosin <peda@axentia.se>,
 M R Swami Reddy <mr.swami.reddy@ti.com>
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

On 23 June 2020 02:21, Kuninori Morimoto wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>=20
> snd_soc_dai_digital_mute() is internally using both
> mute_stream() (1) or digital_mute() (2), but the difference between
> these 2 are only handling direction.
> We can merge digital_mute() into mute_stream
>=20
> 	int snd_soc_dai_digital_mute(xxx, int direction)
> 	{
> 		...
> 		else if (dai->driver->ops->mute_stream)
> (1)			return dai->driver->ops->mute_stream(xxx, direction);
> 		else if (direction =3D=3D SNDRV_PCM_STREAM_PLAYBACK &&
> 			 dai->driver->ops->digital_mute)
> (2)			return dai->driver->ops->digital_mute(xxx);
> 		...
> 	}
>=20
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

> ---
>  sound/soc/codecs/da7210.c | 7 +++++--
>  sound/soc/codecs/da7213.c | 7 +++++--
>  sound/soc/codecs/da9055.c | 7 +++++--
>  3 files changed, 15 insertions(+), 6 deletions(-)
>=20
> diff --git a/sound/soc/codecs/da7210.c b/sound/soc/codecs/da7210.c
> index 0c99dcf242e4..8e5e5cd4bcbe 100644
> --- a/sound/soc/codecs/da7210.c
> +++ b/sound/soc/codecs/da7210.c
> @@ -924,11 +924,14 @@ static int da7210_set_dai_fmt(struct snd_soc_dai
> *codec_dai, u32 fmt)
>  	return 0;
>  }
>=20
> -static int da7210_mute(struct snd_soc_dai *dai, int mute)
> +static int da7210_mute(struct snd_soc_dai *dai, int mute, int direction)
>  {
>  	struct snd_soc_component *component =3D dai->component;
>  	u8 mute_reg =3D snd_soc_component_read(component,
> DA7210_DAC_HPF) & 0xFB;
>=20
> +	if (direction !=3D SNDRV_PCM_STREAM_PLAYBACK)
> +		return 0;
> +
>  	if (mute)
>  		snd_soc_component_write(component, DA7210_DAC_HPF,
> mute_reg | 0x4);
>  	else
> @@ -1034,7 +1037,7 @@ static const struct snd_soc_dai_ops da7210_dai_ops =
=3D {
>  	.set_fmt	=3D da7210_set_dai_fmt,
>  	.set_sysclk	=3D da7210_set_dai_sysclk,
>  	.set_pll	=3D da7210_set_dai_pll,
> -	.digital_mute	=3D da7210_mute,
> +	.mute_stream	=3D da7210_mute,
>  };
>=20
>  static struct snd_soc_dai_driver da7210_dai =3D {
> diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
> index cc4ae7b311b4..55f8097112e1 100644
> --- a/sound/soc/codecs/da7213.c
> +++ b/sound/soc/codecs/da7213.c
> @@ -1321,10 +1321,13 @@ static int da7213_set_dai_fmt(struct snd_soc_dai
> *codec_dai, unsigned int fmt)
>  	return 0;
>  }
>=20
> -static int da7213_mute(struct snd_soc_dai *dai, int mute)
> +static int da7213_mute(struct snd_soc_dai *dai, int mute, int direction)
>  {
>  	struct snd_soc_component *component =3D dai->component;
>=20
> +	if (direction !=3D SNDRV_PCM_STREAM_PLAYBACK)
> +		return 0;
> +
>  	if (mute) {
>  		snd_soc_component_update_bits(component,
> DA7213_DAC_L_CTRL,
>  				    DA7213_MUTE_EN, DA7213_MUTE_EN);
> @@ -1507,7 +1510,7 @@ static int da7213_set_component_pll(struct
> snd_soc_component *component,
>  static const struct snd_soc_dai_ops da7213_dai_ops =3D {
>  	.hw_params	=3D da7213_hw_params,
>  	.set_fmt	=3D da7213_set_dai_fmt,
> -	.digital_mute	=3D da7213_mute,
> +	.mute_stream	=3D da7213_mute,
>  };
>=20
>  static struct snd_soc_dai_driver da7213_dai =3D {
> diff --git a/sound/soc/codecs/da9055.c b/sound/soc/codecs/da9055.c
> index e93436ccb674..e388b1c0ba19 100644
> --- a/sound/soc/codecs/da9055.c
> +++ b/sound/soc/codecs/da9055.c
> @@ -1211,10 +1211,13 @@ static int da9055_set_dai_fmt(struct snd_soc_dai
> *codec_dai, unsigned int fmt)
>  	return 0;
>  }
>=20
> -static int da9055_mute(struct snd_soc_dai *dai, int mute)
> +static int da9055_mute(struct snd_soc_dai *dai, int mute, int direction)
>  {
>  	struct snd_soc_component *component =3D dai->component;
>=20
> +	if (direction !=3D SNDRV_PCM_STREAM_PLAYBACK)
> +		return 0;
> +
>  	if (mute) {
>  		snd_soc_component_update_bits(component,
> DA9055_DAC_L_CTRL,
>  				    DA9055_DAC_L_MUTE_EN,
> DA9055_DAC_L_MUTE_EN);
> @@ -1324,7 +1327,7 @@ static const struct snd_soc_dai_ops da9055_dai_ops =
=3D {
>  	.set_fmt	=3D da9055_set_dai_fmt,
>  	.set_sysclk	=3D da9055_set_dai_sysclk,
>  	.set_pll	=3D da9055_set_dai_pll,
> -	.digital_mute	=3D da9055_mute,
> +	.mute_stream	=3D da9055_mute,
>  };
>=20
>  static struct snd_soc_dai_driver da9055_dai =3D {
> --
> 2.25.1

