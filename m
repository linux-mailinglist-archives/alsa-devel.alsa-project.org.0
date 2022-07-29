Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D463585386
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 18:36:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0AC99F6;
	Fri, 29 Jul 2022 18:36:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0AC99F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659112618;
	bh=La2xENc04xNZ++CRjJjr81vraFM/tBTfKc0zkbxL07E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JMwzRv2cgF2mXzYnjh0KUB81bkIfGYAcFfqf7si+UPBBBWFNJQcB+wIvWa/gS73D7
	 hExEM94RwFUXURNF4JXgiLlb2hVqTVeE8PFOpBrdOPtOCjxm5vqOA4wYnzezCEahZx
	 kU+nM5Zna9YeVx5UQplgyUWWPsyhxGclOorPyPYg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2A67F804B1;
	Fri, 29 Jul 2022 18:35:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9232F8049C; Fri, 29 Jul 2022 18:35:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6009F800BD
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 18:35:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6009F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="Ai+TTWjm"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B249861DDC;
 Fri, 29 Jul 2022 16:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D7CC433B5;
 Fri, 29 Jul 2022 16:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1659112549;
 bh=La2xENc04xNZ++CRjJjr81vraFM/tBTfKc0zkbxL07E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ai+TTWjmeaNevgg3tHuabKwJ/OUSPJeCf8KNC5FCR6S8p06ebHufJO7NlYqR5265M
 PJP0gKQsstwJcGiKpB9lVRRPlVnK4K7NHV+R67+kUus9Qk5pU91pq7Jcc6LxJbudru
 QtM957VOIZjIYsFu+h712QYiBdXv7S2XtaNbD3gs=
Date: Fri, 29 Jul 2022 18:35:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 2/5] soundwire: sysfs: cleanup the logic for creating the
 dp0 sysfs attributes
Message-ID: <YuQMYRYFo9gTk1yL@kroah.com>
References: <20220729135041.2285908-1-gregkh@linuxfoundation.org>
 <20220729135041.2285908-2-gregkh@linuxfoundation.org>
 <9365e038-2146-98f8-f989-02827f221c34@linux.intel.com>
 <YuP0Ffs3G7ZBR0AC@kroah.com>
 <cfacb124-a9ff-0a93-8f92-93d164b15966@linux.intel.com>
 <YuP2pjhyKTTfpXQq@kroah.com>
 <5caffe2a-f5a6-e312-a564-5fe29c4e2323@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5caffe2a-f5a6-e312-a564-5fe29c4e2323@linux.intel.com>
Cc: Vinod Koul <vkoul@kernel.org>, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org,
 Sanyog Kale <sanyog.r.kale@intel.com>
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

On Fri, Jul 29, 2022 at 10:52:28AM -0500, Pierre-Louis Bossart wrote:
> 
> >>>>> diff --git a/drivers/soundwire/sysfs_slave.c b/drivers/soundwire/sysfs_slave.c
> >>>>> index 83e3f6cc3250..3723333a5c2b 100644
> >>>>> --- a/drivers/soundwire/sysfs_slave.c
> >>>>> +++ b/drivers/soundwire/sysfs_slave.c
> >>>>> @@ -174,6 +174,16 @@ static ssize_t words_show(struct device *dev,
> >>>>>  }
> >>>>>  static DEVICE_ATTR_RO(words);
> >>>>>  
> >>>>> +static umode_t dp0_is_visible(struct kobject *kobj, struct attribute *attr,
> >>>>> +			      int n)
> >>>>> +{
> >>>>> +	struct sdw_slave *slave = dev_to_sdw_dev(kobj_to_dev(kobj));
> >>>>> +
> >>>>> +	if (slave->prop.dp0_prop)
> >>>>> +		return attr->mode;
> >>>>> +	return 0;
> >>>>> +}
> >>>>
> >>>> This changes the results slightly by creating an empty 'dp0' directory
> >>>> with no attributes inside.
> >>>>
> >>>> Before:
> >>>>
> >>>> [root@fedora ~]# cd /sys/bus/soundwire/devices/sdw:3:025d:0714:01
> >>>> [root@fedora sdw:3:025d:0714:01]# ls dp0
> >>>> ls: cannot access 'dp0': No such file or directory
> >>>>
> >>>> After:
> >>>> [root@fedora sdw:3:025d:0714:01]# ls dp0
> >>>
> >>> That should be fine, tools should just be looking for the attributes,
> >>> not the existance of a directory, right?
> >>
> >> The idea what that we would only expose ports that actually exist.
> >> That's helpful information anyone with a basic knowledge of the
> >> SoundWire specification would understand.
> > 
> > Is "dp0" a port?  If so, why isn't it a real device?
> 
> The SoundWire spec defines the concept of 'data port'. The valid ranges
> are 1..14, but in all existing devices the number of data ports is way
> smaller, typically 2 to 4. Data ports (DPn) are source or sink, and
> there's no firm rule that data ports needs to be contiguous.
> 
> DP0 is a 'special case' where the data transport is used for control
> information, e.g. programming large set of registers or firmware
> download. DP0 is completely optional in hardware, and not handled in
> Linux for now.
> 
> DP0 and DPn expose low-level transport registers, which define how the
> contents of a FIFO will be written or read from the bus. Think of it as
> a generalization of the concept of TDM slots, where instead of having a
> fixed slot per frame the slot position/repetition/runlength can be
> programmed.
> 
> The data ports could be as simple as 1-bit PDM, or support 8ch PCM
> 24-bits. That's the sort of information reported in attributes.

Why not make them a real device like we do for USB endpoints?

What uses these sysfs files today that would be confused about an empty
directory?

thanks,

greg k-h
