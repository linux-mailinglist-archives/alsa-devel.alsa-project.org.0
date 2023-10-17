Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E56F37CD0BB
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 01:27:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EAA3E7B;
	Wed, 18 Oct 2023 01:26:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EAA3E7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697585221;
	bh=ZMpdPFeaFAxYR/4q025izaH0wmquZAWUlNrQl8oKEZE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KJETWcmC0BeLgMB4zwcuTlLqZ3Oz+O4FA9wcfZmsuZbPdlCxyZEU6elX8A/h1x+C+
	 hjxEh4/rubaRHPIjwbmFOcWXFHbV7HpI9ElrJVpLkhL5NEhpuIbZ9+Q8/qBERx4W2g
	 ggRcmO4pVyYWTQeGwILn/TqrXTSYt1mel5tf8FGg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD291F805F0; Wed, 18 Oct 2023 01:23:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D3FCF805EB;
	Wed, 18 Oct 2023 01:23:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C4E4F805B0; Wed, 18 Oct 2023 01:23:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 334ECF800C9
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 01:23:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 334ECF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lE2zzfBt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697585012; x=1729121012;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ZMpdPFeaFAxYR/4q025izaH0wmquZAWUlNrQl8oKEZE=;
  b=lE2zzfBtEN/bX9/+NkGlNXgCWO/2+LIQBpRqTAimQFar3nAuIaRspKW9
   Bz10mrc/9lV9gtzh46yRuXW7PdWUhqkbCDMhD3ob24IixZZDfB5X2KIMT
   zZPNORxuKZ+7zJbNnRljK36ZqLBLhvE1bDea02Kv9whYFVbtbcCj6pCIa
   N3kPmzemD7aDjJLlJGJYHOtjfEax5sVSQ7eadEZ2G8bEzIwu7Ujhi//wl
   qG2mJZfI1YuHMNJzoC37aMuMQ7qGYXKZe9jw8SEbhUmn6j7CUg0UGfB/A
   qDnfpdMe/AqPJ9Zt75a1TLIVQkCpQXXMk17mjJi2WG4GnU9oN1VBQ3OSq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="384778222"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200";
   d="scan'208";a="384778222"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 16:23:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="826637517"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200";
   d="scan'208";a="826637517"
Received: from asprado-mobl2.amr.corp.intel.com (HELO [10.212.55.179])
 ([10.212.55.179])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 16:23:28 -0700
Message-ID: <34d0ce88-e006-43d3-bab3-c884c997de4c@linux.intel.com>
Date: Tue, 17 Oct 2023 18:03:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 31/34] ASoC: qcom: qdsp6: Add headphone jack for
 offload connection status
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
 <20231017200109.11407-32-quic_wcheng@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231017200109.11407-32-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: SRI6273UQVXBM76JMG4QMUWGFGI4FBNH
X-Message-ID-Hash: SRI6273UQVXBM76JMG4QMUWGFGI4FBNH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SRI6273UQVXBM76JMG4QMUWGFGI4FBNH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/17/23 15:01, Wesley Cheng wrote:
> The headphone jack framework has a well defined infrastructure for
> notifying userspace entities through input devices.  Expose a jack device
> that carries information about if an offload capable device is connected.
> Applications can further identify specific offloading information through
> other SND kcontrols.

maybe I am mistaken but if you expose a jack, is there not a need to
implement a .set_jack callback in the component driver?

>  static void q6usb_connector_control_init(struct snd_soc_component *component)
>  {
> +	struct q6usb_port_data *data = dev_get_drvdata(component->dev);
>  	int ret;
>  
>  	ret = snd_ctl_add(component->card->snd_card,
> @@ -290,6 +293,11 @@ static void q6usb_connector_control_init(struct snd_soc_component *component)
>  				snd_ctl_new1(&q6usb_offload_dev_ctrl, component));
>  	if (ret < 0)
>  		return;
> +
> +	ret = snd_soc_card_jack_new(component->card, "USB offload",
> +					SND_JACK_HEADSET, &data->hs_jack);
> +	if (ret)
> +		return;

Also if you report a jack then usually there's a difference between
SND_JACK_HEADPHONE and SND_JACK_HEADSET - where the latter case hints at
capture support.

Clearly you don't have capture support for now, so should this be
SND_JACK_HEADPHONE ?

I must say I still don't get how this entire patchset would be used, for
playback userspace *may* use offload but for any sort of voice call then
userspace *shall* rely on the legacy USB card. Is this not a
show-stopper for CRAS or PipeWire?
