Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BB695B70D
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2024 15:43:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56378825;
	Thu, 22 Aug 2024 15:43:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56378825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724334213;
	bh=zhEMAMHGZ5Slm9jPTnku9bJu3JEnBoOXGGF9TKhKaac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ahW7U0A7+MdX4Vj2DKFBcyWW3VawS8r8yNzRzKKO4Ks9bcgSw+DyQtFFql148A5ua
	 8KxOIX/VxtFm63z9cJorvcM1A36e3qNhkEYXJHiLtOJDD5o+u0EA5RzRV34dvfcxlm
	 9N4cYtOITiV+V3ZpRSfbD3Yb70gBp+CJenp1UFMg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FDD5F805BD; Thu, 22 Aug 2024 15:43:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC157F805AF;
	Thu, 22 Aug 2024 15:42:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59FCFF80496; Thu, 22 Aug 2024 15:37:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E071EF80107
	for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2024 15:37:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E071EF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EO9EB8sL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724333843; x=1755869843;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zhEMAMHGZ5Slm9jPTnku9bJu3JEnBoOXGGF9TKhKaac=;
  b=EO9EB8sLn0Ypsbrhqt6/h+CgP0Hr/DocPfpwLBCWGNdOrJwlo/kLiF3g
   235OIndUOTigCRzKzqW6aalrp370oXbf2wOE+FK3dTW2mhJBfYUP91N0P
   KN7/0AD9fms0KW9JXFHVGuYfJSUZoUcGsF+8uM2BDjR20OhATrlympvUA
   zPXxk4SRGvU4IELHwgmjmW4xjtgOgK41+LaR/KHGY03Lq78LzVBDRIiCO
   IplIc6CAJGOf7SD7/YbZmqZRm9N7g3qZyjMwM3vdnkDlSEsfwOgazfCY7
   jROkTsE+KYnV9zZ1eSLMsihOv3olCRg7Jv3+km14FxeygOaAv7x3iVY18
   A==;
X-CSE-ConnectionGUID: QvAYEwL8TAKl70sRhJBsWg==
X-CSE-MsgGUID: advnnay1R5iY02GcQzzrsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22901974"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600";
   d="scan'208";a="22901974"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 06:37:17 -0700
X-CSE-ConnectionGUID: WIgNqRdKRCCzF+8sU3S7jQ==
X-CSE-MsgGUID: BhdICbi5Rhu+oWedTslHiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600";
   d="scan'208";a="66131415"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 06:37:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sh7zg-00000000Sxj-2X0O;
	Thu, 22 Aug 2024 16:36:52 +0300
Date: Thu, 22 Aug 2024 16:36:52 +0300
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
	Jerry2.Huang@lcfuturecenter.com, jim.shil@goertek.com
Subject: Re: [PATCH v1] ASoC: tas2781: mark const variables tas2563_dvc_table
 as __maybe_unused
Message-ID: <Zsc-9PVnh8GpPrrP@smile.fi.intel.com>
References: <20240822063205.662-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822063205.662-1-shenghao-ding@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: F2DAFHMNPUJN3BKXMRKRT6JNORZH2ADG
X-Message-ID-Hash: F2DAFHMNPUJN3BKXMRKRT6JNORZH2ADG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F2DAFHMNPUJN3BKXMRKRT6JNORZH2ADG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Aug 22, 2024 at 02:32:02PM +0800, Shenghao Ding wrote:
> In case of tas2781, tas2563_dvc_table will be unused,
> so mark it as __maybe_unused.

...

>  /* pow(10, db/20) * pow(2,30) */
> -static const unsigned char tas2563_dvc_table[][4] = {
> +static const __maybe_unused unsigned char tas2563_dvc_table[][4] = {
>  	{ 0X00, 0X00, 0X00, 0X00 }, /* -121.5db */
>  	{ 0X00, 0X00, 0X03, 0XBC }, /* -121.0db */
>  	{ 0X00, 0X00, 0X03, 0XF5 }, /* -120.5db */

As far as I can see in the latest Linux Next the above mentioned table is used
solely in sound/soc/codecs/tas2781-i2c.c. Why not moving it to the C file
instead?

-- 
With Best Regards,
Andy Shevchenko


