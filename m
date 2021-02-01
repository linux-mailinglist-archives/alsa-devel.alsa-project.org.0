Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4267B30A592
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 11:40:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C11A716EF;
	Mon,  1 Feb 2021 11:39:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C11A716EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612176009;
	bh=lm8X3GKu5SNKtsEnd0SUr/ObfF/s25EHiET6S6n5UPg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J1kAavX8B5R5SkHzzO4UOs+XZZnHKybr6C/BrKUEQKV2ft+98MmwdoRbhAGSCJOpi
	 4/Lyp2Bit8jbjo0cX5H2VE1Pi58Wd9o9nEzyZMGqaEDjMRUWJThJYF8JUNszqmD0AZ
	 5PNF4DVWenHArEZRMxg+pKo7EZWlhXnTRarXEKcU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12434F80151;
	Mon,  1 Feb 2021 11:38:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B93F9F80153; Mon,  1 Feb 2021 11:38:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CED0F80151
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 11:38:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CED0F80151
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Io9CRcs1"
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB44764E99;
 Mon,  1 Feb 2021 10:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612175910;
 bh=lm8X3GKu5SNKtsEnd0SUr/ObfF/s25EHiET6S6n5UPg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Io9CRcs1XTSHUs4iCAvpc1B+xzVJ51g6YR6dzwx+I8F+/x2b+Miyv827+4EL2L9Ws
 +2bFTFGb0dZtOiQntx7Oy4S+p3jB7kFhK8IwJ1V9kwzHMK9mMMBqWIBLSekFdf0C2b
 XamtswYRtfj5r8F6msySeEPMkEa5AiC3cHx3OBf+mqtoH97H870oUbOSIMT3E5vz+1
 uRwKt5KoBjdIlTR9A4isxHSOt5XrRFdXBOxUZteNps47G/ig/As8Jotbev0OdNfgPX
 n384mImWXy3GfJIT/BZpyKdaKySTda/M89/ztLeuemzGX4wyvg5wwTV7s/jbvASEb/
 gFyuFJORF1E+w==
Date: Mon, 1 Feb 2021 16:08:25 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 1/3] soundwire: bus: clear bus clash interrupt before the
 mask is enabled
Message-ID: <20210201103825.GV2771@vkoul-mobl>
References: <20210126083746.3238-1-yung-chuan.liao@linux.intel.com>
 <20210126083746.3238-2-yung-chuan.liao@linux.intel.com>
 <20210201102844.GU2771@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210201102844.GU2771@vkoul-mobl>
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org, bard.liao@intel.com,
 jank@cadence.com, sanyog.r.kale@intel.com, rander.wang@linux.intel.com,
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

On 01-02-21, 15:58, Vinod Koul wrote:
> On 26-01-21, 16:37, Bard Liao wrote:

> >  struct sdw_master_prop {
> >  	u32 revision;
> > @@ -421,8 +422,11 @@ struct sdw_master_prop {
> >  	u32 err_threshold;
> >  	u32 mclk_freq;
> >  	bool hw_disabled;
> > +	u32 quirks;
> 
> Can we do u64 here please.. I dont know where we would end up.. but
> would hate if we start running out of space ..

Also, is the sdw_master_prop right place for a 'quirk' property. I think
we can use sdw_master_device or sdw_bus as this seems like a bus
quirk..?

--
~Vinod
