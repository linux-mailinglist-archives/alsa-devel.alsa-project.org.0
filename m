Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DC14CDD0E
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 19:58:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 559661E7F;
	Fri,  4 Mar 2022 19:57:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 559661E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646420305;
	bh=CanmrYx0gIKI2ZjWXu8YbnZHqsyurgXB+77JJ0oD/sk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OtcojyqEIloCbIF83LiN0Wv4fN+wVR19Tc2bzhsA8mHve6ZNzJ5wR9zMR04GtS15V
	 xWseo2WAODBisJrQKOUkqAWc1sD08ZaCz4CtQjVa8x82P96GMb5VX9PCxMyLunHafg
	 dK1yFpfOFgEh3eKqHN/wbxP/2gFJb4VBLitwsL8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B78ADF800F0;
	Fri,  4 Mar 2022 19:57:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 292DEF800F0; Fri,  4 Mar 2022 19:57:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAAD7F800F0
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 19:57:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAAD7F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IAq3Io1i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646420233; x=1677956233;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CanmrYx0gIKI2ZjWXu8YbnZHqsyurgXB+77JJ0oD/sk=;
 b=IAq3Io1iPkfXV8avVDe6e1KqP55lFxPawBczGyFBZxcoX0HC8HFqw4ir
 cTAzLhklnEPM+6pwaoTm9WEhokix/xVPzd6ftiUcuAwaBXtiGFEVYKDMR
 2PMObOwiEf6Imk4ftLOQczaiCATHGSdVd/D2fFgTeQtAVdhLGc4VkAgFr
 b6u+b70zPvSWrvXYUoRUqW4aqiM3qa42+coKwsQA6Qfm2cEOXIILojD7I
 o344/p56bX7F9B2u3x2FOx+ztwTCwzv4U7a0LScxlXS9SZApwhXDP/xUd
 QymAdZ/jQnfugeag15o0uM3J/kNQq/fLf65bcY3B3V24ZqRly40XyqZAH g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="253974828"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="253974828"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 10:56:46 -0800
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="642599590"
Received: from padmashr-mobl.amr.corp.intel.com (HELO [10.251.24.125])
 ([10.251.24.125])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 10:56:45 -0800
Message-ID: <c4901de1-9db4-d771-3218-d6dea3d38cbd@linux.intel.com>
Date: Fri, 4 Mar 2022 12:56:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v3 17/17] ASoC: Intel: avs: Code loading over HDA
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-18-cezary.rojewski@intel.com>
 <2b75e00683d7f7c33ecdf78a9889748aeb50555a.camel@linux.intel.com>
 <9d8381af-aa03-743f-7ed6-93dfc18e5a54@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <9d8381af-aa03-743f-7ed6-93dfc18e5a54@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


>>> Compared to SKL and KBL, younger cAVS platforms are meant to re-use
>>> one
>> Younger? you mean newer?
> 
> 
> Isn't the meaning of the two quite similar in this context?

younger doesn't sound quite right to me.

'cAVS platforms more recent that SKL and KBL...'

> 
>>> of HDAudio streams during boot procedure causing CLDMA to become
>>> obsolete. Once transferred, given stream is returned to pool
>>> available
>>> for audio streaming.
>>>
>>> Module loading handler is dummy as library and module code became
>>> inseparable in later firmware generations.
>> replace dummy with "stub" maybe? lets use inclusive terms
> 
> 
> Is 'dummy' categorized as non-inclusive? We have several usages of 
> 'dummy' even within /sound (e.g. soc-utils.c).

Intel and plenty of other companies recommend a different wording. 
mock-up, stub, placeholder, etc. see e.g.

https://developers.google.com/style/inclusive-documentation

Yes we have plenty of existing uses of 'dummy', but that doesn't mean we 
should add new ones.

>>> +static int
>>> +avs_hda_init_rom(struct avs_dev *adev, unsigned int dma_id, bool
>>> purge)
>>> +{
>>> +    const struct avs_spec *const spec = adev->spec;
>>> +    unsigned int corex_mask, reg;
>>> +    int ret;
>>> +
>>> +    corex_mask = spec->core_init_mask & ~AVS_MAIN_CORE_MASK;
>>> +
>>> +    ret = avs_dsp_op(adev, power, spec->core_init_mask, true);
>>> +    if (ret < 0)
>>> +        goto err;
>>> +
>>> +    ret = avs_dsp_op(adev, reset, AVS_MAIN_CORE_MASK, false);
>>> +    if (ret < 0)
>>> +        goto err;
>>> +
>>> +    reinit_completion(&adev->fw_ready);
>>> +    avs_dsp_op(adev, int_control, true);
>>> +
>>> +    /* set boot config */
>>> +    ret = avs_ipc_set_boot_config(adev, dma_id, purge);
>>> +    if (ret) {
>>> +        ret = AVS_IPC_RET(ret);
>>> +        goto err;
>>> +    }
>>> +
>>> +    /* await ROM init */
>>> +    ret = snd_hdac_adsp_readq_poll(adev, spec->rom_status, reg,
>>> +                       (reg & 0xF) == AVS_ROM_INIT_DONE
>>> ||
>>> +                       (reg & 0xF) ==
>>> APL_ROM_FW_ENTERED,
>>> +                       AVS_ROM_INIT_POLLING_US,
>>> APL_ROM_INIT_TIMEOUT_US);
>>> +    if (ret < 0) {
>>> +        dev_err(adev->dev, "rom init timeout: %d\n", ret);
>>> +        goto err;
>>> +    }
>>> +
>>> +    /* power down non-main cores */
>>> +    if (corex_mask)
>>> +        avs_dsp_op(adev, power, corex_mask, false);
>> What if this fails?
> 
> 
> We are still in happy path, worst thing could happen here is increased 
> power consumption.

'happy path'?

