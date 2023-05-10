Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F706FD8AA
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 09:54:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 280EB1041;
	Wed, 10 May 2023 09:53:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 280EB1041
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683705261;
	bh=5M68WCsnRcTZUk1N6AFtcFXybhA1ZnzT+q8KUZkdVqE=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IYjBcFj9cMSb70J25LgeOpZ0usprjFJ+fuvcKTdGalsxE04uAiLEzg6qnNZez43yH
	 g2ZOChTanX+r1n/TIdF8f7cfnXqHxVkOgKByeHm786gqxJhnl8BnzW5vP6vOVSW0oB
	 a4NmHI8YGudBEjtwMa5+P8wbOMRi6HlueYxk0lLg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DEA86F802E8;
	Wed, 10 May 2023 09:53:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6443AF8032D; Wed, 10 May 2023 09:53:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04E88F8014C
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 09:53:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04E88F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=vQGYGz+J
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50bd2d7ba74so66291796a12.1
        for <alsa-devel@alsa-project.org>;
 Wed, 10 May 2023 00:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683705203; x=1686297203;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d2ao5xRhAW1VmJRMoMN5yofC1btln79yFSHVXnmazOY=;
        b=vQGYGz+JKKoj0pR444Cmz8AfoMVXi+aedZH2f5tXSguiA5jLuZHv5InQd7y7msUxqw
         pkkJJE6gXJYKt3xeKyoiUBmQvOVIt/HUyqJK4cnTR7Id3n+8LS4ug1j2erzjuP9g8Kh7
         Eoq0Tft3rA++bEWy+Rtz7bxVQVt1xTHayNjawaewlwTNzI1icW0GLHqDTennWLI/5hGQ
         oSLhjz56TdQwhAAFq3M5lmlIt2UfjO5/yaBsdZKxjDIgB5geJ5gMagket7Sh7Z13d1wl
         JBTh44UnmDwdwNH+K8GYQiHxYZxRIcEiZG3AAbRMeTFcfULLRrbHkinEPAVuOoirq+md
         aNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683705203; x=1686297203;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d2ao5xRhAW1VmJRMoMN5yofC1btln79yFSHVXnmazOY=;
        b=a5RG8zlj/txuwWBUdj9SY/lLJ1lm5s1gnpb7aaNY7v7tYDSVQGzzWuc59JW3hX/9ae
         1mr34MaC/LeOoqrTL0AlXmOUa9OzXbGONbrifC06q3Upva8dng9M3/5e2hv432lxOBTe
         cxfYu7MMJhufomu9j4UX9gqS4+/3/SuRuGDoVzd24tq1SbZgDJLV5ZDaXvSxFkZ5IHT0
         BNv59XfSkt+YgDaX2VIfYAFjbN6q7hZq+Hg9THhgQFSRAxwMcA9sB+aSiAj4WFgLDqUS
         KMO2Xm1GS3Ovut34wtcLRTsQ5I4u5xjPp0i1DfjrZY7MRFQcm+rxgS6pM4dJsnZG/BO2
         k5zA==
X-Gm-Message-State: AC+VfDxzNKXhsD+F3/j0RDSr7IpnaJCgEyRFNPMVgOn6NoFU9Jm4wPhb
	vp7Hbxg9Dw2KZM3wT0vO/0G9Jw==
X-Google-Smtp-Source: 
 ACHHUZ7GAZREa4gfDODnMUUUqHW0zX13ApjtIjVoMWTiodkH906xmeobt1vPe7yZEyTTrjV8b+utxg==
X-Received: by 2002:aa7:cb11:0:b0:504:a3ec:eacc with SMTP id
 s17-20020aa7cb11000000b00504a3eceaccmr14214029edt.4.1683705203156;
        Wed, 10 May 2023 00:53:23 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d?
 ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id
 w15-20020a50fa8f000000b0050d89daaa70sm1591780edr.2.2023.05.10.00.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 00:53:22 -0700 (PDT)
Message-ID: <4d1b7563-046c-e62d-6849-5c539575717d@linaro.org>
Date: Wed, 10 May 2023 09:53:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 9/9] ASoC: dt-bindings: mediatek,mt8188-afe: add audio
 properties
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
References: <20230510035526.18137-1-trevor.wu@mediatek.com>
 <20230510035526.18137-10-trevor.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230510035526.18137-10-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UIFCNG4346PMNRDJKDZNFVCJBVNDQ6CD
X-Message-ID-Hash: UIFCNG4346PMNRDJKDZNFVCJBVNDQ6CD
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UIFCNG4346PMNRDJKDZNFVCJBVNDQ6CD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/05/2023 05:55, Trevor Wu wrote:
> Add apll1_d4 to clocks for switching the parent of top_a1sys_hp
> dynamically and add property "mediatek,infracfg" for bus protection.
> 
> Because no mt8188 upstream dts exists, the change won't break anything.
> In addition, apll2_d4, apll12_div4, top_a2sys and top_aud_iec are also
> included in clocks, because these clocks are possibly used in the future.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

