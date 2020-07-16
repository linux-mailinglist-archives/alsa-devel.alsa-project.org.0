Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 565B6221B69
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jul 2020 06:28:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDE5A1672;
	Thu, 16 Jul 2020 06:27:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDE5A1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594873721;
	bh=bF+FFWgE+UGH7juGvDA/PTU1MTQR4SpVLWq8Nubuxdc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N/UsQJ5NZRBHQkm9uMcrIvJ9FiSms/Tb8q7Bc+gVraKHi3gXWW1xWFeGfEB2mK4AU
	 0L1rqmRraUJX8FvXsTBTUcJGBeyweHeyr9kO0AmSk6Tspq7pR8nXiQQIqxQ1PKCJKz
	 c3SH5iowFyXWve31yz/PdZw4frHqlcZO1wSqOLhE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E930BF8028A;
	Thu, 16 Jul 2020 06:27:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB292F801EC; Thu, 16 Jul 2020 06:26:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDE71F80110
 for <alsa-devel@alsa-project.org>; Thu, 16 Jul 2020 06:26:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDE71F80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eNVX09NA"
Received: from localhost (unknown [122.171.202.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 77F48206C1;
 Thu, 16 Jul 2020 04:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594873610;
 bh=bF+FFWgE+UGH7juGvDA/PTU1MTQR4SpVLWq8Nubuxdc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eNVX09NA5URDN7jKMjF1skAsLSaptwzWnNx3kYpCd9S7nPO3lwp9BLu9zod5u/E3M
 Q4iSgj5UFU8TdtE/xshbgU4NuxNB0a+QzVxUj12OljVJqKWGaZDNYgs3J3Gmv0qSJW
 VWG8MuPLf+zQ5GFvSEj+BCASsBgj0y+rN7ZyzV8M=
Date: Thu, 16 Jul 2020 09:56:46 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] soundwire: fix the kernel-doc comment
Message-ID: <20200716042646.GA55478@vkoul-mobl>
References: <20200715095702.1519554-1-vkoul@kernel.org>
 <7498c581-94fe-140b-c521-786f0dea7b3d@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7498c581-94fe-140b-c521-786f0dea7b3d@linux.intel.com>
Cc: alsa-devel@alsa-project.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>
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

On 15-07-20, 09:42, Pierre-Louis Bossart wrote:
> 
> 
> On 7/15/20 4:57 AM, Vinod Koul wrote:
> > sdw_startup_stream() and sdw_shutdown_stream() argument has been updated
> > but not the comments, so update these as well to fix warning with W=1
> > 
> > drivers/soundwire/stream.c:1859: warning: Function parameter or member 'sdw_substream' not described in 'sdw_startup_stream'
> > drivers/soundwire/stream.c:1859: warning: Excess function parameter 'stream' description in 'sdw_startup_stream'
> > drivers/soundwire/stream.c:1903: warning: Function parameter or member 'sdw_substream' not described in 'sdw_shutdown_stream'
> > drivers/soundwire/stream.c:1903: warning: Excess function parameter 'stream' description in 'sdw_shutdown_stream'
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> 
> After sending dozens of patches to fix those issues I added one by accident,
> oh well. Thanks for fixing this.
> 
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks applied and pushed

-- 
~Vinod
