Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D829720386B
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 15:48:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7063816E4;
	Mon, 22 Jun 2020 15:47:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7063816E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592833719;
	bh=NpK34mUEO+i88YjZLcgp44JfF15dfeC2j4qaZY6axyc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O30MZijyG6I9lINaqsJzcAHAv9ytRAulzhRPkpe8B6I5SQrf7MhuxRNfcWmOm/jf/
	 IOEV1YRIISpx+YQNJqEi0TNCXc8fYAWQRDO8bRF+hEwTGvAlqkwb6+zRZ9qg/paZGt
	 CEkY0EU7Q5jK78eqWg8jdyVeogv/g+GQzL9QvdBA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BC68F8015B;
	Mon, 22 Jun 2020 15:46:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F061F80162; Mon, 22 Jun 2020 15:46:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 186C0F80157
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 15:46:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 186C0F80157
IronPort-SDR: yeJcezQS6P/HV+kn0U6fzB0VhcJDoyhg2JruZ8/ao2zPjqb4KFox1PMke3ECAP0ZkoYVWgFbuh
 mATWQAUrNEow==
X-IronPort-AV: E=McAfee;i="6000,8403,9659"; a="208960441"
X-IronPort-AV: E=Sophos;i="5.75,267,1589266800"; d="scan'208";a="208960441"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2020 06:46:43 -0700
IronPort-SDR: 5BHLR7zv99DGglQd5lQNqfshbMhGKIl4USbYSH9SUj1WCI4rZnAw3UBLJ3uDpLeHjQ4aqDImk0
 ckgYOkyM1ymA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,267,1589266800"; d="scan'208";a="262971329"
Received: from agsoto-mobl.amr.corp.intel.com (HELO [10.251.3.142])
 ([10.251.3.142])
 by fmsmga007.fm.intel.com with ESMTP; 22 Jun 2020 06:46:42 -0700
Subject: Re: [PATCH 2/3] ALSA: compress: document the compress gapless audio
 state machine
To: Vinod Koul <vkoul@kernel.org>
References: <20200619045449.3966868-1-vkoul@kernel.org>
 <20200619045449.3966868-3-vkoul@kernel.org>
 <5c878ccf-43dd-4e13-aa6b-a6cb1e82af72@linux.intel.com>
 <20200622053441.GE2324254@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <248f7bef-c3d4-2d2e-ffa4-0d372879c8ae@linux.intel.com>
Date: Mon, 22 Jun 2020 08:22:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200622053441.GE2324254@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>
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



On 6/22/20 12:34 AM, Vinod Koul wrote:
> On 19-06-20, 09:27, Pierre-Louis Bossart wrote:
>>
>>> +For Gapless, we move from running state to partial drain and back, along
>>> +with setting of meta_data and signalling for next track ::
>>> +
>>> +
>>> +                                        +----------+
>>> +                compr_drain_notify()    |          |
>>> +              +------------------------>|  RUNNING |
>>> +              |                         |          |
>>> +              |                         +----------+
>>> +              |                              |
>>> +              |                              |
>>> +              |                              | compr_next_track()
>>> +              |                              |
>>> +              |                              V
>>> +              |                         +----------+
>>> +              |                         |          |
>>> +              |                         |NEXT_TRACK|
>>> +              |                         |          |
>>> +              |                         +----------+
>>> +              |                              |
>>> +              |                              |
>>> +              |                              | compr_partial_drain()
>>> +              |                              |
>>> +              |                              V
>>> +              |                         +----------+
>>> +              |                         |          |
>>> +              +------------------------ | PARTIAL_ |
>>> +                                        |  DRAIN   |
>>> +                                        +----------+
>>
>> May I suggest having a single state machine, not a big one and an additional
>> partial one. It would help explain why in one case compr_drain_notify()
>> triggers a transition to RUNNING while in the other one it goes to SETUP.
>>
>> I realize it's more complicated to edit but it'd be easier on
>> reviewers/users.
> 
> Ell adding stop and transitions would really make it complicated and
> gapless is a bit different handling and it looks cleaner this way IMO,
> so lets stick to this. Feel free to create one if you are up for it.

if you don't want to change the visuals then please add a paragraph 
explaining the different uses of compr_drain_notify().
