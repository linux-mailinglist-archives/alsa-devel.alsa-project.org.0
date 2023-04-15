Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F66B6E3009
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Apr 2023 11:17:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49F8383E;
	Sat, 15 Apr 2023 11:16:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49F8383E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681550249;
	bh=veTxT9vD7zl9hGjf7g0YTSak2nq5SnihsbSusFkOwEs=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FtR6V5tJoae3NG39pAoYuWXlrGximqYHOvJar9qH2L1WVKaaikyg71ckrN4nAlsxc
	 y7tXzxwcC5Lu8jUWqYkJbo2DoFlR9N7sIt5qJ+vnL1TZycLLJ4WFMxPR5pkLB3qT7a
	 bM12hhCbKmmO+ulQjfp6qr3SWZtJUx3+9iHkunFo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B82F5F8025E;
	Sat, 15 Apr 2023 11:16:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3009CF8032B; Sat, 15 Apr 2023 11:16:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB64BF80149
	for <alsa-devel@alsa-project.org>; Sat, 15 Apr 2023 11:16:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB64BF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gTC2VAOA
Received: by mail-ej1-x62f.google.com with SMTP id ud9so51353534ejc.7
        for <alsa-devel@alsa-project.org>;
 Sat, 15 Apr 2023 02:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681550191; x=1684142191;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ug2NJoEjqHGINDCh57IhGrA5Av2op4wiMxKQgC2t58c=;
        b=gTC2VAOAMt0JAgxL72V+XYd7PM7WG/RujPbsXSC9vjpjxto1G4lgil5SHh1yhqivGh
         XB11lrbgPZwKRMm0ndPOGiWPadzM4BTdK4az1LZ1gEav1Vxis6FeOKe6NOCADUDUZOie
         pN9uweM9knWvTDFHajv1rX+wov/Ece6OB01aVt2Wmd24gKR91hR4ha79rlthMOMiXqX2
         JlOrWiR5iH2JlgLEVBwik4IArASXgViIGxNPl/KQSNzp894LdgfY9kduEunb2E9MAmib
         l1OI5WfzEGd0ZkYcS9NlY91IRbIkFOLgLvld9St/6Y/ozgv+quTUSSqMECfRIFUuQ4jA
         U4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681550191; x=1684142191;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ug2NJoEjqHGINDCh57IhGrA5Av2op4wiMxKQgC2t58c=;
        b=GOc/lM+2Su1FbhK2gSlNXBOA+Rh9uMuVCLuSMFAlFH1Qn9AaVzwVtbnivLbH5EHUIy
         zRmMqgxzUjHm4vZjADj9/lWDIRDv3prUdhhHt1ceDcl6A2vowwBxNxPl2qbYRnLWQj53
         FPw4GQdJoyFxo7DERxS/ZU2TNCp07wk1vxnQDGk1Cy4EjOxx4R8QiBw/NpV3dGLcrbdC
         PNTY4y5Ss39OcTcnJ1cyFWDsv4KOwOU3WdO3xu5mHbMWBTkeDXIltrIuD7Zz14R0vCyt
         DBamh9/+OIWtAtjz4xZnddCsX2WLH/iEWq6m8xjBs9Sh72jqEt1LEa7vkqhUjwvnd3dI
         fhGQ==
X-Gm-Message-State: AAQBX9dEtwhT6vuATB6k9RAqXte9+K+/2vUPCafOdgcMlzPQut72LP9n
	2JgTzbbO70FL5k/lAX1OPPlhQPnG5w9renQKAFE=
X-Google-Smtp-Source: 
 AKy350Y8+Qc6oXBx/IQ+MO8Kl1T172h9QalkKMqsO2ifw2MIg8hUr7uZskN7yBhOKS/sWk37OgqSVg==
X-Received: by 2002:a17:906:38cc:b0:889:5686:486a with SMTP id
 r12-20020a17090638cc00b008895686486amr1385723ejd.30.1681550191493;
        Sat, 15 Apr 2023 02:16:31 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a3bf:4ed:6c53:2a36?
 ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
        by smtp.gmail.com with ESMTPSA id
 h3-20020a170906530300b0093a0e5977e2sm3503998ejo.225.2023.04.15.02.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Apr 2023 02:16:31 -0700 (PDT)
Message-ID: <5d629ff3-c5ae-bd00-e70d-8c0d58365ce3@linaro.org>
Date: Sat, 15 Apr 2023 11:16:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] ASoC: dt-bindings: wm8753: Convert to dtschema
Content-Language: en-US
To: Saalim Quadri <danascape@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 daniel.baluta@nxp.com
References: <20230414223801.1106550-1-danascape@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230414223801.1106550-1-danascape@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NMGXDMI4EVMRAIWIDZKSXLRTTCG2NYRM
X-Message-ID-Hash: NMGXDMI4EVMRAIWIDZKSXLRTTCG2NYRM
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NMGXDMI4EVMRAIWIDZKSXLRTTCG2NYRM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 15/04/2023 00:38, Saalim Quadri wrote:
> Convert the WM8753 audio codec bindings to DT schema.
> 
> Signed-off-by: Saalim Quadri <danascape@gmail.com>
> ---
>  .../devicetree/bindings/sound/wlf,wm8753.yaml | 62 +++++++++++++++++++
>  .../devicetree/bindings/sound/wm8753.txt      | 40 ------------

Guys,

You choose unusual bindings to convert to DT schema. It is fine but
honestly, less useful, with limited impact. This is an old, 12 year old
binding without users. Maybe it would be even removed by now...

I suggest converting ones which have a real impact - have users in DTS.
Otherwise you will be putting quite a lot of effort for no real gains...
because what is the difference between this binding being TXT and DT schema?

>  2 files changed, 62 insertions(+), 40 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8753.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/wm8753.txt
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

