Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A3E94F274
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2024 18:07:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FA6B21A2;
	Mon, 12 Aug 2024 18:07:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FA6B21A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723478831;
	bh=f6D6KfilWNxqFGG7pta2IfyAR3ZAQv2fXGry/eHPZP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mtjyMzcp/1vh86VTGgR+HLMIPCKe0xRKbY/zAgqtfmXyfubkOidQmB8NYK8aRWgnm
	 U9K7dh6GKMuBzepQ8WFxpLH106riUbWXCdCjuTPNBh7WntEI24EKVJI7Qm0HN46n2Y
	 ZQDqvRarSDSQz2Apnkx5XXELIjO4NzCz4dauqZLA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7EAFF8047C; Mon, 12 Aug 2024 18:06:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF20FF805AE;
	Mon, 12 Aug 2024 18:06:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E647AF80423; Mon, 12 Aug 2024 17:54:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A1CEF80107
	for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2024 17:52:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A1CEF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YEprtBLi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723477931; x=1755013931;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f6D6KfilWNxqFGG7pta2IfyAR3ZAQv2fXGry/eHPZP8=;
  b=YEprtBLiwSKLzvvZb3oL4qZeOBqbRG8SXHidbWmlkQ/EGQ+VNguegQYv
   25j96I+HO0j12EJRLAJNnnPX4Gp450cfog3HxJagfQeD1iGjZBX4mT3ul
   BU8ulVJLXMUJiRz670XFvCDAJx6zp7e2/xyWFWEcXHtfKY38edImUyHr/
   H1K+2eQuOooSpXkrPiA9lm6eFdRKzraFCNf+iy7u4P3lR24aFV+GzVa+7
   ky0gb3wIPFlHglqRueMk7swHDH/2MEj9b/XEedEOgKmIEtaxAVwWLuokD
   PF8wMn701H+Td2lcgmWnYqMVInkZZwnv2BatclnuLhLwOLDqXVIiz/X0Q
   A==;
X-CSE-ConnectionGUID: NOarj76PSGq7qIhK202lVQ==
X-CSE-MsgGUID: Te7ZhNzhTu6iVH3u/rsKQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="46998575"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800";
   d="scan'208";a="46998575"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 08:52:05 -0700
X-CSE-ConnectionGUID: dF09Li77Si6p46koOzuKYQ==
X-CSE-MsgGUID: 8XzTmcKZRaeu6Y5GuMy37A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800";
   d="scan'208";a="62959904"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 08:51:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sdXKr-0000000EOvB-3Jym;
	Mon, 12 Aug 2024 18:51:53 +0300
Date: Mon, 12 Aug 2024 18:51:53 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
	zhourui@huaqin.com, alsa-devel@alsa-project.org, i-salazar@ti.com,
	linux-kernel@vger.kernel.org, j-chadha@ti.com,
	liam.r.girdwood@intel.com, jaden-yue@ti.com,
	yung-chuan.liao@linux.intel.com, dipa@ti.com, yuhsuan@google.com,
	henry.lo@ti.com, tiwai@suse.de, baojun.xu@ti.com, soyer@irl.hu,
	Baojun.Xu@fpt.com, judyhsiao@google.com, navada@ti.com,
	cujomalainey@google.com, aanya@ti.com, nayeem.mahmud@ti.com,
	savyasanchi.shukla@netradyne.com, flaviopr@microsoft.com,
	jesse-ji@ti.com, darren.ye@mediatek.com, antheas.dk@gmail.com,
	Jerry2.Huang@lcfuturecenter.com
Subject: Re: [PATCH v1] ASoc: tas2781: Rename dai_driver name to unify the
 name between TAS2563 and TAS2781
Message-ID: <ZrovmRCPN7pc0n40@smile.fi.intel.com>
References: <20240803032717.175-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240803032717.175-1-shenghao-ding@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: GFFTW77BFBXTI36PM5YUMKBX6IIIFINS
X-Message-ID-Hash: GFFTW77BFBXTI36PM5YUMKBX6IIIFINS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GFFTW77BFBXTI36PM5YUMKBX6IIIFINS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Aug 03, 2024 at 11:27:14AM +0800, Shenghao Ding wrote:
> Rename dai_driver name to unify the name between TAS2563 and
> TAS2781, remove unnecessary line feed, strscpy replace scnprintf.

...

> +	strscpy(name, "Speaker Profile Id", SNDRV_CTL_ELEM_ID_NAME_MAXLEN);

> +	strscpy(prog_name, "Speaker Program Id",
> +		SNDRV_CTL_ELEM_ID_NAME_MAXLEN);

> +	strscpy(conf_name, "Speaker Config Id", SNDRV_CTL_ELEM_ID_NAME_MAXLEN);

Why not 2-parameter strscpy()?

-- 
With Best Regards,
Andy Shevchenko


