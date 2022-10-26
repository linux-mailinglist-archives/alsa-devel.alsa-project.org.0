Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D8960EA78
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 22:44:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A517388A;
	Wed, 26 Oct 2022 22:43:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A517388A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666817042;
	bh=1gaLxx2/iHz7YZIBgFqkbZxBg68PkAwpn99ti8lfuqs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Em685/2F0eWvQDnfHYiXL49ezbS/mraBeGSZPpnz9GpJ9GDxsRM/j3LP5N8XZVoWP
	 ApduvVH86vG67Jtw0+aymj6EUJii1Q5iMe+AL9HLqvyNxahDULr8UnRX7KCC2oR9RN
	 EKW4LswEYybZrmjWeMTk6xpEUSYmTEylZUngFna0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8906F8055A;
	Wed, 26 Oct 2022 22:42:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F997F804B4; Wed, 26 Oct 2022 22:42:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E815F803DC
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 22:42:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E815F803DC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MRnAVB2M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666816937; x=1698352937;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1gaLxx2/iHz7YZIBgFqkbZxBg68PkAwpn99ti8lfuqs=;
 b=MRnAVB2MOgiMnHVJmssMp4OIt4VIc6+wmRnOHpnb8v5XHf+GCfjG6NGY
 RX1aejQ36tG/ozNkMRPnuI9nKOA2VzMxKvdJSr/jXQoH0YzCd2tBFWI6V
 RpkkewS75txlQ4pw0wh2Qc1mr2Am3qAw8j5BFhh0Ju65wSVCqTdJds/uR
 tbEi8HvzJAzWwzGu1Xt6rR+6Q9f/OqiZ9clDxHRru/TFoWFCuzoY2xPU1
 A+EUs3EDFlXSXSBDqFft34XnAGFc6xV5UOnuzPthWI75VGsOLIH9CfGVj
 jLnGIksRInmdzUHLV27JTzAfwKM+blSeXrnQKVv+Tass0yJOYvL9LSkJh w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="308048958"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="308048958"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 13:42:05 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="610103338"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="610103338"
Received: from bcoan-mobl2.amr.corp.intel.com (HELO [10.209.189.197])
 ([10.209.189.197])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 13:42:05 -0700
Message-ID: <3f207f82-e177-c833-b2b0-ca9e64a6e9a7@linux.intel.com>
Date: Wed, 26 Oct 2022 15:41:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [Regression] Bug 216613 - Sound stopped working with v6.0.3 on
 Lenovo T14 Gen2i: ASoC: error at snd_soc_component_probe #forregzbot
Content-Language: en-US
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <2c028797-b313-be93-7b1e-8d838e694948@leemhuis.info>
 <f34cafd4-f224-ad10-6962-e8f6c709cb39@leemhuis.info>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <f34cafd4-f224-ad10-6962-e8f6c709cb39@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, LKML <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
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



On 10/26/22 07:08, Thorsten Leemhuis wrote:
> [Note: this mail is primarily send for documentation purposes and/or for
> regzbot, my Linux kernel regression tracking bot. That's why I removed
> most or all folks from the list of recipients, but left any that looked
> like a mailing lists. These mails usually contain '#forregzbot' in the
> subject, to make them easy to spot and filter out.]
> 
> On 22.10.22 08:35, Thorsten Leemhuis wrote:
>> Hi, this is your Linux kernel regression tracker speaking.
>>
>> I noticed a regression report in bugzilla.kernel.org. As many (most?)
>> kernel developer don't keep an eye on it, I decided to forward it by
>> mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216613 :
>>
>>>  Grzegorz Alibożek 2022-10-21 19:26:43 UTC
>>>
>>> After upgrade kernel from 6.0.2 to 6.0.3 on Lenovo T14 Gen2i, sound stopped working.
>>> dmesg:
>>>
>>> paź 21 21:11:45 kernel: snd_hda_codec_hdmi ehdaudio0D2: failed to create hda codec -12
>>> paź 21 21:11:45 kernel: snd_hda_codec_hdmi ehdaudio0D2: ASoC: error at snd_soc_component_probe on ehdaudio0D2: -12
>>> paź 21 21:11:45 kernel: skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: failed to instantiate card -12
>>>
>>> [reply] [−] Comment 1 Grzegorz Alibożek 2022-10-21 19:56:43 UTC
>>>
>>> Created attachment 303070 [details]
>>> trace
> 
> #regzbot introduced: 7494e2e6c55ed19
> #regzbot fixed-by: 02356311982b

Revert on its way:

https://lore.kernel.org/r/20221024143931.15722-1-tiwai@suse.de
