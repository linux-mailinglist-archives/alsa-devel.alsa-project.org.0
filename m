Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 596974D1BB
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2019 17:11:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C91591673;
	Thu, 20 Jun 2019 17:10:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C91591673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561043462;
	bh=ktpFi/el0X2Qwi11RiEQR1D/LwLcnBQMafx5axXFQ8s=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y1+vDG408v+i6lf1kZpRiI1moLNz9t/X9LXp8bAL9Ow7rk2ou3TW79vnXgPWdrGIJ
	 2sqKtMHakDG1lnIeyF3bXbj/Fk2ZZ1YB32+0Dqz8Hq+WMMG+BClkoC55d5nI+JrFiN
	 +zZb88QCZQbAs6ZucnpgABY5rfNs5bzlpDhb1Q/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19719F8971B;
	Thu, 20 Jun 2019 17:09:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47357F8971C; Thu, 20 Jun 2019 17:09:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D295BF80C15
 for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2019 17:09:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D295BF80C15
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jun 2019 08:09:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,397,1557212400"; d="scan'208";a="168541068"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Jun 2019 08:09:08 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hdygV-0001TD-A2; Thu, 20 Jun 2019 18:09:07 +0300
Date: Thu, 20 Jun 2019 18:09:07 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190620150907.GG9224@smile.fi.intel.com>
References: <20190619150213.87691-1-andriy.shevchenko@linux.intel.com>
 <a987bd54-5364-f046-a928-44a97ed0307f@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a987bd54-5364-f046-a928-44a97ed0307f@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v1] ASoC: Intel: Skylake: Switch to modern
 UUID API
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jun 19, 2019 at 05:46:34PM +0200, Pierre-Louis Bossart wrote:
> On 6/19/19 5:02 PM, Andy Shevchenko wrote:
> > Switch the driver to use modern UUID API, i.e. guid_t type and
> > accompanying functions, such as guid_equal().
> > 
> > Cc: Liam Girdwood <lgirdwood@gmail.com>
> > Cc: Mark Brown <broonie@kernel.org>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Looks good to me - couple of nit-picks below on unrelated indentation
> changes.
> 
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks for review!

> >   	char mod_name[64]; /* guid str = 32 chars + 4 hyphens */
> > -	uuid_le *uuid_mod;
> > -	uuid_mod = (uuid_le *)guid;
> >   	snprintf(mod_name, sizeof(mod_name), "%s%pUL%s",
> > -				"intel/dsp_fw_", uuid_mod, ".bin");
> > +					     "intel/dsp_fw_", guid, ".bin");
> 
> indentation looks off, not sure if this is a diff effect.

Ah, this can be modified to the below (by a separate patch, since Mark applied
this one already):

	snprintf(mod_name, sizeof(mod_name), "intel/dsp_fw_%pUL.bin", guid);

What do you think?

P.S. And it will take only one line.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
