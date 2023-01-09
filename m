Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D67661FFA
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 09:29:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55C97946B;
	Mon,  9 Jan 2023 09:28:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55C97946B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673252949;
	bh=eNsfJS7gjk4pa2AhFIFNT2XgKxi0Vi/qPw1+X0RVUKs=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=LKiTQIXLj/Dkj+a6UbxPmACKNyJOSynBfxMTWi+zNLjXmoplBH5CLhRxVKiWBAkrD
	 NZlx0DPEMGruMwSVjdWWQl47yo8IWpdVlzjniiHGwDjPgM5agF0wLCc3Z3IeAr0eIQ
	 Xoe7eYdjRNaGgJnZfxfdAvS4W2+PwHQY+54CPbU0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33392F80425;
	Mon,  9 Jan 2023 09:28:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BCF5F8026A; Mon,  9 Jan 2023 09:28:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 122A8F80245
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 09:28:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 122A8F80245
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jitoHFJb
Received: by mail-wm1-x330.google.com with SMTP id
 j16-20020a05600c1c1000b003d9ef8c274bso1603202wms.0
 for <alsa-devel@alsa-project.org>; Mon, 09 Jan 2023 00:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7ZCewxmSxLwjuTUJjEP99Um0ViA3Vm33HjXmtOQ3d/o=;
 b=jitoHFJbmjiTIgBjF94+6C4mHCdkBTWpEBDFRG+XnntFVfdzHO6T7D1eTrh+7TM2/y
 Vvugxax3ToI1qdUcBuGahhS7fbScrkCCKAWEnVBugBrjN4tw31/zXEF43PJNNg3mJE8v
 dI9OImeuaVWxgYsIlZbiELfYd1buuZZogSKQjUORsfkQJefdNbtw0lAhiICXOza2CK1H
 0XfShVdC/8tI7JsCjhcFyn7k/7KHtIrIt0hoApyDqtOcER7HwkZVN6/bNtX/8oTVDtwg
 qelTOd47vaFwIs07eN6K95FnTG8P1jZidrczdEME93VoX5Poftl+5kmelWRxEdvYutuf
 CUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7ZCewxmSxLwjuTUJjEP99Um0ViA3Vm33HjXmtOQ3d/o=;
 b=vsGRuGy6fXwcccOpTkV2l3+5wVSchBvfmC8X8/y7CYDGiJlV0dsNxhOVfq1dir9cTV
 wIF89CkySOqUrEFIkpQbeu5B74vOdzcUc1mY++m4CZSH/g4HhcD7c+M5LiGCk0JPUbuK
 lj/O5O6uHX2Y6h4RVh4uP10z2PDmdFJZjyHjEnnc7GEt8NtslR7oHx+0SaDupD5uQgpL
 IMuo32LKnyb7iE9gQUwTE41vm/tZAcHxkuwS9e9W/UXpOBpcTOonpCI5HrYVspc4MRv4
 tgwzFroCL4hmu8By+xU/82g8DBmEeuvXHXqPBt7LG3GazNTcOqyhxKdB0+kFvH6txuU0
 l5lA==
X-Gm-Message-State: AFqh2kqJjMJS1zEwG23nXVyTDPbGvVARrkiTLGFNCdXe9WahguubUfvb
 1Kzmrw0scmKvn/gY4+rV6IQg9Q==
X-Google-Smtp-Source: AMrXdXsW4Y6VQtOfBMg1ixd+skEs/6VaeQjIOiffrpDts1lV+k5r/dn+S5QZUFVgYhyTLtDMaIsXqA==
X-Received: by 2002:a05:600c:4fc6:b0:3d3:4a47:52e9 with SMTP id
 o6-20020a05600c4fc600b003d34a4752e9mr45041342wmq.15.1673252885142; 
 Mon, 09 Jan 2023 00:28:05 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a05600c4e8b00b003d04e4ed873sm16855748wmq.22.2023.01.09.00.28.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 00:28:04 -0800 (PST)
