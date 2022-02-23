Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AFA4C1B3E
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 19:56:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4437D191E;
	Wed, 23 Feb 2022 19:56:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4437D191E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645642616;
	bh=6ATkQ3SPbHg1uNzvDgcRhzJ0i/tVyFJ14GLbD7i2C7I=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ClSiXdEpQLDz3kl/9cI3OkKd9hnnLSwFMcvExlRkR7GbSnbCJgnnPC3RTtz4e3sss
	 auacozWZkZ1jwNDiKGCGulYmUpZVoS6SPvApP2e1PakP1kl73Wjq5c0lhdv62ezy08
	 PVJnlwAyFXClFlpjb8YRDgLVr7gs4Zt0nOW36cz4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B70A0F800B6;
	Wed, 23 Feb 2022 19:55:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA158F800F5; Wed, 23 Feb 2022 19:55:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBC78F800F5
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 19:55:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBC78F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="iWJBgZ8r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645642546; x=1677178546;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6ATkQ3SPbHg1uNzvDgcRhzJ0i/tVyFJ14GLbD7i2C7I=;
 b=iWJBgZ8rmJK0pxp2NCzgmv9UhU4PKOgNf8wyiezGKY4Hg4ljZKBg7Psd
 wKQQKsQAo7ZYdanrbE5DymGTJ9bymtXojkAdJ0I7R7u7a2Bju+df3Pcfz
 ykQWF7aL3wVLTvoa6N83V0EBmNycV6f39sD8KZ3POzwxWJkQEw2T8isOU
 RW6ll0a/2Q2wj79UC8L4db5x04fm+dY4GYHL40LJ+bW9cGPek49lNVdZ2
 NB8BIaMNeql8wjXk5fmDOU5VQ2Ko+0rOaI0g9og1kKzFO9FBjFEhY04EP
 1ILziQMaUbg99kaF9+VeHJhPicOQqhJKM/wCJJ9JJEn3C7sc7gk2vgYpC w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="276676935"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="276676935"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 10:55:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="491319470"
Received: from aacunaco-mobl1.amr.corp.intel.com (HELO [10.209.144.93])
 ([10.209.144.93])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 10:55:37 -0800
Message-ID: <6e79238c-2ceb-0ae7-2b37-7ffac777db60@linux.intel.com>
Date: Wed, 23 Feb 2022 12:14:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] soundwire: qcom: add wake up interrupt support
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, robh+dt@kernel.org, 
 vkoul@kernel.org, yung-chuan.liao@linux.intel.com
References: <20220221104127.15670-1-srinivas.kandagatla@linaro.org>
 <20220221104127.15670-4-srinivas.kandagatla@linaro.org>
 <5e050d4c-e3d2-35fb-ca49-7be53579bc31@linux.intel.com>
 <1cb4e02f-f040-23bd-44d0-0675429332bd@linaro.org>
 <49099bcb-35e9-0bea-9658-006caed3ab33@linux.intel.com>
 <ee14c940-85c9-6c14-5738-e055801407ab@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ee14c940-85c9-6c14-5738-e055801407ab@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, quic_srivasam@quicinc.com
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



>> Not following, sorry. if you use pm_runtime functions and it so happens
>> that the resume already started, then those routines would wait for the
>> resume to complete.
> yes that is true,
> 
> TBH, I was trying to reproduce the issue since morning to collect some
> traces but no luck so far, I hit these issues pretty much rarely. Now
> code has changed since few months back am unable to reproduce this
> anymore. Or it might be just the state of code I had while writing this up.
> 
> But when I hit the issue, this is how it looks like:
> 
> 1. IRQ Wake interrupt resume parent.
> 
> 2. parent is in middle of resuming
> 
> 3. Slave Pend interrupt in controller fired up
> 
> 4. because of (3) child resume is requested and then the parent resume
> blocked on (2) to finish.
> 
> 5. from (2) we also trying to resume child.
> 
> 6. (5) is blocked on (4) to finish which is blocked on (2) to finish
> 
> we are dead locked. Only way for me to avoid dead lock was to wake the
> child up after IRQ wake interrupts.

Maybe a red-herring, but we're seen cases like this where we called
pm_runtime_get_sync() while resuming, that didn't go so well. I would
look into the use of _no_pm routines if you are already trying to resume.

