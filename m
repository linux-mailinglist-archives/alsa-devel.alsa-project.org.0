Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 466904CD8D3
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 17:15:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E81941B30;
	Fri,  4 Mar 2022 17:14:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E81941B30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646410515;
	bh=DM/R36Y9gjmobZX7kVfYEYP0cwTv3+cuoEmMQNK1RaU=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KiksUgGL1OKs5Xyv7ou1q8E0MvcffRxuSF99X/vbIVpYjJ/YPk5XbGYkGm/ZeuNLT
	 480TcS/CkNWZnS/EFwyAUj9eih++N74Ar+T6hKeGM2yinEcYWiumwEIZfOSQyPtEwJ
	 u7RKfTVDqgYWUktG+ZR7nrrPxpMLexcHiWsXMoqE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E4BEF801F5;
	Fri,  4 Mar 2022 17:14:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9F93F801EC; Fri,  4 Mar 2022 17:14:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_FILL_THIS_FORM_SHORT,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 483C0F800F2
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 17:13:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 483C0F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Xyw23RHh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646410442; x=1677946442;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DM/R36Y9gjmobZX7kVfYEYP0cwTv3+cuoEmMQNK1RaU=;
 b=Xyw23RHhhsod2OBW+hhxwczgd/QEvDSes+BcagegjynaT0Jfvvk4tcdu
 3rubr8zfoPcIP1rXGq68tPUpGYSoxRducQg0OomvlFHodUSdBjcGjVRSV
 Q3a9WMNwmdsmE3M90j9krLjmzBtQFccrZxAgF/6prNa3RBudyW71bghww
 jPBTLqJ/yfF6Fe32buHAJtxVG7XMkRogtZL5GiEws1iNpt28wMPTq/3sG
 prUZdz/6Zpr6q4G019BurhH3f+j8PuUrh4czFEBNYx6sd2b78SfUbYTd0
 kiSpxM7kYIB0pUYeyTQcCdT3MNj0s64UlYCNhOcAEiwO94am9LdVcMcSX w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="234612790"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="234612790"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 08:13:47 -0800
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="686913402"
Received: from srstocke-mobl.amr.corp.intel.com ([10.251.130.3])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 08:13:46 -0800
Message-ID: <a972e3d9a919cb8445295ec65f510c33b6239819.camel@linux.intel.com>
Subject: Re: [PATCH v3 06/17] ASoC: Intel: avs: Add pipeline management
 requests
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
Date: Fri, 04 Mar 2022 08:13:46 -0800
In-Reply-To: <20220304145755.2844173-7-cezary.rojewski@intel.com>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-7-cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
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

On Fri, 2022-03-04 at 15:57 +0100, Cezary Rojewski wrote:
> Pipeline represents a scheduling entity. Their existence as well as
> their state machine is controlled through CREATE_PIPELINE,
> DELETE_PIPELINE and SET_PIPELINE_STATE IPCs.
> 
> Signed-off-by: Amadeusz Sławiński <
> amadeuszx.slawinski@linux.intel.com>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/soc/intel/avs/messages.c | 76
> ++++++++++++++++++++++++++++++++++
>  sound/soc/intel/avs/messages.h | 48 +++++++++++++++++++++
>  2 files changed, 124 insertions(+)
> 
> diff --git a/sound/soc/intel/avs/messages.c
> b/sound/soc/intel/avs/messages.c
> index d568338b0737..de2d50f8c6b4 100644
> --- a/sound/soc/intel/avs/messages.c
> +++ b/sound/soc/intel/avs/messages.c
> @@ -63,3 +63,79 @@ int avs_ipc_load_library(struct avs_dev *adev, u32
> dma_id, u32 lib_id)
>  
>  	return ret;
>  }
> +
> +int avs_ipc_create_pipeline(struct avs_dev *adev, u16 req_size, u8
> priority,
> +			    u8 instance_id, bool lp, u16 attributes)
> +{
> +	union avs_global_msg msg = AVS_GLOBAL_REQUEST(CREATE_PIPELINE);
> +	struct avs_ipc_msg request = {{0}};
> +	int ret;
> +
> +	msg.create_ppl.ppl_mem_size = req_size;
> +	msg.create_ppl.ppl_priority = priority;
> +	msg.create_ppl.instance_id = instance_id;
> +	msg.ext.create_ppl.lp = lp;
> +	msg.ext.create_ppl.attributes = attributes;
> +	request.header = msg.val;
> +
> +	ret = avs_dsp_send_msg(adev, &request, NULL);
> +	if (ret)
> +		avs_ipc_err(adev, &request, "create pipeline", ret);
> +
> +	return ret;
> +}
> +
> +int avs_ipc_delete_pipeline(struct avs_dev *adev, u8 instance_id)
> +{
> +	union avs_global_msg msg = AVS_GLOBAL_REQUEST(DELETE_PIPELINE);
> +	struct avs_ipc_msg request = {{0}};
> +	int ret;
> +
> +	msg.ppl.instance_id = instance_id;
> +	request.header = msg.val;
> +
> +	ret = avs_dsp_send_msg(adev, &request, NULL);
> +	if (ret)
> +		avs_ipc_err(adev, &request, "delete pipeline", ret);
> +
> +	return ret;
> +}
> +
> +int avs_ipc_set_pipeline_state(struct avs_dev *adev, u8 instance_id,
> +			       enum avs_pipeline_state state)
> +{
> +	union avs_global_msg msg =
> AVS_GLOBAL_REQUEST(SET_PIPELINE_STATE);
> +	struct avs_ipc_msg request = {{0}};
> +	int ret;
> +
> +	msg.set_ppl_state.ppl_id = instance_id;
> +	msg.set_ppl_state.state = state;
> +	request.header = msg.val;
> +
> +	ret = avs_dsp_send_msg(adev, &request, NULL);
> +	if (ret)
> +		avs_ipc_err(adev, &request, "set pipeline state", ret);
> +
> +	return ret;
> +}
> +
> +int avs_ipc_get_pipeline_state(struct avs_dev *adev, u8 instance_id,
> +			       enum avs_pipeline_state *state)
Can the pipeline state in the firmware change without the driver's
knowledge? When should the driver use this get_pipeline_state()?

Thanks,Ranjani

