Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3158280747
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 20:55:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 348021ABD;
	Thu,  1 Oct 2020 20:54:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 348021ABD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601578547;
	bh=JEbymAA8QkTqhS/b0RLo9HwVbJQ/H534PNiIX51FAL4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EwZkOKriWikLu5uLrlPw/ZdgqW1QI2uGsbc3qSXDf8qShpKVj0n4oiWmDtReh0N4h
	 mKvcWxzg7Hmix8dAFkHlY2xrOsBYHnZ2MfFmmy2j2xab/dDSdjjvlFJIjEFlNsJzDe
	 PCm9tZ6nOADTcsnD3Wm5w+GYNOKNC4ApRxr9MUPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A776F801DB;
	Thu,  1 Oct 2020 20:54:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55400F8022B; Thu,  1 Oct 2020 20:54:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35B17F801D8
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 20:54:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35B17F801D8
IronPort-SDR: SOtZp5uTD95jtu0M5EwIhCMv/xb9CTUVgrRMB5lK+TI0lEpibBhjtB8Y9ycW+NXCBDgtzqaqyi
 JSVTfPR50twA==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="142815645"
X-IronPort-AV: E=Sophos;i="5.77,324,1596524400"; d="scan'208";a="142815645"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 11:54:19 -0700
IronPort-SDR: n2+vDB6BEObYqNhy2rFVSvZEboUqA6h11diYJq23ZMqaoqhgnELY/5byWR6tm/rA2hoMjUYSqw
 f51RfqNTBx0Q==
X-IronPort-AV: E=Sophos;i="5.77,324,1596524400"; d="scan'208";a="351253649"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 11:54:14 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kO3iT-003HpY-7e; Thu, 01 Oct 2020 21:54:09 +0300
Date: Thu, 1 Oct 2020 21:54:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v10 14/14] ASoC: Intel: Select catpt and deprecate haswell
Message-ID: <20201001185409.GV3956970@smile.fi.intel.com>
References: <20200929141247.8058-1-cezary.rojewski@intel.com>
 <20200929141247.8058-15-cezary.rojewski@intel.com>
 <20201001183329.GA41046@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201001183329.GA41046@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, lgirdwood@gmail.com,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com,
 gregkh@linuxfoundation.org, ppapierkowski@habana.ai, marcin.barlik@intel.com,
 zwisler@google.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, filip.proborszcz@intel.com,
 amadeuszx.slawinski@linux.intel.com, michal.wasko@intel.com, tiwai@suse.com,
 krzysztof.hejmowski@intel.com, cujomalainey@chromium.org,
 vamshi.krishna.gopal@intel.com
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

On Thu, Oct 01, 2020 at 07:33:29PM +0100, Mark Brown wrote:
> On Tue, Sep 29, 2020 at 04:12:47PM +0200, Cezary Rojewski wrote:
> > Prevent sound/soc/intel/haswell code compile and select catpt instead as
> > a recommended solution. Userspace-exposed members are compatible with
> > what is exposed by deprecated solution thus no harm is done. The only
> > visible difference is the newly added 'Loopback Mute' kcontrol.
> 
> This doesn't build against current code with x86 allmodconfig, please
> check and resend:

This has a dependency from SPI tree. Can you merge (cherry-pick) one patch from
there to ASoC tree, please?

a2bee00cccf4 ("spi: pxa2xx: Add SSC2 and SSPSP2 SSP registers")


> In file included from /mnt/kernel/sound/soc/intel/catpt/core.h:14,
>                  from /mnt/kernel/sound/soc/intel/catpt/dsp.c:13:
> /mnt/kernel/sound/soc/intel/catpt/dsp.c: In function 'catpt_dsp_set_regs_defaults':
> /mnt/kernel/sound/soc/intel/catpt/dsp.c:339:29: error: 'SSCR2' undeclared (first use in this function); did you mean 'SSCR0'?
>    catpt_writel_ssp(cdev, i, SSCR2, CATPT_SSCR2_DEFAULT);
>                              ^~~~~
> /mnt/kernel/sound/soc/intel/catpt/registers.h:152:43: note: in definition of macro 'catpt_writel_ssp'
>   writel(val, catpt_ssp_addr(cdev, ssp) + (reg))
>                                            ^~~
> /mnt/kernel/sound/soc/intel/catpt/dsp.c:339:29: note: each undeclared identifier is reported only once for each function it appears in
>    catpt_writel_ssp(cdev, i, SSCR2, CATPT_SSCR2_DEFAULT);
>                              ^~~~~
> /mnt/kernel/sound/soc/intel/catpt/registers.h:152:43: note: in definition of macro 'catpt_writel_ssp'
>   writel(val, catpt_ssp_addr(cdev, ssp) + (reg))
>                                            ^~~
> /mnt/kernel/sound/soc/intel/catpt/dsp.c:340:29: error: 'SSPSP2' undeclared (first use in this function); did you mean 'SSPSP'?
>    catpt_writel_ssp(cdev, i, SSPSP2, CATPT_SSPSP2_DEFAULT);
>                              ^~~~~~
> /mnt/kernel/sound/soc/intel/catpt/registers.h:152:43: note: in definition of macro 'catpt_writel_ssp'
>   writel(val, catpt_ssp_addr(cdev, ssp) + (reg))
>                                            ^~~
> 



-- 
With Best Regards,
Andy Shevchenko


