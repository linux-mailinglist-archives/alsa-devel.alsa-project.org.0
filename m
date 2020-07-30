Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F11232ED4
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 10:44:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFCEF1769;
	Thu, 30 Jul 2020 10:43:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFCEF1769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596098648;
	bh=0dxCIHDfMHr/3c5K8qkI4IB3Kf3PliQkWuddH1SxOqs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q9SEBcxO7ckdAat4rhQppmjD6u5ONX1jtlXvvI8/13zhLkrIdVyxBMmkWfRj7YtRU
	 loGLbSUby3STdONhKIoAF+uHL99AQiAx7guSlH3N/p/j1l7puscx3NW/e2lPNGMMWC
	 jjvbPVYBL2FjynS0P0iw4tqs0dSvVXdGjKtaMQjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D245FF80292;
	Thu, 30 Jul 2020 10:42:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3A6FF8028D; Thu, 30 Jul 2020 10:42:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD9BEF800C9
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 10:42:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD9BEF800C9
IronPort-SDR: 0ZSUQ/z07glcr6AE9kAF0cYL8FaPdo638TvV/4da+GynC3fnuJ4D5W7hAfiJ6HVaYPWglfgYMX
 5CsA1nuHcBAw==
X-IronPort-AV: E=McAfee;i="6000,8403,9697"; a="139560322"
X-IronPort-AV: E=Sophos;i="5.75,413,1589266800"; d="scan'208";a="139560322"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2020 01:42:24 -0700
IronPort-SDR: gfGnHeCWPOOlv1nD9N0LEMMmXHvH6bSvctZ/dB+RjNTm93upa/7TLq4DBfp/EijlZQjUR0oYEj
 JBE5tQqcRJ7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,413,1589266800"; d="scan'208";a="290811088"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga006.jf.intel.com with ESMTP; 30 Jul 2020 01:42:20 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1k148p-004snj-PM; Thu, 30 Jul 2020 11:42:19 +0300
Date: Thu, 30 Jul 2020 11:42:19 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Brent Lu <brent.lu@intel.com>
Subject: Re: [PATCH v2 2/2] ASoC: Intel: Add period size constraint on strago
 board
Message-ID: <20200730084219.GF3703480@smile.fi.intel.com>
References: <1596096815-32043-1-git-send-email-brent.lu@intel.com>
 <1596096815-32043-3-git-send-email-brent.lu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596096815-32043-3-git-send-email-brent.lu@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Sam McNally <sammc@chromium.org>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Stuart <daniel.stuart14@gmail.com>, Yu-Hsuan Hsu <yuhsuan@chromium.org>,
 Damian van Soelen <dj.vsoelen@gmail.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Jul 30, 2020 at 04:13:35PM +0800, Brent Lu wrote:
> From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
> 
> The CRAS server does not set the period size in hw_param so ALSA will
> calculate a value for period size which is based on the buffer size
> and other parameters. The value may not always be aligned with Atom's
> dsp design so a constraint is added to make sure the board always has
> a good value.
> 
> Cyan uses chtmax98090 and others(banon, celes, edgar, kefka...) use
> rt5650.

Actually one more comment here.
Can you split per machine driver?

>  sound/soc/intel/boards/cht_bsw_max98090_ti.c | 14 +++++++++++++-
>  sound/soc/intel/boards/cht_bsw_rt5645.c      | 14 +++++++++++++-

-- 
With Best Regards,
Andy Shevchenko


