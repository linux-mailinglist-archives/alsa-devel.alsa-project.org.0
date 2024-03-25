Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B969D88AE15
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 19:25:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9541EC7;
	Mon, 25 Mar 2024 19:25:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9541EC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711391136;
	bh=MAe5uuROFbCiGuIhQXAD8TvICt0pICzM9nlR0AdeEI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bvG4Zly2PsudMdE22FNMpiySteI+RbFtw43mrBUTZse3h/OqZ7qHkTTDQJfJOdTDL
	 cUElwLBSvlttFudCEYdRhfE8U9VCzK1+MdifWHVSqR+i4yxhsshatx36u4ko0eJM9L
	 6sNFX86fgItHFuYDqtlfWf6EU/h1/aWbl8ZeAbFM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C5A3F8063E; Mon, 25 Mar 2024 18:07:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DBEB0F80673;
	Mon, 25 Mar 2024 18:07:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC5ABF80642; Mon, 25 Mar 2024 18:07:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79E71F805D8
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 18:06:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79E71F805D8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cUD4Mxnk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711386418; x=1742922418;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MAe5uuROFbCiGuIhQXAD8TvICt0pICzM9nlR0AdeEI4=;
  b=cUD4MxnksLTA1nlmr/F+AFaLhT3GccSM2btAnC6OUermRoixVcFFSqfY
   PjfcMhms8Ev9+GsTnKoY6Ms4ld6+ipBlWtV9HygS+wQCNa44MX0snZjgH
   9xTHNcKWCm/qmie2/5EPt2oVudD6H9suC+5QeYAZt0JFPxZ2pVadWiO5T
   +kaNEwPWHbPU7zG3TeSP3aNorwIIyPFdqSHizoLkGre1u+RWBQtbRvHXV
   VUSInpj8rANlGV9Huxt9fX0Ybf0+sHwBkwUkbcFiyEhdJYqSwrx7ydB/A
   cBPXXuBYU59YFvRWtp7iMrTgEfdb5cfNsz3jnRJGhpw26eL11aDaIawpN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6266963"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000";
   d="scan'208";a="6266963"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 10:06:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="914849374"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000";
   d="scan'208";a="914849374"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 10:06:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ronmW-0000000G3ar-2wkT;
	Mon, 25 Mar 2024 19:06:44 +0200
Date: Mon, 25 Mar 2024 19:06:44 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v2 1/1] ASoC: fsl: imx-es8328: Switch to using gpiod API
Message-ID: <ZgGvJDEpMjaeZzpC@smile.fi.intel.com>
References: <20240318200804.181516-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240318200804.181516-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: 6NE2F5AKPW26T52SUOILUSVT4EA5AC6Z
X-Message-ID-Hash: 6NE2F5AKPW26T52SUOILUSVT4EA5AC6Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6NE2F5AKPW26T52SUOILUSVT4EA5AC6Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Mar 18, 2024 at 10:07:56PM +0200, Andy Shevchenko wrote:
> This updates the driver to gpiod API, and removes yet another use of
> of_get_named_gpio().

This also needs a leftover removal. :-(

-- 
With Best Regards,
Andy Shevchenko


