Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FC45537EC
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jun 2022 18:37:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D13641FFF;
	Tue, 21 Jun 2022 18:36:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D13641FFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655829452;
	bh=ze5aXOYQD5VRVjinV7+sHtzJnMcVQ80HvN3NDtgraag=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o+bexU9U7bRpbj0fUQnhtxGeoOQV0HfpTIamW4xlQOWL6CJeQgi/VdBUlh8TOKvG3
	 YUxQ+SaAX7i+l7oWSyhgrExJU1wDnv6xN13Zx0a2GeQlQCcV4Ul+fCnpf8IoFczfu5
	 sTkSwXRXXCcLutXjK7Pt+QVTDP2FY0r8ytoZqFyw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E988F800E3;
	Tue, 21 Jun 2022 18:36:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A04AF80155; Tue, 21 Jun 2022 18:36:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2992F800CB
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 18:36:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2992F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="M+cDykGW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655829388; x=1687365388;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ze5aXOYQD5VRVjinV7+sHtzJnMcVQ80HvN3NDtgraag=;
 b=M+cDykGWE+prDctT9egm01mKgYjzJCVzJDVwmAsDa0kVuyUJU5lLoR+y
 53d4AIslB3GCFOqAK6zcko1SCkLrSRsCT7RXZVLGv2VtNgzIXxzRaFBGX
 TAIN21wLAUCYaZTZBYsH5KzXubnb3eWEQBrg0jwqsOFF9FmQF7WoG/An/
 zo5KLasU9apZymeu/Wglc6bhPQf6ODDv9Sfnjlr+ZMQaFF3m3ATc2dg03
 UMWmELeKZB6p04E1WUCaB50DeeWEEfFxqdh8wbneyuMi9KuVTUzU/kiii
 xHPTkLIvMW3ah5tOavNyiUfTjmXRUFit3OATZMO17yzdEJMZbR28NmHIx g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="344157295"
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="344157295"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 09:36:22 -0700
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="591724527"
Received: from dpasupul-mobl.amr.corp.intel.com (HELO [10.209.178.35])
 ([10.209.178.35])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 09:36:21 -0700
Message-ID: <95a7a219-8330-628f-aa10-28a078217de7@linux.intel.com>
Date: Tue, 21 Jun 2022 11:36:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH v4 00/17] ASoC: Intel: haswell and broadwell boards update
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20220620101402.2684366-1-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220620101402.2684366-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com, tiwai@suse.com
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



On 6/20/22 05:13, Cezary Rojewski wrote:
> A number of patches improving overall quality and readability of
> haswell.c and broadwell.c source files found in sound/soc/intel/boards.
> Both files are first renamed and only then actual changes are being
> incrementally added. The respective names are: hsw_rt5640 and bdw_rt286
> to match the pattern found in more recent boards.
> 
> Most patches bring no functional change - the more impactful patches at
> are placed the end:
> 
> Refactor of suspend/resume flow for the bdw_rt286 board by dropping
> dev->remove() in favour of card->remove() and adjust jack handling to
> reduce code size slightly by implementing card_set_jack().
> 
> The last patch is removing of FE DAI ops. Given the existence of
> platform FE DAI capabilities (either static declaration or through
> topology file), this code is redundant.

Possibly a mistake in our tests, but this error seems to be introduced:

[  107.397637] kernel: rt286 i2c-INT343A:00: ASoC: DAPM unknown pin LDO1

I'll have to re-run the tests, sharing this information as is.


> Changes in v4:
> - just a rebase to fix missed conflicts with for-next
> 
> Changes in v3:
> - Patch 16/17 refactoring suspend/resume has been renamed to "Refactor
>   jack handling". Dropped the usage of card->remove() in favor of
>   link->exit() in that very patch
> 
> Changes in v2:
> - fixed wording error in patch 02/17 so it correctly mentions
>   'haswell_rt5640', not 'broadwell_rt286'
> - decided not to add kernel module names changes to this patchset so the
>   review is not complicated unnecessarily. Will send them separately
>   instead
> 
> Cezary Rojewski (17):
>   ASoC: Intel: Rename haswell source file to hsw_rt5640
>   ASoC: Intel: hsw_rt5640: Reword prefixes of all driver members
>   ASoC: Intel: hsw_rt5640: Reword driver name
>   ASoC: Intel: hsw_rt5640: Update code indentation
>   ASoC: Intel: hsw_rt5640: Update file comments
>   ASoC: Intel: hsw_rt5640: Improve probe() function quality
>   ASoC: Intel: hsw_rt5640: Improve hw_params() debug-ability
>   ASoC: Intel: Rename broadwell source file to bdw_rt286
>   ASoC: Intel: bdw_rt286: Reword prefixes of all driver members
>   ASoC: Intel: bdw_rt286: Reword driver name
>   ASoC: Intel: bdw_rt286: Update code indentation
>   ASoC: Intel: bdw_rt286: Update file comments
>   ASoC: Intel: bdw_rt286: Improve probe() function quality
>   ASoC: Intel: bdw_rt286: Improve hw_params() debug-ability
>   ASoC: Intel: bdw_rt286: Improve codec_init() quality
>   ASoC: Intel: bdw_rt286: Refactor jack handling
>   ASoC: Intel: bdw_rt286: Remove FE DAI ops
> 
>  sound/soc/intel/boards/Kconfig                |   4 +-
>  sound/soc/intel/boards/Makefile               |   4 +-
>  sound/soc/intel/boards/bdw_rt286.c            | 256 +++++++++++++
>  sound/soc/intel/boards/broadwell.c            | 338 ------------------
>  sound/soc/intel/boards/haswell.c              | 202 -----------
>  sound/soc/intel/boards/hsw_rt5640.c           | 176 +++++++++
>  .../common/soc-acpi-intel-hsw-bdw-match.c     |   6 +-
>  7 files changed, 439 insertions(+), 547 deletions(-)
>  create mode 100644 sound/soc/intel/boards/bdw_rt286.c
>  delete mode 100644 sound/soc/intel/boards/broadwell.c
>  delete mode 100644 sound/soc/intel/boards/haswell.c
>  create mode 100644 sound/soc/intel/boards/hsw_rt5640.c
> 
