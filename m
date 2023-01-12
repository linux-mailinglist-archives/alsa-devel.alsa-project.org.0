Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A29B66791D
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 16:24:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DE9C91D3;
	Thu, 12 Jan 2023 16:23:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DE9C91D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673537082;
	bh=TN1PtohmiBBHyfdy4nNcbruYWz6XfuHSrNsflFeJG/8=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Dw6iaNLcvWLGS0CrJDiTBLhefj+BxzqNhugQqcn06oLTIzZxYeKczVSkr3FvqLAzY
	 UM/eb0a5rc7r731LsvRQgm+tPurMgpe8rxaJrSA4ISSSm8DbfaPGuz6y38jvV3IwBF
	 hl5TY+iX6p368w591PCjE9cH337ThjRhvGvqoaBg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9B06F8053D;
	Thu, 12 Jan 2023 16:23:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD3C9F804D9; Thu, 12 Jan 2023 16:23:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AE75F8013D
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 16:23:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AE75F8013D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZvKULN/v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673536995; x=1705072995;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TN1PtohmiBBHyfdy4nNcbruYWz6XfuHSrNsflFeJG/8=;
 b=ZvKULN/vXsfPPn5g48tmWB3/DCaQJbr4AiS1wVQRKFRLiKah4e/XrLE4
 JJyPazDExxWDCDSK4LRowTD3f3aAXRXVkOT/OEk56+T+KMA7CRLTpGX/X
 qUVMSNqHTKsAp0KG5gdZOB/fSbVQDUaHmDY9V+wE2neuAvxsOuyIHojsi
 999ZBP8Pe6KGME3o88J0hVrcTpYNtlqNx0YF0GHVUCNXPNEY5zU46CJSH
 A3kvloMVf5ciL3UbnaxyIunzw/Qs7G96XSHuis94w24DUKW06K9EnW5hO
 3F1Xr+AYB3f/Izf81Clz2nEGVDrcSHm8+cnGQjGN/C8cyABc4wMFxgVdu A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="388212578"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="388212578"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 06:57:14 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="607816938"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="607816938"
Received: from jbetan3x-mobl1.amr.corp.intel.com (HELO [10.209.143.163])
 ([10.209.143.163])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 06:57:13 -0800
Message-ID: <9edd31f6-1208-64fd-bdde-afb72699a1f5@linux.intel.com>
Date: Thu, 12 Jan 2023 08:50:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 17/19] soundwire: amd: add pm_prepare callback and pm ops
 support
Content-Language: en-US
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, broonie@kernel.org,
 vkoul@kernel.org, alsa-devel@alsa-project.org
References: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
 <20230111090222.2016499-18-Vijendar.Mukunda@amd.com>
 <a76043ad-c212-f625-8d0e-ef9460a078a5@linux.intel.com>
 <8bc313ad-aaad-8d4e-b851-d08229dd5d55@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <8bc313ad-aaad-8d4e-b851-d08229dd5d55@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Mastan.Katragadda@amd.com, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, open list <linux-kernel@vger.kernel.org>,
 Mario.Limonciello@amd.com, arungopal.kondaveeti@amd.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


>>> +static int __maybe_unused amd_pm_prepare(struct device *dev)
>>> +{
>>> +	struct amd_sdwc_ctrl *ctrl = dev_get_drvdata(dev);
>>> +	struct sdw_bus *bus = &ctrl->bus;
>>> +	int ret;
>>> +
>>> +	if (bus->prop.hw_disabled || !ctrl->startup_done) {
>>> +		dev_dbg(bus->dev, "SoundWire master %d is disabled or not-started, ignoring\n",
>>> +			bus->link_id);
>>> +		return 0;
>>> +	}
>>> +	ret = device_for_each_child(bus->dev, NULL, amd_resume_child_device);
>>> +	if (ret < 0)
>>> +		dev_err(dev, "%s: amd_resume_child_device failed: %d\n", __func__, ret);
>>> +	if (pm_runtime_suspended(dev) && ctrl->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
>>> +		ret = pm_request_resume(dev);
>>> +		if (ret < 0) {
>>> +			dev_err(bus->dev, "pm_request_resume failed: %d\n", ret);
>>> +			return 0;
>>> +		}
>>> +	}
>>> +	return 0;
>>> +}
>> This seems to be inspired by the Intel code, but is this necessary here?
> No It's not inspired by intel code. Initially, we haven't included
> pm_prepare callback. We have observed issues without
> pm_prepare callback.
>> For Intel, we saw cases where we had to pm_resume before doing a system
>> suspend, otherwise the hardware was in a bad state.
>>
>> Do you actually need to do so, or is is possible to do a system suspend
>> when the clock is stopped.
>>
>> And in the case where the bus is in 'power-off' mode, do you actually
>> need to resume at all?
> Our platform supports different power modes. To support all
> combinations, we have included pm_prepare callback.

>> do you actually need to stop the clock before powering-off? This seems
>> counter intuitive and not so useful?
> Yes, as per our design, we need to stop the clock
> before powering off.

It'd be good to add comments capturing these points, that would be
useful for new contributors and reviewers to know this is intentional
and required by the hardware programming sequences.
