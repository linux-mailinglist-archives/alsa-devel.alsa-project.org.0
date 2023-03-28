Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C216CBCAC
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 12:40:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B51E01CF;
	Tue, 28 Mar 2023 12:39:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B51E01CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680000040;
	bh=r+VFqsXlNkyOVK/CAdzHOQz2NJg4yDQsLr8pse+kGVM=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SuYhbd7CRAeKfNsziZLtXZIxAPoqiW4IczUckyHw2oAaHjuZabJ9mTI3hEN3vOLgL
	 3/gADWvssDhwmL2nl3ZgVbg7iuIzM4NF3giaomOszU9ynYT+JlwhsBIh0mk/3sqTun
	 cCP18elth04oRQIUAhFfid5s4jgfgSohcOlwdnMQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AC42F8024E;
	Tue, 28 Mar 2023 12:39:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4F15F80272; Tue, 28 Mar 2023 12:39:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F1D93F80114
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 12:39:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1D93F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=IC1gzxtz
Received: by mail-ed1-x530.google.com with SMTP id r11so47671322edd.5
        for <alsa-devel@alsa-project.org>;
 Tue, 28 Mar 2023 03:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679999980;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Rp6VZo9LId3BX033N14P3CvaNIPCBV06I8wC19k9S4=;
        b=IC1gzxtz1oG3wkhY1SGJbyjAopyj4+cuFnb6DHovrkLVwPC1n1MvhFVfj8xQqN/eSi
         HX9zgt4WbUeZ+GH9dt6RSV3kvCUJ5Z9E8yZqMVTQA2SboqnfBbCTQ/y2DN3J4Xi7bUK4
         GXiwVHhyCwe5x3l5KDdJZTSs/E99IoeSe3bQzuidTMNWLEIRZz75LuI1vu/56D1rNR4M
         Jd0do6CLI4JHT5D0en0S+4RaX9rPRfv7eqnUq/KLlblUmhaRkHjl3wBI91j2KQuONyf+
         3yng0iLbssqZrH0x7HqeMoHjrxAg1GDn93TcV1Zf2uqi0S/0jhHToGMYBfPHkvv+g/33
         26qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679999980;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Rp6VZo9LId3BX033N14P3CvaNIPCBV06I8wC19k9S4=;
        b=5cVrHe5fsh8PZ+8nTRvXgO656gFt1wZv1zAeBkKhMWpzG1pw4lo4n5iDhxDDfcS2ZN
         ktnvUeIQ6Yy+LxMOj/h8RDTCd1vo6rO6p5SwWgryHMa5KapOAzEk9igyOw6XohYwQ6LK
         gIXUux15vG0mSU7YYy3DH/kjwkBTDkkBr+APAgl1yIjL6yWDedmop+aegfxRTLla98bj
         hY8VewGdqE3wmVVxdP17cbUINmWYT0aySyDTTVp6mAQ0Nhuyv5DzLY2UISA2pjCHwXqG
         +Vqs93Hqxf5CcAb2m7wxicFwozHeGmw3S1t6Udmb43tkLAUG9ybwLtR1dHcfv9bpQN69
         x69w==
X-Gm-Message-State: AAQBX9fmfkxiKb7KElkMAL6rihwHa9ISCQC3TioV0h96mENIf/2iAj0f
	gBKdcuTY6+W6CXFk5d0MYjmUgHoyWpqdk3z2GLY=
X-Google-Smtp-Source: 
 AKy350aeR+l2QHShByGShBsM2Crvf40sRkJF4PZYF6Y+FbeRMaArabxY1QQn39ltc8XEMe8dPD7unA==
X-Received: by 2002:a17:906:bcec:b0:926:8992:4310 with SMTP id
 op12-20020a170906bcec00b0092689924310mr16185642ejb.38.1679999949968;
        Tue, 28 Mar 2023 03:39:09 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6?
 ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
        by smtp.gmail.com with ESMTPSA id
 k19-20020a1709063fd300b00928de86245fsm15118289ejj.135.2023.03.28.03.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 03:39:09 -0700 (PDT)
Message-ID: <2dc9dc13-62e0-2b2a-b235-bc6e21d64dbc@linaro.org>
Date: Tue, 28 Mar 2023 12:39:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 1/5] dt-bindings: mfd: Add the Lantiq PEF2256 E1/T1/J1
 framer
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20230328092645.634375-1-herve.codina@bootlin.com>
 <20230328092645.634375-2-herve.codina@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230328092645.634375-2-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MQGRA7RTHGFVGQ6NOQBJYW43BQ3OEDFT
X-Message-ID-Hash: MQGRA7RTHGFVGQ6NOQBJYW43BQ3OEDFT
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MQGRA7RTHGFVGQ6NOQBJYW43BQ3OEDFT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 28/03/2023 11:26, Herve Codina wrote:
> The Lantiq PEF2256 is a framer and line interface component designed to
> fulfill all required interfacing between an analog E1/T1/J1 line and the
> digital PCM system highway/H.100 bus.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/mfd/lantiq,pef2256.yaml          | 267 ++++++++++++++++++
>  1 file changed, 267 insertions(+)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

