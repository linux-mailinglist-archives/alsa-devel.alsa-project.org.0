Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0710564AE8
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2019 18:45:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9224B16B1;
	Wed, 10 Jul 2019 18:44:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9224B16B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562777143;
	bh=lKb1A9n8loaYetn15aOp4dlmuKf9lrlL/AiY8chlpFE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jqw2pcStMnmF6CNA8HCCKEL0Pdt9cLlIqp+G7GXsAm4djaA4C8FSZjGoQTDGRXGJL
	 6YLez2KAAlsIJxAeEw0RYKfZ7D5+nE/D4fIXdtGkl9bktdnzzygm25KOplFDzV11cO
	 CgNsuw+kkRNjK1D7wIG4kHgMqDersO7FmaNsKUwI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7A0EF802A0;
	Wed, 10 Jul 2019 18:43:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B225F802A1; Wed, 10 Jul 2019 18:43:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 612E1F800DE
 for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2019 18:43:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 612E1F800DE
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jul 2019 09:43:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,475,1557212400"; d="scan'208";a="249523913"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
 by orsmga001.jf.intel.com with ESMTP; 10 Jul 2019 09:43:47 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hlFh4-00061t-7A; Wed, 10 Jul 2019 19:43:46 +0300
Date: Wed, 10 Jul 2019 19:43:46 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Curtis Malainey <cujomalainey@google.com>
Message-ID: <20190710164346.GP9224@smile.fi.intel.com>
References: <CAOReqxhxHiJ-4UYC-j4Quuuy5YP9ywohe_JwiLpCxqCvP-7ypg@mail.gmail.com>
 <20190709131401.GA9224@smile.fi.intel.com>
 <20190709132943.GB9224@smile.fi.intel.com>
 <20190709133448.GC9224@smile.fi.intel.com>
 <20190709133847.GD9224@smile.fi.intel.com>
 <CAOReqxgnbDJsEcv7vdX3w44rzB=B69sHj95E8yBZ8DnZq0=63Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOReqxgnbDJsEcv7vdX3w44rzB=B69sHj95E8yBZ8DnZq0=63Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Ross Zwisler <zwisler@google.com>, Fletcher Woodruff <fletcherw@google.com>,
 Liam Girdwood <liam.r.girdwood@intel.com>, dmaengine@vger.kernel.org,
 Pierre-louis Bossart <pierre-louis.bossart@intel.com>
Subject: Re: [alsa-devel] DW-DMA: Probe failures on broadwell
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

On Tue, Jul 09, 2019 at 12:27:49PM -0700, Curtis Malainey wrote:
> Hi Andy,

Please, don't top post in the public mailing lists, community doesn't like it.

> Thanks for the information, we are running a 4.14 kernel so we don't
> have the idma32 driver, I will see if I can backport it and report
> back if the fix works.

Driver is supporting iDMA 32-bit in v4.14 AFAICS.
The missed stuff is a split and some fixes here and there.
Here is the list of patches I have in a range v4.14..v5.2
(I deliberately dropped the insignificant ones)

934891b0a16c dmaengine: dw: Don't pollute CTL_LO on iDMA 32-bit
91f0ff883e9a dmaengine: dw: Reset DRAIN bit when resume the channel
69da8be90d5e dmaengine: dw: Split DW and iDMA 32-bit operations
87fe9ae84d7b dmaengine: dw: Add missed multi-block support for iDMA 32-bit
ffe843b18211 dmaengine: dw: Fix FIFO size for Intel Merrifield
7b0c03ecc42f dmaengine: dw-dmac: implement dma protection control setting

For me sounds like fairly easy to backport.

> On Tue, Jul 9, 2019 at 6:38 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Tue, Jul 09, 2019 at 04:34:48PM +0300, Andy Shevchenko wrote:
> > > On Tue, Jul 09, 2019 at 04:29:43PM +0300, Andy Shevchenko wrote:
> > > > On Tue, Jul 09, 2019 at 04:14:01PM +0300, Andy Shevchenko wrote:
> > > > > On Mon, Jul 08, 2019 at 01:50:07PM -0700, Curtis Malainey wrote:
> > > >
> > > > > So, the correct fix is to provide a platform data, like it's done in
> > > > > drivers/dma/dw/pci.c::idma32_pdata, in the sst-firmware.c::dw_probe(), and call
> > > > > idma32_dma_probe() with idma32_dma_remove() respectively on removal stage.
> > > > >
> > > > > (It will require latest patches to be applied, which are material for v5.x)
> > > >
> > > > Below completely untested patch to try
> > >
> > > Also, it might require to set proper request lines (currently it uses 0 AFAICS).
> > > Something like it's done in drivers/spi/spi-pxa2xx-pci.c for Intel Merrifield.
> >
> > And SST_DSP_DMA_MAX_BURST seems encoded while it's should be simple number,
> > like 8 (bytes). Also SPI PXA is an example to look into.
> >
> > I doubt it has been validated with upstream driver (I know about some internal
> > drivers, hacked version of dw one, you may find sources somewhere in public).

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
