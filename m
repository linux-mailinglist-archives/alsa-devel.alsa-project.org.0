Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4D3246C44
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 18:12:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C06016E2;
	Mon, 17 Aug 2020 18:11:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C06016E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597680761;
	bh=UGNjeH9TIwUZjmBUVe7E5lmW/m0PPP/SDdxXWcVFwP8=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=my/8H8f3JKS8USjQVqJusy+WVfBSo+q3Ir0Lu9jBzJblC1KMIl3V/3InlhsATKnkI
	 ILX5wUSzz1TfTiisKklaE0f80WB+iA1b/GUIfaperylZWOMDn6vPhkiLB2NDgu6O87
	 76AuRr2vT0KZ811GjpAKP+DqmZXVEeZZ9ZqfJDGw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8B55F800F0;
	Mon, 17 Aug 2020 18:11:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F979F800F0; Mon, 17 Aug 2020 18:10:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAFFEF800F0
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 18:10:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAFFEF800F0
IronPort-SDR: Em/Hc1Dau0upmLhKyAZb6lI1EFTT06JvJtd3Hi1W5Zz9tWX+/tjMnDcB8uXnQf9Iy2xJYkFZPz
 Lg7GV+EDCqbA==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="134799869"
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; d="scan'208";a="134799869"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2020 09:10:29 -0700
IronPort-SDR: FU/qJukm9lMEnugsV4tXLKOeYwlgKtadxOBp25Yer+nYIV8SKJWX/VzHpO/Cscb+A5fPUztv5p
 2Qn94R5I+JYw==
X-IronPort-AV: E=Sophos;i="5.76,324,1592895600"; d="scan'208";a="310139813"
Received: from jhor-mobl.gar.corp.intel.com (HELO [10.209.166.196])
 ([10.209.166.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2020 09:10:27 -0700
Subject: Re: [PATCH 00/13] soundwire: intel: add power management support
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20200721203723.18305-1-yung-chuan.liao@linux.intel.com>
 <20200817120841.GQ2639@vkoul-mobl>
 <d8f8f64f-34db-9c9a-c821-83dda3b2db9a@linux.intel.com>
Message-ID: <093dcb7d-e2b7-b568-6a23-aeaf9bfb6004@linux.intel.com>
Date: Mon, 17 Aug 2020 11:10:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d8f8f64f-34db-9c9a-c821-83dda3b2db9a@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, mengdong.lin@intel.com, slawomir.blauciak@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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



>> I had applied except 3 & 9 (few skipped in middle due to conflict while
>> applying), BUT I get a build failure on patch 2 onwards :(
>>
>> drivers/soundwire/intel_init.c: In function ‘sdw_intel_cleanup’:
>> drivers/soundwire/intel_init.c:72:4: error: implicit declaration of 
>> function ‘pm_runtime_disable’ [-Werror=implicit-function-declaration]
>>     72 |    pm_runtime_disable(&link->pdev->dev);
>>
>> I suspect due to missing header? I was on x64 build with allmodconfig
>>
>> So only patch 1 is applied and pushed now
> 
> I just tried on these series applied on top of soundwire/next
> 
> commit 9b3b4b3f2f2af863d2f6dd65afd295a5a673afa2 (soundwire/next)
> 
>      soundwire: intel: Add basic power management support
> 
> And I don't see any issue?

Sorry, I misunderstood the issue. Yes indeed the #include 
<linux/pm_runtime.h> is added to the wrong patch, I see Bard fixed this 
in our tree. Not sure what happened here, I ran a patch-by-patch 
compilation test a long time ago and kbuild was silent. Thanks for 
spotting this.

> If you want to double-check merge issues, I pushed the code here: 
> https://github.com/plbossart/sound/tree/sdw/pm_runtime_soundwire_next
> 
> I am really not sure what conflicts you are referring to, git am worked 
> fine for me, only skipped the first patch that's already applied.

But the point about conflicts does remain, I am not sure why you skipped 
patches, I have no merge conflicts on my side.

