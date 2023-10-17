Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D89297CD0B6
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 01:26:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3952484A;
	Wed, 18 Oct 2023 01:25:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3952484A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697585181;
	bh=pF8IBdEF07grRH7GYvQAySp8FBnNSNeSKgymBJPeJEU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Dy5bnr5FKGm9J4nMISAcRmdiMFzB5ikJt1hujPVaG3BXy4KQGxHUe7Igeq/2xHJUs
	 k1gh1xhzrYRvPxCh19usS6YTraWS6B79BP+dP5Xd9Ml/ZnO3ncEe1HsRBheii9OO3g
	 qrh4kp0P5nPThjaG8sf8xww9suQ/4yDcx6NN52mM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55746F805C8; Wed, 18 Oct 2023 01:23:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7BD0F805C7;
	Wed, 18 Oct 2023 01:23:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D7F3F8057F; Wed, 18 Oct 2023 01:23:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AC063F8025F
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 01:23:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC063F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kHULqaIP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697585007; x=1729121007;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pF8IBdEF07grRH7GYvQAySp8FBnNSNeSKgymBJPeJEU=;
  b=kHULqaIP9TtlWr/siQHj6pY9gfZLkCeO0UqZqfWL+SCj1Qm0OXKqnBmD
   saDbhTpXyc1Ooz2ejQRI3xnt/FH2O+hYGmCsp9e4BOdIS4awar9LxEruG
   a8chgye8qIuWhOQ/OdHTqV+KvKZy241z6tQrpc34ckh2PUWtmVBkOL3aB
   f7kyP99zxTJpbitLjtWrZL83IRouzYfV3gYklhR4Me4YwkGgD6hPVXtlA
   uikooBZlLUYpLL49zx9mNAb15Xin8jjOIjmfVQ66SpZO3R+tm0nTjWRwZ
   buYYGrBsyzQz7qfrh/loV3U5vUiCn1plgAF0DE//t8J48TfrKV6dkgcBo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="384778176"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200";
   d="scan'208";a="384778176"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 16:23:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="826637494"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200";
   d="scan'208";a="826637494"
Received: from asprado-mobl2.amr.corp.intel.com (HELO [10.212.55.179])
 ([10.212.55.179])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 16:23:24 -0700
Message-ID: <7d596a0a-fb98-458a-bd74-d22f15c0f0d8@linux.intel.com>
Date: Tue, 17 Oct 2023 17:43:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 28/34] ASoC: qcom: qdsp6: Add support to track
 available USB PCM devices
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, agross@kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 Thinh.Nguyen@synopsys.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20231017200109.11407-1-quic_wcheng@quicinc.com>
 <20231017200109.11407-29-quic_wcheng@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231017200109.11407-29-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: SYFCSQLGSSWY2A2G3OPFU2YWZFEU6GC7
X-Message-ID-Hash: SYFCSQLGSSWY2A2G3OPFU2YWZFEU6GC7
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SYFCSQLGSSWY2A2G3OPFU2YWZFEU6GC7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/17/23 15:01, Wesley Cheng wrote:
> The USB backend should know about which sound resources are being shared
> between the ASoC and USB SND paths.  This can be utilized to properly
> select and maintain the offloading devices.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/soc/qcom/qdsp6/q6usb.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
> index 329a7d4a3c01..d697cbe7f184 100644
> --- a/sound/soc/qcom/qdsp6/q6usb.c
> +++ b/sound/soc/qcom/qdsp6/q6usb.c
> @@ -25,10 +25,18 @@
>  
>  #define SID_MASK	0xF
>  
> +struct q6usb_status {
> +	unsigned int num_pcm;

how would one know which ones are capture and which ones are playback?

This really looks like a playback-only assumption, despite earlier
mentions of capture supported.

> +	unsigned int chip_index;
> +	unsigned int pcm_index;
> +};
> +
>  struct q6usb_port_data {
>  	struct q6afe_usb_cfg usb_cfg;
>  	struct snd_soc_usb *usb;
>  	struct q6usb_offload priv;
> +	unsigned long available_card_slot;
> +	struct q6usb_status status[SNDRV_CARDS];
>  	int active_idx;
>  };
>  
> @@ -110,6 +118,14 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
>  	if (connected) {
>  		/* We only track the latest USB headset plugged in */
>  		data->active_idx = sdev->card_idx;
> +
> +		set_bit(sdev->card_idx, &data->available_card_slot);
> +		data->status[sdev->card_idx].num_pcm = sdev->num_playback;

there you go...

> +		data->status[sdev->card_idx].chip_index = sdev->chip_idx;
> +	} else {
> +		clear_bit(sdev->card_idx, &data->available_card_slot);
> +		data->status[sdev->card_idx].num_pcm = 0;
> +		data->status[sdev->card_idx].chip_index = 0;
>  	}
>  
>  	return 0;
