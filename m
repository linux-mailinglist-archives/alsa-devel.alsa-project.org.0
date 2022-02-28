Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A064C76C6
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 19:06:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C7FA185D;
	Mon, 28 Feb 2022 19:05:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C7FA185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646071588;
	bh=P10NnytFVOaEydSBgVFwxDnKBibxyZmK75xRGr3L658=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O9Q/SuQJnKaccR3fg7iYKK6vD3b+6DqkXe7kPmFXUcEgBCU66A8VbBkib3UUmXLIT
	 tk2vMjqcT2L7RKFLKyPbhcZ42YCmxx/d0dU+SGHfGUH7sx5oXP6VucWlK8IUgk2xVq
	 DZg2FOnIX+rPVw+e0Bd3GwICdSuRRr8+MqAt992U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3D5FF80507;
	Mon, 28 Feb 2022 19:04:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3C45F80154; Mon, 28 Feb 2022 19:04:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 259B6F80125
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 19:04:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 259B6F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SHZpNS7q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646071483; x=1677607483;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=P10NnytFVOaEydSBgVFwxDnKBibxyZmK75xRGr3L658=;
 b=SHZpNS7qOOXyto4tsmBy66YDraQvk/Zw9TgonTM2Zk2/uvv2svYql0Bv
 c52pFlx2dGTKqvygjy2px6LBLskeI6dUpmQn6yjnzExKWrp1/zZ4xINTK
 9AYALHVEMmDjs32oX9xuMu7mw7195EF96i+ozsgb0tSeigCQh2qC9euZZ
 GtiduHem/ZpZf67wOjQN6vLFV27Fn4ESnBsw1W7jxEnkm6KjVcEU82Qw9
 GIusl97Eiaos8Stgb0iyFcafY3Gw47x7/JWKPxJvNdX8U7B06MRrhLsrP
 cT6rCZ7Ompl2YUZBo2xv2ylWtPwIF29oVZYWQWMIh3hiG3CVadTNkSaKS A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="232919495"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="232919495"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 10:04:33 -0800
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="510184813"
Received: from ensymall-mobl.amr.corp.intel.com (HELO [10.212.116.28])
 ([10.212.116.28])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 10:04:31 -0800
Message-ID: <a8d029cf-8910-8bd4-194a-456631d6408b@linux.intel.com>
Date: Mon, 28 Feb 2022 11:20:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 13/17] ASoC: Intel: avs: Dynamic firmware resources
 management
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
 <20220207122108.3780926-14-cezary.rojewski@intel.com>
 <c7a06bdf-5ad5-3d58-bd6b-4a533b8e7d8a@linux.intel.com>
 <3e85850e-8e9b-757c-f640-498bf83996d8@intel.com>
 <66c8d1f7-f181-03ae-d5b1-17ec60b2b798@linux.intel.com>
 <05e48c88-6faf-fd67-e051-b628222824a0@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <05e48c88-6faf-fd67-e051-b628222824a0@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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



On 2/28/22 09:30, Cezary Rojewski wrote:
> On 2022-02-25 9:21 PM, Pierre-Louis Bossart wrote:
>>>>> +static int avs_dsp_enable(struct avs_dev *adev, u32 core_mask)
>>>>> +{
>>>>> +    u32 mask;
>>>>> +    int ret;
>>>>> +
>>>>> +    ret = avs_dsp_core_enable(adev, core_mask);
>>>>> +    if (ret < 0)
>>>>> +        return ret;
>>>>> +
>>>>> +    mask = core_mask & ~AVS_MAIN_CORE_MASK;
>>>>
>>>> so here BIT(MAIN_CORE) is zero in mask
>>>
>>>
>>> What's wrong with AVS_MAIN_CORE_MASK being used explicitly?
>>>
>>>>> +    if (!mask)
>>>>> +        /*
>>>>> +         * without main core, fw is dead anyway
>>>>> +         * so setting D0 for it is futile.
>>>>
>>>> I don't get the comment, you explicitly discarded the main core with
>>>> your logical AND above, so this test means that all other non-main
>>>> cores
>>>> are disabled.
>>>
>>> There is no setting D0 for MAIN_CORE as firmware is not operational
>>> without it. Firmware needs to be notified about D3 -> D0 transitions
>>> only in case of non-MAIN_COREs.
>>
>> the comment was about 'without main core'.
>>
>> This is difficult to follow, because you've discarded the main code in
>> the if (!mask), so that's an always-true case, which makes the rest of
>> the explanations not so clear.
> 
> 
> I'm afraid, not seeing the problem. It's clearly not always-true
> statement as 'mask' can be non-zero after discarding the MAIN_CORE.

mask = core_mask & ~AVS_MAIN_CORE_MASK;

-> main core is ignored.

comment says "without main core, fw is dead anyway"

since you ignored the main core, is fw dead in all cases?
