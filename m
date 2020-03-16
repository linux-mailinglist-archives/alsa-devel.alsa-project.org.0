Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F219118732E
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Mar 2020 20:16:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D96517E2;
	Mon, 16 Mar 2020 20:16:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D96517E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584386217;
	bh=0v4ox8MhQNqUrGZoQuiHYuUcmjemgD2ghgliY7yKGGo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qTYlQoPBkfejANQBS+Dvvy+J7+RGz4T4m90nX4JL3HZYnxCtsPCdKsoQ7a5phpfop
	 37QDgzEZCiSzJhyKzAMTrPInaB3DrX5zbTDTxBtBa8JKf0pGfNt9QMex/v1mn34XDS
	 tl6GNtOaWd/61sfCZErZUB1HFh/Nyda7ckK3/2Pw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C9EFF80110;
	Mon, 16 Mar 2020 20:15:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98330F8015B; Mon, 16 Mar 2020 20:15:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18683F80058
 for <alsa-devel@alsa-project.org>; Mon, 16 Mar 2020 20:15:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18683F80058
IronPort-SDR: xVHtIeem4KZad05O1E7V4XRWRO9VBgY/awEaAPXSDcpriQEC5i/jiqayncX/2MxhKFwavMcij7
 JSKqeDFMh+YQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2020 12:15:04 -0700
IronPort-SDR: BkxMwYmGdmJL6bboIYVi1p4yGEi4lwtwLzcR/d0ngV74pLIjsdWFhK6pgUuMwbnjsirJR6lMqk
 GT+celwN2SiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,561,1574150400"; d="scan'208";a="267685306"
Received: from saholmes-mobl.amr.corp.intel.com (HELO [10.255.32.131])
 ([10.255.32.131])
 by fmsmga004.fm.intel.com with ESMTP; 16 Mar 2020 12:15:02 -0700
Subject: Re: [PATCH 1/8] soundwire: bus_type: add master_device/driver support
To: Vinod Koul <vkoul@kernel.org>
References: <20200304095312.GT4148@vkoul-mobl>
 <05dbe43c-abf8-9d5a-d808-35bf4defe4ba@linux.intel.com>
 <20200305063646.GW4148@vkoul-mobl>
 <eb30ac49-788f-b856-6fcf-84ae580eb3c8@linux.intel.com>
 <20200306050115.GC4148@vkoul-mobl>
 <4fabb135-6fbb-106f-44fd-8155ea716c00@linux.intel.com>
 <20200311063645.GH4885@vkoul-mobl>
 <0fafb567-10e5-a1ea-4a6d-b3c53afb215e@linux.intel.com>
 <20200313115011.GD4885@vkoul-mobl>
 <4cb16467-87d0-ef99-e471-9eafa9e669d2@linux.intel.com>
 <20200314094904.GP4885@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3c32830c-cd12-867f-a763-7c3e385cb1e9@linux.intel.com>
Date: Mon, 16 Mar 2020 14:15:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200314094904.GP4885@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



>> It's really down to your objection to the use of 'struct driver'... For ASoC
>> support we only need the .name and .pm_ops, so there's really no possible
>> path forward otherwise.
> 
> It means that we cannot have a solution which is Intel specific into
> core. If you has a standalone controller you do not need this.

A 'struct driver' is not Intel-specific, sorry.

>> Like I said, we have 3 options
> 
> Repeating the already discussed doesn't help. I have already told you the
> constraint to work is not to add Intel specific change into core.
> 
> I have already said that expect the driver part I dont have objections
> to rest of this series and am ready to merge
> 
>> a) stay with platform devices for now. You will need to have a conversation
>> with Greg on this.
>>
>> b) use a minimal sdw_master_device with a minimal 'struct driver' use.
>>
>> c) use a more elaborate solution suggested in this patchset and yes that
>> means the Qualcomm driver would need to change a bit.
>>
>> Pick one or suggest something that is implementable. The first version of
>> the patches was provided in October, the last RFC was provided on January
>> 31, time's up. At the moment you are preventing ASoC integration from moving
>> forward.
> 
> In opensource review we go back and forth and we debate and come to a
> common conclusion. Choosing a specific set of solutions and constraining
> yourself to pick one does not help.

First off, the ask to move away from platform devices came from Greg. 
Not me. All I did here was suggest solutions, one reviewed by Greg as 
'sane' and 'nice work'. Greg essentially wrote the book on 
devices/drivers so his review means I am not completely senile just yet.

You pushed back with two proposals that don't account for power 
management and the driver name required for ASoC. That was on top on 
another suggestion to use platform devices that was shot down by Greg 
himself with language I can't quote here.

Please re-read my words: my ask was "Pick one or suggest something that 
is implementable."

You don't pick one and don't suggest anything implementable either, so 
there's really not much I can do, can I? I don't have a solution without 
a 'struct driver', and you don't want it.

The only short-term path forward I see is to ask Greg to agree to keep 
the platform devices for now.

> I have only _one_ constraint no platform specific change in core. If that
> is satisfied I will go with it. Sorry but this is non-negotiable for me.

How is a 'struct driver' platform specific?

> Ask yourself, do you need this intrusive core change if you had this
> exact same controller(s) but only as standalone one...

That would really not change anything. There would be some sort of ID 
(PCI or something else) for the controller and multiple masters below. 
The ACPI/DisCo spec does not account for masters so they would have to 
be created by hand.

Again how is a 'struct driver' an 'intrusive change'?
