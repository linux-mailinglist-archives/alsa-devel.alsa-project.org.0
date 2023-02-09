Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43359690289
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 09:54:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56177868;
	Thu,  9 Feb 2023 09:53:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56177868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675932889;
	bh=2DuDyPaS302+5PMC9/Xq5y3syy3pOnkYbz8iyNWapbk=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vlTstNj/oTres3JVxbHu8Xnc8nkpVu6rE0FpmT6GUQcHKGzcUcbDeeJoXnW4MEVkh
	 sKc2PnaMncvfURiOefiK/m2s+F2VNPUWlhh4zG26G/ziMH93m0vZzmBypt2FAU8GH+
	 lWsiJbO1dfeLvc/D6dLIW8mU0+XRJPqZUzfy8XJM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA1BCF80086;
	Thu,  9 Feb 2023 09:53:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1355FF800E4; Thu,  9 Feb 2023 09:53:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7530DF80086
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 09:53:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7530DF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jJ8GHpG5
Received: by mail-wm1-x333.google.com with SMTP id
 f23-20020a05600c491700b003dff4480a17so3574560wmp.1
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 00:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l5y/lhUdrwmVTQsjBWST0jsa/VEAXBndCCvJ3Ss9nl0=;
        b=jJ8GHpG5opwaKmvBVdBJ8hjVp1FujZRP8vtZjQaozd3gMS3i3CfMTWWn5G764k9WsO
         t26wh+lFnsmUMhAoq4xGic2R37rcMU0tcU2Gwj7IUKFx1LrZsh3ln1irfnILVVfBMCG2
         9ehqdSIkA5phIg2zWzAbNkievBhA7QMEtO9nK0NRa098B/HGMrQAM/5Kk5Dmp2F+TcV9
         gjzGIN8TwfuiV24Yl/rwVvNVbF0kbkLxefbn39qe/vBPMjFHrM/n0Xgdr8h765s0q++a
         /FE27shEXZvVgGHw1BPfH6wvkImKaH+8brQSWF6qzyCvBNjI2v+QpJW883RmAIjx1bsF
         HP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l5y/lhUdrwmVTQsjBWST0jsa/VEAXBndCCvJ3Ss9nl0=;
        b=V/uYcLwApwI6RFNxhyXoPDli0KV8dIRsgiJ2Nl+5S9sWR7dMv7GFHiSLJYsy1G918b
         YCdGp5rzKwrWHz3tpa6sXRboh9N92Cqn+R/z5GpOW4B9LF1cXjoyXX66MLLItLt7Nmwk
         LX4Y6vMJwVFlffC3OFVPjtwSYIGzXekVh8K20tnJ1OrvlEdoDuFbCzE4twknLjIaRXkJ
         1W9iaAD7nljRxg11fHurXkSoh6b2CwFunWwLWgpCgbyLpsd6YstJB9+1f/zijRUGDg1i
         ru0zDWbtZ6g9Abj7FAL+NHkOzo+oPdz6E7AWyDBH2HgoJlg89k035Y3fjapQFoG2S55T
         tl/w==
X-Gm-Message-State: AO0yUKUT4YBFwuSDLm8Z4wCqDjAebLPZ/H845NS59Dp7/vPyAJtb2Mxy
	AsLtGZ+i4oDfC2436sLmOKFaFQ==
X-Google-Smtp-Source: 
 AK7set942EB9Jb29ks+FpmiTWa1FyKDdc2GHg0NYJV+La/gDtKTu6Gdj9I8FuRlj2RlpihjeGBhQWg==
X-Received: by 2002:a05:600c:331a:b0:3dd:f286:5ae9 with SMTP id
 q26-20020a05600c331a00b003ddf2865ae9mr9399968wmp.9.1675932829783;
        Thu, 09 Feb 2023 00:53:49 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 q3-20020a1ce903000000b003dfdeb57027sm4274596wmc.38.2023.02.09.00.53.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 00:53:49 -0800 (PST)
Message-ID: <9b20bdb2-64e0-4888-e8df-fdf1b021c445@linaro.org>
Date: Thu, 9 Feb 2023 09:53:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 4/4] ASoC: cs35l41: Document CS35l41 shared boost
Content-Language: en-US
To: Lucas Tanure <lucas.tanure@collabora.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20230209083726.1337150-1-lucas.tanure@collabora.com>
 <20230209083726.1337150-5-lucas.tanure@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230209083726.1337150-5-lucas.tanure@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HOHWEC7PGD5I5SUEIZMB7ITR77HGMUSM
X-Message-ID-Hash: HOHWEC7PGD5I5SUEIZMB7ITR77HGMUSM
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HOHWEC7PGD5I5SUEIZMB7ITR77HGMUSM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09/02/2023 09:37, Lucas Tanure wrote:
> Describe the properties used for shared boost configuration.
> Based on David Rhodes shared boost patches.

No improvements in subject, I asked twice for it. What does the command,
I gave you, print?

> 
With fixed subject:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

