Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EDB5B1F3A
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 15:32:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38AD11712;
	Thu,  8 Sep 2022 15:31:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38AD11712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662643964;
	bh=//SnycTBzIy6TEhY7pFZJvqm09jxbUkJJwNeT6wVAzQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AFQQ34ahSJZSGhgEy9vU21mGDP0gI/uD3r4aW+OCO4MIl6fN3bxubFtNGn1DeVZJ0
	 Q+AdopCv3oDzUtCILCzGjlUlGzqA5u3wmmKOMH33UKOIaTW0ytmcI8g5oyFdXwqy5C
	 uqSzX6CKz6fUFILDMvr3FVaLwz/9VztFtksouj6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F778F804B3;
	Thu,  8 Sep 2022 15:31:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A66ABF803DC; Thu,  8 Sep 2022 15:31:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D0DCF800CB
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 15:31:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D0DCF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="bdc3HEsG"
Received: by mail-lf1-x12d.google.com with SMTP id u18so15434648lfo.8
 for <alsa-devel@alsa-project.org>; Thu, 08 Sep 2022 06:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=jQghVYNNLFvAYVhHk3htZ31JTcz3j4JGO/5azadmfA4=;
 b=bdc3HEsGEFsO5u8cJFBMrMyO++uqvKIYwJpUGFRJOBPJcqUoo/pBD729kQ/cRKV/3W
 G7q923vp8/76mK4BbdU0y/M9LHwI5lvJl6M57l2NTsDNSSpdfARM8Oodb2JnL4WlJrVZ
 qrSg4fhSDU/tnEHit61qsdyGtsAx/FMhilE5MYHU1Av2+VXNsfIJdEcRxq3czu0Fh+P3
 dsFGEVAmifnbWuH9sDq6rO9n3wVzqJ2c+GODSPLMEcoRlp8y8in4rmx4rGyYDp8CEbSu
 d5bioHGbMYF1VU3ArX+/zaHyAAqqmYDlwChdelROLDeA5+51Q1uaPaw1rOQLlg/+2lRS
 AsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=jQghVYNNLFvAYVhHk3htZ31JTcz3j4JGO/5azadmfA4=;
 b=xVgzEXVg36Bjn3Wkx0cGiephHqWv18FkNglNv/L5Vba/VbJ08xgYZdGrhYP6Y0wVLz
 uW6nS5BiLvibI5B9d+HsIyXIok1h2k8btHAl0sANKc9WnjydXjTRjyFPqGdw7MA0Xp2A
 hicq7QshJwabjOVvm18DaG7er7AMPHO+/FcROXmvCq50xaDumGN82IXPd8BDLAai98Mw
 wlh6lxpDGg52nMKhu6sMwu+QSITRohDow0AUVbPT5oEmWSi8lRL7KjmnnvrzUdJ5tkO4
 Oakdw3vPWEBSb6tkSlJoVpzNEeCi1VUPzr8c2yxMnB+XVwIhT2hJ+4MHgf85GZ9qIR0O
 P/mw==
X-Gm-Message-State: ACgBeo2ka3fQjCloT6jr0gCc4p1a4nggyWoObavVufHktQ+q8uNsyB/b
 yaTbEaeLIdPiZ4nbVYB32UFEnA==
X-Google-Smtp-Source: AA6agR7qjl+zSeMlOQ9wemphfHK+lgEuVxLJn/6XmOv9c9Hoacw+i/jSv3JahMGxlU5YZiMqA7t+vg==
X-Received: by 2002:a05:6512:10c1:b0:492:a27d:ff44 with SMTP id
 k1-20020a05651210c100b00492a27dff44mr2540903lfg.405.1662643870345; 
 Thu, 08 Sep 2022 06:31:10 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 m3-20020a194343000000b00497817b8ebbsm1667932lfj.134.2022.09.08.06.31.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 06:31:09 -0700 (PDT)
Message-ID: <6b11389c-35fc-122b-5ee8-a00675f19540@linaro.org>
Date: Thu, 8 Sep 2022 15:31:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 2/4] ASoC: dt-bindings: qcom,sm8250: add compatibles
 for sm8450 and sm8250
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20220908063448.27102-1-srinivas.kandagatla@linaro.org>
 <20220908063448.27102-3-srinivas.kandagatla@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220908063448.27102-3-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, Rob Herring <robh@kernel.org>,
 linux-arm-msm@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, bgoswami@quicinc.com, linux-kernel@vger.kernel.org
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

On 08/09/2022 08:34, Srinivas Kandagatla wrote:
> Add compatibles for sm8450 and sm8250xp based soundcards.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
