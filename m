Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA1B78BE87
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 08:35:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23F1E3E8;
	Tue, 29 Aug 2023 08:34:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23F1E3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693290923;
	bh=fVOijAQu+gsXOhYGM6qy12vD+9EThhbBBr9byo1xknc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YRD4MQXexufFjsmkvZZrIv2gYVhCydg0V+1197cQXYcSXcBI/byBKpCxfg1PMMHcB
	 1Xe+4v3WIpoBaxVFFhZ4AmjDF2bIW8s06kentYAwNimmI4iMe5q/iexEWEkQRE/Qcn
	 gstZB3UqwkVwDnLJMF3oKLDO3VU+451q8yGpd0W4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C7FEF8025F; Tue, 29 Aug 2023 08:34:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9B83F80155;
	Tue, 29 Aug 2023 08:34:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2608DF80158; Tue, 29 Aug 2023 08:31:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13F7CF800F5
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 08:31:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13F7CF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Brtqq9vr
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-522dd6b6438so5293882a12.0
        for <alsa-devel@alsa-project.org>;
 Mon, 28 Aug 2023 23:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693290687; x=1693895487;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EbTpS2DfO4MuL752ysd/X26Nj6VhGdHkbTx7pRzKQP4=;
        b=Brtqq9vrvIv6TCQ41miOCtcM2e4xNbsKWLFVR+KMqllSzTv/n2o8omRM6UebQFjTlG
         PWN9eIH8idZiVoFP1DWuje/qjwPwAQRyc1BygoRTflWC6TjPsahO0pasmPgQmQy0bwho
         vrMqnL/lpU+RL7tQ8/NomBCjPXlWvTEmfWOknocgV+Xo0NIVZHJlt4KYCFkgLqYcF3Qh
         rXWT122+hBo2gu1EINYd8rDyhUPFTZCE5YXbhAHrlNRawnNlvIS3cCMZwtk9uFyRaN37
         JOI5v2Q0XgP33llNEKooRraq6RZw6HF8lzNzpuaTw67/wq868+GffJ2AuO/J2ymGavun
         Ax9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693290687; x=1693895487;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EbTpS2DfO4MuL752ysd/X26Nj6VhGdHkbTx7pRzKQP4=;
        b=fe4oZtTBC1atikb0QKjF/Tylu+noLhow9Fv6qXTFF+OpF5dIzJi3qs5xoZFsPKtAGx
         v6f0pIj6txgOGOOem2cLkiJ+TiPrE/VisAdQgf2nVN6l8sJHaZ19O/wKyiy7tI98anB8
         BT3B8sUF0GqVVZrhN+BVG0g3n4tvf992rg2QoA2HRImbzVBWwz0/EosGu0YfmzFSLFqe
         npPunJsXNPtMQMmD8HOMSK2k+S90+Yi8PBWi65hj4+JoR31C/R8ivARWa5h5rvAZhIB6
         l8YEhq06Rj9ONNrik8IuZBgrIUtPdBcgX3F8rqJK4kUgxseVu7xceojfC0Pe+JeE7LoZ
         1zlQ==
X-Gm-Message-State: AOJu0YwaxGv3S2Xo++sOUOtquTI6TZ/R8aW4oWMKTBctvt9fqB+bPtL5
	ICW+Cfqm55wpQ3JC5ENRE1PCmQ==
X-Google-Smtp-Source: 
 AGHT+IHBIqEartLFtfu65129YrZ7at2izi8lIOD0bLViZXVYyy9xn5D+IclskmbAaHFG/r/VTASyCw==
X-Received: by 2002:a17:906:5349:b0:9a1:e011:1a62 with SMTP id
 j9-20020a170906534900b009a1e0111a62mr12417073ejo.38.1693290687299;
        Mon, 28 Aug 2023 23:31:27 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
        by smtp.gmail.com with ESMTPSA id
 uz16-20020a170907119000b0099b6becb107sm5598021ejb.95.2023.08.28.23.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 23:31:26 -0700 (PDT)
Message-ID: <3eec4ac6-83a4-1f79-9b3e-569b21765d87@linaro.org>
Date: Tue, 29 Aug 2023 08:31:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 13/32] dt-bindings: usb: dwc3: Add
 snps,num-hc-interrupters definition
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, agross@kernel.org,
 andersson@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 mathias.nyman@intel.com, gregkh@linuxfoundation.org, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 Thinh.Nguyen@synopsys.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-usb@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_jackp@quicinc.com, pierre-louis.bossart@linux.intel.com,
 oneukum@suse.com, albertccwang@google.com, o-takashi@sakamocchi.jp
References: <20230725023416.11205-1-quic_wcheng@quicinc.com>
 <20230725023416.11205-14-quic_wcheng@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230725023416.11205-14-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: YUFLEB3QBJ2QNWEJCZ45DGAVWQ7WHRNT
X-Message-ID-Hash: YUFLEB3QBJ2QNWEJCZ45DGAVWQ7WHRNT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YUFLEB3QBJ2QNWEJCZ45DGAVWQ7WHRNT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 25/07/2023 04:33, Wesley Cheng wrote:
> Add a new definition for specifying how many XHCI secondary interrupters
> can be allocated.  XHCI in general can potentially support up to 1024
> interrupters, which some uses may want to limit depending on how many
> users utilize the interrupters.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  .../devicetree/bindings/usb/snps,dwc3.yaml          | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> index 50edc4da780e..cc6012e922e0 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> @@ -376,6 +376,19 @@ properties:
>      items:
>        enum: [1, 4, 8, 16, 32, 64, 128, 256]
>  
> +  snps,num-hc-interrupters:
> +    description:
> +      Defines the maximum number of XHCI host controller interrupters that can
> +      be supported.  The XHCI host controller has support to allocate multiple
> +      event rings, which can be assigned to different clients/users.  The DWC3
> +      controller has a maximum of 8 interrupters.  If this is not defined then
> +      the value will be defaulted to 1.  This parameter is used only when
> +      operating in host mode.
> +    $ref: /schemas/types.yaml#/definitions/uint8

You did not respond to Rob's comments before sending this patch. :(

Best regards,
Krzysztof

