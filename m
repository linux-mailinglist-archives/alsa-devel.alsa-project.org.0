Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C15F017C799
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 22:10:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B54815E5;
	Fri,  6 Mar 2020 22:09:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B54815E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583529003;
	bh=HxLKI2JOBtSGtTPtUld3kGSEuL2kXLoaN/bwC16qKsU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NvynlTRWtj2BrITYCJqjWhUdQEYQv8N1UzZFQAkZ28l+3vCeEUygrL56wjlOSahRa
	 P0nws6uMcc5VM4JcupdiS7IkvfqH5kGSE8KzY7SDCLXnV4PYsn3H8Zi/3k4pJNEBVn
	 APNYjNxcSTQPZZEV/2dNPr2BAzbCI3tnJpd7LnAg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32900F80291;
	Fri,  6 Mar 2020 22:06:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64284F801EC; Fri,  6 Mar 2020 22:05:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50837F80125
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 22:05:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50837F80125
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Mar 2020 13:05:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,523,1574150400"; d="scan'208";a="275688910"
Received: from jrbond-mobl.amr.corp.intel.com (HELO [10.254.11.58])
 ([10.254.11.58])
 by fmsmga002.fm.intel.com with ESMTP; 06 Mar 2020 13:05:45 -0800
Subject: Re: [PATCH 0/7] ASoC: Intel: Skylake: Fix HDaudio and Dmic
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200305145314.32579-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9d53337b-b02b-efd7-790e-c3db18562346@linux.intel.com>
Date: Fri, 6 Mar 2020 14:48:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200305145314.32579-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: vkoul@kernel.org, broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com
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

Hi Cezary,

Thank you for this series. You should have mentioned that this fixes an 
issue that's been around since September 2018, and for which there's 
currently no solution on KabyLake/AmberLake platforms - 
PCI_DEVICE(0x8086, 0x9D71)

https://bugzilla.kernel.org/show_bug.cgi?id=201251

> This patchset has been prepared internally for topmost linux-stable 5.5
> and 4.20 (no 4.19 as skl_hda_dsp did not exist there yet).
> 
> Apart from our RVPs, we have run tests also on:
> - KBL Lenovo Carbon X1
> - SKL Dell XPS 9350
> - WHL Acer Swift 5
> 
> Honestly, I'd see HDaudio related patches being backport as low as 4.20
> (although some changes had to be adjusted due to base differences
> between 4.20 and 5.5, can share these too). One could argue HDA + Dmic
> configuration should be available on 4.19 too - it's an LTS after all.
> However, that time, some changes could be counted as "feature" rather
> than fixes. Awaiting your replies and thoughts on that.
> 
> In consequence, I've appended "Fixes" only for last two patches for now
> - once decisions are made, can append adequate tags wherever necessary.

There's been a couple of accidental regressions already on stable, now 
fixed, and my understanding is that the bar for inclusion is higher, so 
let's assume this counts as a new feature: it never worked before with 
an upstream kernel and distributions haven't had access to topology 
files either. If a specific distribution wants to backport on top of a 
-stable version, that's entirely possible but that would be their 
decision. They would not only need to update the kernel but topology and 
UCM as well.

One comment though: in the absence of blacklist/voodoo magic, this 
solution will not be selected with GLK+/WHL, the default with dmics is 
SOF. Even on KBL, the legacy driver would be selected, we only select 
the SST driver for SKL and KBL Chromebooks.

You would have to modify the dsp-config stuff [1] to load the skl driver 
on KBL, which likely requires a FLAG_SST_ONLY_IF_DMIC definition, and 
probably add a Kconfig since SOF will at some point support KBL, and we 
want to prevent conflicts between PCI drivers registered for the same 
ID. The order in that table might be enough though, it's much better 
than the selection based on a Makefile inclusion.

Patches 6/7 don't seem to be related to DMICs, so we should probably 
discuss them separately.

Thanks
-Pierre

[1] 
https://elixir.bootlin.com/linux/latest/source/sound/hda/intel-dsp-config.c#L118
