Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 105A76C95CF
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Mar 2023 16:50:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88FE0886;
	Sun, 26 Mar 2023 16:49:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88FE0886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679842218;
	bh=TwVcgpgviT2tbzMi/SDK2R8SoPG3ae59E5hzHokxdxM=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lwkg7s6iniG1AX1sCrF1NRoGH6zqwir69KHkegAkNvaoCldOgYglluEU8cJen9Xl1
	 s508JIZZBY7/VebTkxkXAeig7KDe0/9lpDfKfOFmMZJ/jknSAOdvy7Ou8rjXpwx0Gy
	 4M0fC9IL9ZBpEpLOEEUKWHLQ+C+tvnpR3b/wovSY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E3DEF8024E;
	Sun, 26 Mar 2023 16:49:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 732B1F80272; Sun, 26 Mar 2023 16:49:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F213FF80249
	for <alsa-devel@alsa-project.org>; Sun, 26 Mar 2023 16:49:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F213FF80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=IXiwMi8o
Received: by mail-ed1-x52e.google.com with SMTP id eg48so25723877edb.13
        for <alsa-devel@alsa-project.org>;
 Sun, 26 Mar 2023 07:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679842161;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iT9B1aKF9yJ12QmOx1QgiryrgEw9qF6otzhh3qqptZk=;
        b=IXiwMi8o3JmSm95Jwv3M1jLx/L5NOcP7f9NB6Q5sLnJpgzEmAXhhzs3pG/X8OBcuZy
         TLAUsHroaaKoE67do67fCKspAhtbVkiQuxwUwoRATkoJE/U/pXxCh9fmBId2/jTxAs2g
         ywJLdKxTZm41YnM2iFqBmELADwCfioIUM6G2R+PBluY4gEaVyIVPjEMPzLyZPh0Qe6al
         Z+U3uojayhZiI8jWwxI13etksWA9PpuGf04U2tixb+ATJQdzzGECldSgqqO9F1ontwme
         gLL2Q0B3BYJorBodILde5RbSBYBH+kKV69SfMmhhLY93CgiVt9hCJ+2YqoMs/LAx6yQW
         g6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679842161;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iT9B1aKF9yJ12QmOx1QgiryrgEw9qF6otzhh3qqptZk=;
        b=sdsijTRpkZZ919sSePTzH5QLpm87hLoHx1XFSP9CDTTdSj2LTTsdK4+rGqNy/PHX6H
         19jQjjojcoUtgI7D7PCgHE8RdLqQ//1jkdeUUQnZH0x/WLk3oNZyohn4KlbuTswBndJa
         hy0bPzJoSgNg0CyvyV1D09Uty5JKlCymCXHj7IZB/YLRl4BgHBW+Xehn8cG7suGtK65K
         OH68/klsc1sMS1+cIwlUceOI76ZHaAoWSDy7AxE1PknEP1xlnFIrm1iOHDdMvqIp/j/W
         T+kCzG3xA58UarMJjmA3TKsoLMtjq4GZ0KkHQpCegNQas0Jo+SrImXCm3uT0NuwMDwk0
         3X4Q==
X-Gm-Message-State: AAQBX9cmIePUBVBQP8X0B3GDNxAiVpUq+e1Q/qyklWY9NmbnwDNmBqOQ
	ccmlWHsUptlbNgBokj8QswBKug==
X-Google-Smtp-Source: 
 AKy350ad6D065/wohSaDAKojWzAl2ktvz1jF7/iGTZwc4RKVWp1rzHxYPItKCoVoZGzRKeCEnp+AFA==
X-Received: by 2002:a05:6402:708:b0:502:4182:963e with SMTP id
 w8-20020a056402070800b005024182963emr1720975edx.26.1679842161115;
        Sun, 26 Mar 2023 07:49:21 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:eca3:3b8f:823b:2669?
 ([2a02:810d:15c0:828:eca3:3b8f:823b:2669])
        by smtp.gmail.com with ESMTPSA id
 lk8-20020a170906cb0800b009311c9d33d7sm12917378ejb.184.2023.03.26.07.49.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Mar 2023 07:49:20 -0700 (PDT)
Message-ID: <7dc532c8-de85-8db2-ad48-5d6d717f6d52@linaro.org>
Date: Sun, 26 Mar 2023 16:49:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] ASoC: dt-bindings: ak4458: Convert to dtschema
Content-Language: en-US
To: Saalim Quadri <danascape@gmail.com>
References: <4762f4a1-5e99-4e5a-72c0-9c4c61cdc856@linaro.org>
 <20230326125819.18986-1-danascape@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230326125819.18986-1-danascape@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MGQYADRXGWP6LCZ7QN7YVNJFHUQNMFD7
X-Message-ID-Hash: MGQYADRXGWP6LCZ7QN7YVNJFHUQNMFD7
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, broonie@kernel.org, daniel.baluta@nxp.com,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, shengjiu.wang@nxp.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MGQYADRXGWP6LCZ7QN7YVNJFHUQNMFD7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 26/03/2023 14:58, Saalim Quadri wrote:
>> allOf:
>> - if:
>>      properties:
>>        compatible:
>>          enum:
>>            - ak4458.....
>>  then:
>>    properties:
>>      dsd-path: false
> 
> Do we also require to add a descriptioon to explain the pins which will be selected based off on the value?

Description where? What pins?

> Or have you disabled it based on, that it is disabled for ak4458 codecs?

What is disabled? The driver indicates the property is valid only for
ak4497.



Best regards,
Krzysztof

