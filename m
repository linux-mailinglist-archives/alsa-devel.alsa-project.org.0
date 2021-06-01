Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA381397661
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 17:18:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AFF616D1;
	Tue,  1 Jun 2021 17:17:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AFF616D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622560683;
	bh=igOGQk5mppUBT15MKXb8EcO47M9HZt3cWIHf2uB91pw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V0oCQMo3FvjbJRETUqAQIpiQFOummX+VKaFPKgYP2BGqb/F+x+hmFTxNJJ02quBim
	 F8MYI1qBa47P4WJasmssfSyZtgpS/gJRRJuSGwL5pQ4MhJ/zh83o5sDeJ85QkDlf49
	 sVPTMGJmnXhqSpRGM9WRDLDXjjZhjpWbmNgL8NCc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C81AF8025B;
	Tue,  1 Jun 2021 17:16:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 649EEF801DB; Tue,  1 Jun 2021 17:16:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EECDBF801DB
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 17:16:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EECDBF801DB
IronPort-SDR: nPlmraTU8zyWoeOEpAH5dNysUAca7HZE2iFRWPmL/wMmUUU4vrGRz6x818oiMBCfR8GhDtRizy
 WGljSR4eVGQg==
X-IronPort-AV: E=McAfee;i="6200,9189,10002"; a="267440700"
X-IronPort-AV: E=Sophos;i="5.83,240,1616482800"; d="scan'208";a="267440700"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 08:16:17 -0700
IronPort-SDR: HfugIjzz+TuveULpkvJ6K4aNtbCekIzdv/A4On58D9IBGY20HdDP3V9jaiD1w8hQFiodMK/YH4
 1RvDqlhIjBUQ==
X-IronPort-AV: E=Sophos;i="5.83,240,1616482800"; d="scan'208";a="635531307"
Received: from rplucero-mobl2.amr.corp.intel.com (HELO [10.212.39.206])
 ([10.212.39.206])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 08:16:16 -0700
Subject: Re: [PATCH v4] soundwire: intel: move to auxiliary bus
To: Vinod Koul <vkoul@kernel.org>
References: <20210511052132.28150-1-yung-chuan.liao@linux.intel.com>
 <21002781-0b78-3b36-952f-683482a925d7@linux.intel.com>
 <YLS4N2KgzfsMBD1c@vkoul-mobl.Dlink>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b316763b-d219-6ea3-401e-3eb9718aabf3@linux.intel.com>
Date: Tue, 1 Jun 2021 08:56:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YLS4N2KgzfsMBD1c@vkoul-mobl.Dlink>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Leon Romanovsky <leon@kernel.org>,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, hui.wang@canonical.com,
 Jason Gunthorpe <jgg@nvidia.com>, Dave Ertman <david.m.ertman@intel.com>,
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


>> b) Vinod commented:
>>
>> "What I would like to see the end result is that sdw driver for Intel
>> controller here is a simple auxdev device and no additional custom setup
>> layer required... which implies that this handling should be moved into
>> auxdev or Intel code setting up auxdev..."
>>
>> I was unable to figure out what this comment hinted at: the auxbus is
>> already handled in the intel_init.c and intel.c files and the auxbus is used
>> to model a set of links/managers below the PCI device, not the controller
>> itself. There is also no such thing as a simple auxdev device used in the
>> kernel today, the base layer is meant to be extended with domain-specific
>> structures. There is really no point in creating a simple auxbus device
>> without extensions.
> 
> <back from vacations>

same here :-)

> I would like to see that the init_init.c removed completely, that is my
> ask here
> 
> This layer was created by me to aid in creating the platform devices.
> Also the mistake was not to use platform resources and instead pass a
> custom structure for resources (device iomem address, irq etc)

We are 100% aligned on the ask to remove intel_init.c, this layer is 
unnecessary and adds more work for developers/maintainers. We will move 
all this in the SOF driver.

> I would like to see is the PCI/SOF parent driver create the sdw aux
> device and that should be all needed to be done. The aux device would be
> probed by sdw driver. No custom resource structs for resources please.
I was following the previous paragraph but got stuck on the last 
sentence 'no custom structs for resources', see below.

> If that is not possible, I would like to understand technical details of
> why that would be that case. If required necessary changes should be
> made to aux bus to handle and not have sequencing issue which you had
> trouble with platform approach.

I don't know what you are referring to with the 'sequencing issue which 
you had trouble with platform approach'. We never had any technical 
issues with platform devices, the solution works and has been 
productized. We are only doing this iso-functionality transition because 
GregKH asked us to do only use platform devices IF there is a real 
platform device (controlled by DT/ACPI).

I think we are also having language/specification issues here. I don't 
understand what you describe as a 'resource' - there is no interaction 
with firmware - nor how we can avoid being domain-specific for something 
that is Intel-specific.

Let's go back to the code to help the discussion: the auxiliary driver 
which manages a SoundWire link needs to be provided with a 'custom' 
structure that describes basic information provided by the PCI parent 
(link masks, quirks, IO register bases) and contains internal fields 
needed for the link management (mutex, ops, list, etc). This is the 
structure we use:

struct sdw_intel_link_res {
	void __iomem *mmio_base; /* not strictly needed, useful for debug */
	void __iomem *registers;
	void __iomem *shim;
	void __iomem *alh;
	int irq;
	const struct sdw_intel_ops *ops;
	struct device *dev;
	struct mutex *shim_lock; /* protect shared registers */
	u32 *shim_mask;
	u32 clock_stop_quirks;
	u32 link_mask;
	struct sdw_cdns *cdns;
	struct list_head list;
};

We could if it was desired for architectural clarity split this 
structure in what is provided by the parent and what is used inside of 
the auxiliary driver as an internal context that the parent doesn't 
touch, but these definitions are again Intel-specific.

Then both types of information are included in the 'link_dev' extension 
of the auxiliary device.

struct sdw_intel_link_dev {
	struct auxiliary_device auxdev;
	struct sdw_intel_link_res link_res;
};

That's the basic design of the auxiliary bus, domain-specific data 
structures are not added inside of the auxiliary_device but are part of 
an extension accessed with container_of(). That's what everyone using 
the auxiliary bus is doing.

Vinod, if you can elaborate on what 'resources' refer to in your reply 
that would help. We've been using the same approach as others relying on 
the auxiliary bus and I am struggling to see what is wrong with the 
solution we suggested, or what changes to the auxiliary bus core would 
be needed. I don't mind doing something different but I just don't 
understand what the suggestion is.

Thanks!
