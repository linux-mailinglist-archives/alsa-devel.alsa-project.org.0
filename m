Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C023951D96
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2024 16:45:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAC532409;
	Wed, 14 Aug 2024 16:45:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAC532409
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723646752;
	bh=UH8ERZHpu09gaKw5cfQYegffINpwUR6Q3dI7YPU4/FM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g5qxu4GfRLK6P8IJl/+/SgAEqP/+h3YutmBnKfYPJTwsFPUFVUOQoxVp7qLq//hph
	 74+EDmEAsObVTv32Xhc9fuYQ/IccEbLipo0Vb7d9IzbxeQsguXKHgrLV90E0wIWe/P
	 Ay0+2qhW+nJDEmxeksZeZNb4g94TqdFuehwszJtU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C23F0F80589; Wed, 14 Aug 2024 16:45:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1BA9F805AE;
	Wed, 14 Aug 2024 16:45:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9937CF80423; Wed, 14 Aug 2024 16:42:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8348F80107
	for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2024 16:42:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8348F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QlqNJ4lZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723646536; x=1755182536;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UH8ERZHpu09gaKw5cfQYegffINpwUR6Q3dI7YPU4/FM=;
  b=QlqNJ4lZze+0FiPAtaD+F42yUCIyXhgOt7lmbKQUtzJTUFHs1DYNx6Ao
   Ezg55YjDkPfxEW/3C3KmHh0c9MvUlViIlD557kXyNLCUMIpMS7O8bOuyU
   ULif8Y3yMuGhaInAkLYDihc3TcvxkLD/UvJiN4U0P5zQPnWll6Cp4f3b6
   d4hLUPPTRwFC7234FF4kNUC/SJdBnH/PDstpPaMrbxNK290CJ2artXJ1d
   EL2cMlJqdlVplg+cNRmA8m+sq3l7yGU+5lArURh2hFMLgAb6BzLpJLkWz
   D4KDwSREhoWp3DGY1bWfemcO4GqAx95dUgvAtImDbfxRq12XqL9DEjc4V
   w==;
X-CSE-ConnectionGUID: b/fct3tnTBOIcRTxZ1C2FA==
X-CSE-MsgGUID: SfpdwmIOQWKPbBR9ptYggA==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="39374763"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600";
   d="scan'208";a="39374763"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 07:42:11 -0700
X-CSE-ConnectionGUID: IYrCMSIHSN6ZrAy6YlH5mQ==
X-CSE-MsgGUID: o0TrAn8ORrOTVjWvHBxY8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600";
   d="scan'208";a="63922633"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 07:42:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1seFCP-0000000FDLZ-1211;
	Wed, 14 Aug 2024 17:42:05 +0300
Date: Wed, 14 Aug 2024 17:42:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, tiwai@suse.com, perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
	cujomalainey@chromium.org, lmajczak@google.com
Subject: Re: [PATCH v2 00/14] ASoC: Intel: Remove skylake driver
Message-ID: <ZrzCPfagF7ezdzMq@smile.fi.intel.com>
References: <20240814083929.1217319-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814083929.1217319-1-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: FQJIDS6A7XI446KMD3M3Q23XHQCKP77R
X-Message-ID-Hash: FQJIDS6A7XI446KMD3M3Q23XHQCKP77R
X-MailFrom: andriy.shevchenko@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FQJIDS6A7XI446KMD3M3Q23XHQCKP77R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Aug 14, 2024 at 10:39:15AM +0200, Cezary Rojewski wrote:
> A spiritual successor to haswell/baytrail removal series [1].
> 
> The avs-driver found in sound/soc/intel/avs is a direct replacement to
> the existing skylake-driver. It covers all features supported by it and
> more and aligns with the recommended flows and requirements based on
> Windows driver equivalent.
> 
> The skylake-driver related UAPI has been removed with "ASoC: Drop
> soc-topology ABI v4 support" [2].
> 
> For the official kernel tree the deprecation begun with v6.0. Most
> skylake-drivers users moved to avs- or SOF-driver when AudioDSP
> capabilities are available on the platform or to snd-hda-intel
> (sound/pci/hda) when such capabilities are not.
> 
> For the supported trees the deprecation begun with v5.4 with v5.15 being
> the first where the skylake-driver is disabled entirely.
> 
> All machine board drivers that consume this DSP driver have their
> replacements present within sound/soc/intel/avs/boards/ directory.

> Changes in v2:
> - added two new patches (leading the series)
> - the first moves all device entries previously under the skylake-driver
>   dependency under the avs-driver
> - the second patch drops struct skl_machine_pdata usage to fix
>   compilation errors as pointed out by IKP
> - no further changes, retained Acked-by tags for these

Hmm... Have you received my tag for the v1?

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


