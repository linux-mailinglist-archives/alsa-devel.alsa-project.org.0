Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 880868C125E
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 18:00:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 681CB839;
	Thu,  9 May 2024 18:00:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 681CB839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715270455;
	bh=YVoMDkd4Kyucg+FhSD9dLimMf7BJOn7zW4Zw9u62Cw4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XAx5ADlcREif7yMfwAQcqd4406OnsoJjdBSD4p1TVKtacWiAMP7irPQjRhWGZkeXy
	 Ec9Hf8u/vqWZIq4BHKY43tRo2otdaOtWj31KZXqCRPN2cpLPRzbqljBLCngNCtueyb
	 aFjS7xCK4UdlYv7xdJIViQ5IJ5tQdSJsP0zMOp4o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00D65F8058C; Thu,  9 May 2024 18:00:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36E78F805A0;
	Thu,  9 May 2024 18:00:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86078F8049C; Thu,  9 May 2024 18:00:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3804FF80152
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 18:00:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3804FF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BfFKuSzl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715270416; x=1746806416;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YVoMDkd4Kyucg+FhSD9dLimMf7BJOn7zW4Zw9u62Cw4=;
  b=BfFKuSzlMWZGEupTKp9sufsk7obHAdOy1dFCR+wEVfMYi1a4iXzzSHgU
   wtuDvmKUvRWJ/vEprf4E+b5CoI+y8z3JdtlYVZYULPJMv+eepZhNnZ1V8
   2O0EuV/vWjgCU1QIiuSET5OxhXNQ+LhDU1Zgm2D7Qj6SfGEQbUd76oKDt
   /ORANNf4uwP+pGuXUvoxJa+3Po3cGEvtQk8HFTreWpihLkNCOQvake6tl
   chalYTFLQzRzCvFfQDzFPIWSqGd9rAXMtTAIb99Oo4GSHO5QF1ZHiAsm+
   Pg/LEDyxUgOkQw7h5eZIC8whwhRgC8rfI2T/dOB5O1pnQy3e9pe2Ig7F/
   Q==;
X-CSE-ConnectionGUID: BXLzgSJXQX2zRx0NGIMzDQ==
X-CSE-MsgGUID: 9m3pHuzXQDKtoatrLxCqMg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11036823"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="11036823"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:00:08 -0700
X-CSE-ConnectionGUID: IyhFeXbdRo2wrZ+1do91DQ==
X-CSE-MsgGUID: 06muV9D8Qee/MMuWvpt0Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="29390582"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO [10.213.181.85])
 ([10.213.181.85])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:00:08 -0700
Message-ID: <5630c56e-6639-47f6-81a9-6b52f8b540de@linux.intel.com>
Date: Thu, 9 May 2024 11:00:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] ALSA/ASoC: Intel: clarify Copyright information
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, broonie@kernel.org
References: <20240503140359.259762-1-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240503140359.259762-1-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: R4MPSTYQWHZJIW5DYEDAB4R52BU2ZVK6
X-Message-ID-Hash: R4MPSTYQWHZJIW5DYEDAB4R52BU2ZVK6
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R4MPSTYQWHZJIW5DYEDAB4R52BU2ZVK6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/3/24 09:03, Pierre-Louis Bossart wrote:
> This patchset does not change any functionality. It only clarifies the
> Copyright information in ASoC/HDAudio contributions, where an "All
> rights reserved" notice was mistakenly added in a number of files over
> the years, likely due to copy/paste. The Intel template never included
> this statement.
> 
> I chose to group all these patches together, they could be merged with
> either of the ALSA or the ASoC tree.
> 
> Pierre-Louis Bossart (9):
>   ASoC: SOF: Intel: clarify Copyright information
>   ASoC: Intel: boards: clarify Copyright information
>   ASoC: Intel: common: clarify Copyright information
>   ASoC: codecs: Intel: clarify Copyright information
>   ASoC: Intel: catpt: clarify Copyright information
>   ASoC: Intel: avs: clarify Copyright information
>   ASoC: soc-topology-test: clarify Copyright information

The first 7 patches were merged by Mark

>   ALSA: hda: clarify Copyright information
>   ALSA/ASoC: include: clarify Copyright information

But these last two weren't. Should I resend them? Or can Takashi pick
them? It's just a minor clarification, this can also wait for the next
cycle.
