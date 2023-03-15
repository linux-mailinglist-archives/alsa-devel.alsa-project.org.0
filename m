Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 356896BA841
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 07:45:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83510131E;
	Wed, 15 Mar 2023 07:44:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83510131E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678862710;
	bh=s15DCfy1cwRXkvCpKLgXiV87inh55MNIq0CCDMoOKR8=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iyhuZIxpocg0JNvJngJJg7w2r6BEea48/qhZDL99LlGuyEbC3RMm+mAWDdxdNeOhN
	 hVsbzaF3uuoHKW+qLSaNeY7k4OEAfJ/YpNv/d1qElMd/IDNOkeKAgDVfFG8QlT00Hh
	 GbZXhGM5N3YDGAffx+khvmnHuhPgnWieHiIJbfyA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B76C3F804B1;
	Wed, 15 Mar 2023 07:44:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5938F80425; Wed, 15 Mar 2023 07:42:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 856C3F8016C
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 07:41:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 856C3F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=fgEE97L8
Received: by mail-ed1-x52e.google.com with SMTP id y4so41959101edo.2
        for <alsa-devel@alsa-project.org>;
 Tue, 14 Mar 2023 23:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678862516;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JIXjzxii1/4RxSe1vNe7xHzVG/q5AELRooPPCE9bfyU=;
        b=fgEE97L8dTGQXH3uESbqc844ZFPyv9QhmZVrW1kovSXBZY5mJTFeuTo6Vwi3RMRAye
         PVnOwYwMDT8TXsN6n5uKPDXdPG6TGsQa89rUmdn6fHxrWlxv1UsVCOzLUxRik1rlYlzb
         JhMFq1HT4u6jiogDeGfY9ZDaLeRVkNL0lqxv3czFB6jrpBNB/f8fLqXKXXOHD2kNYydl
         rzolhB/OOfU4M9zSHPwQw9MpJW/xrTCV/TrAq0izrHYh0HXxMsNKq0dbY9wlNX+Jigj/
         qFvP0XXKxHR9NkWuf/D1oMBO2z/eOORYKpQG6vI74tV+jJwMk8a40+PBmqIq3h+b/1Yz
         6akQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678862516;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JIXjzxii1/4RxSe1vNe7xHzVG/q5AELRooPPCE9bfyU=;
        b=snofD0eim5jdnYwIMpb2+X5RsCgdi8wKMfHRwXyGHGhis+FqztWn0AgSoJvH3KCsvR
         YeyoIcCwrF85X7hKQxpRzuxFjMv9pOvRsBqNA777n4DHqhKf6FkDwxBB8y1COHDsyXxD
         mwi52QGOwvX6q1KkxBmvrp0t1gfVmtf9VhXFIEL1Tvetfc3jl4u+FfRd63VMv5TStBS2
         SLu4ggKMH7j/BDKisuvdDTa/s2wM1VK3vKg9SnX2ZSvRvC5F8icSkmcs8wyOWBL+Yga5
         OrQ1vredijYC3srEBJnbCG4WowAySYFXEC+8sW6Y9Mj85Teaj1L3Z/kZOo8tz8PKmNTb
         d8jQ==
X-Gm-Message-State: AO0yUKUAnALFf5JhWSI+SHOeD0iX6vwC+nETGQxNFUHa18426qbnvW9T
	x84fyJ5hfqSln6HkmflFklnWUQ==
X-Google-Smtp-Source: 
 AK7set9l3DKQuvkti5Zl3R6fosANWwW1ih/kNgyLe2tTV/nFBhwKoAralyQTc+4vayyvw5hNbYBIZw==
X-Received: by 2002:a17:906:d210:b0:922:6bde:2530 with SMTP id
 w16-20020a170906d21000b009226bde2530mr5471626ejz.32.1678862516652;
        Tue, 14 Mar 2023 23:41:56 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:940e:8615:37dc:c2bd?
 ([2a02:810d:15c0:828:940e:8615:37dc:c2bd])
        by smtp.gmail.com with ESMTPSA id
 op1-20020a170906bce100b009222a7192b4sm2044078ejb.30.2023.03.14.23.41.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 23:41:56 -0700 (PDT)
Message-ID: <bcc08093-2406-be53-9983-e04a8d595f72@linaro.org>
Date: Wed, 15 Mar 2023 07:41:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] ASoC: dt-bindings: renesas: rsnd: Update example
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: 
 <ba4ec999dc152ea1f113253e497c093b8789d414.1678790879.git.geert+renesas@glider.be>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: 
 <ba4ec999dc152ea1f113253e497c093b8789d414.1678790879.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: QIVYQ63DKLUHF4QTSDOLU5CVDNZNBZR2
X-Message-ID-Hash: QIVYQ63DKLUHF4QTSDOLU5CVDNZNBZR2
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QIVYQ63DKLUHF4QTSDOLU5CVDNZNBZR2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 14/03/2023 11:48, Geert Uytterhoeven wrote:
> Miscellaneous updates to make the example match reality:
>   - Correct SSI resource region size,
>   - Complete half-conversion to new-style CPG/MSSR bindings,
>   - Add missing power-domains, resets, and reset-names properties,
>   - Use interrupt binding definitions instead of hardcoded numbers,
>   - Correct interrupt flags,
>   - Drop double blank line.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

