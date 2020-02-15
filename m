Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7416A15FBA4
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Feb 2020 01:45:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE2241672;
	Sat, 15 Feb 2020 01:44:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE2241672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581727516;
	bh=JTIFT1d3FbFZa+kVQzYVJyeBnIEuFgbzXLTm2tmdlts=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rMHAzrn3pNDAuQSi8IzY8VMU+8hudWfAr2SlUpS+BMhPRleU/fb+ssLXm0k0d2cas
	 q5no0/uOrBfqeXM9fI7mdohQIhBEvuEhbun7FHMpMOAJktRM1vDIBAAcoBct8bzYNj
	 FfVYGWilpwBgD7T9HFjkP7lO1IOqr1AnidkdtmDY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA945F80157;
	Sat, 15 Feb 2020 01:43:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 673A8F8014F; Sat, 15 Feb 2020 01:43:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D248F80138
 for <alsa-devel@alsa-project.org>; Sat, 15 Feb 2020 01:43:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D248F80138
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bbec4k4Q"
Received: from localhost (unknown [38.98.37.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BBBE2206CC;
 Sat, 15 Feb 2020 00:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581727406;
 bh=n6C+XIf/lyMg45xZwpa1Z0/jdjqPoKgJmPJKvllOVUA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bbec4k4QJ+/R5/1/51+pxAbRNaT7gXuJc2Z6YvAWwm9f/+Z8khItpYP1e09K0+7WG
 tOQ7oLR+uWzZY3zIqswcVkQU29KAvHTlAKk6ywep8desuYFROSRafpujca5Y4IfnPb
 5TNF5zZIMkU9txujwR7X+f2yRlc9+gdEBVRQzPYQ=
Date: Fri, 14 Feb 2020 19:05:00 -0500
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20200215000500.GB5524@kroah.com>
References: <20200201042011.5781-1-pierre-louis.bossart@linux.intel.com>
 <20200214164919.GB4016987@kroah.com>
 <0ec41a5b-6132-6940-f1b3-bac1724b70a4@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0ec41a5b-6132-6940-f1b3-bac1724b70a4@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 0/2] soundwire: add
 master_device/driver support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Feb 14, 2020 at 05:34:40PM -0600, Pierre-Louis Bossart wrote:
> 
> My preference in terms of integration in drivers/soundwire would be
> 
> 1. Intel DAI cleanup (only one kfree missing, will resubmit v3 today)
> 
> 2. [PATCH 00/10] soundwire: bus: fix race conditions, add suspend-resume
> this series solves a lot of issues and should go first.
> 
> 3. ASoC/SOF integration (still with platform devices)
> I narrowed this down to 6 patches, that would help me submit the rest of the
> ASoC/SOF patches in Mark Brown's tree. That would be Intel specific. This
> step would be the first where everything SoundWire-related can be enabled in
> a build, and while we've caught a lot of cross-compilation issues it's
> likely some bots will find corner cases to keep us busy.
> 
> 4. master_device/driver transition: these updated patches removing platform
> devices + sysfs support + Qualcomm support (the last point would depend on
> the workload/support of Qualcomm/Linaro folks, I don't want to commit on
> their behalf).
> 
> 5. New SoundWire functionality for Intel platforms (clock-stop/restart and
> synchronized links). The code would be only located in drivers/soundwire and
> be easier to handle. For the synchronized links we still have a bit of
> validation work to do so it should really come last.
> 
> Would this work for everyone?

Sounds reasonable to me, but patches would show it best to see if there
are any issues :)

thanks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
