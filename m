Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FE56CB867
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 09:42:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A09BB1F4;
	Tue, 28 Mar 2023 09:42:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A09BB1F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679989376;
	bh=Sb5m+Oe6n3g/mzfPPCsdcAJCaJ6GLZF92hT9nw/ndm8=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Yw5DRP1k7UyuhN2M4OlRv4nVJKoZ4WlA7WMZXh7nIYcvDe3nNA7frTlkK0UHZbADR
	 ypncLRkfJ5hXMQaShA9+vYSYvXuZiR1NHSifyWKwO2RdX4BfLTq+eKd/ZtjBC04cF5
	 RamSXyUSKjxfgnSKkCAtd+iyJT178G6W3N6Y7aMk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9D90F8024E;
	Tue, 28 Mar 2023 09:42:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6546F80272; Tue, 28 Mar 2023 09:42:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11ECEF80114
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 09:41:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11ECEF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=n3D+VFn8
Received: by mail-ed1-x533.google.com with SMTP id w9so45904476edc.3
        for <alsa-devel@alsa-project.org>;
 Tue, 28 Mar 2023 00:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679989312;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B9ufKZwxlw52D87XJPI1kMvE4zVDD0Zw+DmPa/M3l4I=;
        b=n3D+VFn8KT+Z+WIdreipgrOuNp9hqIqGj86749q40xAnsceYzojpBCiefiv/MIR3AJ
         3YNg62QVt+4ZsdMbtJnbYsmhNWRawGvuJH3re+MNp2q4gQBR7VPotlIWsUS5fReWjdU1
         4CLrrrwYwukZltHPIzUE92V6dxkIzFU2Sh2GHy+1KWVAPgD7/Xh3MJt/CPFS78SHEBui
         VbavTBqNknYIDkXVYJFT4n39cfhe/BANZwJypNGWFXrj/PxbPC7DkEEjXAy3TPYzvZtF
         RuId8ppxDdFDnMV/8xNiWtgIWsJkVpChyFpYSnYbZ53rrrp0bwrxGJhPC0OatH1Z0WzN
         3pFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679989312;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B9ufKZwxlw52D87XJPI1kMvE4zVDD0Zw+DmPa/M3l4I=;
        b=L1jpWrG/eBrt9apJZLCICTBY6wIHa/AoY8mTy22xldC62UU+vEto68b6bEdepee/Bx
         ph+7uL2Ui31C0KVdSS7cGvSBok38tRCgxzqE0F1DksQr4c+DVN8rm91JY8Pzuj1kGfNX
         ESIENmXrh7XExLAGQpOGtVMBWlpoGJQWgJIw5v+vO9nh4c3e1y1V3Pyllo7VuVcKO9uf
         cTM7KPRsxnCV1sMe5Aovgis2iY3Q3qr99wmRDBIiTuNNzYM4gBR0dPsLnw2O2Sk2BlZO
         wlaL0ACa8B34EghmXrWWeToczUzngpAO1SdJrHz8IMC7hzPTetRD7+mhuwPqyF4ko9Kk
         4nqw==
X-Gm-Message-State: AAQBX9cBwyIiV3DFOYAFxWoqJG2YVrdlvZlclilVW5TN3vgY/6IOLKqF
	F2G/nbhATjfYMk8CUE4/Maahwg==
X-Google-Smtp-Source: 
 AKy350aNpBP43XpYra0IPKGvGv8JB0eUb3lwNLn7r2yGQg9SzEVJlfP0qpN6OwQahnyS3Lmdb+K9EA==
X-Received: by 2002:a17:906:780c:b0:921:5e7b:1c27 with SMTP id
 u12-20020a170906780c00b009215e7b1c27mr15384488ejm.24.1679989312130;
        Tue, 28 Mar 2023 00:41:52 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6?
 ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
        by smtp.gmail.com with ESMTPSA id
 b1-20020a1709065e4100b008ca52f7fbcbsm14946887eju.1.2023.03.28.00.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 00:41:51 -0700 (PDT)
Message-ID: <0aea4e60-f835-3bb0-f082-b7b799f2ad95@linaro.org>
Date: Tue, 28 Mar 2023 09:41:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 0/3] Add "mclk" support for maxim,max9867
Content-Language: en-US
To: Richard Leitner <richard.leitner@linux.dev>,
 Mark Brown <broonie@kernel.org>
References: <20230302-max9867-v2-0-fd2036d5e825@skidata.com>
 <167810953075.75807.14829875612499629879.b4-ty@kernel.org>
 <20230328055916.GA11037@g0hl1n.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230328055916.GA11037@g0hl1n.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: P2JQLMKU6XRG3ER6GE6GU7LEQDYLVSAI
X-Message-ID-Hash: P2JQLMKU6XRG3ER6GE6GU7LEQDYLVSAI
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ladislav Michl <ladis@linux-mips.org>, Takashi Iwai <tiwai@suse.com>,
 Benjamin Bara <benjamin.bara@skidata.com>, Benjamin Bara <bbara93@gmail.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Richard Leitner <richard.leitner@skidata.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P2JQLMKU6XRG3ER6GE6GU7LEQDYLVSAI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 28/03/2023 07:59, Richard Leitner wrote:
>> should be sent as incremental updates against current git, existing
>> patches will not be replaced.
> 
> As Krzysztof requested some changes on the clocks property dt-bindings
> patch (#2) commit message... How should I handle this?
> 
> The changes requested on the patch content (dts example) should be sent
> as incremental patch to the original series, I guess?

Incremental updates, so new patch. Rebase on maintainer's tree next
branch or linux-next (usually linux-next is the easiest but for
cross-tree patches might create inapplicable series).

Best regards,
Krzysztof

