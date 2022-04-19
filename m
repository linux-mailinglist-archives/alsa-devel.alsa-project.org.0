Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C00506B74
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 13:50:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C45F17D3;
	Tue, 19 Apr 2022 13:50:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C45F17D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650369058;
	bh=l8UmgJxPNDwA0AvUV3IPD9zlRZFfFn6VJApDgAd5lRk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fx2x57KBj6q5vkz64mnA2g2z4htQdQ747SkS/nHDjVRRfTK8+0UxysTtDglnkirzE
	 GLB9t8yR6fGziSMKrVJSWP74Aphj3AkI+2sv0GRGJ0REXufeTncbIxehypeTKxQXDb
	 DUnltyHlkDciZE0JGM/PgOwhIzf4csfh7t10MuyA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6DF9F80121;
	Tue, 19 Apr 2022 13:50:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A064FF80237; Tue, 19 Apr 2022 13:49:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E093CF80116;
 Tue, 19 Apr 2022 13:49:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E093CF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TqDITSm8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650368996; x=1681904996;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=l8UmgJxPNDwA0AvUV3IPD9zlRZFfFn6VJApDgAd5lRk=;
 b=TqDITSm88Eg4+ExKCy5rX2G9HB+RNKv9T4d/2t5agbkgVQ+Zuue4eX/p
 MefLWat6K4zxe7S8czzQ7KVZow4EqRz6jglzQCShPFt0JfVulMb8WjEUy
 XilZjJya0YR9xaG+eTfcMBNRtwssxXpFa6lV3ep8rXxam39Z20ccjb/IX
 plLSA3wjGZJ7EukGxIHxWkuPjYHn9F0KDrsDNwj8dZ+Zz324C/odB9IS7
 jtTc7yS6GIdJ8OBa8I64e7EScggVN97MfDgcs2Emtf2obqm8prb4Tmdvp
 g6w6YswVQ7TseL/2TCj/sdqnEppgOW+azedaG08HFSBKVCNwiVjYnYonk g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10321"; a="263919089"
X-IronPort-AV: E=Sophos;i="5.90,272,1643702400"; d="scan'208";a="263919089"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 04:49:49 -0700
X-IronPort-AV: E=Sophos;i="5.90,272,1643702400"; d="scan'208";a="576064014"
Received: from waidhas-mobl1.ger.corp.intel.com (HELO [10.252.55.227])
 ([10.252.55.227])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 04:49:46 -0700
Message-ID: <8986a1c6-b546-7a66-a778-048487624c95@linux.intel.com>
Date: Tue, 19 Apr 2022 14:50:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: out-of-bounds access in sound/soc/sof/topology.c
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jaska Uimonen <jaska.uimonen@linux.intel.com>
References: <Ylk5o3EC/hyX5UQ0@google.com>
 <8eeb08ec-4836-cf7d-2285-8ed74ccfc1cb@linux.intel.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <8eeb08ec-4836-cf7d-2285-8ed74ccfc1cb@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 Mark Brown <broonie@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>,
 sound-open-firmware@alsa-project.org
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

Hi Sergey, Pierre,

On 15/04/2022 19:00, Pierre-Louis Bossart wrote:
> Thanks Sergey for this email.
> 
> On 4/15/22 04:23, Sergey Senozhatsky wrote:
>> Hi,
>>
>> I'm running 5.10.111 LTS, so if this has been fixed already then we definitely
>> want to cherry pick the fix for -stable.

I'm afraid, that this is still valid as of today, but in real life I
don't think it can happen.

