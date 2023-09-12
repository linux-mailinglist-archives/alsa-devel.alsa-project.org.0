Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DEB79C1B7
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 03:35:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC7021D7;
	Tue, 12 Sep 2023 03:35:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC7021D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694482552;
	bh=cQJLgb1BzHYxmjYvj7JY5BKIaVIvca44I1X+r+qhr40=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Dqin+87K9S6Gql5F+vMtemLpb4icy/cTm1BJZ3DzZkIrJ2qM4JXAZf8Lqwsxj7okg
	 G33uOFpR1zVXKKqp0BxZyMjLINdYRBRd4zm6kanPlpSc7LriGj3UgLTxOwOAPEAHJ2
	 9L7ve9WkovVdSjJBxykCgp8Bdaz0An3DTJODcT0s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7867F80558; Tue, 12 Sep 2023 03:35:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59C84F80246;
	Tue, 12 Sep 2023 03:35:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79128F80425; Tue, 12 Sep 2023 03:34:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67D3FF80212
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 03:34:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67D3FF80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=s3Sltd3h
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1c39a4f14bcso22318765ad.3
        for <alsa-devel@alsa-project.org>;
 Mon, 11 Sep 2023 18:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694482486; x=1695087286;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=emSwqr+1xErKYh7O3K2A83PvnYfgpw6yJfaUgEcoSa4=;
        b=s3Sltd3hA3Q4GdoS7VcVUf5GQBTYFRQ6OrtXRRChGv8iy0OgVCEbGee1BD8j2DrEOw
         u7xFOWJrPkesNEGWeOaWYjg7xQDrI4UH0e+M7YrEloB+9OqOudvmWcRAHPeafsoL+m5K
         StggP2CuwUFLJ3zz3Ssh9BWU443Hzdbz1ePeu53c6XJiNVSy90wsE6VikVeSd4962j2i
         QjB5BPzWyJjdLqgPsnL7+0/n7gDMY8BlbT5xf6xBvWlEwXA4pPutq/xhp91kRED131lO
         DqBDsMJNxsTwyNKDlQMXjYqqLk8kQRe/vzGdWMMs9chCr0If+rAnr/cPAqXlx3GU7N1s
         yssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694482486; x=1695087286;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=emSwqr+1xErKYh7O3K2A83PvnYfgpw6yJfaUgEcoSa4=;
        b=inHaaeWNdi4mHVEHHF28v7Kq9EY60tlJVK+0vzIvr7fcsGL3d7DEIWqB0bZhEFQWBi
         EGYzp1rSH6+caNaOMP1DRiwMkr12yRTO2Btrqr34T9gg7QrnIvR12n3mObZu/PLi0r2U
         YJlrAQhweDR/TEY3Ogq0C3UiSmfE4c6czzxUSV6iud/dDtFKCaTBypXahafxzfq8Z3SA
         xlL0ohil5pMaq6Pg/g4qnQnTxi0/mf5JJ0YtSX9G/PEn3/csAw0B+yMy58xv66lC2hdS
         Puim38h8wslBW5UFd9p38+COQ93Z0+9g/iSr9QdavvyQIsf4oGbT8o92lETpJ5DcIAzl
         N11w==
X-Gm-Message-State: AOJu0YzHUNtckW3QQz63uEomxy7QePaV8bq7s7LUjRn3ApRbzi2KDyub
	V449cs7Ryqg3Jt6YKSrHx+U=
X-Google-Smtp-Source: 
 AGHT+IEH7O26gZQqAU5DXvjl/pZ88rf0WJY2byLIfXgwGd5rVvEH6RB8Z6ZRTRGBzoqvuhlZelcApA==
X-Received: by 2002:a17:902:db11:b0:1bc:61d6:5fcc with SMTP id
 m17-20020a170902db1100b001bc61d65fccmr14252548plx.51.1694482485802;
        Mon, 11 Sep 2023 18:34:45 -0700 (PDT)
Received: from [192.168.0.106] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id
 a7-20020a170902ecc700b001b890b3bbb1sm7074337plh.211.2023.09.11.18.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 18:34:45 -0700 (PDT)
Message-ID: <3721e97b-365c-d6da-b8b8-1a963e569e3c@gmail.com>
Date: Tue, 12 Sep 2023 08:34:35 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] ASoC: dwc: fix typo in comment
To: =?UTF-8?B?6rmA66qF7Jqx?= <mwkim@gaonchips.com>,
 alsa-devel@alsa-project.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Xingyu Wu <xingyu.wu@starfivetech.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-kernel@vger.kernel.org
References: <gab64ffbd7bdbafc@gaonchips.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <gab64ffbd7bdbafc@gaonchips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JPOIPN5RBJL2F4SISTWHSU3WR473LWFW
X-Message-ID-Hash: JPOIPN5RBJL2F4SISTWHSU3WR473LWFW
X-MailFrom: bagasdotme@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JPOIPN5RBJL2F4SISTWHSU3WR473LWFW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/09/2023 08:23, 김명욱 wrote:
> ISR_RXFO means "Status of Data Overrun interrupt for the RX channel" according to the datasheet.
> 
> So, the comment should be RX, not TX
> 
=

OK, but next time don't reply like:

> A: http://en.wikipedia.org/wiki/Top_post
> Q: Were do I find info about this thing called top-posting?
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?
> 
> A: No.
> Q: Should I include quotations after my reply?
> 
> http://daringfireball.net/2007/07/on_top

because I can't see the context you're replying to.

And don't send HTML emails as mailing lists hate and
block them.

Regardless, send v2 with reviews (especially on patch description like this)
addressed.

Thanks!

-- 
An old man doll... just what I always wanted! - Clara

