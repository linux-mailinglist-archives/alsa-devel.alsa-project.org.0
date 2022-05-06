Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B00F51DBE9
	for <lists+alsa-devel@lfdr.de>; Fri,  6 May 2022 17:26:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDC4D851;
	Fri,  6 May 2022 17:25:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDC4D851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651850800;
	bh=iXwFW45ra1lnsKJfUAWfwcojGdVIVywlkUdHJb5vR+g=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tU85KYqHXYgAP+yOwU9Brx/cqW3b7oymwaK6RyFqBpbjd49h/Q65Beun6Rw9Oe23+
	 /ZmG4aSAESGx63AQZrEiq6lJBnmCJmOxYUpgnlrvIBGG5VwSp7oLuWx9BSZGYBvsQ2
	 YrZ9pv/eMg41m+fqe1GZ+M1hTPq+EAbTkHRxNB7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E3CCF80171;
	Fri,  6 May 2022 17:25:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 075EFF8014B; Fri,  6 May 2022 17:25:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EB61F800E3
 for <alsa-devel@alsa-project.org>; Fri,  6 May 2022 17:25:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EB61F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CynO3poD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651850737; x=1683386737;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iXwFW45ra1lnsKJfUAWfwcojGdVIVywlkUdHJb5vR+g=;
 b=CynO3poDH3XZjxOguHun01SW3nROXOiz9RpcABHK3rq0NMHuLVvVGcY4
 W/TR3gVaU2aZFElgiEoMnhDF6b2Lfn4D6iTXhozjW4WeGkgr4cTmvuujY
 Ylk6/AxX2dCfa9lXvaUZVcuHWz6nrUFVv/FzCSh1ZrSJIktZrAiLtzTjH
 nUvZhmjxAwcByLfFdPzHEIJ6pZoUwjDsskjAdasXQVP5UUrRv3Z+hJ5Qp
 vty/zcG8IfM7GbA1NFCKgm92rcu/zqtc6AiuqYtW9rv6H13SIcWMFGveS
 vETwTPZNhqiNLZFf2X5PrYmeB3J3h/wqzTOgFCRj4xKserMjjh5cW+qOD w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="250496996"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="250496996"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 08:25:32 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="537930769"
Received: from pmaziarx-mobl1.ger.corp.intel.com (HELO [10.99.249.10])
 ([10.99.249.10])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 08:25:28 -0700
Message-ID: <f14701db-94fa-ba3f-87fc-dc91177abff7@linux.intel.com>
Date: Fri, 6 May 2022 17:25:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 01/14] ASoC: Intel: avs: Account for libraries when
 booting basefw
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, broonie@kernel.org
References: <20220426172346.3508411-1-cezary.rojewski@intel.com>
 <20220426172346.3508411-2-cezary.rojewski@intel.com>
 <9854d2e1-63da-2377-3fd1-120adfb4d381@linux.intel.com>
 <4ba8b812-2b67-5dd4-2774-f7a94e2d3cc1@intel.com>
