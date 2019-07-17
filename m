Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E296BE2E
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 16:26:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C00B168B;
	Wed, 17 Jul 2019 16:25:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C00B168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563373562;
	bh=IDVxYZccz1Lnj6q/Vx1nbzT248Ea114GA0/IKOF6lHw=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n0nlwKt17c3pFFZRjdiE9gqJ6e5+U0Rt9fyatlk/nQ1x52RzBsOtxLfcGVhZ6j6Ib
	 tJT+Q476UetejUd14Hnjd//il1mm/mXXdKhM1b+jZLkEcrCMgY6zBZ+Jxk/eqK0IX3
	 MXcVshSrfE9zSso0Hv5EjH8/wSFPTfKYSAvQt4S8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4021F80228;
	Wed, 17 Jul 2019 16:24:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C89BBF80363; Wed, 17 Jul 2019 16:24:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0703.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe02::703])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2C24F800C2
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 16:24:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2C24F800C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="GleRz1dL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HUyuJDwOVrmRMUYoOgnqKPM6BrLLKAfI/DKgh95gdG1lfK/cfpN5tUgUDrOFK5HdtJD9JfQ1VlAPURZCGzZdLFuvr+B+oQi565PV8aqoD2K03APUvRcoZsJHijb66ArHWUETRFtanl99oGR7uAh8kEDYum7PBkQirmynn2dh5lD7OF39Xj+25rb2d2ogdBQnErq5uW6E/HWlDqrbDkn1FY65xreRbrIc++yJOvN39Atld9HTVu0DHAhMC0pis2XcKzNvdARHUA+Yj+Ypbg2Mny2C9x2el1IvEGHtR77XYuRtQhJQf3wD2SpUGFXmv7zdTgVIM70+e0HU+WXBQNJHxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8qrEL/46XOfIz5tVkDGRYCKQIS3Y1piYrgtFbkILeY=;
 b=Ny/ligJUscuC3u+8jHmikF2OtOmvH7pBoH6Ve2dOhNq+0cWSqyFZEnKvZ2cTTVMQaqmMs/qQBN7zVkZVDVKODphDhnDu4C+9OMe0Or/INYynLxspPj2nnNkcyrZriQ6xH8jYiRHp98f4cwjpzj8XfsIwSlo1V54gIsG5mBHNF7y7ErY5HuyRLt9uqXADUsXhCgWmu9qQNmUlDbPScRQqWJUV3Lh3oVDEiQGOOvTbMLKfZQwMuGJT4BGk3IzneP9/XD3TzKofMwe6Jl4nxWiyeFz+evbZMoL3xcSDoyS4hN+ml0QjQA0Ep5nZh+A79tesLOvO11JWSUrX8oQSsi0YTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=toradex.com;dmarc=pass action=none
 header.from=toradex.com;dkim=pass header.d=toradex.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8qrEL/46XOfIz5tVkDGRYCKQIS3Y1piYrgtFbkILeY=;
 b=GleRz1dLN9tThntOQ8Y1dAJmFog8KpywCVN9At/82K3oLTn4N1BS/qIx3EmIYYlgnJHy/Zycca57vPl4PYjIApn+cDvm9nhmEk6NjFkzmvyfbleRS2DU1u6fPI4pP1ZWViT2w/HBCMkE0qLi67hgM7qEtp7PKmAX+LaMHo/lEJI=
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com (20.179.18.16) by
 AM6PR05MB4807.eurprd05.prod.outlook.com (20.177.34.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Wed, 17 Jul 2019 14:24:12 +0000
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9]) by AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9%6]) with mapi id 15.20.2094.011; Wed, 17 Jul 2019
 14:24:12 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Thread-Topic: [PATCH v3 6/6] ASoC: sgtl5000: Improve VAG power and mute control
Thread-Index: AQHVOMHvGSHQf0Ud+UKXY+OtRfqyFqbKXpSAgASFtXw=
Date: Wed, 17 Jul 2019 14:24:12 +0000
Message-ID: <AM6PR05MB6535E442AF37B7B079761DB2F9C90@AM6PR05MB6535.eurprd05.prod.outlook.com>
References: <20190712145550.27500-1-oleksandr.suvorov@toradex.com>
 <20190712145550.27500-7-oleksandr.suvorov@toradex.com>,
 <e9f0f7c7-4c11-36ad-679c-503f6160b83f@intel.com>
