Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D56A683930
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 23:20:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2CFFA4D;
	Tue, 31 Jan 2023 23:19:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2CFFA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675203624;
	bh=1k+bgDHjFw33vi2FYCvnMsD2v6XTns/PIAju5+u3Wh4=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=c8pwPi30ocwCrV/DSFHzmNS8os7DxLccBNjrSO71wCSmIbcrTXUSNSkOxhRBHM/Q6
	 IbiA8vpXzxPVITfja6aNsOsbFQmgtF14pvJ4NtN8gqplYgSovMCL5xykYO3nPWjy2O
	 gRPYlm8BM8FrA7Pai3yLBxullT9F70cQGklwBpLk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87215F80155;
	Tue, 31 Jan 2023 23:19:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 580FCF804E0; Tue, 31 Jan 2023 23:19:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=DATE_IN_PAST_06_12,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65C81F80155
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 23:19:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65C81F80155
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TJwrEM65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675203569; x=1706739569;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1k+bgDHjFw33vi2FYCvnMsD2v6XTns/PIAju5+u3Wh4=;
 b=TJwrEM65Jq5qiAkT84bnS6w+ifdJOmWXAZmq/oV2SlwzwPx0eevbydn4
 BEN9L634fP6ENQ9DtCPj40D1xn42wtPDpVHcY/lyVSKQMFmQAmGFYMQvM
 Z0HPU3T/ZRKiGareh8pw7sLSloORtLezKd7eLEu/PD1kTAQisaaEDoSxU
 stSDt7O7Y/ZdpG0OAxRmpKVic95TodriSxyRBapbX/d2jXSQgVQHp4PTw
 0XW95W2DMjcdI7FjJnE7ijOQUpOUih0kHG9d57IyCs087JzQ8b9Tkg9da
 m7h/QiTSbEAcBDQERZIM1EMF0wmEMQuf0heOG1Q6jlb+HL3+CKLzWpFya g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="308318503"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="308318503"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 14:19:26 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="788615794"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="788615794"
Received: from ncollins-mobl.amr.corp.intel.com (HELO [10.212.85.244])
 ([10.212.85.244])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 14:19:25 -0800
Message-ID: <12b10990-8f06-e0a3-df6a-33fa20ba2cd9@linux.intel.com>
Date: Tue, 31 Jan 2023 09:52:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH v3 8/8] ASoC: cs42l42: Wait for debounce interval after
 resume
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20230127165111.3010960-1-sbinding@opensource.cirrus.com>
 <20230127165111.3010960-9-sbinding@opensource.cirrus.com>
 <1e5e1312-18f5-e70f-3237-c2ffc851eef7@linux.intel.com>
 <cb52e4cf-47d8-33be-f77d-fc2d0b868a5c@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <cb52e4cf-47d8-33be-f77d-fc2d0b868a5c@opensource.cirrus.com>
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
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/31/23 05:03, Richard Fitzgerald wrote:
> On 30/01/2023 16:45, Pierre-Louis Bossart wrote:
>>
>>
>> On 1/27/23 10:51, Stefan Binding wrote:
>>> Since clock stop causes bus reset on Intel controllers, we need
>>
>> nit-pick: It's more that the Intel controller has a power optimization
>> where the context is lost when stopping the clock, which requires a bus
>> reset and full re-enumeration/initialization when the clock resumes.
>>
> 
> Ok, it's true that clock stop doesn't _cause_ bus reset, bus reset is
> necessary when exiting clock stop. We can re-word if you want us to
> describe that accurately.
> 
> But from the codec driver's point of view, a clock stop causes a bus
> reset.

it's fine, we all agree here.

>> The rest of the patch is fine so
>>
>> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>
>>> to wait for the debounce interval on resume, to ensure all the
>>> interrupt status registers are set correctly.
>>>
>>> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
