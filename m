Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F2A6E9B28
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 19:58:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6570BEAC;
	Thu, 20 Apr 2023 19:57:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6570BEAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682013496;
	bh=gP4DKlPbEa0MaAWjkMmrabZeSQC5xHqkgk3wat7fvVk=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rQUDpR3DO+nKvsTeQPoOGFvM8SnobYvFcABJZ9Yb9m04VbSLPZIrVM523uLjEOQ0e
	 ejwKBI1W3Bq92WNy+C/iYEZ982umdxDXLEbWkGZCG2xRZG58qehxDQG1C302+qBeO/
	 svDa2wwwr2294sc+buGYmf1PRsxA2g1zW6jPGkD0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A90AFF80149;
	Thu, 20 Apr 2023 19:57:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92D54F80155; Thu, 20 Apr 2023 19:57:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6DDD4F800AC
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 19:57:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DDD4F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=oqYAYTMF
Received: by mail-ej1-x634.google.com with SMTP id vc20so8170058ejc.10
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Apr 2023 10:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682013433; x=1684605433;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dAr/LIDlGatkoRn7/ee7RkK9qX5KXHUaiCQKcYx4heQ=;
        b=oqYAYTMFxDORiQ4wijHNnpfbTMjjvGTX7+71JMGGnTHplTY+CZa/+qns7HaFROzvgI
         uChGjaDR+IV2P2RGg9gjqdVSEftPOkUeLikUWuSexT90zN5MzJDY15yq9SkK0NDxbzqH
         ZUzq0yQcf7UAHPdm8K0EoB6mAeBTusy15I3ZdiE9GFBZ95/+O4IHC5unQsqBmEhXuLsa
         Pw4q3d7/Y6qh2QaGz3giYki6B6dYJ4/RRBcMm9DgXS84ldV771TzVQ2BhZYRtW9XT23+
         uS5+W8RqsS4r7JuDp5E3yiP+bw25wTnrML1Hm2yDiOHUa6mDORENHZtx4/ON5odj8KPJ
         bdbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682013433; x=1684605433;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dAr/LIDlGatkoRn7/ee7RkK9qX5KXHUaiCQKcYx4heQ=;
        b=NihWLVaQADDF72E5NGls0Sqz6IQdwV6LfINhdTexuAbMiVG39TTOCD0KeBNEJYdRn9
         sKqxwp+KXx8sDC7QloMW4gclDLa+oRJq1LOd7XPyNkMMewHsibSb98aPwoDJC7QHFpDp
         fvk8wwOi6I8bSboX+Ngc0tQu0I66sleQENpeqJUd5r+RsDLBGf7vJ5cl58xggZt8z60n
         b6CSibeR81UQfAMhCqVglw3T21It5vwSe5GB1Hdr3YUin3Oy10Em23x9jOYrYOs5b1aP
         zjQlpANKug92yU0ZuCetROz8Zls5I4TbM2GAIeshQEhGvDTcdyF6wjKoNg0bSjAvQ+8o
         O8xg==
X-Gm-Message-State: AAQBX9dOJyht8Llmz88/miNRx7/wW1fu3t54y8XPC0UdCuc6VgEndyGM
	O59GuatKq20rXtnJQLoeSvjQzw==
X-Google-Smtp-Source: 
 AKy350bqZvE/WlssqOI0yjNdobQJVWq7CkZhGDtFN1P681JhE2lw9iuEvfuhP21LgvcKbpg72QxBdw==
X-Received: by 2002:a17:906:fb16:b0:953:517a:8f1a with SMTP id
 lz22-20020a170906fb1600b00953517a8f1amr2236602ejb.58.1682013433347;
        Thu, 20 Apr 2023 10:57:13 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bcb8:77e6:8f45:4771?
 ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id
 hb8-20020a170906b88800b0094bb4c75695sm956766ejb.194.2023.04.20.10.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 10:57:12 -0700 (PDT)
Message-ID: <41daab8e-e116-83b3-234f-ece43817a0f5@linaro.org>
Date: Thu, 20 Apr 2023 19:57:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/6] ASoC: codecs: wcd938x: Check for enumeration before
 using TX device
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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
 <dfe88b94-215b-a86f-60b4-25d2f9ea0e5f@linux.intel.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <dfe88b94-215b-a86f-60b4-25d2f9ea0e5f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: V6VBO6YMS3WS222IAUH7KDPL47PW6PNT
