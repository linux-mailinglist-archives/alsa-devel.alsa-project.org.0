Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD9F2F52AA
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 19:49:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20296168E;
	Wed, 13 Jan 2021 19:48:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20296168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610563739;
	bh=VgpHILsjUWzBSFKFPsO1ReQMdNPovROyk/rdnIghh5o=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QO8j8VcHOyu3lJxOR7AkQqoVLSGLZWJaboSN2orSZbMQcRdxsx0+HBzR2TbZB3EGY
	 SE71IOhQRJXREoPEU0T+krn1xQacubctCmXm9Bpp2Orszt3fFYVYMQdGKKR+kYXnMD
	 NK4Yo7K30YnITQz0uPOMSEDOAOu3CaAnA1kH4xGY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98CD3F8014D;
	Wed, 13 Jan 2021 19:47:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFB9DF801ED; Wed, 13 Jan 2021 19:47:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 423DAF8014D
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 19:47:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 423DAF8014D
IronPort-SDR: GifkDma8C6MZiMitJdj9zZR22W2WRtWq29J/QEcNxjXNfnoWkt1UAOPpfpjbVcaXqnTwhVRz+3
 bXfNQygSQjFg==
X-IronPort-AV: E=McAfee;i="6000,8403,9863"; a="178344865"
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="178344865"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 10:47:11 -0800
IronPort-SDR: I69AsW9rQKiKknpTVwbu61/UXEkrjJ2kik4zfRnpW9yLvi4D9DrvrotHKkgmgKSTxEHu8HRdTm
 wIaTKTFokdMg==
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="348917537"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 10:47:08 -0800
Date: Wed, 13 Jan 2021 20:43:52 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: initial support to AlderLake-P
In-Reply-To: <6047d856-ac8b-af9e-32a7-3700a74b92d7@linux.intel.com>
Message-ID: <alpine.DEB.2.22.394.2101132037580.864696@eliteleevi.tm.intel.com>
References: <20210113160704.4106353-1-kai.vehmanen@linux.intel.com>
 <s5heeion6zg.wl-tiwai@suse.de>
 <6047d856-ac8b-af9e-32a7-3700a74b92d7@linux.intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, ranjani.sridharan@linux.intel.com,
 lgirdwood@gmail.com, broonie@kernel.org, daniel.baluta@nxp.com
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

Hey,

On Wed, 13 Jan 2021, Pierre-Louis Bossart wrote:

> On 1/13/21 10:20 AM, Takashi Iwai wrote:
> > > +++ b/sound/soc/sof/sof-pci-dev.c
> > > @@ -512,6 +512,8 @@ static const struct pci_device_id sof_pci_ids[] = {
> > >   #if IS_ENABLED(CONFIG_SND_SOC_SOF_ALDERLAKE)
> > >   	{ PCI_DEVICE(0x8086, 0x7ad0),
> > >   		.driver_data = (unsigned long)&adls_desc},
> > > +	{ PCI_DEVICE(0x8086, 0x51c8),
> > > +		.driver_data = (unsigned long)&tgl_desc},
> > 
> > Is it correct?  It's referring to TGL thing and it's not enabled with
> > CONFIG_SND_SOC_SOF_ALDERLAKE.
> 
> Yes that should be CONFIG_SND_SOC_SOF_TIGERLAKE.

ack Takashi, 'tgl_desc' is correct but the #if guards are not correct and 
will result in build fail if you disable just 
CONFIG_SND_SOC_SOF_TIGERLAKE. In SOF CI we of course have all platforms 
enabled (or none), so this is not caught. I'll send a V2 tomorrow (before 
Pierre completes the bigger rework to sof-pci-dev).

> I am starting to think as part of the Kconfig rework we might get rid of this
> granularity. It's not very useful to allow for a single PCI ID to be selected,

Ack, my votes for this :)

Br, Kai
