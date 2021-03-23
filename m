Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD94E3467AC
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 19:32:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BE3D1678;
	Tue, 23 Mar 2021 19:31:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BE3D1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616524337;
	bh=rS/+Qq/9KdIm2ehQD4cpUkJcdBAxPnr43OkkhJGHnl8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aDUggByw9A43djKq6bHRW18uBGhXrt7/tIzIH+/YYTP4YS/bd0BkAmeghipKheBfG
	 ANcTayfFzs9NCWTWGXPBAWNB/lBe5ntiLqc9y35k38EEAz8wrg2NUOQdSsAqSG673l
	 TY34UI4YpJdgViLIQ4EMDAiwBttOE/mo62xzK4tM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE330F80268;
	Tue, 23 Mar 2021 19:30:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F955F8025F; Tue, 23 Mar 2021 19:30:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDF0AF80155
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 19:30:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDF0AF80155
IronPort-SDR: WySsBDiILkL62xHfW9D0n4GSVLdRBzuaBvGtJyo1inhRcoBTUbdOEvKN3WwCFe5epG3o6/dYfF
 4ipmvl38mhKQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="275639362"
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="275639362"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 11:30:43 -0700
IronPort-SDR: T9JJiSqyx5OMhoPwEFUsCZlg205hFE47iisvdkawz5cR6nRBRuMAVjrQAbMEN1GFdizjHo2fuC
 ZHan+M8izCBw==
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="452262070"
Received: from laguitie-mobl.amr.corp.intel.com (HELO [10.252.129.185])
 ([10.252.129.185])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 11:30:40 -0700
Subject: Re: [PATCH] soundwire: add slave device to linked list after
 device_register()
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20210323022529.21915-1-yung-chuan.liao@linux.intel.com>
 <YFmRcPUxxFxkuMkr@vkoul-mobl.Dlink>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <82d579ca-5021-341c-1fcd-5c85c54c637b@linux.intel.com>
Date: Tue, 23 Mar 2021 13:30:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YFmRcPUxxFxkuMkr@vkoul-mobl.Dlink>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, hui.wang@canonical.com,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com,
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

Hi Vinod,

>> We currently add the slave device to a linked list before
>> device_register(), and then remove it if device_register() fails.
>>
>> It's not clear why this sequence was necessary, this patch moves the
>> linked list management to after the device_register().
> 
> Maybe add a comment :-)
> 
> The reason here is that before calling device_register() we need to be
> ready and completely initialized. device_register is absolutely the last
> step in the flow, always.
> 
> The probe of the device can happen and before you get a chance to
> add to list, many number of things can happen.. So adding after is not a
> very good idea :)

Can you describe that 'many number of things' in the SoundWire context?

While you are correct in general on the use of device_register(), in 
this specific case the device registration and the possible Slave driver 
probe if there's a match doesn't seem to use this linked list.

This sdw_slave_add() routine is called while parsing ACPI/DT tables and 
at this point the bus isn't functional. This sequence only deals with 
device registration and driver probe, the actual activation and 
enumeration happen much later. What does matter is that by the time all 
ACPI/DT devices have been scanned all initialization is complete. The 
last part of the flow is not the device_register() at the individual 
peripheral level.

Even for the Qualcomm case, the steps are different:

	ret = sdw_bus_master_add(&ctrl->bus, dev, dev->fwnode);
	if (ret) {
		dev_err(dev, "Failed to register Soundwire controller (%d)\n",
			ret);
		goto err_clk;
	}

	qcom_swrm_init(ctrl); <<< that's where the bus is functional

Note that we are not going to lay on the tracks for this, this sequence 
was tagged by static analysis tools who don't understand that 
put_device() actually frees memory by way of the .release callback, but 
that led us to ask ourselves whether this sequence was actually necessary.
