Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A55046BE586
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 10:26:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1BB6F90;
	Fri, 17 Mar 2023 10:25:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1BB6F90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679045169;
	bh=/44a7HLj5QGOsDqc0KzlyTsakSfyHBwc14B6z5YUqGQ=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ast7u6A4BoTlsi62u4qHaquah5955Wf/y+6Q1JCHyz8jB18O7vWp2qjOKKI60Ah1Q
	 ehVyDmzaEjXlCP+8j5TmmmE78ofcVGvK8sk/v/ipui0pXfXguYiDYR2Px0uuUvVRdi
	 Lo0c2VaLGZyI3lv6mkgNtmMgOvPWhqlftBTDoI/g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 345D4F8032D;
	Fri, 17 Mar 2023 10:25:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 669FAF80423; Fri, 17 Mar 2023 10:25:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A1C7F80093
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 10:25:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A1C7F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=sGRD3Zni
Received: by mail-ed1-x52f.google.com with SMTP id er8so6111853edb.0
        for <alsa-devel@alsa-project.org>;
 Fri, 17 Mar 2023 02:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679045112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MlLEXPAyc6Yf23gKGJxdN1O2nSWmWz8A1QbLTo26vFc=;
        b=sGRD3ZniFxujJcvbDRiM5xD17dwCf5vPaQdVPdd6LO7bDHprGJNzcRVFnVkcldquo1
         wM90wjTCGqOjB6OCDALvnJdV4ytKBTSqP8EwMW6AWmsJuekh3p5tS+MkzVMzNsTquTAP
         3W5kvd3H3hNtlsSz2vHMqJL7LDHVNZFhuTf+V+e8dC9755giWHu+/lCmcnkvX/5GeJ7p
         A9YI8XxJmGMeicuiekoG3QB1HXOfs3x7wp62+b9y9l+1+oQJ+5rM8QN+y/Q2WFk+mMzm
         /EzPc9McE8m1j5jfVMvCHEIkrm420OwfkfN5WxvPQ3BlhilDgMxa3nzJ6M2NFf+NO/4S
         pnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679045112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MlLEXPAyc6Yf23gKGJxdN1O2nSWmWz8A1QbLTo26vFc=;
        b=b4ZZlQMXtQjlIafIBKSbRJaHMSjeVGtjlPxao0FqDc3PyldABzPKTDKNyvjp3KZER/
         BKsoSC3lQYA1GfhIu/L/jOnqGkeCHKYEd2A6CAcrAf1rrZlI/fK9MR4bdkV6xchbWnzn
         QrMqjnrEN5LZEdbisKwPo5Xa4sbIqABw0Qe5LWatltR/C4xSBOKtZyJVl4QeGdHOYljk
         rZb8E/FIciIhtIA4lr6WP/Tv2de1KAtPeqDQqqJbWlK88AljJLK3ybCHzdt9LFGgRoeY
         Fl4EvjIXG1IKaheVoeYv/UTie/h+jsuKV2wG9SSDNiFP5rH6iquiUIkQaepLdGCipfEM
         Dn5A==
X-Gm-Message-State: AO0yUKVQfK7IW+rTjz6Miz6QzxvaKMynrni29b+KfnXn4OSdqOij6Ynw
	pI8Vxbrah3vwGtOHY2kIFaIGJg==
X-Google-Smtp-Source: 
 AK7set+/11HaRj2WG12Q+vtk7E+WmOqsUPkGKCKykvzvbAhuh30lRW80FOyVwzc/xzcYheaQqTMrdQ==
X-Received: by 2002:a17:906:3d7:b0:930:be70:320d with SMTP id
 c23-20020a17090603d700b00930be70320dmr4190876eja.13.1679045112343;
        Fri, 17 Mar 2023 02:25:12 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:848a:1971:93e0:b465?
 ([2a02:810d:15c0:828:848a:1971:93e0:b465])
        by smtp.gmail.com with ESMTPSA id
 p9-20020a170906838900b00922e3221c88sm744588ejx.117.2023.03.17.02.25.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 02:25:12 -0700 (PDT)
Message-ID: <2840fe92-0c15-d476-d0ab-ec87884fcf31@linaro.org>
Date: Fri, 17 Mar 2023 10:25:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] ASoC: dt-bindings: adi,adau17x1: Convert to DT schema
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20230315231055.3067-1-sunrockers8@gmail.com>
 <167897628543.92626.6326219364017588458.b4-ty@kernel.org>
 <a3f7b1bf-b37a-1e42-1e43-02b82fbd895b@linaro.org>
 <1cfd50ed-f7fc-46c0-9e6b-5a35b1a9572d@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1cfd50ed-f7fc-46c0-9e6b-5a35b1a9572d@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GQQMKNQED7POFO5TS7QTWLGSN7BXNWXJ
X-Message-ID-Hash: GQQMKNQED7POFO5TS7QTWLGSN7BXNWXJ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vijaya Anand <sunrockers8@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GQQMKNQED7POFO5TS7QTWLGSN7BXNWXJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 16/03/2023 20:45, Mark Brown wrote:
> On Thu, Mar 16, 2023 at 08:16:29PM +0100, Krzysztof Kozlowski wrote:
> 
>> There was a warning from Rob's bot. Can you drop the patch or you expect
>> follow-up?
> 
> A followup would be easiest.

Sent one.

Best regards,
Krzysztof

