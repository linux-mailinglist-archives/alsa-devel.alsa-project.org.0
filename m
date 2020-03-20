Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A3E18CD46
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 12:53:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2069117CD;
	Fri, 20 Mar 2020 12:53:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2069117CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584705239;
	bh=/P1pySoaLLW6Zi3fI18eKhWEDtzyR7Aw0pVOX8m5HfU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n4B2LdEQve2L7QKuEPu+hfMHVdNaOeQG3bxncIkRWwr5zhms9Gx2TTqKCjGKkUbPh
	 yidkELMWjfGIP11Ypszx37v7vbTh4OdX9GnscaYcupg2IgZh403VDVzct056mKdZNR
	 a7kMhNpPhtpvS7IKAfPBj2sqNIS97R6nYQqO3y4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4318CF800C0;
	Fri, 20 Mar 2020 12:52:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C80B3F8015B; Fri, 20 Mar 2020 12:52:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2EFBF800C0;
 Fri, 20 Mar 2020 12:52:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2EFBF800C0
IronPort-SDR: Qqn2heTNNgoHE97gfGj4XgCWluZmemrr5uwoDKwztZk/F+skhne4Ae5UHa/g1IJcYQyJPq5Jrz
 uOewovAL3zaw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2020 04:52:05 -0700
IronPort-SDR: QZFO0jJe+m07ww/YVZwyoy3IEq02LWJFAFBPFjPtlOcXU5xSwoHwlSH6YhyqK2BohHwgfAtTXR
 r44X7PonXfNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,284,1580803200"; d="scan'208";a="234487515"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.252.57.199])
 by orsmga007.jf.intel.com with ESMTP; 20 Mar 2020 04:52:04 -0700
Date: Fri, 20 Mar 2020 12:52:03 +0100
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 06/14] ASoC: SOF: add a power status IPC
Message-ID: <20200320115203.GA2130@ubuntu>
References: <20200312144429.17959-1-guennadi.liakhovetski@linux.intel.com>
 <20200312144429.17959-7-guennadi.liakhovetski@linux.intel.com>
 <20200313143956.GJ5528@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200313143956.GJ5528@sirena.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 sound-open-firmware@alsa-project.org
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

Hi Mark,

On Fri, Mar 13, 2020 at 02:39:56PM +0000, Mark Brown wrote:
> On Thu, Mar 12, 2020 at 03:44:21PM +0100, Guennadi Liakhovetski wrote:
> 
> >  #endif
> > +	atomic_set(&sdev->reset_count, 0);
> >  	dev_set_drvdata(dev, sdev);
> 
> Do we really need to use atomics for this?  They are hard to use
> correctly.

This variable is accessed from 2 contexts: it's incremented by the SOF 
driver, when the firmware has booted and it's read by the SOF
VirtIO backend vhost-be.c when receiving a resume request from the guest. 
Timewise the variable will only be incremented during the DSP resume / 
power up, while the VirtIO back end is waiting for the resume to complete in 
pm_runtime_get_sync(). And only after that it reads the variable. But that 
can happen on different CPUs. Whereas I think that runtime PM will sync 
caches somewhere during the process, I think it is better to access the 
variable in an SMP-safe way, e.g. using atomic operations.

> >  #include "ops.h"
> > @@ -617,6 +618,9 @@ int snd_sof_run_firmware(struct snd_sof_dev *sdev)
> >  	/* fw boot is complete. Update the active cores mask */
> >  	sdev->enabled_cores_mask = init_core_mask;
> >  
> > +	/* increment reset count */
> > +	atomic_add(1, &sdev->reset_count);
> > +
> 
> We at no point seem to read from this reset counter?  I can't figure out
> from this commit what it's doing.

It's used in vhost-be.c (patch 10/14).

Thanks
Guennadi