Message-ID: <a0c06803-450c-eb44-8789-8a48c577389d@linaro.org>
Date: Mon, 9 Jan 2023 09:28:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 5/5] arm64: dts: fsd: Add sound card node for Tesla FSD
Content-Language: en-US
To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 s.nawrocki@samsung.com, perex@perex.cz, tiwai@suse.com,
 pankaj.dubey@samsung.com, alim.akhtar@samsung.com, rcsekar@samsung.com,
 aswani.reddy@samsung.com
References: <20230103045613.100309-1-p.rajanbabu@samsung.com>
 <CGME20230103045706epcas5p14f2f951d162899234c7f5f7a0998ab6b@epcas5p1.samsung.com>
 <20230103045613.100309-6-p.rajanbabu@samsung.com>
 <2c6950c9-3489-c2d4-2ca8-cb723195f75b@linaro.org>
 <051601d923df$a0e7b840$e2b728c0$@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <051601d923df$a0e7b840$e2b728c0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 09/01/2023 05:05, Padmanabhan Rajanbabu wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@linaro.org]
>> Sent: 03 January 2023 04:43 PM
>> To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>;
>> lgirdwood@gmail.com; broonie@kernel.org; robh+dt@kernel.org;
>> krzysztof.kozlowski+dt@linaro.org; s.nawrocki@samsung.com;
>> perex@perex.cz; tiwai@suse.com; pankaj.dubey@samsung.com;
>> alim.akhtar@samsung.com; rcsekar@samsung.com;
>> aswani.reddy@samsung.com
>> Cc: alsa-devel@alsa-project.org; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; linux-samsung-soc@vger.kernel.org
>> Subject: Re: [PATCH v2 5/5] arm64: dts: fsd: Add sound card node for Tesla
>> FSD
>>
>> On 03/01/2023 05:56, Padmanabhan Rajanbabu wrote:
>>> Add device tree node support for sound card on Tesla FSD board
>>>
>>> Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
>>> ---
>>>  arch/arm64/boot/dts/tesla/fsd-evb.dts | 37
>>> +++++++++++++++++++++++++++
>>>  1 file changed, 37 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts
>>> b/arch/arm64/boot/dts/tesla/fsd-evb.dts
>>> index e2fd49774f15..ce726bddfb50 100644
>>> --- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
>>> +++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
>>> @@ -29,6 +29,43 @@
>>>  		device_type = "memory";
>>>  		reg = <0x0 0x80000000 0x2 0x00000000>;
>>>  	};
>>> +
>>> +	sound {
>>> +		compatible = "simple-audio-card";
>>> +
>>> +		#address-cells = <1>;
>>> +		#size-cells = <0>;
>>> +
>>> +		simple-audio-card,name = "FSD Audio Card";
>>> +		simple-audio-card,widgets =
>>> +			"Line", "Line Out",
>>
>> I don't think you need to break the line after '='.
> 
> Okay, will change the same in the next patch set.
> 
>>
>>> +			"Line", "Line In";
>>> +		simple-audio-card,routing =
>>> +			"Line Out", "LLOUT",
>>> +			"Line Out", "RLOUT",
>>> +			"MIC2L", "Line In",
>>> +			"MIC2R", "Line In";
>>> +
>>> +		status = "okay";
>>
>> Why?
> 
> Okay, I understood that if there is no status entry, it is
> treated as "okay". I'll update the same in the next
> patch set.
> 
>>
>>> +
>>> +		simple-audio-card,dai-link@0 {
>>> +			reg = <0>;
>>> +			format = "i2s";
>>> +			bitclock-master = <&tlv320aic3x>;
>>> +			frame-master = <&tlv320aic3x>;
>>> +
>>> +			cpu0 {
>>
>> Does not look like you tested the DTS against bindings. Please run `make
>> dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
>> for instructions).
> 
> I did not encounter any error while running dtbs_check for fsd-evb.dts
> 
> This is the command I executed
> make dtbs_check > output.txt 2>&1
> 
> dt-mk-schema --version: 2022.11
> 
> Please let me know if I'm missing anything here.

You are right. I misread the pattern in simple-card.yaml. I'll fix the
file, so let's make these nodes: cpu-0 and cpu-1.

Best regards,
Krzysztof

