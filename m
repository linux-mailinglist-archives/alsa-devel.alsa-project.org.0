Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E24F5B89B7
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 16:02:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9D3B18E6;
	Wed, 14 Sep 2022 16:01:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9D3B18E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663164152;
	bh=ZkjhW8tYB33c37H77+5rPYilo73ulNmSfNoXGnr1LME=;
	h=Date:From:Subject:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TIaPh4v2Yq1Zh3H0TmKiwwbygAiNQWv/ei1H+3VV0txDE1oDjtjzEhkIHoKHIPis5
	 HE7GzxxZQcxBedJMrAwlMxkPOtpOhoBc+Yo1Tf+8dwB4S8cP28ju3f717wVeD4xyLt
	 b72jTRRcoDF6gSgXVSwcJJd/BGSJy9MwSUM44j8w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86E6EF8008E;
	Wed, 14 Sep 2022 16:01:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E4CDF80528; Wed, 14 Sep 2022 16:01:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBC1FF8008E
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 16:01:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBC1FF8008E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nGAV/tdn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663164087; x=1694700087;
 h=message-id:date:mime-version:from:subject:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=ZkjhW8tYB33c37H77+5rPYilo73ulNmSfNoXGnr1LME=;
 b=nGAV/tdntcsMrQ5mmSQF99BjmIR6On8gtAHQ1N/bvl3+K3ZCNfnY5yWb
 SCNunn5RkYGbPwkyqiqU6ja6OfAHdjRqjcII716M+7DxnMgI9H98Ehh5Z
 VksBg4nTdtN/Dztxe22RlXwGOWTp7h4HOQYpoCMC9BmZ9lKuUmz/APZvV
 JIZmtsoOWY0ABe4M5tZbT4tkU0Pxe2+7oHkWXAyUXtfo05QxIIPGjQpF7
 hQ7fiD8vtVHJBXhfmz2OxCqUPHcbeQtfuRA35iwwqeWFMzcE83aj8HzVJ
 g2N6eaWhmkptz4ySGteRrkPBwUnH9iqS+z1DpJH0HkfnGmLVbtnFTSxiZ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="278821705"
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; d="scan'208";a="278821705"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2022 07:00:56 -0700
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; d="scan'208";a="705968865"
Received: from blaesing-mobl.ger.corp.intel.com (HELO [10.249.45.209])
 ([10.249.45.209])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2022 07:00:54 -0700
Message-ID: <81fb961f-2629-fece-112b-4277d9e45d6c@linux.intel.com>
Date: Wed, 14 Sep 2022 16:00:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v3 0/5] soundwire: Fixes for spurious and missing UNATTACH
To: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com
References: <20220914120949.747951-1-rf@opensource.cirrus.com>
Content-Language: en-US
In-Reply-To: <20220914120949.747951-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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



On 9/14/22 14:09, Richard Fitzgerald wrote:
> The bus and cadence code has several bugs that cause UNATTACH notifications
> to either be sent spuriously or to be missed.
> 
> These can be seen occasionally with a single peripheral on the bus, but are
> much more frequent with multiple peripherals, where several peripherals
> could change state and report in consecutive PINGs.
> 
> The root of all of these bugs seems to be a code design flaw that assumed
> every PING status change would be handled separately. However, PINGs are
> handled by a workqueue function and there is no guarantee when that function
> will be scheduled to run or how much CPU time it will receive. PINGs will
> continue while the work function is handling a snapshot of a previous PING
> so the code must take account that (a) status could change during the
> work function and (b) there can be a backlog of changes before the IRQ work
> function runs again.
> 
> Tested with 4 peripherals on 1 bus, and 8 peripherals on 2 buses.

I added my Reviewed-by tags for the last patches, there's only one typo
which could be dealt with a follow-up patch if that's easier

Thanks again for this contribution, much appreciated.

> CHANGES SINCE V2:
> #4 Add a comment explaining why INTMASK isn't cleared when going around
>    the update_status loop.
> 
> #5 Leave the existing error handling in sdw_program_device_num(),
>    instead of suppressing the error return.
>    Add a comment in sdw_handle_slave_status() explaining why the error
>    is ignored.
>    Re-word the explanation of why sdw_handle_slave_status() must only return
>    early if it programmed a device ID.
> 
> Richard Fitzgerald (4):
>   soundwire: bus: Don't lose unattach notifications
>   soundwire: bus: Don't re-enumerate before status is UNATTACHED
>   soundwire: cadence: Fix lost ATTACHED interrupts when enumerating
>   soundwire: bus: Don't exit early if no device IDs were programmed
> 
> Simon Trimmer (1):
>   soundwire: cadence: fix updating slave status when a bus has multiple
>     peripherals
> 
>  drivers/soundwire/bus.c            | 44 +++++++++++++---
>  drivers/soundwire/cadence_master.c | 80 ++++++++++++++++--------------
>  2 files changed, 80 insertions(+), 44 deletions(-)
> 
