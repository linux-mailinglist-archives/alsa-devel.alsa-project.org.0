Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85618210381
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 07:58:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17EBC167B;
	Wed,  1 Jul 2020 07:57:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17EBC167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593583126;
	bh=qyAj0nKPFYUi90Eumgd+ayXy3UaN1w3BRIx9nkrkAZQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l0Re0+U4iN+uKsPiqx33+TeOCU1HkAKVEpBTNxi4JqEFsbfeN4IgPTU4UbTLuVnr5
	 5/ENH8ZGhC0aHLIbe+Y3IkcyilyUgReRp9v1EXQWygqiGYgDS/1AM1aAXyDqer1uUc
	 Y44N7wH034dvnxuPsRHYjtJ+8B/+Kc8Zw/VU+EGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28E3AF8020C;
	Wed,  1 Jul 2020 07:57:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDF27F80217; Wed,  1 Jul 2020 07:57:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71D79F800C1
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 07:57:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71D79F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jKDS7Thl"
Received: from localhost (unknown [122.182.251.219])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5082F20747;
 Wed,  1 Jul 2020 05:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593583018;
 bh=qyAj0nKPFYUi90Eumgd+ayXy3UaN1w3BRIx9nkrkAZQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jKDS7ThlTXWAo/SqAgJWHqPz/ggV+FOXBVbgF/Qcksbg3SqE6/+0l7TIu6JQdRh4X
 3Xq1M0ZgBFsx6qTwtO0SMVsA5gFuPeoo1wPqRRzMiE4UykG+6q7BPXzEf+Azts0Tn9
 sx0NxH/PXxKJgzKSGgluF9W5VKwAXjM5+e5AwlOA=
Date: Wed, 1 Jul 2020 11:26:54 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 8/9] soundwire: intel: add wake interrupt support
Message-ID: <20200701055654.GW2599@vkoul-mobl>
References: <20200623173546.21870-1-yung-chuan.liao@linux.intel.com>
 <20200623173546.21870-9-yung-chuan.liao@linux.intel.com>
 <20200630165126.GT2599@vkoul-mobl>
 <a69aa5d0-613a-6ef6-9263-378b1e99770a@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a69aa5d0-613a-6ef6-9263-378b1e99770a@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, mengdong.lin@intel.com, slawomir.blauciak@intel.com,
 sanyog.r.kale@intel.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

On 30-06-20, 12:18, Pierre-Louis Bossart wrote:
> > > +		return 0;
> > > +	}
> > > +
> > > +	shim = sdw->link_res->shim;
> > > +	wake_sts = intel_readw(shim, SDW_SHIM_WAKESTS);
> > > +
> > > +	if (!(wake_sts & BIT(sdw->instance)))
> > > +		return 0;
> > > +
> > > +	/* disable WAKEEN interrupt ASAP to prevent interrupt flood */
> > > +	intel_shim_wake(sdw, false);
> > 
> > when & where is this enabled?
> 
> in follow-up patches where the clock-stop mode is enabled.

ok

> > > +	 * wake up master and slave so that slave can notify master
> > > +	 * the wakeen event and let codec driver check codec status
> > > +	 */
> > > +	list_for_each_entry(slave, &bus->slaves, node) {
> > > +		/*
> > > +		 * discard devices that are defined in ACPI tables but
> > > +		 * not physically present and devices that cannot
> > > +		 * generate wakes
> > > +		 */
> > > +		if (slave->dev_num_sticky && slave->prop.wake_capable)
> > > +			pm_request_resume(&slave->dev);
> > 
> > Hmmm, shouldn't slave do this? would it not make sense to notify the
> > slave thru callback and then slave decides to resume or not..?
> 
> In this mode, the bus is clock-stop mode, and events are detected with level
> detector tied to PCI events. The master and slave devices are all in
> pm_runtime suspended states. The codec cannot make any decisions on its own
> since the bus is stopped, it needs to first resume, which assumes that the
> master resumes first and the enumeration re-done before it can access any of
> its registers.
> 
> By looping through the list of devices that can generate events, you end-up
> first forcing the master to resume, and then each slave resumes and can
> check who generated the event and what happened while suspended. if the
> codec didn't generate the event it will go back to suspended mode after the
> usual timeout.
> 
> We can add a callback but that callback would only be used for Intel
> solutions, but internally it would only do a pm_request_resume() since the
> codec cannot make any decisions before first resuming. In other words, it
> would be an Intel-specific callback that is implemented using generic resume
> operations. It's probably better to keep this in Intel-specific code, no?

I do not like the idea that a device would be woken up, that kind of
defeats the whole idea behind the runtime pm. Waking up a device to
check the events is a generic sdw concept, I don't see that as Intel
specific one.

I would like to see a generic callback for the devices and let devices
do the resume part, that is standard operating principle when we deal
with suspended devices. If the device thinks they need to resume, they
will do the runtime resume, check the status and sleep if not
applicable. Since we have set the parents correctly, any resume
operation for slaves would wake master up as well...

I do not see a need for intel driver to resume slave devices here, or
did I miss something?

-- 
~Vinod
