Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7CE1BEF7D
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 06:59:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E92E7168E;
	Thu, 30 Apr 2020 06:58:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E92E7168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588222741;
	bh=yoriY86hMfyLChk7+O8Pq9vQXhmNjQfWOXeoqFqvspU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m6dnaZk8v/rhZdJSzC0Atjh0ryBa3nUk128ty1t12z1ieeqG0RniRf59YveMkfE/O
	 1II3ElT32P2y6bNuR0dJ7LnYaolE5vlIAZhf+pQNNeNcnWqAeolm/ZJZ1PnDs00+TB
	 AS8bGMDqIPrfJ9lwwRTYDkcz0l2iEzmW7pC+aShg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED5B3F801EB;
	Thu, 30 Apr 2020 06:57:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD0EBF801DB; Thu, 30 Apr 2020 06:57:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41B18F80123
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 06:57:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41B18F80123
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ysa2ipNS"
Received: from localhost (unknown [122.182.217.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3CB1D2073E;
 Thu, 30 Apr 2020 04:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588222630;
 bh=yoriY86hMfyLChk7+O8Pq9vQXhmNjQfWOXeoqFqvspU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ysa2ipNSLD4vWzkghDmrZ0BEfgg4itAl/PLwwvcGuNQeGKTkDgyffoTNme0uNgoQp
 oFApdhT2vDyJnrJYykiGPy53vZyVxVhHjv4oiIwcCwhNUrmW+uNJSSCLZuzwRtdO9t
 LHmcDYhuT4iuSybZ0GxkLPMVE7KrVb/I62rJP7mI=
Date: Thu, 30 Apr 2020 10:27:01 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [RFC 1/5] soundwire: bus_type: add sdw_master_device support
Message-ID: <20200430045701.GC948789@vkoul-mobl.Dlink>
References: <20200416205524.2043-1-yung-chuan.liao@linux.intel.com>
 <20200416205524.2043-2-yung-chuan.liao@linux.intel.com>
 <20200420072631.GW72691@vkoul-mobl>
 <20200423142451.GA4181720@kroah.com>
 <20200428043144.GU56386@vkoul-mobl.Dlink>
 <20200428063736.GB990431@kroah.com>
 <20200428064951.GA56386@vkoul-mobl.Dlink>
 <20200428065524.GA992087@kroah.com>
 <20200428075145.GB56386@vkoul-mobl.Dlink>
 <4ecfa01e-4ef4-5368-3a70-2bd57407d2ad@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ecfa01e-4ef4-5368-3a70-2bd57407d2ad@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Greg KH <gregkh@linuxfoundation.org>, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, ranjani.sridharan@linux.intel.com,
 jank@cadence.com, mengdong.lin@intel.com, slawomir.blauciak@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com
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

On 30-04-20, 11:24, Bard liao wrote:
> 
> On 4/28/2020 3:51 PM, Vinod Koul wrote:
> > On 28-04-20, 08:55, Greg KH wrote:
> > > On Tue, Apr 28, 2020 at 12:19:51PM +0530, Vinod Koul wrote:
> > > > On 28-04-20, 08:37, Greg KH wrote:
> > > > > On Tue, Apr 28, 2020 at 10:01:44AM +0530, Vinod Koul wrote:
> > > > > > > > That is not true for everyone, it is only true for Intel, pls call that
> > > > > > > > out as well...
> > > > > > > Why is it not true for everyone?  How else do you get the pm stuff back
> > > > > > > to your hardware?
> > > > > > The rest of the world would do using the real controller device. For
> > > > > > example the soundwire controller on Qualcomm devices is enumerated as a
> > > > > > DT device and is using these...
> > > > > > 
> > > > > > If Intel had a standalone controller or enumerated as individual
> > > > > > functions, it would have been a PCI device and would manage as such
> > > > > If it is not a standalone controller, what exactly is it?  I thought it
> > > > > was an acpi device, am I mistaken?
> > > > > 
> > > > > What is the device that the proper soundwire controller driver binds to
> > > > > on an Intel-based system?
> > > > The HDA controller which is a PCI device. The device represent HDA
> > > > function, DSP and Soundwire controller instances (yes it is typically
> > > > more than one instance)
> > > Then those "instances" should be split up into individual devices that a
> > > driver can bind to.  See the work happening on the "virtual" bus for
> > > examples of how that can be done.
> > Yes removing platform devices is the goal for Intel now :) Pierre & Bard
> > have been diligently trying to solve this.
> > 
> > Only difference is the means to end goal. I am not convinced that this
> > should be in soundwire subsystem.
> > 
> > Looks like folks are trying to review and port to use this bus. Makes
> > sense to me..
> > https://lore.kernel.org/netdev/c5197d2f-3840-d304-6b09-d334cae81294@linux.intel.com/
> > 
> > > A platform device better not be being used here, I'm afraid to look at
> > > the code now...
> > Well if the plan for 'virtual-bus' goes well, it should be  a simple
> > replacement of platform->virtual for Intel driver. Rest of the driver
> > should not be impacted :)
> 
> We can't expect when will 'virtual-bus' be upstream and it's not feasible
> to wait forever. Can we move forward with current solution and switch to
> 'virtual-bus' whenever it is upstream?

the move from platform-device to virtual-device should happen once
the virtual-bus' is accepted upstream. till then imo you should continue
with current platform device and once you have virtual-bus upstream,
replace it with virtual-device. Note: I am going to hold you on that :)

Rest of the pieces like sdw_master_device and sysfs parts are not
dependent upon this and should be sent for review and we can merge when
ready, hopefully for 5.8.

Thanks
-- 
~Vinod
