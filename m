Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E35962F7F3
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Nov 2022 15:42:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 277E61671;
	Fri, 18 Nov 2022 15:41:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 277E61671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668782569;
	bh=rwkKc5uFIMfeTmBdYa/+b7VoNwyafbWlRlOPuyUKAUo=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LduM0TLKlDB6K00tc0lMDzIPf7lq7ZdYqphsgM2dN/e/yhrVv3F0DLlRP0bDlaB8C
	 JTudqSsR+1sbCN3xjH1CdYa/B7Q9s0Qo0gxLAIuxoBLD1tDN9+p8skwwz2ubFjnEK5
	 g3F4wvcUKfAqHcP/CKZMkpUgd1/TFjWUuxnuVHYc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC1E9F800B8;
	Fri, 18 Nov 2022 15:41:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68F2EF801D8; Fri, 18 Nov 2022 15:41:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5B08F800B8
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 15:41:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5B08F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Wh3kz+U3"
Received: by mail-lf1-x12f.google.com with SMTP id bp15so8485142lfb.13
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 06:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2thmbb28/ZVq6zR0dXPjXeaM3XqjzR2UoNfuu1A+yxY=;
 b=Wh3kz+U3TyES5kVivDFaHBtLFLL/dvPdqDu57smkC6Ph7w7BHKysZMZFhvdXOPuWrW
 Lw8LL84mX38YNKRs3pGwg+Tia/zAFhgcC+1DESyGm5BTi0EnPUnhZ4QHLyyv+0OnhLam
 E3uRYDAR2Os7JpQ0LIhBcgTFaVW5dZNYTp7ZKIyJBX5G4OWwRx1TtogVVoI1kX2CEjrs
 do4Gplx2RwG3okWsGte0NBKp5hVJfTJNt4dRG/5I6q35QXlZIog+hjsX/ykg9GuvhRxD
 47ZlAGzhacUFb32wS7j+NxIQTok5x1gIPOFsudtg8U/R9BKtPU6lhsd4s1bKjF2cUdHM
 ohQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2thmbb28/ZVq6zR0dXPjXeaM3XqjzR2UoNfuu1A+yxY=;
 b=0IRXkSQPJmeRPg5Wc8jOGLHrVdbiMvEiwUBU88nV6gP8iqHoP41Aa5KtJxd3zTn5q/
 I1Y7HPBnTikhMwVEaeg85iQMmgRjCEJkxupzhKQGBJ/acLI50oKkZtO52E8vRlr3hytR
 axzZSUjzoiiQYCw6M4SCdiem37pw9bJTekcdVpscSJsJYmGSkzBFI9MaTNTkuH+NU2VQ
 4/io/QHhrXPnE+uR6Of3QYec64dr08tLE6iHbotHOKRPPUBYjk2khfFbKaN25zxoMQmx
 /ytG0CW6dt9AExVHDgxwOZ2UhIXmb/1Pd8Ue7kWQVnErcS5ODhjzanLrxQsydJn5ZQFJ
 Lj1g==
X-Gm-Message-State: ANoB5pl21alKbN2UAZPrWnGp4jo3VwY6Sx9xN1VIozQpgkvZxBdZd6t9
 0Q+ahrTT/VlnhyOsyVibZ3iT9A==
X-Google-Smtp-Source: AA0mqf4LXWW0epb2vwZAvgtK7zqnLsqEffcVxq2B14gkeFCPgUZ7Zh2t6XvOeZxpFU2hG+5fuwFCKg==
X-Received: by 2002:a19:7706:0:b0:4a4:6991:71c4 with SMTP id
 s6-20020a197706000000b004a4699171c4mr2681393lfc.355.1668782507612; 
 Fri, 18 Nov 2022 06:41:47 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 v10-20020ac258ea000000b004b0b2212315sm686134lfo.121.2022.11.18.06.41.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 06:41:47 -0800 (PST)
Message-ID: <af7f1b14-6b46-54af-19fd-de8d1de535db@linaro.org>
Date: Fri, 18 Nov 2022 15:41:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: lpass-va: add npl clock for new
 VA macro
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20221118071849.25506-1-srinivas.kandagatla@linaro.org>
 <20221118071849.25506-2-srinivas.kandagatla@linaro.org>
 <c3a2316f-2956-6417-f1ea-a6a64df037c6@linaro.org>
In-Reply-To: <c3a2316f-2956-6417-f1ea-a6a64df037c6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
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

On 18/11/2022 15:38, Krzysztof Kozlowski wrote:
> On 18/11/2022 08:18, Srinivas Kandagatla wrote:
>> LPASS VA Macro now has soundwire master to deal with access to
>> analog mic in low power island use cases. This also means that VA macro
>> now needs to get hold of the npl clock too. Add clock bindings required
>> for this.
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


... and not.

+        clock-names:
+          items:
+            - const: mclk
+            - const: core
+            - const: dcodec

This neither matches DTS nor driver. Did you test DTS with the bindings
change?

Best regards,
Krzysztof

