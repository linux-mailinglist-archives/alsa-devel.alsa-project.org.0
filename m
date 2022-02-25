Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2634C503F
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 21:58:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 148171FCD;
	Fri, 25 Feb 2022 21:57:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 148171FCD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645822680;
	bh=lKo7nfI5LGCpObRJF0V4PcskLJO4y5rSqkL8ektw6t4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fRohjxCYaDTsXHEJPiY6rlPU8LGbeMlkOuZE7ThYyOHpeADKrfu+tdt5jptRl4hHD
	 UKw2uCqlLFkXU26xHx5BPskmMsWUmL9wt63ca6F7WQNh8kNs8gg0o6q5z6kY64WqKG
	 e8J9yRngFalli7OzdbTTIymHlEHqeBPX+h5ONCYU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 837D9F8056F;
	Fri, 25 Feb 2022 21:53:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED8A7F80533; Fri, 25 Feb 2022 21:52:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 642D8F80526
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 21:52:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 642D8F80526
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Z5DTHaxi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645822370; x=1677358370;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lKo7nfI5LGCpObRJF0V4PcskLJO4y5rSqkL8ektw6t4=;
 b=Z5DTHaxiP5sQ0UY0FpJs1tRNY6TwXAHb9u+GXDPcr1gMqbjVjLfR6n1q
 TMn36AD8mJMNY027/dQZvlaONdZBgYG134iXcaNNHllDraD8CXIMvwCuZ
 jlZ+uVSq2UdGYWh8aRUizC/mkyUwgAGExFX1Z7x6akc1a7J45NhVI9AFl
 OCVUjGjVMJEb3520WRBEWGX3gDIMMhh9VjG/PFZzzrp1snVsfqL67ScX5
 N67A3hOzBSwAdn9Ff/8ljcjhBYCCPd9K4jZkfJNUyPfu0rAIpWdpaDv7I
 RaUbmuC1aPOlNrOk0mvnrOBWiW5WyHTPDvfZiGVvBi/e8UdBSUtA09FFZ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="313296155"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="313296155"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 12:52:48 -0800
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="777520627"
Received: from nnwogbe-mobl1.amr.corp.intel.com (HELO [10.212.101.231])
 ([10.212.101.231])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 12:52:48 -0800
Message-ID: <da68f26b-fb7b-a8d6-ea91-b05ce3a41701@linux.intel.com>
Date: Fri, 25 Feb 2022 14:46:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 08/17] ASoC: Intel: avs: Add power management requests
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
 <20220207122108.3780926-9-cezary.rojewski@intel.com>
 <24125d33-bcb6-050b-88fb-6b2ef549fbad@linux.intel.com>
 <b24a4d37-6eac-0cae-b1e1-cf26a8fff5ec@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <b24a4d37-6eac-0cae-b1e1-cf26a8fff5ec@intel.com>
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


> 
>>> +    msg.ext.set_d0ix.wake = enable_pg;
>>
>> simplify the argument? Not sure anyone could understand what wake and
>> enable_pg mean.
> 
> 
> Well, CG and PG are popular shortcuts among Intel audio team and stand
> for clock gating and power gating respectively. 'wake' is firmware
> specific. I can provide a comment, but not all question are going to be
> answered by it. Firmware specification is the place to find the answer
> for most of these.

again please do not assume that anyone reviewing this code has access to
the firmware specification.

> 
>> int avs_ipc_set_d0ix(struct avs_dev *adev, bool wake, bool streaming)
>>
>>> +    msg.ext.set_d0ix.streaming = streaming;
>>> +
>>> +    request.header = msg.val;
>>> +
>>> +    ret = avs_dsp_send_pm_msg(adev, &request, NULL, false);
>>> +    if (ret)
>>> +        avs_ipc_err(adev, &request, "set d0ix", ret);
>>> +
>>> +    return ret;
>>> +}
>>> diff --git a/sound/soc/intel/avs/messages.h
>>> b/sound/soc/intel/avs/messages.h
>>> index 1dabd1005327..bbdba4631b1f 100644
>>> --- a/sound/soc/intel/avs/messages.h
>>> +++ b/sound/soc/intel/avs/messages.h
>>> @@ -101,6 +101,8 @@ enum avs_module_msg_type {
>>>       AVS_MOD_LARGE_CONFIG_SET = 4,
>>>       AVS_MOD_BIND = 5,
>>>       AVS_MOD_UNBIND = 6,
>>> +    AVS_MOD_SET_DX = 7,
>>> +    AVS_MOD_SET_D0IX = 8,
>>>       AVS_MOD_DELETE_INSTANCE = 11,
>>>   };
>>>   @@ -137,6 +139,11 @@ union avs_module_msg {
>>>                   u32 dst_queue:3;
>>>                   u32 src_queue:3;
>>>               } bind_unbind;
>>> +            struct {
>>> +                /* cAVS < 2.0 */
>>> +                u32 wake:1;
>>> +                u32 streaming:1;
>>
>> you probably want to explain how a 'streaming' flag is set at the module
>> level? One would think all modules connected in a pipeline would need to
>> use the same flag value.
> 
> 
> Some of the fields are confusing and I agree, but driver has to adhere
> to FW expectations if it wants to be a working one. I would like to
> avoid judging the firmware architecture here, regardless of how
> confusing we think it is.

it's not about judging, just explaining what is expected on the firmware
side and what the driver needs to do.

> 
> 'wake' and 'streaming' fields are part of SET_D0ix message is which part
> of MODULE-type message interface. Base firmware is, from architecture
> point of view, a module of type=0 (module_id) and instance id=0
> (instance_id).
> 
>>> +            } set_d0ix;
>>>           } ext;
>>>       };
>>>   } __packed;
>>> @@ -298,4 +305,13 @@ int avs_ipc_get_large_config(struct avs_dev
>>> *adev, u16 module_id, u8 instance_id
>>>                    u8 param_id, u8 *request_data, size_t request_size,
>>>                    u8 **reply_data, size_t *reply_size);
>>>   +/* DSP cores and domains power management messages */
>>> +struct avs_dxstate_info {
>>> +    u32 core_mask;
>>> +    u32 dx_mask;
>>
>> what is the convention for D0 and D3 in the mask ? which one is 0 or 1?
>>
>> Is this also handled in a hierarchical way where only the bits set in
>> core_mask matter?
> 
> 
> Can provide a short kernel-doc for these two, sure.
