Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6391C6B3953
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 09:57:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AA781723;
	Fri, 10 Mar 2023 09:56:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AA781723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678438641;
	bh=XIlsz7hSvger42FihJAhuSnUG3bj2899WTem7kOqpT4=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NsMUMHeKezPkfIrPjZzVVvdrBZ/xsO0B2oYiJozZjb0oSJBAa6+s7bQjbku27+51u
	 u/kFalcthBgwP6o1z4zgz9uvhkRCodWdMF85FQoF8inMus9+N+jY8C/3kTxPAHNvtq
	 SpBfVRIk3+O1ioGv0T4gGB1faYpfv5h1t0oE52i8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37192F80236;
	Fri, 10 Mar 2023 09:56:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A467EF8042F; Fri, 10 Mar 2023 09:56:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C1DAFF8007E
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 09:56:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1DAFF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ViN+S4WX
Received: by mail-ed1-x534.google.com with SMTP id cy23so17462272edb.12
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 00:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678438585;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FTc8WfUJS5pE+gJh6hkTmvwpoZgYTgQwLH01UiXhOZg=;
        b=ViN+S4WXuglyR2uBtr+EvRXEI4vCdxTY/d41nwNFME843reyuLNTFuMZIg25I8vuss
         2ICKGF2ls/FrxbadwSh6U3CntGAGTKlBr69PXXsKsHOErXkyX2DAfGcbYohKvGMefCj4
         DpHgT3pGrHiEaNz/cdWfD2DhKVnTurrzJTUhEWty3kLtbWAC5nG3juAH1kUXR0+iq0MO
         Fuij61l9E2zJRK/3AQBh/i41ghpBmuMFs5igmHiij6ZP8VA50sfIqeivDUkiOi9bAeN3
         V/EPm5gktCSIxNbbfKeRATxF7vWzy/nQoOhY8JaayR14VSuXnroe6u0cByFMBLM4CK6P
         UQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678438585;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FTc8WfUJS5pE+gJh6hkTmvwpoZgYTgQwLH01UiXhOZg=;
        b=lrRFdKUPYoS/Y+l5rjG7AFtVLSwx6gGvAfsrIk7q055lPmgPsryrrlAElWq3nLFyMn
         2TaABLiWT343rp/C2jBEthlL0f+cbW178TYewf8Rqal/fTfJ2hjxKSOMbkY+bvw7DV1R
         qrUhIxZshtumYfmXJ66L9aFISSVcrEzIQEQEkh34rlvES+T6jlR0R4rShMJ7uoRJFkMg
         umWhuZ/xHKP4lTVsm7Ft4P1xunHHjtD2ENzCLQvd+IbPZPecfVT+kAzbpFw62qjNtQ9a
         mNCWzWwIDYwjjafEdnd/mruhjDLGRibUy6TgsXgs0Q4QLTSEbP3SNe6D/s/DF+rwV0ZL
         AkjQ==
X-Gm-Message-State: AO0yUKX2lWZHDbnxhNHXjdI+/pIrcfD2RyeKpwzTdNmXJqkLI4Mmxb99
	Hy+uoN6RlDc8qKfEFlCxdnKisg==
X-Google-Smtp-Source: 
 AK7set8oQbEa7aHmhTfe/KFEnNmpgd8Cm09atyHmqtwJySaJhkBT/4gR8InAUbnJ3CyZitaM9+lRkw==
X-Received: by 2002:a17:906:cccf:b0:8ae:f73e:233f with SMTP id
 ot15-20020a170906cccf00b008aef73e233fmr25072593ejb.32.1678438584872;
        Fri, 10 Mar 2023 00:56:24 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:2a59:841a:ebc:7974?
 ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
        by smtp.gmail.com with ESMTPSA id
 bh11-20020a170906a0cb00b008d02b6f3f41sm685790ejb.211.2023.03.10.00.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 00:56:24 -0800 (PST)
Message-ID: <87f20b22-6305-7590-1dbf-014b5898b15c@linaro.org>
Date: Fri, 10 Mar 2023 09:56:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 21/28] ASoC: dt-bindings: Update example for enabling
 USB offload on SM8250
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, broonie@kernel.org,
 lgirdwood@gmail.com, krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, andersson@kernel.org,
 robh+dt@kernel.org, gregkh@linuxfoundation.org, tiwai@suse.com
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
 <20230308235751.495-22-quic_wcheng@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230308235751.495-22-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: R47BMOK5EZW762HRG4XVS4DH5X4EBELB
X-Message-ID-Hash: R47BMOK5EZW762HRG4XVS4DH5X4EBELB
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R47BMOK5EZW762HRG4XVS4DH5X4EBELB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09/03/2023 00:57, Wesley Cheng wrote:
> Add an example on enabling of USB offload for the Q6DSP.  The routing can
> be done by the mixer, which can pass the multimedia stream to the USB
> backend.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

You still miss binding change to APR/GPR. Where is the USB DAI going to sit?



Best regards,
Krzysztof

