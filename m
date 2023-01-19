Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A7A673A1B
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 14:27:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37D647F2D;
	Thu, 19 Jan 2023 14:26:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37D647F2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674134844;
	bh=yJwpymIZou6ODPxXMJMYjGJV0f03q0qTnALZvoZmr/k=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lEwPA5PGnSyQ0VQVSmQcbQ+9wAeGGlcptTf5Gh4Gzft7gS7n7llYk2fVyNkfSLpDl
	 JXRuIO3Px9LBCJLNsdZB9q25A2Jb5n5LiFAF4twxzKv/xSXQ4/b6nkgcgoR45KPlZO
	 7Fzt7GsnOxlhhtEfLMznW0X9tCGiJ/gP22mzsMb4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D025DF80083;
	Thu, 19 Jan 2023 14:26:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C849F80083; Thu, 19 Jan 2023 14:26:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CAEFF80083
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 14:26:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CAEFF80083
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RTx+nVav
Received: by mail-wm1-x329.google.com with SMTP id g10so1534903wmo.1
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 05:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=liF/fJsraKfm9Mh6BETv21w34Yvp7QKUx+OiIsQvbek=;
 b=RTx+nVav6lWlpATz2R0+33QBCCwdDVZpJNN2IzIHcJguzSgbjxAIKqa7Opp+LawcFz
 VzxoBCy1LrqcV/UIZ6kBj2/mwrw4c9X3sJRsljzkv3xxtazRGFDAsWjNV+Qjyc9PWxQu
 b9jOlldhOp+/Ws+k03g/T1GaLPo1US/aP/tWSJu/y5XG/9Iryw7Szf4rMvFFtHzX0seS
 B2hmCmN1Etg8KoOikAuBCq2ge7eLxYDZczlqqGAzVVBa1cUbmpvAj+ZNn1Z1zRqqAjXE
 /2cHV5u1uRZWVyfP3XC1XGtF5sngK7yok6oFGqN7KCCiNpVjo+YEjqnwfq0E84bm6Hyv
 rSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=liF/fJsraKfm9Mh6BETv21w34Yvp7QKUx+OiIsQvbek=;
 b=0HFpP7/LbtTDgvCFeoQgLR3E/oPsvnTtSikK55lhzms+Gh27g4kJc1AdchBOaW/m0W
 Gwmq3YN2GJHEOqQtYT20YxGrLwchO5yTYES0/4YwEQdKDnWSOe/7qH9N1fLhKy4gBNWz
 FKxLO6j6lGy/G1fsHsLrz1vdRzBD1c3/e2m91Znte8O7cUpOy7i0E0fr/1JbntIkphmf
 Im5nXiYa49/YyREMay1sqIMV6WSHZIcjF1l6PqSgKHY7/HdrUvjh7Rjm8AKR5uy5/Cd/
 6sawo6pgIi4oe87abyqngkm28pQXEmRehpwEBf25/ENsNhO5wcQ1xFCWINov6T0/OmXr
 WC+A==
X-Gm-Message-State: AFqh2kqXm08mmYyezY5Hz9w/DzHnApDEXcmx3eSpLt3YFfMhnCqd0hnv
 05dAnKkhNg2KJY16UVdKyEPpIw==
X-Google-Smtp-Source: AMrXdXswERYqjY+bheQCm0Hc0ktL/bw552J6U/3HxxcEPZmxwkI00Q5qpa1OapFFY2kT2djlObY54g==
X-Received: by 2002:a05:600c:539a:b0:3db:419:8d3b with SMTP id
 hg26-20020a05600c539a00b003db04198d3bmr10507790wmb.39.1674134781449; 
 Thu, 19 Jan 2023 05:26:21 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 bp28-20020a5d5a9c000000b00273cd321a1bsm33847822wrb.107.2023.01.19.05.26.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 05:26:21 -0800 (PST)
Message-ID: <16d26962-f55b-d420-e70e-bb832ca088ed@linaro.org>
Date: Thu, 19 Jan 2023 14:26:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 2/7] arm64: dts: qcom: sc7280: Add sound node
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, vkoul@kernel.org,
 agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
 srinivas.kandagatla@linaro.org, dianders@chromium.org, swboyd@chromium.org,
 judyhsiao@chromium.org, alsa-devel@alsa-project.org,
 quic_rjendra@quicinc.com, konrad.dybcio@somainline.org, mka@chromium.org
References: <1674131227-26456-1-git-send-email-quic_srivasam@quicinc.com>
 <1674131227-26456-3-git-send-email-quic_srivasam@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1674131227-26456-3-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

On 19/01/2023 13:27, Srinivasa Rao Mandadapu wrote:
> Add sound node for sc7280 based audioreach platforms.
> 
> Include audioreach dtsi into crd-rev3 platform specific dts file.
> Also remove phandle to sound node, as audio routing is same as
> audioreach specific dtsi file.

Your subject does not match exactly your contents. Subject says you are
adding sound node to all sc7280 boards. Commit does something else...


Best regards,
Krzysztof

