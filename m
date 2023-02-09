Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC94690E73
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 17:38:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 540E4E86;
	Thu,  9 Feb 2023 17:38:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 540E4E86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675960734;
	bh=W81yRJWO2gUpFo/uY1UxwTalQLbhMYDuIdvBx/v9oD8=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=lWLM15PFC8lXPdf44L1QuvRsjcDLOCUAsnUHFYSbDF42OSicIPhsiG+1LKCZYRhwt
	 XfIC5hjLZfQyCSmgPCcl7kaG+4FrvJyP/SZZBHDNId/Z5cnXPSLpajmIUQlC0rOhUL
	 oqS9ctPQFyIsSSwMXuPpcUT0ONef0oix8Av1C1Gk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4352AF80094;
	Thu,  9 Feb 2023 17:37:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88382F800E4; Thu,  9 Feb 2023 17:37:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3EFDCF80027
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 17:37:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EFDCF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Wfn6Ir6i
Received: by mail-wr1-x430.google.com with SMTP id by3so1058485wrb.10
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 08:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+6IMHM6bYOKutk0YdNvntbL0y2XtMlW6qRW152/MzxA=;
        b=Wfn6Ir6i0SB6/k4FLWKx+lzycFZDfN9jz9YWijUMfx50xkhrtGhUlk1SF3X980iKGd
         mfURqJO113X6jF9cgsffnZbYxxC4SUCiVBpg0zIOIUotmi/6n2otDHjH9cIeFLi1W80+
         l8x+KtQbgn5OzYc9hMkQk7Z5EqwWZZhttYiy/yXCWyAEdkAGn7qWrVyVYSTOXD5Q8pP0
         UwCvie7MbnY2HptWoM7VZZBvCoUGFiR17OzNy++/CHJFE/qVjK+h0PYZuO5VhsvJXRtf
         G5GGqR5HUzmfcx44oior+/N9kRMpAQ8z+OMAcZGL6j9U5XsglMxtDl28FeMca87UGPcU
         j89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+6IMHM6bYOKutk0YdNvntbL0y2XtMlW6qRW152/MzxA=;
        b=PPn2lRZRsfGwLy+M/Qyn0ZhX6dgjfsBQT2SSgWOzIGqRPoFBoT5WHnrw77xtOl1Qxq
         ZF7h+W5mHkl+32hekLPtGefrp4uEslUi9dtzZZp9TYM57XI+HZ5jO+AkQNaTcecZTZ3y
         XU3GNmV1n4Smenw8824+bQ5EyeaohWkSmuoib/YHB7OejTEgUCrHbIdizGLQ/UkKGyuS
         QI4rGysebE8SOXBae+3uWxXU3a1CzDooe2MM33Et3vS3GEBRJNZlFIyUm+nHQ/2TZ+3T
         6ut6iHp2ZZbt95wtHGP2851ptxZixxqWuC/sNisbQ8AoXe6EqIUum7PxCUbMx7xZ1ZUY
         064w==
X-Gm-Message-State: AO0yUKWG+E+RrXvBCbZtHWUH6OZ6WdG5VUvBJ1FiC4GthUNB/4GeO6Ke
	fjM7+/2zTNFmix3BEQxQz/ZG6g==
X-Google-Smtp-Source: 
 AK7set9dfFDigYwrxwbkMbGuhq64PcoLZzpYnYkNJPQHYcVgPOBa6CwZp19qG1Oih9nJ1ZdvR6GGMg==
X-Received: by 2002:a5d:488b:0:b0:2c3:db9e:4b07 with SMTP id
 g11-20020a5d488b000000b002c3db9e4b07mr10571081wrq.64.1675960645624;
        Thu, 09 Feb 2023 08:37:25 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 n7-20020a5d4207000000b002c3ce97ec38sm1668525wrq.115.2023.02.09.08.37.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 08:37:25 -0800 (PST)
Message-ID: <6729433e-9560-4a09-e0b5-badc2542e6ca@linaro.org>
Date: Thu, 9 Feb 2023 17:37:23 +0100
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
Message-ID-Hash: BIPNZLAL626RD5FFZJLQWNFJXTPN47TW
X-Message-ID-Hash: BIPNZLAL626RD5FFZJLQWNFJXTPN47TW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BIPNZLAL626RD5FFZJLQWNFJXTPN47TW/>
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


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

