Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 280B660775A
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Oct 2022 14:54:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B43A28590;
	Fri, 21 Oct 2022 14:54:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B43A28590
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666356891;
	bh=4zia6d/9C/r0oMjbOLxT0k71pWLOutevN7Vh/LoS8WA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WHtrshVHYMqqxDAeP3fo2jPkGhdX70bbBZCxtv2b6TP3GNqCSIqJ06tndPOwVHSLT
	 TOwyCPbS6DvG/qeDi/6kP0GDynk3+AgWin7kIRXndnomXHt8axslx+Tk0NKFf8so1Z
	 Tu4Oxrc2KYtNr30Igto48meFPDblxvnf1sFM8VV0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AEB4F80256;
	Fri, 21 Oct 2022 14:53:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 308A5F800B5; Fri, 21 Oct 2022 14:53:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91A34F800B5
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 14:53:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91A34F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="sNK2bvtb"
Received: by mail-qk1-x733.google.com with SMTP id j21so1896786qkk.9
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 05:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/oSeaW5mIul8TIhIXdrPxIKt9VEUuWQxs7k14eD/1Ss=;
 b=sNK2bvtb0ckWlAzBW2zlR/iBOi7oAQTHNcdG3EQDc0gDVdJvQWJSne5nmtCTDeKv01
 LEFxTjBtiZGtP76wki/rZRcTfgMtxgXQ2fIVgTZvHVZxhvQWXGHWV+LR/IHyhLuZburc
 9rUKFqAC+xjzt721U30STNJfbv76tSnlTFjbzuaMOk9wEsDfYJNh3vHB6+BaUvOoG2p5
 OtuPWxE7KbYy7QIy3Y7DKlKwULDiMVgLJTWdUMpntiC6Oih/Lnt7UoaAvTTT28BXeegI
 6d+xkHbZ3qQGW87JffuysvRdnff8FaHQGRcmJjJ51D7lpVozc2ViYex1iqvmZ1ymuZWJ
 X8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/oSeaW5mIul8TIhIXdrPxIKt9VEUuWQxs7k14eD/1Ss=;
 b=7TB4BP3WpLFmcl7p9ElEcQH4HDNJ3ided3g3l6EJ7yyTUB/emYFOGt2BG4koJUG1MG
 wTnd3LjOQuwDUEhW8wfSYK266eTtvE+5kcs9BXBinuwoPy2OOE//7msDQaFRUZAI5o7N
 yxcivxtL0/IXKlf7An4PmWbEHGSWgP/GhJTbJN1Rw5TPBUTzI0eyE5uokbIWrIDPDuSA
 yDGsErc+Q5ix1QRwrcNPnAXOXjhPT55iZe4Mqe3kT9teklwuNWnJ03jcdm0dpIgS2XPx
 NzSTsr9dta3ZeOPVsMIksYQupm1ovtc6DSpGX84BM98yaFKHFIcaKnrsHgIy7UOhOuTC
 wt2Q==
X-Gm-Message-State: ACrzQf0QHIpN0z17LLCFsXjbra1c3DVP5lGwirG5aH+1pNITlIF4kWSy
 uSRWuSYRfkCVjLb24RrWKK00Tw==
X-Google-Smtp-Source: AMsMyM6L4xxVRWdbLocFykTdac6DlxEUJbXwJLGOhwqvAy4RhLV8T3Niy3e9l/kTxGIuF9J8/g+4jQ==
X-Received: by 2002:a05:620a:2487:b0:6ee:74a7:934b with SMTP id
 i7-20020a05620a248700b006ee74a7934bmr14077470qkn.625.1666356828594; 
 Fri, 21 Oct 2022 05:53:48 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net.
 [72.83.177.149]) by smtp.gmail.com with ESMTPSA id
 w27-20020a05620a0e9b00b006cdd0939ffbsm9345492qkm.86.2022.10.21.05.53.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 05:53:47 -0700 (PDT)
Message-ID: <89340edb-2451-e648-e2e6-94c8f2410084@linaro.org>
Date: Fri, 21 Oct 2022 08:53:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 6/6] arm64: dts: fsd: Add sound card node for Tesla FSD
To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>,
 'Alim Akhtar' <alim.akhtar@samsung.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 s.nawrocki@samsung.com, perex@perex.cz, tiwai@suse.com,
 pankaj.dubey@samsung.com, rcsekar@samsung.com, aswani.reddy@samsung.com
References: <20221014102151.108539-1-p.rajanbabu@samsung.com>
 <CGME20221014104915epcas5p12414b87ea127b2d5bf521556bf841b00@epcas5p1.samsung.com>
 <20221014102151.108539-7-p.rajanbabu@samsung.com>
 <00c301d8dfd0$f55ca230$e015e690$@samsung.com>
 <04aa01d8e524$d253f2d0$76fbd870$@samsung.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <04aa01d8e524$d253f2d0$76fbd870$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 21/10/2022 04:12, Padmanabhan Rajanbabu wrote:
