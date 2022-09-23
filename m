Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 925905E83A0
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 22:29:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20B56825;
	Fri, 23 Sep 2022 22:28:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20B56825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663964981;
	bh=euTgqkSgh+4GTyKOzCTedi11HTECFND38D4aXnTBQzc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MmDwXbf1R1EYEcSQee+e7Q0r7BW/mawi8nm81NdSW1u+ZQQ0Gszt/Bl2gkVbv1Pr6
	 Qq6FqRn0Yku/pKB4RtkwOHBhyxvPvRvwRZhPDGjINGdollteHzkYbTDLqimqHqAKyb
	 N4Z+Ys09o1iMgorJWP3FgxD0qsvSQK+RUBxvr3uo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75753F80107;
	Fri, 23 Sep 2022 22:28:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60CC6F80269; Fri, 23 Sep 2022 22:28:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59E80F801EC
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 22:28:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59E80F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="JGNV/7eh"
Received: by mail-lj1-x235.google.com with SMTP id q17so1254045lji.11
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 13:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=dRBiNzhvL0fZ1btpeERnXtz/brYGVXxmj/uHgSA0610=;
 b=JGNV/7ehKxkXA6HowZDNPyS3U+aex1as67ku86jF9uZoqlqh5CgFk3yDy2HwnzVgCE
 5vLO2P612JYylDavD0MTm3myJNT7QmDHOfbtlhhVpJ+Q9VzF2ABHN/iNcjZvUrRCD48O
 Z2EL0E1d3OofeGa1TMbqNmV2RE5jRpW7GniL2c3BfoDJIgD6ScTF4JKSX9HBBmR3Mbrz
 1GtGmi5dXTXcVfSy1LpSwDnqv3euCGbJCHW5VPhjKsV3k+i8t0uOgIh7bwiN1tOqc48v
 8dCnN/2Fd0riW4uxqmXWzHUF0vtHRsqpoVKhrKEUxVPZ6arbv1BhPTNe5HDGryeDDATq
 E7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=dRBiNzhvL0fZ1btpeERnXtz/brYGVXxmj/uHgSA0610=;
 b=V+VLCb18U8b1DHj8UY0ZpCM6Rp0yjMlDLoLcpuEnCWqbCNyl7b1Z4EY5KG9fuVLZ0E
 YRp6+ZT2spjYr6sTefBdwC3uOqPQwWblchuRRVUQLwNdvOwwPrnv761sO6ubZ1rIZSER
 ydTZCGYm9GIA5n1NXeAVydiDCDu4qb6DLXj8JfnUPkeNUWPzyEUgy3W7H+PuJU+SfCPE
 r8YIrvh0hhZ2HT9oOoC2WFShVqxuBmV58Xbzs91PhLokojqc2b1U0OxfAxLjKvzBctH4
 Y5I3A+97JVtcY1qPk7GIfud6UaA0teBvpixQk3AkUiYT+Qqg50JXfk7+39V99zdfUmix
 cwMg==
X-Gm-Message-State: ACrzQf0BST4046x5ThrrKFD3qz04+GJVcQ7JS4pHIPzXHAYowYDhV2cb
 aKbL09kA0slpI9/3FSGoSdGgSg==
X-Google-Smtp-Source: AMsMyM6Afp+Gmn1RVL7p08gPAY9RDWH10sbYGoj8p5xDl3eIWEfgDkusANv9wbw+j1GwRxnO305/JQ==
X-Received: by 2002:a05:651c:1795:b0:261:af46:9d12 with SMTP id
 bn21-20020a05651c179500b00261af469d12mr3537893ljb.122.1663964911587; 
 Fri, 23 Sep 2022 13:28:31 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 i2-20020a056512340200b00497ab39bcd0sm1594791lfr.96.2022.09.23.13.28.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 13:28:31 -0700 (PDT)
Message-ID: <e1576227-e9ee-a6bb-bcb4-f142f99300cc@linaro.org>
Date: Fri, 23 Sep 2022 22:28:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v4 01/15] arm64: dts: qcom: sdm630: align APR services
 node names with dtschema
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>
References: <20220910091428.50418-1-krzysztof.kozlowski@linaro.org>
 <20220910091428.50418-2-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220910091428.50418-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, linux-arm-msm@vger.kernel.org
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

On 10/09/2022 11:14, Krzysztof Kozlowski wrote:
> DT schema expects APR services node names to be "service":
> 
>   qcom/sdm850-lenovo-yoga-c630.dtb: remoteproc-adsp: glink-edge:apr: 'apr-service@3', 'apr-service@4', 'apr-service@7', 'apr-service@8', 'qcom,glink-channels', 'qcom,intents' do not match any of the regexes: '^service@[1-9a-d]$', 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Hi Bjorn,

The bindings parts were picked up. Any comments from your side on DTS?
Do you plan to pick them up?

Best regards,
Krzysztof

