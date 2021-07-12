Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBEB3C6581
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jul 2021 23:33:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DE2016DC;
	Mon, 12 Jul 2021 23:33:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DE2016DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626125638;
	bh=6KJoh9M/2XauqU++OehJv2ZNbQkDZkPUppUoUPpQIFo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tAjCmrwLYJrNyJctAz54sJr7uWZ1cwHaST3eG4TH0jWj49mjxt6PaCfd+1RLYWt6g
	 QWlYNz3eb629T1Lw/OSb/aAIOi+QTSyLD8M5oQBP+Idy4NuZ/mLBEG9HHWju5+KZV8
	 reK/29uQAlcGN0sX45vgufWfQwaH3+gW3gAL9Gl8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59509F80300;
	Mon, 12 Jul 2021 23:32:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4194EF802E7; Mon, 12 Jul 2021 23:32:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=NICE_REPLY_A,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 534F3F8020C
 for <alsa-devel@alsa-project.org>; Mon, 12 Jul 2021 23:32:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 534F3F8020C
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="210101175"
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; d="scan'208";a="210101175"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 14:32:04 -0700
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; d="scan'208";a="492286015"
Received: from yangbosh-mobl3.amr.corp.intel.com (HELO [10.212.95.167])
 ([10.212.95.167])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 14:32:04 -0700
Subject: Re: [PATCH 6/8] ALSA: pcm: conditionally avoid mmap of control data
To: Takashi Iwai <tiwai@suse.de>
References: <20210610205326.1176400-1-pierre-louis.bossart@linux.intel.com>
 <20210610205326.1176400-7-pierre-louis.bossart@linux.intel.com>
 <s5h4ke25ill.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <15cdd983-e25b-a872-aa25-5086ec71756f@linux.intel.com>
Date: Mon, 12 Jul 2021 15:56:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <s5h4ke25ill.wl-tiwai@suse.de>
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



On 6/13/21 2:28 AM, Takashi Iwai wrote:
> On Thu, 10 Jun 2021 22:53:24 +0200,
> Pierre-Louis Bossart wrote:
>>
>> In case of mmap, by default alsa-lib mmaps both control and status data.
>>
>> If driver subscribes for application pointer update, driver needs to get
>> notification whenever appl ptr changes. With the above case driver won't
>> get appl ptr notifications.
>>
>> This patch check on a hw info flag and returns error when user land asks
>> for mmaping control & status data, thus forcing user to issue
>> IOCTL_SYNC_PTR.
>>
>> This patch was originally submitted in 2017, c.f.
>> https://lore.kernel.org/alsa-devel/1494896518-23399-4-git-send-email-subhransu.s.prusty@intel.com/
>>
>> Suggested-by: Takashi Iwai <tiwai@suse.de>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
>> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> 
> This kind of flag itself was what I also introduced for another
> purpose, too.  There is a WIP patch that allows the use of
> non-coherent non-contiguous buffer pages, and this flag would fit for
> that.  FWIW, the patch is found at
>   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/log/?h=topic/memalloc

Sorry Takashi, I missed your feedback on this patch.

Are you saying I should use the definition in that patch?

+#define SNDRV_DMA_TYPE_NONCONTIG	8	/* non-coherent SG buffer */

I am not quite sure if how this is related to the application using mmap or not?
