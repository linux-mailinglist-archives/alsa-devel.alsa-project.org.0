Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF79629B48
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 14:58:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49B8B167D;
	Tue, 15 Nov 2022 14:57:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49B8B167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668520697;
	bh=3C4u2MKgG4xYVYUg8f9kjJ2xGjXSaeADlZ1UpGDpmDk=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KZWZ7jr8X8t9sbdiAqhbrwAzg/iSXje9BzWgcLaFeuaranmHvQYBQhyt1hbF/a1rv
	 vGeBSV7GRVt3aR8AZJSOF/gRbT2L+iHzqJ4CzodkfJF0dz2GppZVfX9xT5PsDqn4J/
	 3/SsgG0uwku//+IlVgmm2O9M4dy7NSsFlIavrnhw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCF1CF8047C;
	Tue, 15 Nov 2022 14:57:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49C10F80171; Tue, 15 Nov 2022 14:57:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B858F800B8
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 14:57:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B858F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ih8E8fkl"
Received: by mail-lf1-x12b.google.com with SMTP id b3so24538932lfv.2
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 05:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eRDy77pLORMZ/XulovaxWyKY5V8oIS0uLhcTxtOQZjk=;
 b=ih8E8fklramz2fm/5na93sr2QZeV4xQv9SRXu+nQBgU8zxhPDbkNEZfeBguyCyhN6g
 8hLDWOItg8pG3YGEQM376J/9kGr3vNLtamH0ulRHB3BPlD31iqsYjllV4YMXi9EU3rc3
 5p3lDezgSk409+a32ar9zhNxMQbYJSk0xs9KoQaQG3vojprSeNUL7CtnJbeJY46Qlq9r
 tI/Ca+VE4UopJjOdJrEJtJG6SWFnwWuDk0Z85Jm83eyc+u6KuYcXjB6wcf8a4HN3BAtd
 AKCnA6I5DOtrS2HVovVaxrvl/HC2eU5ZOfVLKqjIMf3yTXtPTXpdEr6dfArHbUXBwYYT
 J3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eRDy77pLORMZ/XulovaxWyKY5V8oIS0uLhcTxtOQZjk=;
 b=XwsiJvx1MsxlHdHxi+XcXLYy56+6wThOUEED4uwOUAGlP9jOu2/xKpqJFktlHJOwOu
 tPJw8xtCNoAZCfqfnwqv+SvHF8Uekt/PQt1NkqIXun5pHir7TczJeVpDH7fa4TraQkxN
 Ld0J6vddlJQwRJ1FDIUTqMQGs95V03p/3GAOslmlUx/WIFgx1QvqSvv87ZUfbMq7Rtc7
 zQUzMl832zHo4HddWOxXB79BsiuEyyBN8WIr/iNcxM7ZsBz2FI0ySiHdfEOPIzGWXh7k
 JAwMVS/BbVAytdPpz9iAUEJjL1L9ivD828im9V7NY2NsbXs0sYTqQdlx1MS4INnG8S8P
 J91w==
X-Gm-Message-State: ANoB5pkKsNaRaebX3qZRtilZwvktFeuidIHn2UVp40S9OBiO39mZRIXa
 Iq6aPZcUOJy9MZ9ly6KOhlsKGg==
X-Google-Smtp-Source: AA0mqf7dCyJ6i1FCEJ9EudMl+bRs4RS1CImhCmmrmtULiRsWIYxofVo8G8JZ//VkKlUarOnUPvJhVw==
X-Received: by 2002:a05:6512:2983:b0:4ae:6bbc:e8af with SMTP id
 du3-20020a056512298300b004ae6bbce8afmr5360869lfb.411.1668520636293; 
 Tue, 15 Nov 2022 05:57:16 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 d17-20020a2eb051000000b002770e6c620bsm2437751ljl.106.2022.11.15.05.57.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 05:57:15 -0800 (PST)
Message-ID: <76d3c821-a5c1-952e-dc9a-6f1c2f927139@linaro.org>
Date: Tue, 15 Nov 2022 14:57:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] arm64: dts: SC7280: Remove unused sleep pin control nodes
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, vkoul@kernel.org,
 agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
 srinivas.kandagatla@linaro.org, dianders@chromium.org, swboyd@chromium.org,
 judyhsiao@chromium.org, alsa-devel@alsa-project.org,
 quic_rjendra@quicinc.com, konrad.dybcio@somainline.org, mka@chromium.org
References: <1668510598-19535-1-git-send-email-quic_srivasam@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1668510598-19535-1-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 15/11/2022 12:09, Srinivasa Rao Mandadapu wrote:
> Remove Unused and redundant sleep pin control entries
> in herobrine device tree variants.
> 

And these are redundant because... ? E.g. not referenced anywhere thus
not used?

Use subject prefixes matching the subsystem (git log --oneline -- ...).

Best regards,
Krzysztof

