Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8996218F45E
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Mar 2020 13:20:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DEFE1657;
	Mon, 23 Mar 2020 13:19:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DEFE1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584966011;
	bh=hxcrz2tO+N8anTbgxKJo/lWuzhD01NFnXAyUAjiHza4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vuNRVnGq9YvAINKR7iI+b00QlJWtJk9VH3SsrSzk0fH2yS5fx8nY2ltS2zDuDTQTY
	 B9j7cpjwdU2p9Zy1J0lL/bcMcyUVIOo2SWjf6C+wcRg6mE8Ys9nGB3+JQ90OcIHoFm
	 qjAiGMFElNN/BH17stfdol3hzjUraSZGHzi4d/kE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AE56F8015A;
	Mon, 23 Mar 2020 13:18:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE0EFF80158; Mon, 23 Mar 2020 13:18:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10043F800F6
 for <alsa-devel@alsa-project.org>; Mon, 23 Mar 2020 13:18:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10043F800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PI/1uCxo"
Received: from localhost (unknown [122.178.205.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E63E520788;
 Mon, 23 Mar 2020 12:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584965901;
 bh=hxcrz2tO+N8anTbgxKJo/lWuzhD01NFnXAyUAjiHza4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PI/1uCxozIzKRx7vhHJPe0CsTSpO3XsKw9Sgd+LFaJn3Ln0JiFczyNebpU4XmLahd
 9k2Jsj9Y9e6Vi6VVRWE8rmYkHk7u/wYVR2cGXT9q7MejalmAbv5lilBEiRO4MKJcu9
 rTiJ3RLUkcFlToDqkbg1zA0SKTiB/OAXgLwUGy1Q=
Date: Mon, 23 Mar 2020 17:48:17 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 3/7] soundwire: intel: add mutex to prevent concurrent
 access to SHIM registers
Message-ID: <20200323121817.GK72691@vkoul-mobl>
References: <20200311221026.18174-1-pierre-louis.bossart@linux.intel.com>
 <20200311221026.18174-4-pierre-louis.bossart@linux.intel.com>
 <20200320134112.GC4885@vkoul-mobl>
 <a989368c-5a57-a726-0816-2e389d733ae0@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a989368c-5a57-a726-0816-2e389d733ae0@linux.intel.com>
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

On 20-03-20, 09:07, Pierre-Louis Bossart wrote:
> 
> > > diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
> > > index 38b7c125fb10..568c84a80d79 100644
> > > --- a/drivers/soundwire/intel.h
> > > +++ b/drivers/soundwire/intel.h
> > > @@ -15,6 +15,7 @@
> > >    * @irq: Interrupt line
> > >    * @ops: Shim callback ops
> > >    * @dev: device implementing hw_params and free callbacks
> > > + * @shim_lock: mutex to handle access to shared SHIM registers
> > >    */
> > >   struct sdw_intel_link_res {
> > >   	struct platform_device *pdev;
> > > @@ -25,6 +26,7 @@ struct sdw_intel_link_res {
> > >   	int irq;
> > >   	const struct sdw_intel_ops *ops;
> > >   	struct device *dev;
> > > +	struct mutex *shim_lock; /* protect shared registers */
> > 
> > Where is this mutex initialized? Did you test this...
> 
> Dude, we've been testing the heck out of SoundWire.
> 
> If you want to see the actual initialization it's in the intel_init.c code:
> 
> https://github.com/thesofproject/linux/blob/9c7487b33072040ab755d32ca173b75151c0160c/drivers/soundwire/intel_init.c#L231

Which doesn't make much sense. A patch should do complete thing. I don't
see a reason why you cannot pull this single line into this patch.

It belongs here, not anywhere else.

-- 
~Vinod
