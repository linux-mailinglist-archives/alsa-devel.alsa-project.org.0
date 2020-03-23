Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 422F318F519
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Mar 2020 13:56:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF7091655;
	Mon, 23 Mar 2020 13:55:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF7091655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584968188;
	bh=pUVVBotV/ymFMfsonWmwbWJ7zjKKGrfnxqC6V2nQWA8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AP18Yi3t5ZiHhtUE4LvoS6tP/JJhMhTz4IQFyGOMObG2dMteEv6inYUxHj3IC3ELX
	 06An/yTIhxQpjE+ylxuBI+8y9cONCZR5+sXEuR/EVlJ8J/8aB0fEH485El4NRWcQJU
	 rv8IZf5BTA698Bvkk2b1FykXhCSMDjl7hmfokqqA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E89B1F80095;
	Mon, 23 Mar 2020 13:54:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55E04F80158; Mon, 23 Mar 2020 13:54:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D368AF800B9
 for <alsa-devel@alsa-project.org>; Mon, 23 Mar 2020 13:54:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D368AF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="S6w9I3r/"
Received: from localhost (unknown [122.178.205.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2A27E206F9;
 Mon, 23 Mar 2020 12:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584968081;
 bh=pUVVBotV/ymFMfsonWmwbWJ7zjKKGrfnxqC6V2nQWA8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S6w9I3r/FO7A14vzRiCkdy73REFHaWNMXx7GiToMgogTkRYVFVzAhJLrvot6c/1C1
 OVPdY4i3TdvzLFYkCj19x7o6762WJVjFS9R4MUh69LShLOLXXY8Iy6gwSYaDxaAKsT
 oBTzSCNitIarKrgm3cFUkb+SAlF8O/Z/qYaKmzDc=
Date: Mon, 23 Mar 2020 18:24:37 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/5] soundwire: bus_type: add master_device/driver support
Message-ID: <20200323125437.GP72691@vkoul-mobl>
References: <20200320162947.17663-1-pierre-louis.bossart@linux.intel.com>
 <20200320162947.17663-2-pierre-louis.bossart@linux.intel.com>
 <5d78f0f8-7418-e50e-6f0b-dd6988224744@linaro.org>
 <626a074b-06a9-01a0-334f-3aaed1f7ed76@linux.intel.com>
 <286e7ae2-6677-1d92-5ae2-9250d3ff7a9d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <286e7ae2-6677-1d92-5ae2-9250d3ff7a9d@linaro.org>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Hui Wang <hui.wang@canonical.com>,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 jank@cadence.com, slawomir.blauciak@intel.com,
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

On 23-03-20, 11:06, Srinivas Kandagatla wrote:
> 
> 
> On 20/03/2020 18:17, Pierre-Louis Bossart wrote:
> > Thanks for the quick review Srinivas,
> > 
> > > This patch in general is missing device tree support for both
> > > matching and uevent so this will not clearly work for Qualcomm
> > > controller unless we do via platform bus, which does not sound
> > > right!
> > 
> > see other email, the platform bus is handled by a platform
> > device/driver. There was no intention to change that, it's by design
> > rather than an omission/error.
> 
> I understand this partly now!
> 
> This can be probably made better/clear by:
> renaming sdw_master_device_add to sdw_master_alloc and do a
> device_initialize() as part of this function in subsequent call to
> sdw_add_bus_master() we can do a device_add(). Doing this way will avoid a
> bit of unnecessary call to device_unregister by the controller driver, tbh
> which is confusing.
> 
> If the intended call sequence for controller is this (by keeping the parent
> bus type intact):
> 
> sdw_master_alloc/sdw_master_device_add()
> sdw_add_bus_master()

why not have single bus api which does all this :)

> Then we should also remove sdw_unregister_master_driver() and
> module_sdw_master_driver() all together. Having them makes the reader think
> that they can use module_sdw_master_driver directly without any parent bus
> like platform bus in this case.

Precisely, this is one of the reasons for not liking the
sdw_master_driver! It doesnt get used by anyone except Intel.

-- 
~Vinod
