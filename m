Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10944A7FA16
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Apr 2025 11:44:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CBDC6437D;
	Tue,  8 Apr 2025 11:44:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CBDC6437D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744105467;
	bh=cgkIZ1J1ZMb/WRj5ocOJvNePLZlmat4KeZ2YPojo1zc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=karP85MBxugDwh5cqtPPkbx+dWblTiu/PxYKshC+XkieJgorbi9+zSFA/6wLNEf8v
	 82YFkTSLoXfzTPc4Ng1x1xfj0WxGJAm/61c/xk1XXdQcH1FK5wwASKVQMUuhvtko4J
	 834OFxyISNRuDQSHUleJ47+MGoi44ShA9QTquFMA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77AE4F805B3; Tue,  8 Apr 2025 11:43:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CA44F805BF;
	Tue,  8 Apr 2025 11:43:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5ABE1F8055B; Tue,  8 Apr 2025 11:43:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2987DF8003C
	for <alsa-devel@alsa-project.org>; Tue,  8 Apr 2025 11:43:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2987DF8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=J9lRAO6K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744105426; x=1775641426;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cgkIZ1J1ZMb/WRj5ocOJvNePLZlmat4KeZ2YPojo1zc=;
  b=J9lRAO6K20akInc7Gebmt6D9l7+652HzCKGXmi7dKuhSaAwaOAY3dmDb
   ob399QoWAuX7Su4xZh52KaDlfzJxhn2kk9ta34EXcaSPgaOHTH8FwzKr/
   jwJ7lHgp6oz8YpVgpBr90E5SJgQ/yUAYZ/waIsS3cJgKAjCJSNMiT8mOJ
   0SpfWB5u+S9b8B1WT30D5zXEKfWY9N59KZN9Z8tO5NA+DHUsVaISryiPV
   M+1wf14Xz4YUO6KNB59cFITEhTUwSgVmo4ol4ReVv1NOkvN5qN9/I3910
   o5HqSHpjy5LnC7OwV82XnhbF2ZztYKMQKbSEDnrc72ur6X4V/Pq+JR05C
   g==;
X-CSE-ConnectionGUID: mxnVqHhQRIS1lINh/U24kQ==
X-CSE-MsgGUID: dTYOEzMhSsy8fnZL2GyNJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44668849"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600";
   d="scan'208";a="44668849"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 02:43:41 -0700
X-CSE-ConnectionGUID: oAwSawQ5TM2ByHjbB4MxUQ==
X-CSE-MsgGUID: 5pqBPiIHQS++WAhB4ytkew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600";
   d="scan'208";a="151402703"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 02:43:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u25UF-0000000AMB7-1Z3G;
	Tue, 08 Apr 2025 12:43:19 +0300
Date: Tue, 8 Apr 2025 12:43:19 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: broonie@kernel.org, tiwai@suse.de, 13916275206@139.com,
	13564923607@139.com, alsa-devel@alsa-project.org, baojun.xu@ti.com
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Create a common header for both
 spi and i2c tas2781 hda driver
Message-ID: <Z_Tvt1VsyBw8dS8m@smile.fi.intel.com>
References: <20250408024522.1338-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408024522.1338-1-shenghao-ding@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: W73K6SFI4BQ4EAXQYLHWZVYYNLTMG47U
X-Message-ID-Hash: W73K6SFI4BQ4EAXQYLHWZVYYNLTMG47U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W73K6SFI4BQ4EAXQYLHWZVYYNLTMG47U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Apr 08, 2025 at 10:45:22AM +0800, Shenghao Ding wrote:
> Move the common macro definition of kcontrols into a common header.

Makes sense.

...

> +++ b/sound/pci/hda/tas2781_hda.h

> +#ifndef __TAS2781_HDA_H__
> +#define __TAS2781_HDA_H__

It is better to follow IWYU principle, i.e. this header uses the following:

+ sound/asound.h

-- 
With Best Regards,
Andy Shevchenko