From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
In-Reply-To: <4ba8b812-2b67-5dd4-2774-f7a94e2d3cc1@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 2022-05-01 11:45, Cezary Rojewski wrote:
> On 2022-04-26 11:21 PM, Pierre-Louis Bossart wrote:
>> On 4/26/22 12:23, Cezary Rojewski wrote:
>
> ...
>
>>> diff --git a/sound/soc/intel/avs/loader.c 
>>> b/sound/soc/intel/avs/loader.c
>>> index c47f85161d95..de98f4c3adf8 100644
>>> --- a/sound/soc/intel/avs/loader.c
>>> +++ b/sound/soc/intel/avs/loader.c
>>> @@ -15,6 +15,7 @@
>>>   #include "cldma.h"
>>>   #include "messages.h"
>>>   #include "registers.h"
>>> +#include "topology.h"
>>>     #define AVS_ROM_STS_MASK        0xFF
>>>   #define AVS_ROM_INIT_DONE        0x1
>>> @@ -466,6 +467,70 @@ int avs_hda_transfer_modules(struct avs_dev 
>>> *adev, bool load,
>>>       return 0;
>>>   }
>>>   +int avs_dsp_load_libraries(struct avs_dev *adev, struct 
>>> avs_tplg_library *libs, u32 num_libs)
>>> +{
>>> +    int start, id, i = 0;
>>> +    int ret;
>>> +
>>> +    /* Calculate the id to assign for the next lib. */
>>> +    for (id = 0; id < adev->fw_cfg.max_libs_count; id++)
>>> +        if (adev->lib_names[id][0] == '\0')
>>> +            break;
>>> +    if (id + num_libs >= adev->fw_cfg.max_libs_count)
>>> +        return -EINVAL;
>>
>> use ida_alloc_max() ?
>
>
> After reading this one couple of times I'm keen to agree that IDA 
> should have been used for library ID allocation and a at the same 
> time, surprised it has't done that already. Till now we used IDA 
> 'only' when allocating pipeline IDs and module instance IDs. Pipeline 
> allocation is good comparison here - makes use of ida_alloc_max() 
> already - library one should follow.
>
> This finding is much appreciated, Pierre.

I think that using ida here is a bit of an overkill. Ida works fine when 
there can be both id allocation and freeing and that's how it work with 
pipelines and modules IDs in avs. However there is no mechanism for 
unloading libraries in cAVS firmware, therefore ida would be used here 
only to increase the ID, so it needlessly complicates the code while not 
giving much of a benefit. Also our approach to check if we can load all 
libraries before the loop makes it problematic with ida because we would 
need to allocate an id at start and calculate if all libs would fit and 
then either free it instantly or complicate the loop to use id allocated 
before. Therefore I suggest to leave this code unchanged. I've synced 
with Cezary on this and provided explanation convinced him too.

>
>>> +
>>> +    start = id;
>>> +    while (i < num_libs) {
>>> +        struct avs_fw_manifest *man;
>>> +        const struct firmware *fw;
>>> +        struct firmware stripped_fw;
>>> +        char *filename;
>>> +        int j;
>>> +
>>> +        filename = kasprintf(GFP_KERNEL, "%s/%s/%s", AVS_ROOT_DIR, 
>>> adev->spec->name,
>>> +                     libs[i].name);
>>> +        if (!filename)
>>> +            return -ENOMEM;
>>> +
>>> +        ret = avs_request_firmware(adev, &fw, filename);
>>> +        kfree(filename);
>>> +        if (ret < 0)
>>> +            return ret;
>>> +
>>> +        stripped_fw = *fw;
>>> +        ret = avs_fw_manifest_strip_verify(adev, &stripped_fw, NULL);
>>> +        if (ret) {
>>> +            dev_err(adev->dev, "invalid library data: %d\n", ret);
>>> +            goto release_fw;
>>> +        }
>>> +
>>> +        ret = avs_fw_manifest_offset(&stripped_fw);
>>> +        if (ret < 0)
>>> +            goto release_fw;
>>> +        man = (struct avs_fw_manifest *)(stripped_fw.data + ret);
>>> +
>>> +        /* Don't load anything that's already in DSP memory. */
>>> +        for (j = 0; j < id; j++)
>>> +            if (!strncmp(adev->lib_names[j], man->name, 
>>> AVS_LIB_NAME_SIZE))
>>> +                goto next_lib;
>>> +
>>> +        ret = avs_dsp_op(adev, load_lib, &stripped_fw, id);
>>> +        if (ret)
>>> +            goto release_fw;
>>> +
>>> +        strncpy(adev->lib_names[id], man->name, AVS_LIB_NAME_SIZE);
>>> +        id++;
>>> +next_lib:
>>> +        i++;
>>> +    }
>>> +
>>> +    return start == id ? 1 : 0;
>>> +
>>> +release_fw:
>>> +    avs_release_last_firmware(adev);
>>
>> why release only the last library and not all the ones that were 
>> previous loaded?
>> or why bother to even release the last since at this point you 
>> probably need to restart completely?
>
>
> Yes, avs_release_last_firmware() is used to clean 'locally' and 
> indeed, failing to load a library will most likely end-up is complete 
> restart.
>
> I'll provide an internal build with this part removed and have 
> validation do some testing first as performing 
> avs_release_last_firmware() keeps things sane i.e. no invalid entries 
> in the ->fw_list, no unnecessarily occupied memory for the already 
> invalid entry and such.
>
> In regard to *why is only last one released*, it's tied to how base 
> firmware behaves. Assuming a scenario where two libraries need to be 
> loaded, if the loading procedure for the second fails, base firmware 
> will NOT unload/unmap allocated memory and resources for the first 
> one. At the same time, there is no capability to unload library on 
> demand. In order to rollback the transaction, DSP has to be shut down 
> entirely, just like if we were talking about firmware exception or IPC 
> timeout.
>
> So, by doing what we do here, driver reflects firmware side 
> (MODULES_INFO) basically 1:1.
>
> Another good one, Pierre.
>
>>> +    return ret;
>>> +}
