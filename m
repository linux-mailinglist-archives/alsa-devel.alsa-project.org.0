Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED79502D65
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Apr 2022 18:02:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C881A175D;
	Fri, 15 Apr 2022 18:01:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C881A175D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650038530;
	bh=iU32Nth3Vpx4ScnrV9cfqu6DrMgNq7G4TYDO0DOA9XI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GWHYa63n0HVg7NZIdrOCsdvoHnReXzXSwF0EMohTgyAbuQWldLzXeHG46wENv1mVb
	 LrzjCskM9JYKG3xxQfc/9Pq2vjhZCB8l7xQ4/l0SmdiT0sErQxgaQRSz9sIi6ua3lw
	 FXzHExDZ0c/HxWCG+7sv4CiUpNjXjVDnGrsLcSFA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F880F8012E;
	Fri, 15 Apr 2022 18:01:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F0EFF8016A; Fri, 15 Apr 2022 18:01:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27AAFF80095;
 Fri, 15 Apr 2022 18:01:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27AAFF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="l8tmnRVZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650038467; x=1681574467;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iU32Nth3Vpx4ScnrV9cfqu6DrMgNq7G4TYDO0DOA9XI=;
 b=l8tmnRVZiRAAg7+v69AlEvZApfFc6K1gAeDh+E9zVmm1rUmY1GizlGjP
 5dhExH3nx4/kQ1CVKI+mS0/klG6oDDSe9B6vwTq8VMtMnm7O7wGl750CM
 d5yuyXjnkjeAkMS3Q9qiJkRR7779pfoBM2196O4uBvjY/lszEd+2SY9+M
 ROPXvfQGysKa6fPAII1fg/70tJJubsRK9llEz7bp00iqnrTMShHFsI/Yw
 mTK5YpU+D+aHw4mkLOCtho1A/xw8+NMJ8Ogq1mdF4iyEwAyiyd5ZrPsgJ
 6Aby1FROwog1pYgf9uX5jF+7BeyR2H/K79XF2zBKmwhXj1PKo8bJrtrfr A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10318"; a="263350780"
X-IronPort-AV: E=Sophos;i="5.90,263,1643702400"; d="scan'208";a="263350780"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2022 09:00:58 -0700
X-IronPort-AV: E=Sophos;i="5.90,263,1643702400"; d="scan'208";a="553197301"
Received: from gkcarda-mobl2.amr.corp.intel.com (HELO [10.251.1.179])
 ([10.251.1.179])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2022 09:00:57 -0700
Message-ID: <8eeb08ec-4836-cf7d-2285-8ed74ccfc1cb@linux.intel.com>
Date: Fri, 15 Apr 2022 11:00:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: out-of-bounds access in sound/soc/sof/topology.c
Content-Language: en-US
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jaska Uimonen <jaska.uimonen@linux.intel.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
References: <Ylk5o3EC/hyX5UQ0@google.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <Ylk5o3EC/hyX5UQ0@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Thanks Sergey for this email.

