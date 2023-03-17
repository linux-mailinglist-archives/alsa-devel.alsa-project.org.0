Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B98C6BE476
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 09:56:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A46AFF93;
	Fri, 17 Mar 2023 09:55:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A46AFF93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679043365;
	bh=A39HZth5jBOYVhEO0kbxQcjvx+AiXiBx9O/78M7/Tlo=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aTIu7NwCB13Q5DYagntCSeWQc8hV4zuMlcxOlc7awVsQIeEo/IceTRp4O0n638gOj
	 cHjFQMBCuYjvf27mfk/oo7BTyQgNiHo3BwRsKVyAB5NOvCXyidCYi3MbGADRkYJJda
	 G5HD+dE3xeo8t8fpwwSdz+85iTyd3zXub8m/JcTs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D96DF80482;
	Fri, 17 Mar 2023 09:55:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04A99F804B1; Fri, 17 Mar 2023 09:55:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CD9F1F80423
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 09:55:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD9F1F80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=VsLpF6UP
Received: by mail-ed1-x534.google.com with SMTP id eh3so17489110edb.11
        for <alsa-devel@alsa-project.org>;
 Fri, 17 Mar 2023 01:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679043308;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dwQCSboZuICS8K0G99TN2ErNpuHmb25ohMxPa9VYNgM=;
        b=VsLpF6UP/jfyNkUsgQrIsNMGXgi/PJovAp/PEgrwKmC7LvQ3vZoDfSi7sJOz+cjCtW
         Mfq7E2g/DpcTuaHtkGSh3KCtenJ9bbJFUitQvGCWLFGfaGQiZbwkz8rVt8EuWtfEs8Tt
         URnRe6zJe4zIgmZtI88okxgqCkeFD4tH4GaR5aNu8xJMplkbBtrpLSWuOzTukThWJu4i
         CwcV7MoVGDVfAuKTzthsNDPWZ0uOEjB2hQrVD7ZjJjEXPz/EjAf/lpZV3tSr51JHdZbB
         jWFioQa7Rf4J2yVF3Wm9Y0EsQ9M+hHR0NZbcmQvD+KOaVToNE/1fHfdLNYGmIxnlwi3t
         tSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679043308;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dwQCSboZuICS8K0G99TN2ErNpuHmb25ohMxPa9VYNgM=;
        b=d/eOWOeJWQAZN7kj/ApXk5ywQfZhFxY6RUlHaIhM/mbx9gih7zm2kHEOF2PSM4RRTI
         rJ58GSleIwSVBYhR7Um8UbQxyTS+q6qxScuV8D4gl00+bgWyWhGsjNh1k4Xd1O21tzMv
         Jyn+Jkr3GePNHSEEzGiHm045hgdnxmmt7ag1x2uGhIizUuTAXMQ9tK2nfh/pP5vAXUd1
         iSf13yCOiGeZZxaqFJa53kqyPM8/U4j9yGbJ1+7UNKLEJAS98ISiCtpko/0W6x1dtCOi
         PX/wApicfYn5PRTCqwHDuekY32upcRmgkF64JtoJSWBdyI2LDX5CKN2N9N8MIdxae76d
         T7TQ==
X-Gm-Message-State: AO0yUKWakXDW1rGKQKgCfBCxOJTxe1dnkiSZOhB1EiUARdIERLsEpQn5
	uTe12zNJRuJ65YtEFUuwhAaO7A==
X-Google-Smtp-Source: 
 AK7set80Yz1YZY3oiWgcfa6PyrhEtP3Mt3TfQtRSQiG9n3crrunLtvU94OSm8ORktCN5u2WpIKBZNw==
X-Received: by 2002:aa7:dd5a:0:b0:4fb:40c2:f35e with SMTP id
 o26-20020aa7dd5a000000b004fb40c2f35emr2108143edw.36.1679043307942;
        Fri, 17 Mar 2023 01:55:07 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:848a:1971:93e0:b465?
 ([2a02:810d:15c0:828:848a:1971:93e0:b465])
        by smtp.gmail.com with ESMTPSA id
 w3-20020a50c443000000b004ac54d4da22sm760848edf.71.2023.03.17.01.55.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 01:55:07 -0700 (PDT)
Message-ID: <349aaac2-a9ef-5cfc-36fa-40ce20bb84b8@linaro.org>
Date: Fri, 17 Mar 2023 09:55:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/7] dt-bindings: misc: Add the Lantiq PEF2466 E1/T1/J1
 framer
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20230316122741.577663-1-herve.codina@bootlin.com>
 <20230316122741.577663-2-herve.codina@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230316122741.577663-2-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: S62JOJ42X7UEBF2MWNUMYCO2NKS2GR2L
X-Message-ID-Hash: S62JOJ42X7UEBF2MWNUMYCO2NKS2GR2L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S62JOJ42X7UEBF2MWNUMYCO2NKS2GR2L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 16/03/2023 13:27, Herve Codina wrote:
> The Lantiq PEF2256 is a framer and line interface component designed to

Your subject says PEF2466, commit msg and code say something different.

> fulfill all required interfacing between an analog E1/T1/J1 line and the
> digital PCM system highway/H.100 bus.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---


Best regards,
Krzysztof

