Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B789D90093
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2019 13:15:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27C3A1663;
	Fri, 16 Aug 2019 13:14:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27C3A1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565954139;
	bh=yVMq9IgJGL6GFg/Ga2wIT2ci7/SJLDZCxzjGjDgCJT8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=La+GJIwlLyVLrCBYpYrluBU8AQnpP6l7fGUldx2esheh5yO+95xsrRd1O5RO6rEdL
	 tcgrEz/SC1TiH83HuEreN7oSs/Gs9GEe/bF2SiSlNB63D545TA4TCTUvCHvgihRqp2
	 yOQ7t7LJ8caE7gI0glDovkaKurKAcx5bTteN7HxM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 974B7F80268;
	Fri, 16 Aug 2019 13:13:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC4FAF80214; Fri, 16 Aug 2019 13:13:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2819F80110
 for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2019 13:13:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2819F80110
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Aug 2019 04:13:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,393,1559545200"; d="scan'208";a="188785382"
Received: from mprabhug-mobl1.amr.corp.intel.com (HELO [10.252.132.82])
 ([10.252.132.82])
 by orsmga002.jf.intel.com with ESMTP; 16 Aug 2019 04:13:47 -0700
To: Vinod Koul <vkoul@kernel.org>
References: <20190812235942.7120-1-pierre-louis.bossart@linux.intel.com>
 <20190816094308.GA12733@vkoul-mobl.Dlink>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9f4789b2-66bd-4b17-2b13-934348a18691@linux.intel.com>
Date: Fri, 16 Aug 2019 06:13:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816094308.GA12733@vkoul-mobl.Dlink>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com
Subject: Re: [alsa-devel] [PATCH v2 0/3] soundwire: debugfs support for 5.4
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 8/16/19 4:43 AM, Vinod Koul wrote:
> On 12-08-19, 18:59, Pierre-Louis Bossart wrote:
>> This patchset enables debugfs support and corrects all the feedback
>> provided on an earlier RFC ('soundwire: updates for 5.4')
>>
>> There is one remaining hard-coded value in intel.c that will need to
>> be fixed in a follow-up patchset not specific to debugfs: we need to
>> remove hard-coded Intel-specific configurations from cadence_master.c
>> (PDI offsets, etc).
>>
>> Changes since v1 (Feedback from GKH)
>> Handle debugfs in a more self-contained way (no dentry as return or parameter)
>> Used CONFIG_DEBUG_FS in structures and code to make it easier to
>> remove if need be.
>> No functional change for register dumps.
>>
>> Changes since RFC (Feedback from GKH, Vinod, Guennadi, Cezary, Sanyog):
>> removed error checks
>> used DEFINE_SHOW_ATTRIBUTE and seq_file
>> fixed copyright dates
>> fixed SPDX license info to use GPL2.0 only
>> fixed Makefile to include debugfs only if CONFIG_DEBUG_FS is selected
>> used static inlines for fallback compilation
>> removed intermediate variables
>> removed hard-coded constants in loops (used registers offsets and
>> hardware capabilities)
>> squashed patch 3
> 
> These looks good but failed to apply. Please rebase on soundwire-next
> and resend

Could you do us a favor and make sure your soundwire/fixes branch is 
actually merged in soundwire/next? in this case the Makefile is changed 
in soundwire/fixes and not in next.
If you use git am --3way things work fine and the conflict is resolved.

Applying: soundwire: add debugfs support
Using index info to reconstruct a base tree...
M	drivers/soundwire/Makefile
M	include/linux/soundwire/sdw.h
Falling back to patching base and 3-way merge...
Auto-merging include/linux/soundwire/sdw.h
Auto-merging drivers/soundwire/Makefile
Applying: soundwire: cadence_master: add debugfs register dump
Applying: soundwire: intel: add debugfs register dump
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
