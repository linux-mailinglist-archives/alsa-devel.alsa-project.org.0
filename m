Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6780E965E6F
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2024 12:16:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD7A87F4;
	Fri, 30 Aug 2024 12:16:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD7A87F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725013009;
	bh=f6NQO+vGDvZOOd+xdAa0FYDOljjy4EtgGvlJs3wbZoI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BEbsPCqmpMaoGEOKlVZkMiv1FjapXdu3qkSZdeRLWGkkw9lvXtK2QzixQhKLGAr7y
	 230AZOYugxXdEhIV2wmajL7TlGGRNNMh2avSz4WAbvQFo06tDbj3JHTVJ6ll2+tlUJ
	 2zawGWxdBKJepx3l2vLNpsJ6wpp2hpXAJwWSvZlQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED865F80834; Fri, 30 Aug 2024 12:13:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75134F80817;
	Fri, 30 Aug 2024 12:13:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F84BF8076A; Fri, 30 Aug 2024 12:13:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 22FB1F8077D
	for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2024 12:13:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22FB1F8077D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Mucw67Lq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012801; x=1756548801;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=f6NQO+vGDvZOOd+xdAa0FYDOljjy4EtgGvlJs3wbZoI=;
  b=Mucw67LqmyFGsUEyLyWBTvsV50rYZm5iNxPvJLRkdek7Q42NFf57DV8s
   12rGILJUcxKQ3yJpUgp6nDcyg4LB+nwy5sPLMqLG+JA/08haDNgmUPiRm
   lKqMHQNtz/0cvm0/eVd0LOM1Oav5B4nl2vgTcAxUYplzbsnxtwwQXaa1x
   sQvNGbVXDr6J/qPPHuk9jmT8PSHvkP3FUYTE3iBupedyKK3771VZMYguv
   Xl5/YSXl+1pB92tU6aCtdrDiCF9pWcIxdauMqsv1GrGziVLOYqlZR2AfT
   UDB5dCMJ2dOoyfsztz9s/1QA87yHUeznW3jx1rz7PuevBxVrjIHQXsvbq
   Q==;
X-CSE-ConnectionGUID: eQzAc0N9SkGb4ZP+VjFy3A==
X-CSE-MsgGUID: 5/7LrAeWTwK08aWXGZqfaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="27526412"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="27526412"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:13:19 -0700
X-CSE-ConnectionGUID: FhkwSjYXThu8ZobS5lYOrg==
X-CSE-MsgGUID: neR0RV08SLqplh/Oz7RLpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="68013144"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101])
 ([10.245.246.101])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:13:13 -0700
Message-ID: <6e4e6e5f-dc55-4311-a658-5e2fcbeefab1@linux.intel.com>
Date: Fri, 30 Aug 2024 11:55:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 29/33] ALSA: usb-audio: qcom: Don't allow USB offload
 path if PCM device is in use
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, robh@kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, alsa-devel@alsa-project.org
References: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
 <20240829194105.1504814-30-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-30-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6R2DLRHIMBE7KG3ADLARMOFVIPEADESE
X-Message-ID-Hash: 6R2DLRHIMBE7KG3ADLARMOFVIPEADESE
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6R2DLRHIMBE7KG3ADLARMOFVIPEADESE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/29/24 21:41, Wesley Cheng wrote:
> Add proper checks and updates to the USB substream once receiving a USB QMI
> stream enable request.  If the substream is already in use from the non
> offload path, reject the stream enable request.  In addition, update the
> USB substream opened parameter when enabling the offload path, so the
> non offload path can be blocked.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/usb/qcom/qc_audio_offload.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
> index e9f2fd6bbb41..0bd533f539e4 100644
> --- a/sound/usb/qcom/qc_audio_offload.c
> +++ b/sound/usb/qcom/qc_audio_offload.c
> @@ -1482,12 +1482,17 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
>  		goto response;
>  	}
>  
> +	mutex_lock(&chip->mutex);
>  	if (req_msg->enable) {
> -		if (info_idx < 0 || chip->system_suspend) {
> +		if (info_idx < 0 || chip->system_suspend || subs->opened) {
>  			ret = -EBUSY;
> +			mutex_unlock(&chip->mutex);
> +
>  			goto response;
>  		}
> +		subs->opened = 1;
>  	}
> +	mutex_unlock(&chip->mutex);
>  
>  	if (req_msg->service_interval_valid) {
>  		ret = get_data_interval_from_si(subs,
> @@ -1509,6 +1514,11 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
>  		if (!ret)
>  			ret = prepare_qmi_response(subs, req_msg, &resp,
>  						   info_idx);
> +		if (ret < 0) {
> +			mutex_lock(&chip->mutex);
> +			subs->opened = 0;
> +			mutex_unlock(&chip->mutex);
> +		}
>  	} else {
>  		info = &uadev[pcm_card_num].info[info_idx];
>  		if (info->data_ep_pipe) {
> @@ -1532,6 +1542,9 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
>  		}
>  
>  		disable_audio_stream(subs);
> +		mutex_lock(&chip->mutex);
> +		subs->opened = 0;
> +		mutex_unlock(&chip->mutex);
>  	}
>  


This sounds ok but I wonder why all this needs to be done in
Qualcomm-specific layers instead of soc-usb?


