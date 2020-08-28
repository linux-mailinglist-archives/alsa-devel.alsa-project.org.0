Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE1A255D9B
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 17:17:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EA9418AA;
	Fri, 28 Aug 2020 17:16:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EA9418AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598627849;
	bh=KwopbHG9OgzOQ38Bl3Sv7EJLJpxdfx28xpcNKOFjHCE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AxXRzoZYKw/QlfVqdYhQDnEI7zv9RiKmyU2WHTWf5quoNvIHs5pOt5EmcLJ3hFZzr
	 lGFNnnmn0BZiDa3um4FKNv+MVHVjOitwiEYlLkiVSbQwerH4dGBMoBcV/lqf+banFl
	 2Wce38CHYcIwgvaqak5ncN9muv/lL+a5AIPLXqCc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D75AAF80143;
	Fri, 28 Aug 2020 17:15:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEBD1F8020C; Fri, 28 Aug 2020 17:15:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB8B6F80143
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 17:14:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB8B6F80143
IronPort-SDR: o5DWQ+vnsu70tMP8cAYh2ChIqOy3I9hP+RccQ1YWBfC4YjmY+j0o2w6GiX6e/hrjeyaYYksR+a
 eEA90SGLA1Fw==
X-IronPort-AV: E=McAfee;i="6000,8403,9727"; a="155939826"
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; d="scan'208";a="155939826"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 08:14:54 -0700
IronPort-SDR: lmmOffibLsj9n0W6xaXGeuDfgSX/QKOitxVzhsT/UObzEMYoNNzzUbIzp8LZrJ0NAv1/emfTqf
 00P4tmDuBt8w==
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; d="scan'208";a="300265640"
Received: from lilymao-mobl.amr.corp.intel.com (HELO [10.209.185.175])
 ([10.209.185.175])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 08:14:52 -0700
Subject: Re: [PATCH] soundwire: cadence: fix race condition between suspend
 and Slave device alerts
To: Vinod Koul <vkoul@kernel.org>
References: <20200817222340.18042-1-yung-chuan.liao@linux.intel.com>
 <20200819090637.GE2639@vkoul-mobl>
 <8d60fa6f-bb7f-daa8-5ae2-51386b87ccad@linux.intel.com>
 <20200821050758.GI2639@vkoul-mobl>
 <29ea5a44-b971-770a-519c-ae879557b63f@linux.intel.com>
 <20200828080024.GP2639@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <77ecb4bc-10d6-8fbd-e97f-923d01a5e555@linux.intel.com>
Date: Fri, 28 Aug 2020 10:14:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828080024.GP2639@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, mengdong.lin@intel.com, sanyog.r.kale@intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, rander.wang@linux.intel.com,
 bard.liao@intel.com
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




> Is this timeout for suspend or resume? Somehow I was under the
> assumption that it is former? Or is the result seen on resume?
> 
> Rereading the race describe above in steps, I think this should be
> handled in step c above. Btw is that suspend or runtime suspend which
> causes this? Former would be bigger issue as we should not have work
> running when we return from suspend call. Latter should be dealt with
> anyway as device might be off after suspend.

This happens with a system suspend. Because we disable the interrupts, 
the workqueue never completes, and we have a timeout on system resume.

That's why we want to prevent the workqueue from starting, or let it 
complete, but not have this zombie state where we suspend but there's 
still a wait for completion that times out later. The point here is 
really  making sure the workqueue is not used before suspend.
