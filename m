Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAF0A2A2C
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 00:47:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7EFD166E;
	Fri, 30 Aug 2019 00:46:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7EFD166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567118867;
	bh=dakndx3PPdFBDMvjgF+MB2aGdDz+KdFEeTnPmWv0SF0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O111ahQXX6tLKqQg4RWr1EuGUghinxXygcuU3fixE6uYxegn21vYf0g8dVZTGzzZO
	 eArV6RdPMW94SqtngJ0NiIrHbD8oqd1wc19Q/yHVAKjxMeIuBSgVP+38137yax3E2q
	 6HXdYWxId1cuuO8/IlyCrBxCST2JK5+896dAGJTY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A69DDF80273;
	Fri, 30 Aug 2019 00:46:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9BBEF80148; Fri, 30 Aug 2019 00:45:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_65,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 335D7F800E7
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 00:45:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 335D7F800E7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Aug 2019 15:45:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,445,1559545200"; d="scan'208";a="380931157"
Received: from hfranco-mobl1.amr.corp.intel.com (HELO [10.252.205.159])
 ([10.252.205.159])
 by fmsmga005.fm.intel.com with ESMTP; 29 Aug 2019 15:45:50 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20190822113616.22702-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <95d05cf3-b409-6c03-2419-4634586e21dc@linux.intel.com>
Date: Thu, 29 Aug 2019 17:45:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822113616.22702-1-cezary.rojewski@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 0/4] ASoC: Intel: Haswell: Adjust machine
	device private
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 8/22/19 6:36 AM, Cezary Rojewski wrote:
> Apart from Haswell machines, all other devices have their private data
> set to snd_soc_acpi_mach instance.
> 
> Changes for HSW/ BDW boards introduced with series:
> https://patchwork.kernel.org/cover/10782035/
> 
> added support for dai_link platform_name adjustments within card probe
> routines. These take for granted private_data points to
> snd_soc_acpi_mach whereas for Haswell, it's sst_pdata instead. Change
> private context of platform_device - representing machine board - to
> address this.
> 
> Caught by recent cleanups where content of sst_pdata was moved.
> Currently, despite the incorrect cast, dereferenced field points happily
> to NULL (uninitialized field), so no panics were observed.

No issues seen on Broadwell w/ rt5677 (Samus) so

Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

I think the two broadwell/bdw-rt5677 cases are the only ones used in 
products, I am not aware of anyone using the haswell machine driver.

Sorry for being thick with the review, I couldn't figure out from the 
patch itself how the code worked and what this DRV_NAME represented. 
It's definitively legit when looking at the entire tree, but I 
discovered that the 'DRV_NAME' is defined 3 times, see below. It's just 
lunacy to use the same define with different strings in different Intel 
drivers, we should clean this up with a prefix to avoid ambiguities.

atom/sst-mfld-platform.h:#define DRV_NAME "sst"
baytrail/sst-baytrail-pcm.c:#define DRV_NAME "byt-dai"
haswell/sst-haswell-ipc.h:#define DRV_NAME "haswell-dai"

> 
> Cezary Rojewski (4):
>    ASoC: Intel: Haswell: Adjust machine device private context
>    ASoC: Intel: haswell: Simplify device probe
>    ASoC: Intel: bdw-rt5677: Simplify device probe
>    ASoC: Intel: broadwell: Simplify device probe
> 
>   sound/soc/intel/boards/bdw-rt5677.c | 6 +-----
>   sound/soc/intel/boards/broadwell.c  | 6 +-----
>   sound/soc/intel/boards/haswell.c    | 6 +-----
>   sound/soc/intel/common/sst-acpi.c   | 3 ++-
>   4 files changed, 5 insertions(+), 16 deletions(-)
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
