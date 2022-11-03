Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C43618971
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Nov 2022 21:12:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 349901655;
	Thu,  3 Nov 2022 21:11:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 349901655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667506369;
	bh=klUOIi6FzxgUJVdSJhJOJsWQYuGDoEwWriNyvUgxWmc=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=di55ZsS4rOIkV+vvuhXiiePA4cndJgl/L+2qV5TCo5sFd3EfmgHiunDP+Rk1Ps4Ns
	 r3BygKtEopeHSz2t4cKRbrNobLr6p3QE3GIP7y4knbL8DLBnB983CX0nDioNhjxrxL
	 RzvHJd03Hjxd9+ddU+XxD11EbGaE3AilLuWOHdtI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F759F800BF;
	Thu,  3 Nov 2022 21:11:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB639F8051E; Thu,  3 Nov 2022 21:11:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AD7AF80155
 for <alsa-devel@alsa-project.org>; Thu,  3 Nov 2022 21:11:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AD7AF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="N8Cx5l1o"
Received: by mail-qv1-xf35.google.com with SMTP id lf15so1471417qvb.9
 for <alsa-devel@alsa-project.org>; Thu, 03 Nov 2022 13:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PrimzIzPPp8bVBxanaG5ga3MP/bHph4X0kRJkSrYGJc=;
 b=N8Cx5l1oJCmtXUgDvJzA+5DBhwJX0WYyN6pyDK2XT3XLafugSjYynbiiRZ/oDk+THK
 Or4XEAnDoEu/AwbpYuyuARki9pJA9EJRZ3AmPbMG6tQVA/lIGsJz6Q1L54lgx21q0nBi
 RqP8nnSVvxLrCChM+ARWz0XrqiBJAtFHafg/IyhMaEo7+AtjgEe171bHPWIanZNXxIcC
 peUFkLK/NbskjEMfbPjcP3Mad4FvMQN8P+AJarl7gVL1xuPq1ul8olN8ccYkCmG30DbZ
 vOD81Qtwe6XcMlAvo/3cpZrOgrj1+7Lz99HL0wGzVYt8Hqz99fgKnzAN1wJd5yuGlNgP
 863Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PrimzIzPPp8bVBxanaG5ga3MP/bHph4X0kRJkSrYGJc=;
 b=i18X9nhFDz923fzt4Bvk6VpDXrtgAMum6uCYWbM6A3So83wv7ccDtcxAFkuL0WJ6rL
 /wx61AEf91z8CMLmS9dqGFW1Iq+P1s6WpwxF6s5pRDq5MUp5SBdBeP4Yh6y6N9MprxjP
 s2ZcSTb8CorMmzOO1D9pmdOv1cB9vsUeYIPGsmxtUVz6B7uYMEQ2sMlVof0ImE4SufNT
 tovhkRl8bKAfkI1DiybGWI+0JYCqDzV/OyqCg5QKZpf+L4gD50RBWG8j2u/u8Mx2lHPl
 BYPyE/50M1YxXEIAqs+pMzygIE/0vhQ+WJPGUtkhefNoOr8n8vH/c8iJMk5F4N0E9U5H
 3k9A==
X-Gm-Message-State: ACrzQf1qRwaqEyYpRfhvgtshUUPHsXjh2x0pqOQiArNfzadzaBdpUDkA
 Wt/5z6xwnsNvm36qprNZ5CVLQw==
X-Google-Smtp-Source: AMsMyM5H62kxeV7yp7AnAcnsjXUa4XSGNBIeAuiCZPj9D8LmIKBTqDX2L0UvDLi+oSYenytveGQZEA==
X-Received: by 2002:a0c:cb01:0:b0:4be:e9f3:6d0 with SMTP id
 o1-20020a0ccb01000000b004bee9f306d0mr3714969qvk.3.1667506304876; 
 Thu, 03 Nov 2022 13:11:44 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:a35d:9f85:e3f7:d9fb?
 ([2601:586:5000:570:a35d:9f85:e3f7:d9fb])
 by smtp.gmail.com with ESMTPSA id
 e2-20020ac84902000000b0039cb5c9dbacsm1087850qtq.22.2022.11.03.13.10.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 13:10:58 -0700 (PDT)
Message-ID: <530b1295-1b8f-fcc7-924c-6f20e0b604e1@linaro.org>
Date: Thu, 3 Nov 2022 16:10:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 2/2] ASoC: codecs: wsa-macro: parse clock-output-names
Content-Language: en-US
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221103195341.174972-1-krzysztof.kozlowski@linaro.org>
 <20221103195341.174972-3-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221103195341.174972-3-krzysztof.kozlowski@linaro.org>
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

On 03/11/2022 15:53, Krzysztof Kozlowski wrote:
> If we have several instances of WSA macro, each one of them should
> register clock with unique name, so parse clock-output-names for this.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

This one patch is a duplicate, please skip. Apologies for the mess.

Best regards,
Krzysztof

