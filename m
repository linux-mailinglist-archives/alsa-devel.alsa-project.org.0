Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBBB559AE4
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 16:07:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18B18185A;
	Fri, 24 Jun 2022 16:06:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18B18185A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656079648;
	bh=j4mdRUHWF06xIvdnFh7e+yW16o8vEi1J7F63DLx4Kzc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eoacI8b0aOishrgfVdmgLpbS1ZTUu1cibQPdymcf2QZdlQlVnrBft0BRqH72D4ynz
	 dKLrKC1dyywou3HqGfuNtz7m/juEGJdSP6AxdF99aMVeDAOWRvcgA71mALX0FQj6jZ
	 uIcFkSgbuRHqH72a0p/ySS2GxNFGFYMduvXcnTMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71FE0F80165;
	Fri, 24 Jun 2022 16:06:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91EB7F80139; Fri, 24 Jun 2022 16:06:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F068F80109
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 16:06:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F068F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="OmoSZ4h5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656079584; x=1687615584;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=j4mdRUHWF06xIvdnFh7e+yW16o8vEi1J7F63DLx4Kzc=;
 b=OmoSZ4h5mn1fT7RK7AmsvM3D8FGlLJyBklRau7HlQzBu1NRo2Jvy97EA
 PNeuCLXy06z6X3Iojm2jg8HgYceZeder8sdtJFIzts4TybqkzA1oXE8Pa
 dp+sbhVsK1XP9XXNmipniNaSJRfQnd0DEO3pyocccgSRAqgLw2ys7R1/B
 YwPkvYBXfT/GWgCWFzRyEnZ7+SXGJxdEZbOErkIHEOTDo7gOhFUhDxKbK
 hS0xS/U+Y9uLCWGShoBy/2MBrnbaFufrxHaJJcfATbIFqESTo0fn5I0pn
 sAF0RGWM3C+jLueZJ5MyxmLf7qIafPABNw3u4RU9aylzDg34SKm6AWyyS A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10388"; a="260821501"
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="260821501"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 07:05:58 -0700
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="645285622"
Received: from jgraeber-mobl2.amr.corp.intel.com (HELO [10.212.113.127])
 ([10.212.113.127])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 07:05:57 -0700
Message-ID: <ac2b7d8b-a5be-4fac-169c-eaca185c9746@linux.intel.com>
Date: Fri, 24 Jun 2022 08:52:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH 0/4] ASoC: Intel: Mark BE DAIs as nonatomic for hsw and
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20220624134317.3656128-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220624134317.3656128-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: hdegoede@redhat.com, tiwai@suse.com, amadeuszx.slawinski@linux.intel.com
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



On 6/24/22 08:43, Cezary Rojewski wrote:
> Address the warning: "Codec: dpcm_be_connect: FE is nonatomic but BE is
> not, forcing BE as nonatomic" by marking BE DAI as nonatomic. Aligns
> with what is already done for FE DAIs.
> 
> This patchset iterates the change over all HSW and BDW related machine
> board drivers.

I don't think this is necessary, I was planning to demote this warning
to a simple dev_dbg or possibly remove this message entirely.

The BE DAIs can perfectly be declared as non-atomic in all Intel machine
drivers, except for SoundWire where there's a known delay during the
.trigger.

> Cezary Rojewski (4):
>   ASoC: Intel: hsw_rt5640: Mark BE DAI as nonatomic
>   ASoC: Intel: bdw_rt286: Mark BE DAI as nonatomic
>   ASoC: Intel: bdw_rt5650: Mark BE DAI as nonatomic
>   ASoC: Intel: bdw_rt5677: Mark BE DAI as nonatomic
> 
>  sound/soc/intel/boards/bdw-rt5650.c | 1 +
>  sound/soc/intel/boards/bdw-rt5677.c | 1 +
>  sound/soc/intel/boards/bdw_rt286.c  | 1 +
>  sound/soc/intel/boards/hsw_rt5640.c | 1 +
>  4 files changed, 4 insertions(+)
> 
