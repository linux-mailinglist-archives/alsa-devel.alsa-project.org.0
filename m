Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6F0328010
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 14:54:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2637516AE;
	Mon,  1 Mar 2021 14:53:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2637516AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614606878;
	bh=ExZVqku75Co3OApbG13LcXf3+8VU5GNXgfPiW99Yi7I=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cUXrkza2ClO2wyRwgBHlZRV1Wegmc2Zpc1LCppJz3j3l+EJVNdR6OqLSA1U4qWp1a
	 jEzyncqG1dz9gt1gHnYwJ4jgDKoEiQOMFyeQEK5GRa6rqsjp0VMo7mT/VuXyhACHcZ
	 l+vZFzv1jseEddb+N52Y5wjsEjLI2ioioYGYGIfI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCBAAF8050F;
	Mon,  1 Mar 2021 13:37:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 160BDF80508; Mon,  1 Mar 2021 13:37:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4340F804FC
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 13:37:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4340F804FC
IronPort-SDR: b/vuZWofEZmvPlLfwaQghgcPHT1oNkDf2kr+M/VzkxULlo5jmgv85W7oC4fnk75pM/fYU98Ptm
 qe5+FJGyaYeA==
X-IronPort-AV: E=McAfee;i="6000,8403,9909"; a="165681141"
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; d="scan'208";a="165681141"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 04:37:16 -0800
IronPort-SDR: 6KMnGF1B+htsRyDuEnC0Bakm+2zocqOdXoKQvE9rjiZ01/882mKLfarANPUHwhR4OE0RyKhVuA
 cu4qtWHT+Reg==
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; d="scan'208";a="397708026"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.1.91])
 ([10.213.1.91])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 04:37:14 -0800
Subject: Re: [PATCH] ASoC: Intel: Skylake: Compile when any configuration is
 selected
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
References: <20210125115441.10383-1-cezary.rojewski@intel.com>
 <CAAd53p4fycxLn6y0WpaMWvWkN8EwmT216b40DavttfshN_GMRg@mail.gmail.com>
 <324dc8a5-c4d3-6ebf-c8e9-6321d6c93dab@intel.com>
 <CAAd53p4gqyuFPWX55fnPGHORXXf58++ZRMH9WFYp+QwS1=xDJQ@mail.gmail.com>
 <181c989f-7a4d-3cdd-11be-7378dbc9502c@intel.com>
 <5e970d19-9544-50fe-f140-b66245418c6e@intel.com>
 <CAAd53p4srH6NFwcyUCBnLj=MS8-YBvA9CPjMbcryGgi5CmUUHw@mail.gmail.com>
 <2c93bf65-4996-08c6-5be1-da4b9966e168@intel.com>
 <f20e5e2b-3761-5e13-3166-5f026d088aa1@intel.com>
 <CAAd53p6ZyuAzNJWLyONkbFndSRF2HBLn=6HLzb5RUShCmNWdVQ@mail.gmail.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <46f88397-dd4e-ffb4-3bd3-8f64c4827b66@intel.com>
Date: Mon, 1 Mar 2021 13:37:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAAd53p6ZyuAzNJWLyONkbFndSRF2HBLn=6HLzb5RUShCmNWdVQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>
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

On 2021-02-22 4:04 PM, Kai-Heng Feng wrote:
> Hi Cezary,
> 

...

>>
>> I'd like to close the compilation issue which this patch is addressing.
>> Could you confirm that the presented change fixes the issue on your end?
> 
> No, the SST regression is not fixed.
> However, it's not the scope of this patch, which is to fix a different issue.
> 
> So please proceed to merge the patch. We can discuss the SST
> regression in other thread.
> 

Thanks for the reply Kai-Heng.
Could you elaborate on the SST regression subject though?

Mark, do you want me to re-send the patch?

Regards,
Czarek
