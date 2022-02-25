Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F97E4C3BD5
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 03:42:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E39B01AF4;
	Fri, 25 Feb 2022 03:41:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E39B01AF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645756950;
	bh=AL9VDsiPPAXu5dMtTEY+ajzdC2eDsaPDw2OkYEKy6Xo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mxspbCzm4eXvmuQruPx7sEgeShLWdDhoOo8FMziUZbLdrAJH1ckfFObRzpgxMizkn
	 dr4bB/IA6b19gRdkOoJ0yO8EEB/r5WcAUBkZ1MDyk7ZivqoRUorMDj960HpOlmKf7Y
	 o0z9I8fpEYCbz0xR7OMoGeDqnPgJqDjpA2CwgnBg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02A0FF8052E;
	Fri, 25 Feb 2022 03:39:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8C8FF80169; Fri, 25 Feb 2022 03:39:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 660EFF804D9
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 03:39:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 660EFF804D9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VEwMLyrG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645756762; x=1677292762;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AL9VDsiPPAXu5dMtTEY+ajzdC2eDsaPDw2OkYEKy6Xo=;
 b=VEwMLyrGtLLqSy/MfDLIKizPeEYlPNfT6D5RScFKdva6T4TyR3CV8rET
 mqRo/fhoHeWGFYPh0APiHnu8oz/6HV9WWa0reGzHamUCpyL8nXmKK28/x
 SFHDaJtJ7hk9brmD56PqCUG0UvHrxZxiln07roPiM+fn1v+/zbPbagssJ
 SIrFs2oCmF+9xNER8dLo8xJ4BITkvVkkrZNw1ERw2RCMVpOIRSZVrwTLS
 Y4EEwDCo1VpbwpEHKoatC3m0H8479uXQXUtHEYpznwyQHKFboCEOT2TsQ
 zdkGyiMCF/xtwMW4xL0e5EE01ktl3qAA4Yszr1m4puarNWzzXVuWgQt03 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="277036157"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="277036157"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 18:39:20 -0800
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="491832648"
Received: from jsegev-mobl1.ger.corp.intel.com (HELO [10.212.99.193])
 ([10.212.99.193])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 18:39:19 -0800
Message-ID: <24125d33-bcb6-050b-88fb-6b2ef549fbad@linux.intel.com>
Date: Thu, 24 Feb 2022 19:37:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 08/17] ASoC: Intel: avs: Add power management requests
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
 <20220207122108.3780926-9-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220207122108.3780926-9-cezary.rojewski@intel.com>
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



> Audio DSP supports low power states i.e.: transitions between D0 and D3
> and D0-substates in form of D0i3. That process is a combination of core

D0i0 and D0i3?

> and IPC operations. Here, Dx and D0ix IPC handlers are added.
> 
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/soc/intel/avs/messages.c | 43 ++++++++++++++++++++++++++++++++++
>  sound/soc/intel/avs/messages.h | 16 +++++++++++++
>  2 files changed, 59 insertions(+)
> 
> diff --git a/sound/soc/intel/avs/messages.c b/sound/soc/intel/avs/messages.c
> index e870d5792a77..1b589689410f 100644
> --- a/sound/soc/intel/avs/messages.c
> +++ b/sound/soc/intel/avs/messages.c
> @@ -347,3 +347,46 @@ int avs_ipc_get_large_config(struct avs_dev *adev, u16 module_id, u8 instance_id
>  
>  	return 0;
>  }
> +
> +int avs_ipc_set_dx(struct avs_dev *adev, u32 core_mask, bool powerup)
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
> +	/*
> +	 * SET_D0 is sent for non-main cores only while SET_D3 is used to
> +	 * suspend for all of them. Both cases prevent any D0I3 transitions.

The asymmetry in the comment isn't clear. Did you mean that the main
code is in D0 when powered?

> +	 */
> +	ret = avs_dsp_send_pm_msg(adev, &request, NULL, true);
> +	if (ret)
> +		avs_ipc_err(adev, &request, "set dx", ret);
> +
> +	return ret;
> +}
> +
> +int avs_ipc_set_d0ix(struct avs_dev *adev, bool enable_pg, bool streaming)
> +{
> +	union avs_module_msg msg = AVS_MODULE_REQUEST(SET_D0IX);
> +	struct avs_ipc_msg request = {0};
> +	int ret;
> +
> +	/* Wake & streaming for < cAVS 2.0 */

I don't how anyone outside of Intel could understand this comment.
Consider explaining what the two terms refer to.

> +	msg.ext.set_d0ix.wake = enable_pg;

simplify the argument? Not sure anyone could understand what wake and
enable_pg mean.

int avs_ipc_set_d0ix(struct avs_dev *adev, bool wake, bool streaming)

> +	msg.ext.set_d0ix.streaming = streaming;
> +
> +	request.header = msg.val;
> +
> +	ret = avs_dsp_send_pm_msg(adev, &request, NULL, false);
> +	if (ret)
> +		avs_ipc_err(adev, &request, "set d0ix", ret);
> +
> +	return ret;
> +}
> diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
> index 1dabd1005327..bbdba4631b1f 100644
> --- a/sound/soc/intel/avs/messages.h
> +++ b/sound/soc/intel/avs/messages.h
> @@ -101,6 +101,8 @@ enum avs_module_msg_type {
>  	AVS_MOD_LARGE_CONFIG_SET = 4,
>  	AVS_MOD_BIND = 5,
>  	AVS_MOD_UNBIND = 6,
> +	AVS_MOD_SET_DX = 7,
> +	AVS_MOD_SET_D0IX = 8,
>  	AVS_MOD_DELETE_INSTANCE = 11,
>  };
>  
> @@ -137,6 +139,11 @@ union avs_module_msg {
>  				u32 dst_queue:3;
>  				u32 src_queue:3;
>  			} bind_unbind;
> +			struct {
> +				/* cAVS < 2.0 */
> +				u32 wake:1;
> +				u32 streaming:1;

you probably want to explain how a 'streaming' flag is set at the module
level? One would think all modules connected in a pipeline would need to
use the same flag value.

> +			} set_d0ix;
>  		} ext;
>  	};
>  } __packed;
> @@ -298,4 +305,13 @@ int avs_ipc_get_large_config(struct avs_dev *adev, u16 module_id, u8 instance_id
>  			     u8 param_id, u8 *request_data, size_t request_size,
>  			     u8 **reply_data, size_t *reply_size);
>  
> +/* DSP cores and domains power management messages */
> +struct avs_dxstate_info {
> +	u32 core_mask;
> +	u32 dx_mask;

what is the convention for D0 and D3 in the mask ? which one is 0 or 1?

Is this also handled in a hierarchical way where only the bits set in
core_mask matter?

> +} __packed;
> +
> +int avs_ipc_set_dx(struct avs_dev *adev, u32 core_mask, bool powerup);
> +int avs_ipc_set_d0ix(struct avs_dev *adev, bool enable_pg, bool streaming);
> +
>  #endif /* __SOUND_SOC_INTEL_AVS_MSGS_H */
