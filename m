Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE43C28118F
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 13:51:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53AD41F15;
	Fri,  2 Oct 2020 13:50:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53AD41F15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601639465;
	bh=dfMF+gC69RMSXR2ZdWAeHaA1CgGYek6REsIfK7EMmmI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s1XSTVxXmnI84BTGdan/Y3C26mkRxpUKHOtRDHPB5S0MKlH9pjsaIsrN3yBbWNYlh
	 gLvjuY8is3VM+fqywWTVMijJkjcrAmHyNi6JmhXza039Obdhgi0mc51M1XHZTEEWDd
	 Sq69T24QBp9GgdxDZ9I2nOUCiOQXOSDlQgN1uVXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85F13F80228;
	Fri,  2 Oct 2020 13:49:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1BDDF801F9; Fri,  2 Oct 2020 13:49:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FD40F800AB
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 13:49:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FD40F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Z5DrgLMv"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 092Bn8Hq080454;
 Fri, 2 Oct 2020 06:49:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601639348;
 bh=s3DN3MeqQyiIvhI3oNKOPX1pPbCC/r3S5ZGQ31V60RA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Z5DrgLMv56Poc2oWfXOawXuLHQ2/fFzYZ6+70o9HE4e29SH6nBoficclVL18S9A9q
 kx/JmBSOo7SvJUAuw7o1Z5lvnOnmOQrm5vEUhN7y84e9M6K0/bHMH5+2Th53P2PvFW
 j22qdYl3Vuxb4yZoPUo/8d1EjsFZc3s/cFriAzlU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 092Bn8UN009228
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 2 Oct 2020 06:49:08 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 2 Oct
 2020 06:49:07 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 2 Oct 2020 06:49:08 -0500
Received: from [10.250.71.177] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 092Bn7Vu054127;
 Fri, 2 Oct 2020 06:49:07 -0500
Subject: Re: [PATCH 2/2] ASoC: tas2764: Add the driver for the TAS2764
To: Mark Brown <broonie@kernel.org>
References: <20200930163809.6978-1-dmurphy@ti.com>
 <20200930163809.6978-2-dmurphy@ti.com> <20201001162505.GO6715@sirena.org.uk>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <e579ca44-dbc8-f7ff-a4b5-3d19ce9b5d7a@ti.com>
Date: Fri, 2 Oct 2020 06:49:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201001162505.GO6715@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org
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

Mark

Thanks for the review

On 10/1/20 11:25 AM, Mark Brown wrote:
> On Wed, Sep 30, 2020 at 11:38:09AM -0500, Dan Murphy wrote:
>
> This all looks good - a few very minor things below but nothing
> substantial:
>
>> +	default:
>> +		dev_err(tas2764->dev, "Not supported evevt\n");
>> +		return -EINVAL;
> evevt -> event
OK
>
>> +static int tas2764_mute(struct snd_soc_dai *dai, int mute, int direction)
>> +{
>> +	struct snd_soc_component *component = dai->component;
>> +	int ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
>> +						TAS2764_PWR_CTRL_MASK,
>> +						mute ? TAS2764_PWR_CTRL_MUTE : 0);
>> +
>> +	if (ret < 0)
>> +		return ret;
> This looks weird with the ternery operator and extreme indentation -
> could you please at least split the declaration of ret from the call to
> make the line length a bit extreme?

I will fix it up


>> +	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
>> +	case SND_SOC_DAIFMT_I2S:
>> +	case SND_SOC_DAIFMT_DSP_A:
>> +		tdm_rx_start_slot = 1;
>> +		break;
>> +	case SND_SOC_DAIFMT_DSP_B:
>> +	case SND_SOC_DAIFMT_LEFT_J:
>> +		tdm_rx_start_slot = 0;
>> +		break;
> I'm not seeing any other handling that distinguishes between the I2S and
> DSP modes anywhere - I'm guessing this is because the device is really
> only implementing the DSP modes but because it's mono this is compatible
> with the I2S modes?  It'd be worth having a comment saying this since
> while that would be OK not distinguishing between modes properly is a
> common error in drivers so it'd help avoid cut'n'paste issues if someone
> uses this code as a reference.

Ah it does do LEFT J and Right J so I will fix this


>> +static int tas2764_register_codec(struct tas2764_priv *tas2764)
>> +{
>> +	return devm_snd_soc_register_component(tas2764->dev,
>> +					       &soc_component_driver_tas2764,
>> +					       tas2764_dai_driver,
>> +					       ARRAY_SIZE(tas2764_dai_driver));
>> +}
> This is a bit odd - can we not just inline the component registration
> rather than having this function?

I will eliminate this completely and move to i2c_probe

Dan

