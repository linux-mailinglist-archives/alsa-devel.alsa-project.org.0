Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0996B1E17
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Mar 2023 09:30:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 355301896;
	Thu,  9 Mar 2023 09:29:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 355301896
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678350634;
	bh=M67xdIFCwqh4CUgrws9IU5/515WIz7k8JHeSi2b9Rz4=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uHH5ZMbknUpkxzIsu2yv1dTVaWLyNFLEDewmf2rTF/muXd/8TIvJE/I3l9oibor+u
	 oaUnutISN7sUXhQeLrYknJF8aNaD5ndlGf9hhzMWIhy9uj4Krhz/ah3+xciSKBwr7i
	 WM78cApnwlHoBLcrvT94zFmbvYK90UKOhQK7T290=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C9CFF80236;
	Thu,  9 Mar 2023 09:29:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85C2EF8042F; Thu,  9 Mar 2023 09:29:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0A19F80093
	for <alsa-devel@alsa-project.org>; Thu,  9 Mar 2023 09:29:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0A19F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=eqVYCC9R;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Ioqvy6L3
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id C6EB95C011B;
	Thu,  9 Mar 2023 03:29:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 09 Mar 2023 03:29:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1678350564; x=
	1678436964; bh=Oa/m0zQYb/9cVTdeBVWVrncsae/cjF8bU6ixcrep6N4=; b=e
	qVYCC9RU0vIhMD5Svk+mwY3qm4EVGZTIab4j6DZukQqwvwu2I1pyhisx49mTBNoB
	R10G6H51ISsyWkQPpBgIxKblcyiBGNnPVEWUpmRmqpWh7f/fZ91qC4v9LKUrdpVp
	HBamGmLwZUbyzgputxPsokvu6kgsr7BKCydBeUNwYWhFJmp4Fk+HdS6s6tA+Xy0M
	Sc/mA0N76oy/iVS+h2dUapqTnwjuz9YHREc8EgvfQggAH6kA68u73jBBtC8OjrE5
	N6gOeymg+oxGI5sLLdlKzbfgFE1ChBjrINZWwPWsiF/AlVcdgi83FvtshQ1j2XN5
	HwjMCHhDS/ShYpSi1sXXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1678350564; x=1678436964; bh=Oa/m0zQYb/9cV
	TdeBVWVrncsae/cjF8bU6ixcrep6N4=; b=Ioqvy6L3B/96WajH3znnyMdgmvN8d
	BO7IuUE1hotFCXXb0JVbvD6AZdHPXKk7utAaxjrKtLdbpLYsvDBoYrhFxsjfY+OZ
	1FE2G5iGup3RImVIQTAE0JJZYhVuo07SpLTYAlXufav8g2NhRa5ygpMXzxJubwcZ
	A6f+Fu8VdYVqHrX5mZXDcvS4mdkKx4M5cWogSKNP50r/LB5ciPUFpMrZas/JbNEC
	GRvw1M5l1/9BZT6BmxR50Xpay9B9GO+wMzXH/zDeVgQL4Z4k5KyfG4BAJ3lpuraJ
	7chNcYChY48yu5h6VflcRX1tuNjJGR7dM8eBE5VD1cRYiq9EehhV8PJsA==
X-ME-Sender: <xms:45gJZMD909XJ-PoqR9DIkjmKJEXf78pqI7VYcRhUBA2vg6wYbNK6Sw>
    <xme:45gJZOimMzZGiYfDOaLZvCJiOfRymLFqloMZ9cd7n1hS-l68hqYtGQlvsjk29U_-W
    gZq9O0Bc_iNOpE9wfE>
X-ME-Received: 
 <xmr:45gJZPnYMoHP3vjuz8G_oW_SGg_ztjOOiozXDDjd_jwFisTVArN3EH27aXz2MyOfjILb6MO4EOFrDY-45Y6MdRYycg>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdduhedgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
    shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
    hjpheqnecuggftrfgrthhtvghrnhephefhhfettefgkedvieeuffevveeufedtlefhjeei
    ieetvdelfedtgfefuedukeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:5JgJZCyEBeozrJeyqOW8CopBZ22mKWSpCRTRDwQaL8YENXfNAM8dGw>
    <xmx:5JgJZBST7NUjtlUOOiQKRuZYQSjlmkLz-RE_o19_QXi7cuz5QkXeNA>
    <xmx:5JgJZNYzNRG2m6sgw-WyqE3e_cxozLpCp-Mrq5Wg3NcU0QNkAFLTAw>
    <xmx:5JgJZDlmIRE7__MNBhjrnyTEgUTxP45cnnIWJKH0QqxKnXfglyZLpQ>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Mar 2023 03:29:20 -0500 (EST)
