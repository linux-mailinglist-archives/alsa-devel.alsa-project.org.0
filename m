Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6508B24B1C1
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Aug 2020 11:11:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D8F01683;
	Thu, 20 Aug 2020 11:10:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D8F01683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597914695;
	bh=9grOJwwW+smmWhXPKrco5JwncCzYMCLalLQO1ZYLmAk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RCMTkc8IOIGdn8a6S1YRJcOTJDyROwUKX/ygqaf6Yt24l99YoH7a0higpUr3sK9QE
	 yeYHYeqfuOZmGbUaUguAcuS4ccu/PP55hVjAxsWApXwojKKLiGOcyJlPzjisra39zP
	 7LvA8AmT9WJZCFXSU0T8qgwBtn17unZbQ1ouBgE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B4DAF8023F;
	Thu, 20 Aug 2020 11:09:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 031CCF80228; Thu, 20 Aug 2020 11:09:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A510F800D3
 for <alsa-devel@alsa-project.org>; Thu, 20 Aug 2020 11:09:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A510F800D3
IronPort-SDR: 7XLn981Ajwao+mWnBFYgCwXSym5wiR1nuOFKzUp0VD0PKxZnQYY9is3u0kz284n/daUGwvKBMc
 C+BXjq6j8huQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9718"; a="134789646"
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; d="scan'208";a="134789646"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2020 02:09:44 -0700
IronPort-SDR: psTo1wmXOs2DKVI2uw3zkBjnDaN4OhGcO6ZTW8iptgHUgFZZsmanfUSkYBfphPke74ku8eLHW3
 Zh8t3TshfBog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; d="scan'208";a="327359802"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 20 Aug 2020 02:09:40 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1k8gRL-00A4fP-I8; Thu, 20 Aug 2020 12:00:55 +0300
Date: Thu, 20 Aug 2020 12:00:55 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v4 02/13] ASoC: Intel: catpt: Define DSP operations
Message-ID: <20200820090055.GT1891694@smile.fi.intel.com>
References: <20200812205753.29115-1-cezary.rojewski@intel.com>
 <20200812205753.29115-3-cezary.rojewski@intel.com>
 <20200813185129.GB1891694@smile.fi.intel.com>
 <946fdd80-c89d-ee1b-6eef-e752318b55a6@intel.com>
 <237f2343-fd57-8ebf-b8f2-8c2cf5c3c745@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <237f2343-fd57-8ebf-b8f2-8c2cf5c3c745@intel.com>
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

On Thu, Aug 20, 2020 at 09:30:13AM +0200, Cezary Rojewski wrote:
> On 2020-08-17 1:12 PM, Cezary Rojewski wrote:
> > On 2020-08-13 8:51 PM, Andy Shevchenko wrote:
> > > On Wed, Aug 12, 2020 at 10:57:42PM +0200, Cezary Rojewski wrote:

...

> > > > +#define CATPT_DMA_MAXBURST    0x3
> > > 
> > > We have DMA engine definitions for that, please avoid magic numbers.
> > 
> > As with most of the dma stuff, based on existing:
> > /sound/soc/intel/common/sst-firmware.c SST_DSP_DMA_MAX_BURST
> > 
> > Ack.
> 
> Actually, wasn't able to find anything _MAXBURST related in dmaengine.h.
> _BUSWIDTH_ have their constants defined there, true, but I'm already making
> use of these and this is dst/src_maxburst we're talking about. From what
> I've seen in kernel sources, most usages are direct assignments:
> xxx_maxburst = Y;

Okay, and how 0x3 bytes can be a burst? Does DMA engine support this?

...

> > > > +    /* set D3 */
> > > > +    catpt_updatel_pci(cdev, PMCS, CATPT_PMCS_PS, CATPT_PMCS_PS_D3HOT);
> > > > +    udelay(50);
> > > 
> > > Don't we have PCI core function for this?
> > > 
> > > > +    /* set D0 */
> > > > +    catpt_updatel_pci(cdev, PMCS, CATPT_PMCS_PS, 0);
> > > > +    udelay(100);
> > > 
> > > Ditto.
> > > 
> > > > +    /* set D3 */
> > > > +    catpt_updatel_pci(cdev, PMCS, CATPT_PMCS_PS, CATPT_PMCS_PS_D3HOT);
> > > > +    udelay(50);
> > > 
> > > Ditto.
> > > 
> > > > +    /* set D0 */
> > > > +    catpt_updatel_pci(cdev, PMCS, CATPT_PMCS_PS, 0);
> > > 
> > > Ditto.
> > 
> > Thanks to you now I know the correct answer: yes.
> > Ack for all of these. Good advice Andy, again!
> 
> Similar situation occurred here. What we're dealing with is: instance of
> 'struct platform_device' type, found on bus: acpi with PCI set as a parent
> device.
> 
> Scope found in DSDT:
> 	\_SB_.PCI0.ADSP
> sysfs device path:
> 	/sys/devices/pci0000:00/INT3438:00
> Within the latter _no_ standard utility files will be available e.g.:
> ability to dump PCI config space, bars and such.

I see. Can you dump DSDT somewhere? We are interested in
PSx/PRx/PSE/PSW/PSC/PRE/PRW/ON/OFF (x=0..3) methods.

> I haven't found any functionality to extract "pci_companion" from a
> platform_device. What can be made use of is: PCI_D3hot and PCI_D0 enum
> constants, as pci_set_power_state() does not apply - expects struct pci_dev
> *.
> 
> Perhaps got misled by the function naming? catpt_updatel_xxx helpers: _xxx
> denotes specific ADSP device's mmio space. Almost all cases are covered by
> _pci and _shim.

If we really need to use these commands directly, utilize at least definitions
from PCI core, e.g. PCI_D0, PCI_D3hot, PCI_PM_CTRL.

-- 
With Best Regards,
Andy Shevchenko


