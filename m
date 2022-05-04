Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DACFF519DF0
	for <lists+alsa-devel@lfdr.de>; Wed,  4 May 2022 13:26:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79C1882B;
	Wed,  4 May 2022 13:25:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79C1882B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651663605;
	bh=kFnaluCm5IF1S4wi/SepH6N7bdF2ZYsO9NFKJMYAaGA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nTt1flj/nnI9HTjX/VLqsHDih/v8pWN9fIFe9IztTQcn6iHWi4GT286hzka28XVTx
	 koUl9iGKVmXGDItKCLHko/Ax3ssorklV5ViezTIkIYp2A8sur3Y7yQCEjd8UmO/Ry7
	 tqgdjr9ax0XZhr5yDiaHUPHQB1DrUjXLrLkqAXNE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DEF52F80166;
	Wed,  4 May 2022 13:25:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 858D0F80163; Wed,  4 May 2022 13:25:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF90AF800D3
 for <alsa-devel@alsa-project.org>; Wed,  4 May 2022 13:25:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF90AF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XkHLZzqJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651663543; x=1683199543;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=kFnaluCm5IF1S4wi/SepH6N7bdF2ZYsO9NFKJMYAaGA=;
 b=XkHLZzqJVVPQeqxggtBCFaMmOE3CailNA6ufl+eylajhm+B05h5mb9er
 GzTOGcshLt50hQ8eyKU+6aqPsHERfxH4t10cE1PD4QEXNHz/nrOsDOA8v
 tt/4N11WN/JkKAYL1h73Ihmmo1ghw5ZgiN5s5PL1iEqrxPCCdMQ6UQCG9
 rQNey6gaNBw0er9t1Ie1o2jAcAo7AaTKFFMSbARIgKPn/2mCOBxND6dx6
 CC5qtUWVDTHY9kQWjSezCCVH/f2HJN2ivdRKwKMUfReik5bx3xrXeDBAV
 OnvFj8oSDRSc4sqO2SWUVbPz5KGhCnw2EA2leX+9wbwsmvxHXso3ayZ/f g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="266582291"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="266582291"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 04:25:39 -0700
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="708435887"
Received: from bstach-mobl1.ger.corp.intel.com (HELO [10.251.219.140])
 ([10.251.219.140])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 04:25:38 -0700
Message-ID: <59d4c344-1013-f3ce-f8c8-097520ca1f5a@linux.intel.com>
Date: Wed, 4 May 2022 14:26:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 10/14] ASoC: Intel: avs: Machine board registration
Content-Language: en-US
To: alsa-devel@alsa-project.org
References: <20220426172346.3508411-1-cezary.rojewski@intel.com>
 <20220426172346.3508411-11-cezary.rojewski@intel.com>
 <2cda9e60-483b-6866-7ad5-787e43c25824@linux.intel.com>
 <f1607df1-a8de-f26c-fbdb-be4bfba899eb@intel.com>
 <26235767-cc5a-8f9b-b0f9-f48fc4a082b8@linux.intel.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <26235767-cc5a-8f9b-b0f9-f48fc4a082b8@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 04/05/2022 12:41, Amadeusz Sławiński wrote:
> On 4/29/2022 4:01 PM, Cezary Rojewski wrote:
>>>> +#define AVS_SSP(x)        (BIT(x))
>>>> +#define AVS_SSP_RANGE(a, b)    (GENMASK(b, a))
>>>> +
>>>> +/* supported I2S board codec configurations */
>>>> +static struct snd_soc_acpi_mach avs_skl_i2s_machines[] = {
>>>> +    {
>>>> +        .id = "INT343A",
>>>> +        .drv_name = "avs_rt286",
>>>> +        .link_mask = AVS_SSP(0),
>>>
>>> I've told this before, 'link_mask' was introduced for *SoundWire*.
>>> Please do not overload existing concepts and use this instead:
>>>
>>> @i2s_link_mask: I2S/TDM links enabled on the board
>>
>>
>> Noooo :( Sad panda is sad.
>>
>> 'link_mask' is such a wonderful name as it matches naming used in our
>> specs - which call BE side 'LINK'.
>>
>> If it's a must then yes, we will resign from using 'link_mask'.
>>
> 
> I'll just note that header kernel doc for link_mask says:
> " * @link_mask: describes required board layout, e.g. for SoundWire."
> I would say there is no assumption that it is SDW only, so we could also
> argue that if it is it should be named sdw_link_mask and comment be
> fixed to remove "e.g." ;)

In mainline kernel it is (as of 5.18.0-rc5):
/**
 * snd_soc_acpi_mach_params: interface for machine driver configuration
 *
 * @acpi_ipc_irq_index: used for BYT-CR detection
 * @platform: string used for HDAudio codec support
 * @codec_mask: used for HDAudio support
 * @dmic_num: number of SoC- or chipset-attached PDM digital microphones
 * @common_hdmi_codec_drv: use commom HDAudio HDMI codec driver
 * @link_mask: SoundWire links enabled on the board
 * @links: array of SoundWire link _ADR descriptors, null terminated
 * @i2s_link_mask: I2S/TDM links enabled on the board
 * @num_dai_drivers: number of elements in @dai_drivers
 * @dai_drivers: pointer to dai_drivers, used e.g. in nocodec mode
 */

link_mask is for SDW
i2s_link_mask is for I2S

It might be nicer to prefix the bare link_mask with sdw, it might
happen, but the comment is pretty explicit. I would not dare to use
link_mask for DMIC for example...

-- 
Péter