> 
> 
>> -----Original Message-----
>> From: Alim Akhtar [mailto:alim.akhtar@samsung.com]
>> Sent: 14 October 2022 06:59 PM
>> To: 'Padmanabhan Rajanbabu' <p.rajanbabu@samsung.com>;
>> lgirdwood@gmail.com; broonie@kernel.org; robh+dt@kernel.org;
>> krzysztof.kozlowski+dt@linaro.org; s.nawrocki@samsung.com;
>> perex@perex.cz; tiwai@suse.com; pankaj.dubey@samsung.com;
>> rcsekar@samsung.com; aswani.reddy@samsung.com
>> Cc: alsa-devel@alsa-project.org; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; linux-samsung-soc@vger.kernel.org
>> Subject: RE: [PATCH 6/6] arm64: dts: fsd: Add sound card node for Tesla FSD
>>
>>
>>
>>> -----Original Message-----
>>> From: Padmanabhan Rajanbabu [mailto:p.rajanbabu@samsung.com]
>>> Sent: Friday, October 14, 2022 3:52 PM
>>> To: lgirdwood@gmail.com; broonie@kernel.org; robh+dt@kernel.org;
>>> krzysztof.kozlowski+dt@linaro.org; s.nawrocki@samsung.com;
>>> perex@perex.cz; tiwai@suse.com; pankaj.dubey@samsung.com;
>>> alim.akhtar@samsung.com; rcsekar@samsung.com;
>> aswani.reddy@samsung.com
>>> Cc: alsa-devel@alsa-project.org; devicetree@vger.kernel.org; linux-
>>> kernel@vger.kernel.org; linux-samsung-soc@vger.kernel.org;
>> Padmanabhan
>>> Rajanbabu <p.rajanbabu@samsung.com>
>>> Subject: [PATCH 6/6] arm64: dts: fsd: Add sound card node for Tesla FSD
>>>
>>> Add device tree node support for sound card on Tesla FSD board
>>>
>>> Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
>>> ---
>>> arch/arm64/boot/dts/tesla/fsd-evb.dts | 49
>>> +++++++++++++++++++++++++++
>>> arch/arm64/boot/dts/tesla/fsd.dtsi    |  3 ++
>>> 2 files changed, 52 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts
>>> b/arch/arm64/boot/dts/tesla/fsd-evb.dts
>>> index c0a4509499ab..ecaa3c2e3045 100644
>>> --- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
>>> +++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
>>> @@ -49,3 +49,52 @@
>>> &tdm_1 {
>>> 	status = "okay";
>>> };
>>> +
>>> +&sound {
>>> +	compatible = "tesla,fsd-sndcard";
>>> +	status = "okay";
>>> +	model = "fsd-i2s";
>>> +	widgets =
>>> +		"Speaker", "MAIN SPK",
>>> +		"Microphone", "MAIN MIC";
>>> +
>>> +	primary-dai-link-0 {
>>> +		link-name = "fsd-primary-0";
>>> +		dai-format = "i2s";
>>> +		tesla,bitclock-master = <&tdm_0>;
>>> +		tesla,frame-master = <&tdm_0>;
>>> +		cpu {
>>> +			sound-dai = <&tdm_0 0>;
>>> +		};
>>> +	};
>>> +
>>> +	secondary-dai-link-0 {
>>> +		link-name = "fsd-secondary-0";
>>> +		dai-format = "i2s";
>>> +		tesla,bitclock-master = <&tdm_0>;
>>> +		tesla,frame-master = <&tdm_0>;
>>> +		cpu {
>>> +			sound-dai = <&tdm_0 1>;
>>> +		};
>>> +	};
>>> +
>>> +	primary-dai-link-1 {
>>> +		link-name = "fsd-primary-1";
>>> +		dai-format = "i2s";
>>> +		tesla,bitclock-master = <&tdm_1>;
>>> +		tesla,frame-master = <&tdm_1>;
>>> +		cpu {
>>> +			sound-dai = <&tdm_1 0>;
>>> +		};
>>> +	};
>>> +
>>> +	secondary-dai-link-1 {
>>> +		link-name = "fsd-secondary-1";
>>> +		dai-format = "i2s";
>>> +		tesla,bitclock-master = <&tdm_1>;
>>> +		tesla,frame-master = <&tdm_1>;
>>> +		cpu {
>>> +			sound-dai = <&tdm_1 1>;
>>> +		};
>>> +	};
>>> +};
>>> diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi
>>> b/arch/arm64/boot/dts/tesla/fsd.dtsi
>>> index 5decad45a1b6..fc8931f830a7 100644
>>> --- a/arch/arm64/boot/dts/tesla/fsd.dtsi
>>> +++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
>>> @@ -847,6 +847,9 @@
>>> 			status = "disabled";
>>> 		};
>>>
>>> +		sound: sound {
>>> +		};
>>> +
>> Why to have an empty node in dtsi?
> This is required as every node we use in dts should have the same declared in

I see no reason why this is required.

> dtsi. Sound nodes in most of the platform is only declared (dummy node) in
> dtsi and defining only in dts. Thus we are following the same.

Can you point me to Samsung platform doing this?

Keep the code consistent with Exynos style.

Best regards,
Krzysztof

