Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E29DC691E14
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 12:19:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F0BA84C;
	Fri, 10 Feb 2023 12:18:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F0BA84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676027981;
	bh=YNguOISCUKyBqu3Vsrve2syBThLkw/em0maQuviG9dI=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=iWY4W8lWOpRJxcc4gML7PN4tL26O8tZHPL3HaH3V3ggVrnJgGPlMoJoZI7akGyvy8
	 Ababi8rtff/DLwC6PHI3uhT7JXRLAFBY70voo9bN/pkdy4Y/E2k7KckD8PVT4lxH9B
	 JvxDPnHZhBK52SMkLnHHgz4bARf+OwIRf9UsuxLE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B82AAF8021D;
	Fri, 10 Feb 2023 12:18:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6503F8021D; Fri, 10 Feb 2023 12:18:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6EAB4F80086
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 12:18:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EAB4F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZVqb+fcw
Received: by mail-wm1-x336.google.com with SMTP id
 hn2-20020a05600ca38200b003dc5cb96d46so6022818wmb.4
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Feb 2023 03:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YNguOISCUKyBqu3Vsrve2syBThLkw/em0maQuviG9dI=;
        b=ZVqb+fcwLg1CQ2EPanYWO3Z6yMVjfNdSv0AQ9XXLu9iX2/PYsRKmZmOLGTbphOcaNW
         AmkM0bHyfKGUkNVXxFXSzCYLobum0bI/v33WOa2UI08vuItuF6WhE0M0NfaZ1oG6rfks
         xRjdGyofQ7+Ws8R5rhsAuoB2so4o/jjyoRm1odcGsKoqLcfgwR3jTewLFHAQBaRHIyTS
         6yv3Sff4z18KNBQX0Kr7was3eaSiyLg4o2p1v7ERuj/C2moFInA62gqRqBN2YbS42tWL
         2fU3OYo0oMKXMA10wTImaNwRs0Ji5RiOaAaBllu+P7qHk4VksF8SeHW+nnwIeCX85D6G
         K7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YNguOISCUKyBqu3Vsrve2syBThLkw/em0maQuviG9dI=;
        b=U0Lqz5Fduom4/ZlyPVqFEJmxrprFOJJnYAHo85oC4yvBbSYudYvHGhYqLzq7fJqatj
         wGVuAi+Is8RZOV7A3Kn8R9XpsazK85xCMe+AuA2/Fr24niu2ACeqiLfJ2yG3XWH1joxp
         utJ2SUwhFUIzUt0jRD3/Knwi5GmbILsz2bAenNw746ZC0RWzxxaA/vVI+7nSAzq9mOdT
         4AkXA5XcQMgovuF9NfYJVlnRmAlXOtSwV4RHbZKchwMLQFOj4BU/ta3e4AJSvHt8JFDi
         Wm157BHPw1R0KoZzAr1DrpRaEmdd689/m7bndgfYK1o6cNSl4T2LIFvh+gmRCsoWwgwx
         42YQ==
X-Gm-Message-State: AO0yUKWTZpp+B10EwnAry6sx0YNIreQycmzUGb3b1F9JDo66Bcxlm18Q
	jD8h66DWf35osjgjqsZXMZiyqQ==
X-Google-Smtp-Source: 
 AK7set8o/gLbKXlzPH7KTDSVRFPog5UfdhUGt/U6ANOSxDva+Eg9HpkDQgfFQUfHt3tcTXGJVdfCyg==
X-Received: by 2002:a05:600c:4488:b0:3dc:572f:edb7 with SMTP id
 e8-20020a05600c448800b003dc572fedb7mr1885297wmo.1.1676027922526;
        Fri, 10 Feb 2023 03:18:42 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 h12-20020adff4cc000000b002be505ab59asm3439709wrp.97.2023.02.10.03.18.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 03:18:42 -0800 (PST)
Message-ID: <0416d7be-3dde-eb22-c129-914367cff7c2@linaro.org>
Date: Fri, 10 Feb 2023 12:18:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 7/8] arm64: dts: qcom: sc7280: Modify lpasscc node name
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
 <1675700201-12890-8-git-send-email-quic_srivasam@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1675700201-12890-8-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4LCTUSP5G5GLNILJKCRXEZ32RNY3OAOE
X-Message-ID-Hash: 4LCTUSP5G5GLNILJKCRXEZ32RNY3OAOE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4LCTUSP5G5GLNILJKCRXEZ32RNY3OAOE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 06/02/2023 17:16, Srinivasa Rao Mandadapu wrote:
> Modify lpasscc clock controller node name to generic name,
> that is from lpasscc to clock-controller.


Cleanups and fixes are first patches. Or even independent patchsets...

Best regards,
Krzysztof

