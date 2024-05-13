Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDAF8C3E7F
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2024 12:00:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD45B868;
	Mon, 13 May 2024 12:00:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD45B868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715594431;
	bh=eC5slO7yGLc+RIm/m+uLfz8QHF9LGtyOPUjwCiEnrHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QHyKkSMNHM1LtE3zGzhVj9Abx7uQI3ho+DFIkO/vu3WzjZqkurJ2j6t25abW6C8Lf
	 sU6I+dX0VYlRcDy3ftqxM6hLqSmv9tg7wEJpQZKmZpiPkvEfrKO/M+sN3omoQ9syL+
	 dN7DpGgt/V16CtXXabmX5v0Jiw+HRXvR96whv/qg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FEFAF8058C; Mon, 13 May 2024 11:59:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19B5EF80589;
	Mon, 13 May 2024 11:59:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1C01F80224; Mon, 13 May 2024 11:59:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D09F6F8003A
	for <alsa-devel@alsa-project.org>; Mon, 13 May 2024 11:59:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D09F6F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RwEZrGlb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715594395; x=1747130395;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eC5slO7yGLc+RIm/m+uLfz8QHF9LGtyOPUjwCiEnrHc=;
  b=RwEZrGlbfbnfz3+gaVR1lwxTVni01wADzr401PjoCNqM58DcySq2yst2
   N6r9ruZ2XjyIMrDBOfoKqg1a3vZhRrV0McD+wOfiG1YLFlYui7xw2i8Kl
   0F29PfDNWsQbB8r4rg9fbkGctnId+Acsot6EGTps5Y4YZmpLbOOVz/FU4
   9GSsaZ10+VE+EnKQ8tq+KWgyJgyC/v5g+X2UfzZVqrylK5lEyuaCZq73+
   5lAOsXV9KA2N20u5NTt1tWxhg6OwrgTRknAo6Dw3vu3f57a9mM41MK2ej
   L+LzkZo0wNZcAnn6snsHBBYPhrgBfOOTnsn7soNMuM/fH9BicTlSpG0Zw
   Q==;
X-CSE-ConnectionGUID: 0fRhz4BpQSOZLov0rzjTkQ==
X-CSE-MsgGUID: jO3rSgbZS72B8Qn99kK+kg==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="15313867"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000";
   d="scan'208";a="15313867"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 02:59:51 -0700
X-CSE-ConnectionGUID: s6BMTyaxQNaKJhqhJLqVuQ==
X-CSE-MsgGUID: B2wmIDwJS6GyTEVTXWp/tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000";
   d="scan'208";a="35158811"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 02:59:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s6ST9-000000074pD-0Ajy;
	Mon, 13 May 2024 12:59:43 +0300
Date: Mon, 13 May 2024 12:59:42 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	liam.r.girdwood@intel.com, bard.liao@intel.com,
	yung-chuan.liao@linux.intel.com, kevin-lu@ti.com,
	cameron.berkenpas@gmail.com, tiwai@suse.de, baojun.xu@ti.com,
	soyer@irl.hu, Baojun.Xu@fpt.com
Subject: Re: [PATCH v5 2/3] ASoC: tas2781: Fix wrong loading calibrated data
 sequence
Message-ID: <ZkHkjhxIZ8I0s3-D@smile.fi.intel.com>
References: <20240512025040.1276-1-shenghao-ding@ti.com>
 <20240512025040.1276-2-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240512025040.1276-2-shenghao-ding@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: TLJ3EO5VFJWCTBYN5EN6HVGO243SJSIJ
X-Message-ID-Hash: TLJ3EO5VFJWCTBYN5EN6HVGO243SJSIJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TLJ3EO5VFJWCTBYN5EN6HVGO243SJSIJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, May 12, 2024 at 10:50:38AM +0800, Shenghao Ding wrote:
> Calibrated data will be set to default after loading DSP config params,
> which will cause speaker protection work abnormally. Reload calibrated
> data after loading DSP config params.

...

> -int tasdevice_prmg_calibdata_load(void *context, int prm_no)

> -EXPORT_SYMBOL_NS_GPL(tasdevice_prmg_calibdata_load,
> -	SND_SOC_TAS2781_FMWLIB);

AFAICS the i2c glue driver still uses this, how can't this break the build?

-- 
With Best Regards,
Andy Shevchenko


