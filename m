Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 884D714E0E1
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 19:37:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E009D1674;
	Thu, 30 Jan 2020 19:36:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E009D1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580409453;
	bh=iA8NXe4GKVgfe4qTajIv7G20b+Kpk/C8zdccaMKtiBU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dm8NBAWX31qGJ62J8s50oHvPZ9ZCby5LY+7yU1xAPB6ZOxbZA4OIzXcL5jTLMss60
	 axlOx+H+nVblw5UqtK0IWZALzg9tr9VF43Zh8h82t+6QyUXforoxpKAr5vknOeWNoZ
	 HvENmaaWfsWuzgK6eLkmSGQ1fwnNDnZSMSMINDPs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05859F8014B;
	Thu, 30 Jan 2020 19:35:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AF29F80150; Thu, 30 Jan 2020 19:35:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACB3FF80082
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 19:35:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACB3FF80082
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jan 2020 10:35:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,382,1574150400"; d="scan'208";a="224203759"
Received: from jsmesenc-mobl.amr.corp.intel.com (HELO [10.252.140.145])
 ([10.252.140.145])
 by fmsmga008.fm.intel.com with ESMTP; 30 Jan 2020 10:35:40 -0800
To: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
References: <20200129220726.31792-1-pierre-louis.bossart@linux.intel.com>
 <20200129220726.31792-6-pierre-louis.bossart@linux.intel.com>
 <2c982980-32f2-60a4-a384-7b767fafab66@linux.intel.com>
 <615262ec-2515-ef6f-1ed4-8c42170490c4@linux.intel.com>
 <CAFQqKeV5grgKvObGf-9vYb-9M4ddq+vK=VCrPjbV9kKc1s_-Cg@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2a3c17c9-70c1-768b-4f6a-fe6ddc5cb787@linux.intel.com>
Date: Thu, 30 Jan 2020 12:35:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFQqKeV5grgKvObGf-9vYb-9M4ddq+vK=VCrPjbV9kKc1s_-Cg@mail.gmail.com>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 5/9] ASoC: SOF: Move DSP power state
 transitions to platform-specific ops
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


>>>> @@ -495,13 +645,27 @@ int hda_dsp_resume(struct snd_sof_dev *sdev)
>>>>        }
>>>>        /* init hda controller. DSP cores will be powered up during fw
>>>> boot */
>>>> -    return hda_resume(sdev, false);
>>>> +    ret = hda_resume(sdev, false);
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>> +
>>>> +    hda_dsp_set_power_state(sdev, &target_state);
>>>
>>> Return value  of hda_dsp_set_power_state() seems to be checked or
>>> directly returned in other functions, any reason to not do it here?

> This seems like a miss. We should have returned the value of
> hda_set_power_state() directly here.
> 
> And to address your point, Pierre. This is the platform-specific code, so
> the use of hda_dsp_set_power_state() should be permitted no? Whereas, the
> part that uses this function in ipc.c is not platform-specific.

Well, what do we mean by 'platform-specific'? Here we have two different 
architectures (APL and CNL) and we'll likely see more.
We can also consider that all this code is a common library for all 
HDaudio platforms. I just wanted to make sure we don't take shortcuts.

At any rate, the return value needs to be fixed, we can discuss further 
on the HDaudio code partition in future evolutions. I am not 100% happy 
with which file deals with what, things are a bit convoluted between 
hda.c hda-ctrl.c hda-dsp.c hda-pcm.c, etc.

Thanks
-Pierre
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
