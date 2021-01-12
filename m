Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFF82F3B6E
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 21:18:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBD7F16CD;
	Tue, 12 Jan 2021 21:17:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBD7F16CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610482722;
	bh=SRyTkwMGRFc1aIBmO2Fq+aunWYrmsdtjiREmTPBUQa4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lewzcY5XfSYjsZrRY4VERqqb/npni+HNiNsrrEzoDfmI8L3aFUgF31fvkBI0bdIcy
	 2WgjDWBOPdfwqBXuz0K+UUfpH7Bs8JfWF3XhqQ6+6Wma/Le0+8yUxqkSbI6YG8zL8G
	 j+vUpcOrh6exuG+Co88yzmYE5lZfRiLHW7uepUHw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C28D3F804AA;
	Tue, 12 Jan 2021 21:17:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C034BF8025E; Tue, 12 Jan 2021 21:17:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6251F800B9;
 Tue, 12 Jan 2021 21:17:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6251F800B9
IronPort-SDR: d1+w+Unp145nJabYUsYmdXRp2VSPGIDAUADqx7u1rBU219pOkphHY2JhTBMtfxReLdlog1QO1X
 HLyoN0bwtDBw==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="196730932"
X-IronPort-AV: E=Sophos;i="5.79,342,1602572400"; d="scan'208";a="196730932"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 12:17:09 -0800
IronPort-SDR: 29Hbz6FgfIXaFdwmqBXeJT+DW03oBkD+FjOq44WsfUZaY9DMsF/rZx4feKfuCJmvFQIxRlIBdF
 fVgvRuqyFHJg==
X-IronPort-AV: E=Sophos;i="5.79,342,1602572400"; d="scan'208";a="404593879"
Received: from clinton1-mobl1.amr.corp.intel.com (HELO [10.212.214.129])
 ([10.212.214.129])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 12:17:08 -0800
Subject: Re: [Sound-open-firmware] [PATCH] ASoC: SOF: Intel: avoid reverse
 module dependency
To: Takashi Iwai <tiwai@suse.de>
References: <CAK8P3a0PXXHXLK36SB_4eia6z0u3nbBPanATwZEhposKOScqcw@mail.gmail.com>
 <20210105190808.613050-1-arnd@kernel.org>
 <59a36212-2412-2dd3-62f2-69c6f65312b1@linux.intel.com>
 <s5hv9c2qmy4.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ed4b4b5b-0cde-3d08-bbbf-3f0d90ce46ea@linux.intel.com>
Date: Tue, 12 Jan 2021 14:17:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <s5hv9c2qmy4.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Arnd Bergmann <arnd@kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>,
 "linux-kernel @ vger . kernel . org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, sound-open-firmware@alsa-project.org
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


>> Since this is going to be a really invasive change, and past
>> experience shows that mucking with Kconfigs will invariably raise a
>> number of broken corner cases, if there is support from
>> Mark/Takashi/Jaroslav on this idea, we should first test it in the SOF
>> tree so that we get a good test coverage and don't break too many eggs
>> in Mark's tree. We would also need to concurrently change our CI
>> scripts which are dependent on module names.
> 
> I'm in favor of the way Arnd proposed.  It's more straightforward and
> less code.

Thanks Takashi for the feedback.

Since yesterday I looked at another problem where we can have unmet 
dependencies between SoundWire (m) and SOF (y), so we probably need to 
rethink all this. We had similar issue with SOF and HDaudio before, it's 
time to revisit all this.

> 
> If you find the number of modules or the too much cutting out being
> problematic, you can create a module snd-sof-intel-acpi and
> snd-sof-intel-pci containing the driver table entries for all Intel
> devices, too.  In the case, you'll still need some conditional calls
> of intel-dsp-config there, but it's a good step for reducing the
> Kconfig complexity.
> 
>> Also maybe in a first pass we can remove the compilation error with
>> IS_REACHABLE and in a second pass do more invasive surgery?
> 
> Agreed, we'd like to keep less changes for 5.11 for now.

Ack, we'll send smaller changes first.

