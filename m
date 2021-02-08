Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8293139AC
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 17:40:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0014E169D;
	Mon,  8 Feb 2021 17:40:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0014E169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612802454;
	bh=4TcBeLOt+1TJri/KaLMKk/KTtTiBdlOF19unYNaFhbs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QjrpGx4sSqeHMTPLptufy5aRRUoLldBzJw9LwLvMVo0XCZcwwzyLsXp1B+AqUhYlz
	 A0PHJbBt9l1OkzpNt5O+BcweIra49QhAEHQzYOEwqJpcgDTvdmQ1RXx3RwvrByjU0v
	 VZEoD2Gwm15LR7bGSctfzS196ImxKls6KPhCom8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17C0DF8027C;
	Mon,  8 Feb 2021 17:38:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85923F8026C; Mon,  8 Feb 2021 17:38:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1119F80169
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 17:38:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1119F80169
IronPort-SDR: BLJY/XaNil9pLFwxAKrFGzkMT/VgsJSt7X4P6Uikjy7uuPXci2v24E4EkFb7aBuVooSJnyyr95
 g75Iqd7pV7DQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="245810570"
X-IronPort-AV: E=Sophos;i="5.81,162,1610438400"; d="scan'208";a="245810570"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 08:38:18 -0800
IronPort-SDR: dKNByfh3agFh+QiB1Ca3MxInIAnIu22r7BoQwlAXF2le5SiBsVVGJFfzu2huUT+mAGBWee2BTe
 pXTtJx/4nTlw==
X-IronPort-AV: E=Sophos;i="5.81,162,1610438400"; d="scan'208";a="377835356"
Received: from rahaness-mobl.amr.corp.intel.com (HELO [10.212.141.76])
 ([10.212.141.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 08:38:14 -0800
Subject: Re: [PATCH 1/2] soundwire: slave: introduce DMI quirks for HP Spectre
 x360 Convertible
To: Vinod Koul <vkoul@kernel.org>
References: <20210204204837.27876-1-pierre-louis.bossart@linux.intel.com>
 <20210204204837.27876-2-pierre-louis.bossart@linux.intel.com>
 <20210205071621.GF2656@vkoul-mobl.Dlink>
 <46897c27-50ff-564c-5a44-b2c230d4d39b@linux.intel.com>
 <20210206105547.GP2656@vkoul-mobl.Dlink>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b4440358-e170-8fa3-e2a1-f89e1f81816b@linux.intel.com>
Date: Mon, 8 Feb 2021 08:56:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210206105547.GP2656@vkoul-mobl.Dlink>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, Bard Liao <bard.liao@intel.com>
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



On 2/6/21 4:55 AM, Vinod Koul wrote:
> Hi Pierre,
> 
> On 05-02-21, 09:15, Pierre-Louis Bossart wrote:
>> Thanks for the review Vinod.
>>
>>> On 04-02-21, 14:48, Pierre-Louis Bossart wrote:
>>>> HP Spectre x360 Convertible devices expose invalid _ADR fields in the
>>>> DSDT, which prevents codec drivers from probing. A possible solution
>>>> is to override the DSDT, but that's just too painful for users.
>>>>
>>>> This patch suggests a simple DMI-based quirk to remap the existing
>>>> invalid ADR information into valid ones.
>>>
>>> While I agree with the approach, I do not like the implementation. The
>>> quirks in firmware should not reside in core code. Drivers are the right
>>> place, of course we need to add callbacks into driver for this.
>>>
>>> So I did a quick hacking and added the below patch, I think you can add
>>> the quirks in Intel driver based on DMI for this.
>>
>> I thought about this, but the Intel driver is about the *master*
>> configuration. It's not really about slave-related _ADR. If and when the IP
>> configuration changes, it'll be problematic to have such quirks in the
>> middle.
> 
> Okay, but ADR is not really a slave configuration either. I feel it is system
> wide description..

It's a partial description only useful for enumeration.

the _ADR field is the means by which we probe a slave driver, which 
happens when we add a device in slave.c. It doesn't carry any other 
information beyond enumeration. the only part you could view as 
system-dependent is the link_id and the unique_id, but that's far from a 
complete description.

More specifically, it doesn't tell you if the device is left or right, 
if it's meant to be used in an 'aggregated' way or if the different 
devices are independent.

In fact the entire existing DisCo specification only describes 'devices' 
(in the SoundWire sense), not how they are supposed to be connected and 
used in a system. We will have to come-up with a new spec for this so 
that we can have a true 'platform'/system description allowing us to use 
a generic machine driver (similar to Morimoto-san's generic graph)

> 
>> At the end of the day, the problem is an ACPI one, not an Intel master one,
>> and I put the code where it's protected by CONFIG_ACPI.
> 
> Right, to be more specific it is a buggy firmware implementation and not
> following of the specs by device vendors.

It's an OEM/BIOS vendor/integrator issue.

>> I don't mind doing the change, but the notion of conflating Intel master and
>> list of slave quirks isn't without its own problems.
> 
> Same is true for soundwire core (slave/slave-apci or whatever). The
> issue I have is that this will sure become big, so I would like this to
> be moved away from all soundwire core files. The right place IMO for
> this is respective drivers, intel/codec/machine please do take your
> pick. My attempt here was to move this to Intel driver here as I felt
> that was the right place for platform issues here.. do feel free to move
> any other place except core files...

thanks, I will combine your suggestion to add an 'override' callback but 
stick these quirks in a separate files. That will avoid collisions and 
make the code more manageable.


