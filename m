Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0324C503A
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 21:57:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 271F11FBF;
	Fri, 25 Feb 2022 21:56:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 271F11FBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645822648;
	bh=VO2b7mZp1MmZe9GUeYmWjagvBg37++qhmnrAYwGd0mc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s4M/h9MoJAa+MZlinb4ONfIBMZIUI1obXxly+tQZVRaTnRBm+9NUjXRNNDgbRy0yc
	 9DkqzVoXOmA7eiEwlfgJ6Kg3l+plM6XzsfDET7sKm483LJrKGbNSw42vtiYyYEZmuD
	 q0IrwMt2NwOuEauKVHMLL9nWYtVfNrYgSxcKdwrA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67C25F8055A;
	Fri, 25 Feb 2022 21:53:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9F1AF80529; Fri, 25 Feb 2022 21:52:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F1F0F80533
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 21:52:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F1F0F80533
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="b1rWa+dY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645822368; x=1677358368;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VO2b7mZp1MmZe9GUeYmWjagvBg37++qhmnrAYwGd0mc=;
 b=b1rWa+dY0JPL5+0Y3A7tle1T/T2r5F97CWigyvngl+4hQl8SMVB7FcYd
 y7p3YKTxNgRDCu9DrdX4LJiwWYt7YKDFAK1L7oWaVwbMoC52Fx5t0jhUF
 y3kBraQYSzMx/FYIMAOegWfg4vxyBi2xPV1R295YFG2RheqsKMq9IFm+c
 d39sbo/jfRha1ohmNlALwc5/gRmecOHczRqVKCYTU3z8FNSAhJkOypCYW
 ryuZ2Ue9ibN7qsOtLjziT4l++eP4VYmOdv+iyhJXUpuClwo8tt3i1JnnT
 rSceMRLM8yZlUoNTc02WsmzCxBwrwwTbgs82Sk1Jnq/iK6fSw0kE/aAcG w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="313296150"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="313296150"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 12:52:46 -0800
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="777520609"
Received: from nnwogbe-mobl1.amr.corp.intel.com (HELO [10.212.101.231])
 ([10.212.101.231])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 12:52:46 -0800
Message-ID: <e33d7adf-3a99-c82c-c380-f65344e7cdbb@linux.intel.com>
Date: Fri, 25 Feb 2022 14:44:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 07/17] ASoC: Intel: avs: Add module management requests
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
 <20220207122108.3780926-8-cezary.rojewski@intel.com>
 <e63ad06a-a583-b9f0-de00-644cbe389888@linux.intel.com>
 <d44240ee-822e-51ed-6aed-957ac9e6bf91@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <d44240ee-822e-51ed-6aed-957ac9e6bf91@intel.com>
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



