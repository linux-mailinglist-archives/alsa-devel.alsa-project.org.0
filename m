Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 778D1751ACD
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 10:07:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01CFC206;
	Thu, 13 Jul 2023 10:06:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01CFC206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689235661;
	bh=2RzZG6Nv+sO9UFGkgxxKoYdWkr44mmFz4/z3jptgZVI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Nhk/oc6AtQTeX7scxSDx+gfNhESnfNz3gcuBP0q20qCUquvFkZR2Am2tbRGg4utSn
	 oAJ0qhJz0+9L0LM/KzWVQeLlW76P74fsvqai5YRgS7iHixa9pw36XKBa+nRH4NrfBT
	 n7Pv8X0wRDZqHSdaob4pJLjL/zijJPQkKzSyN0LI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15EBAF8024E; Thu, 13 Jul 2023 10:06:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 448DCF800E4;
	Thu, 13 Jul 2023 10:06:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B9F7F80249; Thu, 13 Jul 2023 09:48:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F54BF80153
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 09:48:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F54BF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=r86uCzU4
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-98e1fc9d130so13907766b.0
        for <alsa-devel@alsa-project.org>;
 Thu, 13 Jul 2023 00:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689234507; x=1691826507;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ndfusz0Ew/9H13cssvGl1gKVP/EEjfBAeT0WImx1s0A=;
        b=r86uCzU4iB9lwWfEiS3ussRwFswjnDBQ/4gqjlxMOjWzH0Qb0gutW0d7sO2ZClx3MH
         Nkp/hMES+SBk6ONcS1O+oiwR0ZN+EzAamjTpQFa/bshMv7toMl/kUNL/z63avF85f4ME
         O4o3FlENc8fFDD4ZG3sz9B5G76S8gxgZjFvrkZrmiovm5aSXG6XVi9sFOiUEs+MqD7ZJ
         kqgVth3NRWPaw3H2HIBCCu6I5GWSylphAhgs+ocJ7yPS76THPgJPKR34X4iJ/E3x9cvG
         N224oIuLyaf1+59M8Dh5tNjslYce4MXpAHz39f10gPtS7v8HuWfrVbUowBm5bIop0fX6
         N0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689234507; x=1691826507;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ndfusz0Ew/9H13cssvGl1gKVP/EEjfBAeT0WImx1s0A=;
        b=E9vqx8Pnj3zaKYCwf4PbVUvx4DImoYaONSnHgyhE6bCKswPB96mcwGSMPHw5IJwpiT
         uuV01o49TdWBnlorZ9MpaIls9HlhV+ZXqfKgKKqklLxqjZF6FN7KPXD+HNj2ex00H2bd
         p/xA/oIMhWPzqjngHsEcvwOaAGYsmal7d3up+qxxya9oTf7PWA8cDScW9GJqt3T8G/8Q
         U9sDsUmJ2LPc6O2TdSztzrBPqojvnZ/NailkZDHbhjIBfBk1CEJoMQJugCtTKko08ikX
         GoNZKmjNiKTPG5awhfIed7RVkwCTlrHD3IysgNkVWsxiZ31Eg9OdGQrU+BVSGXdeLYBH
         DzCg==
X-Gm-Message-State: ABy/qLbArvWRjQuTxCCBhjmbgJnJ3kQN2JFonmh/cL7+Z6ItkXmGpM6t
	i0+QKjuYr5DyO+zeh+aoo/M=
X-Google-Smtp-Source: 
 APBJJlEs0yP+8wV22mQSkfnFKKtblVhfWleoA3i5vfhb5PjHGzu5pzzz4JLYc7xq8e4txGbm5yHuPw==
X-Received: by 2002:a17:906:738c:b0:993:eed1:8f0 with SMTP id
 f12-20020a170906738c00b00993eed108f0mr589227ejl.3.1689234507219;
        Thu, 13 Jul 2023 00:48:27 -0700 (PDT)
Received: from [10.10.19.213] ([178.160.196.94])
        by smtp.gmail.com with ESMTPSA id
 b21-20020a1709065e5500b009934855d8f1sm3607892eju.34.2023.07.13.00.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 00:48:27 -0700 (PDT)
Message-ID: <07697618-de3b-a27a-4dfe-f9d99c42c219@gmail.com>
Date: Thu, 13 Jul 2023 11:48:14 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] ALSA: pcmtest: Extend error injection, decrease buffer
 filling overhead
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20230712191325.8791-1-ivan.orlov0322@gmail.com>
 <87351sgxgr.wl-tiwai@suse.de>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <87351sgxgr.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DTXZQNUK7GNULLLUVC2QRIDRR32VRIB6
X-Message-ID-Hash: DTXZQNUK7GNULLLUVC2QRIDRR32VRIB6
X-Mailman-Approved-At: Thu, 13 Jul 2023 08:06:23 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DTXZQNUK7GNULLLUVC2QRIDRR32VRIB6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 7/13/23 10:03, Takashi Iwai wrote:
> On Wed, 12 Jul 2023 21:13:25 +0200,
> Ivan Orlov wrote:
>>
>> Extend 'pcmtest' virtual driver with 'open' callback error injection
>> functionality, as it already can inject errors into other PCM callbacks.
>>
>> Fix the driver to use already defined variables where it is possible.
>>
>> Additionally, decrease the buffer filling overhead with conditional
>> reminder calculation in the 'inc_buf_pos' inline function.
>>
>> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
> 
> Please avoid mixing different changes in a single patch.
> 
> This patch does three completely different things, and they should be
> split.
> 
> - New inject_open_err parameter
> - Optimization of inc_buf_pos()
> - Optimization of check_buf_block_ni() and fill_block_pattern_n()
> 
> The latter two could be put in a single patch as minor optimizations,
> but the introduction of a new option doesn't fit with the rest.
> 
> 
> thanks,
> 
> Takashi

Hi Takashi,

Thank you for the review. I'll split the patch and send the changes again.

Kind regards,
Ivan Orlov
