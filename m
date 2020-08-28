Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DE1255C4A
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 16:22:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED4671892;
	Fri, 28 Aug 2020 16:21:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED4671892
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598624563;
	bh=PkMf63A54wSl+AcjUbWllnALDzR/QLt7uLaIIbIinZc=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ceZpY9fNbgAClJgql2VN23faL2QHVzywzDVq/Cf7uW6IWlLJpiy//REVedWU47Qab
	 qaD8rzcZY7jgxUdlbqWtnx7Azjl11Qr8OAx5C9uLs0uLX9Avi/E5QnD5/CiFnYiHHt
	 aRDqufxxaV2UNwjd1m3XisjzQXp5bJY7cGjqTQYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EDFBF8016F;
	Fri, 28 Aug 2020 16:21:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84AACF8016F; Fri, 28 Aug 2020 16:20:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13645F80118
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 16:20:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13645F80118
IronPort-SDR: AKgzz0cdPH9fA6K2VbgiHNvNVfBNzRgC3p8Jtxz+MvIcBXb4zr5XfKYyzh03UCnVZnUBJOGAVF
 Q5snn/iG6vxg==
X-IronPort-AV: E=McAfee;i="6000,8403,9726"; a="136731457"
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; d="scan'208";a="136731457"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 07:20:42 -0700
IronPort-SDR: R+b/Q25oLvb4+oq7SsZuIAlHR2bxxrSjfvdm2LP4cc7PdMlHBmiFz8TaCmBJQYMnjhPoI+tpe4
 eZDj0a0WT6ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; d="scan'208";a="329964529"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 28 Aug 2020 07:20:41 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kBfF9-00C8Tm-6x; Fri, 28 Aug 2020 17:20:39 +0300
Date: Fri, 28 Aug 2020 17:20:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lars-Peter Clausen <lars@metafoo.de>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1] ASoC: core: Replace dma_request_slave_channel() with
 dma_request_chan()
Message-ID: <20200828142039.GT1891694@smile.fi.intel.com>
References: <20200828140057.4198-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200828140057.4198-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Fri, Aug 28, 2020 at 05:00:57PM +0300, Andy Shevchenko wrote:
> Drivers should use dma_request_chan() instead of dma_request_slave_channel().
> 
> dma_request_slave_channel() is a simple wrapper for dma_request_chan() eating
> up the error code for channel request failure and makes deferred probing
> impossible.

It's not fully correct change.

-- 
With Best Regards,
Andy Shevchenko


