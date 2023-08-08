Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A18A7739BD
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 12:42:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFADFE91;
	Tue,  8 Aug 2023 12:42:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFADFE91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691491370;
	bh=IAI20pdkkx5r0Hy+t3zhx7F5PgYwfmN1Apr7AWSZw/c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jbIYpqJG5C6DjYmbQ0PnA1zb18uaHP0Aa5BJYl5TRzNEHdZc+1//o7NjFocR4NN0V
	 uWLpRx5F0g/rHdXx5x/dnYDq1WKftDsAdgdUtnx8U6JEz/0CbZxWQfSwa0jhsQjdbY
	 piS+HsrwaTwQQoLRPUwI4jpUOreEVWk/ooPy3P1I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CA67F80694; Tue,  8 Aug 2023 12:36:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0363F8068F;
	Tue,  8 Aug 2023 12:36:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2569F8016D; Tue,  8 Aug 2023 07:21:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FROM_FMBLA_NEWDOM28,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 715B8F8016A
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 07:21:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 715B8F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256
 header.s=google header.b=MS56Xozm
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-99bfcf4c814so771679566b.0
        for <alsa-devel@alsa-project.org>;
 Mon, 07 Aug 2023 22:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1691472063; x=1692076863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VA7k4XuYhqMiq1aimPn7yYHaKH+IPXSpGngvmVHTGB4=;
        b=MS56Xozm19f05ktxZE2AtigFgVzE4LuaMMKS9MVvR2Bx6XpfSKnWhq9ILGBKuUZE6a
         BFgLVcLbn8OhH/H6NmjK+ehS2trN35lwS7y75KwS7QSdISzlJCSNbnCSRk/Xr9C0yDLV
         +7LVchfqD9d64iNzC9zB1Jm6KZpsX+q1IpC+98tTt568DlWWFKfXddTEimJN5t1wVqmv
         XuDLP7bi1c5/jQhFIFduQ1c1bxH/Mwb098fdyPKyFTvjPEr92CG0/wGO3pA1RyUtbEkf
         k52ZZJVqgsTU9fynXqdbSvxr2a+rsEPV0NeQo/AnclhoKlOJYmKfVzBBWDFMVqzSsLhr
         2a/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691472063; x=1692076863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VA7k4XuYhqMiq1aimPn7yYHaKH+IPXSpGngvmVHTGB4=;
        b=AIMjsUdEbFHvVGJ1LDnphbycNtl97dbYHq8Ah2WD6qReHwpfSHmDF2X/TuymTN0bK9
         z3TAQVYSUxddRm/D1Nl7IL2t3Foc6lGWo/wrZdw3Py4J/WF0xx8yNUoH+SqbQe9RmAZ5
         nzRqb7Ekce76VbZSZDhbvOcrFZcB5buSw6zwod/rJr2NeJ5ec+ZUBJ20UVsWwHKR1fnw
         bdX5lM4YG+I0U+65GMpM+Wg64VsxfqVVojhKBCGkSwJL9rCYRopfFnQce42irWotZxXa
         AieguYGIDq7GJ8KEJwAt3dJR0g5f8oqZVN5U3Fu3LmEIIbNhYScgJbDBV02tx/7xNQIz
         g68w==
X-Gm-Message-State: AOJu0Yza7vQEqFduhE9u6cRSfTBBu74cYC4eNirPCqrwZ/8oe+jY3aZ8
	1lrPruoCuYttIBHm4djfkAw+Jg==
X-Google-Smtp-Source: 
 AGHT+IGI3NvWLARIAIJ806WzFo1Gu4YYpyDDo+Y24Lhf1uUKTQCBoWPTHY8UkO7PvmeembXLpAFOxg==
X-Received: by 2002:a17:906:2081:b0:993:e752:1a70 with SMTP id
 1-20020a170906208100b00993e7521a70mr11879972ejq.19.1691472062881;
        Mon, 07 Aug 2023 22:21:02 -0700 (PDT)
Received: from [10.0.2.15] ([82.78.167.79])
        by smtp.gmail.com with ESMTPSA id
 k18-20020a17090666d200b00992f2befcbcsm6125952ejp.180.2023.08.07.22.21.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 22:21:02 -0700 (PDT)
Message-ID: <745d818d-fbfe-da02-b98d-bd7b2c5059ed@tuxon.dev>
Date: Tue, 8 Aug 2023 08:21:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] MAINTAINERS: update Claudiu Beznea's email address
To: Jakub Kicinski <kuba@kernel.org>
Cc: nicolas.ferre@microchip.com, conor.dooley@microchip.com,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 maz@kernel.org, srinivas.kandagatla@linaro.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, sre@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, alsa-devel@alsa-project.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230804050007.235799-1-claudiu.beznea@tuxon.dev>
 <20230807122508.403c1972@kernel.org>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20230807122508.403c1972@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-MailFrom: claudiu.beznea@tuxon.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NT7BVNJZLM7OYSNHGJTZA6P4LPTCE7DE
X-Message-ID-Hash: NT7BVNJZLM7OYSNHGJTZA6P4LPTCE7DE
X-Mailman-Approved-At: Tue, 08 Aug 2023 10:36:06 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NT7BVNJZLM7OYSNHGJTZA6P4LPTCE7DE/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 07.08.2023 22:25, Jakub Kicinski wrote:
> On Fri,  4 Aug 2023 08:00:07 +0300 Claudiu Beznea wrote:
>> Update MAINTAINERS entries with a valid email address as the Microchip
>> one is no longer valid.
>>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Thanks for updating the email!
> 
> A bit of a cross-tree change. Is there anyone in particular that you'd
> expect to apply it?

No.

> If nobody speaks up we can pick it up in networking
> and send to Linus on Thu.

That would be good.

Thank you,
Claudiu Beznea
