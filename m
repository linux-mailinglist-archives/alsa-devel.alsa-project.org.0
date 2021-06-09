Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D838C3A1A6D
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jun 2021 18:04:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B63416C1;
	Wed,  9 Jun 2021 18:03:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B63416C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623254666;
	bh=cj7kcYxe0UYEmH6jRzQ4cY6YPrHG9K/H0UpXeNsVuhA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tRN7Kmp2QcVtCV8RrufqmAPpr/jijf1hqf4qayvDFJUnnEk+dm+BQWQX5pzYTgPY1
	 smyqfhgCZXAFaT2SxN/ZrHmUY+CzHATOWLZ0IKTL3OHXuNxTIWZPmA49dyXvQ3fcG1
	 FL4+q/vzKCA81Un/GkYBoeC437WTMhsQg8aERQRM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D256BF80212;
	Wed,  9 Jun 2021 18:02:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC778F8026C; Wed,  9 Jun 2021 18:02:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD80CF80116
 for <alsa-devel@alsa-project.org>; Wed,  9 Jun 2021 18:02:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD80CF80116
IronPort-SDR: u3WUQsQf1/DkgFRmKAftho7xy9xPtesibzMNR4ay5Qi0xXEx8/BISilJEijDyTsd/fQyjnvozz
 1/9YtwDAfd/A==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="205065110"
X-IronPort-AV: E=Sophos;i="5.83,261,1616482800"; d="scan'208";a="205065110"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 09:00:44 -0700
IronPort-SDR: nDTNVHA/qQCLHFA9rd7orNM3Rsp8rwRrTbxF8uBuz2eCosRkhbvl0XJMQKuDameZn3zktTPDpt
 +Ekcuda2NmDg==
X-IronPort-AV: E=Sophos;i="5.83,261,1616482800"; d="scan'208";a="402486252"
Received: from adrianam-mobl.amr.corp.intel.com (HELO [10.209.130.43])
 ([10.209.130.43])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 09:00:42 -0700
Subject: Re: [PATCH v4] soundwire: intel: move to auxiliary bus
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20210511052132.28150-1-yung-chuan.liao@linux.intel.com>
 <21002781-0b78-3b36-952f-683482a925d7@linux.intel.com>
 <YLS4N2KgzfsMBD1c@vkoul-mobl.Dlink>
 <b316763b-d219-6ea3-401e-3eb9718aabf3@linux.intel.com>
 <YMBHj6PBzeHexXJb@vkoul-mobl>
 <07dbe0a2-0abb-810b-ef39-b83511d3f3e0@linux.intel.com>
 <20210609151022.GF1002214@nvidia.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <34cc0671-96a3-95e6-a3e3-3ebfacb4d370@linux.intel.com>
Date: Wed, 9 Jun 2021 11:00:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210609151022.GF1002214@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Leon Romanovsky <leon@kernel.org>,
 gregkh@linuxfoundation.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 linux-kernel@vger.kernel.org, hui.wang@canonical.com,
 Vinod Koul <vkoul@kernel.org>, Dave Ertman <david.m.ertman@intel.com>,
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



>> The consensus for the auxiliary_device model was hard to reach, and the
>> agreement was to align on a minimal model. If you disagree with the
>> directions, you will have to convince Nvidia/Mellanox and Intel networking
>> folks who contributed the solution to do something different.
> 
> The purpose of the aux devices was primarily to bind a *software*
> interface between two parts of the kernel.

The auxiliary bus documentation states clearly that we wanted to 
partition the functionality of a specific hardware into separate parts 
that are not exposed through ACPI/DT.

See excerpts from 
https://www.kernel.org/doc/html/latest/driver-api/auxiliary_bus.html

"In some subsystems, the functionality of the core device 
(PCI/ACPI/other) is too complex for a single device to be managed by a 
monolithic driver (e.g. Sound Open Firmware)" <- that's us.

This is the case for our audio controller, which exposes 4 SoundWire 
links. Since the links can be individually power-managed, creating 4 
subdevices below the PCI parent is a natural design.

"An example for this kind of requirement is the audio subsystem where a 
single IP is handling multiple entities such as HDMI, Soundwire, local 
devices such as mics/speakers etc:" <- that's also us

Péter Ujfalusi is working on this part to split the DSP capabilities and 
let different 'clients' control them. That's a different case where we 
partition 'firmware' capabilities, not hardware as in the case of SoundWire.

> If there is a strong defined HW boundary and no software interface
> then the mfd subsytem may be a better choice.

That objection has been made before, there were lengthy threads on this 
between GregKH, Mark Brown and others. Clearly if we go back to this 
kind of debates I will respectfully stick to platform devices until 
maintainers agree.

This is beyond my area of expertise, outside of my control, and I've 
spent enough time trying to move away from platform devices - we've been 
at it for 2 years.

The auxiliary bus as suggested in this patch works fine. We don't have 
any needs that are not handled by the auxiliary bus code as of today, 
and we are not planning any future extensions.

> For a software layer I expect to see some 'handle' and then a set of
> APIs to work within that. It is OK if that 'handle' refers to some HW
> resources that the API needs to work, the purpose of this is to
> control HW after all.
> 
> You might help Vinod by explaining what the SW API is here.

There is no suggested change in API, what we use today for the platform 
devices is exactly the same as what we need for auxiliary bus devices. 
We are not creating something new for SoundWire, just substituting one 
type of devices for another.
