Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D72BB618B73
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Nov 2022 23:27:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 714CE167B;
	Thu,  3 Nov 2022 23:27:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 714CE167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667514476;
	bh=ARxqVya4WXRVE18ZJv56TAOqP1zX+ef0cFNMRuKhOgM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gAizsfQwGN7gnzPlANDIyExQ0XbcjxdKV4xB7CJ+y41oZ6bMT+sGEfop1eL3UNwmx
	 jqyN/KZgsjDEQBu+sVjQD2FNtSlrHOcJATyQzdmxSBE78bIgDYnEAjuyH5cTQBRnm/
	 KCChhVYXovnuoDM1ruC19h8uE+SAqdTbjvPzo6Uw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 023B3F80155;
	Thu,  3 Nov 2022 23:26:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFC25F80526; Thu,  3 Nov 2022 23:26:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D961F8051F
 for <alsa-devel@alsa-project.org>; Thu,  3 Nov 2022 23:26:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D961F8051F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="cKcf//yh"
Received: by mail-qk1-x72e.google.com with SMTP id k4so2106823qkj.8
 for <alsa-devel@alsa-project.org>; Thu, 03 Nov 2022 15:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wO7s0i2uEU8+qaNh+JodROQHc5HADEbVF5h4O06CWHw=;
 b=cKcf//yh1V/T/ywLkF1zEngQRr3ppn6dj2NBtXOFjRm+lQ7a8sJ6jAW33Rdf/iIncr
 uu2qGEfMuVrsXk9M8ZcTx18XgUYsLH8BcDEoVDAzs9jGdXVU3Bm/gcAvjP3AFZU2BD/y
 C4Ze3ROWFAOHuX3i2ryS8e+p8pFYNvqTj7jwTTH9FY/nlgFsbG/c1446LMfgVlqx0gPU
 arWKxNi4SCRjNPlnTz1Cb9j0R1nzQ8pUqYN1BF8jkSAsoMGashaQQQ+E6j6MCmqj2gsv
 zrfp0WrsIHLu6G4KUCFSgzR9lcDvXDQyL7itU0Micq5PdWqMQAZ5hQPS2kIaTnb+MCgT
 oVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wO7s0i2uEU8+qaNh+JodROQHc5HADEbVF5h4O06CWHw=;
 b=mr124hvxqYxdXcBOEAJy3wrFYdfurLOb7EvBNJ6ggYtTRziwobl2UJNdoBJTG88Ijc
 vqNHy5YJ1Bsiyw+5wA3EcqnsXN2coJ5okv4nqD8TFEGMx9f4jJFSn+aZDU5igAvvuW25
 +h2PG0PrXp+77BVd0yhAeItCW65M/p6fZmtUF95i/fHccgtGVPTI9wXzwJm/5tIAvPxm
 ctpFAjzXxk01fql+0/VZBOqu9ULZ74Ev+qLY1cGaPZ/R/c5MZgN/GX9ZZVMnIKU6gnOv
 /HSqoF0ilFh5McklTI1e9Ymb/WIxCEX8sAr0yhFVDl5IEM0o7SioARkMzKeNexMQ+L+s
 9Y9A==
X-Gm-Message-State: ACrzQf1KTdK9pp4c02NgfRvKoRxOwTfagF7XbTy/v3tz/6xtcjnWcAr+
 DzWkZgQJJjYmLvZ4Du2lU3TQUA==
X-Google-Smtp-Source: AMsMyM77C1DqfRbu6vRLTUrod9jv4Im/moSq726rE2rF0ojoeCAjYeAkahi+yHNYnD20GPa933MOkQ==
X-Received: by 2002:ae9:e70b:0:b0:6fa:509f:cb2d with SMTP id
 m11-20020ae9e70b000000b006fa509fcb2dmr11597364qka.181.1667514398509; 
 Thu, 03 Nov 2022 15:26:38 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:a35d:9f85:e3f7:d9fb?
 ([2601:586:5000:570:a35d:9f85:e3f7:d9fb])
 by smtp.gmail.com with ESMTPSA id
 cx26-20020a05620a51da00b006fa12a74c53sm1590308qkb.61.2022.11.03.15.26.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 15:26:37 -0700 (PDT)
Message-ID: <f523b400-e007-0fc1-7977-345b007ac91a@linaro.org>
Date: Thu, 3 Nov 2022 18:26:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 4/8] ASoC: dt-bindings: rt5682: Add dbvdd and ldo1-in
 supplies
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>, Bjorn Andersson <andersson@kernel.org>
References: <20221028205540.3197304-1-nfraprado@collabora.com>
 <20221028205540.3197304-5-nfraprado@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221028205540.3197304-5-nfraprado@collabora.com>
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

On 28/10/2022 16:55, Nícolas F. R. A. Prado wrote:
> The rt5682 codec has two additional power supply pins, DBVDD and
> LDO1_IN, that aren't currently described in the binding. Add them.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

