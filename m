Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 725E44C5032
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 21:56:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED39B1F7C;
	Fri, 25 Feb 2022 21:55:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED39B1F7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645822583;
	bh=U+mxbqqdFb5KpuxmhqGId0cLOioJTxrJTteOK3WoFBM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eGpHx1z1WdW4cs6yJm6S/NcgvVhV/u2LfcyfsZK4Wg7zQo1jvY7DDDQEjN5SPS13K
	 gCbCijcLcWvGuQ4XL9rIZncO+EImxgG9U+lyksblkbQyk7NLJT3fnCEZzQ95NSHKLT
	 OScPSWhoco10T5O/4/4+a/zQmeOSx0WBmGxW5E/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AADDF8053E;
	Fri, 25 Feb 2022 21:53:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B528F80525; Fri, 25 Feb 2022 21:52:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BAC8F80118
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 21:52:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BAC8F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Wl9jVhvw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645822362; x=1677358362;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=U+mxbqqdFb5KpuxmhqGId0cLOioJTxrJTteOK3WoFBM=;
 b=Wl9jVhvwHJtuB7lhlgVI2MxlmwSI/jr26/utE/H8hKvy2etcZ5Eu/Btx
 Um7tjW1ZTT/XBC1jNhRGtlqa6rr3fS7nTdUCuLzgjkxoP9AyrkZ+1XeQ7
 H7HcOWSN2REE7zkbUgPOXKf6iFpa2erGVp6FK7CpRwfPJAWpa1xLDChzx
 kc8ktk7rlmodqU6lh4KIRCnpaq1or3EYupldz4QqvxzT6oc9ltNioNwCU
 IQ5P3g66mxyJFuojHTJJ1/GS/xABFdOG3ED50naME9+aP8X1VItP/yeXj
 vbWkZT7n3maSswHeDMMIR3PPM6z9PuE0YRqZkEYIjfMhAbufG7SnHch3K A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="313296141"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="313296141"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 12:52:40 -0800
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="777520588"
Received: from nnwogbe-mobl1.amr.corp.intel.com (HELO [10.212.101.231])
 ([10.212.101.231])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 12:52:39 -0800
Message-ID: <66c8d1f7-f181-03ae-d5b1-17ec60b2b798@linux.intel.com>
Date: Fri, 25 Feb 2022 14:21:51 -0600
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
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <3e85850e-8e9b-757c-f640-498bf83996d8@intel.com>
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




>>> +static int avs_dsp_enable(struct avs_dev *adev, u32 core_mask)
>>> +{
>>> +    u32 mask;
>>> +    int ret;
>>> +
>>> +    ret = avs_dsp_core_enable(adev, core_mask);
>>> +    if (ret < 0)
>>> +        return ret;
>>> +
>>> +    mask = core_mask & ~AVS_MAIN_CORE_MASK;
>>
>> so here BIT(MAIN_CORE) is zero in mask
> 
> 
> What's wrong with AVS_MAIN_CORE_MASK being used explicitly?
> 
>>> +    if (!mask)
>>> +        /*
>>> +         * without main core, fw is dead anyway
>>> +         * so setting D0 for it is futile.
>>
>> I don't get the comment, you explicitly discarded the main core with
>> your logical AND above, so this test means that all other non-main cores
>> are disabled.
> 
> There is no setting D0 for MAIN_CORE as firmware is not operational
> without it. Firmware needs to be notified about D3 -> D0 transitions
> only in case of non-MAIN_COREs.

the comment was about 'without main core'.

This is difficult to follow, because you've discarded the main code in
the if (!mask), so that's an always-true case, which makes the rest of
the explanations not so clear.
