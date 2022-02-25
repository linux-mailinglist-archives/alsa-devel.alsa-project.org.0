Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5F94C503B
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 21:57:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C46981FC8;
	Fri, 25 Feb 2022 21:56:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C46981FC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645822664;
	bh=ZCRXYaxAx4+1iuZoqkF3PHnv0caWuyU6EcmrxFp4LE0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oxLm0zJnfHBG6pvSnfRQ+ts/0yvko0bHnH3mcHaxNIq876JgUOrX9Mw+eZ1KVhvr5
	 FUwPHdYnlX0RUabXaI/ISoR7JqugQEXPpBonZ5mjf5ZtZDZC2nz+xskgmsmUkHMNV6
	 PBr+hWx/43zwebL65PLNdR51tNe99Fv8eXRq/Kgc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00EC3F80568;
	Fri, 25 Feb 2022 21:53:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A917CF80537; Fri, 25 Feb 2022 21:52:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B0B8F80529
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 21:52:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B0B8F80529
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VRevOZFG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645822366; x=1677358366;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZCRXYaxAx4+1iuZoqkF3PHnv0caWuyU6EcmrxFp4LE0=;
 b=VRevOZFGK3BS2tpf7kCHPyR+xGqJ4DdjR75gcLUsYkddQbWfXi6GdFDp
 oSv61qH+XkDMC1rtLu2cGL/LkdjbutXPfIgu8PdV9QBLLBhm31+I54ZEU
 poksUo3ZbIPJxaFsrkVZuqAFORVpPi6G22n9oBO30+HhYYdk9J2HeRgk0
 /Fmd4VcOWJqltfslceo7aw37Il+3Hs3pWoo7cmrceIFQubGNcCw0SRjwq
 JvvVVn80MpboeYBJjkEJQmIZCiNVa/FNEA/zWTdLlUbEfe0CxEbzs+B3f
 3VVBs3BKFkRxK8RAZv7cFS7iwcI6JkImodi0D7U/rr8tF0NZsGwgyAdQo A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="313296148"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="313296148"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 12:52:45 -0800
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="777520606"
Received: from nnwogbe-mobl1.amr.corp.intel.com (HELO [10.212.101.231])
 ([10.212.101.231])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 12:52:44 -0800
Message-ID: <73c1884c-ee21-9453-c02b-3c3b77131c88@linux.intel.com>
Date: Fri, 25 Feb 2022 14:42:15 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 06/17] ASoC: Intel: avs: Add pipeline management requests
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
 <20220207122108.3780926-7-cezary.rojewski@intel.com>
 <d2a94d30-cfee-7821-fcb8-7b7ba129e5e9@linux.intel.com>
 <f519d485-e1ef-d245-6b75-a24d1ed69a60@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <f519d485-e1ef-d245-6b75-a24d1ed69a60@intel.com>
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



On 2/25/22 12:31, Cezary Rojewski wrote:
> On 2022-02-25 2:11 AM, Pierre-Louis Bossart wrote:
>> On 2/7/22 06:20, Cezary Rojewski wrote:
>>> A 'Pipeline' represents both a container of module instances, and a
>>> scheduling entity. Multiple pipelines can be bound together to create an
>>> audio graph. The Pipeline state machine is entirely controlled by IPCs
>>> (creation, deletion and state changes).
>>
>> How are the module instances connected within a pipeline? You've said
>> too much or too little here.
> 
> 
> Hmm.. I doubt commit messages is the place to bring up entire FW
> specification. A high level description is provided to give a
> maintainer/reviewer idea of what the pipeline is. Perhaps s/module
> instances/modules/ would suffice.

No one is asking you to to provide the entire specification, just enough
for reviewers with no access to that spec to understand what your intent is.

> 
>>> +int avs_ipc_create_pipeline(struct avs_dev *adev, u16 req_size, u8
>>> priority,
>>> +                u8 instance_id, bool lp, u16 attributes)
>>> +{
>>> +    union avs_global_msg msg = AVS_GLOBAL_REQUEST(CREATE_PIPELINE);
>>> +    struct avs_ipc_msg request = {0};
>>> +    int ret;
>>> +
>>> +    msg.create_ppl.ppl_mem_size = req_size;
>>> +    msg.create_ppl.ppl_priority = priority;
>>> +    msg.create_ppl.instance_id = instance_id;
>>> +    msg.ext.create_ppl.lp = lp;
>>
>> you may want to describe what the concepts of 'priority', 'lp' and
>> 'attributes' are and which entity defines the values (topology?)
> 
> 
> These fields match firmware equivalents 1:1 and are part of pipeline
> descriptor excepted by firmware when initializing a pipeline. Handlers
> found in messages.c are responsible for one and only one task only:
> sending a concrete message. Part of the driver that implements PCM
> operations (not part of this series) cares about the topology (where
> these values actually come from) and invokes the necessary IPCs.

add a comment then that the driver is just relaying information found in
the topology to the firmware.


>>> +/* Pipeline management messages */
>>> +enum avs_pipeline_state {
>>> +    AVS_PPL_STATE_INVALID,
>>> +    AVS_PPL_STATE_UNINITIALIZED,
>>> +    AVS_PPL_STATE_RESET,
>>> +    AVS_PPL_STATE_PAUSED,
>>> +    AVS_PPL_STATE_RUNNING,
>>> +    AVS_PPL_STATE_EOS,
>>> +    AVS_PPL_STATE_ERROR_STOP,
>>> +    AVS_PPL_STATE_SAVED,
>>> +    AVS_PPL_STATE_RESTORED,
>>
>> can you describe that the last two enums might entail and what the
>> purpose might be?
>>
>> I can see how the firmware state could be saved in IMR for faster
>> suspend/resume, but save/restore at the pipeline level doesn't seem to
>> have an obvious match for an ASoC driver?
> 
> 
> The enum lists all available pipeline states. We're planning to move
> these to uapi later on to allow apps to monitor running pipelines states
> real-time.

That doesn't answer to my question. You are not using the last two in
the rest of this patchset, so why create doubt in the confused brain on
the reviewer?