X-Message-ID-Hash: V6VBO6YMS3WS222IAUH7KDPL47PW6PNT
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V6VBO6YMS3WS222IAUH7KDPL47PW6PNT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 20/04/2023 16:18, Pierre-Louis Bossart wrote:
> 
> 
> On 4/20/23 05:16, Krzysztof Kozlowski wrote:
>> Qualcomm WCD938x Soundwire codecs come as two Soundwire devices - TX
>> and RX - on two Soundwire buses.  In DTS they are represented as three
>> device nodes: Soundwire TX, Soundwire RX and the platform codec node
>> (binding to this driver).
>>
>> Probing (and Soundwire enumeration) of all devices can happen in any
>> order, but only the Soundwire TX WCD938x device is used for accessing
>> actual WCD938x registers.  It is possible that component bind() in the
>> platform driver will be called too early, before the Soundwire TX device
>> is fully enumerated.  This might work or might not, but we cannot handle
>> it correctly from the codec driver.  It's job for Soundwire master to
>> bring up devices in correct order.
> 
> That last sentence isn't aligned with the way enumeration works in
> general for SoundWire.

I was rather referring to driver point of view. The Qualcomm Soundwire
should work, not expect devices to be powered off during their bind...

> 
> The Manager starts the clock, usually after a bus reset, and waits for
> Peripherals to signal their presence with Device0 Attached.
> 
> If multiple Peripherals are attached as Device0, the enumeration will
> resolve conflicts at the hardware level, and the Manager *cannot*
> control the order of enumeration; the order is defined by the values in
> the devID registers, whichever Peripheral has the highest value in the
> DevID registers wins the enumeration, and others have to back-off and be
> enumerated later.
> 
> Probing and enumeration are also different concepts. The SoundWire
> design allows for drivers to be probed even in the absence of any active
> hardware. This was added on purpose so that the driver could e.g.
> program a GPIO or talk to a power-management chip to allow SoundWire
> devices to start interacting with the bus.
> 
> see also suggestion below...
> 
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Cc: Patrick Lai <quic_plai@quicinc.com>
>> ---
>>  sound/soc/codecs/wcd938x.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
>> index 212667a7249c..e8e07e120fa1 100644
>> --- a/sound/soc/codecs/wcd938x.c
>> +++ b/sound/soc/codecs/wcd938x.c
>> @@ -77,6 +77,8 @@
>>  #define WCD938X_MBHC_MOISTURE_RREF      R_24_KOHM
>>  #define WCD_MBHC_HS_V_MAX           1600
>>  
>> +#define WCD938X_ENUM_TIMEOUT_MS		500
>> +
>>  #define WCD938X_EAR_PA_GAIN_TLV(xname, reg, shift, max, invert, tlv_array) \
>>  {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
>>  	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\
>> @@ -4425,6 +4427,15 @@ static int wcd938x_bind(struct device *dev)
>>  	wcd938x->sdw_priv[AIF1_PB]->slave_irq = wcd938x->virq;
>>  	wcd938x->sdw_priv[AIF1_CAP]->slave_irq = wcd938x->virq;
>>  
>> +	/*
>> +	 * Before any TX slave regmap usage, be sure the TX slave is actually
>> +	 * enumerated.
>> +	 */
> 
> ...
> 
> the alternative is to move regmap to be cache-only in the probe and
> remove the cache-only property when the device is enumerated.

The driver wants already to use the regmap in RW just few lines below in
wcd938x_set_micbias_data().

I guess I could move this entire piece of code to other place...

> 
> That's a trick that's used for all resume cases in codecs in Intel
> platforms, and we need to extend it for the startup cases as well.

Can you point me to some specific piece of driver, so I could see how it
is done? It might help me to prepare a better patch for this.

> 
>> +	ret = wait_for_completion_timeout(&wcd938x->tx_sdw_dev->enumeration_complete,
>> +					  msecs_to_jiffies(WCD938X_ENUM_TIMEOUT_MS));
>> +	if (!ret)
>> +		dev_warn(dev, "Enumeration timeout in bind, possible failures in accessing registers\n");
>> +
>>  	ret = wcd938x_set_micbias_data(wcd938x);
>>  	if (ret < 0) {
>>  		dev_err(dev, "%s: bad micbias pdata\n", __func__);

Best regards,
Krzysztof

