Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE003C708F
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 14:41:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5E5116DB;
	Tue, 13 Jul 2021 14:40:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5E5116DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626180071;
	bh=EjpHeCmPVe9zGWbOawzFWTHINmWF7wRVl+MoXtdX5NY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=opOqUiBeVnaz2SJ4fKqjnv+6re2nxTslzDg4ugDiqntCkhU6hkHzGp0rA138jzNRJ
	 oUT/GasUBb2gLEkuI7UCVvMtRF6J1DH3oLnAhCBh6wdILOvDJPMKsSSwivMDREadXw
	 uPCgSuEHfU/u2ziQGTShd2ZfvREzHXuE8HgqAQFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E035F80229;
	Tue, 13 Jul 2021 14:39:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A8BEF80217; Tue, 13 Jul 2021 14:39:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=NICE_REPLY_A,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1AC2F800ED
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 14:39:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1AC2F800ED
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="190531961"
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; d="scan'208";a="190531961"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 05:39:28 -0700
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; d="scan'208";a="649448840"
Received: from skrishn6-mobl.amr.corp.intel.com (HELO [10.213.170.159])
 ([10.213.170.159])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 05:39:27 -0700
Subject: Re: [PATCH 6/8] ALSA: pcm: conditionally avoid mmap of control data
To: Takashi Iwai <tiwai@suse.de>
References: <20210610205326.1176400-1-pierre-louis.bossart@linux.intel.com>
 <20210610205326.1176400-7-pierre-louis.bossart@linux.intel.com>
 <s5h4ke25ill.wl-tiwai@suse.de>
 <15cdd983-e25b-a872-aa25-5086ec71756f@linux.intel.com>
 <s5h8s2a3fgh.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d7a3b3fd-eddf-000b-f9ed-711d3e3156f4@linux.intel.com>
Date: Tue, 13 Jul 2021 07:39:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <s5h8s2a3fgh.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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



On 7/13/21 1:17 AM, Takashi Iwai wrote:
> On Mon, 12 Jul 2021 22:56:07 +0200,
> Pierre-Louis Bossart wrote:
>>
>>
>>
>> On 6/13/21 2:28 AM, Takashi Iwai wrote:
>>> On Thu, 10 Jun 2021 22:53:24 +0200,
>>> Pierre-Louis Bossart wrote:
>>>>
>>>> In case of mmap, by default alsa-lib mmaps both control and status data.
>>>>
>>>> If driver subscribes for application pointer update, driver needs to get
>>>> notification whenever appl ptr changes. With the above case driver won't
>>>> get appl ptr notifications.
>>>>
>>>> This patch check on a hw info flag and returns error when user land asks
>>>> for mmaping control & status data, thus forcing user to issue
>>>> IOCTL_SYNC_PTR.
>>>>
>>>> This patch was originally submitted in 2017, c.f.
>>>> https://lore.kernel.org/alsa-devel/1494896518-23399-4-git-send-email-subhransu.s.prusty@intel.com/
>>>>
>>>> Suggested-by: Takashi Iwai <tiwai@suse.de>
>>>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>>> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
>>>> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
>>>
>>> This kind of flag itself was what I also introduced for another
>>> purpose, too.  There is a WIP patch that allows the use of
>>> non-coherent non-contiguous buffer pages, and this flag would fit for
>>> that.  FWIW, the patch is found at
>>>   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/log/?h=topic/memalloc
>>
>> Sorry Takashi, I missed your feedback on this patch.
>>
>> Are you saying I should use the definition in that patch?
>>
>> +#define SNDRV_DMA_TYPE_NONCONTIG	8	/* non-coherent SG buffer */
>>
>> I am not quite sure if how this is related to the application using mmap or not?
> 
> Not about that, but rather meant that some flag for disabling the mmap
> of PCM control record would be needed for other purposes like the
> above, too.  That is, this patch could be out of series and applied
> beforehand in my side.

Thanks Takashi, I will resubmit this separately. I may also break the series in two, the two parts (pause/L1EN support and rewinds) are not really connected, they help reduce power but at different levels.
