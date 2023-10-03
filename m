Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A7F7B64B4
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Oct 2023 10:53:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0B9382C;
	Tue,  3 Oct 2023 10:52:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0B9382C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696323210;
	bh=zhcWgFLMNyXFJZkcZf3suC/60ANCId4w8ZT0ekq8xNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=br+fcLgaPR2YENmjCQvbWHmlIzwIAkU9hkkBSWETa80u8qVvbfXR2rmIUUh4dybhl
	 lEXF2qB9q/kPppINz1EX/6RNBHrRolP2z1dL1IZlKS7pNxiU0uzwnLSfpB1CYsSbli
	 NhmMK0H0lsCLndn+mg8I4LgIEDxrf1Sys/9cs+2E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86CC0F80130; Tue,  3 Oct 2023 10:52:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E9EFF801EB;
	Tue,  3 Oct 2023 10:52:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3E2AF8047D; Tue,  3 Oct 2023 10:52:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CD47FF80166
	for <alsa-devel@alsa-project.org>; Tue,  3 Oct 2023 10:52:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD47FF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FXm8FR9w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696323152; x=1727859152;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=zhcWgFLMNyXFJZkcZf3suC/60ANCId4w8ZT0ekq8xNs=;
  b=FXm8FR9wUoQnG6GkpC+r2TjMsgmpej+QZOaukSZ54Bf/kWlIKU5ha6Yz
   ShIyX2btmjkpkGvwN5gRIKif5kaO9YXVin7SjVtuuP92zD9HvRuCG5508
   DVKPL5sgJJOGtuq266F8SvBXKmPdS/DJKWGSnz5XHrhVK5NPSCSimr01u
   8Yh+UQpPfuwppRnTBPVkLk2zr86uBMniui2kwTMseveJk7u2gU4KBlfe2
   5gxe6qJ7727iWJLgBdGEeOcQMqE2B+c+tCqdFv4Wb3nqsE6r7cHCGEGz2
   IfcojZI9dfstgMk78ccpzNwBLJ6gLzyhg2sBmXfQPsvhLVon9x9485Hey
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="363093979"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200";
   d="scan'208";a="363093979"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 01:52:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="700630131"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200";
   d="scan'208";a="700630131"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 01:52:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC1)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qnb8b-00000002RBx-33f0;
	Tue, 03 Oct 2023 11:52:17 +0300
Date: Tue, 3 Oct 2023 11:52:17 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>, broonie@kernel.org,
	robh+dt@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, kevin-lu@ti.com,
	13916275206@139.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
	mengdong.lin@intel.com, baojun.xu@ti.com, thomas.gfeller@q-drop.com,
	peeyush@ti.com, navada@ti.com, tiwai@suse.de
Subject: Re: [PATCH v1] ASoC: tas2781: fixed compiling issue in m68k
Message-ID: <ZRvWQQzrvtzkJ/UV@smile.fi.intel.com>
References: <20231002090434.1896-1-shenghao-ding@ti.com>
 <CAMuHMdXr5oRgkFqYZnPe3Xdyq_QjtzhfL8Wa_e9JA0S1XhEhWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: 
 <CAMuHMdXr5oRgkFqYZnPe3Xdyq_QjtzhfL8Wa_e9JA0S1XhEhWw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: 6SE23ZJWS66JJ4ZWZKNHVLRPR3GF5JV2
X-Message-ID-Hash: 6SE23ZJWS66JJ4ZWZKNHVLRPR3GF5JV2
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6SE23ZJWS66JJ4ZWZKNHVLRPR3GF5JV2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Oct 02, 2023 at 09:24:21PM +0200, Geert Uytterhoeven wrote:
> On Mon, Oct 2, 2023 at 4:38 PM Shenghao Ding <shenghao-ding@ti.com> wrote:

...

> Gr{oetje,eeting}s,
> 
>                         Geert

I believe patch is already in the Mark's tree, so we now ought to live with it.

-- 
With Best Regards,
Andy Shevchenko


