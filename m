Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B925051E895
	for <lists+alsa-devel@lfdr.de>; Sat,  7 May 2022 18:41:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35F281866;
	Sat,  7 May 2022 18:40:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35F281866
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651941666;
	bh=xo4ni2r3G5MmqOEtRHam3YV/aTvjwGcUrl+8mqvMUus=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ONc5Gy7tCfz3LhRcyz0Y7jre42eEC6DzIVMvw7j9AsYYD+F6MnJmshsL87D7bwagb
	 PqZpwgCq0tmSkGAf6cilt0Trdq0oq2LFCST9TSxuxtoAU/L137/QA7Mmz/jkZzg+zE
	 qk3uW9kf1+TRFEclseOC14cIyo1dLfYKOfLhoBog=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A71CFF80253;
	Sat,  7 May 2022 18:40:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5CFDF800D3; Sat,  7 May 2022 18:40:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D66EF800D3
 for <alsa-devel@alsa-project.org>; Sat,  7 May 2022 18:39:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D66EF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="YLKyP/rk"
Received: by mail-ed1-x52b.google.com with SMTP id k27so11821701edk.4
 for <alsa-devel@alsa-project.org>; Sat, 07 May 2022 09:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3RaGIEkFZ5kFwejARghyQPxVuZ6S7Es2HKyT9T6H500=;
 b=YLKyP/rkyLr+K3S4ZkNTbwsnDF2Ff/J+boIRAnUamlOR2kdpNTDMQtFlkHoBq9EgyS
 pPSTkaUV9V7WR7HDlaF3L/mfGFFg7QA6/+sDXBAGmJVVSSbWSh58LuM6PG3qP4OKD2cc
 R7JdVp9wgYg5pXt/U7laVLErBwUsH0dVHJjHFLlROiZNzUwAEtz2UkOWhgU8SqqbKfS1
 GWKBl9FVONvZvHkEciMakLRyIcMIoJ83ric8Yq0XGaCG2WtmeQcfytbSxhlMGpFm4n2m
 BAiud96OpVjSmDTridqoaeW+q0kCAhGsJVv85eEFWk8pt7kVKcImUfiAsTQAHUuxyMyp
 0hCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3RaGIEkFZ5kFwejARghyQPxVuZ6S7Es2HKyT9T6H500=;
 b=xCkFiA9DmEgCoFkSf9UbBE7GLFgR/8W+xPcgdhknEwNH02/J9nn5KmbRh6mZ1OyxOS
 uHMDApICJWe86FAS8Skqms2XJbet6MW1GnajXEpPlbemPghF65xZuuJ9NvqBGo8jRDI0
 h1kK192yNuI0cRr4BPt8X7Nqu18IXo71Cq9s5/Mjq6CekWyPr2IoiZtN2LwVqc79H9vK
 rDCGHIsXt8IoVZQcWDEcAgFm//4GqHhvmW0xGF3uklMWL5DvdVWaPongJFpWvLqneAME
 eCExIwUJdmcWFuxsYBgPz3JAWMYFw93Lu1QKnCUMhJFGnxsPWwpL0zGru66zHqL2BZHj
 aKcg==
X-Gm-Message-State: AOAM533vlfmNHFns95Dn8sStUGExw5kUqObJ0hggMG8AhIcsVWn5C2Ej
 25bdjpkytjMaC4egULqShueXuA==
X-Google-Smtp-Source: ABdhPJx1RGLQG0UVi15O4+i+wscoev2RL4M9r98bpjBTUzTyGjI1J06DBXH7U2oKxPUQTe61zYtEVA==
X-Received: by 2002:a05:6402:2318:b0:413:7645:fa51 with SMTP id
 l24-20020a056402231800b004137645fa51mr9263748eda.201.1651941597740; 
 Sat, 07 May 2022 09:39:57 -0700 (PDT)
Received: from [192.168.0.233] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 hy5-20020a1709068a6500b006f3ef214ddcsm3124802ejc.66.2022.05.07.09.39.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 09:39:57 -0700 (PDT)
Message-ID: <0403bb46-689b-fcbc-e23c-d0bd3d5024b9@linaro.org>
Date: Sat, 7 May 2022 18:39:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 04/11] dt-bindings: sound: add Arm PL041 AACI DT schema
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220506140533.3566431-1-andre.przywara@arm.com>
 <20220506140533.3566431-5-andre.przywara@arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220506140533.3566431-5-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Will Deacon <will@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Takashi Iwai <tiwai@suse.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
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

On 06/05/2022 16:05, Andre Przywara wrote:
> The Arm PrimeCell Advanced Audio CODEC Interface (AACI aka PL041) is
> a peripheral that provides communication with an audio CODEC.
> 
> Add a simple DT schema binding for it, so that DTs can be validated
> automatically.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