On 4/15/22 04:23, Sergey Senozhatsky wrote:
> Hi,
> 
> I'm running 5.10.111 LTS, so if this has been fixed already then we definitely
> want to cherry pick the fix for -stable.
> 
> 
> Anonymous union in this struct is of zero size
> 
> /* generic control data */
> struct sof_ipc_ctrl_data {
>         struct sof_ipc_reply rhdr;
>         uint32_t comp_id;
> 
>         /* control access and data type */
>         uint32_t type;          /**< enum sof_ipc_ctrl_type */
>         uint32_t cmd;           /**< enum sof_ipc_ctrl_cmd */
>         uint32_t index;         /**< control index for comps > 1 control */
> 
>         /* control data - can either be appended or DMAed from host */
>         struct sof_ipc_host_buffer buffer;
>         uint32_t num_elems;     /**< in array elems or bytes for data type */
>         uint32_t elems_remaining;       /**< elems remaining if sent in parts */
> 
>         uint32_t msg_index;     /**< for large messages sent in parts */
> 
>         /* reserved for future use */
>         uint32_t reserved[6];
> 
>         /* control data - add new types if needed */
>         union {
>                 /* channel values can be used by volume type controls */
>                 struct sof_ipc_ctrl_value_chan chanv[0];
>                 /* component values used by routing controls like mux, mixer */
>                 struct sof_ipc_ctrl_value_comp compv[0];
>                 /* data can be used by binary controls */
>                 struct sof_abi_hdr data[0];
>         };
> } __packed;
> 
> sof_ipc_ctrl_value_chan and sof_ipc_ctrl_value_comp are of the same
> size - 8 bytes, while sof_abi_hdr is much larger - _at least_ 32 bytes
> (`__u32 data[0]` in sof_abi_hdr suggest that there should be more
> payload after header). But they all contribute 0 to sizeof(sof_ipc_ctrl_data).
> 
> Now control data allocations looks as follows
> 
> 	scontrol->size = struct_size(scontrol->control_data, chanv,
> 				     le32_to_cpu(mc->num_channels));
> 	scontrol->control_data = kzalloc(scontrol->size, GFP_KERNEL);
> 
> Which is sizeof(sof_ipc_ctrl_data) + mc->num_channels * sizeof(sof_ipc_ctrl_value_chan)
> 
> For some reason it uses sizeof(sof_ipc_ctrl_value_chan), which is not
> the largest member of the union.
> 
> And this is where the problem is: in order to make control->data.FOO loads
> and stores legal we need mc->num_channels to be of at least 4. So that
> 
>    sizeof(sof_ipc_ctrl_data) + mc->num_channels * sizeof(sof_ipc_ctrl_value_chan)
> 
>                 92           +        4         *            8
> 
> will be the same as
> 
>    sizeof(sof_ipc_ctrl_data) + sizeof(sof_abi_hdr).
> 
>                 92           +           32
> 
> Otherwise scontrol->control_data->data.FOO will access nearby/foreign
> slab object.
> 
> And there is at least one such memory access. In sof_get_control_data().
> 
> 	wdata[i].pdata = wdata[i].control->control_data->data;
> 	*size += wdata[i].pdata->size;
> 
> pdata->size is at offset 8, but if, say, mc->num_channels == 1 then
> we allocate only 8 bytes for pdata, so pdata->size is 4 bytes outside
> of allocated slab object.
> 
> Thoughts?

The SOF contributors who wrote that code are all on an extended Easter week-end or vacation so we'll need more time to provide a definitive answer.

I am far from an expert on the topology, but I note that the 'data' field is only used for binary controls, where we use the maximum possible size for a control, without any arithmetic involving channels. It makes sense to me, the binary data does not have any defined structure, it's just a bunch of bytes provided as is to the firmware.

static int sof_ipc3_control_load_bytes(struct snd_sof_dev *sdev, struct snd_sof_control *scontrol)
{
	struct sof_ipc_ctrl_data *cdata;
	int ret;

	scontrol->ipc_control_data = kzalloc(scontrol->max_size, GFP_KERNEL);
	if (!scontrol->ipc_control_data)
		return -ENOMEM;


In other cases, such as volumes and enums, the 'data' field doesn't seem to be used but we do use the channel information for volume and enums.

static int sof_ipc3_control_load_volume(struct snd_sof_dev *sdev, struct snd_sof_control *scontrol)
{
	struct sof_ipc_ctrl_data *cdata;
	int i;

	/* init the volume get/put data */
	scontrol->size = struct_size(cdata, chanv, scontrol->num_channels);

	scontrol->ipc_control_data = kzalloc(scontrol->size, GFP_KERNEL);


static int sof_ipc3_control_load_enum(struct snd_sof_dev *sdev, struct snd_sof_control *scontrol)
{
	struct sof_ipc_ctrl_data *cdata;

	/* init the enum get/put data */
	scontrol->size = struct_size(cdata, chanv, scontrol->num_channels);

	scontrol->ipc_control_data = kzalloc(scontrol->size, GFP_KERNEL);
	if (!scontrol->ipc_control_data)


Given that we have two ways of allocating the memory, I am not sure there is a problem, but I could be wrong.

I checked the v5.10.111 code and I see the same code, with the max_size being used for sof_control_load_bytes() and no channel-based arithmetic.

Can I ask how you found out about this problem, is this the result of a warning/error reported by a software tool or based on your reviews of the code?

Thanks
-Pierre

