Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE3F78BE89
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 08:36:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABA82827;
	Tue, 29 Aug 2023 08:35:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABA82827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693290973;
	bh=WWOEmdLyuK33Kxhgz1qvCFIlmQ/hOZOcwpbUZEDSWm0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SXv/fWWghJyGKKMyz0lwug/G10GNyx9jkSjVpAESkLn1ZAUNGhQEFhGjXY0lN3lMO
	 OXav8gcG+firtkeNvaKQKeCv52d7rNTW61wcMG7WIux0JRWY56D2OdMKT2A6w+ldZ3
	 JjFpJb8JOVoPf8AjpifZGusp6TmLF0Vqt5jd+qdc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCE39F80558; Tue, 29 Aug 2023 08:34:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67564F80158;
	Tue, 29 Aug 2023 08:34:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDB5DF80158; Tue, 29 Aug 2023 08:33:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35914F800F5
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 08:33:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35914F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xiApl4wn
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9936b3d0286so535797966b.0
        for <alsa-devel@alsa-project.org>;
 Mon, 28 Aug 2023 23:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693290830; x=1693895630;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kDhQb575zZtGvgbOfQFrrWaedCmdLDvfbJC6bCOqzL4=;
        b=xiApl4wnMi4ozTfI3E8sGdoZbtPSSbN+7aJAT/9SpcFa6gt7yra8fc1EcRZSC+/GRo
         42TPoLFgQncBb71fG2AxVHumaOQb6CU+mH/ZBb17DaofEMP6W/O2uQOz2jrbJMydquN5
         +8pGRhVC4aNl4I9kWaG56lUxwpJ89fUj19Lj3LknHhgcFDA/3/yn6s1ggPjmYGrtEcWe
         A1gK79yfyO1fxZ54tmPVHtCRijb+3HiD2DtzGq0HcNFkzmKZ3Q43ZPBAfHFq6kLQoCBH
         FSJHbeRnY57elXRzK4O3PBmJG8j3CDJWdUN/Z39TfdK1SGI7t6Zu2eZeEzqd1DyXh9sV
         a1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693290830; x=1693895630;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kDhQb575zZtGvgbOfQFrrWaedCmdLDvfbJC6bCOqzL4=;
        b=evZCcCwJTBD0wUUsdVV21KMWNmDqib/xEXcWhJ+LTmchH+PoXUUsdVSSJWHrh+1PFH
         WcPPt1aGLREq3A27ad46zBNQedXwHbawau1p99D8+8O9EYOq594fMAF5bLTY/YtIUHNm
         FVCP1zmM7EocwLSCJsb7aTSTSG8njRMhBXSsqvPsGDcrNdaZo3WejIg+oyfTHAatZh5H
         SC2IyJiHPp2U44W+6W74kPIbUk+qLOLOCyPYJBVCEY2CNhTR/Z64KfbpiapRSLThNwBf
         uIWC5b2czy4C9XHF3dTjaYICMS98vPsdZEnQKrX5p/uXEom7glUgT2AdcLFIVo7Iuwyz
         yUYQ==
X-Gm-Message-State: AOJu0Yz5MewuiUWZrV0fH+SKWiivmbt3WF0whD+jp2R9uSp+YwV0qX80
	ncC4159AvicOK3+MSp8bbRDYpw==
X-Google-Smtp-Source: 
 AGHT+IFHPz0zE7ngWnnXF45tsOJ+fqrjSB+4GSz7x61aYxsX2j+NOzq1b3GxVSMYNK+GA5Rf0HgTog==
X-Received: by 2002:a17:906:8a50:b0:9a1:fab3:ee3f with SMTP id
 gx16-20020a1709068a5000b009a1fab3ee3fmr11811275ejc.40.1693290828942;
        Mon, 28 Aug 2023 23:33:48 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
        by smtp.gmail.com with ESMTPSA id
 z6-20020a170906814600b00992a8a54f32sm5569794ejw.139.2023.08.28.23.33.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 23:33:48 -0700 (PDT)
Message-ID: <73655c17-5246-2c96-d415-6a30497966c3@linaro.org>
Date: Tue, 29 Aug 2023 08:33:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 11/28] dt-bindings: usb: dwc3: Add
 snps,num-hc-interrupters definition
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, Rob Herring <robh@kernel.org>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
 broonie@kernel.org, lgirdwood@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com,
 andersson@kernel.org, gregkh@linuxfoundation.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
 <20230308235751.495-12-quic_wcheng@quicinc.com>
 <20230311134008.GA20831-robh@kernel.org>
 <f7bd1ae7-fc38-0f29-546b-9ea4a323f42f@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f7bd1ae7-fc38-0f29-546b-9ea4a323f42f@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6DKBWRHZLBN6C5YO6USDJ2O4BM6ICMQD
X-Message-ID-Hash: 6DKBWRHZLBN6C5YO6USDJ2O4BM6ICMQD
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6DKBWRHZLBN6C5YO6USDJ2O4BM6ICMQD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29/08/2023 04:05, Wesley Cheng wrote:
> Hi Rob,
> 
> On 3/11/2023 5:40 AM, Rob Herring wrote:
>> On Wed, Mar 08, 2023 at 03:57:34PM -0800, Wesley Cheng wrote:
>>> Add a new definition for specifying how many XHCI secondary interrupters
>>> can be allocated.  XHCI in general can potentially support up to 1024
>>> interrupters, which some uses may want to limit depending on how many
>>> users utilize the interrupters.
>>>
>>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>>> ---
>>>   .../devicetree/bindings/usb/snps,dwc3.yaml          | 13 +++++++++++++
>>>   1 file changed, 13 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
>>> index be36956af53b..4e2417191f93 100644
>>> --- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
>>> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
>>> @@ -359,6 +359,19 @@ properties:
>>>       items:
>>>         enum: [1, 4, 8, 16, 32, 64, 128, 256]
>>>   
>>> +  snps,num-hc-interrupters:
>>> +    description:
>>> +      Defines the maximum number of XHCI host controller interrupters that can
>>> +      be supported.  The XHCI host controller has support to allocate multiple
>>> +      event rings, which can be assigned to different clients/users.  The DWC3
>>> +      controller has a maximum of 8 interrupters.  If this is not defined then
>>> +      the value will be defaulted to 1.  This parameter is used only when
>>> +      operating in host mode.
>>
>> Is this an XHCI or DWC3 feature? The former should be added to the XHCI
>> binding.
>>
> 
> Sorry for the late response...message got routed to a folder I don't 
> frequently check...

That is quite unfortunate, to put our feedback somewhere deep and then
send new versions of patches thinking there is apparently no feedback.
Fix your email process, so our reviews are not ignored. If they are, we
obviously should ignore your patches.

> 
> This is a XHCI feature, but the DWC3 design is built in a way that DWC3 
> host initializes the XHCI device and populates the properties associated 
> to XHCI dev.

You speak about driver now, not bindings. If driver has limitations,
change it. Not really problem of bindings.


Best regards,
Krzysztof

