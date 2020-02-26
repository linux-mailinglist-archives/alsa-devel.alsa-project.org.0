Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F2B16FF53
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 13:50:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 974A41674;
	Wed, 26 Feb 2020 13:49:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 974A41674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582721425;
	bh=SWB6Y0Dwk8JU2w0W/ARBfP+E6K24+GUyWwrgc6CzqsQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ciR9FsM0xFYL4/YKAulVVyVtBTUHVIJa6iNb1Cy0voa7AIFNdUIV276ZzDdVtX0mn
	 Cq4eOKb6AMxvfVb2uHJZVrAiU0J6r4l0vNLKwR8elhUic6HyGBLEiiFnJgj72RWQwD
	 AknZHzR+EUNCRNxtEjBieZpDLr4TdJwKS+d2mago=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE523F80089;
	Wed, 26 Feb 2020 13:48:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A45ECF8014D; Wed, 26 Feb 2020 13:48:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1677CF80089
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 13:48:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1677CF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lnuYzxX5"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01QCmZSG092302;
 Wed, 26 Feb 2020 06:48:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582721315;
 bh=qYQrOZJn5DkQX/MgteHrOqOgtCv5LvbVJDJqYH5KvWA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=lnuYzxX5dli5VPGe/9GbcvvVESpz8K/mX656tRgSJI7oWHR14eOmqJ62B3rymIWA3
 QXz1tp+AicYaIK1lPI3dIEH2GVq5E/RZ2EWoWzTBmXtbw0F26C2IoDGrDzbgJ/Ac6A
 I71s7IlJSn1NML1WhPUgXPGzblldmwVzYqwvyAr0=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01QCmZjq006680
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 26 Feb 2020 06:48:35 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 26
 Feb 2020 06:48:34 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 26 Feb 2020 06:48:34 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01QCmYN7040385;
 Wed, 26 Feb 2020 06:48:34 -0600
Subject: Re: [PATCH v3 2/2] ASoC: tlv320adcx140: Add the tlv320adcx140 codec
 driver family
To: Ricard Wanderlof <ricardw@axis.com>
References: <20200219125942.22013-1-dmurphy@ti.com>
 <20200219125942.22013-3-dmurphy@ti.com>
 <alpine.DEB.2.20.2002261138040.19469@lnxricardw1.se.axis.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <62c9be55-7ca7-eeaa-52e6-2b93783769a1@ti.com>
Date: Wed, 26 Feb 2020 06:43:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.2002261138040.19469@lnxricardw1.se.axis.com>
Content-Type: text/plain; charset="iso-8859-15"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "broonie@kernel.org" <broonie@kernel.org>
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

Richard

On 2/26/20 5:18 AM, Ricard Wanderlof wrote:
> On Wed, 19 Feb 2020, Dan Murphy wrote:
>
>> Add the tlv320adcx140 codec driver family.
>>
> ...
>
>> +
>> +static int adcx140_set_dai_fmt(struct snd_soc_dai *codec_dai,
>> +                              unsigned int fmt)
>> +{
>> +       struct snd_soc_component *component = codec_dai->component;
>> +       struct adcx140_priv *adcx140 =
>> snd_soc_component_get_drvdata(component);
>> +       u8 iface_reg1 = 0;
>> +       u8 iface_reg2 = 0;
>> +
>> +       /* set master/slave audio interface */
>> +       switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
>> +       case SND_SOC_DAIFMT_CBM_CFM:
>> +               iface_reg2 |= ADCX140_BCLK_FSYNC_MASTER;
> Although this sets up the codec to be I2S master, there doesn't seem to be
> a way of actually configuring the master clock frequency in master mode,
> as there is no .set_sysclk member in adcx140_dai_ops (and the
> corresponding register field appears never to be touched by the driver).

Thanks for the comments.  The driver was written for the device to be in 
slave mode with auto clock configuration set.

I will look into adding the master mode clock settings.

>
>> +               break;
>> +       case SND_SOC_DAIFMT_CBS_CFS:
>> +               break;
>> +       case SND_SOC_DAIFMT_CBS_CFM:
>> +       case SND_SOC_DAIFMT_CBM_CFS:
>> +       default:
>> +               dev_err(component->dev, "Invalid DAI master/slave interface\n");
>> +               return -EINVAL;
>> +       }
> ...
>
>> +
>> +static int adcx140_codec_probe(struct snd_soc_component *component)
>> +{
>> +       struct adcx140_priv *adcx140 =
>> snd_soc_component_get_drvdata(component);
>> +       int sleep_cfg_val = ADCX140_WAKE_DEV;
>> +       u8 bias_source;
>> +       u8 vref_source;
>> +       int ret;
>> +
>> +       ret = device_property_read_u8(adcx140->dev, "ti,mic-bias-source",
>> +                                     &bias_source);
>> +       if (ret)
>> +               bias_source = ADCX140_MIC_BIAS_VAL_VREF;
>> +
>> +       if (bias_source != ADCX140_MIC_BIAS_VAL_VREF &&
>> +           bias_source != ADCX140_MIC_BIAS_VAL_VREF_1096 &&
>> +           bias_source != ADCX140_MIC_BIAS_VAL_AVDD) {
>> +               dev_err(adcx140->dev, "Mic Bias source value is invalid\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       ret = device_property_read_u8(adcx140->dev, "ti,vref-source",
>> +                                     &vref_source);
>> +       if (ret)
>> +               vref_source = ADCX140_MIC_BIAS_VREF_275V;
>> +
>> +       if (vref_source != ADCX140_MIC_BIAS_VREF_275V &&
>> +           vref_source != ADCX140_MIC_BIAS_VREF_25V &&
>> +           vref_source != ADCX140_MIC_BIAS_VREF_1375V) {
> According to the data sheet, this setting controls the ADC full scale
> setting and has nothing to do with the mic bias voltage, hence using
> MIC_BIAS as part of the macro name is misleaading.
>
These are not macros they are #defines but in any event I can change the 
names as they are all local to the c and h files.
>> +               dev_err(adcx140->dev, "Mic Bias source value is invalid\n");
> Error text does not reflect the actual error, suggest "VREF value is
> invalid".

Ack

Dan


