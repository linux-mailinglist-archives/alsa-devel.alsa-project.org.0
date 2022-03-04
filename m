Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A76E54CD912
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 17:26:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 380941DF9;
	Fri,  4 Mar 2022 17:25:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 380941DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646411166;
	bh=WPkbSFt3CyvrYqwGSTEjU2KzSN2tg65j/y4CA9bfHUI=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eaSMIjwtPffDHr0/7516DOIh5JMY1luIDnD4ytAlIeHtvtaxSqHAJJcKCZOTjzrve
	 eLuFM9skesyme47CoAmfnhCugovsFa+YspttxES45VQKoJicroP4GuTYX9qRKd3ot8
	 o2pfptlh/t++MhReUR6DQdfgKOe7W0UkmBK/1AeE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA90BF801F5;
	Fri,  4 Mar 2022 17:24:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA9C4F801EC; Fri,  4 Mar 2022 17:24:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16989F800F0
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 17:24:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16989F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mHV3Q8Js"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646411090; x=1677947090;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WPkbSFt3CyvrYqwGSTEjU2KzSN2tg65j/y4CA9bfHUI=;
 b=mHV3Q8JsRg0U/mVX4qyc9SZe3Qd5VUiuFDjmghGi3hT3rSBLk914RDci
 rhhRYPFCQSRzjeIhQXU5fJK+RlkKo8h79lMaAmHKOab5+RCHK045c1z7j
 7k6ji/jSWKziT6HYDph8eGMd2budCYdmQz4fA+LY3lQ3igZE25WIIwGji
 5+TcF8hfdj/tPc7/JT8YNjisMk3lU0XFobxVwIYGF9JNuTU5Bq+/nAiYh
 UnK0lrrCrbAitZtRrsOyXvunSHZhvdK8sS0s68kPsA3oaRRIcASRhPcVj
 Z1LB0AvaNsBFXU5c1sHJur9iXQn2sGjQXDg5cuPOK0i2HKLpQtKMdSKJa A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="241430547"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="241430547"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 08:24:46 -0800
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="552275611"
Received: from srstocke-mobl.amr.corp.intel.com ([10.251.130.3])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 08:24:45 -0800
Message-ID: <9133f43515f17e3467594d344db73ea6f6f5ec9f.camel@linux.intel.com>
Subject: Re: [PATCH v3 08/17] ASoC: Intel: avs: Add power management requests
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
Date: Fri, 04 Mar 2022 08:24:45 -0800
In-Reply-To: <20220304145755.2844173-9-cezary.rojewski@intel.com>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-9-cezary.rojewski@intel.com>
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
> Audio DSP supports low power states i.e.: transitions between D0 and
> D3
> and D0-substates in form of D0i0 and D0i3. That process is a
> combination
> of core and IPC operations. Here, Dx and D0ix IPC handlers are added.
> 
> Signed-off-by: Amadeusz Sławiński <
> amadeuszx.slawinski@linux.intel.com>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/soc/intel/avs/messages.c | 44
> ++++++++++++++++++++++++++++++++++
>  sound/soc/intel/avs/messages.h | 15 ++++++++++++
>  2 files changed, 59 insertions(+)
> 
> diff --git a/sound/soc/intel/avs/messages.c
> b/sound/soc/intel/avs/messages.c
> index 613c9452226d..e8f441b28d71 100644
> --- a/sound/soc/intel/avs/messages.c
> +++ b/sound/soc/intel/avs/messages.c
> @@ -401,3 +401,47 @@ int avs_ipc_get_large_config(struct avs_dev
> *adev, u16 module_id, u8 instance_id
>  
>  	return 0;
>  }
> +
> +int avs_ipc_set_dx(struct avs_dev *adev, u32 core_mask, bool
> powerup)
a description for this function would be helpful.
> +{
> +	union avs_module_msg msg = AVS_MODULE_REQUEST(SET_DX);
> +	struct avs_ipc_msg request;
> +	struct avs_dxstate_info dx;
> +	int ret;
> +
> +	dx.core_mask = core_mask;
> +	dx.dx_mask = powerup ? core_mask : 0;
> +	request.header = msg.val;
> +	request.data = &dx;
> +	request.size = sizeof(dx);
> +
> +	ret = avs_dsp_send_msg(adev, &request, NULL);
> +	if (ret)
> +		avs_ipc_err(adev, &request, "set dx", ret);
> +
> +	return ret;
> +}
> +
> +/*
> + * avs_ipc_set_d0ix - Set power gating policy (entering D0IX
> substates)
> + *
> + * @enable_pg: Whether to enable or disable power gating
> + * @streaming: Whether a stream is running when transitioning
> + */
What do you mean why "whether a stream is running" does it mean any
stream? What is the difference between a D0ix transition with a stream
running compared to not running?
Thanks,Ranjani

