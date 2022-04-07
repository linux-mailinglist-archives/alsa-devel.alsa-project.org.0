Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AEA4F811B
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 15:58:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B476A1748;
	Thu,  7 Apr 2022 15:57:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B476A1748
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649339920;
	bh=kk7NhQcAK/XdGiF/LKoqPfZ505ncylyO6/swBP7AGTM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qYGERH89UP0Yq1237fu2QRSdExxYdw8qvRWhRvtyALFjm1VcUZGVqirID2mHo6Gm9
	 jyZTZpqRDIYX3XQZrlEG2ZSGP9G974CK+34AA+GpCIp1WkNFEPayrlBTUbejUoH84h
	 L/hnfCcpirYWjVLcSzwQXFm+laLP7X4kCTiRFqyI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06C41F8026A;
	Thu,  7 Apr 2022 15:57:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09F9BF8024C; Thu,  7 Apr 2022 15:57:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F7B7F80085
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 15:57:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F7B7F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Urabs4A7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649339857; x=1680875857;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kk7NhQcAK/XdGiF/LKoqPfZ505ncylyO6/swBP7AGTM=;
 b=Urabs4A7i3TKJWAq2PTtPFnj13dzbr9QV02eRCsu48dFltUYtiBJj6n8
 EmkBRMsf20ND8Tokhs4TVt0ZmfgDmHKwp7Tj3CFpLBBF3jttEmfpLHYg5
 v5ktH7daDOGKTNKca2x7ic+dHvjEQjdq3jhsFU6L5Wm/388f8syrx44wV
 mvLvP61shqDg0qU7RTZkeJf0TvI2/Z+cH01Ae1FEKjDLsl+PlXp8qUDLG
 JgQMTKS4j+rrgNNVml3GpWsGywHH4by96tT5TSuVoJUzgx+qrKSiT7Vyp
 UCrygW6aFBJZZmbK3qAcOl3/67XNSBk7z6E1kzRUILCuKUpEO5dCfYNZd g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10309"; a="261320101"
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="261320101"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 06:57:32 -0700
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="524373853"
Received: from achordiy-mobl.amr.corp.intel.com (HELO [10.209.88.227])
 ([10.209.88.227])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 06:57:31 -0700
Message-ID: <cbea05d4-ed7b-d0d7-53a6-80add0d8ffe2@linux.intel.com>
Date: Thu, 7 Apr 2022 08:23:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] ASoC: soc-pcm: improve BE transition for PAUSE_RELEASE
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, alsa-devel@alsa-project.org
References: <20220406190056.233481-1-pierre-louis.bossart@linux.intel.com>
 <20220406190056.233481-2-pierre-louis.bossart@linux.intel.com>
 <bf8b2067-3d5d-c368-68b0-f5ab58d9c5b7@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <bf8b2067-3d5d-c368-68b0-f5ab58d9c5b7@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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


>> diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
>> index 75b92d883976..5b689c663290 100644
>> --- a/include/sound/soc-dpcm.h
>> +++ b/include/sound/soc-dpcm.h
>> @@ -103,6 +103,8 @@ struct snd_soc_dpcm_runtime {
>>       int trigger_pending; /* trigger cmd + 1 if pending, 0 if not */
>>       int be_start; /* refcount protected by BE stream pcm lock */
>> +    int be_pause; /* refcount protected by BE stream pcm lock */
>> +    bool fe_pause; /* used to track STOP after PAUSE */
>>   };
>>   #define for_each_dpcm_fe(be, stream, _dpcm)                \
>> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
>> index 11c9853e9e80..e8700dd1839f 100644
>> --- a/sound/soc/soc-pcm.c
>> +++ b/sound/soc/soc-pcm.c
>> @@ -2090,6 +2090,7 @@ int dpcm_be_dai_trigger(struct 
>> snd_soc_pcm_runtime *fe, int stream,
>>                      int cmd)
>>   {
>>       struct snd_soc_pcm_runtime *be;
>> +    bool pause_stop_transition;
>>       struct snd_soc_dpcm *dpcm;
>>       unsigned long flags;
>>       int ret = 0;
>> @@ -2148,10 +2149,12 @@ int dpcm_be_dai_trigger(struct 
>> snd_soc_pcm_runtime *fe, int stream,
>>           case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>>               if (!be->dpcm[stream].be_start &&
>>                   (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START) &&
>> -                (be->dpcm[stream].state != SND_SOC_DPCM_STATE_STOP) &&
>>                   (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
>>                   goto next;
>> +            fe->dpcm[stream].fe_pause = false;
>> +            be->dpcm[stream].be_pause--;
>> +
>>               be->dpcm[stream].be_start++;
>>               if (be->dpcm[stream].be_start != 1)
>>                   goto next;
>> @@ -2175,14 +2178,33 @@ int dpcm_be_dai_trigger(struct 
>> snd_soc_pcm_runtime *fe, int stream,
>>               if (be->dpcm[stream].be_start != 0)
>>                   goto next;
>> -            ret = soc_pcm_trigger(be_substream, cmd);
>> +            pause_stop_transition = false;
>> +            if (fe->dpcm[stream].fe_pause) {
> 
> As you access fe here anyway, any chance something like
> if (fe->dpcm[stream].state == SND_SOC_DPCM_STATE_PAUSED)
> can be used here instead of adding fe_pause to snd_soc_dpcm_runtime?

I didn't want to make any assumption on whether the state of the FE is 
updated before or after the BE state, depending on the trigger order, so 
only used the trigger command to drive the state machine changes.

>> +                pause_stop_transition = true;
>> +                fe->dpcm[stream].fe_pause = false;
>> +                be->dpcm[stream].be_pause--;
>> +            }
>> +
>> +            if (be->dpcm[stream].be_pause != 0)
>> +                ret = soc_pcm_trigger(be_substream, 
>> SNDRV_PCM_TRIGGER_PAUSE_PUSH);
>> +            else
>> +                ret = soc_pcm_trigger(be_substream, 
>> SNDRV_PCM_TRIGGER_STOP);
>> +
>>               if (ret) {
>>                   if (be->dpcm[stream].state == SND_SOC_DPCM_STATE_START)
>>                       be->dpcm[stream].be_start++;
>> +                if (pause_stop_transition) {
>> +                    fe->dpcm[stream].fe_pause = true;
>> +                    be->dpcm[stream].be_pause++;
>> +                }
>>                   goto next;
>>               }
>> -            be->dpcm[stream].state = SND_SOC_DPCM_STATE_STOP;
>> +            if (be->dpcm[stream].be_pause != 0)
>> +                be->dpcm[stream].state = SND_SOC_DPCM_STATE_PAUSED;
>> +            else
>> +                be->dpcm[stream].state = SND_SOC_DPCM_STATE_STOP;
>> +
>>               break;
>>           case SNDRV_PCM_TRIGGER_SUSPEND:
>>               if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START)
>> @@ -2204,6 +2226,9 @@ int dpcm_be_dai_trigger(struct 
>> snd_soc_pcm_runtime *fe, int stream,
>>               if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START)
>>                   goto next;
>> +            fe->dpcm[stream].fe_pause = true;
>> +            be->dpcm[stream].be_pause++;
>> +
>>               be->dpcm[stream].be_start--;
>>               if (be->dpcm[stream].be_start != 0)
>>                   goto next;
> 
