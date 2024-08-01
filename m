Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0679447C7
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 11:15:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04A9D391B;
	Thu,  1 Aug 2024 11:15:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04A9D391B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722503727;
	bh=X2yTZOgmtPzRmB9EZfWm8834SLBb4s6ZqLKVNWv52yE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hsiVxhACdAXAdB1CK+Axjia5od90W/4Uk+FBBiPQZE7Ovdf66DaVIhdSNHpb0oLpf
	 hM2YeyrzuMFkhGgx44R7o9/89TwHNOBkcWeabCpuvxLsDAURemTEVQ1N6YJr2pygYe
	 tsT3Pd3zeVYEXIfHsUJK3RDfgWoasTSvuM8TkRo0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D2CCF8026A; Thu,  1 Aug 2024 11:13:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E39BDF806AE;
	Thu,  1 Aug 2024 11:13:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37D77F80589; Thu,  1 Aug 2024 11:12:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4CA43F805E6
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 11:12:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CA43F805E6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YVYkcZ+L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722503544; x=1754039544;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=X2yTZOgmtPzRmB9EZfWm8834SLBb4s6ZqLKVNWv52yE=;
  b=YVYkcZ+LWNkK3GQze6frM3pI2VoLJIWm6aDhs4/4SVdvw4q46n2CpJMd
   yhldbn8RZTNZaa1jAYS+mWntd6TtUtAb39eofBwMxOODycMA9WTKL0k0U
   EPc2LSYOeHOtkjV1rnBP22vzMjjZxTlBAWShhYvOgn/qr6QryeT7090ZT
   yuTSE5eKY6K32YAqr9rsbaijq74rwhtAnCTzwp8i9pxp32lsQ1RyybjGQ
   xw+UL2fN61Ga6JttmXid7eoaac9Y2r5DEl2GDjSV4vad95n5/AGFt0QmM
   VZAniE/KdLi5h4V+pw4a+AJCv+DGOugRY1RGEQADCtbyClNQtu2Dbzo10
   A==;
X-CSE-ConnectionGUID: OagN88mLQWSZR8evpmPzRQ==
X-CSE-MsgGUID: LnVlPjEDStevo9gYXjTzVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20383724"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800";
   d="scan'208";a="20383724"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 02:12:22 -0700
X-CSE-ConnectionGUID: CIBWS+VXTECq+Rc+1hXfhQ==
X-CSE-MsgGUID: vzCEqILAQRmz4OwjGFWoOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800";
   d="scan'208";a="59090241"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.220])
 ([10.245.246.220])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 02:12:16 -0700
Message-ID: <c0b5be27-4a7a-4e53-ad90-f384b066791b@linux.intel.com>
Date: Thu, 1 Aug 2024 11:04:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 34/34] ASoC: qcom: qdsp6: Ensure PCM format is
 supported by USB audio device
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
 <20240801011730.4797-35-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240801011730.4797-35-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: RUWXROKKMAXUJ5EPTNBPLIXCGZVTDJYJ
X-Message-ID-Hash: RUWXROKKMAXUJ5EPTNBPLIXCGZVTDJYJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RUWXROKKMAXUJ5EPTNBPLIXCGZVTDJYJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/1/24 03:17, Wesley Cheng wrote:
> Check for if the PCM format is supported during the hw_params callback.  If
> the profile is not supported then the userspace ALSA entity will receive an
> error, and can take further action.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/soc/qcom/qdsp6/q6usb.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
> index d8f1bb4ec497..9a3fb3cb32b2 100644
> --- a/sound/soc/qcom/qdsp6/q6usb.c
> +++ b/sound/soc/qcom/qdsp6/q6usb.c
> @@ -52,6 +52,7 @@ static int q6usb_hw_params(struct snd_pcm_substream *substream,
>  	struct q6usb_port_data *data = dev_get_drvdata(dai->dev);
>  	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	int direction = substream->stream;
>  	struct q6afe_port *q6usb_afe;
>  	struct snd_soc_usb_device *sdev;
>  	int ret;
> @@ -63,6 +64,10 @@ static int q6usb_hw_params(struct snd_pcm_substream *substream,
>  	mutex_lock(&data->mutex);
>  	sdev = list_last_entry(&data->devices, struct snd_soc_usb_device, list);
>  
> +	ret = snd_soc_usb_find_supported_format(sdev->chip_idx, params, direction);
> +	if (ret < 0)
> +		goto out;
> +
>  	q6usb_afe = q6afe_port_get_from_id(cpu_dai->dev, USB_RX);
>  	if (IS_ERR(q6usb_afe))
>  		goto out;

This patch and the previous patch 33 should be added before patch 17,
see comments there.

