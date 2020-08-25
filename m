Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CF3251968
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 15:20:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFCAA1671;
	Tue, 25 Aug 2020 15:19:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFCAA1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598361624;
	bh=A+uHpEmz3/nyan1dLjQWYLMNsrigJ4kmVrjAsedfQpI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lqaOhux3FZX+KBUclcJknWIxbFrSkrMaE8Vuy/SA4p0SBgRHwVaTxZKChx6KWOh1p
	 ciocn3a7+WP/1bcruuHxQ4949HVV0e9+bTmdfvM4xBBqFfYendr29QOvn3MxmwA1IH
	 4m6ZQ+zKB7kjwx19ws8S4O4SaT6Xt5I09ZZaq6Ik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B429F8025A;
	Tue, 25 Aug 2020 15:18:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28FF2F80143; Tue, 25 Aug 2020 15:18:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAC10F80143
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 15:18:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAC10F80143
IronPort-SDR: Qz+GLnwNyCj+u5gLucOzcA9nOwQTfTbFfJGwELb1KcPztWxhx4aMLUSbfpde2YA2rTRkej5ebT
 bnxYcU5Ogm6w==
X-IronPort-AV: E=McAfee;i="6000,8403,9723"; a="217652969"
X-IronPort-AV: E=Sophos;i="5.76,352,1592895600"; d="scan'208";a="217652969"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 06:18:27 -0700
IronPort-SDR: hB/a47Ia8SgbbwDjgSa5XMx5KYlOFU/oYT4Y2aqfIHPPlPHyLRo6ujWOB+aIZ1V7HZQPIgJzfR
 PLPCc3eqT5AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,352,1592895600"; d="scan'208";a="328861596"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 25 Aug 2020 06:18:23 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1kAYqD-00BKZu-BX; Tue, 25 Aug 2020 16:18:21 +0300
Date: Tue, 25 Aug 2020 16:18:21 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v4 01/13] ASoC: Intel: Add catpt device
Message-ID: <20200825131821.GH1891694@smile.fi.intel.com>
References: <20200812205753.29115-1-cezary.rojewski@intel.com>
 <20200812205753.29115-2-cezary.rojewski@intel.com>
 <20200813182908.GA1891694@smile.fi.intel.com>
 <3280b1a6-81f3-9f3f-d496-2bbf570c82d1@intel.com>
 <20200818100743.GH1891694@smile.fi.intel.com>
 <7cd5fa73-797e-17c3-4b7c-7635a18c59af@intel.com>
 <20200819134323.GM1891694@smile.fi.intel.com>
 <13a443ad-f667-c7f0-a25d-35baf94be23e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13a443ad-f667-c7f0-a25d-35baf94be23e@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, marcin.barlik@intel.com,
 zwisler@google.com, lgirdwood@gmail.com, tiwai@suse.com,
 filip.proborszcz@intel.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, michal.wasko@intel.com,
 cujomalainey@chromium.org, krzysztof.hejmowski@intel.com,
 ppapierkowski@habana.ai, vamshi.krishna.gopal@intel.com
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

On Tue, Aug 25, 2020 at 11:32:57AM +0200, Cezary Rojewski wrote:
> On 2020-08-19 3:43 PM, Andy Shevchenko wrote:
> > On Wed, Aug 19, 2020 at 03:26:04PM +0200, Cezary Rojewski wrote:

...

> > My vision is to extend that header to cover changes and use it in your code.
> > It might, though, require some cleanups to be done against pxa2xx_ssp.h.
> 
> Conclusion from checking pxa2_ssp.h registers:
> 
> - SSPSP2 is missing (0x44)
> - SSC2 vs SSACDD (0x40) both same offset but different purpose so probably
> new define would have to be added
> 
> As situation is similar to the resource-API case below are the options:
> a) ship catpt with existing ssp reg set, update pxa2_ssp.h in following
> series and then re-use them for catpt
> b) update pxa2_ssp.h first, await merge, ship catpt only afterward
> 
> I vote for option a) given the maturity driver is reaching plus I'd rather
> be done with sound/soc/intel/ sanitization sooner than later.

Luckily we have Mark to maintain both SPI and ASoC, which means you may prepend
your series with PXA2xx header update and have his Ack for it. He can create an
immutable branch and apply it to SPI tree afterwards, or other way around. So I
definitely vote for b).

-- 
With Best Regards,
Andy Shevchenko


