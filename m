Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E72E868C696
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 20:16:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7205827;
	Mon,  6 Feb 2023 20:15:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7205827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675711007;
	bh=VFxmlKV794H4jN/fcGXi2Hm3PHDLS87Ae69N4rzGj2A=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=S1FY3EWhLuRXV4YHUZQxLJtE14oX+KHsrzhuX3eJbheuceZM3M9tATS/Z6cZvswNs
	 E0Sh0i9xcj22TE/kmlRt5v7aQkHXNFbSFWdgy0UVAnqJT9w2Lb2fO/sWyILHMRBW+E
	 9yNNbowYrruRrCI3RL+5a4X2QJgsFi23HOMjiZ1U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A0ACF80533;
	Mon,  6 Feb 2023 20:15:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2278DF800E3; Mon,  6 Feb 2023 20:15:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBE90F800E3
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 20:15:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBE90F800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FkRZnbBX
Received: by mail-wm1-x32a.google.com with SMTP id
 bg5-20020a05600c3c8500b003e00c739ce4so1022238wmb.5
 for <alsa-devel@alsa-project.org>; Mon, 06 Feb 2023 11:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ASOZTaYA0fPeH4V0w0/DNjsNUMl04wnF0KiVjBDE8js=;
 b=FkRZnbBXMV+2QXm2YTQ1vwr+2L5cJrDiMLarDO+RZG5x6kNysr4xYb5uZTTEyvxYBN
 Z/zIs7S0voagwKnVjSmFMJ3tmYdhsdFIJSwneonn7Sstj/FDhQOkmBzic7wMKIMJDDIx
 /WlMw01YiHvRrrfO9oSM3UAFyGphvfyDBSk8Z4sK94hz2psrYVJzEnHJGFdV+Cc9tPRz
 RSuZBBbqxCcMVyj10vrrnO43yK/xD+g6rqlyQ5FlQBRvtrfb8bIMcBkVxpM98CrFBNj2
 Aei7gpB+5s/jr8mUWpNluRjXpoeu4SUVkvLcVIga80lrSviPcHmNAEND+xjlJi4w+/pb
 TTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ASOZTaYA0fPeH4V0w0/DNjsNUMl04wnF0KiVjBDE8js=;
 b=fcjmTlg107mjtw5gtPhc+2ueqPl4uqll8BcbYP6FAHedLLkgcLUJVfsxUr7jtDBO57
 vazkcXyn2j51mPP6wxhmDbWyO0I4x8vDR45VxKBlKeB3NhElXruBLPWWgZxyMc4yL2Hq
 nOtM9/fIojkAzaNTr/ALArlK5BIyduMUJOtN3JjcBy6U40hUmZ2ZoDj42kOBEghz8LrD
 DqPYl+FTy1wZuv2SxVSMnmhd7x1Z2t+V+xAqv1mdot5su7ZuxjxlGVAkzYgMcTqucaUM
 4h3pf+XPrs6V2xAopf+MPFZtXTF9N1CyWR2D4DU88y/Xi+L745PODTceQ3kpF2JELUzG
 Zs0A==
X-Gm-Message-State: AO0yUKVNegvpDxTwjqtpylB1T7cqS7zxDaY12VYXUVV8+5Ik6Y2gdl5G
 D3V1WrcolyhrKw60CZaj3/n4uQ==
X-Google-Smtp-Source: AK7set97CwxTF4+mcJ4gp9ZLuFRVhrwVBA51yp8Mc0iz4oDZXFiH93F59Or07hUeP2uEl5+p8AFg1Q==
X-Received: by 2002:a05:600c:13c8:b0:3df:50eb:7cd9 with SMTP id
 e8-20020a05600c13c800b003df50eb7cd9mr731884wmg.14.1675710952530; 
 Mon, 06 Feb 2023 11:15:52 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a5d4d8c000000b002c3e63c030bsm4224376wru.93.2023.02.06.11.15.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 11:15:52 -0800 (PST)
Message-ID: <364e2bd0-c411-7a71-4005-dd24e8d0f0a6@linaro.org>
Date: Mon, 6 Feb 2023 20:15:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 5/7] ASoC: dt-bindings: meson: convert axg spdif input
 to schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
References: <20230206153449.596326-1-jbrunet@baylibre.com>
 <20230206153449.596326-6-jbrunet@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230206153449.596326-6-jbrunet@baylibre.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 06/02/2023 16:34, Jerome Brunet wrote:
> Convert the DT binding documentation for the Amlogic axg spdif input to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

