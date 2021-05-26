Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D95391B64
	for <lists+alsa-devel@lfdr.de>; Wed, 26 May 2021 17:14:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB7111736;
	Wed, 26 May 2021 17:13:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB7111736
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622042042;
	bh=lMNsY65BW7EhgYWs2guDgDSuBZxaUdBRSjf/KPcmA9I=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R3MU0Ag5VRJ0gjMbWM5RCuYi99n7W1QVzMtPZN7vpS+aAeHsID3Ba79y+D1C+Oz0e
	 mMqdsk9iG+yEna25zhguX8McmLZsF5xp5ogxclboPpIFq4vsMfbLRpH4m9g7/Z/7Yd
	 saCHkli+0vTRZLgfQkAodZXIFBt0yE2tgwxXQUlc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F80FF8024E;
	Wed, 26 May 2021 17:12:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A940F8025C; Wed, 26 May 2021 17:12:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E3B1F8011B
 for <alsa-devel@alsa-project.org>; Wed, 26 May 2021 17:12:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E3B1F8011B
IronPort-SDR: 4Vs0MD5OeaKgHCMf2E4cssTpbpQesoDw/RLhtlyEPa5cS7nHjb1iwanfWHPbKxX7n8NWYcbvty
 MRBqexSVLSSA==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="223675288"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="223675288"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 08:12:20 -0700
IronPort-SDR: p8RSury1/u7Qkr2YDVO/S/8sJRUipHiMLslqo0W2NNr8zF3G39VefdMoyaqDXJ8wOz56ibQJ6s
 afc/tkIQHDzg==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="464840848"
Received: from dlpatter-mobl1.amr.corp.intel.com (HELO [10.254.179.123])
 ([10.254.179.123])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 08:12:19 -0700
Subject: Re: Sparse errors
To: Takashi Iwai <tiwai@suse.de>
References: <6b86f44e-82e0-3530-b579-1b054f459880@linux.intel.com>
 <s5ha6oiaqo6.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <afaf87c4-7ad9-626c-efb0-2b1c254950da@linux.intel.com>
Date: Wed, 26 May 2021 09:17:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <s5ha6oiaqo6.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Colin Ian King <colin.king@canonical.com>, alsa-devel@alsa-project.org,
 Dan Carpenter <dan.carpenter@oracle.com>
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



On 5/26/21 2:40 AM, Takashi Iwai wrote:
> On Tue, 25 May 2021 21:32:27 +0200,
> Pierre-Louis Bossart wrote:
>>
>> Hi Takashi,
>> Sparse reports a lot of new issues in our last checks with more options:
>>
>> export ARCH=x86_64 CF="-Wsparse-error -Wsparse-all
>> -Wno-bitwise-pointer -Wno-pointer-arith -Wno-typesign -Wnoshadow
>> -Wno-sizeof-bool"
>> make -k sound/ C=2
>>
>> most are linked to the __user and pcm_format_t restricted types, but I
>> found the simpler ones below which are useless comparisons. I can send
>> a patch for the last but not sure how to address the first two.
>>
>> Thanks for your feedback
>> -Pierre
>>
>> sound/core/info.c:95:38: error: self-comparison always evaluates to false
>>
>> 	if (pos < 0 || (long) pos != pos || (ssize_t) count < 0)
>> 		return false;
>>
>> not sure what the second comparison is meant to check?
> 
> As Dan suggested, it's a check only for 32bit architecture for a 64bit
> value.

Isn't there a better way to check this?

>> sound/drivers/opl3/opl3_midi.c:183:60: error: self-comparison always
>> evaluates to false
>>
>> This indeed makes no sense. the voice_time and vp->time are not
>> changed in the loop, the test is either redundant or something else is
>> missing.
> 
> The code doesn't look right, indeed.  It's likely meant to be vp2
> instead of vp.
> 
> --- a/sound/drivers/opl3/opl3_midi.c
> +++ b/sound/drivers/opl3/opl3_midi.c
> @@ -180,8 +180,7 @@ static int opl3_get_voice(struct snd_opl3 *opl3, int instr_4op,
>   			if (vp2->state == SNDRV_OPL3_ST_ON_2OP) {
>   				/* kill two voices, EXPENSIVE */
>   				bp++;
> -				voice_time = (voice_time > vp->time) ?
> -					voice_time : vp->time;
> +				voice_time = max(voice_time, vp2->time);
>   			}
>   		} else {
>   			/* allocate 2op voice */

It's really old code, unchanged since the first git commit in 2005... 
Are you comfortable changing this code? One of those cases where if 
people didn't notice an issue in 16+ years maybe no one cares or even 
uses this driver...

>> sound/pci/lx6464es/lx_core.c:677:34: error: self-comparison always
>> evaluates to false
>>
>> That seems like dead code indeed:
>>
>> 	u32 channels = runtime->channels;
>>
>> 	if (runtime->channels != channels)
>> 		dev_err(chip->card->dev, "channel count mismatch: %d vs %d",
>> 			   runtime->channels, channels);
> 
> Yes, this can be deleted.

I'll send a patch for this, thanks for the feedback.
