Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E563318F4B1
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Mar 2020 13:33:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A1611614;
	Mon, 23 Mar 2020 13:32:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A1611614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584966812;
	bh=02aNWtfrpU8AgorxptidkUPx6hNK4HuNW/Fa4tvFsTg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o0OV2vqN96VRaOy/RnboYStz4cBvby93aLO8WkP4PGE9+pOv4ItjUgMxAWe0MaG+5
	 UkjoiaSjPewDR1e8AzWNjMnKIp6cQNUaNKQAWYgqTYrMJc8aElD68BrSVgIecBgJ+f
	 +462PDwI0yiUtC7LcmOY0YoHVlJTxMXNiBZo3FRs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A7FCF8015A;
	Mon, 23 Mar 2020 13:31:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D46D2F80158; Mon, 23 Mar 2020 13:31:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31F89F800F6
 for <alsa-devel@alsa-project.org>; Mon, 23 Mar 2020 13:31:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31F89F800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GYmHx08L"
Received: from localhost (unknown [122.178.205.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 35EA02072E;
 Mon, 23 Mar 2020 12:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584966705;
 bh=02aNWtfrpU8AgorxptidkUPx6hNK4HuNW/Fa4tvFsTg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GYmHx08Lp7U+MLooOOIoh4AJzRQMRwIwpBpLNUCy+reyX+OC1te5bEaKKEd484qXv
 lLlmUjKsapyJVRhQ1xF1z8qodvTL7JlXL68xHzx7xdHUVQZ5FhQVPlsXD5r0gRdW82
 kTRzp9/HjbOMNsersRvOOOHErlDTQbmnp+PRyrB0=
Date: Mon, 23 Mar 2020 18:01:40 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 5/7] soundwire: intel: follow documentation sequences for
 SHIM registers
Message-ID: <20200323123140.GM72691@vkoul-mobl>
References: <20200311221026.18174-1-pierre-louis.bossart@linux.intel.com>
 <20200311221026.18174-6-pierre-louis.bossart@linux.intel.com>
 <20200320135145.GE4885@vkoul-mobl>
 <9e280e1b-178a-0ce8-be5b-03532c5507fe@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e280e1b-178a-0ce8-be5b-03532c5507fe@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>, Rander Wang <rander.wang@intel.com>,
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

On 20-03-20, 09:20, Pierre-Louis Bossart wrote:

> > > @@ -283,11 +284,48 @@ static int intel_link_power_up(struct sdw_intel *sdw)
> > >   {
> > >   	unsigned int link_id = sdw->instance;
> > >   	void __iomem *shim = sdw->link_res->shim;
> > > +	u32 *shim_mask = sdw->link_res->shim_mask;
> > 
> > this is a local pointer, so the one defined previously is not used.
> 
> No idea what you are saying, it's the same address so changes to *shim_mask
> will be the same as in *sdw->link_res->shim_mask.

There seems to be too many shim_masks, in global structs, then pointer
and then local ones. It is really confusing...

> > > +	struct sdw_bus *bus = &sdw->cdns.bus;
> > > +	struct sdw_master_prop *prop = &bus->prop;
> > >   	int spa_mask, cpa_mask;
> > > -	int link_control, ret;
> > > +	int link_control;
> > > +	int ret = 0;
> > > +	u32 syncprd;
> > > +	u32 sync_reg;
> > >   	mutex_lock(sdw->link_res->shim_lock);
> > > +	/*
> > > +	 * The hardware relies on an internal counter,
> > > +	 * typically 4kHz, to generate the SoundWire SSP -
> > > +	 * which defines a 'safe' synchronization point
> > > +	 * between commands and audio transport and allows for
> > > +	 * multi link synchronization. The SYNCPRD value is
> > > +	 * only dependent on the oscillator clock provided to
> > > +	 * the IP, so adjust based on _DSD properties reported
> > > +	 * in DSDT tables. The values reported are based on
> > > +	 * either 24MHz (CNL/CML) or 38.4 MHz (ICL/TGL+).
> > 
> > Sorry this looks quite bad to read, we have 80 chars, so please use
> > like below:
> > 
> > 	/*
> >           * The hardware relies on an internal counter, typically 4kHz,
> >           * to generate the SoundWire SSP - which defines a 'safe'
> >           * synchronization point between commands and audio transport
> >           * and allows for multi link synchronization. The SYNCPRD value
> >           * is only dependent on the oscillator clock provided to
> >           * the IP, so adjust based on _DSD properties reported in DSDT
> >           * tables. The values reported are based on either 24MHz
> >           * (CNL/CML) or 38.4 MHz (ICL/TGL+).
> > 	 */
> 
> Are we really going to have an emacs vs vi discussion here?

What has that got to do with editor to use, nothing imo.

All I am asking is to use 80 chars here and make it look decent to
read. And not truncate at 60 ish chars which seems above

-- 
~Vinod
