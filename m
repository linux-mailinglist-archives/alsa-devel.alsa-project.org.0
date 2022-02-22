Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9309F4BFA58
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 15:07:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1853A18C6;
	Tue, 22 Feb 2022 15:06:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1853A18C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645538845;
	bh=NA8+jCyvREvqGHTqBF4eNUW4INb0tf+j0vAueWlxT2s=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DVEn7SYT7DqihBU8o90J2wZ4/A2K5sGrljfwV/TBXIvmplp5XpVXoIlEwtMk8QCUQ
	 Zd7VdThtcCSEnetO+YM5GNQN6xr6Ft1BCObES3eznUOBmx4mi7MTgB7MEH8iuLQDov
	 lEYSaMYlgFDT/zQws0YE+4wmSyOd0Zn7OZZghrRQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B5BFF800D1;
	Tue, 22 Feb 2022 15:06:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85C22F800D1; Tue, 22 Feb 2022 15:06:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E459F800D1
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 15:06:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E459F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="LZj1lTQW"
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 87BC63FCA4
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 14:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645538769;
 bh=Ex20pGdyVA6rdZa+N+dbyBUHdPBBAkWrdlc+5TIlRVw=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=LZj1lTQWYAuXyOw8wPcwYXN57oHdRLVT9Zx7hDEThfmdURtJXyXj304gTuNmsiX6C
 qi3rImXtthv/qtln2EnHrAJo+RmXE2SUrvJrCm0vpN94dPZUDSkQY3A4kia09D8RgI
 XasGZm7RvAfVG0d1ltt0lfmdHfri7AbcZfsTPWOCcxKJ3Sh93S72HwtCtFeHD1Tfys
 T/ciF2fpg/bOsy5NcS2/Tyqmm/COZmi3CXoCiyAt9u9zXbtt7vtBhpLWYyWDtdTI6F
 h0iAFHZ/9bZV3HYZrk+8+g2rYjZwYoVBzzOG+PWjHIc8L0QJNi9oJM5w493DS+tCad
 Hjg8ocD+6UnJQ==
Received: by mail-ej1-f69.google.com with SMTP id
 go11-20020a1709070d8b00b006cf0d933739so5834885ejc.5
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 06:06:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ex20pGdyVA6rdZa+N+dbyBUHdPBBAkWrdlc+5TIlRVw=;
 b=RalYBgfrVV2cS3a4DBCRxhKEtPXH1uBd8hVVq8s3EjWfRk+jr1aRKZymo4uXRMsPIG
 gDv5xdY4CSK70mj5BAUpIrM5H6dO1+8DtivwLVvGoQYwtER6YIrvXBltF/aRBhfEyq4c
 tuIR4fdh++rtRC5LFxLacNaUPXQ2YoqMWy7kOf58f2YLFMuet4sMN9TKDS7rEJOMZMzZ
 2Nfw20E8c739tVrZ7WLqfIkoJaC9LqWNUtAkUgyItRHqIm1lifXCMwYerhaaWpNGNIdM
 DVdvF3hgfGIFm2QZVaFokLsofmF63GPmFotNLtdxTSKaO62A0RS2htflNtwZ/iZX5Tuh
 exww==
X-Gm-Message-State: AOAM531Mx/ADueujSJzStc3zTy4zTAjcFsMkrJizAlIWgOOw4HAfWEC7
 t6EK/YRPv2dzSu4LnecbVFrtRjCb/0hktH088O4ly0TQPjexu9e7BeRq4AWaHTNNSN9P21txImW
 QUNq6Ohqvyzkqrx2YKP8cFGCbWOZM1eQ3WVSSBqCi
X-Received: by 2002:a17:906:bc46:b0:6cd:e855:18fc with SMTP id
 s6-20020a170906bc4600b006cde85518fcmr18907787ejv.263.1645538769164; 
 Tue, 22 Feb 2022 06:06:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUUFo+MCawKbbrGDwa6/+HFHVXyMoHCh84TK/EYexbFGbI2d+9a7o32GG01mcO2bXV4O9S7A==
X-Received: by 2002:a17:906:bc46:b0:6cd:e855:18fc with SMTP id
 s6-20020a170906bc4600b006cde85518fcmr18907772ejv.263.1645538769004; 
 Tue, 22 Feb 2022 06:06:09 -0800 (PST)
Received: from [192.168.0.124] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id z11sm2185298ejr.99.2022.02.22.06.06.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 06:06:08 -0800 (PST)
Message-ID: <afa7001d-901e-55bf-b8dc-77051b1e7f78@canonical.com>
Date: Tue, 22 Feb 2022 15:06:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFT PATCH 0/3] Fix kfree() of const memory on setting
 driver_override
Content-Language: en-US
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Abel Vesa
 <abel.vesa@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Andy Gross
 <agross@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
References: <20220222132707.266883-1-krzysztof.kozlowski@canonical.com>
 <708eabb1-7b35-d525-d4c3-451d4a3de84f@rasmusvillemoes.dk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <708eabb1-7b35-d525-d4c3-451d4a3de84f@rasmusvillemoes.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 22/02/2022 14:51, Rasmus Villemoes wrote:
> On 22/02/2022 14.27, Krzysztof Kozlowski wrote:
>> Hi,
>>
>> Drivers still seem to use driver_override incorrectly. Perhaps my old
>> patch makes sense now?
>> https://lore.kernel.org/all/1550484960-2392-3-git-send-email-krzk@kernel.org/
>>
>> Not tested - please review and test (e.g. by writing to dirver_override
>> sysfs entry with KASAN enabled).
> 
> Perhaps it would make sense to update the core code to release using
> kfree_const(), allowing drivers to set the initial value with
> kstrdup_const(). Drivers that currently use kstrdup() or kasprintf()
> will continue to work [but if they kstrdup() a string literal they could
> be changed to use kstrdup_const].

The core here means several buses, so the change would not be that
small. However I don't see the reason why "driver_override" is special
and should be freed with kfree_const() while most of other places don't
use it.

The driver_override field definition is here obvious: "char *", so any
assignments of "const char *" are logically wrong (although GCC does not
warn of this literal string const discarding). Adding kfree_const() is
hiding the problem - someone did not read the definition of assigned field.

Best regards,
Krzysztof
