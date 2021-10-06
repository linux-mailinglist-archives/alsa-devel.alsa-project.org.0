Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 401554243E6
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 19:20:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43A071673;
	Wed,  6 Oct 2021 19:19:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43A071673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633540821;
	bh=kQQAWVVjPE9zaz8ROhCYPPEmwAWD9MyaCe2Sfkrx8Hs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HcVtbdYIfxCLsbXHzE9sThBrLSwcPGOuxGuXVH/vcHuv/8E6Dj0O+ihkNdw0Tgk79
	 rScWNM88CLtqX9Uzll4VEJ9/0JLWw0u3Cy9sOJwJa3fGCstY512haqfiPtoo7Xnydk
	 0NCks/kkoDhNkyhVSjYYD22U0SNRNAr4FpCaAP/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB51DF804E2;
	Wed,  6 Oct 2021 19:19:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B438BF804E6; Wed,  6 Oct 2021 19:19:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E0C2F8020D
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 19:19:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E0C2F8020D
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="289555626"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="289555626"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 10:18:58 -0700
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="439196894"
Received: from nbasa-mobl2.amr.corp.intel.com (HELO [10.213.170.135])
 ([10.213.170.135])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 10:18:57 -0700
Subject: Re: [PATCH v1 3/4] ASoC: Intel: bytcr_rt5651: use
 devm_clk_get_optional() for mclk
To: Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20211006150451.16561-1-andriy.shevchenko@linux.intel.com>
 <20211006150451.16561-3-andriy.shevchenko@linux.intel.com>
 <2d190513-7ac4-731c-7c9a-1f60a98f6345@linux.intel.com>
 <YV3NZnb6mg43nUC1@smile.fi.intel.com>
 <015e084e-70ed-7b5c-b103-8426ef0842d4@linux.intel.com>
 <999a1046-864e-2b47-6f44-6e8e42528b18@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <fdbb840c-3a72-eae3-a650-bd6cc5abc53b@linux.intel.com>
Date: Wed, 6 Oct 2021 12:18:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <999a1046-864e-2b47-6f44-6e8e42528b18@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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




>> We'd need to Hans to comment on this since he's really the only one
>> maintaining this code.
> 
> So as Mark wrote in his later reply:
> 
> "AIUI with the clock API the idiomatic thing is that any optionality is
> handled at the point where the clock is acquired - if the clock is
> optional you end up with NULL which in the clock API is a dummy clock
> and ignored.  The rest of the code then doesn't need to worry about any
> of this stuff and the handling can only be in one place."
> 
> Combined with there pretty much always actually being an mclk I believe
> that this patch from Andy results in a nice cleanup so I'm in favor with
> this. And the other cleanups also look sensible to me

No sustained objection on my side.

Thanks Andy for starting this thread.
