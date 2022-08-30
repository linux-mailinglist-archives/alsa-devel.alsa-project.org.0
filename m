Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1406C5A6B30
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 19:49:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85F38820;
	Tue, 30 Aug 2022 19:48:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85F38820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661881769;
	bh=OD6nLI2nBr7eJMyT4g+3Gn2B/nPJwACzjrTmwNhZdz0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rc+Da9avMsBx/WRWMTiK8D72WHFMgh2oyTIpO3RQVvYtcyONEYMlvAlAh/mlcU19m
	 uzMt8KIlxxxKZ6RS57HjbRH6IQjYZnavbiiBAmcHbY3qth/X9M7O2hiij0nDpJ1iXM
	 R35GDov7WyKnnAMm99GR5ayYxZPlDybhtkx/WCUM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07994F800AA;
	Tue, 30 Aug 2022 19:48:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E9E9F8023A; Tue, 30 Aug 2022 19:48:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFB71F800F2
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 19:48:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFB71F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Pa38oV3E"
Received: by mail-lj1-x22c.google.com with SMTP id q16so12161570ljp.8
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 10:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=PSuf5+uKyRCAUiI+NXml1CeEx283tkYLDjiJC0rmPIc=;
 b=Pa38oV3EVhdVuxDZfh0mLFLLZj0UBeyf9wUuaxsSKLBOQMSwP/+JXnyg/+1bYSvB6P
 clumNFaYdbLtvk3RCoO7z7tXkfk3qhapicwWk09WHdnxzWc6l/jfpXnmuEU6KnrEz6Kt
 VofAZ3ldyFZosiRqzUpeLIlIMVS5EmYCySQI7+EOvU+4cABLf/SL19ENqRy7bEdgXjgl
 v1/C7lRGBdGDQM+im6QASqFK3eALWIvAwXYcsU/o7jVMguTS3WO9LcyxT/iQR3MKPL/T
 5U0Lw0y9tdW7IwO+/VcodE8+Mip00rT3Vv6Vl3fb1N3QUAG1skvdmwM8K6uAuldeB38q
 PIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=PSuf5+uKyRCAUiI+NXml1CeEx283tkYLDjiJC0rmPIc=;
 b=W5+19UAnuXPZs1FBBk0jrAvWrGtLRafCNs/wV8Q1LpArFpXlOA7eKFPgwXLxxrvoIi
 Ey9RxOuk4tN8mbAwTRh1pwSuyrLqkLvN67N318hWdKtGjiw3RQCCLbkRHgtTWSHwvb94
 hnW0ySaY4eaAfCjjW7ZMTfMiYZXJdrQkv5pBE1/kN19KD+UVspgz1JzHVZqKQz00wO9z
 dyzSJjhgImpf5wsNeilUfFLNlDDxlOMpd5HT7OkNVRSu9fBj+mt2jMH80N5gPH0AtL/W
 yHJQfQ6M7jldToVMFceNqkycvgA5RBL3cw+o9XgZI4BD7cE7dN8pyMrFVDjzktpG3BfO
 TdmA==
X-Gm-Message-State: ACgBeo2JZmIVaBOIKQtA7xzt7xeSg1A69TQ32uXtw1DhxiUiHeevAsuW
 CWOxWHIue7zkXQyq5DKnPJeDug==
X-Google-Smtp-Source: AA6agR7HZ6jJHiaVODBD57pgKGHlsu+AMUYygh3v4y+9xL4VMk3jrHV/vfKt6fcZwoaqiu0Yk7UBwg==
X-Received: by 2002:a05:651c:905:b0:261:d00c:e71 with SMTP id
 e5-20020a05651c090500b00261d00c0e71mr7370638ljq.407.1661881702529; 
 Tue, 30 Aug 2022 10:48:22 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv.
 [109.73.99.134]) by smtp.gmail.com with ESMTPSA id
 n2-20020a05651203e200b0048a757d1303sm997253lfq.217.2022.08.30.10.48.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 10:48:22 -0700 (PDT)
Message-ID: <3c319873-72c9-632c-7c32-4ee909aa1e64@linaro.org>
Date: Tue, 30 Aug 2022 20:48:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/3] slimbus: qcom-ngd: use correct error in message of
 pdr_add_lookup() failure
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20220830121359.634344-1-krzysztof.kozlowski@linaro.org>
 <a437b91a-281d-56b3-41bf-15d9593ece74@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a437b91a-281d-56b3-41bf-15d9593ece74@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: stable@vger.kernel.org
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

On 30/08/2022 20:33, Jeff Johnson wrote:
> On 8/30/2022 5:13 AM, Krzysztof Kozlowski wrote:
>> Use cprrect error code, instead of previous 'ret' value, when printing
> 
> s/cprrect/correct/
> 

Thanks. I'll fix it.

Best regards,
Krzysztof
