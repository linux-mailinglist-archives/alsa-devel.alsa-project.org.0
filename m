Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E1F55B9D9
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 15:20:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 784CB1697;
	Mon, 27 Jun 2022 15:19:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 784CB1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656336049;
	bh=jIn5dRCAmp8qiNDwCZ3qf0COga0iOXUq0sPP0bNBPtA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eaqGeKQp8E/0VbZk1GwU9MclcqPtUQbAR2Vgbu1ShdOpWhNIwaui+peF7PDIi6b2I
	 KjH2ZkvaTQOj70QTsg6UXlzUR8o+dbpLs9A6W+IyBcj4PKxzyGAa7wWa7dI/0MXpZW
	 qPQ8drbi3gf0AMq4Las5gb1/BU6vA5qu6mYd8QJ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECD67F804FB;
	Mon, 27 Jun 2022 15:19:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FC9CF8028D; Mon, 27 Jun 2022 15:19:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA4BCF8012F
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 15:19:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA4BCF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="JiKRcCWw"
Received: by mail-ed1-x534.google.com with SMTP id cf14so12982252edb.8
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 06:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=X5ILPbtoG+kYe94QjcMQMKpsN9aa028wJTwAOUmgPAw=;
 b=JiKRcCWwMcvUtGrRKMwovuARV8vpyLDUNaPumhk3zuMHFwVu4JL2KtKzaL4W8XHPfb
 6DrJwa5q3oK3kz6ZZe0QCm/zROD0EXCBAXiXuHMRP+G8+UKsJ+fMY8r4qkc9G6yLTNEv
 4sfBgZSmT3PlTLnlq3tuFdBqwCIswq+fbH33dpOXhur9G9yY+bNhFknMtV1x215Utlqf
 59hFMkQ+8qD84hnCWZ/w8qlfkGzlz0HxSfbdaTdIyBpIpgjR+3ZbSxUaDjmwP9Eb5KQ8
 mtjDIlGxqoUEFD5/xpoMoLOuBKzsKGan440yLoRjOxFgNIg79NLGqOQhcg6YioSO/eb3
 3Fyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X5ILPbtoG+kYe94QjcMQMKpsN9aa028wJTwAOUmgPAw=;
 b=cVN7tLlz5NKhyovT9eZCcdC1RsTvB5ziPRAXx0KLZRoBjLIcAyYbiGt7xoMOk2+Yvh
 KBde0dil68aqAaiv7grFB7bfiVp6GlTOGcw8n9xox2P0+gVYu0rMe/hKLzpddGs1FSHx
 0fE2a5LYgmcblwaGnjfxzybTgazL5aBlSlzcQvpjdcjE8JedVs+ZQljm3TIkL315cnZf
 ewFx1T/vfdE49tWyA8SyyTmYENBmoR5/1y0bpJpmAQdMtHyiTnKc+ppM4/04gt9j2Hov
 dOMMiAv5XK+s7S+ANbuQvPbNhb7LGXDPQlOM4kWS+cPBLBftm9dBTtyz8ubxbjdnDsgE
 tsAg==
X-Gm-Message-State: AJIora+/jWiNCEfpKTEEl79WZwK0c16ZoJx+0b/VtqCBddH76OuO5H91
 rcXzi6QOmRiIWIMnRoOTytVUE2tcnvsR+A==
X-Google-Smtp-Source: AGRyM1uMPQCrYWpdYVnmgF8r5u7CnjVZ1RetLnJQkM7YTkXqMa8mjfcCmJtPs3hbXcwjtqe+CFEeqw==
X-Received: by 2002:a05:6402:1386:b0:431:6911:a151 with SMTP id
 b6-20020a056402138600b004316911a151mr16635361edv.105.1656335983369; 
 Mon, 27 Jun 2022 06:19:43 -0700 (PDT)
Received: from [192.168.0.250] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 s17-20020a1709060c1100b00722e52d043dsm5078286ejf.114.2022.06.27.06.19.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 06:19:42 -0700 (PDT)
Message-ID: <0912d41f-fadb-993d-c109-c13be35c1b01@linaro.org>
Date: Mon, 27 Jun 2022 15:19:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] ASoC: samsung: s3c24xx-i2s: Fix typo in DAIFMT handling
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20220627094335.3051210-1-ckeepax@opensource.cirrus.com>
 <803785ef-42b7-647c-9653-702067439ae9@linaro.org>
 <YrmYbZV4mj9d9++t@sirena.org.uk>
 <a25126ed-ef39-8316-6ae5-9551aa8120b0@linaro.org>
 <20220627131627.GI38351@ediswmail.ad.cirrus.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220627131627.GI38351@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, jrdr.linux@gmail.com
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

On 27/06/2022 15:16, Charles Keepax wrote:
> On Mon, Jun 27, 2022 at 02:11:13PM +0200, Krzysztof Kozlowski wrote:
>> On 27/06/2022 13:45, Mark Brown wrote:
>>> On Mon, Jun 27, 2022 at 11:49:46AM +0200, Krzysztof Kozlowski wrote:
>>>> On 27/06/2022 11:43, Charles Keepax wrote:
>> My comment was not a requirement (procedural blocker) but a suggestion,
>> because maybe Charles was not aware that developer trees can be tested
>> for free.
>>
> 
> Would be awesome if I could run things through the build bot
> before sending them up. Are there any docs anywhere on how to get
> a tree added to that?

For LKP:
https://github.com/intel/lkp-tests/pull/139

Sometimes intermediate work is also included in linux-next:
https://lore.kernel.org/linux-next/?q=s%3Ainclude+s%3Atree

Best regards,
Krzysztof
