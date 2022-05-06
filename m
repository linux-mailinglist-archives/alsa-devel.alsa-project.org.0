Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD9451DC88
	for <lists+alsa-devel@lfdr.de>; Fri,  6 May 2022 17:48:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD1AC1841;
	Fri,  6 May 2022 17:47:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD1AC1841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651852101;
	bh=m6NchDWC26O6ucu/OhX53UgFgZQ5Nzjejk20v+5/WOo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CPRk0PD+2IW+KuKWuSdjojO+Wj/uzWwHaWRp5C2HX2+0fFUuogyjR4ePmcV8rL3S9
	 sNV4VJwSGGTZElEONF1XX7MiBkGD8o7UR1qqmc/Ebxo8n3A5evuVzR4aCTLEAWzTtN
	 R+ccmJPPTHWYXL55YYRpoWFZXjr4er5PtM3Ns1LE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39F54F80171;
	Fri,  6 May 2022 17:47:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B10DDF8014B; Fri,  6 May 2022 17:47:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A108F800F0
 for <alsa-devel@alsa-project.org>; Fri,  6 May 2022 17:47:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A108F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="E8lIWnzV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651852038; x=1683388038;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=m6NchDWC26O6ucu/OhX53UgFgZQ5Nzjejk20v+5/WOo=;
 b=E8lIWnzVIgu4U029pG+ZuSLaF2TIXJC6vh4jT8LjdwjsHOV4MJQ6Pnt3
 tsqX5Jf9nAuMr4VIeDYQciJY+D8bIoOMRpilVn5hTUOBRRpHTa+epi6Yk
 azsd7rGU/IA9QI3JXFAxuTkdVWWSzo0Wk8kayx2sJIYiavCuCyHvrcbvQ
 vgG/nVqr6xpL+rAKYeDpSTOgM0UicfjfQeyd9lQlG6F0h4j9xC8OeCFz6
 orcfDGNdTcdDA2FzAztGICViqSmYReKcoVezaPw70gOpNjNKNvIXQucV3
 np1mw0zyCQZ7lEd5ofNB5Q2Pk0dfZjdkHbPQam+9ftIHTlFpanrt4kZSL Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="329046590"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="329046590"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 08:47:08 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="654744694"
Received: from ysomasun-mobl1.amr.corp.intel.com (HELO [10.209.0.67])
 ([10.209.0.67])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 08:47:07 -0700
Message-ID: <c642d518-3ccd-8c11-ec96-aa1286288499@linux.intel.com>
Date: Fri, 6 May 2022 10:47:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 01/14] ASoC: Intel: avs: Account for libraries when
 booting basefw
Content-Language: en-US
To: Piotr Maziarz <piotrx.maziarz@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org
References: <20220426172346.3508411-1-cezary.rojewski@intel.com>
 <20220426172346.3508411-2-cezary.rojewski@intel.com>
 <9854d2e1-63da-2377-3fd1-120adfb4d381@linux.intel.com>
 <4ba8b812-2b67-5dd4-2774-f7a94e2d3cc1@intel.com>
 <f14701db-94fa-ba3f-87fc-dc91177abff7@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <f14701db-94fa-ba3f-87fc-dc91177abff7@linux.intel.com>
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


>>>>   +int avs_dsp_load_libraries(struct avs_dev *adev, struct
>>>> avs_tplg_library *libs, u32 num_libs)
>>>> +{
>>>> +    int start, id, i = 0;
>>>> +    int ret;
>>>> +
>>>> +    /* Calculate the id to assign for the next lib. */
>>>> +    for (id = 0; id < adev->fw_cfg.max_libs_count; id++)
>>>> +        if (adev->lib_names[id][0] == '\0')
>>>> +            break;
>>>> +    if (id + num_libs >= adev->fw_cfg.max_libs_count)
>>>> +        return -EINVAL;
>>>
>>> use ida_alloc_max() ?
>>
>>
>> After reading this one couple of times I'm keen to agree that IDA
>> should have been used for library ID allocation and a at the same
>> time, surprised it has't done that already. Till now we used IDA
>> 'only' when allocating pipeline IDs and module instance IDs. Pipeline
>> allocation is good comparison here - makes use of ida_alloc_max()
>> already - library one should follow.
>>
>> This finding is much appreciated, Pierre.
> 
> I think that using ida here is a bit of an overkill. Ida works fine when
> there can be both id allocation and freeing and that's how it work with
> pipelines and modules IDs in avs. However there is no mechanism for
> unloading libraries in cAVS firmware, therefore ida would be used here
> only to increase the ID, so it needlessly complicates the code while not
> giving much of a benefit. Also our approach to check if we can load all
> libraries before the loop makes it problematic with ida because we would
> need to allocate an id at start and calculate if all libs would fit and
> then either free it instantly or complicate the loop to use id allocated
> before. Therefore I suggest to leave this code unchanged. I've synced
> with Cezary on this and provided explanation convinced him too.

That's fine, you should however capture this design decision with a
comment or a clarification in the commit message. "libraries" mean
different things to different people, and it's hard to review without
context.

