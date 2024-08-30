Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E23965E77
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2024 12:17:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F933E76;
	Fri, 30 Aug 2024 12:16:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F933E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725013021;
	bh=A8aWXN5Sp34TzSH4dhSf5NJABlsNqU80GROTYH4oG3o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NPCCOa+dpN/LwIvo1M92OHkRGvAI9wdNUUVFrvkD2nECaRZ5okgXUdWIc/5kzgylU
	 rE30mwSZobPnSNqihu+kFmUaBSf4rJGEQwFv7f7sp+XKjJeZNhBk6dv/UeigOZbdJ7
	 ZSoGl3IXDXIFTNwb42Lv+kS5ZnzxSOH9n1onqYvQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92020F8087B; Fri, 30 Aug 2024 12:13:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8EBFF80859;
	Fri, 30 Aug 2024 12:13:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF4C5F80654; Fri, 30 Aug 2024 12:13:29 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id CB194F80818
	for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2024 12:13:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB194F80818
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YqjByBpZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012808; x=1756548808;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=A8aWXN5Sp34TzSH4dhSf5NJABlsNqU80GROTYH4oG3o=;
  b=YqjByBpZciJibwwE0WINkSO7vTu7YQ8neL8WeKYRInqSlyqYOZ5wYkaf
   NtZJj3yWILLaxvAqm2x7CV0+/s4KxXv8yU/3YY12Mj+EzRCijXwCSRwuP
   TZJkA3BpPOfA9npn262s/A+T5/QUMTa0Za9J25zlOy0Y+z0AvDkvWvzLh
   gW8KVnHBEJOC3s6d7M6t7ekoQGVoCiPMlwGR7Du366+Cq0XDsM/sWwOYR
   Phguc2IJcvoaSlC2hEq4OsarKdkWArz798LZBo0voGS5C/oWk6hOevGJu
   sSgposqiwkuHbKiHG7l71cq2sSDtIeKuRQ+bHp4fj7SCzbydIfZT5swD+
   Q==;
X-CSE-ConnectionGUID: nwEtgTNoTy6y5HV0zA7a6A==
X-CSE-MsgGUID: /7MYiNzVSuKb5d98wLlwmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="27526428"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="27526428"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:13:26 -0700
X-CSE-ConnectionGUID: eZXzYYhsSYCoULUdPjNTwQ==
X-CSE-MsgGUID: cF3F0kTKQAu7oXkB6FpSBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="68013152"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101])
 ([10.245.246.101])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:13:19 -0700
Message-ID: <f8090415-e0ae-4923-bdc8-58622623fc9d@linux.intel.com>
Date: Fri, 30 Aug 2024 11:58:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 30/33] ALSA: usb-audio: qcom: Use card and PCM index
 from QMI request
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
 <20240829194105.1504814-31-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-31-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LIX42QYJ2F2BIEDBZVHEX3RG7DTHR3DK
X-Message-ID-Hash: LIX42QYJ2F2BIEDBZVHEX3RG7DTHR3DK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LIX42QYJ2F2BIEDBZVHEX3RG7DTHR3DK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/29/24 21:41, Wesley Cheng wrote:
> Utilize the card and PCM index coming from the USB QMI stream request.
> This field follows what is set by the ASoC USB backend, and could
> potentially carry information about a specific device selected through the
> ASoC USB backend.  The backend also has information about the last USB
> sound device plugged in, so it can choose to select the last device plugged
> in, accordingly.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/usb/qcom/qc_audio_offload.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
> index 0bd533f539e4..a7ad15404fd1 100644
> --- a/sound/usb/qcom/qc_audio_offload.c
> +++ b/sound/usb/qcom/qc_audio_offload.c
> @@ -106,8 +106,6 @@ struct uaudio_qmi_dev {
>  	bool er_mapped;
>  	/* reference count to number of possible consumers */
>  	atomic_t qdev_in_use;
> -	/* idx to last udev card number plugged in */
> -	unsigned int last_card_num;
>  };
>  
>  struct uaudio_dev {
> @@ -1261,7 +1259,7 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
>  
>  	pcm_dev_num = (req_msg->usb_token & QMI_STREAM_REQ_DEV_NUM_MASK) >> 8;
>  	xfer_buf_len = req_msg->xfer_buff_size;
> -	card_num = uaudio_qdev->last_card_num;
> +	card_num = (req_msg->usb_token & QMI_STREAM_REQ_CARD_NUM_MASK) >> 16;
>  
>  	if (!uadev[card_num].ctrl_intf) {
>  		dev_err(&subs->dev->dev, "audio ctrl intf info not cached\n");
> @@ -1455,8 +1453,7 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
>  
>  	direction = (req_msg->usb_token & QMI_STREAM_REQ_DIRECTION);
>  	pcm_dev_num = (req_msg->usb_token & QMI_STREAM_REQ_DEV_NUM_MASK) >> 8;
> -	pcm_card_num = req_msg->enable ? uaudio_qdev->last_card_num :
> -				ffs(uaudio_qdev->card_slot) - 1;
> +	pcm_card_num = (req_msg->usb_token & QMI_STREAM_REQ_CARD_NUM_MASK) >> 16;
>  	if (pcm_card_num >= SNDRV_CARDS) {
>  		ret = -EINVAL;
>  		goto response;
> @@ -1706,7 +1703,6 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
>  		sdev->card_idx = chip->card->number;
>  		sdev->chip_idx = chip->index;
>  
> -		uaudio_qdev->last_card_num = chip->card->number;
>  		snd_soc_usb_connect(usb_get_usb_backend(udev), sdev);
>  	}

This entire path seems like a bad split/merge, it removes stuff that was
done earlier. Also it's not clear what this has to do with 'QMI', card
and PCM device management is usually done at a higher level.

not following, please be mindful of reviewer fatigue when adding such
changes in patch 30/33....

