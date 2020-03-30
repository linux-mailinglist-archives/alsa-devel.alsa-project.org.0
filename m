Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CDC19851F
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 22:09:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B7B81655;
	Mon, 30 Mar 2020 22:09:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B7B81655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585598992;
	bh=TDrx4vLSl2+txCh0mH6vNAiFpiWZKGjMWjGFhFuO0yo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eLw8xNjiYEl85Rbu18CzPHQxtXx8+Y21R2Dhadb4vrlKshvna2FvQFLATf233zDwk
	 KxGxRe/MZvYTZHeuH5iVg9TZC/ReC3nmx3ZwZUXrOlQGbwaI9W85GMH+D2LGHkU4X8
	 +fNn15SZuUKZ7p+VVu6jtsl1Z62j+3xFi/7p/3j0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1ED9DF8028C;
	Mon, 30 Mar 2020 22:07:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92E47F8014A; Mon, 30 Mar 2020 22:07:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78CB6F80148
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 22:07:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78CB6F80148
IronPort-SDR: 2NbMc8qoAf3c7h/0UgHczUnKYtjR5c8X5f3AKcfmxxYuUmeTKPjfa0KF9TRpB512v+T/KCI+3G
 Avn0vwqBtD1Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2020 13:07:01 -0700
IronPort-SDR: FBmhe8AthXB0+KVrywlHCmh18zmuctcn0kZClWFnFfO1lPsQnKs30eiDaLc9PW5F6bGIFcySY2
 oygEEr5izKkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,325,1580803200"; d="scan'208";a="248816622"
Received: from unknown (HELO [10.134.63.32]) ([10.134.63.32])
 by orsmga003.jf.intel.com with ESMTP; 30 Mar 2020 13:07:00 -0700
Subject: Re: [PATCH] ASoC: qcom: q6asm-dai: Add SNDRV_PCM_INFO_BATCH flag
To: Lars-Peter Clausen <lars@metafoo.de>,
 Stephan Gerhold <stephan@gerhold.net>, Mark Brown <broonie@kernel.org>
References: <20200330175210.47518-1-stephan@gerhold.net>
 <ca71ef4e-069f-af8b-ae43-bdd5a3e45be0@metafoo.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3ac5fe32-8292-ce3a-f586-32d556efc98c@linux.intel.com>
Date: Mon, 30 Mar 2020 13:52:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <ca71ef4e-069f-af8b-ae43-bdd5a3e45be0@metafoo.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Patrick Lai <plai@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht
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



On 3/30/20 1:15 PM, Lars-Peter Clausen wrote:
> On 3/30/20 7:52 PM, Stephan Gerhold wrote:
>> At the moment, playing audio with PulseAudio with the qdsp6 driver
>> results in distorted sound. It seems like its timer-based scheduling
>> does not work properly with qdsp6 since setting tsched=0 in
>> the PulseAudio configuration avoids the issue.
>>
>> Apparently this happens when the pointer() callback is not accurate
>> enough. There is a SNDRV_PCM_INFO_BATCH flag that can be used to stop
>> PulseAudio from using timer-based scheduling by default.
>>
>> According to 
>> https://www.alsa-project.org/pipermail/alsa-devel/2014-March/073816.html:
>>
>>      The flag is being used in the sense explained in the previous audio
>>      meeting -- the data transfer granularity isn't fine enough but 
>> aligned
>>      to the period size (or less).
>>
>> q6asm-dai reports the position as multiple of
>>
>>      prtd->pcm_count = snd_pcm_lib_period_bytes(substream)
>>
>> so it indeed just a multiple of the period size.
>>
>> Therefore adding the flag here seems appropriate and makes audio
>> work out of the box.
>>
>> Fixes: 2a9e92d371db ("ASoC: qdsp6: q6asm: Add q6asm dai driver")
>> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
>> ---
>> I'm still quite confused about the true meaning of SNDRV_PCM_INFO_BATCH,
>> so please correct me if I'm wrong :)
> 
> The meaning might have changed over the years, but the way it is used 
> right now is that it means that the position pointer has limited 
> granularity. With 'limited' being a bit fuzzy, but typically means that 
> the granularity is worse than a few samples.
> 
> This driver definitely falls into the limited category as the 
> granularity seems to be period size.

Agree, we added this INFO_BATCH flag for SOF Broadwell and Baytrail 
platforms as well for the same reason of large granularity.

