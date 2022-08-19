Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC27599D5B
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Aug 2022 16:18:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50BC61698;
	Fri, 19 Aug 2022 16:17:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50BC61698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660918706;
	bh=5DwkpJX5Z7O5E47M936TcVciSvOz0mnrut9+mYn9vrs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pzYyg2fCC2EWCK/0LLmJWYYz1AzmU9LGtMXbdL0R7GBE9NR2FqRhEmXrtUjOyK2rv
	 eHYWjEKk2zFNynEB3U2UNySVxXbQkyDZSW83YzyxYZxhsLY73E+BfLusufl0JHA8Lf
	 ordDJYuvLZYsgaHqlAW1PNGd0prtfamrqlS5rCQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6D1AF80128;
	Fri, 19 Aug 2022 16:17:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E98D7F801F7; Fri, 19 Aug 2022 16:17:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F2C4F80128
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 16:17:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F2C4F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="iJnvZwRO"
Received: by mail-lf1-x132.google.com with SMTP id u9so6278795lfg.11
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 07:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=ZP7/pN9LQxTPvYxi5HKb2nXXnhaq2Nc8r+By7c+Y8XI=;
 b=iJnvZwROEr7eyVt42APRy3CDs3DwcP72OtirjShu7JD4apfi/c9NR4HAHeHpX3tJlg
 TcaazsqTdt2Tg2ZNfkjSf1K3zEI/2TJePtXRR8cgdyh/8+3SIluNfG0wNw3cnu6eDaW7
 TYJ0WMdAWhQ7sCsVSoDtN7pg8067CAPao4/iWR/uXyIaA3fjAmimrHYrOCVqpBiuKY56
 qP7GZ2anmhxPVmFptQVyJWrhJR8awQCbBcvuV2br2DX7YJxD5/rtLrX5sF01A6jPjjUy
 6U45Ni4SFWdTKH5tvIzjFzmmPlGGgyDmAhdxibPjqGvY8N7w8HGrEsYUID5+DfrJdxYR
 1o5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=ZP7/pN9LQxTPvYxi5HKb2nXXnhaq2Nc8r+By7c+Y8XI=;
 b=oDAybpkxq01SWNykICoCO12IizKXKZnJV5BDZ3OWxoUE6NT1Upin/CeKIq4mJMTROc
 vhmuk+D+FXYEorPCgGevcxNrNQBmSG7ROpPI5DrxAl3xgLNIa0c9kpKQcerCsBd8Oihe
 KSgrTSyWshnYCiVj1PAklHdocdUInZefDxGsO+cxwW/lNn/HAUYyjW+M979MTmnxwXNw
 x0nu8gq7CTX+JwWeEgcEv0IgqlZW60icGXNwmmSDpxYMoydhyiBfJE5Xxed1aSVAbF7+
 MJlflGK8BKZOJSUntGmaHGIR2cY00MqhwlpmeJs/o+5LcGcVrHxefIFEy+pHlL3IxL2/
 4dpA==
X-Gm-Message-State: ACgBeo3KNn/5Z6nrEqORFYAuD6jbvi52uzoa7vpDniIzOqt0/9pBBoEJ
 cmbKuyjoJtPR4yQr3qS3+fpNuw==
X-Google-Smtp-Source: AA6agR4mQVqG+Lw9A96QRROjP3Cx8kJfoZ3CvE8DSd7qh9uGbqoOd+4+PPlHX1LIHOJfMNnfJSg27g==
X-Received: by 2002:a05:6512:3fa4:b0:492:34ba:e9fc with SMTP id
 x36-20020a0565123fa400b0049234bae9fcmr2432323lfa.174.1660918640222; 
 Fri, 19 Aug 2022 07:17:20 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5?
 (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi.
 [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
 by smtp.gmail.com with ESMTPSA id
 v19-20020a2ea453000000b0025e87b1fdbcsm611027ljn.63.2022.08.19.07.17.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Aug 2022 07:17:19 -0700 (PDT)
Message-ID: <a0a34ac8-4b62-4e69-f16f-7a51132a3987@linaro.org>
Date: Fri, 19 Aug 2022 17:17:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/4] dt-bindings: sound: Add Apple MCA I2S transceiver
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>
References: <20220819125430.4920-1-povik+lin@cutebit.org>
 <20220819125430.4920-2-povik+lin@cutebit.org>
 <AE646B68-CA14-483C-A1AB-30358560DAAD@cutebit.org>
 <8472463e-d99a-d0f6-9551-45a79a15f567@linaro.org>
 <737767DD-CB70-4941-8CF5-497333D3A801@cutebit.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <737767DD-CB70-4941-8CF5-497333D3A801@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Sven Peter <sven@svenpeter.dev>,
 Hector Martin <marcan@marcan.st>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, asahi@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
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

On 19/08/2022 17:14, Martin Povišer wrote:
>>> Since it was brought up last time but I didn’t respond: the
>>> nonalphabetical order is as the chips were introduced (and
>>> matches other schemas).
>>
>> Sure, just keep that order for future compatibles as well - so always
>> put them according to verifiable time of market introduction...
>>
>> This is very poor reason, instead of alphabetical order. Even worse
>> reason is repeating wrong pattern just because someone else did it.
>>
>> Best regards,
>> Krzysztof
>>
> 
> I don’t see it nearly as clear-cut. Adding to the end seems pretty
> foolproof too, but OK, next submission will have it alphabet. ordered.

The concept is the same everywhere, be it Kconfig, Makefile or other
lists. If everyone adds at the end, you increase the chances of
conflicts. Having alphabetical order usually means simultaneous edits
will happen in different places.


Best regards,
Krzysztof
