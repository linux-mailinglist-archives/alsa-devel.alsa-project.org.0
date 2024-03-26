Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C768688C6A3
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 16:17:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4404B2BB4;
	Tue, 26 Mar 2024 16:17:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4404B2BB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711466264;
	bh=ZT1SfWhlLJc5XYrpqY8N3fYap0APdfsWz+VsHuuXOi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Au6faM8vVkhwVQ7nH6rhoWFTrqIDuLATASpbaDrYSZgi9ZIZliBnjccbxiBCVUMoq
	 UE0tPNG4oQpp57kImEft+LD7F/n5FGPqW3yNQs0bVs4RTyTFr13x/0P3xnS+QdCXOf
	 fBN9uJQPXoWxOzcxYV4wKxxjKQidg+h2sOMQJ+Zs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A802F805AE; Tue, 26 Mar 2024 16:17:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 827E1F80093;
	Tue, 26 Mar 2024 16:17:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0D92F8025F; Tue, 26 Mar 2024 16:17:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DC7FF801EB
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 16:17:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DC7FF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nLHn9JZu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711466228; x=1743002228;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZT1SfWhlLJc5XYrpqY8N3fYap0APdfsWz+VsHuuXOi0=;
  b=nLHn9JZuu8LGjK8T4qQkYWvIBjH93OyvUzdigCchxQPqBsS/e8XZ4sP4
   hy2zJdweQtDBffPamPdfMAqf+WDLZPQAJZr++Yhjr7BXNg3Hy2dgetuTQ
   f04gyHGnLFnVjwxPd/RW8AAdULUKuF3uF228fxr4CW6p+0kqK+BNmyVvc
   xPdnn+ipQM74+Wxora6QvHQKiKCJcbv8YeYrhUZIyeHwJT7th3S9Fkvbq
   ExPW3LZeWRrGj42m9JWwfbjLvK9/MBM0FudWh90pBTq19Alz2A9wg+ys3
   7ioCxejsIseR3AXMTEyjNEYujcEjA7gqp5hyB9wYz/Xf35hrISbX3Sgr0
   g==;
X-CSE-ConnectionGUID: +7YK7qn8Rz2OriJh9dMUFA==
X-CSE-MsgGUID: EYOzqR9eQhWjFITcBgYJZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6419080"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="6419080"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 08:17:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="914883064"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="914883064"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 08:17:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rp8Xp-0000000GKv0-46oo;
	Tue, 26 Mar 2024 17:16:57 +0200
Date: Tue, 26 Mar 2024 17:16:57 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Baojun Xu <baojun.xu@ti.com>, tiwai@suse.de, robh+dt@kernel.org,
	lgirdwood@gmail.com, perex@perex.cz, kevin-lu@ti.com,
	13916275206@139.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
	yung-chuan.liao@linux.intel.com, broonie@kernel.org, soyer@irl.hu
Subject: Re: [PATCH v1 7/8] ALSA: hda/tas2781: Add tas2781 SPI-based driver
Message-ID: <ZgLm6bIgyTNo-5dy@smile.fi.intel.com>
References: <20240326010905.2147-1-baojun.xu@ti.com>
 <20240326010905.2147-7-baojun.xu@ti.com>
 <a95c6ec2-d99a-41b4-add3-6ec5ef6d6830@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a95c6ec2-d99a-41b4-add3-6ec5ef6d6830@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: VDAKLAOCVMTQULRTHYOG2ZBGNO5PJ5OQ
X-Message-ID-Hash: VDAKLAOCVMTQULRTHYOG2ZBGNO5PJ5OQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VDAKLAOCVMTQULRTHYOG2ZBGNO5PJ5OQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Mar 26, 2024 at 10:13:06AM -0500, Pierre-Louis Bossart wrote:


...

> memory leaks for each of those goto out;
> 
> You need to use different labels and free-up what was allocated before.

Good point, but better to just use cleanup.h from day 1, it makes this code
shrink even more.

...

> I'll stop the review here.

He-he :-)

-- 
With Best Regards,
Andy Shevchenko