On 2/25/22 12:50, Cezary Rojewski wrote:
> On 2022-02-25 2:27 AM, Pierre-Louis Bossart wrote:
>>> +int avs_ipc_init_instance(struct avs_dev *adev, u16 module_id, u8
>>> instance_id,
>>> +              u8 ppl_id, u8 core_id, u8 domain,
>>
>> you should explain the relationship between ppl_id and core_id. It seems
>> that in the same pipeline different modules instances can be pegged to
>> different cores, which isn't very intuitive given the previous
>> explanation that a pipeline is a scheduling unit.
>>
>> The domain as a u8 is not very clear either, I was under the impression
>> there were only two domains (LL and EDF)?
> 
> 
> Hmm.. such explanations are supposed to be part of HW or FW
> specifications. I don't believe kernel is a place for that. Fields found

how do you expect people with no access to those specs to understand
this code then?

You have to describe the concepts in vague-enough terms that someone
familiar with DSPs can understand.

> here are needed to provide all the necessary information firmware
> expects when requesting INIT_INSTANCE. What's possible and how's
> everything handled internally is for firmware to decide and explain.
> There are no if-statements in the driver's code that force
> ppl_id/core_id relation so I don't see why reader would get an
> impression there is some dependency. What's in the topology gets routed
> to firmware with help of above function.
> 
> Just to confirm: yes, you can have multiple cores engaged in servicing
> modules found in single pipelines.
> 
> In regard to field name/sizes: again, these match firmware equivalents
> 1:1 so it's easy to switch back and forth.

add comments then.

> 
>>> +              void *param, u32 param_size)
>>> +{
>>> +    union avs_module_msg msg = AVS_MODULE_REQUEST(INIT_INSTANCE);
>>> +    struct avs_ipc_msg request;
>>> +    int ret;
>>> +
>>> +    msg.module_id = module_id;
>>> +    msg.instance_id = instance_id;
>>> +    /* firmware expects size provided in dwords */
>>> +    msg.ext.init_instance.param_block_size =
>>> +            DIV_ROUND_UP(param_size, sizeof(u32));
>>> +    msg.ext.init_instance.ppl_instance_id = ppl_id;
>>> +    msg.ext.init_instance.core_id = core_id;
>>> +    msg.ext.init_instance.proc_domain = domain;
>>> +
>>> +    request.header = msg.val;
>>> +    request.data = param;
>>> +    request.size = param_size;
>>
>> isn't there a need to check if the module can be initialized? there's
>> got to be some dependency on pipeline state?
> 
> 
> IPC handlers found in message.c have one and only one purpose only: send
> a message. Firmware will return an error if arguments passed are invalid.
> 
> Also, note that ALSA/ASoC already have a working state machine for
> streaming. There is no reason to re-implement it here.

add a comment then.

> 
>>> +
>>> +    ret = avs_dsp_send_msg(adev, &request, NULL);
>>> +    if (ret)
>>> +        avs_ipc_err(adev, &request, "init instance", ret);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +int avs_ipc_delete_instance(struct avs_dev *adev, u16 module_id, u8
>>> instance_id)
>>> +{
>>> +    union avs_module_msg msg = AVS_MODULE_REQUEST(DELETE_INSTANCE);
>>> +    struct avs_ipc_msg request = {0};
>>> +    int ret;
>>> +
>>> +    msg.module_id = module_id;
>>> +    msg.instance_id = instance_id;
>>> +    request.header = msg.val;
>>> +
>>> +    ret = avs_dsp_send_msg(adev, &request, NULL);
>>> +    if (ret)
>>> +        avs_ipc_err(adev, &request, "delete instance", ret);
>>> +
>>> +    return ret;
>>
>> same here, can this be used in any pipeline state?
> 
> 
> Ditto.
> 
>>> +}
>>> +
>>> +int avs_ipc_bind(struct avs_dev *adev, u16 module_id, u8 instance_id,
>>> +         u16 dst_module_id, u8 dst_instance_id,
>>> +         u8 dst_queue, u8 src_queue)
>>
>> what does a queue represent?
> 
> 
> In firmware's nomenclature pin/index/queue are synonyms when speaking
> about module instances.

well, that's worthy of a comment...

> 
>>> +{
>>> +    union avs_module_msg msg = AVS_MODULE_REQUEST(BIND);
>>> +    struct avs_ipc_msg request = {0};
>>> +    int ret;
>>> +
>>> +    msg.module_id = module_id;
>>> +    msg.instance_id = instance_id;
>>> +    msg.ext.bind_unbind.dst_module_id = dst_module_id;
>>> +    msg.ext.bind_unbind.dst_instance_id = dst_instance_id;
>>> +    msg.ext.bind_unbind.dst_queue = dst_queue;
>>> +    msg.ext.bind_unbind.src_queue = src_queue;
>>> +    request.header = msg.val;
>>> +
>>> +    ret = avs_dsp_send_msg(adev, &request, NULL);
>>> +    if (ret)
>>> +        avs_ipc_err(adev, &request, "bind modules", ret);
>>> +
>>> +    return ret;
>>> +}