Date: Thu, 9 Mar 2023 17:29:18 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [PATCH v3 15/28] sound: usb: Introduce QC USB SND offloading
 support
Message-ID: <20230309082918.GA220616@workstation>
Mail-Followup-To: Wesley Cheng <quic_wcheng@quicinc.com>,
	srinivas.kandagatla@linaro.org, mathias.nyman@intel.com,
	perex@perex.cz, broonie@kernel.org, lgirdwood@gmail.com,
	krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
	Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com,
	andersson@kernel.org, robh+dt@kernel.org,
	gregkh@linuxfoundation.org, tiwai@suse.com,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org, quic_jackp@quicinc.com,
	quic_plai@quicinc.com
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
 <20230308235751.495-16-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308235751.495-16-quic_wcheng@quicinc.com>
Message-ID-Hash: 3I64ARQZSXJGSXWHB5JSFF2U2YFSKZM2
X-Message-ID-Hash: 3I64ARQZSXJGSXWHB5JSFF2U2YFSKZM2
X-MailFrom: o-takashi@sakamocchi.jp
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com,
 broonie@kernel.org, lgirdwood@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com,
 andersson@kernel.org, robh+dt@kernel.org, gregkh@linuxfoundation.org,
 tiwai@suse.com, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3I64ARQZSXJGSXWHB5JSFF2U2YFSKZM2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Wed, Mar 08, 2023 at 03:57:38PM -0800, Wesley Cheng wrote:
> diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
> new file mode 100644
> index 000000000000..2663906644f2
> --- /dev/null
> +++ b/sound/usb/qcom/qc_audio_offload.c
> ...
> +static int enable_audio_stream(struct snd_usb_substream *subs,
> +				snd_pcm_format_t pcm_format,
> +				unsigned int channels, unsigned int cur_rate,
> +				int datainterval)
> +{
> +	struct snd_usb_audio *chip = subs->stream->chip;
> +	struct snd_pcm_hw_params params;
> +	const struct audioformat *fmt;
> +	int ret;
> +	bool fixed_rate;
> +
> +	_snd_pcm_hw_params_any(&params);
> +	_snd_pcm_hw_param_set(&params, SNDRV_PCM_HW_PARAM_FORMAT,
> +			(__force int) pcm_format, 0);
> +	_snd_pcm_hw_param_set(&params, SNDRV_PCM_HW_PARAM_CHANNELS,
> +			channels, 0);
> +	_snd_pcm_hw_param_set(&params, SNDRV_PCM_HW_PARAM_RATE,
> +			cur_rate, 0);

I think the above code is equivalent to below code.

```
// 1. Initialize the hardware parameter so that it expresses
// the maximum flags of mask parameters and the maximum range of integer
// parameters.
_snd_pcm_hw_params_any(&params);

// 2. Then shrink the mask parameters and integer parameters.
struct snd_mask *mask;
struct snd_interval *interval;

mask = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
snd_mask_leave(mask, pcm_format);

interval = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
snd_interval_setinteger(&interval);
interval.min = interval.max = channels;

interval = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
snd_interval_setinteger(&interval);
interval.min = interval.max = cur_rate;
```

In '[PATCH v3 10/28] sound: usb: Export USB SND APIs for modules', some
codes moved from ALSA Open Sound System compatibility layer to ALSA core
to export some kernel APIs. The '_snd_pcm_hw_param_set()' is one of
them. If they were needed just for the above operations, it would be
exaggerating just for the driver.

Of course, we can assume that the similar kernel API would be required
for the other drivers (OSS PCM, USB gadget, and so on.). However, at
present, it is preferable to focus just on your driver. 

(I note that typical sound PCM driver has code to shrink hardware
parameters in PCM rule. It consists of a set of test and refine API.)


Regards

Takashi Sakamoto
