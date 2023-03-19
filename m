Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4914F6C017A
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Mar 2023 13:12:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0E6583E;
	Sun, 19 Mar 2023 13:11:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0E6583E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679227937;
	bh=r2NQhXSc2Hr//bqP8koTH9cLi22v6/txz5f5vfcayrE=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iEz1lzSnn5NEVo+IfmkLDsGWhFe35EnI3MduAvMnmU0E96ms6JewtD/zC0ZIBjXTR
	 k0h4VsBt3AI0sLCARd7lOz+BHDkM8P4Q7iAVlmm7+/7Cp1QokTJioDc7W9CMSOeU/Z
	 TgDy1K4aSCqJCviIgFWgh+lBhazKgq1ydq7X6pas=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64C27F80254;
	Sun, 19 Mar 2023 13:11:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD3C7F8027B; Sun, 19 Mar 2023 13:11:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5896F80093
	for <alsa-devel@alsa-project.org>; Sun, 19 Mar 2023 13:11:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5896F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YPJ23GJS
Received: by mail-ed1-x532.google.com with SMTP id cy23so36716979edb.12
        for <alsa-devel@alsa-project.org>;
 Sun, 19 Mar 2023 05:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679227871;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3GQ0kuX+CANTyKsciGzMU4Vb8Jeilt6T7QwH/C5HtcI=;
        b=YPJ23GJS68bHBKG4Lbftaa433ttaZ0fmgXWZavsD06SmvrkmP2bgMH4ZLnBwl6VCnL
         VyqUN1h/aFU66uitwhc7mmIJwVl1V75JwDTO8aWroziQidAPSGwK94ygGgVmHq1Myeez
         ZZPLV9PPMLY8vKzjNR/X/+SWIqceYA8uh5KCRcmfFxAGXC2f64yUD0YHdQtZ31BBIslc
         LVot5ds9HxvFApvkrRoBdHJV6vUKdtrZWckT/jbsbKs8aMmuWIStZoADGI7l2/Gs9Dz+
         L68xZXQ0avUn82L8p9Wnyc4n9eCRVwIc2cSR56TIcx+BbgUm/abMIMtcRSh88kd5yGP/
         x24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679227871;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3GQ0kuX+CANTyKsciGzMU4Vb8Jeilt6T7QwH/C5HtcI=;
        b=O7TwDMsbKSqTn6uiVh7PJ5+cu5OeCVU3UzhyR9AEyVtTXbyWtTg0Ajf8U59RqOQAaz
         OkaoeK+03dXJh++3wjGR56QZ5Q2U3T2VqI++coP9pjeZ2HqfjwziyY7qyhZqdjM7LnJY
         p794P1AMB/K2SxKJ79xMCh7EYzV7285vm7XL7r3x+QbbEL+ckBPHlFaQJOQuscEliuIz
         xJXD0gO/GwBwB2HI/hacCvgqnyUCYVRc2lZ9Wof6113yN0MJtMADi3FtNtArf5YO0HDT
         LzKk9lVRGjn78/ALW6EJzTlWSv1XkqHL36jfA/ycrMtCLWkywKwpuCTI+meCzuNh21Nd
         tgjg==
X-Gm-Message-State: AO0yUKU3EaBGW4IT+RZAzVytTNKsp3aPhZOpxoDPXWfc+7fHDLB+5Tcj
	O686IZV/1B19+4HCoP6rxyqPVw==
X-Google-Smtp-Source: 
 AK7set9WzyI1z5lQWWxZo0wQXPTsHSNQOCCESkzp15F0cQQ58oHgw0u/pfpIMQ8+fDIp4WxeSPrUEQ==
X-Received: by 2002:aa7:cac8:0:b0:500:4c0e:cb8d with SMTP id
 l8-20020aa7cac8000000b005004c0ecb8dmr6350943edt.5.1679227871464;
        Sun, 19 Mar 2023 05:11:11 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d?
 ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id
 k2-20020a50c082000000b005002daeb27asm3423673edf.37.2023.03.19.05.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 05:11:10 -0700 (PDT)
Message-ID: <bee7bd83-1d49-199f-de6d-d43e089e4c01@linaro.org>
Date: Sun, 19 Mar 2023 13:11:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] ASoC: dt-bindings: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Fabio Estevam
 <festevam@gmail.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>
References: <20230317233612.3967849-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230317233612.3967849-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: WQBDLMHMFIHFF774YOUXE6IKBC2EZHG3
X-Message-ID-Hash: WQBDLMHMFIHFF774YOUXE6IKBC2EZHG3
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WQBDLMHMFIHFF774YOUXE6IKBC2EZHG3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 18/03/2023 00:36, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

