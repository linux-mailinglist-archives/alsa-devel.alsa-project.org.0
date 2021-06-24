Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 877863B341F
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Jun 2021 18:45:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22D5C1658;
	Thu, 24 Jun 2021 18:44:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22D5C1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624553109;
	bh=5wyQKcQ1/kWF/yJZWinDcHWQyskroJOtwl+LGX99WYk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Asq3HAFk7HKwe5NFpspZ/uIEj9JNWgxjkZLX35P552b2UWZcM/IIUlUHCLSGpKcKB
	 feux2KUcPtFpJtTVqsSwj9pXC/lc0FFmpmHbHAiwEUkFlq/bhBLYpmljK7Kn7hcGJ3
	 elKxqCjQPHYWAwIlRzrydpRNmg18U84iWC3OxJBQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B311F80268;
	Thu, 24 Jun 2021 18:43:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A8DBF8025F; Thu, 24 Jun 2021 18:43:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D92EF800E1
 for <alsa-devel@alsa-project.org>; Thu, 24 Jun 2021 18:43:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D92EF800E1
IronPort-SDR: muurg8ykBZd17b9/q1GoaQfiNgnorvlqH3XA+uzYTyr1EYVY3a3i8sG3QGZO7hlNSaNCJkB946
 JRaK32NdTqBg==
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="207549471"
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="207549471"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 09:43:28 -0700
IronPort-SDR: cglCb6qWy+HvcZNPjTlztfInhs4XhMaRlK9BSD3x/aJxpCX/g5ASw8MBCMXM04jrRGSVP73v20
 lsujNWGX6NOg==
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="556554836"
Received: from rrudrapp-mobl.amr.corp.intel.com (HELO [10.209.145.55])
 ([10.209.145.55])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 09:43:26 -0700
Subject: Re: [GIT PULL] ASoC fixes for v5.13-rc7
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
References: <20210623170530.DFA99611C1@mail.kernel.org>
 <s5hpmwbn0o2.wl-tiwai@suse.de> <20210624100734.GA3912@sirena.org.uk>
 <s5h5yy3msd6.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <bc8a45a2-38b4-cc63-83c5-55a6f59d0d30@linux.intel.com>
Date: Thu, 24 Jun 2021 11:43:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <s5h5yy3msd6.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
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



On 6/24/21 6:09 AM, Takashi Iwai wrote:
> On Thu, 24 Jun 2021 12:07:34 +0200,
> Mark Brown wrote:
>>
>> On Thu, Jun 24, 2021 at 10:10:05AM +0200, Takashi Iwai wrote:
>>
>>> If you have some commits that must be inevitably in 5.13, let me know,
>>> then I can cherry-pick and submit to Linus.
>>
>> I think these ones:
>>
>>>>       ASoC: rt5645: Avoid upgrading static warnings to errors
>>>>       MAINTAINERS: remove Timur Tabi from Freescale SOC sound drivers
> 
> OK, I'll prepare for them.

My apologies, I should have made it clearer that we didn't intend the Intel fixes to be part of the v5.13 cycle, it's way too late indeed.
