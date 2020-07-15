Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F00220FD7
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 16:50:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D25A15F2;
	Wed, 15 Jul 2020 16:49:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D25A15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594824637;
	bh=+yClnskVSFfeeGf3GDjoasrPtgoMn15H5ERXZ+tRhYE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l0vwcIYQexsETfSKlyW00fbKmDY3P5ypvE7B4qnIZ88Wmz5QQCwT266wbeWqrGXtR
	 lBx3vk7JDD8yZT6wtXZWcR6yGmuDT+oHsHBatyJSKgmpd5DuOh4epChicbZ7g9u1j6
	 5l1oeDs2OoWzTEP5rdrX3u8CQGA0s6sQN3+HfToE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98B09F8027B;
	Wed, 15 Jul 2020 16:48:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1A26F8023F; Wed, 15 Jul 2020 16:47:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_PASS,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A088F80227
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 16:47:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A088F80227
IronPort-SDR: M0YoqudEEiK8uDkqDCyppam1syx6E25WoT/ddKimgmMM7cK2uIsPVj/Ktw6duKsXD9m1bc6/lo
 WmYxFkEd+Vew==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="128724458"
X-IronPort-AV: E=Sophos;i="5.75,355,1589266800"; d="scan'208";a="128724458"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 07:47:51 -0700
IronPort-SDR: 2PEY05RyeCelEeM3/hoBzsX/PD/wRwIaJOupts6VsrFw5GAlPN/WPkWJe7l97a+fZ0v4q6zYmJ
 sUfLzTP/cKeA==
X-IronPort-AV: E=Sophos;i="5.75,355,1589266800"; d="scan'208";a="460114380"
Received: from sjeong-mobl.amr.corp.intel.com (HELO [10.255.231.101])
 ([10.255.231.101])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 07:47:50 -0700
Subject: Re: [PATCH] soundwire: fix the kernel-doc comment
To: Vinod Koul <vkoul@kernel.org>, alsa-devel@alsa-project.org
References: <20200715095702.1519554-1-vkoul@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7498c581-94fe-140b-c521-786f0dea7b3d@linux.intel.com>
Date: Wed, 15 Jul 2020 09:42:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715095702.1519554-1-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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



On 7/15/20 4:57 AM, Vinod Koul wrote:
> sdw_startup_stream() and sdw_shutdown_stream() argument has been updated
> but not the comments, so update these as well to fix warning with W=1
> 
> drivers/soundwire/stream.c:1859: warning: Function parameter or member 'sdw_substream' not described in 'sdw_startup_stream'
> drivers/soundwire/stream.c:1859: warning: Excess function parameter 'stream' description in 'sdw_startup_stream'
> drivers/soundwire/stream.c:1903: warning: Function parameter or member 'sdw_substream' not described in 'sdw_shutdown_stream'
> drivers/soundwire/stream.c:1903: warning: Excess function parameter 'stream' description in 'sdw_shutdown_stream'
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

After sending dozens of patches to fix those issues I added one by 
accident, oh well. Thanks for fixing this.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
