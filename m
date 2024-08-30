Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E35965E52
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2024 12:15:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B96AB847;
	Fri, 30 Aug 2024 12:15:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B96AB847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725012957;
	bh=DC3LXGuTao39AQVcPXtfcXzKlQsgne9NUz/tj0oabTc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AK1vMTpKTldR5vWWU7/rUMmVRCos/Jt0tkRLhPs7MDttJSC4BXcO8qWw8rKyTrShj
	 iqiusTSjNmFuxHd+bztESl0pNbHQZcgWnHH/h+MBo/S9nIVpl5mEOKKOH1fvZZC4ay
	 qH+y1g0VZF+cB6O7QayRkyvgpKfBUeQwoEsuNdhY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D911F80630; Fri, 30 Aug 2024 12:13:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14B5EF80765;
	Fri, 30 Aug 2024 12:13:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44ACCF8071C; Fri, 30 Aug 2024 12:13:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2659EF80618
	for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2024 12:12:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2659EF80618
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ca6rjUdB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012779; x=1756548779;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DC3LXGuTao39AQVcPXtfcXzKlQsgne9NUz/tj0oabTc=;
  b=Ca6rjUdBaR8asT9Ks8mYA2NEeyAG2wNf/V9PE+X1aJ6xkqGtbM4bEGG7
   HVl2wn2cDOXqpMYVhpU3b7mAdxyAkhaWQGnHELomsvbYG6Lj/4N2qh252
   q8QXSQ8mtrFBEYNC2RdvwE7Z69irUufbV7eZuFc1e0lPAUtQdeJbFSA9h
   1yXj3C0f17eyWA2K5Ndhu1Xh/Fl3J3i2nph4YlVap9w6vlhWQoI42Cun5
   ob7MO8h+eC2H/eozFNJiacN37ddkkIMYV/NuAg/a4Qdfz+yk2SrUwYetu
   1PBH6ipd0eSv37+07OxHzX3A7llCibnhRJq6x8uWFYM1Vs/ozhTRUCoXa
   A==;
X-CSE-ConnectionGUID: bDUxTh5/QJ2HUCTzwUz+Aw==
X-CSE-MsgGUID: WZKIltX2QxypS1kpHc1pjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34218955"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="34218955"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:12:58 -0700
X-CSE-ConnectionGUID: f+KwzfvnTy+ypwHptN16vQ==
X-CSE-MsgGUID: OEvPd9KaS7i+oM6Yt80u3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="63481844"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101])
 ([10.245.246.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:12:52 -0700
Message-ID: <b8700e13-2b61-4888-8b7d-c6ab7d713198@linux.intel.com>
Date: Fri, 30 Aug 2024 11:42:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 25/33] ALSA: usb-audio: Save UAC sample size
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
References: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
 <20240829194105.1504814-26-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-26-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LXNF35VD6PHPJ5VI3TQXT3JWR3RE4DZN
X-Message-ID-Hash: LXNF35VD6PHPJ5VI3TQXT3JWR3RE4DZN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LXNF35VD6PHPJ5VI3TQXT3JWR3RE4DZN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/29/24 21:40, Wesley Cheng wrote:
> Within the UAC descriptor, there is information describing the size of a
> sample (bSubframeSize/bSubslotSize) and the number of relevant bits
> (bBitResolution).  Currently, fmt_bits carries only the bit resolution,
> however, some offloading entities may also require the overall size of the
> sample.  Save this information in a separate parameter, as depending on the
> UAC format type, the sample size can not easily be decoded from other
> existing parameters.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/usb/card.h   | 1 +
>  sound/usb/format.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/sound/usb/card.h b/sound/usb/card.h
> index 23d9e6fc69e7..15cda1730076 100644
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

Should this patch be added first? I mean, I don't see any dependency on
USB offload

I am actually confused as to how the regular USB audio path deals with
format, this must be inferred somewhere from the fmt_bits. Probably a
question for Takashi :-)

