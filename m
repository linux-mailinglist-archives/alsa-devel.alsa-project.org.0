Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1D122041E
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 06:52:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 061361661;
	Wed, 15 Jul 2020 06:51:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 061361661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594788727;
	bh=kEf6MQF2Y5n0rlWzjJYfrClkHjV3lWYZo3i24jQ9xzA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I7lZSgpbjYFDH5vr59Gd1vKOhWCrIFI/6eV8cixiGsua5935JWhoilYI8aUXrcEtZ
	 seHaexFZzYQMbGtQWIM+E3Uip97dmAxTUqGFyakkR4Mpie/tnpVQ5cJfh1BUiuaimo
	 Z8iPaEwBgWVitX50yMkLIVR8ZMedaPA+y/GmbjfE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4ED4F80227;
	Wed, 15 Jul 2020 06:50:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9ACE8F8021D; Wed, 15 Jul 2020 06:50:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C62CCF80113
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 06:50:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C62CCF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fFk8RG3e"
Received: from localhost (unknown [122.171.202.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 49D75206E9;
 Wed, 15 Jul 2020 04:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594788616;
 bh=kEf6MQF2Y5n0rlWzjJYfrClkHjV3lWYZo3i24jQ9xzA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fFk8RG3eedKn16raycefkeAXPpU4XusiL5s+Mnfe3o4RwZM8m99jMOTXJfY2MrUbw
 m1/kNSp08xdW/LkY6tSuGPgPfAT7VjlcnXR8LT+yOhxc46IbYMzKE+x3zpQ6pJLi1c
 u+B5slyjcE0mpbM3/xzYEPKMwBBzB2zPBJbYSHfk=
Date: Wed, 15 Jul 2020 10:20:11 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 8/9] soundwire: intel: add wake interrupt support
Message-ID: <20200715045011.GO34333@vkoul-mobl>
References: <20200623173546.21870-1-yung-chuan.liao@linux.intel.com>
 <20200623173546.21870-9-yung-chuan.liao@linux.intel.com>
 <20200630165126.GT2599@vkoul-mobl>
 <a69aa5d0-613a-6ef6-9263-378b1e99770a@linux.intel.com>
 <20200701055654.GW2599@vkoul-mobl>
 <81a33798-0667-9a4f-9916-eb157ad5514d@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81a33798-0667-9a4f-9916-eb157ad5514d@linux.intel.com>
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

On 01-07-20, 10:25, Pierre-Louis Bossart wrote:
> 
> > > > > +	 * wake up master and slave so that slave can notify master
> > > > > +	 * the wakeen event and let codec driver check codec status
> > > > > +	 */
> > > > > +	list_for_each_entry(slave, &bus->slaves, node) {
> > > > > +		/*
> > > > > +		 * discard devices that are defined in ACPI tables but
> > > > > +		 * not physically present and devices that cannot
> > > > > +		 * generate wakes
> > > > > +		 */
> > > > > +		if (slave->dev_num_sticky && slave->prop.wake_capable)
> > > > > +			pm_request_resume(&slave->dev);
> > > > 
> > > > Hmmm, shouldn't slave do this? would it not make sense to notify the
> > > > slave thru callback and then slave decides to resume or not..?
> > > 
> > > In this mode, the bus is clock-stop mode, and events are detected with level
> > > detector tied to PCI events. The master and slave devices are all in
> > > pm_runtime suspended states. The codec cannot make any decisions on its own
> > > since the bus is stopped, it needs to first resume, which assumes that the
> > > master resumes first and the enumeration re-done before it can access any of
> > > its registers.
> > > 
> > > By looping through the list of devices that can generate events, you end-up
> > > first forcing the master to resume, and then each slave resumes and can
> > > check who generated the event and what happened while suspended. if the
> > > codec didn't generate the event it will go back to suspended mode after the
> > > usual timeout.
> > > 
> > > We can add a callback but that callback would only be used for Intel
> > > solutions, but internally it would only do a pm_request_resume() since the
> > > codec cannot make any decisions before first resuming. In other words, it
> > > would be an Intel-specific callback that is implemented using generic resume
> > > operations. It's probably better to keep this in Intel-specific code, no?
> > 
> > I do not like the idea that a device would be woken up, that kind of
> > defeats the whole idea behind the runtime pm. Waking up a device to
> > check the events is a generic sdw concept, I don't see that as Intel
> > specific one.
> 
> In this case, this in an Intel-specific mode that's beyond what MIPI
> defined. This is not the traditional in-band SoundWire wake defined in the
> SoundWire specification. The bus is completely down, the master IP is
> powered-off and all context lost. There is still the ability for a Slave
> device to throw a wake as defined by MIPI in clock-stop-mode1, but this is
> handled with a separate level detector and the wake detection is handled by
> the PCI subsystem. On a wake, the master IP needs to be powered-up, the
> entire bus needs to be restarted and the Slave devices re-enumerated.

Right and I would expect that Slave device would do runtime_get_sync()
first thing in the callback. That would ensure that the Master is
powered up, Slave is powered up, all enumeration is complete. This is
more standard way to deal with this, we expect devices to be so we
low powered or off so cannot do read/write unless we resume.

> We trigger that sequence with a loop that calls pm_request_resume() for all
> Slave devices that are present and exposed in their properties that they are
> wake-capable. As you rightly said in your comments, this will result a nice
> wake-up handled by the pm_runtime framework in the right sequence (DSP
> first, then SoundWire master then Slave devices).
> 
> You will see in follow-up patches that the master IP can be configured in
> different clock stop modes, depending on the needs (power/latency compromise
> typically). When the more traditional SoundWire wake is used, we do not use
> this sequence at all.

The point which is not clear to me if why do we need a specific
sequence. Above sequence should work for you, if not I would like to
understand why.

> > I would like to see a generic callback for the devices and let devices
> > do the resume part, that is standard operating principle when we deal
> > with suspended devices. If the device thinks they need to resume, they
> > will do the runtime resume, check the status and sleep if not
> > applicable. Since we have set the parents correctly, any resume
> > operation for slaves would wake master up as well...
> > 
> > I do not see a need for intel driver to resume slave devices here, or
> > did I miss something?
> 
> Yes, the part "If the device thinks they need to resume" is not quite right.
> The Slave device cannot access its registers before fully resuming, which in
> this case means a re-enumeration, so cannot "think" or make a decision on
> its own. That's the reason why we force them to resume, since it's the first
> step they would need to do anyways, and then if they don't have anything to
> do they go back to idle after a timeout. I invite you to see the
> suspend/resume sequences in codec drivers where you will see regmap access
> moves to cache-only on suspend and full access restored on resume, along
> with a hardware sync.
> 
> I see your point and I really think we are talking about a similar sequence,
> but we simplified your idea since there's no possibility of making a
> decision before Slave devices resume.

If we are worried about Slave device remembering then we should save
state in device context. But i think that slave should *always* perform
runtime resume as a first step in the callback before they would do any
bus/device ops. After all, the callback is wake from low power state

> The only optimization we did here is that we only resume Slave devices than
> can generate a wake, and filter out the 'ghost' devices that are described
> in ACPI tables but don't physically exist.
> 
> Does this help?
> 

-- 
~Vinod
