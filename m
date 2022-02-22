Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 862A34BF81F
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 13:39:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 154C61878;
	Tue, 22 Feb 2022 13:39:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 154C61878
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645533597;
	bh=QZA0v7+pw5DrN+aVhKvsRHC7vxl6Fpt/oJfkD3X7i9o=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jeX429Rth1M+Za/dSZca+z8nWkvDPmOTwUD67p9fWR89C3V8jShHm4Pj/BxOA9DJ7
	 Jd5b/SfLYNkhSKII7xbJ1IoZctGeqx5OOR3Hqmb9qCYhxelx8SCdrZDUOYHvVvtxcE
	 lRemdjx8evuh8TrBug9qKbrQoxdYiZeo/XRTkP5k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79097F801F5;
	Tue, 22 Feb 2022 13:38:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F261F80118; Tue, 22 Feb 2022 13:38:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49050F800D1
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 13:38:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49050F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="E1cyq17L"
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 958E53FC9E
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 12:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645533517;
 bh=tCoZe2yzRkWx7YBNb8KVNP+e9eczVEpZUbOGuRodh+c=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=E1cyq17LN9Gbq6HFbjl0wlrrZ9GSSuV/g8M6d/YVuyFCKEhfS6oIxkqJN1kC2Dprh
 IWzirtTidad3oZnB8EtGIR3E+FDBQGlC1zvq++jTfDpZyDyXyy1dHFd/UKtqA6BH5j
 J9vGSWRMojzrRMw0t5g+xn0EGF/aumJDG13d4wYe0xLheVSv05isf8Rp+AcQkNynWH
 K4y7J0GdmyMKMg22ELXjOM/WUXL7YFlpoVPiczVq9jTOD4of5mwqu9hi4rn+wytFk/
 63EiCxe7nBHc3qcZX/Yg/iewFpIvx69bXw9yMVYd8hBNFk4Z7lqrdy05LtsJeb2qep
 rHUF7uWpjWlIA==
Received: by mail-ej1-f71.google.com with SMTP id
 i20-20020a17090671d400b006d0ed9c68c1so2436648ejk.14
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 04:38:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tCoZe2yzRkWx7YBNb8KVNP+e9eczVEpZUbOGuRodh+c=;
 b=RFn/3LWLir0AjF73w8jso+5gJm3yRs4XOhpjnCHhG2Eq1saMNQuyFEQ7cgsglaIPeY
 V9aPplADOUTE+Rsz3A2Sj3kwtxavQXA5cOYoPGQJ1D0nL8yJTvechm5ubuhs3x7AFvHj
 npZcs0JrAGE+oxAeDJkVW3QypIGYsK7Cnq6JtOWqvUToYFIk1xO8Xq3eNSHYa8AwsJoq
 fzFNAQa3kDRIyVW4CUeKwHdstpeC6y5Mkhel5EpUBpNZaOhRUCr6EAvXidd4gXFWPIwC
 DzNNNNVDeCKKzJr0sQWJ2Etzf6EO6ARgxX7Jcam17F+GpzLBmadFSW+C0jeUXVV2FDsE
 WVVQ==
X-Gm-Message-State: AOAM532IS9r9ms/4ZquxeXKBnmoR5PwHQ+WhRKBivwlOJCJGSa55DpNw
 XMIlFLQeW++o69ZbFuaN4A1zFqSF6MystGkyTdaXHFZKDga9P5rd65ZOu270isa4vONIcYRFoF+
 lwkfwfXj96dCnhPNmUwvJBwuRgoLMDmHHzsuhio0x
X-Received: by 2002:a50:f159:0:b0:411:29b9:1323 with SMTP id
 z25-20020a50f159000000b0041129b91323mr25718216edl.258.1645533517380; 
 Tue, 22 Feb 2022 04:38:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZVSJL6nHxnMssJcXHLs+QBrBhBgOHNGm9aPdXJN3nivIczMccX7Nia80GPAGsF7xhGVVojg==
X-Received: by 2002:a50:f159:0:b0:411:29b9:1323 with SMTP id
 z25-20020a50f159000000b0041129b91323mr25718207edl.258.1645533517239; 
 Tue, 22 Feb 2022 04:38:37 -0800 (PST)
Received: from [192.168.0.124] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id s11sm6401498edt.10.2022.02.22.04.38.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 04:38:36 -0800 (PST)
Message-ID: <83aa53cb-e444-9397-96d2-eaeb92db6492@canonical.com>
Date: Tue, 22 Feb 2022 13:38:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ASoC: samsung: i2s: check the return value of kstrdup()
Content-Language: en-US
To: xkernel.wang@foxmail.com, tiwai@suse.com, perex@perex.cz
References: <tencent_5F9F4223DC44A9ECBF02649AF934F786E305@qq.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <tencent_5F9F4223DC44A9ECBF02649AF934F786E305@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On 22/02/2022 12:53, xkernel.wang@foxmail.com wrote:
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
> 
> kstrdup() is a memory allocation function which can return NULL when
> some internal memory errors happen. It is better to check the return
> value of it to catch the error in time.
> 
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
> ---
>  sound/soc/samsung/i2s.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
