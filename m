Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 186BC60CBD2
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 14:28:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB817527A;
	Tue, 25 Oct 2022 14:27:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB817527A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666700903;
	bh=x7UzZjiGsOHA4GYlFKGG29yipb9KlTAFy0YCRohC5yI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QN5LFOUXaw1cPucUZQK7NyFFyKUHVC2c0Wdsc1aDAtwzH9hOAmyp6pPvgepC5OHtD
	 qiGCbd9RwdWVEE2oyW8KzPAmWa6RJtW8PP22GP3raRBP0WvK19fXmGnVkrKd2fOxwD
	 mMzMZpLglb4oGnS4AoAjkS61c8w4nxZSf0cc4Ebw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CCFCF80551;
	Tue, 25 Oct 2022 14:27:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22389F8054A; Tue, 25 Oct 2022 14:27:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1613F80240
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 14:27:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1613F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="hi17ogfj"
Received: by mail-qt1-x82a.google.com with SMTP id bb5so7322789qtb.11
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 05:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L5QTt0IUvs/O5s0wdnL64lhb29nJZhbQLf7PtjZhkdM=;
 b=hi17ogfjTyDmQQemC2NEiM/0Y5oEFMUzrDSpPyE3oUHpsd7z0wddB0aFBADAeaVHT/
 g2ryoZY7bG3MqXtTNM2SnxxlKg4kaCB4vvPvT8wrggmoiW7sHsfMxWsjZ4r8zoDqqqNM
 UbjvkrQZW9bkKhIGazMwuNqZHBiPu7sZRxnBxpphJu+wLdAvLJIccrTKtdgJgOG/Zp48
 fSggj6RA4ALSRXZZkTSFgSbdRlsH4TKvZBmA1WYm0DJd179eNjzqo06CY8w+rY6B6hfu
 Lz5bh6lS+az+tWK9wfk4jpxBRz4rpNGudd9wmpyg97Wxlag7tDeGy8DqOJvQAXmM4GTD
 NYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L5QTt0IUvs/O5s0wdnL64lhb29nJZhbQLf7PtjZhkdM=;
 b=zLi1FzXrTWDCIRO9Tqz+h14O8e4Lnk2xgKrNvCDw9C+M0Z3u2rtyAiR0miNeCAtcki
 ulVCMl30NiP5yqqj3YhyJ/Tz4osWDIbRfgL9ziDIATBE3FOR8B2427QobeLwLuIqeZbh
 oCnawmetxqcDjQUYBzwRrQDVcud+HFVKBaisvkn1BnlvrCiR9qqlALdlrKSnxZsJZTmk
 jvrdxVqL2GP0co3fjZtwdnfWLU9CarABV8za7WF+4mbFF2Dg9vX/qWmQC/3jD8Ze0/6S
 XInCi+TPSQ5vSha79S11Ccz/d/xuXewLH2W3ciOHj1fvDK1l4VAIhqxY5jE9YTYLlzbU
 raNA==
X-Gm-Message-State: ACrzQf1uplN3FXBwv2tPy1Zkr8zNDTiSp8WM0VoZJQfF3zyy24ziUdDh
 0p98TnTDBEeRYanqcvaOY81rDg==
X-Google-Smtp-Source: AMsMyM6T/VN6zHWKHEw+/slQIe1ZYAI7TRy/Le7tokVuUTKpCZw1pVA9eMrX5RBUON04vFir1lPw6A==
X-Received: by 2002:ac8:5809:0:b0:39d:db1:895 with SMTP id
 g9-20020ac85809000000b0039d0db10895mr22223169qtg.440.1666700832806; 
 Tue, 25 Oct 2022 05:27:12 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a05620a255000b006cbe3be300esm1996577qko.12.2022.10.25.05.27.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 05:27:11 -0700 (PDT)
Message-ID: <d72b4a52-0dce-203d-4a42-bdba2e564674@linaro.org>
Date: Tue, 25 Oct 2022 08:27:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 4/4] ASoC: dt-bindings: rt5682: Add AVDD, MICVDD and
 VBAT supplies
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
References: <20221024220015.1759428-1-nfraprado@collabora.com>
 <20221024220015.1759428-5-nfraprado@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221024220015.1759428-5-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
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

On 24/10/2022 18:00, Nícolas F. R. A. Prado wrote:
> The rt5682 codec can have three supplies: AVDD, MICVDD and VBAT. They
> are already used by sc7180-trogdor.dtsi, so document them in the
> binding.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

