Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A94195D75
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 19:18:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 989F71674;
	Fri, 27 Mar 2020 19:18:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 989F71674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585333131;
	bh=I530du9cewxY+fwKu962hVfPniabUbbbKQHbcl0VoKs=;
	h=From:Subject:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OZY8NeT1xgr2ZPMlmzcZB7l52Zm+mgK+gZXZrA/hGpyVZIA4gEfzoPhyDP25O55h6
	 wCP2ZIEd+TfusgX2GvsYhsdADApa0uwdc4cuOhlH3h0CNpUFeSv2DeV57/yJpnhA/g
	 Tl0xEPWGZGmKsy4nP0bEzvFTcE5IqymoGkfUts9g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 934AEF80248;
	Fri, 27 Mar 2020 19:17:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8460F80218; Fri, 27 Mar 2020 19:17:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E2A0F8011E
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 19:17:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E2A0F8011E
IronPort-SDR: pD1zoRJg/fMhNEJl+NjYO1nsQbUIeuLvaqgGm3Ouq/65TZ8XT615oBDj3WC3KK7midm3J1UqR6
 nzTgsCxM0HAg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 11:16:58 -0700
IronPort-SDR: 4H5oQlhkYWqiO1nRaCWjgojTQKlKmlLKLRe0YHIbkZAfe1EHI4yV47sofltH9yl0eZtFPRqgK5
 60qcjPBwsfnw==
X-IronPort-AV: E=Sophos;i="5.72,313,1580803200"; d="scan'208";a="394453808"
Received: from aslawinx-mobl1.ger.corp.intel.com (HELO [10.249.133.141])
 ([10.249.133.141])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 11:16:56 -0700
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: topology: Add missing memory checks
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
References: <20200320181345.31565-1-amadeuszx.slawinski@linux.intel.com>
 <4634e6654473722fca5f509ffb535535c4f6fbac.camel@linux.intel.com>
Message-ID: <26f6c297-7e9e-e49c-a417-796a9ccd9b07@linux.intel.com>
Date: Fri, 27 Mar 2020 19:16:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <4634e6654473722fca5f509ffb535535c4f6fbac.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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

On 3/21/2020 1:18 AM, Ranjani Sridharan wrote:

(...)

>>   	if (pcm->compress)
>> @@ -1835,11 +1849,7 @@ static int soc_tplg_dai_create(struct soc_tplg
>> *tplg,
>>   	ret = soc_tplg_dai_load(tplg, dai_drv, pcm, NULL);
>>   	if (ret < 0) {
>>   		dev_err(tplg->comp->dev, "ASoC: DAI loading failed\n");
>> -		kfree(dai_drv->playback.stream_name);
>> -		kfree(dai_drv->capture.stream_name);
>> -		kfree(dai_drv->name);
>> -		kfree(dai_drv);
>> -		return ret;
>> +		goto err;
>>   	}
>>   
>>   	dai_drv->dobj.index = tplg->index;
>> @@ -1857,9 +1867,17 @@ static int soc_tplg_dai_create(struct soc_tplg
>> *tplg,
>>   	if (ret != 0) {
>>   		dev_err(dai->dev, "Failed to create DAI widgets %d\n",
>> ret);
>>   		snd_soc_unregister_dai(dai);
>> -		return ret;
>> +		goto err;
> Hi Amadeusz,
> 
> I think this is not needed. Once the dai_drv is added to the dobj_list,
> upon a failure here, the tplg components will be removed and this will
> be taken care of. So it is safe to just return ret here.

Hi,
you are right will do in v2.

(...)
>>   
>>   	if (d->capture) {
>>   		stream = &dai_drv->capture;
>>   		caps = &d->caps[SND_SOC_TPLG_STREAM_CAPTURE];
>> -		set_stream_info(stream, caps);
>> +		ret = set_stream_info(stream, caps);
>> +		if (ret < 0)
>> +			goto err;
>>   	}
>>   
>>   	if (d->flag_mask)
>> @@ -2454,10 +2485,16 @@ static int soc_tplg_dai_config(struct
>> soc_tplg *tplg,
> The return value of soc_tplg_dai_config() in soc_tplg_dai_elems_load()
> is never checked. So maybe we need a follow-up patch to fix that too?
> 

Yes, actually there is few more functions where status is not checked, 
will add checks for them too.

Amadeusz
