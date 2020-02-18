Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4489816292A
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 16:17:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B92361696;
	Tue, 18 Feb 2020 16:16:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B92361696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582039058;
	bh=Cqaa2L2MjKGvDC1RqclGXQ+LvvBK8o8RTNYD1UV15PE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MRbMbpzZ17Q+2oq5R4UMIix5QHPxrVrL/bLwbm5gGkov7DugrFUguzYaG3A5dfiHG
	 2XEqUGuJMUqtZVunKp9Ig4OXiYHx05E+icioH8pYpfGNf7KJ4habR3XWdKrQpipmuG
	 ygbQNvLXjC53RDaPccHmn21W6TnNJrKk6LbaT8Qs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C96D4F8014A;
	Tue, 18 Feb 2020 16:15:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77386F80148; Tue, 18 Feb 2020 16:15:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AAE3F800C4
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 16:15:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AAE3F800C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="zJ9PC+sa"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01IFFmX6090741;
 Tue, 18 Feb 2020 09:15:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582038948;
 bh=g7CZ22E9Atxx53T54UZaa8VzKxWPPc31ojdRcNza8bc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=zJ9PC+saejh46Of6QW2dFH2redqRaK99p/OiX29Vdpq2bwpD+bHlq+E3Fh8yopM99
 I/26yU3sNuM0HI+54L04lAYpSpW/EcebdbbpnYSFjq8ocZPAFnrgffwUIOYmM5gpUu
 Uep1knp/sByK6quH10wI4ngBFPboc5v2sPld0XM4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01IFFmUB055288
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 18 Feb 2020 09:15:48 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 18
 Feb 2020 09:15:47 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 18 Feb 2020 09:15:47 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01IFFi7U067542;
 Tue, 18 Feb 2020 09:15:44 -0600
Subject: Re: [PATCH] ASoC: cpcap: Implement set_tdm_slot for voice call support
To: Tony Lindgren <tony@atomide.com>
References: <20200211181005.54008-1-tony@atomide.com>
 <ae2b7d9e-d05e-54ac-4f18-27cc8c4e81a0@ti.com>
 <20200212144620.GJ64767@atomide.com>
 <9a060430-5a3e-61e1-3d2c-f89819d9436f@ti.com>
 <20200217232325.GD35972@atomide.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <8fc1dded-6d28-f5cd-f2f9-3a6810571119@ti.com>
Date: Tue, 18 Feb 2020 17:15:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200217232325.GD35972@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Merlijn Wajer <merlijn@wizzup.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Sebastian Reichel <sre@kernel.org>, "Arthur D ." <spinal.by@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
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

Hi Tony,

On 18/02/2020 1.23, Tony Lindgren wrote:
> * Peter Ujfalusi <peter.ujfalusi@ti.com> [200214 13:30]:
>> Hi Tony,
>>
>> On 12/02/2020 16.46, Tony Lindgren wrote:
>>> * Peter Ujfalusi <peter.ujfalusi@ti.com> [200212 09:18]:
>>>> On 11/02/2020 20.10, Tony Lindgren wrote:
>>>>> +static int cpcap_voice_set_tdm_slot(struct snd_soc_dai *dai,
>>>>> +				    unsigned int tx_mask, unsigned int rx_mask,
>>>>> +				    int slots, int slot_width)
>>>>> +{
>>>>> +	struct snd_soc_component *component = dai->component;
>>>>> +	struct cpcap_audio *cpcap = snd_soc_component_get_drvdata(component);
>>>>> +	int err, ts_mask, mask;
>>>>> +	bool voice_call;
>>>>> +
>>>>> +	/*
>>>>> +	 * Primitive test for voice call, probably needs more checks
>>>>> +	 * later on for 16-bit calls detected, Bluetooth headset etc.
>>>>> +	 */
>>>>> +	if (tx_mask == 0 && rx_mask == 1 && slot_width == 8)
>>>>> +		voice_call = true;
>>>>> +	else
>>>>> +		voice_call = false;
>>>>
>>>> You only have voice call if only rx slot0 is in use?
>>>
>>> Yeah so it seems. Then there's the modem to wlcore bluetooth path that
>>> I have not looked at. But presumably that's again just configuring some
>>> tdm slot on the PMIC.
>>>
>>>> If you record mono on the voice DAI, then rx_mask is also 1, no?
>>>
>>> It is above :) But maybe I don't follow what you're asking here
>>
>> If you arecrod -Dvoice_pcm -c1 -fS8 > /dev/null
>> then it is reasonable that the machine driver will set rx_mask = 1
>>
>>> and maybe you have some better check in mind.
>>
>> Not sure, but relying on set_tdm_slots to decide if we are in a call
>> case does not sound right.
> 
> OK yeah seems at least bluetooth would need to be also handled
> in the set_tdm_slots.

set_tdm_slots() is for setting how the TDM slots supposed to be used by
the component and not really for things to configure different operating
modes.

If you hardwire things in set_tdm_slots() for the droid4 then how the
codec driver can be reused in other setups?

>>>> You will also set the sampling rate for voice in
>>>> cpcap_voice_hw_params(), but that is for normal playback/capture, right?
>>>
>>> Yeah so normal playback/capture is already working with cpcap codec driver
>>> with mainline Linux. The voice call needs to set rate to 8000.
>>
>> But if you have a voice call initiated should not the rate be set by the
>> set_sysclk()?
> 
> Hmm does set_sysclk called from modem codec know that cpcap codec
> is the clock master based on bitclock-master and set the rate
> for cpcap codec?

Neither component should call set_sysclk, set_tdm_slots. The machine
driver should as it is the only one who know how things are wired...

> 
>>>> It feels like that these should be done via DAPM with codec to codec route?
>>>
>>> Sure if you have some better way of doing it :) Do you have an example to
>>> point me to?
>>
>> Something along the lines of:
>> https://mailman.alsa-project.org/pipermail/alsa-devel/2020-February/162915.html
>>
>> The it is a matter of building and connecting the DAPM routes between
>> the two codec and with a flip of the switch you would have audio flowing
>> between them.
> 
> Sounds good to me.
> 
> Tony
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
