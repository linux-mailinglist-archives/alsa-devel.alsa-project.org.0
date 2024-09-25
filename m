Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 615A89861FF
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2024 17:05:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCCD383E;
	Wed, 25 Sep 2024 17:05:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCCD383E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727276750;
	bh=7vCwXwDG+bsxtvd02iytviiUSMi6iO6Ybyp3t8WIe5Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BdbfrsqnJQ+RL5npO24UVyXXGxcMRaS3v0WreofQhquEGmBYRoj/0AQgC9+mKxn6E
	 v2lII+yFkUSffwgMg6vAvc200kTzmKM8+4Mn2zs9wDef0XY/Pa8FORnoNK5DhCaNBA
	 vlfwdDPCtQN0f41c/r6igjZlHWoUENZVv7YJJkEs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11161F805B3; Wed, 25 Sep 2024 17:05:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CCE32F80074;
	Wed, 25 Sep 2024 17:05:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FFEDF802DB; Wed, 25 Sep 2024 17:05:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CAC0F80074
	for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2024 17:05:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CAC0F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZmqIGyVV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727276712; x=1758812712;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7vCwXwDG+bsxtvd02iytviiUSMi6iO6Ybyp3t8WIe5Y=;
  b=ZmqIGyVVw7Xy3KMIuhhJiLqRqvJgpNqSaMOSA6ECBZPjIo0MhP+u6DQO
   cvYpxenzW2cNniffNpJgrW7qv3BJ+tqyZS2yZNfkwHUlbvzLQtRv8oOMz
   mA4p1qh7saCHlyvsO7fhllPj0ry/ufrNSDC0z4hHvDCwnB1teFIzppiE9
   a90M6YNqeI9sElrz1NDFv+t9uHGUwzly3LEVJgwmXmI+u1LCyy6CeDqB7
   Rb7zO+qP/pVaZXrxOtCcQSs9+JG4DYBgI+6Ns39UqGaRpJJE34d2sguY4
   UndYb/sb5De6JJJTE+ZZ+4T+9s1nxLykSJlcdwIHDoss9KkUFTO36qDRi
   g==;
X-CSE-ConnectionGUID: HoZfPF/STDCUFhysvXBeEQ==
X-CSE-MsgGUID: 5x+3932WQiSrsb6F++zpRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26482875"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600";
   d="scan'208";a="26482875"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 08:05:06 -0700
X-CSE-ConnectionGUID: KkJZz6O4SrW69iXt+QA+QQ==
X-CSE-MsgGUID: dfMikm4UR6+Y2DTcJrvcFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600";
   d="scan'208";a="76317626"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.246.30])
 ([10.245.246.30])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 08:05:01 -0700
Message-ID: <52f10356-ecf7-4c92-b0c3-78f7a63ae85c@linux.intel.com>
Date: Wed, 25 Sep 2024 16:22:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v28 12/32] ALSA: usb-audio: Save UAC sample size
 information
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
References: <20240925010000.2231406-1-quic_wcheng@quicinc.com>
 <20240925010000.2231406-13-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240925010000.2231406-13-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: H2IDQ7EUUJRDVGD4OIAMZWFJMB63XJSS
X-Message-ID-Hash: H2IDQ7EUUJRDVGD4OIAMZWFJMB63XJSS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H2IDQ7EUUJRDVGD4OIAMZWFJMB63XJSS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 9/25/24 02:59, Wesley Cheng wrote:
> Within the UAC descriptor, there is information describing the size of a
> sample (bSubframeSize/bSubslotSize) and the number of relevant bits
> (bBitResolution).  Currently, fmt_bits carries only the bit resolution,
> however, some offloading entities may also require the overall size of the
> sample.  Save this information in a separate parameter, as depending on the
> UAC format type, the sample size can not easily be decoded from other
> existing parameters.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/usb/card.h   | 1 +
>  sound/usb/format.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/sound/usb/card.h b/sound/usb/card.h
> index 4f4f3f39b7fa..b65163c60176 100644
> --- a/sound/usb/card.h
> +++ b/sound/usb/card.h
> @@ -15,6 +15,7 @@ struct audioformat {
>  	unsigned int channels;		/* # channels */
>  	unsigned int fmt_type;		/* USB audio format type (1-3) */
>  	unsigned int fmt_bits;		/* number of significant bits */
> +	unsigned int fmt_sz;		/* overall audio sub frame/slot size */
>  	unsigned int frame_size;	/* samples per frame for non-audio */
>  	unsigned char iface;		/* interface number */
>  	unsigned char altsetting;	/* corresponding alternate setting */
> diff --git a/sound/usb/format.c b/sound/usb/format.c
> index 3b45d0ee7693..5fde543536a8 100644
> --- a/sound/usb/format.c
> +++ b/sound/usb/format.c
> @@ -80,6 +80,7 @@ static u64 parse_audio_format_i_type(struct snd_usb_audio *chip,
>  	}
>  
>  	fp->fmt_bits = sample_width;
> +	fp->fmt_sz = sample_bytes;
>  
>  	if ((pcm_formats == 0) &&
>  	    (format == 0 || format == (1 << UAC_FORMAT_TYPE_I_UNDEFINED))) {

