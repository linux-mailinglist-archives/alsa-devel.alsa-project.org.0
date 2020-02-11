Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 962BE1594F7
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 17:31:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10E091684;
	Tue, 11 Feb 2020 17:30:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10E091684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581438665;
	bh=MeLOKVcxzFmUgj3U//1I4BRdtYMw+jt/h72//TzpdLM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HRpIniuHqqc2XSCR72uPc1zHlBQW5a3wXIm+2S7oDBYCTi2H/h/TR1V3BHewIboZ7
	 CdUmTVwxF9cD0lW5iouVrJvEdVu1RNVfX+uQgH6A9lFYG3+ZOXYZUGIonEzF/2nurC
	 dNm6S2WK99CMVfbapcH4L9+TmWfAOXHM+gOfL/pc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20411F80145;
	Tue, 11 Feb 2020 17:29:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 833F7F8013E; Tue, 11 Feb 2020 17:29:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37597F800E7
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 17:29:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37597F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OqEGPXPt"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01BGTBSI003892;
 Tue, 11 Feb 2020 10:29:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581438551;
 bh=s1rC3bq7DiLStu9i9FHCNZqJRoyzQUYiiRwZ0lgfqNk=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=OqEGPXPt5QwUNgkg/gJ83e8RQiQA1cziseyMFONvToT9J19EOR1xLkr/hYeIJDZgO
 zMlzp8JU1iAaFXl3PvZoDoIunbcxrU+RCl+QKuhLDRsgCn9enG+LnR+Te/9TR7CHk3
 CVjBpAscqMiQg6QPj6u2cgbsc5MrO1uys1f6rFVg=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01BGTBel084455
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 11 Feb 2020 10:29:11 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 11
 Feb 2020 10:29:11 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 11 Feb 2020 10:29:11 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01BGTAKw024424;
 Tue, 11 Feb 2020 10:29:10 -0600
To: Mark Brown <broonie@kernel.org>
References: <20200207194533.29967-1-dmurphy@ti.com>
 <20200207194533.29967-2-dmurphy@ti.com> <20200210135252.GK7685@sirena.org.uk>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <1148672d-4053-65cd-61dd-0039658d85a4@ti.com>
Date: Tue, 11 Feb 2020 10:24:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200210135252.GK7685@sirena.org.uk>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: tlv320adcx140: Add the
 tlv320adcx140 codec driver family
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Mark

Thanks for the review

On 2/10/20 7:52 AM, Mark Brown wrote:
> On Fri, Feb 07, 2020 at 01:45:33PM -0600, Dan Murphy wrote:
>
>> +	/* interface format */
>> +	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
>> +	case SND_SOC_DAIFMT_I2S:
>> +		iface_reg1 |=3D ADCX140_I2S_MODE_BIT;
>> +		break;
>> +	case SND_SOC_DAIFMT_LEFT_J:
>> +		iface_reg1 |=3D ADCX140_LEFT_JUST_BIT;
>> +		break;
>> +	case SND_SOC_DAIFMT_DSP_A:
>> +	case SND_SOC_DAIFMT_DSP_B:
>> +		break;
> _DSP_A and _DSP_B are two different format so I'd expect the device to
> be configured differently for them, or for only one to be supported.
Ack.=A0 I will need to adjust the TX offset for these.=A0 I will do add a =

prepare call back and set the offset there.=A0 These can fall through =

since TDM is default.
>
>> +static int adcx140_mute(struct snd_soc_dai *codec_dai, int mute)
>> +{
>> +	struct snd_soc_component *component =3D codec_dai->component;
>> +	int config_reg;
>> +	int mic_enable;
>> +	int i;
>> +
>> +	/* There is not a single register to mute.  Each enabled path has to be
>> +	 * muted individually.  Read which path is enabled and mute it.
>> +	 */
>> +	snd_soc_component_read(component, ADCX140_IN_CH_EN, &mic_enable);
>> +	if (!mic_enable)
>> +		return 0;
> You could also just offer this control to userspace, it's not
> *essential* to have this operation though it can help with glitching
> during stream startup.
>
>> +
>> +	for (i =3D 0; i < ADCX140_MAX_CHANNELS; i++) {
>> +		config_reg =3D ADCX140_CH8_CFG2 - (5 * i);
>> +		if (!(mic_enable & BIT(i)))
>> +			continue;
>> +
>> +		if (mute)
>> +			snd_soc_component_write(component, config_reg, 0);
>> +	}
> How does the unmute work?
This is unmuted through volume control.=A0 I can remove this as the device =

is muted when the volume register is set to 0.=A0 That will force the user =

to have to set a volume.
>
>> +	internal_reg =3D device_property_present(adcx140->dev,
>> +					       "ti,use-internal-areg");
>> +
>> +	if (internal_reg)
>> +		sleep_cfg_val |=3D ADCX140_AREG_INTERNAL;
> Does this actually need a specific property or could you support the
> regulator API and then use regulator_get_optional() to figure out if an
> external AVDD is attached?

Yes we could set internal AREG bit if no supply is given.

>
>> +static int adcx140_codec_probe(struct snd_soc_component *component)
>> +{
>> +	struct adcx140_priv *adcx140 =3D snd_soc_component_get_drvdata(compone=
nt);
>> +
>> +	return adc5410_init(adcx140);
>> +}
> Does the separate init function buy us anything?

No that is an artifact of my development I can move everything to =

codec_probe

Dan

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
