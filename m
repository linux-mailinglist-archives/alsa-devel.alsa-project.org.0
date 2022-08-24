Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0778E59FA7B
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Aug 2022 14:52:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9224F1638;
	Wed, 24 Aug 2022 14:51:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9224F1638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661345537;
	bh=4DF7xQCLWWM0VJmFo8Oh7lcsG53XG65KiLklMlQpUCc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ld6g963a/Bujb5Wxoe1DpDu//3qttO4Ij9zuqVWtQf3Ph4F6i0QuAorEILLl897RI
	 yEHKB1/zvBfnDn85y4Ta5BUeelQqmxREoYFNVqTHTM7VYHKuHIV7lTxXyGzmCtvsra
	 cDaB/+Ru67qVowEbMyUAPYmrfeXRYZ5XEHQSyLT8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E750F8014B;
	Wed, 24 Aug 2022 14:51:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B29B5F80508; Wed, 24 Aug 2022 14:51:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BDF8F8014E
 for <alsa-devel@alsa-project.org>; Wed, 24 Aug 2022 14:50:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BDF8F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="myWHpRkE"
Received: by mail-lf1-x12a.google.com with SMTP id q7so20161246lfu.5
 for <alsa-devel@alsa-project.org>; Wed, 24 Aug 2022 05:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=VIvn4cn38mqmq8WvF2X7y/SBiSVMfGMJeaVNH0qHe9o=;
 b=myWHpRkE0JHF+tTboHvgSdeq4hDDIDzW3o2/kG40uIP8wBe5Qtf8c4eWWvLeA3qGB+
 5+VAi70dRsuwNRjXlXFZRRi5152W7yHHCTd9A1cYQ07kRzRQCkkDDqdLcsSal9TXUimu
 WHNESwCDBoMe2T4PirwFphqC7jnVY6GXoosXkLj1Qhspt+curOhozmhJWQHIYWA49J0H
 j9ZakInDkVu8bPFMvSuVGx6I5kzlN789kKmwoGcwachUCYbC6KVA8KcaDUH/UksnAdj1
 mtX81dBWvW68wBRbsLgyobXiZ2di4NmNtBQkRko+eStRHi6/WYVFVLyJhlURXaOmSLrE
 IFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=VIvn4cn38mqmq8WvF2X7y/SBiSVMfGMJeaVNH0qHe9o=;
 b=PkVjtKfiztATWPYgPHcd+ZmMnIP3/UukZNh2lZKNelD4xeTuZhXxNbGro5KaTRjbaP
 CnTLJylo40nrmNOcGhUYE5o7E5HBTaF3uxj13u75BZ6fYcnpBx0wTtuV3xCanGYjF3Xt
 azdRVGKTpssvH06vtVqyDsuG3cKPc/GmhiPCN6LG81N7lkb+Er7JBiC2dmvLrQyL0fIA
 YHeZA+iR7HsbD09Lzi8+B7GX2STxopzbNLt7UKtbnCSn4k6fdEFR1ogBSBzECJQmrLq2
 9stCKmRzFwsLGb5CeBqWA8bu0p2zjJMgtm2H9ffO5l6UMtpJscLnux4HY49TQelTzEU0
 Mtsw==
X-Gm-Message-State: ACgBeo0MNB2NwpTYI7h+l6FAFXSKET7zJdJmCNthXZQh34uDCunAukIZ
 6Lt/hqjx203QmDUFx36C1zlMEQ==
X-Google-Smtp-Source: AA6agR7Z/1jGW7Q8B9kfMwTIdCYPqqO+/2YBvt8cNU59/7t5/M6VcYqdYuJNjpfmZf8K+b4Uz38cuw==
X-Received: by 2002:a05:6512:3084:b0:492:f04c:8a3 with SMTP id
 z4-20020a056512308400b00492f04c08a3mr3618630lfd.199.1661345453600; 
 Wed, 24 Aug 2022 05:50:53 -0700 (PDT)
Received: from [10.243.4.185] ([194.157.23.230])
 by smtp.gmail.com with ESMTPSA id
 v23-20020a05651203b700b00492f294f06bsm1028184lfp.110.2022.08.24.05.50.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 05:50:53 -0700 (PDT)
Message-ID: <58a694df-fb33-dac9-0dfd-eb2efb9abde9@linaro.org>
Date: Wed, 24 Aug 2022 15:50:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/2] ASoC: mediatek: dt-bindings: modify machine
 bindings for SOF
Content-Language: en-US
To: Chunxu Li <chunxu.li@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, nfraprado@collabora.com,
 broonie@kernel.org
References: <20220824122319.23918-1-chunxu.li@mediatek.com>
 <20220824122319.23918-3-chunxu.li@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220824122319.23918-3-chunxu.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, jiaxin.yu@mediatek.com, linux-kernel@vger.kernel.org,
 project_global_chrome_upstream_group@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
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

On 24/08/2022 15:23, Chunxu Li wrote:
> From: "chunxu.li" <chunxu.li@mediatek.com>
> 
> Add SOF related field.
> 1. Add a property "mediatek,adsp", Only when adsp phandle could be
> retrieved, from DTS, the SOF related part of machine driver is executed.
> 2. Add a property "mediatek,dai-link" to support dai-links could be
> specified from DTS
> 
> Signed-off-by: chunxu.li <chunxu.li@mediatek.com>


Usually first name(s) is separated from family name(s) with a space, not
dot. Looks like you need to configure your system.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
