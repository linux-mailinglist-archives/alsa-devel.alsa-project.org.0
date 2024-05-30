Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C708D4EE1
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2024 17:16:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EA48828;
	Thu, 30 May 2024 17:15:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EA48828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717082167;
	bh=CVgCg9EfLMmaKqwnwWtdE36V0JgfLTlJLjMttBV68fA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dyH3lWFdKV91G/hk0KOxDL2q04/9ZmBkW4brYyMQ+9VaWe8s0IfxQ83VKQ9L2OVa5
	 zHOKgbtCMHRetwcwuOjbmQV7/yKOQZynGgCC4hk2EkeB38eAUjEBNzBuR6vG3ZptXn
	 vHUulczSWtwqyY2nCu4L04+WTrTU5wipWkmPQx5E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E04F9F805AD; Thu, 30 May 2024 17:15:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 636C7F8051D;
	Thu, 30 May 2024 17:15:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BEF4F80149; Thu, 30 May 2024 17:14:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97464F800AC
	for <alsa-devel@alsa-project.org>; Thu, 30 May 2024 17:14:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97464F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KNvED8is
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717082078; x=1748618078;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CVgCg9EfLMmaKqwnwWtdE36V0JgfLTlJLjMttBV68fA=;
  b=KNvED8isZr9JsFXh/6egxUMT3i/X65sE7OzSqAfW5wFPjCMyRPcA/l7i
   QHgQIun5ry4pxdiioaXoKyCs/1X5u0A++gEQE6rbBNzZqqcX5Dy7GtuhQ
   c2F3uc0mPk2XnwAbpGhlggbv+o4p3UcSQrB3qRhpQBAuInCZck9Yb0fJD
   DV6bkduWwEd64nzsgblyER/eMCB5JOtzlrjFjiyxUevCmCnn2DCA6mEMi
   DG7CWdoqpXyc0SANEJMvhn52Fk21mZeI9/7uIHqRmXj5Y+7Q1sOCdG5Eq
   QmPj57gTNjhzWxD/HtKE5EFVglMe5OYJHA9fHbkDQCVpvXDgOHoz7az9m
   A==;
X-CSE-ConnectionGUID: 9psUf6v3SWCLWxYl5pDcvg==
X-CSE-MsgGUID: rD/KBL+CSFeTsA+ic62H/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13756798"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000";
   d="scan'208";a="13756798"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 08:14:31 -0700
X-CSE-ConnectionGUID: obUVKN+mSKWMG//lNbAeFw==
X-CSE-MsgGUID: zpuBX0b3RYK7C2vDOy9GXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000";
   d="scan'208";a="40315280"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 08:14:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sChU2-0000000C76U-3Ozg;
	Thu, 30 May 2024 18:14:26 +0300
Date: Thu, 30 May 2024 18:14:26 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
	broonie@kernel.org, rafael@kernel.org, vkoul@kernel.org
Subject: Re: [PATCH 0/3] ACPI/ALSA/soundwire: add
 acpi_get_local_u64_address() helper
Message-ID: <ZliX0juOs_A6A01T@smile.fi.intel.com>
References: <20240528192936.16180-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528192936.16180-1-pierre-louis.bossart@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: VUORN5QIAVWQNVLODCQEHDWE4V7NSXBT
X-Message-ID-Hash: VUORN5QIAVWQNVLODCQEHDWE4V7NSXBT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VUORN5QIAVWQNVLODCQEHDWE4V7NSXBT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, May 28, 2024 at 02:29:32PM -0500, Pierre-Louis Bossart wrote:
> The acpi_get_local_address() helper assumes a 32-bit ADR is used. If
> we want to use this helper for SoundWire/SDCA ASoC codecs, we need an
> extension where the native 64-bits are used. This patchset suggests a
> new helper, acpi_get_local_address() may be renamed if desired in a
> folow-up patch.
> 
> The path of least resistance would be to merge this patchset in the
> ASoC tree, since I have additional changes for ASoC/SDCA (SoundWire
> Device Class) that depend on the new helper.

Perhaps we may rename existing one to _u32 or so.
Anyway, for this series:
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


