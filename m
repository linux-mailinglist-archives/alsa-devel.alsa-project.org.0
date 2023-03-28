Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 094106CB76D
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 08:44:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE91F41;
	Tue, 28 Mar 2023 08:43:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE91F41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679985889;
	bh=nH3G50yq6fOPKmcJWRUk/oesvWZ9P2L24dB4JcoGsCY=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DVjVnFkpOxf8t1BbUhjQoS+Oj71qLCa7dN8uH3JNgxN5nlqLD/SsrZaEDDwnCjpDF
	 BeWKEWa9bnmJbG1tVAT/X1+rGwUEQOdpBSWpj85atWf6bge1/mRrUQm5DlqydsJrWX
	 /AC0bqd9VzHTNP9QEiq+lsJZG7te6e1IXsDI/7VI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BE3FF8024E;
	Tue, 28 Mar 2023 08:43:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 288B5F80272; Tue, 28 Mar 2023 08:42:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4975BF80249
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 08:42:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4975BF80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ngtTT0iR
Received: by mail-ed1-x530.google.com with SMTP id y4so45447647edo.2
        for <alsa-devel@alsa-project.org>;
 Mon, 27 Mar 2023 23:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679985760;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4USwIO7rQUMdTt0AvopWzJfAqIt2lpjOmFwk/o1NlOc=;
        b=ngtTT0iRYVCM4ZmXXvc+yseTWLI4wIQU2+APRsRBPySpZFVA1MwZnkwLGEEKrFgCfw
         LvnXxESZbnMMkqwDMUhTGPmaXlu6SI6lnRmDARnCW63t1a4FYZ3qKt5yfYh3VfPhFlWF
         ygbLWiqgv8fRRbBXPfQu4oBCEM/AMk695VCbusjPjNrz8MEQCOdgfTd2y82fOjPn8vTl
         j2AT2JOB11J2vU1CivPHbhvpRwBIEDm6ccYQ8gnJ+aruDoFgf97niPi0Hwcb1U9VA+cG
         lJQqjIGM1LepCTAMvEKQItzrKG9yRdLovpq1Qx52ZBSMLEEZGjo4zA2YEDMvcbr4S6Tg
         jhAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679985760;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4USwIO7rQUMdTt0AvopWzJfAqIt2lpjOmFwk/o1NlOc=;
        b=qQqMImqDbwSCkvUNvfiGiguk092vPvgQ2kmEeiEhEEcGKv8cLOQ23mLbU/gABoXSIW
         4n7dATuWpqYtJECkQsHW74kkmA/gEJ8B3OIR94RbqC978f7Wfi6pn9R4mtcgeJ98HQwV
         2XU/7lJFdjJocBbUL1EaNKBRtCsolPR9G3bUaZ9Stn1fy1uhvNZ6LQmLQx5xKXrYcmat
         8LncXcCPPtebOZMgN0lqn2bE20VTH51TbT3xSpb5QgpdWqFty4Z3yYWb/i/f5dAYocqN
         ZmvdoaiXFQwNGSM1/O5O2W6KGvDO0+EMaXfTlipx7tjP3dZoOAZdSF/LxMAMQrnB1pOi
         A0AQ==
X-Gm-Message-State: AAQBX9dV4I+1hOLgHWqGIidBjLe3SnWcpNxlyLpBARR6tKn7casoDVk4
	qrbhv8mJhrr1FQKPqsYlV5/Vrg==
X-Google-Smtp-Source: 
 AKy350a81urn20Et8YB+owcqnHygl1VpRFKCDJT6BT6dQnx9oNwzuS8eEcPoFHWDcWPPvJ2ZjBACyA==
X-Received: by 2002:a17:907:10cc:b0:932:2874:cc5 with SMTP id
 rv12-20020a17090710cc00b0093228740cc5mr13989964ejb.16.1679985760090;
        Mon, 27 Mar 2023 23:42:40 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6?
 ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
        by smtp.gmail.com with ESMTPSA id
 xh1-20020a170906da8100b0093f83562f09sm3860161ejb.87.2023.03.27.23.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 23:42:39 -0700 (PDT)
Message-ID: <33448f1a-ff6d-46b2-b181-d4e57983fbd4@linaro.org>
Date: Tue, 28 Mar 2023 08:42:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: soc: qcom: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Souradeep Chowdhury <quic_schowdhu@quicinc.com>
References: <20230327170205.4106310-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230327170205.4106310-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: H6Y5YFNNIEM2ADS4YYCLHKFT27TD2ERL
X-Message-ID-Hash: H6Y5YFNNIEM2ADS4YYCLHKFT27TD2ERL
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H6Y5YFNNIEM2ADS4YYCLHKFT27TD2ERL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 27/03/2023 19:02, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

