Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D7B45D311
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 03:16:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AC9F1816;
	Thu, 25 Nov 2021 03:16:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AC9F1816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637806611;
	bh=EoFXJVizUfpo1ufQF7PvvUJ6hYorfFVvizAfrD/+RzA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nXlTB+e8KhwlPCi/gUvoT3i5YRU5MbFWD9+3OqC5dmfaKEGeeiLJgiGOoT6EopV00
	 6TtnL0bZ6P2VgjT6gylS20VXbCam3QFPKDksDbMQtazHpB5nS8iKvOaJ6W/L6d2WzK
	 F3erpRD/75foM1GFUwfbPVEv96RXwc6ZHwJnTw6Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98E9CF8007E;
	Thu, 25 Nov 2021 03:15:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 362E3F8049E; Thu, 25 Nov 2021 03:15:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3B04F8007E
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 03:15:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3B04F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DLca4Msl"
Received: by mail-lj1-x22b.google.com with SMTP id e11so9311824ljo.13
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 18:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Lj/upQN23hUbS3GkdrQq0qv4Yn6ZPxec0EiWH+iqMEA=;
 b=DLca4MslZlWfLY/LW/Le4nXm0Lum7JkUH2e/qN4ovD8bOQ+kz9mypepqtDwtvBoaTa
 mKlIhR4I4RdGakqb+PuA9BCZhIPzlsjxmU6hS2jOpVkSDyOEyJwf9nzw+sVzN0v961pb
 kcjhP48xKzax/6HW6UTL9lOMbHhSLCyM3sy/D8tzTu2ZFfjNvBm0pRO1dBVsecX5Bv0+
 uVB2/LA4JMvrvkQuDI7dFIEASY5dy7A1FdEswK5yqjMf9+BWmirrXVyxKuvNOLpv8G5W
 jSgvK2+Ei0SaCozS+BHconKlU2PczXRL7HkGrJ+94JZ3Tb0XxK0branHuIvp1xn8N3+C
 xR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Lj/upQN23hUbS3GkdrQq0qv4Yn6ZPxec0EiWH+iqMEA=;
 b=5jDyLZhNiZFkQKqm74ORYxV3fCLifI/K6spXc3ai8BUqdnpWgKYdJabiBj8TtA4oES
 cOjXpOnPb4hMzTJpRkDb+wxfoTmKDE4A+mavmtxI740SPbD0bG6XsRoydmKEUHEUtIq+
 AlEVoldonHsukKLdoIdvriiMYhQWM5RcTFCvNxNmcYVxWGPtFQFskkFizR04vH/Ll5H3
 QP2ZUSdu8zHgcXWTvGAm+l4vU0H1jDktRSWu6G1xO1yEPFKujI9wGjAbUOMdqSKgocxS
 hYjvvsyAupwJQsczg5dDflfZmcvjCce7Ea6s3K3CQsTvIPt6xCiSNtrRF8StE8XhxqEi
 QyHA==
X-Gm-Message-State: AOAM531ntV42j2ryNskrlvjyirlRft6mq3VgIIyRsy6KZfUHt5wAuf3c
 iJRJ6HXN9Z6Ukk3tubEdqik=
X-Google-Smtp-Source: ABdhPJwAyB2heTKPgBeg1gEb9wBYyvxbBdHgV9Gy/aBPiZUAIjZAMyEG1ecw4TwMScq4tOcwaSfJ7g==
X-Received: by 2002:a2e:b907:: with SMTP id b7mr21347657ljb.214.1637806522563; 
 Wed, 24 Nov 2021 18:15:22 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
 by smtp.googlemail.com with ESMTPSA id b43sm128479ljr.64.2021.11.24.18.15.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 18:15:22 -0800 (PST)
Subject: Re: [PATCH] dt-bindings: sound: nvidia, tegra-audio: Convert multiple
 txt bindings to yaml
To: Rob Herring <robh@kernel.org>, David Heidelberg <david@ixit.cz>
References: <20211025171927.92332-1-david@ixit.cz>
 <YYBRTK9KGglu/s9m@robh.at.kernel.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <59a8095b-fa80-258f-f2d7-dc241bfae24a@gmail.com>
Date: Thu, 25 Nov 2021 05:15:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YYBRTK9KGglu/s9m@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 ~okias/devicetree@lists.sr.ht
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

01.11.2021 23:42, Rob Herring пишет:
>> Convert Tegra audio complex with the
>>  * ALC5632
>>  * MAX98090
>>  * RT5640
>>  * RT5677
>>  * SGTL5000
>>  * TrimSlice
>>  * WM8753
>>  * WM8903
>>  * WM9712
>> codec to the YAML format.
> Perhaps say why they can all be combined.
> 
> I don't think that really works because the properties which are valid 
> varies. Specifically, the GPIO lines vary.
> 
> Instead, define a schema with all the common properties and then 
> reference it.
> 

Those GPIO lines should be more board-specific, rather than
CODEC-specific. Yes, some of GPIO lines may be unrelated to a specific
CODEC, but practically it's not worth the effort to split this binding
because of a couple optional GPIOs, IMO. We actually considered the
variant with the reference that you're suggesting and decided that it
should be unnecessary.

Are you insisting that the binding needs to be split?
