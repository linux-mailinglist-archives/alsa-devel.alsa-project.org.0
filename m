Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ACD608E97
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Oct 2022 18:39:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FB629FD0;
	Sat, 22 Oct 2022 18:38:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FB629FD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666456782;
	bh=09dbn703reA4FCdhJjPzfu9sNeDX/0oS18Pqv+rPa0w=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YLAY+AHt+L9rx7nd/r3ndLy5LAON7WjJ/WnxNNVDoTdFGnJah49ZzBY4JHJuPccNv
	 3GcsJbehExBE8RYb/fAKb7u36M0Om/hyEBbwN9ExcKJTJpnFuEV60Vl3m3R9NSVUSx
	 MJ74VkEtGHUvO4xdcEKG3pT91x+AOjyp04zFczVA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB3DEF80130;
	Sat, 22 Oct 2022 18:38:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91EF6F80246; Sat, 22 Oct 2022 18:38:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78DD5F80134
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 18:38:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78DD5F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="upLrr8Mt"
Received: by mail-oo1-xc31.google.com with SMTP id
 s1-20020a4a81c1000000b0047d5e28cdc0so857992oog.12
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 09:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=09dbn703reA4FCdhJjPzfu9sNeDX/0oS18Pqv+rPa0w=;
 b=upLrr8MtWn1K4A18M2nSQc6qJHAz97rbXyAxel0+KJetCPPyqMUZ5qEKqddgdFhDtJ
 UmBuISjXjVWoybefbtD82JqmgaTi9dROiKXIwg5bkyqBDlyosUvK2eeiAxeVwIHePGlD
 1IVzlUcoINGe8vRdRkaG7v27NgFgM8BD7g0QK3SZ03PUtZBSKb9l2VbUdSeHyrxvxnPQ
 01tcUQC0yS1wR98MX9kt/KRm1tw99PEkKE4QuH0OTdOK4+LmgCGv0IOZGlzyTwsmo0Da
 BNQ7S5TsNOyg8oEyrXzEVQ8cAx7YAfGyavZ/yahyG54wzfEhrpbeGmKaYjLmSsqjEzp/
 Nzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=09dbn703reA4FCdhJjPzfu9sNeDX/0oS18Pqv+rPa0w=;
 b=Jy6ciX/3Nb6rMUGy4V4xBFRx8+wZDqLsoC+tD8akulSn0O6X4AQHLbpkJ1fw5MvB4J
 Sdzws+FYclPPX4lJODysFX3rAdTWcyWZbLPUpjBboBQ6WMUJGr+gUOYA5eixvUjEsP4Z
 gJwb9eG7xzO/GJMUyRILfbvuzOSErYYqb5KMyLwAZWhT9fKo8DGylIBex2FTUrdh3g/Y
 C8Nsja1vMPj16XoD6DG/OSb5x6hwiCs/4doNlUkfB8ONxzP/9x4Q1wQrI22w7xzo45Iy
 qR14J2XnGbczzGhnXvvtQSB58j5NU4yl5M04zkzCpGUk1G5WDtSldizMy3lFd7Ovilpv
 e1Hw==
X-Gm-Message-State: ACrzQf2XvgSoJg3PllCGt4ZMPbZCVmHYKEY2oAeC4FaPjjgslGfeAPL6
 qBq47/rln1k0oHy7IcAXU6WcLQ==
X-Google-Smtp-Source: AMsMyM4CrlinlMC3BiAcQkMfneJkSC/EWBL2SxP1mHGHVTR0/oyQ/QmNi7CVRjlifL1HcHg+JqbKvQ==
X-Received: by 2002:a4a:4847:0:b0:443:347d:6617 with SMTP id
 p68-20020a4a4847000000b00443347d6617mr11403064ooa.94.1666456717312; 
 Sat, 22 Oct 2022 09:38:37 -0700 (PDT)
Received: from [10.203.8.70] ([205.153.95.177])
 by smtp.gmail.com with ESMTPSA id
 o206-20020acabed7000000b00344a22e71a9sm2287712oif.9.2022.10.22.09.38.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Oct 2022 09:38:36 -0700 (PDT)
Message-ID: <de1a7fd5-e701-8741-b327-ad47d6b00f26@linaro.org>
Date: Sat, 22 Oct 2022 12:38:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: realtek,rt5682s: Add
 #sound-dai-cells
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
References: <20221021190908.1502026-1-nfraprado@collabora.com>
 <20221021190908.1502026-2-nfraprado@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021190908.1502026-2-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Derek Fang <derek.fang@realtek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

On 21/10/2022 15:09, Nícolas F. R. A. Prado wrote:
> The rt5682s codec can be pointed to through a sound-dai property to be
> used as part of a machine sound driver. dtc expects #sound-dai-cells to
> be defined in the codec's node in those cases, so add it in the
> dt-binding and set it to 0.

Drop the entire last sentence, it's not really relevant to the problem.
What if we name compiler not dtc, but ctd? It's redundant and actually
forces reader to read unrelated stuff, instead of focusing on the root
problem - this is a DAI provider.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

