Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F04759694
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 15:24:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D771D1F3;
	Wed, 19 Jul 2023 15:23:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D771D1F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689773078;
	bh=ZrukAGIhZTYULpa8szj3oqcN+fWG5zRbYqEplOiarbo=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Vot1u5UtSviA9mczVrZNAaiemmfxKp6MH2fjwWeelBfy3ZQlPdrYV4ufQL0W/Uho7
	 lscsR5v8g2hRM8WejDZDaa+k+xHUOB4Iyu6xCrS9nl1nnFpiOi0xe/x0tVds0FfOeL
	 DzhskBiMLVRg938t0evgw49Q71b1GhtlGfJEhhfU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7894AF800D2; Wed, 19 Jul 2023 15:23:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 395F0F8032D;
	Wed, 19 Jul 2023 15:23:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34F9DF8047D; Wed, 19 Jul 2023 14:13:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68279F800D2
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 14:13:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68279F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=AMe2VhIK
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b93dcfe64fso11024101fa.1
        for <alsa-devel@alsa-project.org>;
 Wed, 19 Jul 2023 05:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689768812; x=1692360812;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z99DUAH7xZ+9Qc+iPnS2oNOZjSJ09fjgfWFXuW8zGLs=;
        b=AMe2VhIKab3Wn5NWAVhLYDRHSTHLBr2Ufk7YSptCDvW1xyE5/YPcpw0G5BUhgv5L1q
         RP2sD2cLDogX7UzpmD9PvxhFEnfZgLIQN691Ihg5VAr7EXZjtRWwT71bkB/G0f2FSo3l
         QZsvxobkCN6UVcKfQvQVALvhDlSPbBmiiCIH+3ULgKbXy1PVqeFYlosmY6e/J0p7G925
         T+IY3GwrM+uLiJDMJtO05YZgxVEaUwXf4g3OCyD2XAXbm4h/hsJjYhz3ijPBhq+vNhaH
         Rlwcy20+Eg7B/mIFuvO1xP01DKmWtwT44s23d2Ef0gqwLLMd0kk0U2HTNVzW//kjQUt6
         owKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689768812; x=1692360812;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z99DUAH7xZ+9Qc+iPnS2oNOZjSJ09fjgfWFXuW8zGLs=;
        b=FF/jHLQz9RvG6qUmQagR2G8sY2A7dIVO+uZ6wFRzhNmkFt4cwdebp2sSexl6IEEEhU
         U1/37Cb5X5x7HpBUz5jMHskyuLP1RskFm+ZVNILskx0ebfLxx4BhmE8K6jZZDQdpPlxK
         uWq1XgC4LT2tdPpl5rc4dlkfz4moPqVHwDqV2yyVhiR3NUOc7UwJXaatE0yIXPEx6Ye2
         +AB3YpOxKgaBJiAzYHxquZr9VWbQr5twzmMsLaBm7GgnKvBsfWDWtzh4CHaNs/hmTTzK
         syvX9f7agJzIr3W7C4jdz9CqTDq7pnzcHuTx81ZOiC+a+OZzaLXFXYo6LVfpwfGKi/Q/
         lj2Q==
X-Gm-Message-State: ABy/qLbsUMJl1d+dIC0+NUbygEazBUohsJtO4EKLpiB05XYz4uVmA4Tf
	m4ItuZf5qPeETQfVwvOG780=
X-Google-Smtp-Source: 
 APBJJlFVJ0gCRzrgCOlgKul02zB/ZwuPfWiEBAW6smDTTwU6aL1NoGLW3fJbk0ixH3KBQ5PN1d4dJg==
X-Received: by 2002:ac2:559b:0:b0:4fd:d186:6603 with SMTP id
 v27-20020ac2559b000000b004fdd1866603mr1353550lfg.0.1689768812217;
        Wed, 19 Jul 2023 05:13:32 -0700 (PDT)
Received: from [10.10.19.213] ([178.160.196.94])
        by smtp.gmail.com with ESMTPSA id
 v17-20020ac25931000000b004fbe2172f7csm923524lfi.49.2023.07.19.05.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 05:13:32 -0700 (PDT)
Message-ID: <7eaf33be-78fb-4b35-ce61-79b4cbcc4eb8@gmail.com>
Date: Wed, 19 Jul 2023 16:13:28 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] selftests: ALSA: Add test-pcmtest-driver to .gitignore
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20230719114336.18409-1-tiwai@suse.de>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <20230719114336.18409-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3ZEOKW3UO5HT4JWAKQVGWAVUMGTAXY3Q
X-Message-ID-Hash: 3ZEOKW3UO5HT4JWAKQVGWAVUMGTAXY3Q
X-Mailman-Approved-At: Wed, 19 Jul 2023 13:23:44 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3ZEOKW3UO5HT4JWAKQVGWAVUMGTAXY3Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 7/19/23 15:43, Takashi Iwai wrote:
> It was forgotten to add the new binary to .gitignore.  Let's fix it.
> 
> Fixes: 10b98a4db11a ("selftests: ALSA: Add test for the 'pcmtest' driver")
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   tools/testing/selftests/alsa/.gitignore | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/alsa/.gitignore b/tools/testing/selftests/alsa/.gitignore
> index 2b0d11797f25..12dc3fcd3456 100644
> --- a/tools/testing/selftests/alsa/.gitignore
> +++ b/tools/testing/selftests/alsa/.gitignore
> @@ -1,2 +1,3 @@
>   mixer-test
>   pcm-test
> +test-pcmtest-driver

Looks good, thank you for doing this!

--
Kind regards,
Ivan Orlov
