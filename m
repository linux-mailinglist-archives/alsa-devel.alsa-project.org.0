Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8E08CAB5
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 07:49:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F7CF1615;
	Wed, 14 Aug 2019 07:48:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F7CF1615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565761748;
	bh=DepcA9Xu+0AhsQmvJW90dvc68PrHiMJ/r4jmD03QQp8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i3ZXVsdiPPlVNeCHwenV4CHqT7P5C3Icdy8ZD2b5AHEKI3PR7MxfXC5uZV+vKs5SP
	 8kQvxBiXATMTEdfZRwJiyMKfIlukum0GqIdfGT3O8PGh6DZUUuMvzKrxnKvPOZPzZz
	 dec8MZwqAyWz04YNYJMJC0u4ipo6rCgf6ZkBeGFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62203F8015A;
	Wed, 14 Aug 2019 07:47:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CFBCF80214; Wed, 14 Aug 2019 07:47:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 845FCF8015A
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 07:47:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 845FCF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nmUZ55Rm"
Received: from localhost (unknown [106.51.111.160])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0319820843;
 Wed, 14 Aug 2019 05:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565761637;
 bh=sGSEpLFwxSA+wPTlqNmCouxrUR10WybyiEQw8oFiCeQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nmUZ55RmgNLBGCLo2iWsovHMXWinQFV+E8dH5Rban/fSxGQogjKDHrS6VslJfQLBc
 4zacY6la89zK0RNkjNlyqAmsDUWxobYWOzGCDWaL6JtGS0Ml8P3pml1sVgxHswtuVC
 xys1QuksyRR7jd/EBug5SMhf5VFFcCo6jx5RDzAM=
Date: Wed, 14 Aug 2019 11:16:04 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Message-ID: <20190814054604.GW12733@vkoul-mobl.Dlink>
References: <20190813061014.45015-1-natechancellor@gmail.com>
 <445d16e1-6b00-6797-82df-42a49a5e79e3@linux.intel.com>
 <20190814035947.GS12733@vkoul-mobl.Dlink>
 <20190814042428.GA125416@archlinux-threadripper>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814042428.GA125416@archlinux-threadripper>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: clang-built-linux@googlegroups.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] soundwire: Don't build sound.o without
 CONFIG_ACPI
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 13-08-19, 21:24, Nathan Chancellor wrote:
> On Wed, Aug 14, 2019 at 09:29:47AM +0530, Vinod Koul wrote:
> > On 13-08-19, 09:22, Pierre-Louis Bossart wrote:
> > > On 8/13/19 1:10 AM, Nathan Chancellor wrote:
 
> > > I am fine with the change, but we might as well rename the file acpi_slave.c
> > > then?
> > 
> > Srini's change add support for DT for the same file, so It does not make
> > sense to rename. Yes this patch tries to fix a warn which is there due
> > to DT being not supported but with Srini's patches this warn should go
> > away as sdw_slave_add() will be invoked by the DT counterpart
> > 
> > Sorry Nathan, we would have to live with the warn for few more days till
> > I apply Srini's changes. So I am not taking this (or v2) patch
> > 
> 
> That is fine as I can apply this locally. Could you point me to these
> patches so that I can take a look at them?

Here you go:

https://lore.kernel.org/lkml/20190808144504.24823-3-srinivas.kandagatla@linaro.org/

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
