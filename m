Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE70B258D7B
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 13:35:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C84A17A9;
	Tue,  1 Sep 2020 13:34:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C84A17A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598960109;
	bh=bhPhlbwAmyGoASWnNSCDuRRdkSeiudPhUJeU+57U49E=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FTH//hnbxW0wbqSUbzUGUsR6U8jgWcSREjKsfABYISCsjczVt/XiWZwM5SG+HTrGJ
	 StOHrblmM45nI+DYPMa32nduYwf9ljIUw2kSCwsQ6UkuZezPwfynC3L7Rn24MMuu5i
	 RGZpvY1E0e+y8KZkfvmMJRBCV8tRKzzLOwkOTieo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B168F801DA;
	Tue,  1 Sep 2020 13:33:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04483F80217; Tue,  1 Sep 2020 13:33:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=NICE_REPLY_A,PRX_BODY_30,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA317F801DA
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 13:33:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA317F801DA
IronPort-SDR: zdctdQD4Tshxt2WiTJz+E44giZrPM9H2zoLOqOOiv1Qekk/DbAgCr/2sflLGRBDuKa27pDiPEO
 GcbP2u6BrUAQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="154549336"
X-IronPort-AV: E=Sophos;i="5.76,379,1592895600"; d="scan'208";a="154549336"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 04:33:09 -0700
IronPort-SDR: oWmh7cbrVaB1rk0Du1ihDSb/ClRyVT5u+YSOgfHFDXtjKJRjAAkM9bWs3iA7jYotU/ywR668SJ
 ElEFMiybkb4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; d="scan'208";a="340995643"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.249.145.54])
 ([10.249.145.54])
 by orsmga007.jf.intel.com with ESMTP; 01 Sep 2020 04:33:06 -0700
Subject: Re: [bug report] 'ASoC: Intel: haswell: Power transition refactor'
 and PulseAudio
To: Christian Bundy <christianbundy@fraction.io>
References: <9bc5b3ac-87a0-4d7c-abfd-2407db90d310@www.fastmail.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <28ee99bc-fe27-9111-893b-1cb000067a7c@intel.com>
Date: Tue, 1 Sep 2020 13:33:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <9bc5b3ac-87a0-4d7c-abfd-2407db90d310@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, yang.jie@linux.intel.com, zwisler@google.com,
 pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org
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

On 2020-08-31 11:55 PM, Christian Bundy wrote:
> After upgrading to Linux 5.8 I discovered an audio issue on my device that was introduced in 8ec7d6043263ecf250b9b7c0dd8ade899487538a [0]. I used 'git bisect' to identify the commit that introduced the bug and have confirmed that reverting the commit resolves the problem
> 
> Reproduction:
> 
> 1. Play any audio via PulseAudio.
> 2. Observe that the audio output is fuzzy and choppy.
> 
> I can use programs like mpv to play audio without PulseAudio, and the audio is fine, but as soon as I open a process that uses PulseAudio it will ruin the audio output for all processes (including mpv) until I reboot.
> 
> I'm using a 2015 Chromebook Pixel ("Samus") and have confirmed this problem with a friend who has the same device.
> 
> Is there anything I can do to help debug this instead of sending a patch to revert the commit?
> 

Hello Christian,

Thank you for report! Issue is a known one to us and has already been 
addressed by:

	[PATCH v4 00/13] ASoC: Intel: Catpt - Lynx and Wildcat point
	https://www.spinics.net/lists/alsa-devel/msg113762.html

waiting for final dependency to be merged (Andy's resource-API changes, 
as Mark already added the SPI ones) so v5 with review changes can be 
provided. Shouldn't be long before this gets merged. As consequence, 
/haswell/ ceases to exist.

Basically, once power-cycle (D0 -> D3 -> D0 transition flow) had been 
fixed, more - previously hidden - problems arisen. Instead of sending 
70+ patches to Mark refactoring existing code to recommended flow (+ 
readability and performance improvements), replacement is provided along 
with old code being removed entirely.

For now, if there's a possibility for you to modify your kernel, said 
patch can be safely removed from your local repo. Note: following is the 
outcome:
- DMA init may occasionally fail on early boot (audio card won't be 
present at all, requires reboot)
- D0/D3 flow doesn't follow recommended sequence and thus power-saving 
may be limited or non-existent
Probably still better than permanently fuzzied audio..

I'm sorry for any inconvenience this has caused to you.

Regards,
Czarek
