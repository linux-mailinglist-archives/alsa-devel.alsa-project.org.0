Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E3F6E9A68
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 19:15:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE63BEB1;
	Thu, 20 Apr 2023 19:14:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE63BEB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682010901;
	bh=CpNS7XI9BQe8K3LeHWubyKhCrbeBsS/W8whIme5h4yY=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Dhny5J31UNceugIqjkafvgisBdynBidJa4ZnN4k1eadGX/yVcMQ/2fUd6pnbq+vr9
	 ALdqCxxl84HnbWQ4nw/m9/eSyNJZpZggaPrOOFPt3P1jeatts7GJF2UGdaVWgT5835
	 gRe4Gqq/3D5vOdi7bIjCKG0tZrxxtBNWeISI5Hlo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBB07F80149;
	Thu, 20 Apr 2023 19:14:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD09FF8019B; Thu, 20 Apr 2023 19:14:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 452B7F800AC
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 19:13:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 452B7F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eH6Iblci
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682010840; x=1713546840;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CpNS7XI9BQe8K3LeHWubyKhCrbeBsS/W8whIme5h4yY=;
  b=eH6Iblci08kTcGDA8y2envoM4paAYOuYR+TMrdlujAgVFla25MPkjMtq
   Jq7/uz/0+nihvJ/qofAt7uD6GRPn1H625SglELDobjcv+eDNfLpzTysNC
   sJfjIGOq4FATOYXcs9taFVcOo95NWxctQw8SMpAKTUpjOLlIQnebnVAKd
   vOrER7qfr4kMV+f2qGHA/XgwKuPP3HwWFqYOpkq+/lczOOwmmWVeZeikQ
   mbHVg27ArjKEwsj6Z3OXtVw7ViIf6cjVgqnaquqpA6UtuH3wSJn+oZYxj
   ixbezKPFK1UW/N3oDpkUAyd12qJLLWbGwVnYnpcsfHNySRPismMExx2Kd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="348574401"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200";
   d="scan'208";a="348574401"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 09:42:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="1021622651"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200";
   d="scan'208";a="1021622651"
Received: from mprabhug-mobl.amr.corp.intel.com (HELO [10.209.102.50])
 ([10.209.102.50])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 09:42:46 -0700
Message-ID: <dfe88b94-215b-a86f-60b4-25d2f9ea0e5f@linux.intel.com>
Date: Thu, 20 Apr 2023 09:18:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH 3/6] ASoC: codecs: wcd938x: Check for enumeration before
 using TX device
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20230420101617.142225-1-krzysztof.kozlowski@linaro.org>
 <20230420101617.142225-4-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230420101617.142225-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3FD67YGOUUSDQWMHOXBP6GQZ6RJXKJP5
X-Message-ID-Hash: 3FD67YGOUUSDQWMHOXBP6GQZ6RJXKJP5
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Patrick Lai <quic_plai@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3FD67YGOUUSDQWMHOXBP6GQZ6RJXKJP5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 4/20/23 05:16, Krzysztof Kozlowski wrote:
> Qualcomm WCD938x Soundwire codecs come as two Soundwire devices - TX
> and RX - on two Soundwire buses.  In DTS they are represented as three
> device nodes: Soundwire TX, Soundwire RX and the platform codec node
> (binding to this driver).
> 
> Probing (and Soundwire enumeration) of all devices can happen in any
> order, but only the Soundwire TX WCD938x device is used for accessing
> actual WCD938x registers.  It is possible that component bind() in the
> platform driver will be called too early, before the Soundwire TX device
> is fully enumerated.  This might work or might not, but we cannot handle
> it correctly from the codec driver.  It's job for Soundwire master to
> bring up devices in correct order.

That last sentence isn't aligned with the way enumeration works in
general for SoundWire.

The Manager starts the clock, usually after a bus reset, and waits for
Peripherals to signal their presence with Device0 Attached.

If multiple Peripherals are attached as Device0, the enumeration will
resolve conflicts at the hardware level, and the Manager *cannot*
control the order of enumeration; the order is defined by the values in
the devID registers, whichever Peripheral has the highest value in the
DevID registers wins the enumeration, and others have to back-off and be
enumerated later.

Probing and enumeration are also different concepts. The SoundWire
design allows for drivers to be probed even in the absence of any active
hardware. This was added on purpose so that the driver could e.g.
program a GPIO or talk to a power-management chip to allow SoundWire
devices to start interacting with the bus.

see also suggestion below...

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Cc: Patrick Lai <quic_plai@quicinc.com>
> ---
>  sound/soc/codecs/wcd938x.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
> index 212667a7249c..e8e07e120fa1 100644
> --- a/sound/soc/codecs/wcd938x.c
> +++ b/sound/soc/codecs/wcd938x.c
> @@ -77,6 +77,8 @@
>  #define WCD938X_MBHC_MOISTURE_RREF      R_24_KOHM
>  #define WCD_MBHC_HS_V_MAX           1600
>  
> +#define WCD938X_ENUM_TIMEOUT_MS		500
> +
>  #define WCD938X_EAR_PA_GAIN_TLV(xname, reg, shift, max, invert, tlv_array) \
>  {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
>  	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\
> @@ -4425,6 +4427,15 @@ static int wcd938x_bind(struct device *dev)
>  	wcd938x->sdw_priv[AIF1_PB]->slave_irq = wcd938x->virq;
>  	wcd938x->sdw_priv[AIF1_CAP]->slave_irq = wcd938x->virq;
>  
> +	/*
> +	 * Before any TX slave regmap usage, be sure the TX slave is actually
> +	 * enumerated.
> +	 */

...

the alternative is to move regmap to be cache-only in the probe and
remove the cache-only property when the device is enumerated.

That's a trick that's used for all resume cases in codecs in Intel
platforms, and we need to extend it for the startup cases as well.

> +	ret = wait_for_completion_timeout(&wcd938x->tx_sdw_dev->enumeration_complete,
> +					  msecs_to_jiffies(WCD938X_ENUM_TIMEOUT_MS));
> +	if (!ret)
> +		dev_warn(dev, "Enumeration timeout in bind, possible failures in accessing registers\n");
> +
>  	ret = wcd938x_set_micbias_data(wcd938x);
>  	if (ret < 0) {
>  		dev_err(dev, "%s: bad micbias pdata\n", __func__);
