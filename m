Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A4F517129
	for <lists+alsa-devel@lfdr.de>; Mon,  2 May 2022 16:03:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 467BC161E;
	Mon,  2 May 2022 16:02:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 467BC161E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651500182;
	bh=DvDIwV3CmqjYSR4SOb9akGSwBgrd14Hct48y1doOBbM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DDWj3FB4WYg6CP4P9gPGfzuxA3qq/AwJjZRae2GE79JS+Via5cMW1cUAfvIgW+O3i
	 0OYnDpwT1bt/MyzRZ7QDVUTjcy42d4I/LtEwZSDMpYrMiLvlFfxsPlNUZKPd0Izy1j
	 PhrDk8VCKdCyZ5E/owHwk99X3j0HBcG7u31bmWU4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF34BF80129;
	Mon,  2 May 2022 16:02:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBC64F8027C; Mon,  2 May 2022 16:02:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8780BF80129
 for <alsa-devel@alsa-project.org>; Mon,  2 May 2022 16:02:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8780BF80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DfnYgx/o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651500124; x=1683036124;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DvDIwV3CmqjYSR4SOb9akGSwBgrd14Hct48y1doOBbM=;
 b=DfnYgx/oxMcB5cluUwYmGEX3bDnreUHnruCAAhLF87MrXcvUsASCuJHH
 DjV8lp6yuw6PBlpYA2JCsrp/WsRJSYDLNnS41wyh7BSKoznA5wbeHrKCa
 NMmjjH99x2UkxPucHrSbaoqwLyK9hQJJ26zpUuJaCOdLb7SY16jbVdccw
 HtCVrOKATYE+RCSYnuIgltwYtg47SkswlFvVTbd9rDbSWekrq9B9Y7Mhg
 cu+WQKMbdbi38mTEeCBsL1dXXhwEVKnBgHEBHgFnOktPZLzcr7Ir1x0Dt
 c3via0XWbusfYQx/RnGc1tThdLjWocCOF57Tv1pvoKdKW45fRdn1ByFSY Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="330206730"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="330206730"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 07:01:46 -0700
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="561742733"
Received: from sushilsu-mobl1.amr.corp.intel.com (HELO [10.251.9.25])
 ([10.251.9.25])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 07:01:45 -0700
Message-ID: <3b5f69bc-e7e9-b3f0-7ebb-bd66590474f3@linux.intel.com>
Date: Mon, 2 May 2022 08:53:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 06/14] ASoC: Intel: avs: Coredump and recovery flow
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20220426172346.3508411-1-cezary.rojewski@intel.com>
 <20220426172346.3508411-7-cezary.rojewski@intel.com>
 <d80075c7-3658-52e0-b09f-35182961d5df@linux.intel.com>
 <f20f3d72-8f5a-1878-c1fa-49dafce784d7@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <f20f3d72-8f5a-1878-c1fa-49dafce784d7@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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


>>> +
>>> +    /* forcibly shutdown all cores */
>>> +    core_mask = GENMASK(adev->hw_cfg.dsp_cores - 1, 0);
>>> +    avs_dsp_core_disable(adev, core_mask);
>>> +
>>> +    /* attempt dsp reboot */
>>> +    ret = avs_dsp_boot_firmware(adev, true);
>>> +    if (ret < 0)
>>> +        dev_err(adev->dev, "dsp reboot failed: %d\n", ret);
>>> +
>>> +    pm_runtime_mark_last_busy(adev->dev);
>>> +    pm_runtime_enable(adev->dev);
>>> +    pm_request_autosuspend(adev->dev);
>>
>> there are zero users of this routine in the entire sound/ tree, can you clarify why this is needed or what you are trying to do?
> 
> 
> Unsure which routine you question here. I'll assume it's pm_request_autosuspend().
> 
> pm_request_audiosuspend() is being used to queue suspend once recovery completes. Recovery takes time and during that time all communication attempts with DSP will yield -EPERM. PM is also blocked for the device with pm_runtime_disable(), performed before scheduling the recovery work. Once recovery completes we do not just unblock the PM as that would cause immediate suspend. Instead, we "refresh" the *last busy* status and queue the suspend operation.

But since you already have autosuspend enabled, why would you need to explicitly queue a suspend operation? What happens if that last call is omitted, is there actually a functional difference?

Not objecting if that's required, but since no one else used it so far I wonder if we missed something or if this is overkill.
