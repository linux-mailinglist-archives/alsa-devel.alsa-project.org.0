Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF3E4BA67B
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Feb 2022 17:58:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2390A1925;
	Thu, 17 Feb 2022 17:57:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2390A1925
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645117111;
	bh=JKdF2EclpNA26WuIFliOnCyn7NalNe0ki0eY5vSfC5Y=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R6bfsdCvHcW7bwldrJ+swNTagIMIlKrVSy0MZZjukbNislEW+K5WFbLsOZ/L0lhFN
	 qrBU+UINRmOpA4o4b0YpS4IuuF5OS8IwLc9SAYyOWidEM9ODwGEzrRsPopcZ0PlISG
	 mnL0M/8mCtgDIum6qZOhJYIbKuO1h+urx/hBY9w0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89970F8023B;
	Thu, 17 Feb 2022 17:57:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C52BF800C0; Thu, 17 Feb 2022 17:57:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C4C0F800CE;
 Thu, 17 Feb 2022 17:57:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C4C0F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="dW28/jCD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645117038; x=1676653038;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JKdF2EclpNA26WuIFliOnCyn7NalNe0ki0eY5vSfC5Y=;
 b=dW28/jCDw5y0X9cVKm6XbE3w9Dn2iQXq4Gri23edpJ3C4t8F8uGRcZxu
 +DxxOMgEmkfzVT8nOvFpDu1zaTKRkVRxVUdfAr9abWKoTxZ1tZWB83VC6
 xMGO/eZTT/pmuWVYrkvN/N9+HjtPbudYfsB18xon6W+W21/rOw36i3s+f
 5scXrQYRWSOUTZfxx6/aufu67ev0MlvzMNtyvpD9pWotWoTQxSx9ZFjbG
 +KYRUmAEhqdQGsH6kXdkGBHU8dZiAqx3UdKkvVJnSc36/H+5f8lJ9lPC1
 2fFRyhDWY64hEYrpKKGgnp5i6Y3HVUIHMth8Z88LurOIKfUsqsO53Oyo7 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="249753129"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="249753129"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 08:57:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="626135809"
Received: from mnagi-mobl.amr.corp.intel.com (HELO [10.212.55.230])
 ([10.212.55.230])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 08:57:11 -0800
Message-ID: <75ab6118-6ddd-5ef6-0a12-1d2fd0253f68@linux.intel.com>
Date: Thu, 17 Feb 2022 10:57:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH] ASoC: SOF: Replace zero-length array with flexible-array
 member
Content-Language: en-US
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Stephen Kitt <steve@sk2.org>
References: <20220217132755.1786130-1-steve@sk2.org>
 <20220217164458.GA932472@embeddedor>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220217164458.GA932472@embeddedor>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, linux-hardening@vger.kernel.org,
 Daniel Baluta <daniel.baluta@nxp.com>, sound-open-firmware@alsa-project.org
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



On 2/17/22 10:44, Gustavo A. R. Silva wrote:
> On Thu, Feb 17, 2022 at 02:27:55PM +0100, Stephen Kitt wrote:
>> There is a regular need in the kernel to provide a way to declare having
>> a dynamically sized set of trailing elements in a structure. Kernel code
>> should always use "flexible array members"[1] for these cases. The older
>> style of one-element or zero-length arrays should no longer be used[2].
>>
>> This helps with the ongoing efforts to globally enable -Warray-bounds
>> and get us closer to being able to tighten the FORTIFY_SOURCE routines
>> on memcpy().
>>
>> [1] https://en.wikipedia.org/wiki/Flexible_array_member
>> [2] https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays
>>
>> Link: https://github.com/KSPP/linux/issues/78
>> Link: https://github.com/KSPP/linux/issues/180
>> Suggested-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>> Signed-off-by: Stephen Kitt <steve@sk2.org>
> 
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks for the patch

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

I just realized we have additional cases in this directory (interface
between kernel and firmware), I'll send a follow-up patch a

channel_map.h:  int32_t ch_coeffs[0];
channel_map.h:  struct sof_ipc_channel_map ch_map[0];
control.h:              struct sof_ipc_ctrl_value_chan chanv[0];
control.h:              struct sof_ipc_ctrl_value_comp compv[0];
control.h:              struct sof_abi_hdr data[0];
control.h:              struct sof_abi_hdr data[0];

> 
> Thanks!
> --
> Gustavo
> 
>> ---
>>  include/sound/sof/topology.h | 2 +-
>>  sound/soc/sof/topology.c     | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/sound/sof/topology.h b/include/sound/sof/topology.h
>> index d12736e14b69..adee6afd1490 100644
>> --- a/include/sound/sof/topology.h
>> +++ b/include/sound/sof/topology.h
>> @@ -237,7 +237,7 @@ struct sof_ipc_comp_process {
>>  	/* reserved for future use */
>>  	uint32_t reserved[7];
>>  
>> -	uint8_t data[0];
>> +	uint8_t data[];
>>  } __packed;
>>  
>>  /* frees components, buffers and pipelines
>> diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
>> index e72dcae5e7ee..1d119d1dd69d 100644
>> --- a/sound/soc/sof/topology.c
>> +++ b/sound/soc/sof/topology.c
>> @@ -2164,7 +2164,7 @@ static int sof_process_load(struct snd_soc_component *scomp, int index,
>>  	 */
>>  	if (ipc_data_size) {
>>  		for (i = 0; i < widget->num_kcontrols; i++) {
>> -			memcpy(&process->data + offset,
>> +			memcpy(&process->data[offset],
>>  			       wdata[i].pdata->data,
>>  			       wdata[i].pdata->size);
>>  			offset += wdata[i].pdata->size;
>>
>> base-commit: f71077a4d84bbe8c7b91b7db7c4ef815755ac5e3
>> -- 
>> 2.27.0
>>
