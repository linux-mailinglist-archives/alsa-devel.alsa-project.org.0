Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C82AB29F1C7
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 17:42:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57B721662;
	Thu, 29 Oct 2020 17:42:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57B721662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603989774;
	bh=SyGrlEpjFORwPkmgv+bXejVCTHmJTo5o7gGyL1/KRIk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pM3qxE71346YpFOxUC+twQ23E/ev8p3BA0vVXfASoyO0+wbhbyQLHPGQyKtTSM6j2
	 spOjamxZI8F96jUA5FCNNE2T7MoZQbIyMK+GT0bdORSU3Y0qiplxM4GJiW9tttU1mg
	 w8WdpKm4N00ixrBBrfdcnbiE3+YOkovp8y7WgMSw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFB83F8027C;
	Thu, 29 Oct 2020 17:40:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98832F80257; Thu, 29 Oct 2020 17:40:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B2A6F801D8
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 17:40:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B2A6F801D8
IronPort-SDR: JLMIUW9eWapnwsf2g3o8tnDgOjJjtTYb1zlsQf6kyPgqqZzXNmqFo2ablgBYRtWqFwoBbV6B5R
 mClQpH79GHSw==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="168563725"
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; d="scan'208";a="168563725"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 09:40:13 -0700
IronPort-SDR: JaKZ/IpGt00sRFUFqzHU9FlhQKtpCO+nO/jdGeLXF1ZjRS28LRr/8L7Qq86LL7V1h5EBBy815c
 lRNN9BrWC7EA==
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; d="scan'208";a="323762878"
Received: from mghaffa-mobl1.amr.corp.intel.com (HELO [10.212.235.9])
 ([10.212.235.9])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 09:40:12 -0700
Subject: Re: [PATCH 1/2] ASoC: soc-compress: tidyup STREAM vs COMPRESS
To: Takashi Iwai <tiwai@suse.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87wnzcfnkk.wl-kuninori.morimoto.gx@renesas.com>
 <87v9ewfnj9.wl-kuninori.morimoto.gx@renesas.com>
 <699d5b33-d88f-ba08-7d63-61ec9fbdc5d8@linux.intel.com>
 <87mu06djl8.wl-kuninori.morimoto.gx@renesas.com>
 <87imatex9q.wl-kuninori.morimoto.gx@renesas.com>
 <s5hsg9xwm0h.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <200088ab-d186-4c28-ea4a-ed92c105d187@linux.intel.com>
Date: Thu, 29 Oct 2020 10:33:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <s5hsg9xwm0h.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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




>>>> enum snd_compr_direction {
>>>> 	SND_COMPRESS_PLAYBACK = SNDRV_PCM_STREAM_PLAYBACK,
>>>> 	SND_COMPRESS_CAPTURE = SNDRV_PCM_STREAM_CAPTURE
>>>> };
>>>>
>>>> Or remove this duplication completely and get rid of snd_compr_direction?
>>>>
>>>> I find it odd to convert two things that had no reason to be different
>>>> in the first place.
>>>
>>> Yes I agree with you.
>>> I'm not sure why this duplication was created,
>>> but my patch tried to make it sane.
>>> If Mark can agree, I can post snd_compr_direction remove patch.
>>
>> Oops, snd_compr_direction was uapi.
>> We can't remove it, and can't use your above suggestion...

I knew I was missing something... Thanks for correcting my flawed assertion.

> Right, such uapi can't be removed.
> 
> Essentially both compress and PCM definitions are identical, and can
> be never different because of ABI compatibility, which means it's safe
> to mix both variants in the code.  If you're unsure, we may add
> BUILD_BUG_ON() to check the coincidence of both values.


In case we add this BUILD_BUG_ON(), can we keep the code as is then, 
there's no need to convert values?
