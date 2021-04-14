Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1FD35EBA6
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Apr 2021 06:09:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34D8116C6;
	Wed, 14 Apr 2021 06:09:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34D8116C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618373393;
	bh=Z+UFwSwbY5ODpHNEo1Xqlqvm4gPb50y3Q5DfZe0rBQ4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JGTSr3jBq8u2MRcaxCiqIOiwxvcorfi+g4+6twz1yT2pV3Sswi7XydXCDP7azNP2m
	 2IhDPsFH0kcqiCt4Rps1u88/2SN+/JyEsXYHhRMtmvF4cCZQng7Kqy1fwc0WFQHw4T
	 fjcL0ILjl5jb6iicEOWnORE8AqH01PFTBuZpVFQA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7995AF80128;
	Wed, 14 Apr 2021 06:08:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BBE8F80269; Wed, 14 Apr 2021 06:08:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA70FF80128
 for <alsa-devel@alsa-project.org>; Wed, 14 Apr 2021 06:08:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA70FF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bpk/NEet"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC82F61154;
 Wed, 14 Apr 2021 04:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618373294;
 bh=Z+UFwSwbY5ODpHNEo1Xqlqvm4gPb50y3Q5DfZe0rBQ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bpk/NEetYX72BKqsyciatQVIc+LHjsR3P6Sf/Lpt9FmnBFLMt7miUWdYoOgDIx/k7
 8dWC5UDHAN4UjaIWPu3VTp8ikH4MkMyp3smEHvkIlLbeL615mvetSMU8Od3imYFdoI
 d5HJUZEi6YNU1h79dBhe/NEuWMZUKdmkniRW+lcdk3owjidbnjlN2cEq29ryz2rVtu
 C8OHLP69qIb7Jy/f3kDXwY56hbzuSDQPQmX9tq2CkZr3hR0I9feZ+igDJquKqkdSMn
 a4s6hTqHYBmb3CpDz0BkIWYjpXQ9m1LhRxj1druJrwTQGBTq1XWadxDUosTAgj5GN3
 hChOcujmL+Uhw==
Date: Wed, 14 Apr 2021 09:38:10 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com
Subject: Re: [PATCH v2 2/3] soundwire: Intel: introduce DMI quirks for HP
 Spectre x360 Convertible
Message-ID: <YHZqqjUSJvYxhEw6@vkoul-mobl.Dlink>
References: <20210302075105.11515-1-yung-chuan.liao@linux.intel.com>
 <20210302075105.11515-3-yung-chuan.liao@linux.intel.com>
 <de65866a-bb8f-f5c6-2829-42b561f282f7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de65866a-bb8f-f5c6-2829-42b561f282f7@intel.com>
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, hui.wang@canonical.com, sanyog.r.kale@intel.com,
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

On 12-04-21, 14:37, Dave Hansen wrote:
> On 3/1/21 11:51 PM, Bard Liao wrote:
> > +++ b/drivers/soundwire/dmi-quirks.c
> > @@ -0,0 +1,66 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> > +// Copyright(c) 2021 Intel Corporation.
> 
> It looks like this is already in intel-next, so this may be moot.  But,
> is there a specific reason this is dual licensed?  If so, can you please
> include information about the license choice in the cover letter of any
> future version?

The soundwire module from Intel and core soundwire core was always dual
licensed, so it kind of followed that..

> If there is no specific reason for this contribution to be dual
> licensed, please make it GPL-2.0 only.

This module, I would say NO. Unless someone from Intel disagree..
Pierre/Bard..?

If all agree I dont see a reason why this cant be updated to GPL only.

Thanks
-- 
~Vinod
