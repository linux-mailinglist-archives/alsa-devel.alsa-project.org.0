Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A2F83DAAC
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jan 2024 14:22:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69D18827;
	Fri, 26 Jan 2024 14:22:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69D18827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706275351;
	bh=1R9J06P8/ttwwRvg8nQKlDyvCSA8pRs99L0R7r43U3Q=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=skeyOmJu2eqUQ51ZsEJlLxYnqudiyfkdmYk0tZznvMMSFApCS3iwD48E18ZFN3gNf
	 LcMrJl739JuiAToOO5kPODi0hXjkgEY5WueMXxTfA52f2yfKjdD5vxMQ3MS/cszGHN
	 UYQ60YilO1r5c/yswNsIUhXx564iCnaXoFUoKtD8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C8C4F8058C; Fri, 26 Jan 2024 14:21:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B4B5F8057F;
	Fri, 26 Jan 2024 14:21:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1122EF8028D; Fri, 26 Jan 2024 14:21:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CA1AF800C1
	for <alsa-devel@alsa-project.org>; Fri, 26 Jan 2024 14:21:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CA1AF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=uLgtEQcR
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2cf3a04ea1cso4632101fa.2
        for <alsa-devel@alsa-project.org>;
 Fri, 26 Jan 2024 05:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706275306; x=1706880106;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3LO4L/uqo4fUbqmSqa9g43rknnKsS+IuadX7TcgniBs=;
        b=uLgtEQcRIPJgL6TRpXm2afqJkqcmzc6Hup3wnF/ltdXL8bZf1fX9K/igfnjITaC3cx
         Rq8C6gB3OagivNm2NlwCV8dPm8lrjJ4v0MCzHkbklfL6kD/3otm+MGWs54oGBj8SE7LH
         XvsUz+EZtovjKPx1oLt6a+EgxXSPL3a/0b1tc11mkucNPfHYS5N0VZBpYJ8zm/KR210d
         OjYfJHclXdvUsulyHo5yEsUxDVgjPIFL+FGxA5AAsmePh+9OIeuKvYqzQ7f/ZEAMOvu8
         TwdZQUUJsLXDiFf5r0WrcAuHxtWA9HZiORorFEmMrza44AU2/4U4pgW5iwZbQ0V181ca
         OCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706275306; x=1706880106;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3LO4L/uqo4fUbqmSqa9g43rknnKsS+IuadX7TcgniBs=;
        b=Y9jmHktYuLatUrKjZxQLrfhN5WDnYaIyYhWedddzski9/4lN86pa0xTyGvs1mNJpYJ
         1ECBOZWSY2rJ+qB+FNUG5sL2U/lP4rxPuA9OGsIaXHI5nHCayIczu1lFvcqT//vLbxbq
         oA3iaSMaPSobCMvPM24DABp1I8C5L8WelaheQ70SdS2mOsWegSVsKMJ6IRW8nfPg8IKd
         Irwa1gjlS3VRiTZr6MUUHL6ibTTpU31oYz3dK8NPlOgFFhhSG2+tfIKsZx+MM5IXsgoT
         JavNjSsa9hWGMdpa7FbA1H49tlkYZ+wmCEm35rPO3tSfPOLdTnqHJfMzQ1es/XHDjtQp
         BvtA==
X-Gm-Message-State: AOJu0YyhwnrLrumr6LZeE8GgpfMnmfgeq409QA9AK1kRZoFcg6zbZjCL
	KeBRtTYOcaTLNWbcwayjxs4sL1wvoIwvOhSpu7+MXcyAAeXDcFmkDmkXkwB8SHQ=
X-Google-Smtp-Source: 
 AGHT+IFectoDvTKDWCPxyJpIrX26HU7+8ZDwO0GAD5uqodN7Yfl756aMvZYORY1aJ3oXoJrNbb17Wg==
X-Received: by 2002:a2e:9448:0:b0:2cf:34b4:63e0 with SMTP id
 o8-20020a2e9448000000b002cf34b463e0mr736158ljh.80.1706275306490;
        Fri, 26 Jan 2024 05:21:46 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 l30-20020a50d6de000000b0055c875c2095sm612168edj.96.2024.01.26.05.21.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 05:21:46 -0800 (PST)
Message-ID: <4d377c8e-8cef-4da3-9b25-fc91a7dc3d49@linaro.org>
Date: Fri, 26 Jan 2024 13:21:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] ASoC: codecs: tx-macro: correct TX SMIC MUXn
 widgets on SM8350+
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Banajit Goswami <bgoswami@quicinc.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
References: <20240125153110.410295-1-krzysztof.kozlowski@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240125153110.410295-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2DIHWL5CWPIIHP7MIFM3T6X7TARBZL6U
X-Message-ID-Hash: 2DIHWL5CWPIIHP7MIFM3T6X7TARBZL6U
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2DIHWL5CWPIIHP7MIFM3T6X7TARBZL6U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 25/01/2024 15:31, Krzysztof Kozlowski wrote:
> Hi,
> 
> Changelog in individual patches.
> 
> v1:
> https://lore.kernel.org/all/20230717140138.201745-1-krzysztof.kozlowski@linaro.org/
> 

Unfortunately this is breaking mic on X13s.

--srini

> Best regards,
> Krzysztof
> 
> Krzysztof Kozlowski (2):
>    ASoC: codecs: tx-macro: split widgets per different LPASS versions
>    ASoC: codecs: tx-macro: correct TX SMIC MUXn widgets on SM8350+
> 
>   sound/soc/codecs/lpass-macro-common.h |   7 +
>   sound/soc/codecs/lpass-tx-macro.c     | 666 +++++++++++++++++++-------
>   2 files changed, 501 insertions(+), 172 deletions(-)
> 
