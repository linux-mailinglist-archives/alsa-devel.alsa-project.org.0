Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DC8247EC5
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 08:55:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F28A41747;
	Tue, 18 Aug 2020 08:54:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F28A41747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597733750;
	bh=NRgaOXYkfl7Iticd/JnIlc+eSxZbAgow/ypgOsmiTeA=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ihUraaYvbP4U6wWvd7rEoFoO619XIq1/V83WV9eOXJokyOi9vRdt5PsZgdEmFncJ8
	 xSwdc7iOCtC5zED/Qu1abi6T52KkVJAmK9rptG8FlyQssf5QZaBROreTSlSqxcbwqA
	 eY7DDpm3e5iCCPgHTDD14UIR4C1kSE8UfnlVYyz0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04492F800D3;
	Tue, 18 Aug 2020 08:54:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 150DFF80279; Tue, 18 Aug 2020 08:54:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D4C1F800D3
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 08:54:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D4C1F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="zsuqt4GQ"
IronPort-SDR: tUCArMrz0xkOIyrs4xEG+k9H7nM4SpoRUvqjKI0Wdazwiq1MZGk3fPy9u6X1Ke+CjdNxf1gS9k
 z7QKE/FD6I/w==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="142681062"
X-IronPort-AV: E=Sophos;i="5.76,326,1592895600"; d="scan'208";a="142681062"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2020 23:54:11 -0700
IronPort-SDR: aQqPiarPGmyWwaKVgxhYxyOptj9CZz812R8a+nlO2WW8r+abPR36VoHBdKcb0czhQYtlmWARMw
 uDIqEEt1dCfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,326,1592895600"; d="scan'208";a="326643928"
Received: from orsmsx604-2.jf.intel.com (HELO ORSMSX604.amr.corp.intel.com)
 ([10.22.229.84])
 by orsmga008.jf.intel.com with ESMTP; 17 Aug 2020 23:54:11 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 17 Aug 2020 23:54:10 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 17 Aug 2020 23:54:10 -0700
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 17 Aug 2020 23:54:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 17 Aug 2020 23:54:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSTvR/jMrl/vlo4B7dHX9X4RMlyhvfeoDfV0mpXmrDHQ3D5kM/YB7n5r4LDSh4S6qSw1tsoOBW8SY4umG+MavXe1fYUSUPPMXEhRLBS5ETXE3G1/nMrCpfpyo0wDg+5jVoO5gVgVTvhUm1/uOnAsMDGNfXJO4ggb3w4Y8mVhC65+H71fd/JniJqvRslYLCB33PD9/KkfZQ++qmpsft427tFP0B/0MpYXJD7WynLHxNvwugWC0I2nBKSo+m4L9bnqDMvNM04NZb9wGOy7zLNdM2EfgfQAC4ODf8pSoWcGQ8BVMxmmsbtvUpmRZWZh11O+h73yKt6iKuHMh5U0D+qNbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bDf2tioDbwvVd0v/68CiYEijTIlKwxPKUPv/a4Ppr4=;
 b=TtLYuSEomnYlXzqVVPYLjVQF/fACFKbvWxvFEnJ9KnBDDo4YeQFo2APIDqMfRFL4I9J53Kim7/uDXU6RTJoBVzq/ftqTnJMgiivGgFoV5YGzoC2tmE9sj1egceVq8NoiPXvmHCM6OUybFQR7xyMIwYqEapmbgV09C3IxirrxMpcWCcFASrhIJBT/YRrg90JJmw1QPsg/USJZ0Yg2E7S2+tT/7t2xSj8S1gemqHD9dVS0Go8mU8erglgVJQYWBbKW3Yp15HKqWmj+eqZ54zqLxqE7MdqokEPvMxEXQ3+bnG/jNbY32a25czh4geqv76sT3Q/zQwlgi1Q0aSZzcMEJNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bDf2tioDbwvVd0v/68CiYEijTIlKwxPKUPv/a4Ppr4=;
 b=zsuqt4GQYr8hV5l3PFyQucGkrZhMIuF5JT68W3Tyws6wbDOlcg4nSUNccNcOFM2+S1ySXa4XLyUJ4Cwq40tk58Gj+qFtGnBK/asDFROwdXrcht59BE/DxDFxkayr5tEKtkfvyYEdw1qUN1vR0TL2fmj869Id+SaFbB1oqbKCMDk=
