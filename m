Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF453A4468
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Jun 2021 16:53:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FC431A93;
	Fri, 11 Jun 2021 16:52:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FC431A93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623423210;
	bh=HSijEbuIJ4iapF+UTAEjoQGrywFY7zw3pkhae6uMahw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eidJ/W7+98v7gSO4sOiAvuw4ADCtqIp9OwztmwD3nSiDasvuyW48kfYSLOgaYfkIl
	 XR03tHsioplhgpMrzZ5DKSFG+JBlEcUJCJQNroxw4ADcXOOBLl3CCWk0IUDK8TZr33
	 TrTGfPvdYLb6o657FtW/vwUsgKVv71NPC+Bhxunk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AC0FF800FB;
	Fri, 11 Jun 2021 16:52:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 475A7F8026C; Fri, 11 Jun 2021 16:52:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7732AF800FC
 for <alsa-devel@alsa-project.org>; Fri, 11 Jun 2021 16:51:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7732AF800FC
IronPort-SDR: ob9JBLCkT3sE5Q0C+WzU4zJdo3AFPmbSgPj6kqFOSfQSyM0QRqyGR8TKFu3aRVwnrWKni8OekY
 NA5estQpPuPA==
X-IronPort-AV: E=McAfee;i="6200,9189,10012"; a="202510683"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="202510683"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 07:51:51 -0700
IronPort-SDR: 5005IWZtchPfbvO3h+s9Ho6UAiMbo/xRefMxG2img6XhJgrpYvM6o/pYW+yIQIGMJIX9fAetOo
 xAkYoRi6H9+A==
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="638709464"
Received: from dcpalomx-mobl4.amr.corp.intel.com (HELO [10.209.153.29])
 ([10.209.153.29])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 07:51:50 -0700
Subject: Re: [PATCH v4] soundwire: intel: move to auxiliary bus
To: Vinod Koul <vkoul@kernel.org>
References: <20210511052132.28150-1-yung-chuan.liao@linux.intel.com>
 <21002781-0b78-3b36-952f-683482a925d7@linux.intel.com>
 <YLS4N2KgzfsMBD1c@vkoul-mobl.Dlink>
 <b316763b-d219-6ea3-401e-3eb9718aabf3@linux.intel.com>
 <YMBHj6PBzeHexXJb@vkoul-mobl>
 <07dbe0a2-0abb-810b-ef39-b83511d3f3e0@linux.intel.com>
 <YMNQBpFX9DXcoGAc@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <be440569-e18b-b079-2795-0af1e6812935@linux.intel.com>
Date: Fri, 11 Jun 2021 09:51:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMNQBpFX9DXcoGAc@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Leon Romanovsky <leon@kernel.org>,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, hui.wang@canonical.com,
 Jason Gunthorpe <jgg@nvidia.com>, Dave Ertman <david.m.ertman@intel.com>,
 sanyog.r.kale@intel.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

Thanks Vinod for your feedback,

>> If you look at the *existing* code, we don't handle any "resources" with the
>> platform devices, we use the platform_device_info.data to pass the link
>> information. It's a void pointer. We do not touch the resource field in the
>> platform_device_into at all.
> 
> Yes that is true I dont disagree on that part. My ask here is to make it
> better, it can be followed up after this but I would at least like to
> agree on the direction.

[...]

>> That's it. We did not change anything else, all the other fields are
>> identical. We are only changing the TYPE of device and the interfaces for
>> probe/remove but using the same information and the same device hierarchy.
> 
> The move in itself is okay but I dont think that should be the end goal.

What we suggested in this patch is only an iso-functionality change. I 
believe from Greg's and your feedback that there is no objection on that 
small step.

This is not the end-goal indeed. The second step would be to remove the 
intel_init.c file. I fully agree with you Vinod that this can be moved 
into the SOF driver, and we could do this in a follow-up step. We can 
also improve the partition between 'context' used by the child driver 
and information passed by the parent on SHIM registers and bases.

I think we'd need to agree on the details of the second step, Bard and I 
can work on a proposal, but I don't see a disconnect on the direction to 
simplify the interface. That's the right thing to do.