>> Anonymous union in this struct is of zero size
>>
>> /* generic control data */
>> struct sof_ipc_ctrl_data {
>>         struct sof_ipc_reply rhdr;
>>         uint32_t comp_id;
>>
>>         /* control access and data type */
>>         uint32_t type;          /**< enum sof_ipc_ctrl_type */
>>         uint32_t cmd;           /**< enum sof_ipc_ctrl_cmd */
>>         uint32_t index;         /**< control index for comps > 1 control */
>>
>>         /* control data - can either be appended or DMAed from host */
>>         struct sof_ipc_host_buffer buffer;
>>         uint32_t num_elems;     /**< in array elems or bytes for data type */
>>         uint32_t elems_remaining;       /**< elems remaining if sent in parts */
>>
>>         uint32_t msg_index;     /**< for large messages sent in parts */
>>
>>         /* reserved for future use */
>>         uint32_t reserved[6];
>>
>>         /* control data - add new types if needed */
>>         union {
>>                 /* channel values can be used by volume type controls */
>>                 struct sof_ipc_ctrl_value_chan chanv[0];
>>                 /* component values used by routing controls like mux, mixer */
>>                 struct sof_ipc_ctrl_value_comp compv[0];
>>                 /* data can be used by binary controls */
>>                 struct sof_abi_hdr data[0];
>>         };
>> } __packed;
>>
>> sof_ipc_ctrl_value_chan and sof_ipc_ctrl_value_comp are of the same
>> size - 8 bytes, while sof_abi_hdr is much larger - _at least_ 32 bytes
>> (`__u32 data[0]` in sof_abi_hdr suggest that there should be more
>> payload after header). But they all contribute 0 to sizeof(sof_ipc_ctrl_data).
>>
>> Now control data allocations looks as follows
>>
>> 	scontrol->size = struct_size(scontrol->control_data, chanv,
>> 				     le32_to_cpu(mc->num_channels));
>> 	scontrol->control_data = kzalloc(scontrol->size, GFP_KERNEL);
>>
>> Which is sizeof(sof_ipc_ctrl_data) + mc->num_channels * sizeof(sof_ipc_ctrl_value_chan)
>>
>> For some reason it uses sizeof(sof_ipc_ctrl_value_chan), which is not
>> the largest member of the union.
>>
>> And this is where the problem is: in order to make control->data.FOO loads
>> and stores legal we need mc->num_channels to be of at least 4. So that
>>
>>    sizeof(sof_ipc_ctrl_data) + mc->num_channels * sizeof(sof_ipc_ctrl_value_chan)
>>
>>                 92           +        4         *            8
>>
>> will be the same as
>>
>>    sizeof(sof_ipc_ctrl_data) + sizeof(sof_abi_hdr).
>>
>>                 92           +           32
>>
>> Otherwise scontrol->control_data->data.FOO will access nearby/foreign
>> slab object.
>>
>> And there is at least one such memory access. In sof_get_control_data().
>>
>> 	wdata[i].pdata = wdata[i].control->control_data->data;
>> 	*size += wdata[i].pdata->size;
>>
>>
>> pdata->size is at offset 8, but if, say, mc->num_channels == 1 then
>> we allocate only 8 bytes for pdata, so pdata->size is 4 bytes outside
>> of allocated slab object.
>>
>> Thoughts?

Your analyzes are spot on, unfortunately. But...

As of today, the sof_get_control_data() is in the call path of
(ipc3-topology.c):

sof_widget_update_ipc_comp_process() -> sof_process_load() ->
sof_get_control_data()

sof_widget_update_ipc_comp_process() is the ipc_setup callback for
snd_soc_dapm_effect. If I'm not mistaken these only carries bin payload
and never MIXER/ENUM/SWITCH/VOLUME.
This means that the sof_get_control_data() is only called with
SND_SOC_TPLG_TYPE_BYTES and for that the allocated data area is correct.

This can explain why we have not seen any issues so far. This does not
renders the code right, as how it is written atm is wrong.

> The SOF contributors who wrote that code are all on an extended Easter week-end or vacation so we'll need more time to provide a definitive answer.
> 
> I am far from an expert on the topology, but I note that the 'data' field is only used for binary controls, where we use the maximum possible size for a control, without any arithmetic involving channels. It makes sense to me, the binary data does not have any defined structure, it's just a bunch of bytes provided as is to the firmware.
> 
> static int sof_ipc3_control_load_bytes(struct snd_sof_dev *sdev, struct snd_sof_control *scontrol)
> {
> 	struct sof_ipc_ctrl_data *cdata;
> 	int ret;
> 
> 	scontrol->ipc_control_data = kzalloc(scontrol->max_size, GFP_KERNEL);
> 	if (!scontrol->ipc_control_data)
> 		return -ENOMEM;
> 
> 
> In other cases, such as volumes and enums, the 'data' field doesn't seem to be used but we do use the channel information for volume and enums.
> 
> static int sof_ipc3_control_load_volume(struct snd_sof_dev *sdev, struct snd_sof_control *scontrol)
> {
> 	struct sof_ipc_ctrl_data *cdata;
> 	int i;
> 
> 	/* init the volume get/put data */
> 	scontrol->size = struct_size(cdata, chanv, scontrol->num_channels);
> 
> 	scontrol->ipc_control_data = kzalloc(scontrol->size, GFP_KERNEL);
> 
> 
> static int sof_ipc3_control_load_enum(struct snd_sof_dev *sdev, struct snd_sof_control *scontrol)
> {
> 	struct sof_ipc_ctrl_data *cdata;
> 
> 	/* init the enum get/put data */
> 	scontrol->size = struct_size(cdata, chanv, scontrol->num_channels);
> 
> 	scontrol->ipc_control_data = kzalloc(scontrol->size, GFP_KERNEL);
> 	if (!scontrol->ipc_control_data)
> 
> 
> Given that we have two ways of allocating the memory, I am not sure there is a problem, but I could be wrong.
> 
> I checked the v5.10.111 code and I see the same code, with the max_size being used for sof_control_load_bytes() and no channel-based arithmetic.

I agree that the issue can not be triggered due to the nature of how
things are working.

> Can I ask how you found out about this problem, is this the result of a warning/error reported by a software tool or based on your reviews of the code?
> 
> Thanks
> -Pierre
> 

-- 
Péter