Received: from BYAPR11MB3046.namprd11.prod.outlook.com (2603:10b6:a03:86::18)
 by BY5PR11MB4168.namprd11.prod.outlook.com (2603:10b6:a03:181::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.22; Tue, 18 Aug
 2020 06:53:53 +0000
Received: from BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::cc39:1771:dc1f:593c]) by BYAPR11MB3046.namprd11.prod.outlook.com
 ([fe80::cc39:1771:dc1f:593c%3]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 06:53:53 +0000
From: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
To: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH v2 3/3] ASoC: codec: tlv3204: Moving GPIO reset and add
 ADC reset
Thread-Topic: [PATCH v2 3/3] ASoC: codec: tlv3204: Moving GPIO reset and add
 ADC reset
Thread-Index: AQHWcI6eU0NReh5z0UqrNjwRTEfsE6k9ducQ
Date: Tue, 18 Aug 2020 06:53:52 +0000
Message-ID: <BYAPR11MB304648710FD6EEE605F6E7C39D5C0@BYAPR11MB3046.namprd11.prod.outlook.com>
References: <20200812094631.4698-1-michael.wei.hong.sit@intel.com>
 <20200812094631.4698-4-michael.wei.hong.sit@intel.com>
In-Reply-To: <20200812094631.4698-4-michael.wei.hong.sit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [121.123.189.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 044020b6-a261-4435-f048-08d843437829
x-ms-traffictypediagnostic: BY5PR11MB4168:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB41683ACE8C737E747F2031CB9D5C0@BY5PR11MB4168.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y6cUnI3LcL5/LUr+MuaAS41JHnc4KvFdNEroJ9XPk1pMEDqjR9A/tMMAVHd/f5QfKqYMOkHMwyXJxneWXST/G8y+OH61Zu1EcGHWStq4DmxQaGWqPPGQPTBlzSvlPmJyzD+QV+DITbm2WfrU1cFFv9nZUdm8+2KTH1wAu+Yuzgbfht/+gyC7Zt/23mewg9B4JB4GAyBGlHko5GR8r+ZgvVMq33W2MMPTpdNeYEPXktDyfgiQ5xDq9L5NR4B4Otdlry/bjU1qFRaeuQ89BO3iDbgZiHJph2ZEBUsi+Rblii+62mktwLfca1NtVFSsqXH1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(83380400001)(8936002)(86362001)(52536014)(4326008)(8676002)(66946007)(5660300002)(76116006)(6506007)(66556008)(110136005)(64756008)(53546011)(66476007)(2906002)(66446008)(55016002)(7696005)(186003)(33656002)(316002)(478600001)(54906003)(9686003)(26005)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: MFdD9KKu0Rk9LDP/WpQDJEpqr5Z/PV3BmXsAmedtnmzjsZ1qto7w7EUB/tZI7Ru9cOQIM42Chy9PUSJX42RKFqKijuEvk5P7n5ILCC0lqD5QX4PE3RSIMak/0eST0ZORJ10xC2UfN0syo0euHL3b83xj3sT0+A1N2R2EwgBr+DKQFeiqDLlY0hZ84/QERfBpqUSFW0tQSTq/RGjOOPu7z3qA7o3bnt5gZ1nEd8wR+zBg7aaqkEr4uhq4ibabstTeQZWIVaY54CZjjL3wO3rTgLojuSHpXTNNChp3fdqmFBqSGacntLL7YnkFDlOBLqjvXgsNrMKTdGA2vEj4CGnCI2DpYaaMWyeZW8anYOMPDuGo8Mz+g0T5HIdqZUF1Na/QI2b/sLLb3NQgrXu53gYbBXCY8/IPINH7/phdFx9W8PAf3s9uwOb4UPQLRwu7ejxDTmiU1tAvElB5Jz39rlBS1V04P8K9T7exG/eO829T9AwOvYgxRLpVxPI4rzJNGliaBzmTT3gWhp2eGbm//mWV93OW4BRIG5vN7Rw2/UMhB93i29nETnDtuw3hrE6lrf51wDhHtYWcEOgEHaPaN76LPBnZjVyH8Wy2jjwazlx5otMgsuVyFBrfcTfgpHxTL7NRyb0S4cQZa39nannNgPGI9A==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 044020b6-a261-4435-f048-08d843437829
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2020 06:53:52.9220 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nYUc+YMFYfOG7pXIkpyFvCPmAr8ytw7CgwrcZ1FpYsGXwuKSCn6CiP8U5ajg5EoFzUIJIsdTPXpAsvGpT1B1d2kJ6Bx3kT4rs9x6RraGmeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4168
X-OriginatorOrg: intel.com
Cc: "Wilson, Michael \(NW-FAM\)" <michael.wilson@ti.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, "a-estrada@ti.com" <a-estrada@ti.com>,
 "Shevchenko, Andriy" <andriy.shevchenko@intel.com>,
 "tiwai@suse.com" <tiwai@suse.com>, "Sia, 
 Jee Heng" <jee.heng.sia@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "zakkaye@ti.com" <zakkaye@ti.com>,
 "dmurphy@ti.com" <dmurphy@ti.com>
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



> -----Original Message-----
> From: Alsa-devel <alsa-devel-bounces@alsa-project.org> On Behalf
> Of Michael Sit Wei Hong
> Sent: Wednesday, 12 August, 2020 5:47 PM
> To: alsa-devel@alsa-project.org
> Cc: Rojewski, Cezary <cezary.rojewski@intel.com>; a-
> estrada@ti.com; Shevchenko, Andriy
> <andriy.shevchenko@intel.com>; zakkaye@ti.com; tiwai@suse.com;
> Sia, Jee Heng <jee.heng.sia@intel.com>; pierre-
> louis.bossart@linux.intel.com; liam.r.girdwood@linux.intel.com;
> broonie@kernel.org; dmurphy@ti.com
> Subject: [PATCH v2 3/3] ASoC: codec: tlv3204: Moving GPIO reset
> and add ADC reset
>=20
> Moving GPIO reset to a later stage and before clock registration to
> ensure that the host system and codec clocks are in sync. If the host
> register clock values prior to gpio reset, the last configured codec
> clock is registered to the host. The codec then gets gpio resetted
> setting the codec clocks to their default value, causing a mismatch.
> Host system will skip clock setting thinking the codec clocks are
> already at the requested rate.
>=20
> ADC reset is added to ensure the next audio capture does not have
> undesired artifacts. It is probably related to the original code where
> the probe function resets the ADC prior to 1st record.
>=20
> Signed-off-by: Michael Sit Wei Hong
> <michael.wei.hong.sit@intel.com>
> Reviewed-by: Sia Jee Heng <jee.heng.sia@intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-
> louis.bossart@linux.intel.com>
> ---
>  sound/soc/codecs/tlv320aic32x4.c | 47
> ++++++++++++++++++++++++--------
>  1 file changed, 35 insertions(+), 12 deletions(-)
>=20
> diff --git a/sound/soc/codecs/tlv320aic32x4.c
> b/sound/soc/codecs/tlv320aic32x4.c
> index 6c2338ea5d8d..8dcea566b375 100644
> --- a/sound/soc/codecs/tlv320aic32x4.c
> +++ b/sound/soc/codecs/tlv320aic32x4.c
> @@ -50,6 +50,28 @@ struct aic32x4_priv {
>  	struct device *dev;
>  };
>=20
> +static int aic32x4_reset_adc(struct snd_soc_dapm_widget *w,
> +			     struct snd_kcontrol *kcontrol, int event)
> {
> +	struct snd_soc_component *component =3D
> snd_soc_dapm_to_component(w->dapm);
> +	u32 adc_reg;
> +
> +	/*
> +	 * Workaround: the datasheet does not mention a required
> programming
> +	 * sequence but experiments show the ADC needs to be
> reset after each
> +	 * capture to avoid audible artifacts.
> +	 */
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMD:
> +		adc_reg =3D snd_soc_component_read(component,
> AIC32X4_ADCSETUP);
> +		snd_soc_component_write(component,
> AIC32X4_ADCSETUP, adc_reg |
> +					AIC32X4_LADC_EN |
> AIC32X4_RADC_EN);
> +		snd_soc_component_write(component,
> AIC32X4_ADCSETUP, adc_reg);
> +		break;
> +	}
> +	return 0;
> +};
> +
>  static int mic_bias_event(struct snd_soc_dapm_widget *w,
>  	struct snd_kcontrol *kcontrol, int event)  { @@ -434,6
> +456,7 @@ static const struct snd_soc_dapm_widget
> aic32x4_dapm_widgets[] =3D {
>  	SND_SOC_DAPM_SUPPLY("Mic Bias", AIC32X4_MICBIAS, 6,
> 0, mic_bias_event,
>  			SND_SOC_DAPM_POST_PMU |
> SND_SOC_DAPM_PRE_PMD),
>=20
> +	SND_SOC_DAPM_POST("ADC Reset", aic32x4_reset_adc),
>=20
>  	SND_SOC_DAPM_OUTPUT("HPL"),
>  	SND_SOC_DAPM_OUTPUT("HPR"),
> @@ -665,8 +688,8 @@ static int
> aic32x4_set_processing_blocks(struct snd_soc_component
> *component,  }
>=20
>  static int aic32x4_setup_clocks(struct snd_soc_component
> *component,
> -			unsigned int sample_rate, unsigned int
> channel,
> -			unsigned int bit_depth)
> +				unsigned int sample_rate, unsigned
> int channel,
> +				unsigned int bit_depth)
>  {
>  	u8 aosr;
>  	u16 dosr;
> @@ -958,12 +981,6 @@ static int
> aic32x4_component_probe(struct snd_soc_component
> *component)
>  	if (ret)
>  		return ret;
>=20
> -	if (gpio_is_valid(aic32x4->rstn_gpio)) {
> -		ndelay(10);
> -		gpio_set_value(aic32x4->rstn_gpio, 1);
> -		mdelay(1);
> -	}
> -
>  	snd_soc_component_write(component, AIC32X4_RESET,
> 0x01);
>=20
>  	if (aic32x4->setup)
> @@ -1196,10 +1213,6 @@ int aic32x4_probe(struct device *dev,
> struct regmap *regmap)
>  		aic32x4->mclk_name =3D "mclk";
>  	}
>=20
> -	ret =3D aic32x4_register_clocks(dev, aic32x4->mclk_name);
> -	if (ret)
> -		return ret;
> -
>  	if (gpio_is_valid(aic32x4->rstn_gpio)) {
>  		ret =3D devm_gpio_request_one(dev, aic32x4-
> >rstn_gpio,
>  				GPIOF_OUT_INIT_LOW,
> "tlv320aic32x4 rstn"); @@ -1221,6 +1234,16 @@ int
> aic32x4_probe(struct device *dev, struct regmap *regmap)
>  		return ret;
>  	}
>=20
> +	if (gpio_is_valid(aic32x4->rstn_gpio)) {
> +		ndelay(10);
> +		gpio_set_value_cansleep(aic32x4->rstn_gpio, 1);
> +		mdelay(1);
> +	}
> +
> +	ret =3D aic32x4_register_clocks(dev, aic32x4->mclk_name);
> +	if (ret)
> +		return ret;
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL(aic32x4_probe);
> --
> 2.17.1

Hi everyone,

Any comments on this patch set?

Thanks,
Regards,
Michael



