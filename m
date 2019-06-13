Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C874348B
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 11:15:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E166417E5;
	Thu, 13 Jun 2019 11:14:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E166417E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560417320;
	bh=zfWOHNOQ8SYU/1Yg0m/x0gtyUSDmdnccZJdypwq8Jug=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uh8rAbakQEKoyXRvQD1lf05KdvxjJQvd2tnzuLCyqpxDuOgbJlu44pLLz5mimSsH5
	 9JqAIb5PCm5y+715tN+yzqmj/n5hvAkz6/K9e4gkkyJ4el/I95GPqketL0aoVGPThS
	 AHoVQFQdMz5jSZgFpSMgAhlcisxCRGtUpHTpOOeo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1841F89737;
	Thu, 13 Jun 2019 11:11:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04176F89703; Thu, 13 Jun 2019 11:07:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40131.outbound.protection.outlook.com [40.107.4.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E595EF8076F
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 11:06:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E595EF8076F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="VcLqVKLS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsIDGlvBpEXFMrUE/FRUFbOWiK/rIBHSdtga60fez0g=;
 b=VcLqVKLSjbSiRtz+eFKmv05YZBPplG1ylWNY05ThWvLo4QI6asQ8rX5BaJ+QmRO6NAvKYZRGX27jRSD0TFR82+5GEVEw9VKH00t2FJDHqXBngU37ld5iTHSa8sHyZkk8CKV5S3g9mMAuIBq9Qs4sZtI2kgZ2L6IhwhwKvToYMi8=
Received: from VI1PR05MB6477.eurprd05.prod.outlook.com (20.179.26.150) by
 VI1PR05MB6286.eurprd05.prod.outlook.com (20.179.24.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Thu, 13 Jun 2019 09:06:44 +0000
Received: from VI1PR05MB6477.eurprd05.prod.outlook.com
 ([fe80::8437:8389:cec3:452c]) by VI1PR05MB6477.eurprd05.prod.outlook.com
 ([fe80::8437:8389:cec3:452c%6]) with mapi id 15.20.1965.017; Thu, 13 Jun 2019
 09:06:44 +0000
From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
To: "festevam@gmail.com" <festevam@gmail.com>, Oleksandr Suvorov
 <oleksandr.suvorov@toradex.com>
Thread-Topic: [PATCH v1 6/6] ASoC: sgtl5000: Improve VAG power and mute control
Thread-Index: AQHVD9h2fbIPwr7e+0WO8ePW0QxqyKaZbvMA
Date: Thu, 13 Jun 2019 09:06:44 +0000
Message-ID: <4cda4703fc612c0b4eaf98e7496995cd24f7cfe8.camel@toradex.com>
References: <20190521103619.4707-1-oleksandr.suvorov@toradex.com>
 <20190521103619.4707-7-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190521103619.4707-7-oleksandr.suvorov@toradex.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=marcel.ziswiler@toradex.com; 
x-originating-ip: [46.140.72.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6fa46463-e758-4a11-7f18-08d6efde754b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR05MB6286; 
x-ms-traffictypediagnostic: VI1PR05MB6286:
x-microsoft-antispam-prvs: <VI1PR05MB6286A068A43F4E3A6C012784FBEF0@VI1PR05MB6286.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(346002)(396003)(39850400004)(376002)(199004)(189003)(7736002)(66446008)(73956011)(66476007)(2906002)(66556008)(66946007)(2501003)(76116006)(64756008)(54906003)(2616005)(11346002)(36756003)(446003)(476003)(486006)(110136005)(14444005)(44832011)(53936002)(256004)(8676002)(76176011)(305945005)(86362001)(71190400001)(71200400001)(66066001)(68736007)(186003)(81166006)(229853002)(6512007)(6486002)(14454004)(26005)(8936002)(5660300002)(478600001)(316002)(6506007)(118296001)(6636002)(4326008)(99286004)(25786009)(6436002)(6116002)(3846002)(81156014)(6246003)(102836004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR05MB6286;
 H:VI1PR05MB6477.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zznYcs7rM/qMqvuxLEHF0U2u+nTT8s4YmnVk5rhsODHeqjHOaPk7aKzFamyiPkeNx1NXaMgtpWqtbK05ZfloYjXIW5TScnszqxM7YDNb7nehloAaniTcLjxZ+2eCluKTplHYHERtz7CwUVE+3k7eYuxlT0v3cQqcolfvE+g6uelozB1vHnzcAEvBx3lPIwTpI29aE40/Ad4GyxHIFatdDotsvF+hza8sVjzINed+gTCwwsqHeb0j4RcO2bY+aA6CUrplWE5fuH77g8zgsCPUWPH/706YktaqHPKtN+wiNCcOfLsSdLIpKTxx0IKCGuKl0N0g0mHviT1rLoHQDMmDPSpaDh4I4IrQb8nnqtMIwHnX4vH+vZD5zeDe8ScJhiBTaAloefM8RZkDKTi1E8gMDeusWE7sIOePBZOr51i+mrk=
Content-ID: <10C760BBFA849F41BC1A2E4584B0CDF9@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa46463-e758-4a11-7f18-08d6efde754b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 09:06:44.7904 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: marcel.ziswiler@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6286
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v1 6/6] ASoC: sgtl5000: Improve VAG power
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

On Tue, 2019-05-21 at 13:36 +0300, Oleksandr Suvorov wrote:
> Change VAG power on/off control according to the following algorithm:
> - turn VAG power ON on the 1st incoming event.
> - keep it ON if there is any active VAG consumer (ADC/DAC/HP/Line-
> In).
> - turn VAG power OFF when there is the latest consumer's pre-down
> event
>   come.
> - always delay after VAG power OFF to avoid pop.
> - delay after VAG power ON if the initiative consumer is Line-In,
> this
>   prevents pop during line-in muxing.
> 
> Also, according to the manual, to avoid any pops/clicks,
> the outputs should be muted during input/output
> routing changes.
> 
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>

Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

> ---
> 
>  sound/soc/codecs/sgtl5000.c | 227 +++++++++++++++++++++++++++++++---
> --
>  1 file changed, 195 insertions(+), 32 deletions(-)
> 
> diff --git sound/soc/codecs/sgtl5000.c sound/soc/codecs/sgtl5000.c
> index ee1e4bf61322..acfbd5cdf936 100644
> --- sound/soc/codecs/sgtl5000.c
> +++ sound/soc/codecs/sgtl5000.c
> @@ -31,6 +31,13 @@
>  #define SGTL5000_DAP_REG_OFFSET	0x0100
>  #define SGTL5000_MAX_REG_OFFSET	0x013A
>  
> +/* Delay for the VAG ramp up */
> +#define SGTL5000_VAG_POWERUP_DELAY 500 /* ms */
> +/* Delay for the VAG ramp down */
> +#define SGTL5000_VAG_POWERDOWN_DELAY 500 /* ms */
> +
> +#define SGTL5000_OUTPUTS_MUTE (SGTL5000_HP_MUTE |
> SGTL5000_LINE_OUT_MUTE)
> +
>  /* default value of sgtl5000 registers */
>  static const struct reg_default sgtl5000_reg_defaults[] = {
>  	{ SGTL5000_CHIP_DIG_POWER,		0x0000 },
> @@ -123,6 +130,18 @@ enum  {
>  	I2S_SCLK_STRENGTH_HIGH,
>  };
>  
> +enum {
> +	HP_POWER_EVENT,
> +	DAC_POWER_EVENT,
> +	ADC_POWER_EVENT
> +};
> +
> +struct sgtl5000_mute_state {
> +	u16 hp_event;
> +	u16 dac_event;
> +	u16 adc_event;
> +};
> +
>  /* sgtl5000 private structure in codec */
>  struct sgtl5000_priv {
>  	int sysclk;	/* sysclk rate */
> @@ -137,8 +156,109 @@ struct sgtl5000_priv {
>  	u8 micbias_voltage;
>  	u8 lrclk_strength;
>  	u8 sclk_strength;
> +	struct sgtl5000_mute_state mute_state;
>  };
>  
> +static inline int hp_sel_input(struct snd_soc_component *component)
> +{
> +	return (snd_soc_component_read32(component,
> SGTL5000_CHIP_ANA_CTRL) &
> +		SGTL5000_HP_SEL_MASK) >> SGTL5000_HP_SEL_SHIFT;
> +}
> +
> +static inline u16 mute_output(struct snd_soc_component *component,
> +			      u16 mute_mask)
> +{
> +	u16 mute_reg = snd_soc_component_read32(component,
> +					      SGTL5000_CHIP_ANA_CTRL);
> +
> +	snd_soc_component_update_bits(component,
> SGTL5000_CHIP_ANA_CTRL,
> +			    mute_mask, mute_mask);
> +	return mute_reg;
> +}
> +
> +static inline void restore_output(struct snd_soc_component
> *component,
> +				  u16 mute_mask, u16 mute_reg)
> +{
> +	snd_soc_component_update_bits(component,
> SGTL5000_CHIP_ANA_CTRL,
> +		mute_mask, mute_reg);
> +}
> +
> +static void vag_power_on(struct snd_soc_component *component, u32
> source)
> +{
> +	if (snd_soc_component_read32(component,
> SGTL5000_CHIP_ANA_POWER) &
> +	    SGTL5000_VAG_POWERUP)
> +		return;
> +
> +	snd_soc_component_update_bits(component,
> SGTL5000_CHIP_ANA_POWER,
> +			    SGTL5000_VAG_POWERUP,
> SGTL5000_VAG_POWERUP);
> +
> +	/* When VAG powering on to get local loop from Line-In, the
> sleep
> +	 * is required to avoid loud pop.
> +	 */
> +	if (hp_sel_input(component) == SGTL5000_HP_SEL_LINE_IN &&
> +	    source == HP_POWER_EVENT)
> +		msleep(SGTL5000_VAG_POWERUP_DELAY);
> +}
> +
> +static int vag_power_consumers(struct snd_soc_component *component,
> +			       u16 ana_pwr_reg, u32 source)
> +{
> +	int consumers = 0;
> +
> +	/* count dac/adc consumers unconditional */
> +	if (ana_pwr_reg & SGTL5000_DAC_POWERUP)
> +		consumers++;
> +	if (ana_pwr_reg & SGTL5000_ADC_POWERUP)
> +		consumers++;
> +
> +	/*
> +	 * If the event comes from HP and Line-In is selected,
> +	 * current action is 'DAC to be powered down'.
> +	 * As HP_POWERUP is not set when HP muxed to line-in,
> +	 * we need to keep VAG power ON.
> +	 */
> +	if (source == HP_POWER_EVENT) {
> +		if (hp_sel_input(component) == SGTL5000_HP_SEL_LINE_IN)
> +			consumers++;
> +	} else {
> +		if (ana_pwr_reg & SGTL5000_HP_POWERUP)
> +			consumers++;
> +	}
> +
> +	return consumers;
> +}
> +
> +static void vag_power_off(struct snd_soc_component *component, u32
> source)
> +{
> +	u16 ana_pwr = snd_soc_component_read32(component,
> +					     SGTL5000_CHIP_ANA_POWER);
> +
> +	if (!(ana_pwr & SGTL5000_VAG_POWERUP))
> +		return;
> +
> +	/*
> +	 * This function calls when any of VAG power consumers is
> disappearing.
> +	 * Thus, if there is more than one consumer at the moment, as
> minimum
> +	 * one consumer will definitely stay after the end of the
> current
> +	 * event.
> +	 * Don't clear VAG_POWERUP if 2 or more consumers of VAG
> present:
> +	 * - LINE_IN (for HP events) / HP (for DAC/ADC events)
> +	 * - DAC
> +	 * - ADC
> +	 * (the current consumer is disappearing right now)
> +	 */
> +	if (vag_power_consumers(component, ana_pwr, source) >= 2)
> +		return;
> +
> +	snd_soc_component_update_bits(component,
> SGTL5000_CHIP_ANA_POWER,
> +		SGTL5000_VAG_POWERUP, 0);
> +	/* In power down case, we need wait 400-1000 ms
> +	 * when VAG fully ramped down.
> +	 * As longer we wait, as smaller pop we've got.
> +	 */
> +	msleep(SGTL5000_VAG_POWERDOWN_DELAY);
> +}
> +
>  /*
>   * mic_bias power on/off share the same register bits with
>   * output impedance of mic bias, when power on mic bias, we
> @@ -170,40 +290,79 @@ static int mic_bias_event(struct
> snd_soc_dapm_widget *w,
>  	return 0;
>  }
>  
> -/*
> - * As manual described, ADC/DAC only works when VAG powerup,
> - * So enabled VAG before ADC/DAC up.
> - * In power down case, we need wait 400ms when vag fully ramped
> down.
> - */
> -static int power_vag_event(struct snd_soc_dapm_widget *w,
> -	struct snd_kcontrol *kcontrol, int event)
> +static void vag_and_mute_control(struct snd_soc_component
> *component,
> +				 int event, int event_source,
> +				 u16 mute_mask, u16 *mute_reg)
>  {
> -	struct snd_soc_component *component =
> snd_soc_dapm_to_component(w->dapm);
> -	const u32 mask = SGTL5000_DAC_POWERUP | SGTL5000_ADC_POWERUP;
> -
>  	switch (event) {
> -	case SND_SOC_DAPM_POST_PMU:
> -		snd_soc_component_update_bits(component,
> SGTL5000_CHIP_ANA_POWER,
> -			SGTL5000_VAG_POWERUP, SGTL5000_VAG_POWERUP);
> -		msleep(400);
> +	case SND_SOC_DAPM_PRE_PMU:
> +		*mute_reg = mute_output(component, mute_mask);
> +		break;
> +	case SND_SOC_DAPM_POST_PMU:
> +		vag_power_on(component, event_source);
> +		restore_output(component, mute_mask, *mute_reg);
>  		break;
> -
>  	case SND_SOC_DAPM_PRE_PMD:
> -		/*
> -		 * Don't clear VAG_POWERUP, when both DAC and ADC are
> -		 * operational to prevent inadvertently starving the
> -		 * other one of them.
> -		 */
> -		if ((snd_soc_component_read32(component,
> SGTL5000_CHIP_ANA_POWER) &
> -				mask) != mask) {
> -			snd_soc_component_update_bits(component,
> SGTL5000_CHIP_ANA_POWER,
> -				SGTL5000_VAG_POWERUP, 0);
> -			msleep(400);
> -		}
> +		*mute_reg = mute_output(component, mute_mask);
> +		vag_power_off(component, event_source);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		restore_output(component, mute_mask, *mute_reg);
>  		break;
>  	default:
>  		break;
>  	}
> +}
> +
> +/*
> + * Mute Headphone when power it up/down.
> + * Control VAG power on HP power path.
> + */
> +static int headphone_pga_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct sgtl5000_priv *sgtl5000 =
> +		snd_soc_component_get_drvdata(component);
> +
> +	vag_and_mute_control(component, event, HP_POWER_EVENT,
> +			     SGTL5000_HP_MUTE,
> +			     &sgtl5000->mute_state.hp_event);
> +
> +	return 0;
> +}
> +
> +/* As manual describes, ADC/DAC powering up/down requires
> + * to mute outputs to avoid pops.
> + * Control VAG power on ADC/DAC power path.
> + */
> +static int adc_updown_depop(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct sgtl5000_priv *sgtl5000 =
> +		snd_soc_component_get_drvdata(component);
> +
> +	vag_and_mute_control(component, event, ADC_POWER_EVENT,
> +			     SGTL5000_OUTPUTS_MUTE,
> +			     &sgtl5000->mute_state.adc_event);
> +
> +	return 0;
> +}
> +
> +static int dac_updown_depop(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct sgtl5000_priv *sgtl5000 =
> +		snd_soc_component_get_drvdata(component);
> +
> +	vag_and_mute_control(component, event, DAC_POWER_EVENT,
> +			     SGTL5000_OUTPUTS_MUTE,
> +			     &sgtl5000->mute_state.dac_event);
>  
>  	return 0;
>  }
> @@ -280,7 +439,10 @@ static const struct snd_soc_dapm_widget
> sgtl5000_dapm_widgets[] = {
>  			    mic_bias_event,
>  			    SND_SOC_DAPM_POST_PMU |
> SND_SOC_DAPM_PRE_PMD),
>  
> -	SND_SOC_DAPM_PGA("HP", SGTL5000_CHIP_ANA_POWER, 4, 0, NULL, 0),
> +	SND_SOC_DAPM_PGA_E("HP", SGTL5000_CHIP_ANA_POWER, 4, 0, NULL,
> 0,
> +			   headphone_pga_event,
> +			   SND_SOC_DAPM_PRE_POST_PMU |
> +			   SND_SOC_DAPM_PRE_POST_PMD),
>  	SND_SOC_DAPM_PGA("LO", SGTL5000_CHIP_ANA_POWER, 0, 0, NULL, 0),
>  
>  	SND_SOC_DAPM_MUX("Capture Mux", SND_SOC_NOPM, 0, 0, &adc_mux),
> @@ -301,11 +463,12 @@ static const struct snd_soc_dapm_widget
> sgtl5000_dapm_widgets[] = {
>  				0, SGTL5000_CHIP_DIG_POWER,
>  				1, 0),
>  
> -	SND_SOC_DAPM_ADC("ADC", "Capture", SGTL5000_CHIP_ANA_POWER, 1,
> 0),
> -	SND_SOC_DAPM_DAC("DAC", "Playback", SGTL5000_CHIP_ANA_POWER, 3,
> 0),
> -
> -	SND_SOC_DAPM_PRE("VAG_POWER_PRE", power_vag_event),
> -	SND_SOC_DAPM_POST("VAG_POWER_POST", power_vag_event),
> +	SND_SOC_DAPM_ADC_E("ADC", "Capture", SGTL5000_CHIP_ANA_POWER,
> 1, 0,
> +			   adc_updown_depop, SND_SOC_DAPM_PRE_POST_PMU
> |
> +			   SND_SOC_DAPM_PRE_POST_PMD),
> +	SND_SOC_DAPM_DAC_E("DAC", "Playback", SGTL5000_CHIP_ANA_POWER,
> 3, 0,
> +			   dac_updown_depop, SND_SOC_DAPM_PRE_POST_PMU
> |
> +			   SND_SOC_DAPM_PRE_POST_PMD),
>  };
>  
>  /* routes for sgtl5000 */
> -- 
> 2.20.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
