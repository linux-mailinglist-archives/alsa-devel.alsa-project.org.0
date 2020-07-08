Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6DE218B29
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 17:25:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C49A2112;
	Wed,  8 Jul 2020 17:25:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C49A2112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594221958;
	bh=ZISW0qX/tm2lXePNsF2BCsvDvN0ngb7S1RRryZ5jBuc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q1Fjpa+HcYaWdz5SgmULns0XRyZ8iTlFqr3dSl+dnusL5N2Crv1LlixEqwMOcg+xK
	 nrmZg2hcP+9DexgHvYAYcRpX/GIlJAVE/57eMdA3VF9JHESyqFJiRMUJVpWCBfsDTd
	 ZDNcGu9V9q0VofHascGT8jRgDIHGyaphCUhaJFp4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8793AF8015A;
	Wed,  8 Jul 2020 17:24:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7676CF8015D; Wed,  8 Jul 2020 17:24:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89E4EF80115
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 17:24:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89E4EF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="f8+Arc7r"
Received: by mail-wm1-x344.google.com with SMTP id f18so3656748wml.3
 for <alsa-devel@alsa-project.org>; Wed, 08 Jul 2020 08:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fAMDttktLNm65/wtDUXVk462N86zqjpRDjFGxdYbu50=;
 b=f8+Arc7rJ2DfVyTdbbbLpv27Kcrhid0WoXzvqJdG8s43yrm7sLcs/o19Ywml+1yPgI
 wCaoSuCxam/gTKcTD3vHy4FA00JgdM49Gmw2Pfl7A3Fcv/r67gPImsmX0BGL3/fQ8Rmq
 XjGwVSN0Pf0O9kksUxZr1LlQ8vA7ZTzXbkgHiWap9K9a9DH1R3jEbLZeHthbMS1RO5Oq
 ds/H86jJTV4rmxrlVrT0qvAcQSmsRnVgx107x+FhhQO6oToPmYE6iJRnjxrXR5maSBDd
 gR94QP18BZGx1SJYnvzdYPTqrkf+8iWoxB3+MlZquWZYEDVc5GZdzsFPz3+/B52B0kW2
 COrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fAMDttktLNm65/wtDUXVk462N86zqjpRDjFGxdYbu50=;
 b=OStMO15DanUce4ufE6t94kM66gru71VwpMrqMjYkqJoRAeRcKTsF2FT6GN1Yb4E/+p
 e8IvAcGSHrFs7LOC8B5TcQ55AandPn59ZS3jC83ta23qTde9DK6nTdg+GgrXyi6zmLvT
 lYiGUnOAkwNCAvp0HYojE+jppm17+2Y6b+gaf4suTZSU73KER7dwqZrgZdvgZJwilWwK
 cjBXQTQ80jin2TFyjGZyabvJ2Z7kK03IxOC2jhfmnE8Rp4v4QANFKtYEGpOY+U04NNeB
 SXOB6VkqWhRe90asVQnMAmrNF9JLLxLUYpeIYGuvQ8jCjUJR42oCd8S4IhWCbICnWt8T
 P6Zw==
X-Gm-Message-State: AOAM532oDv7jSX9QtCPK3CNqfMGk0wlR8vdXCIbGZ5ej7gN4jLyGgXyN
 DU8WIgaVipZCaTRveUfTOXwv6HZziRI=
X-Google-Smtp-Source: ABdhPJw/r3+t2K7aS1cKCKbzuHi+yWjnHnjOWYjedwLDxDngF8Gh/yz8+05gMSropxdp6GCb8jV2pw==
X-Received: by 2002:a1c:4846:: with SMTP id v67mr10437789wma.175.1594221879388; 
 Wed, 08 Jul 2020 08:24:39 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id w128sm176395wmb.19.2020.07.08.08.24.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Jul 2020 08:24:38 -0700 (PDT)
Subject: Re: [PATCH 00/11] ASoC: qdsp6: add gapless compressed audio support
To: Mark Brown <broonie@kernel.org>
References: <20200707163641.17113-1-srinivas.kandagatla@linaro.org>
 <20200708133244.GP4655@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <3c922807-52c7-ab87-01aa-58fb6f718b2e@linaro.org>
Date: Wed, 8 Jul 2020 16:24:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200708133244.GP4655@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, vkoul@kernel.org
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



On 08/07/2020 14:32, Mark Brown wrote:
> On Tue, Jul 07, 2020 at 05:36:30PM +0100, Srinivas Kandagatla wrote:
> 
>> Along with this there are few trivial changes which I thought are necessary!
> 
> It's better to split stuff like this out of the series, or put it near
> the start after any fixes if other things depend on it.  That way it can
> progress without getting caught up with the rest of the series and the
> series gets smaller and more focused.
> 
Thanks, I will split the cleanup stuff and send it as separate set!

--srini
