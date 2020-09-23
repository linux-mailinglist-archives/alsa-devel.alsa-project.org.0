Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5044B275510
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Sep 2020 12:05:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4A221744;
	Wed, 23 Sep 2020 12:04:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4A221744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600855524;
	bh=I29Xl8k+Bs96gykSP06lTZc5yD1e8TkqFpVlouluGdE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TMQxGvUBylXBJ0D3cbEcSSk8ncbIcjgRFEziPydMa2C1fq23/c7ssjwSJkoPBKRAE
	 miaYB/8KDEdCk8vEjBc9ZO7yi1FpFzV3uS2ISpctnGYhh/9UHAImfUtVtvTXi3bcbZ
	 4p6v63UTqMxSkumr4wI3p0KbLHMkmvFRFh7vUyKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1E53F801EB;
	Wed, 23 Sep 2020 12:03:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F41CF80171; Wed, 23 Sep 2020 12:03:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F40A1F8015F
 for <alsa-devel@alsa-project.org>; Wed, 23 Sep 2020 12:03:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F40A1F8015F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="p5whX9Yd"
Received: from localhost (unknown [122.171.175.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F310E2076E;
 Wed, 23 Sep 2020 10:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600855412;
 bh=I29Xl8k+Bs96gykSP06lTZc5yD1e8TkqFpVlouluGdE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p5whX9YdUW9aDIv/53jkSkxKXFYe/Ukfa4XHO8gyeN7B6eGSw2390scZb/UEYjyUM
 +bGg/4Pab/Skn0tF4xPAALRMcr3Agarz++sq8RGo6lEFOnkexPnoiRV5Vmh5PXd9lh
 sI95CdMDf1tPCiOHDISOf0eQ1GwamvrwGkwrvUWs=
Date: Wed, 23 Sep 2020 15:33:27 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 2/2] soundwire: sysfs: add slave status and device
 number before probe
Message-ID: <20200923100327.GF2968@vkoul-mobl>
References: <20200917160007.153106-1-pierre-louis.bossart@linux.intel.com>
 <20200917160007.153106-3-pierre-louis.bossart@linux.intel.com>
 <20200918121614.GS2968@vkoul-mobl>
 <c8729c1d-6d36-ad34-34c3-899ba0f5366d@linux.intel.com>
 <20200919111911.GW2968@vkoul-mobl>
 <2ef2e1e8-d7cc-a08f-4176-240750d640a5@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ef2e1e8-d7cc-a08f-4176-240750d640a5@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

On 21-09-20, 09:34, Pierre-Louis Bossart wrote:
> 
> 
> On 9/19/20 6:19 AM, Vinod Koul wrote:
> > On 18-09-20, 09:21, Pierre-Louis Bossart wrote:
> > > 
> > > 
> > > 
> > > > >     * Base file is device
> > > > >     *	|---- modalias
> > > > > + *	|---- dev-status
> > > > > + *		|---- status
> > > > > + *		|---- device_number
> > > > 
> > > > Any reason why we want this under dev-status.
> > > > 
> > > > Both the status and device_number belong to the device, so we can
> > > > put them under device and use device properties
> > > 
> > > We already use directories for device-level and port-level properties, I
> > > just thought it be cleaner to continue this model. We might also expand the
> > > information later on, e.g. provide interrupt status.
> > 
> > Right now we have directories for N ports (needs a dir due to nature of
> > N ports) and 'properties' derived from Disco/firmware.
> > So Nport and properties makes sense. But for generic device level stuff
> > like device number, status and future interrupt or anything should be at
> > device level.
> > 
> > > I don't mind if we remove the directory and move everything up one level,
> > > but it wouldn't be consistent with the previous work.
> > 
> > Just because we had directory for a reason, adding a directory to
> > conform to that does make it better. IMO device files should be at
> > device directory
> 
> We have a "dev-properties" directory, which is added after the driver probe,
> and describes MIPI DisCo values at the device level.

Quite right and the reason to add this after driver probe is to let
driver update the values (hard coded or read from firmware etc)

There is a set of properties which tells us the group of properties
which are coming from MIPI DisCo, so IMO they do belong to a directory

> Either we remove this dev-properties and move it to the device level - to be

It is sysfs ABI it can't be moved, not that I agree with that

> consistent with your recommendation - or we keep separate directories, one
> which is populated on device registration and the other on driver probe.

This is device properties so should not really be a directory!

For example on linux devices we have bunch of files and one specific
directory for power. Here too I would like to see bunch of files and
directory for dp-N and mipi ones

-- 
~Vinod
