Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6961E59DACF
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 13:03:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BFAEE11;
	Tue, 23 Aug 2022 13:03:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BFAEE11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661252633;
	bh=1Vld5zXs2D4cxfj73f6ff2o2H6qMHuLSCYidm7gciVo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=beouVEf7Dx2zpw4U+DGdfdAI+7mXP2n0cpOOXktdzG0ITlnVeg7Z8YrknbcgsCYxi
	 RKQMJ2eZ6ti3+M7K4hsOmEcymw6AvZR/HjeGGq/vXd6Wzwc0roH14MSQhgKdVbnKsF
	 gA2fufdmjFPqi1URPvkBJjvatBi0lqYQqsW+23yI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12971F8027B;
	Tue, 23 Aug 2022 13:02:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03FA2F800A7; Tue, 23 Aug 2022 13:02:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E063BF800A7
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 13:02:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E063BF800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="FEdHHqbC"
Received: by mail-lj1-x22e.google.com with SMTP id q18so12139120ljg.12
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 04:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=Nh/dSfQpjawYJKjYiUJyrmH/Pdok2iA80vxKA7PHHnc=;
 b=FEdHHqbCC7TtKYyi1L6Ks5VnxgHVgIZG9H2aCY0WL2r6YX2J+LFzAfOn6HO5uQDI/N
 VioQTqrYqgOeSYlSKy8Aa68z0lWTheqQMMuGdCClPHt1N9/1M/GDE9wwN8zAxENmLYxZ
 /gfXbXMVk5ecw0/NuAh5Nk921ymDUjP54UvLi4/G3pCBNy17k0s7sCVQLelgYvQ+OIUv
 n/OLH3fbZAb9qDNSeAD0a9w6s7lORF5A8lDu+KbicYZLUeU3r4Bnvf0G3XmH+v2Z3EAo
 9h242JRXKE5jZrnYtJOVAEOSXBD9M8Rz5dRRHGN/FE8cbqCSaP3R27EV0I7G1FW1cs0q
 ospg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Nh/dSfQpjawYJKjYiUJyrmH/Pdok2iA80vxKA7PHHnc=;
 b=lBIW7/CP2yoPMHujcP/E/Uk8mHtTwVi7cYZm7EFhPUDkeeFBoEUPg4p3KB5hf1o1Bo
 /wj278ajgPI7e5e4NfL2h9y++Q+154suS8YfgKzVRtvNbzgl3lHmjemKtGAQGwVSW2gc
 irH5nboE3jIdh59h0fo8wHG2I56HNPvotI/xoA2grw+Yx0bAeM5uRbmm5sO963EucYv4
 xcmUZtwd7RehSzXMEyEBvSzgjGq2ytYpc0EGtMl1FLHCttn5XM7TGYl8IcMLIX9mbNR5
 /KScxjsZHnjENBaTd/wevsQGvddQahjdma6dza2RDqHo4AIzsF8IhpS2wjT9raZDkr93
 Lmfw==
X-Gm-Message-State: ACgBeo3jJJMPevEpvBW8ZgGVrZBWQSFuxBU+XFP6M6IUpoJRxh4rxxXk
 g7/1s0MMfXLbKfjrBJ7nVz4D/QQoc+wbrA2z
X-Google-Smtp-Source: AA6agR5vbYNjhHFnx+6VhB11BI4MrfWNs+kd+/HTfFywhleTdAxL7fiMVIIBFB64PGTaYQ6X+iS3mg==
X-Received: by 2002:a2e:8e75:0:b0:261:d530:86f4 with SMTP id
 t21-20020a2e8e75000000b00261d53086f4mr975578ljk.461.1661252564894; 
 Tue, 23 Aug 2022 04:02:44 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a2ea4d1000000b0025d64453f4dsm2316547ljm.122.2022.08.23.04.02.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 04:02:44 -0700 (PDT)
Message-ID: <ae5a10b8-a459-11c9-3fac-4f5de0ba2218@linaro.org>
Date: Tue, 23 Aug 2022 14:02:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/4] arm64: dts: apple: t8103: Add MCA and its support
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>
References: <20220819125430.4920-1-povik+lin@cutebit.org>
 <20220819125430.4920-3-povik+lin@cutebit.org>
 <38094e2d-c75c-920b-4b4d-aa377971f615@linaro.org>
 <A9E366E2-EA4D-4F35-BE28-63745296D222@cutebit.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <A9E366E2-EA4D-4F35-BE28-63745296D222@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Sven Peter <sven@svenpeter.dev>,
 Hector Martin <marcan@marcan.st>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, asahi@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
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

On 19/08/2022 17:24, Martin Povišer wrote:
> 
> 
>> On 19. 8. 2022, at 15:12, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 19/08/2022 15:54, Martin Povišer wrote:
>>> Add the MCA I2S transceiver node and its supporting NCO, ADMAC nodes.
>>>
>>> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
>>> ---
>>> arch/arm64/boot/dts/apple/t8103.dtsi | 70 ++++++++++++++++++++++++++++
>>> 1 file changed, 70 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
>>> index 51a63b29d404..2dc3125aca5b 100644
>>> --- a/arch/arm64/boot/dts/apple/t8103.dtsi
>>> +++ b/arch/arm64/boot/dts/apple/t8103.dtsi
>>> @@ -532,6 +532,76 @@ port02: pci@2,0 {
>>> 						<0 0 0 4 &port02 0 0 0 3>;
>>> 			};
>>> 		};
>>> +
>>> +		dart_sio: iommu@235004000 {
>>> +			compatible = "apple,t8103-dart", "apple,dart";
>>> +			reg = <0x2 0x35004000 0x0 0x4000>;
>>> +			interrupt-parent = <&aic>;
>>> +			interrupts = <AIC_IRQ 635 IRQ_TYPE_LEVEL_HIGH>;
>>> +			#iommu-cells = <1>;
>>> +			power-domains = <&ps_sio_cpu>;
>>> +		};
>>> +
>>> +		nco_clkref: clock-ref {
>>> +			compatible = "fixed-clock";
>>> +			#clock-cells = <0>;
>>> +			clock-frequency = <900000000>;
>>> +			clock-output-names = "nco_ref";
>>> +		};
>>
>> Reference clocks are usually physically outside of SoC (e.g. on the
>> board), so:
>> 1. Not part of "soc" node.
>> 2. It should be defined by board. At least clock-frequency should be there.
> 
> Ah, right, this deserves commentary: Since this is a reverse-engineered
> driver/platform support, we give up on knowing the clock tree exactly. Instead
> we model the clock input to the Numerically Controlled Oscillator (‘nco’ node
> below) with this fabulated fixed clock reference.
> 
> I guess eventually the clock tree is rooted off the SoC, and there’s
> nothing guaranteeing the same reference clock to the NCO across machines (being
> function of the board wiring and the proprietary firmware). In the end I would
> argue for keeping the ‘clock-ref’ here in ’soc' but have the clock-frequency
> defined by board.  Sounds reasonable?

Yes.

Best regards,
Krzysztof
