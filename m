Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3440965E32
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2024 12:14:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F1629F6;
	Fri, 30 Aug 2024 12:14:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F1629F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725012859;
	bh=eyXJHGcT/Na/c2SdMzGXJF5Dzkg07Jkb8wsmfvC9SWI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kCAP8wp+0rhCkdpMUkOvJT1Qwm8px7nWUqYRF+T+u86PThJhWwa5t0cbbWAmUlbtm
	 QzmKJDuMlh8/PlMJCrqBorFUA2p3RJEXz/+7ZT5jvBkw6zm/2Fu6MVukJtgtY50juD
	 G9426jXRqMvBbco0QQfQDZlhvTBo24bL44SpzbaQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E59EF806B0; Fri, 30 Aug 2024 12:12:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1E26F806A8;
	Fri, 30 Aug 2024 12:12:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 081C5F80693; Fri, 30 Aug 2024 12:12:18 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 13E65F80692
	for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2024 12:12:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13E65F80692
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=H8XyMz5c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012737; x=1756548737;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eyXJHGcT/Na/c2SdMzGXJF5Dzkg07Jkb8wsmfvC9SWI=;
  b=H8XyMz5cq87ktTIOoVhC8VOSoRkFlpWLtp5T/cTjMYn06+cOkZVn4Yly
   R9R8QN7s6oENeZW+PfUb7A59+R6Jxzvmdpz3IzVyetHq03mX1hF0G4KfP
   RcOcADpBlWfMotwxEfzqkoFKaTvYkAUJgHuK8oQFjQo8W92b6TE1tXZTk
   zoXDR66hHQWaerAqHXcSKlYOkySR3dgWp2LpaPKTFLHhDC7YO2w1gfUUG
   bM1chcpXJ/92g4mLviLMrWC6VuaECVLzkK/WHW7P7Mfjtdg2HKg4usXs+
   /PXNeXxEUy1T24Tay4qmjOTsc3ea9FGYHgje6xUv6Uc5zWbKr+GHNB0gg
   w==;
X-CSE-ConnectionGUID: /vM3nIEhQ7e1tfubVBHATg==
X-CSE-MsgGUID: agZiM/0IR5Seg8S1kSP22w==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34218840"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="34218840"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:12:16 -0700
X-CSE-ConnectionGUID: TB+bsB5SSDG33pLIuWM/ug==
X-CSE-MsgGUID: bxrL9ko3S02EoTU7hzfgYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="63481618"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101])
 ([10.245.246.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:12:09 -0700
Message-ID: <ae0ae5f0-a3e9-49b4-95ba-524975d70659@linux.intel.com>
Date: Fri, 30 Aug 2024 11:12:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 19/33] ASoC: qcom: qdsp6: Introduce USB AFE port to
 q6dsp
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
 <20240829194105.1504814-20-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-20-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AQYLAMNDWGOEDCIVJK5K7JJFBHBMZOIW
X-Message-ID-Hash: AQYLAMNDWGOEDCIVJK5K7JJFBHBMZOIW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AQYLAMNDWGOEDCIVJK5K7JJFBHBMZOIW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/29/24 21:40, Wesley Cheng wrote:
> The QC ADSP is able to support USB playback endpoints, so that the main
> application processor can be placed into lower CPU power modes.  This adds
> the required AFE port configurations and port start command to start an
> audio session.
> 
> Specifically, the QC ADSP can support all potential endpoints that are
> exposed by the audio data interface.  This includes, feedback endpoints
> (both implicit and explicit) as well as the isochronous (data) endpoints.

I think you meant

"
this includes isochronous data endpoints, in either synchronous mode or
asynchronous mode. In the latter case both implicit or explicit feedback
endpoints are supported.
"

And now I don't remember how *controls* are handled.

Is this the case that all controls exposed by endpoint zero are visible
in both the regular USB-audio card AND the offloaded card, with changes
mirrored?

It's important to explain so that the volumes are consistent no matter
which path is used. This should be added to the documentation.


> +static const struct snd_soc_dai_ops q6afe_usb_ops = {
> +	.probe		= msm_dai_q6_dai_probe,
> +	.prepare	= q6afe_dai_prepare,
> +	.hw_params	= q6afe_usb_hw_params,
> +	/*
> +	 * Shutdown callback required to stop the USB AFE port, which is enabled
> +	 * by the prepare() stage.  This stops the audio traffic on the USB AFE
> +	 * port on the Q6DSP.
> +	 */
> +	.shutdown	= q6afe_dai_shutdown,
> +	/*
> +	 * Startup callback not needed, as AFE port start command passes the PCM
> +	 * parameters within the AFE command, which is provided by the PCM core
> +	 * during the prepare() stage.
> +	 */

Humm, now this is a bit confusing. Why would you need a shutdown, can't
you use the hw_free() callback for symmetry with prepare()?


