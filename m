Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F29229BAB
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 17:41:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 864371662;
	Wed, 22 Jul 2020 17:41:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 864371662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595432518;
	bh=rcgm2+RrOJHjCcOwGXEleCMUQo5MyZY+BrlE4maj6lk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dKkG8PdGbZsNfzeSV+XaB8xqyBoTIIf6PLsU/dgnS4gDb39fg4j6glKToko9tZse9
	 d95RXtxsMbOSiaalnwyrkIjxdQINqBYopl8k5fOwycTnVZ4cCmGtPSYVVeeU0uB+ti
	 L08nU0K5GPPkQWW9XNVk1c2nsJbX3CCAo8fjnE3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20626F801F5;
	Wed, 22 Jul 2020 17:39:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3BE1F8015A; Wed, 22 Jul 2020 17:39:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_PASS,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E046F80150
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 17:39:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E046F80150
IronPort-SDR: A84gpGxG1KXx3qTdgZ6f45KXv7OgBGhvj5gBEB3N2XZvrHqwPaOmFlO+RAj99dnePzo/KsPoLv
 3Ty+T2lR4HpA==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="129920850"
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; d="scan'208";a="129920850"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 08:39:23 -0700
IronPort-SDR: MsNqFHz8q1bHKMvZOTP2vEUpscZSheDN/J+yc70nwRaOKUgxioD6xzDP091iR7B1Lx0PSL6GGL
 RlIS4wosbJoQ==
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; d="scan'208";a="272042508"
Received: from asinghi-mobl2.amr.corp.intel.com (HELO [10.255.231.54])
 ([10.255.231.54])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 08:39:22 -0700
Subject: Re: [PATCH v2 8/9] ASoC: qdsp6-dai: add gapless support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20200721165306.29082-1-srinivas.kandagatla@linaro.org>
 <20200721165306.29082-9-srinivas.kandagatla@linaro.org>
 <868d9768-a4c4-71c1-28fd-ca0e2f6564bf@linux.intel.com>
 <eadfd218-be93-0dc9-df94-a64ea494c6bf@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d572887f-8550-89dd-02f0-986ef081bf40@linux.intel.com>
Date: Wed, 22 Jul 2020 10:31:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <eadfd218-be93-0dc9-df94-a64ea494c6bf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 vkoul@kernel.org
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




>>> @@ -917,6 +1018,14 @@ static int q6asm_dai_compr_trigger(struct 
>>> snd_soc_component *component,
>>>           ret = q6asm_cmd_nowait(prtd->audio_client, prtd->stream_id,
>>>                          CMD_PAUSE);
>>>           break;
>>> +    case SND_COMPR_TRIGGER_NEXT_TRACK:
>>> +        prtd->next_track = true;
>>> +        prtd->next_track_stream_id = (prtd->stream_id == 1 ? 2 : 1);
>>
>> it's rather odd, the initialization above uses next_track_stream_id = 0?
> 
> Vaild stream ids start from 1, So we are toggling this between 1 and 2.
> So when we set next_track_stream_id to 0, that means we have opened the 
> new next stream id and is set to prtd->stream_id. This logic is to 
> ensure that we are not going to open next stream id twice!

ok, adding a comment would be good to show this was intentional and not 
a mistake.
