Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 192F6690E94
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 17:46:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F28BFE85;
	Thu,  9 Feb 2023 17:45:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F28BFE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675961198;
	bh=NwAciBMbjXVJ/MVLIgDLLNh2HaP6Nxd+afExySuIwMM=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=YXxgjLHhDKsKdNy1YoGZCm3JbRdsz/SvRpJp0Dx6/a/D+lo714jdVnW7OnWO3UmvA
	 tHR03ybN7oEXDKV+ll3mdBH/jgBCWGOaTc3ozICSUt5vAQj1uWfuVNDGoWMb6Kqcg0
	 dhTwjzBpxTb6dpyrM53xbkUBddJ/AOasFQSz8k3M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56EE9F800B8;
	Thu,  9 Feb 2023 17:45:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17AA6F800E4; Thu,  9 Feb 2023 17:45:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F01EF80086
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 17:45:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F01EF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=XaUegsDx
Received: by mail-wr1-x435.google.com with SMTP id bk16so2372162wrb.11
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 08:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5uR5i0FrMW5N/c1BvQuZ5egyuH7BVj5RSnsyknMvLzQ=;
        b=XaUegsDxVj5QXZDHVD7KSRMczAS+lUxthkMpuK4CerQmBlvHQNoBNpIvqVyaiBM91l
         bLJL457lpw4igMDHcFVjRooyjly+y7KQxf2yN3xXap1m9Ae/nn8fW94Ap2R8g5lU6DwS
         vPLvvfDy7XAYrqJXLotfkJl+o4g35ARzuNG6szs5XHhL3jFGojpgN1CVZzOHM/ACQXHO
         8MIY4OIFNBH/I+26/y2mM+3wAnugSOnhfjOg1/ABjiYmN2OfdHmutuXl9MZewLh54qzM
         vQaWjDoGPssQTK2v3O4JDd0KwHrEaHNVrX9EhyZiVONHFNHRC6FKZ48VFs714X+CtzpP
         5Fig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5uR5i0FrMW5N/c1BvQuZ5egyuH7BVj5RSnsyknMvLzQ=;
        b=NAJ88gxnfA33UvuX8scO5VWtIC6SCYr7HxcszH5Oa2VLQbBVMP4M69kcJk5JnjfF7J
         Zqvt8kzeNtEHuTin8NTOTsGC0MNuMhBi9uh4oidiU1Nnm3q29+KTN6A0gH2gS8h8up3u
         zJHKfvel2oM0TvjZg7bzpvAFrBFv/6P5UAUkR5XPWWxRABOpf7kGCImy2ajbv4/FAcxM
         zSCSepzIw2jbYR2Xa3CXCoXJ+/18lvOXBLpjzNIcxn9XSLdySKJa603+XFWH+CNImedc
         42LcY/QURSM4zsGraiqo7d8esSwcxrLC3U+EB6t2t+fDrmitQ0bZGngQYanaVDa0SlVU
         /7Aw==
X-Gm-Message-State: AO0yUKXdgcMHn4B3Y+OirBvKmWjY7aOxzcSb8JnbBWV32hHDfiIRndyF
	azDkNpfWFfvVUvHsd0u36q33DQ==
X-Google-Smtp-Source: 
 AK7set+p7l3XRf70/iTHIzo4O2nXKUZqUcmJodQy8/cPPK7RklqnjaQsmn5XZrA/tviz7lznisNvLQ==
X-Received: by 2002:a5d:498d:0:b0:2c4:b150:9273 with SMTP id
 r13-20020a5d498d000000b002c4b1509273mr2836816wrq.19.1675961136292;
        Thu, 09 Feb 2023 08:45:36 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 n1-20020a5d4001000000b002bcaa47bf78sm1649946wrp.26.2023.02.09.08.45.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 08:45:35 -0800 (PST)
Message-ID: <3c1b7ab9-c228-6d72-47e9-855e12fdba4f@linaro.org>
Date: Thu, 9 Feb 2023 17:45:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 1/8] arm64: dts: qcom: sc7280: Extract audio nodes from
 common idp dtsi file
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
 krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org, agross@kernel.org,
 andersson@kernel.org, robh+dt@kernel.org, broonie@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
 srinivas.kandagatla@linaro.org, dianders@chromium.org, swboyd@chromium.org,
 judyhsiao@chromium.org, alsa-devel@alsa-project.org,
 quic_rjendra@quicinc.com, konrad.dybcio@somainline.org, mka@chromium.org,
 quic_mohs@quicinc.com
References: <1675700201-12890-1-git-send-email-quic_srivasam@quicinc.com>
 <1675700201-12890-2-git-send-email-quic_srivasam@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1675700201-12890-2-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VAA4Y7KGS2LCIZOIBMUIDVFGRM7ZDLD3
X-Message-ID-Hash: VAA4Y7KGS2LCIZOIBMUIDVFGRM7ZDLD3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VAA4Y7KGS2LCIZOIBMUIDVFGRM7ZDLD3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 06/02/2023 17:16, Srinivasa Rao Mandadapu wrote:
> Split common idp dtsi file into audio specific dtsi and common
> idp dtsi file.
> 
> It is required to isolate idp and crd-rev3 platform device tree nodes
> and convert crd-rev3 platform device tree nodes into audioreach specific
> device tree nodes.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-audio-idp.dtsi | 135 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts     |   1 +
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi       | 126 -----------------------
>  3 files changed, 136 insertions(+), 126 deletions(-)

Actually you need to rebase on latest Bjorn's tree or linux-next as few
properties were removed, so you need to remove them from
sc7280-audio-idp.dtsi:

https://lore.kernel.org/all/20230119122205.73372-2-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

