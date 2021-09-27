Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C37234191E4
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 11:58:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B58D1669;
	Mon, 27 Sep 2021 11:57:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B58D1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632736699;
	bh=25tDaDzE9sWlT9iRpMr1Kj6KzEu3aHuc09EZbSQevPw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HaO7xndflJMQcBzvk9VFYe0RH1K8PTcAkwNFOBnTXUmU42IVLZzDI3Wu9kKV5kip8
	 LBk2rWbtpghH+zxWgEh0RLxIXZJe+quSHr7WUfoNUrGbh2nbntCKmxbs3WnCq8bAz5
	 k2CRSPBzBGPqUYkQA+ezJc+YlP0wMujiLhqwlahI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E658CF801F7;
	Mon, 27 Sep 2021 11:57:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB139F80227; Mon, 27 Sep 2021 11:57:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09A7EF801EC
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 11:56:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09A7EF801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="P8IksPXW"
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4EF2540833
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 09:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632736610;
 bh=8izaMMzdZFyOj97+0PH0WvhjiKv4VMQW7lnH7kNs5mE=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=P8IksPXWNPx7+KgWU7P8ObsC8raaz6/3+4uTi8oVC8IblUuB5FBJIiNisQMpmj52U
 6Ei6HGl46pIwyZJP15h68wiW/oUq1bn44dyNFBcYv/9vBogR54cHHX6D8enECxPytF
 Q84ORN7L0tf10h1SqrALz1aSuDAW+FP9065O18pKofMCRo0Y7ILeGVfT/QCUYa3Bjz
 vacyRBvZASZNPrIJPf7+aHHYtC0j7JciotFu4KXvHzXT5vyVc5VE4oITFQT45ozL4j
 PfkCO2CIh260950rzHyE92rx9YVP+cYTgodl0O6AvPXbFFqfLAua7h7Gv6FjTBA1ql
 a2Yu9QFEqjnxQ==
Received: by mail-lf1-f71.google.com with SMTP id
 h27-20020a0565123c9b00b003fca9e11144so14175358lfv.19
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 02:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8izaMMzdZFyOj97+0PH0WvhjiKv4VMQW7lnH7kNs5mE=;
 b=nelyhSONalNCSD16DUOnIEdnqGhRqGGAcpNIo4smxNt8OHaEYAJ1gTupZhCyWyD+7z
 Ai0U+e643VLJnqu79zUO7ziUns3M3dOv5GRdICO7ejySqJm/TWhHHhSR3er4vCESP7g+
 T2VAUwMbxGrTRt/rEyiRkxrNnU2Vpn9eqYZS3ASbGCNN0Hw+ZD27oceL/gGLSrN2QIQ5
 +t/WAOzkVu/CmksIIYeqYTAUZtcipCevvmyczZ7oV7UapcmxVt2Ipc3jZuZlcmAx7WYB
 g5xiEOaVaKn+7uw0xoEMdmZTysklxzaoiIOcYzNvLWc9PxzFHTES7MWs+jRHTvHC3/ue
 YCfA==
X-Gm-Message-State: AOAM530WgjnDyy0SMtIUl+HDXTOG0qKY8LQCWM7+26EEcEqfaG02Jsq4
 hhpPz7tXCG88onaWMbjCyMtbcZARuZfGZd2sxi3VgUtvIws+oJTfCn6ND35s/J2ShJEfUGJtV4a
 4GoaYpwg22oonHlkLfvVApQQwboGyv9OSS9TXVJIv
X-Received: by 2002:a05:651c:21b:: with SMTP id
 y27mr27717115ljn.489.1632736609657; 
 Mon, 27 Sep 2021 02:56:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsalFADlVVVTu6/XTNSAKB3HNcwAnUH9lAMPjtuA1GXtlKiHFEQOe/tRpUNI0FkSI2EPyMRA==
X-Received: by 2002:a05:651c:21b:: with SMTP id
 y27mr27717103ljn.489.1632736609508; 
 Mon, 27 Sep 2021 02:56:49 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id a7sm1078846ljp.21.2021.09.27.02.56.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 02:56:49 -0700 (PDT)
Subject: Re: [PATCH] ASoC: samsung: add missing "fallthrough;"
To: Arnd Bergmann <arnd@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20210927095449.1070639-1-arnd@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <bb24d3b0-aa8f-3649-1837-3b8f43ef7e0f@canonical.com>
Date: Mon, 27 Sep 2021 11:56:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210927095449.1070639-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>
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

On 27/09/2021 11:54, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> With gcc, we get a warning in this file:
> 
> In file included from include/linux/io.h:13,
>                  from sound/soc/samsung/s3c-i2s-v2.c:16:
> sound/soc/samsung/s3c-i2s-v2.c: In function 's3c2412_i2s_trigger':
> arch/arm/include/asm/io.h:92:22: error: this statement may fall through [-Werror=implicit-fallthrough=]
>  #define __raw_writel __raw_writel
>                       ^
> arch/arm/include/asm/io.h:299:29: note: in expansion of macro '__raw_writel'
>  #define writel_relaxed(v,c) __raw_writel((__force u32) cpu_to_le32(v),c)
>                              ^~~~~~~~~~~~
> arch/arm/include/asm/io.h:307:36: note: in expansion of macro 'writel_relaxed'
>  #define writel(v,c)  ({ __iowmb(); writel_relaxed(v,c); })
>                                     ^~~~~~~~~~~~~~
> sound/soc/samsung/s3c-i2s-v2.c:398:3: note: in expansion of macro 'writel'
>    writel(0x0, i2s->regs + S3C2412_IISFIC);
>    ^~~~~~
> sound/soc/samsung/s3c-i2s-v2.c:400:2: note: here
>   case SNDRV_PCM_TRIGGER_RESUME:
>   ^~~~
> 
> From all I can tell, this was indeed meant to fall through, so
> add "fallthrough;" statement to avoid the warning.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  sound/soc/samsung/s3c-i2s-v2.c | 2 ++
>  1 file changed, 2 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