In-Reply-To: <e9f0f7c7-4c11-36ad-679c-503f6160b83f@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-originating-ip: [194.105.145.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3182a11e-9016-461a-9136-08d70ac2706d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR05MB4807; 
x-ms-traffictypediagnostic: AM6PR05MB4807:
x-microsoft-antispam-prvs: <AM6PR05MB4807219BF95F60B5C56CDEC7F9C90@AM6PR05MB4807.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(366004)(346002)(396003)(39850400004)(136003)(199004)(189003)(3846002)(14454004)(6116002)(74316002)(66066001)(53936002)(305945005)(7736002)(6436002)(6916009)(476003)(446003)(55016002)(9686003)(2906002)(71200400001)(316002)(66946007)(71190400001)(478600001)(5660300002)(52536014)(54906003)(86362001)(8936002)(68736007)(25786009)(14444005)(256004)(53546011)(102836004)(6506007)(6246003)(229853002)(26005)(81166006)(81156014)(8676002)(76116006)(66446008)(64756008)(66556008)(66476007)(76176011)(7696005)(44832011)(99286004)(486006)(11346002)(186003)(4326008)(33656002)(21314003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR05MB4807;
 H:AM6PR05MB6535.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: C6nVtcAjcjTv8rmKFsRXWSVQJgLQTbktwlgr7/k8OumsSLOVAImFWKzce8s5Ejy8yjoIjStptvul309VmaQ5VcZhhdofx60wyvh/cmIXoM9ZO282FA50NxlUue0axyQmoAcYzNK4KDMVzeZRp4mB5pOs5p7O/hVtWcbUCeYLSibq/Sk0uOPNJJ0542R/0aihbFFDak1nadnyhZjqomf4MKXEqjH6xYXwtEjNkPMvW+F+/xia2e7MlxVfQrl/ewcgLiA/05DobNR8HBZGjxigqZjHWFjRgb7i4n80aChz90cjVXcw9JUOtI0g2A6RH52Dt1k9u8n01BjnLIhoAs9qUkuLV589/XStPKfzicE2A30IdkvQaSxjx6zADLYZM97IZh7+g8PQFILkEpiKTMgZsvbdBo9VVf1QCxLLmur28b4=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3182a11e-9016-461a-9136-08d70ac2706d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 14:24:12.1796 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oleksandr.suvorov@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB4807
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [alsa-devel] [PATCH v3 6/6] ASoC: sgtl5000: Improve VAG power
	and mute control
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

Thank you, Cezary!

This is a good idea, I'll rework my patch accordingly.

R&D Engineer
Oleksandr Suvorov

Toradex AG

________________________________________
From: Cezary Rojewski <cezary.rojewski@intel.com>
Sent: Sunday, July 14, 2019 8:17:43 PM
To: Oleksandr Suvorov
Cc: Fabio Estevam; linux-kernel@vger.kernel.org; alsa-devel@alsa-project.org; Marcel Ziswiler; Igor Opaniuk; Jaroslav Kysela; Mark Brown; Takashi Iwai; Liam Girdwood
Subject: Re: [PATCH v3 6/6] ASoC: sgtl5000: Improve VAG power and mute control

On 2019-07-12 16:56, Oleksandr Suvorov wrote:
>
> +enum {
> +     HP_POWER_EVENT,
> +     DAC_POWER_EVENT,
> +     ADC_POWER_EVENT
> +};
> +
> +struct sgtl5000_mute_state {
> +     u16 hp_event;
> +     u16 dac_event;
> +     u16 adc_event;
> +};
> +
>   /* sgtl5000 private structure in codec */
>   struct sgtl5000_priv {
>       int sysclk;     /* sysclk rate */
> @@ -137,8 +156,109 @@ struct sgtl5000_priv {
>       u8 micbias_voltage;
>       u8 lrclk_strength;
>       u8 sclk_strength;
> +     struct sgtl5000_mute_state mute_state;

Why not array instead?
u16 mute_state[ADC_POWER_EVENT+1];
-or-
u16 mute_state[LAST_POWER_EVENT+1]; (if you choose to add explicit LAST
enum constant).

Enables simplification, see below.

> @@ -170,40 +290,79 @@ static int mic_bias_event(struct snd_soc_dapm_widget *w,
>       return 0;
>   }
>
> -/*
> - * As manual described, ADC/DAC only works when VAG powerup,
> - * So enabled VAG before ADC/DAC up.
> - * In power down case, we need wait 400ms when vag fully ramped down.
> - */
> -static int power_vag_event(struct snd_soc_dapm_widget *w,
> -     struct snd_kcontrol *kcontrol, int event)
> +static void vag_and_mute_control(struct snd_soc_component *component,
> +                              int event, int event_source,
> +                              u16 mute_mask, u16 *mute_reg)
>   {
> -     struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> -     const u32 mask = SGTL5000_DAC_POWERUP | SGTL5000_ADC_POWERUP;
> -
>       switch (event) {
> -     case SND_SOC_DAPM_POST_PMU:
> -             snd_soc_component_update_bits(component, SGTL5000_CHIP_ANA_POWER,
> -                     SGTL5000_VAG_POWERUP, SGTL5000_VAG_POWERUP);
> -             msleep(400);
> +     case SND_SOC_DAPM_PRE_PMU:
> +             *mute_reg = mute_output(component, mute_mask);
> +             break;
> +     case SND_SOC_DAPM_POST_PMU:
> +             vag_power_on(component, event_source);
> +             restore_output(component, mute_mask, *mute_reg);
>               break;
> -
>       case SND_SOC_DAPM_PRE_PMD:
> -             /*
> -              * Don't clear VAG_POWERUP, when both DAC and ADC are
> -              * operational to prevent inadvertently starving the
> -              * other one of them.
> -              */
> -             if ((snd_soc_component_read32(component, SGTL5000_CHIP_ANA_POWER) &
> -                             mask) != mask) {
> -                     snd_soc_component_update_bits(component, SGTL5000_CHIP_ANA_POWER,
> -                             SGTL5000_VAG_POWERUP, 0);
> -                     msleep(400);
> -             }
> +             *mute_reg = mute_output(component, mute_mask);
> +             vag_power_off(component, event_source);
> +             break;
> +     case SND_SOC_DAPM_POST_PMD:
> +             restore_output(component, mute_mask, *mute_reg);
>               break;
>       default:
>               break;
>       }
> +}
> +
> +/*
> + * Mute Headphone when power it up/down.
> + * Control VAG power on HP power path.
> + */
> +static int headphone_pga_event(struct snd_soc_dapm_widget *w,
> +     struct snd_kcontrol *kcontrol, int event)
> +{
> +     struct snd_soc_component *component =
> +             snd_soc_dapm_to_component(w->dapm);
> +     struct sgtl5000_priv *sgtl5000 =
> +             snd_soc_component_get_drvdata(component);
> +
> +     vag_and_mute_control(component, event, HP_POWER_EVENT,
> +                          SGTL5000_HP_MUTE,
> +                          &sgtl5000->mute_state.hp_event);
> +
> +     return 0;
> +}
> +
> +/* As manual describes, ADC/DAC powering up/down requires
> + * to mute outputs to avoid pops.
> + * Control VAG power on ADC/DAC power path.
> + */
> +static int adc_updown_depop(struct snd_soc_dapm_widget *w,
> +     struct snd_kcontrol *kcontrol, int event)
> +{
> +     struct snd_soc_component *component =
> +             snd_soc_dapm_to_component(w->dapm);
> +     struct sgtl5000_priv *sgtl5000 =
> +             snd_soc_component_get_drvdata(component);
> +
> +     vag_and_mute_control(component, event, ADC_POWER_EVENT,
> +                          SGTL5000_OUTPUTS_MUTE,
> +                          &sgtl5000->mute_state.adc_event);
> +
> +     return 0;
> +}
> +
> +static int dac_updown_depop(struct snd_soc_dapm_widget *w,
> +     struct snd_kcontrol *kcontrol, int event)
> +{
> +     struct snd_soc_component *component =
> +             snd_soc_dapm_to_component(w->dapm);
> +     struct sgtl5000_priv *sgtl5000 =
> +             snd_soc_component_get_drvdata(component);
> +
> +     vag_and_mute_control(component, event, DAC_POWER_EVENT,
> +                          SGTL5000_OUTPUTS_MUTE,
> +                          &sgtl5000->mute_state.dac_event);
>
>       return 0;
>   }

With array approach you can simplify these 3 callbacks:
- remove local declaration of sgtl5000
- remove the need for "u16 *mute_reg" param for vag_and_mute_control
(you always provide the xxx_event field of mute_state corresponding to
given XXX_POWER_EVENT anyway)

The sgtl5000 local ptr would be declared within common handler, which
vag_and_mute_control clearly is. Said handler declaration could be
updated to again require widget rather than component.

Cherry on top: relocation of "return 0;" directly to
vag_and_mute_control. Leaving it void (as it is), however, might also be
appropriate (explicit).

Czarek
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
