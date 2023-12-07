Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0E9808EA3
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 18:25:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5CF1850;
	Thu,  7 Dec 2023 18:25:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5CF1850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701969940;
	bh=OSaCKj49TdBQE/wW0nBbIlYjNisy5X/gJJF/8cHix4E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bXo+l2OXu8VYl0HH8XkvYVJOuqJhpgz8g6c62zrckX+kP4RP8vTfXERTyaNSH+cdq
	 kQk8SF+lCupEKUAsB0A8ZNQ3wE/Fzuv7Kly5IrBGvn0fjK7BOxKSWRUeyiu9JcyoqZ
	 d1SzsOvyUUcUYGqIEONwJyS1o6yEwKcyFjea0EPM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEF31F80494; Thu,  7 Dec 2023 18:25:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF365F80571;
	Thu,  7 Dec 2023 18:25:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93C70F8024E; Thu,  7 Dec 2023 18:25:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8ACC9F800E4
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 18:24:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8ACC9F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=DF6JpJO5
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a1f5cb80a91so55383666b.3
        for <alsa-devel@alsa-project.org>;
 Thu, 07 Dec 2023 09:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701969892; x=1702574692;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OSaCKj49TdBQE/wW0nBbIlYjNisy5X/gJJF/8cHix4E=;
        b=DF6JpJO5PIN/ogcr0yzAJrM8RebWSvEXdGcqMW5EdTmSy+AfpK+mriZl/wZoAdia9o
         aJztzYdVijPrklAroh6nIHrfTw4shCcVRl4QaLROk1eP05qIXOBuG/i8E1VTU5yzverk
         eTDfDvBWVTAuEKfiBCC4mH9cf1+agbVwzHpYYJDUCsh+BvvysiHNPK0jSEPAzgu1cKH5
         dICEg7YDIUGGIf6UpcXqE6R7pu0xSss+1iDNYaMAwel2qYggzCLJiIezgn8A6cqNCN+e
         FEsM1Cu/OgtDh9rs/Pqaq5+BlsSxPUyd0yYPSmAkInZkDbOQerAPvrfb5G2QXopmqNOe
         3GSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701969892; x=1702574692;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OSaCKj49TdBQE/wW0nBbIlYjNisy5X/gJJF/8cHix4E=;
        b=pu6tD1YPKfTFa5hitQ3cL+a+cvNzszs80ysl+0yWU1Ne8q9YXXbkS26RzkTkZduHdt
         6AuyVF0f3VE/FEgm36my/Y7MBq+C0Rii8ryEJDWLv9Z9Kam50HkLk1N73rqEmHr/9KAx
         Ml7J2YcGCI0nUseWi8h6lU7eDGh3yNK5ngle7loXxEcGZKTJRCl24UtN1ZUqmzTjvVsk
         6tskmO/go0AZ9lDDtspWGTRdpYOM3+HXc8n9UYo1RRVt7gqCBTC/ICh3SxTRO77DOT4F
         OOg6cTdWaNjKa3FaLFP7zweuudpnFE1RNB7ZQfBQ2XbxKUnwQveLJbd4mnC8XdvgGfnH
         qIZA==
X-Gm-Message-State: AOJu0YztDYsSJSWoL6emCsbuCIdwMY5cRRm5wkZSKpjYXfga4SxGCo6r
	sB9p06e05KnHVSBTdn4CEUX7kQ==
X-Google-Smtp-Source: 
 AGHT+IEtTd+pA4mJobxUqdqM7SglT4EunogmAQ8lpbogM+tHlUMEk4Qwu5mWYwLQ9J+s2P4F/4V7+g==
X-Received: by 2002:a17:907:5020:b0:a19:9b79:8b5d with SMTP id
 fw32-20020a170907502000b00a199b798b5dmr1010958ejc.110.1701969892432;
        Thu, 07 Dec 2023 09:24:52 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id
 a14-20020a170906684e00b009fd0102f71asm1078898ejs.176.2023.12.07.09.24.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 09:24:50 -0800 (PST)
Message-ID: <797b9023-e56b-404b-bb4e-6e178b7ada88@linaro.org>
Date: Thu, 7 Dec 2023 17:24:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
Content-Language: en-US
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, broonie@kernel.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, sbinding@opensource.cirrus.com, lee@kernel.org,
 james.schulman@cirrus.com, david.rhodes@cirrus.com,
 rf@opensource.cirrus.com, perex@perex.cz, tiwai@suse.com
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 michael@walle.cc, linux-mtd@lists.infradead.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, michal.simek@amd.com,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org, git@amd.com,
 amitrkcian2002@gmail.com
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-8-amit.kumar-mahapatra@amd.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231125092137.2948-8-amit.kumar-mahapatra@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: J6QM7D3LHDOQUY5UO4OMXTYOLOL3VDFH
X-Message-ID-Hash: J6QM7D3LHDOQUY5UO4OMXTYOLOL3VDFH
X-MailFrom: tudor.ambarus@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J6QM7D3LHDOQUY5UO4OMXTYOLOL3VDFH/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 11/25/23 09:21, Amit Kumar Mahapatra wrote:
> The current implementation assumes that a maximum of two flashes are
> connected in stacked mode and both the flashes are of same make but can
> differ in sizes. So, except the sizes all other flash parameters of both
> the flashes are identical.

Too much restrictions, isn't it? Have you thought about adding a layer
on top of SPI NOR managing the stacked/parallel flashes?
