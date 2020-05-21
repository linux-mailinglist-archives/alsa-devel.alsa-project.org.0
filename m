Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6FE1DC657
	for <lists+alsa-devel@lfdr.de>; Thu, 21 May 2020 06:38:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A47B1822;
	Thu, 21 May 2020 06:38:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A47B1822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590035932;
	bh=MA7haufr2rOvAnUOgYCt9oKAn9zrsqgUr5NKmHSkYiA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FHEqTacfij4LwA6cZaS1Vpe3Esychnrq5Wou7p+dbqfS3FUCOeysHRuMmt0cyT8Ps
	 yzkxQhuCOQ2ffAwFALjaXNYQ0Ed7LXU6TBjRWR1GRDi++pX6CBGDGIsH+pHylZZB41
	 TxO2gQu6oXNDjV7/9pYN0rm05Bjfh/vOpkE95fJY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90D54F801F8;
	Thu, 21 May 2020 06:37:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E36EF801D8; Thu, 21 May 2020 06:37:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60E1FF80111
 for <alsa-devel@alsa-project.org>; Thu, 21 May 2020 06:37:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60E1FF80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nxn0djuS"
Received: from localhost (unknown [106.200.226.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 39F3E206D4;
 Thu, 21 May 2020 04:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590035819;
 bh=MA7haufr2rOvAnUOgYCt9oKAn9zrsqgUr5NKmHSkYiA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nxn0djuSvW5KFjPJ+JBsOrpo+bc5SYjBYZ+jiODEMYp2NZp8DstO4wfXYNrWAX53Z
 /RExFCtZpbMhO79mpPuIetbBzA6IJCo3slD+bvcowFTp3VdMxRrEQ1bUfFrlO90+Zj
 BhE342TjjZ1I1DYMtkH3H26ERD5mi4K0wj1Gx3mQ=
Date: Thu, 21 May 2020 10:06:55 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Liao, Bard" <bard.liao@intel.com>
Subject: Re: [PATCH 2/2] soundwire: intel: transition to 3 steps initialization
Message-ID: <20200521043655.GA374218@vkoul-mobl.Dlink>
References: <20200519191903.6557-1-yung-chuan.liao@linux.intel.com>
 <20200519191903.6557-2-yung-chuan.liao@linux.intel.com>
 <20200520135425.GX374218@vkoul-mobl.Dlink>
 <DM6PR11MB4074165599273350FF7CA83EFFB70@DM6PR11MB4074.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB4074165599273350FF7CA83EFFB70@DM6PR11MB4074.namprd11.prod.outlook.com>
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "hui.wang@canonical.com" <hui.wang@canonical.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
 "jank@cadence.com" <jank@cadence.com>, "Lin,
 Mengdong" <mengdong.lin@intel.com>, "Blauciak,
 Slawomir" <slawomir.blauciak@intel.com>, "Kale,
 Sanyog R" <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "rander.wang@linux.intel.com" <rander.wang@linux.intel.com>
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

On 21-05-20, 02:23, Liao, Bard wrote:
> > -----Original Message-----
> > From: Vinod Koul <vkoul@kernel.org>
> > Sent: Wednesday, May 20, 2020 9:54 PM
> > To: Bard Liao <yung-chuan.liao@linux.intel.com>
> > Cc: alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org; tiwai@suse.de;
> > broonie@kernel.org; gregkh@linuxfoundation.org; jank@cadence.com;
> > srinivas.kandagatla@linaro.org; rander.wang@linux.intel.com;
> > ranjani.sridharan@linux.intel.com; hui.wang@canonical.com; pierre-
> > louis.bossart@linux.intel.com; Kale, Sanyog R <sanyog.r.kale@intel.com>;
> > Blauciak, Slawomir <slawomir.blauciak@intel.com>; Lin, Mengdong
> > <mengdong.lin@intel.com>; Liao, Bard <bard.liao@intel.com>
> > Subject: Re: [PATCH 2/2] soundwire: intel: transition to 3 steps initialization
> > 
> > On 20-05-20, 03:19, Bard Liao wrote:
> > > From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > >
> > > Rather than a plain-vanilla init/exit, this patch provides 3 steps in
> > > the initialization (ACPI scan, probe, startup) which makes it easier to
> > > detect platform support for SoundWire, allocate required resources as
> > > early as possible, and conversely help make the startup() callback
> > > lighter-weight with only hardware register setup.
> > 
> > Okay but can you add details in changelog on what each step would do?
> 
> Sure. Will do.
> 
> > 
> > > @@ -1134,25 +1142,15 @@ static int intel_probe(struct platform_device
> > *pdev)
> > >
> > >  	intel_pdi_ch_update(sdw);
> > >
> > > -	/* Acquire IRQ */
> > > -	ret = request_threaded_irq(sdw->link_res->irq,
> > > -				   sdw_cdns_irq, sdw_cdns_thread,
> > > -				   IRQF_SHARED, KBUILD_MODNAME, &sdw-
> > >cdns);
> > 
> > This is removed here but not added anywhere else, do we have no irq
> > after this patch?
> 
> We use a single irq for all Intel Audio DSP events and it will
> be requested in the SOF driver.

And how will the irq be propagated to sdw/cdns drivers here?

-- 
~Vinod
