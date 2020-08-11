Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A67F241CAE
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 16:47:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C290A1666;
	Tue, 11 Aug 2020 16:47:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C290A1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597157273;
	bh=y8GXwkn25ImMcADcrNRCDQl+WwjRa/VcOxPt9xdNe8Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NK+7tZ/qu+mSc6MlV0/O4f7l6dgnMs1KsgXXHR2uGfbU37cSRrGtoIkAXF+5bYQcx
	 iI/eiDnNhtk1CzExBOb3/vCSCVBy6bU0G90J04RqUpJgUsJj97BK4/wYRQoNNe8e7K
	 zKgWbgOytsy5vKiUeManwc8uJiky3zaTUFtqiN/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE662F80161;
	Tue, 11 Aug 2020 16:46:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10A34F8015B; Tue, 11 Aug 2020 16:46:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_14, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE45CF800BC
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 16:45:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE45CF800BC
IronPort-SDR: ZxP/tYRqhy+9VKabqF0xQxs6ugaiFJnGN2L7kSI5kDVYQTJZUMuqNyZ182qSR0+rCGf/ay67u2
 XI01s1UzamCw==
X-IronPort-AV: E=McAfee;i="6000,8403,9710"; a="154860628"
X-IronPort-AV: E=Sophos;i="5.76,461,1592895600"; d="scan'208";a="154860628"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2020 07:45:55 -0700
IronPort-SDR: OI1utc3vppWL4lqyS5kZEssojHncxg6GYY/Fc5+/WpbnJ5vYpfUH+RO2fIvPR69JL1YKBkzF8C
 TzSvMUGLQkhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,461,1592895600"; d="scan'208";a="324778153"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 11 Aug 2020 07:45:52 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1k5VT0-0080Av-JC; Tue, 11 Aug 2020 17:41:30 +0300
Date: Tue, 11 Aug 2020 17:41:30 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 09/13] ASoC: Intel: Select catpt and deprecate haswell
Message-ID: <20200811144130.GE1891694@smile.fi.intel.com>
References: <20200811100034.6875-10-cezary.rojewski@intel.com>
 <202008112152.WcqIiwSM%lkp@intel.com>
 <20200811133816.GD1891694@smile.fi.intel.com>
 <673b2bdd-a8f1-6d1d-abb1-88c5589b82f8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <673b2bdd-a8f1-6d1d-abb1-88c5589b82f8@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: alsa-devel@alsa-project.org, kbuild-all@lists.01.org,
 kernel test robot <lkp@intel.com>, filip.kaczmarski@intel.com,
 harshapriya.n@intel.com, marcin.barlik@intel.com, zwisler@google.com,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, tiwai@suse.com
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

On Tue, Aug 11, 2020 at 04:09:11PM +0200, Cezary Rojewski wrote:
> On 2020-08-11 3:38 PM, Andy Shevchenko wrote:
> > On Tue, Aug 11, 2020 at 09:08:43PM +0800, kernel test robot wrote:
> > > Hi Cezary,
> > > 
> > > I love your patch! Perhaps something to improve:
> > > 
> > > [auto build test WARNING on asoc/for-next]
> > > [also build test WARNING on sound/for-next v5.8 next-20200811]
> > > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > > And when submitting patch, we suggest to use '--base' as documented in
> > > https://git-scm.com/docs/git-format-patch]
> > > 
> > > url:    https://github.com/0day-ci/linux/commits/Cezary-Rojewski/ASoC-Intel-Catpt-Lynx-and-Wildcat-point/20200811-181319
> > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> > > config: i386-allyesconfig (attached as .config)
> > > compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> > > reproduce (this is a W=1 build):
> > >          # save the attached .config to linux build tree
> > >          make W=1 ARCH=i386
> > > 
> > > If you fix the issue, kindly add following tag as appropriate
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > 
> > > All warnings (new ones prefixed by >>):
> > 
> > To fix all these, please use %pR or %pr (I believe you want former rather than
> > latter).
> > 
> 
> Thanks for the advice!
> 
> I'd like to keep format cohesive with the rest, though:
> 	restoring <type of context>: off 0x%08x size %d\n
> 
> %pr yields:
> 
>    82.914316] snd_soc_catpt:catpt_restore_fwimage: catpt_adsp INT3438:00:
> restoring fwimage: [io  0x86470-0x86bbf flags 0xffffffffb2a27bf0]
> 
> Casting to (unsigned long long) should be fine, judging by
> /kernel/resource.c, yes?

No. The rule of thumb that if you cast for printf() something is really needs
to be checked (and 99% wrong).

Use %pa as per printk-formats.rst.

-- 
With Best Regards,
Andy Shevchenko


