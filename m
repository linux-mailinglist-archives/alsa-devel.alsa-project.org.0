Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25792696DC9
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Feb 2023 20:24:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A51D9DF4;
	Tue, 14 Feb 2023 20:23:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A51D9DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676402686;
	bh=9DZVAA+wlCy183muiHl56v2KwqeBMqprVZFGarThNBo=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=On1/J36PQndwis408Vj3uMfYq4j+AtWKoJim5qALGN6JfOMAR8HhLRyOJ6ZkynGc+
	 lo6fNcoialK5OkoeIFeXvSV3/qdkrg81OD/ogFvMtGP9/89joCPX17gSvZIL9hbWIr
	 ad93Ct7v42yyRcXRIomMQMDPzyvF+unjj6+BwrwU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10F2DF804B0;
	Tue, 14 Feb 2023 20:23:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95B4CF80496; Tue, 14 Feb 2023 20:23:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0FD04F800E4
	for <alsa-devel@alsa-project.org>; Tue, 14 Feb 2023 20:22:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FD04F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BCdlbjAj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676402579; x=1707938579;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9DZVAA+wlCy183muiHl56v2KwqeBMqprVZFGarThNBo=;
  b=BCdlbjAjb1DEX7hW24KA2Jbh2GVRcTefSQ6tdUENzDIjvhWQkMxYrtQ/
   tZcXX9jIN8G/LTS8d5Dh8v5FelHEIHuBJCGehAqpRk3NBycKuCf6afJnW
   xhIWAxCS81XDLL/4eGrzc8W5H7T9cX6v+og7hN1dphPSd7l2uFLoBCXx8
   TeHVkmBtKH6Nlm0oygXem3pLkqPae4cDg/IHbpAnGo9bqrLiiw+2Naq8y
   HyqyPI46K1vjvOf5NRBria2tjCAcnryHyK03T8hf6pxujYm2aUp0hwCSH
   mFWZAFY9PFDngmOVcHm2PQEk+y4hSgeDZ4WSTGvc2eJXT2tby2G3WvCtB
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="314893710"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000";
   d="scan'208";a="314893710"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 11:22:52 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="778485237"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000";
   d="scan'208";a="778485237"
Received: from parthgup-mobl2.amr.corp.intel.com (HELO [10.209.175.23])
 ([10.209.175.23])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 11:22:51 -0800
Message-ID: <b632ba86-767f-2813-ad2d-4a3424e6b02e@linux.intel.com>
Date: Tue, 14 Feb 2023 07:28:15 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH V2 5/8] soundwire: amd: add soundwire manager interrupt
 handling
Content-Language: en-US
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, vkoul@kernel.org
References: <20230213094031.2231058-1-Vijendar.Mukunda@amd.com>
 <20230213094031.2231058-6-Vijendar.Mukunda@amd.com>
 <9505941e-73a1-249b-08c2-83b86e7ef5c6@linux.intel.com>
 <2fc1191d-e57d-4b76-1c9c-088e33f2ad45@amd.com>
 <f739053c-d19b-f773-cead-77abad53feec@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <f739053c-d19b-f773-cead-77abad53feec@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CCX7WM4DA6FDUPLTNUOKQPQTERMWOSOQ
X-Message-ID-Hash: CCX7WM4DA6FDUPLTNUOKQPQTERMWOSOQ
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: amadeuszx.slawinski@linux.intel.com, Mario.Limonciello@amd.com,
 Sunil-kumar.Dommati@amd.com, Basavaraj.Hiregoudar@amd.com,
 Mastan.Katragadda@amd.com, Arungopal.kondaveeti@amd.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 "moderated list:SOUNDWIRE SUBSYSTEM" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CCX7WM4DA6FDUPLTNUOKQPQTERMWOSOQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>>>> +update_status:
>>>> +	sdw_handle_slave_status(&amd_manager->bus, amd_manager->status);
>>>> +	if (amd_manager->status[0] == SDW_SLAVE_ATTACHED) {
>>>> +		if (retry_count++ < SDW_MAX_DEVICES) {
>>>> +			acp_reg_writel(AMD_SDW_IRQ_MASK_0TO7, amd_manager->mmio +
>>>> +				       ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7);
>>>> +			acp_reg_writel(AMD_SDW_IRQ_MASK_8TO11,
>>>> +				       amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
>>>> +			amd_sdw_read_and_process_ping_status(amd_manager);
>>>> +			goto update_status;
>>>> +		} else {
>>>> +			dev_err_ratelimited(amd_manager->dev,
>>>> +					    "Device0 detected after %d iterations\n",
>>>> +					    retry_count);
>>>> +		}
>>>> +	}
>>> this seems rather inspired by the Cadence code, but is there really a
>>> case where you need to re-check for devices? In the Cadence case, this
>>> was added because we have a logical OR and new devices would not be handled.
>> As mentioned in V1 set, we have corner cases during enumeration sequence.
>> We observed device alerts are missing during peripheral enumeration sequence
>> when multiple peripheral devices are connected over the same link.
>> This is not inspired by Intel code.
>>
>> As per V1 version review comment, we have included retry_count logic to address
>> faulty case.
>>
>> We forgot to include comment. we will fix it.
> Slight correction in the explanation.
> 
> During the peripheral enumeration sequence, the soundwire peripheral interrupts
> are masked.
> If soundwire interrupts are not masked, it will cause side effects when multiple
> peripheral devices connected over the same link.
> As interrupts are masked, during device slot programming for each peripheral,
> soundwire manager driver won't receive any interrupts.
> 
> Once the device number programming is done for all peripherals, the soundwire
> interrupts will be unmasked. Read the peripheral device status from ping command
> and process the response, which will invoke the peripheral device initialization sequence.
> This sequence will ensure all peripheral devices enumerated and initialized
> properly.

Humm, the explanation is difficult to follow, it's not clear on which
side the interrupts are masked. Are you talking about the peripheral
being prevented from generating interrupts, or about the manager not
detecting peripheral state changes with an interrupt-based mechanism?

I am not sure what 'side effects' can happen, during enumeration all
devices show up as device0 and the SoundWire bus provides a mechanism to
enumerate without conflicts.
