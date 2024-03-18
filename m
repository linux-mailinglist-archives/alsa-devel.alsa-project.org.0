Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E183D87F0BD
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Mar 2024 21:03:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27D742999;
	Mon, 18 Mar 2024 21:03:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27D742999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710792195;
	bh=ioTrYBrdsE7izn+AcJYryuQbQLhywGSNPivL7f28es0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Or/rWb+nxG+a3slZuJHI6+C1EjGQEA5XrBs4YSjPwlVjkNs9lZPQyO7/IcczNhWfV
	 DpRXh7rhFscxW8MC30eb7C9doe0hW0Z/UAqS+dyqVIYmnl757WJt9X8F2VbfbVq5FL
	 yIWBMKyZCGWP6LwBabkdbaXY6XBIrmjGCpY7ap08=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2303FF802DB; Mon, 18 Mar 2024 21:02:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F27B3F8057E;
	Mon, 18 Mar 2024 21:02:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19134F804E7; Mon, 18 Mar 2024 21:02:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7E43F80088
	for <alsa-devel@alsa-project.org>; Mon, 18 Mar 2024 21:02:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7E43F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DQjNM/um
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710792156; x=1742328156;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ioTrYBrdsE7izn+AcJYryuQbQLhywGSNPivL7f28es0=;
  b=DQjNM/umqSNOClwhDG1Ap0yE509Gz39OiovPg3pYP90s+71ikVxhFzqp
   o+ZXO/z3GlcpFEuz/wtw92Uh/PyTVfli2XTrYCqF8DqxelkNrgq6JsDyh
   +w1MwPMTtehd/s79HUQRnqeZJD5GTz98cwdTDV54/tXxgdZJ7qDv9dEKg
   Y7J52RmPSHZGCgkXycPvt0cRUFh7ZUJxHK81vVckSc3w2yMXiRBpn7RhE
   dmK2rWGxTsbPak89CSwYAAcrZ2vNT840cpw+55dLWqDSlxxJwebeozBQc
   OKijDZ2bRyQYwXFzrqx1dGY0mUXOmV7WjAzm9Ct2pFJeX6ePrN8L/Hr1Y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5508540"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000";
   d="scan'208";a="5508540"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 13:02:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="914603538"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000";
   d="scan'208";a="914603538"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 13:02:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rmJBO-0000000E40t-2XpO;
	Mon, 18 Mar 2024 22:02:06 +0200
Date: Mon, 18 Mar 2024 22:02:06 +0200
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
Subject: Re: [PATCH v1 1/1] ASoC: fsl: imx-es8328: Switch to using gpiod API
Message-ID: <ZfidvrfrwMmYQBcK@smile.fi.intel.com>
References: <20240318195837.180069-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240318195837.180069-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: P3PPRR7VLYLYOBTA5CNBZ2BHHUFSTHE3
X-Message-ID-Hash: P3PPRR7VLYLYOBTA5CNBZ2BHHUFSTHE3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P3PPRR7VLYLYOBTA5CNBZ2BHHUFSTHE3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Mar 18, 2024 at 09:58:37PM +0200, Andy Shevchenko wrote:
> This updates the driver to gpiod API, and removes yet another use of
> of_get_named_gpio().

This won't compile, sorry for the noise. I'll send a v2.

-- 
With Best Regards,
Andy Shevchenko


