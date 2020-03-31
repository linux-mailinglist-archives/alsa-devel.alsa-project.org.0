Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 916071996B4
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 14:42:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 329001666;
	Tue, 31 Mar 2020 14:41:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 329001666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585658524;
	bh=OsN1YSh1ZJyYeI0u3AL7Wza3jibtmNJaaZBEml7Ad84=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G5V7YmojKsBXm6sPq4DYIm/QJeB8l24kIgXlXzHaFaLYfxjNP0GgEaHsBCboRG2ML
	 0+PP2SER79I10mCwWXFjyxsuNGurg3bDecdEzv0CROzjC7Qgxy6Y7ZEutljpzl2ikX
	 TmsgH+Wz34az9kA4aJ+V8aDSnZEkK1W0ad5UUemg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E45FF8014F;
	Tue, 31 Mar 2020 14:40:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96599F80146; Tue, 31 Mar 2020 14:40:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEC6DF8010D
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 14:40:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEC6DF8010D
IronPort-SDR: YyCGp6yFejBBKF0ANPWPBL4No+diogIGMyx8QuvIIR+rS/9sYTL1oCs//HBN/pcslAQr7RlVp/
 4cTE9BjFy87g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2020 05:15:57 -0700
IronPort-SDR: F5Omn7SM9i5c0IqXIOG0uXgfUEMZ1P3AVz5XA4VK4jZDl0YqXecwPPwiBc0QruATYgb3iUimoY
 UrzlFP41h52g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; d="scan'208";a="240106704"
Received: from kmariste-mobl.amr.corp.intel.com (HELO [10.212.248.138])
 ([10.212.248.138])
 by fmsmga007.fm.intel.com with ESMTP; 31 Mar 2020 05:15:54 -0700
Subject: Re: [PATCH 3/4] ASoC: Intel: bdw-rt5677: Remove ignore_suspend flag
 from SSP0 dai link
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200319204947.18963-1-cezary.rojewski@intel.com>
 <20200319204947.18963-4-cezary.rojewski@intel.com>
 <dea20cf7-f324-a933-8f8e-e70a4dffa249@linux.intel.com>
 <259cbb60-9e59-1132-8371-83f837577f86@redhat.com>
 <9f1884b4-e356-9a8f-6912-0d55c4bcbf06@intel.com>
 <a48d48cb-ab02-1213-88b9-431109e4b468@linux.intel.com>
 <62061e77-e855-e4e0-1e5d-8d9ccd422011@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <fcde500a-877e-3fa8-b473-14281ab1683f@linux.intel.com>
Date: Tue, 31 Mar 2020 07:15:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <62061e77-e855-e4e0-1e5d-8d9ccd422011@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Curtis Malainey <cujomalainey@google.com>, tiwai@suse.com,
 Dominik Brodowski <linux@dominikbrodowski.net>, lgirdwood@gmail.com,
 vkoul@kernel.org, broonie@kernel.org, Ben Zhang <benzh@google.com>
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



On 3/31/20 7:12 AM, Hans de Goede wrote:
> Hi,
> 
> On 3/31/20 12:54 PM, Pierre-Louis Bossart wrote:
>>
>>> Don't believe WoV for WPT has been added for SST linux so 
>>> .ignore_suspend=1 achieves nothing. The offload part is probably just 
>>> limited to bigger buffer size compared to system pin than anything 
>>> else. So, nothing prevents from removing .ignore_suspend for SST 
>>> solutions until WoV is verified. Don't know about SOF side.
>>> Pierre, what's your take on this?
>>
>> I think on Baytrail and Broadwell we will most likely never enable 
>> hotwording on the Intel DSP, and S0i1-Playback isn't planned either.
>>
>> However hotwording is enabled on the RT5677 and there may be clocking 
>> dependencies so that the RT5677 remains operational - at least the 
>> mclk needs to be on, so the bdw-rt5677 case probably needs more work.
>>
>> While I am at it, I think the notion of .ignore_suspend has an 
>> assumption baked in. It will work if the only suspend mode is S0i1. If 
>> the platform can choose between S0i1 and S3, then we would still want 
>> to suspend all paths in S3, which currently isn't really possible.
> 
> You can check if S0i1 will be used by using:
> 
> pm_suspend_default_s2idle()
> 
> If this returns true then S0i1 will be used, otherwise S3.
> 
> This is defined in kernel/power/suspend.c and always build, so it
> should be ok to also use this in non x86 specific code-paths
> (it will simply always return false there I believe).

Yes, but what I meant is that when the target is S3, we have no way of 
disabling those .ignore_suspend that were added for S0i1 usages.
