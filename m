Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0F4971506
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2024 12:14:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC26B847;
	Mon,  9 Sep 2024 12:14:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC26B847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725876871;
	bh=0qaf774Cn9lQMh3dCkUVu4M+B2D5wF4dcVecxNAZd4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SPLnGzNaNUhqLY199SXu0S8bnS7Qwd0qa4XfvAroqiLZon/YV0tgm3kLlLKD1Fwnu
	 9EHASfrZsrtt7FDSFzztT/3bOkl+xvQADYERqDN+BbP/nKHiRHpew/pPnmk8z3BR7g
	 ipeOGLO4h+rO3i3ZRZjRVzViaK8o7toQjT01srl8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCB07F805B5; Mon,  9 Sep 2024 12:13:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC500F805AC;
	Mon,  9 Sep 2024 12:13:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AFB7F801F5; Mon,  9 Sep 2024 12:13:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04B4DF8010B
	for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2024 12:13:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04B4DF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=b+Y/jMmM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725876834; x=1757412834;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0qaf774Cn9lQMh3dCkUVu4M+B2D5wF4dcVecxNAZd4U=;
  b=b+Y/jMmMtosXRdGV5WlzfxGovGtiKVMnWF1+6qmF9cwRG/W6R2xwcqlD
   8uXYgS2YWc3Q7B/5q93Ik4/KNUJUzihpiKnAIO4wf0Xqk2yN5M3wzfexo
   fVjOofXXGK02pbdf5gIZ8xT2KkQDD+2rLbxO93BEB+yniRKNk13ALE5GU
   kY/0eMMUSe3zSddIf3au6e6bJH/sIUGyqbRS0arUb6NTx43zUYkITeJyK
   axKbE1cXLc8chfpwDR+H/T4UbPxZI5OV+yEVkWtwJYG851qhRUodM9ufL
   4VwWSuGoIDDWXwPpzW0Am3g3ecNaxLb6UQj4Es7TxNgbPjXOIBHHRz2g5
   Q==;
X-CSE-ConnectionGUID: 9XGJytOpTPu/6XB5OHAnIg==
X-CSE-MsgGUID: xM6epcYKStm8NoHDYv+Qig==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="27486531"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600";
   d="scan'208";a="27486531"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 03:13:48 -0700
X-CSE-ConnectionGUID: EA75E6NuQA6zvQXfbfQytg==
X-CSE-MsgGUID: EJRX5hTeQoK8CXj0VzM4TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600";
   d="scan'208";a="66259315"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 03:13:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1snbOb-00000006kQD-401Z;
	Mon, 09 Sep 2024 13:13:21 +0300
Date: Mon, 9 Sep 2024 13:13:21 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
	zhourui@huaqin.com, alsa-devel@alsa-project.org, i-salazar@ti.com,
	liam.r.girdwood@intel.com, jaden-yue@ti.com,
	yung-chuan.liao@linux.intel.com, dipa@ti.com, yuhsuan@google.com,
	henry.lo@ti.com, tiwai@suse.de, baojun.xu@ti.com, Baojun.Xu@fpt.com,
	judyhsiao@google.com, navada@ti.com, cujomalainey@google.com,
	aanya@ti.com, nayeem.mahmud@ti.com,
	savyasanchi.shukla@netradyne.com, flaviopr@microsoft.com,
	jesse-ji@ti.com, darren.ye@mediatek.com, antheas.dk@gmail.com,
	Jerry2.Huang@lcfuturecenter.com, jim.shil@goertek.com,
	jeep.wang@goertek.com, will-wang@ti.com
Subject: Re: [PATCH] ASoc: tas2781: Remove unnecessary line feed and space
Message-ID: <Zt7KQcEOBfCaDNbS@smile.fi.intel.com>
References: <20240907001540.944-1-shenghao-ding@ti.com>
 <20240907001540.944-2-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240907001540.944-2-shenghao-ding@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: RTDI7ACMAZKLHTIJ47Q2RX27OVQOURUE
X-Message-ID-Hash: RTDI7ACMAZKLHTIJ47Q2RX27OVQOURUE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RTDI7ACMAZKLHTIJ47Q2RX27OVQOURUE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Sep 07, 2024 at 08:15:37AM +0800, Shenghao Ding wrote:
> Remove unnecessary line feed for tasdevice_dsp_create_ctrls,
> and remove two unnecessary spaces in tas2563_digital_gain_get
> and tas2563_digital_gain_put.

FWIW, we refer to the functions as func(). The above will be

Remove unnecessary line feed for tasdevice_dsp_create_ctrls(),
and remove two unnecessary spaces in tas2563_digital_gain_get()
and tas2563_digital_gain_put().

-- 
With Best Regards,
Andy Shevchenko


