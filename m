Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADA425CC55
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 23:34:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 128571AAD;
	Thu,  3 Sep 2020 23:33:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 128571AAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599168857;
	bh=hgsM6WUyatqzZIVCn6QKUM2E8s+CFOQQE+wNmeXwRto=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qe8jzhRyeC9O8bqEv1nRHgO6aNu+WPHwtI9W6vr3SRDHPZRSuTA/W7i3e3XN7pSIG
	 iQxr7kQMAtT0Rkz/4WWN8LjbGYDIX3yTQYrNFrRaNBhGGQ3b8xL3ZtVf1ASei6lRhx
	 St5MGHMcOmmAcqssWqSPFddIdzAJ9Q574pSf3UOY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42EFCF8020D;
	Thu,  3 Sep 2020 23:32:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C73BF80217; Thu,  3 Sep 2020 23:32:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADE20F801DA
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 23:32:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADE20F801DA
IronPort-SDR: 46HDBq5AilW8/iKT4adF4tQjLBOGY71POIBYUiuYiVo+zB4030ji8ypRlMNlTohE8V4N3nBoXH
 S/rw/D4+cT2g==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="242480823"
X-IronPort-AV: E=Sophos;i="5.76,387,1592895600"; d="scan'208";a="242480823"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2020 14:32:23 -0700
IronPort-SDR: e8awDXon4Mr1mhSyZCzHoSe2rfJtQS+wW9vg6JZYBEsCK0w09YCsblZffNwWi/gZA9w+b250VA
 ZJbS6czWjUHg==
X-IronPort-AV: E=Sophos;i="5.76,387,1592895600"; d="scan'208";a="478208877"
Received: from mrcordie-mobl1.amr.corp.intel.com (HELO [10.212.195.28])
 ([10.212.195.28])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2020 14:32:23 -0700
Subject: Re: [RFC PATCH 0/3] alsa-lib/ASoC: use inclusive language for
 bclk/fsync/topology
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
References: <20200903201024.1109914-1-pierre-louis.bossart@linux.intel.com>
 <cac824a4-3882-85dd-dc0b-8366090dce94@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9d1c96ad-6860-7a98-4e22-5f566665e7e7@linux.intel.com>
Date: Thu, 3 Sep 2020 16:32:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cac824a4-3882-85dd-dc0b-8366090dce94@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, broonie@kernel.org
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



On 9/3/20 3:42 PM, Jaroslav Kysela wrote:
> Dne 03. 09. 20 v 22:10 Pierre-Louis Bossart napsal(a):
>> The SOF (Sound Open Firmware) tree contains a lot of references in
>> topology files to 'codec_slave'/'codec_master' terms, which in turn
>> come from alsa-lib and ALSA/ASoC topology support at the kernel
>> level. These terms are no longer compatible with the guidelines
>> adopted by the kernel community [1] and need to change in
>> backwards-compatible ways.
>>
>> The main/secondary terms typically suggested in guidelines don't mean
>> anything for clocks, this patchset suggests instead the use of
>> 'provider' and 'follower' terms, with the 'codec' prefix kept to make
>> it clear that the codec is the reference. The CM/CF suffixes are also
>> replaced by CP/CF.
> 
> Only my 2 cents: It's just another word combo. See bellow for sources for others.
> 
> I would prefer probably provider/consumer . It sounds more technic.

Thanks Jaroslav for chiming in. I had a similar set of comments in 
internal reviews, but we didn't really have any consensus and I have not 
seen good guidance specifically for clocks.

Provider/consumer is typically used for discrete data exchange with some 
sort of locking and buffer fullness metric, but for clocks we'd want 
something that hints at one device following the timing defined by another.

"follow" or "track" seem clearer than 'consume' IMHO, but I will side 
with the majority, this is an RFC which can be modified at will.

