Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA34F18F499
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Mar 2020 13:30:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 667411616;
	Mon, 23 Mar 2020 13:29:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 667411616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584966622;
	bh=AexYx5wOc1U061eltXUm1TbpFydE45ePZ/s/WCxM2RA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o8zuQhNYqrQw553X7QIw8ElJyHhpQlbGvNV8T2Tv4Dq92Hsjjx0678MZl0GQ+bATY
	 sYMvhKdsDOS+F50iDI5ez+h32ohVBSplsspT2EEAHboEvo7TZLRKUR86haFHLGZPoG
	 2mu7eXj1HYobh2oO4dQZTZr7B3g82tRW583CNC+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FF88F80147;
	Mon, 23 Mar 2020 13:28:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0A65F80158; Mon, 23 Mar 2020 13:28:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1CE9F800B9
 for <alsa-devel@alsa-project.org>; Mon, 23 Mar 2020 13:28:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1CE9F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IkCzc8kP"
Received: from localhost (unknown [122.178.205.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 163262076A;
 Mon, 23 Mar 2020 12:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584966510;
 bh=AexYx5wOc1U061eltXUm1TbpFydE45ePZ/s/WCxM2RA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IkCzc8kP3xbTKjWOGHgTW58ayOwIG6rpOGVwZ/LzBxVOavqRcL+6GE2Mnw6TUk3Dl
 JOS765Ghx8YoEAP2AQ3Pg75nUErlfZzcO+IkMIiqXwX267yNeCRZ2Iige1pkNoP3um
 nenJh5yv5aLPtJqOHMczXQVWvhLbOCfgo7ncwbG4=
Date: Mon, 23 Mar 2020 17:58:26 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 4/7] soundwire: intel: add definitions for shim_mask
Message-ID: <20200323122826.GL72691@vkoul-mobl>
References: <20200311221026.18174-1-pierre-louis.bossart@linux.intel.com>
 <20200311221026.18174-5-pierre-louis.bossart@linux.intel.com>
 <20200320134257.GD4885@vkoul-mobl>
 <deeb3af8-e950-651c-50d6-6223e75801e9@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <deeb3af8-e950-651c-50d6-6223e75801e9@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
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

On 20-03-20, 09:13, Pierre-Louis Bossart wrote:
> 
> > > diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
> > > index 568c84a80d79..cfc83120b8f9 100644
> > > --- a/drivers/soundwire/intel.h
> > > +++ b/drivers/soundwire/intel.h
> > > @@ -16,6 +16,7 @@
> > >    * @ops: Shim callback ops
> > >    * @dev: device implementing hw_params and free callbacks
> > >    * @shim_lock: mutex to handle access to shared SHIM registers
> > > + * @shim_mask: global pointer to check SHIM register initialization
> > >    */
> > >   struct sdw_intel_link_res {
> > >   	struct platform_device *pdev;
> > > @@ -27,6 +28,7 @@ struct sdw_intel_link_res {
> > >   	const struct sdw_intel_ops *ops;
> > >   	struct device *dev;
> > >   	struct mutex *shim_lock; /* protect shared registers */
> > > +	u32 *shim_mask;
> > 
> > You have a pointer, okay where is it initialized
> 
> same answer as shim_lock, it's initialized at the higher level
> 
> https://github.com/thesofproject/linux/blob/9c7487b33072040ab755d32ca173b75151c0160c/drivers/soundwire/intel_init.c#L252

Why can't it be done here, what stops you?

You really need to keep initialzation and usage in same patch :(

-- 
~Vinod
