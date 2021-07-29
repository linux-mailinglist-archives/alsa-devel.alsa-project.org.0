Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBF43D9DEC
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 09:00:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCEFD1F0C;
	Thu, 29 Jul 2021 08:59:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCEFD1F0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627542036;
	bh=uObYIhU8Tf2Ur2zYKp2t+zmVYmr8sDK1G8F7mKwwU8I=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JhzrjI4FZs9SedCoUx94kMIX4k2uxcl3viqFyA5JypyYHJo6XbaTMEXWe2+F/kq9w
	 rMvU6yJYanBIHlzXZ+lZa+FeX76sHCQkpAHe/6+ltfGKwQoQD7CoW/xy5FEyHGNH8b
	 B+/tUJRYJfs4dI5mGynYOtOfYbMRqhL1E09I/CFw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDAFCF8026C;
	Thu, 29 Jul 2021 08:59:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41DCDF80258; Thu, 29 Jul 2021 08:59:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A28A9F800EB
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 08:58:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A28A9F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="oUiRRPC2"
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 981EE3F107
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 06:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1627541936;
 bh=wgSGi39fr5nLY0RGz51HyBillidzyYTFsor+uOU3rSk=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=oUiRRPC2HQRy0W7PLdEBa0ImZHdSN8ieH1z6saHz+MmVbevMo2CCFIRBtrNWwKBGz
 895sGbn0cWTF/23+srUXsUPjooyjsAswbqAIsSR2gxJp4vhz3um0yyj8/g6Az92dCV
 ZnoWfx9xHCgeFhVLaV5/aGUOrRjA0YBoSf5pf1z38dc2L5OEdMmX8+XCjRpqLIk3du
 7CFRedQFTO0t6aFzF8TDlxO64g+wcu+iKS6BlzU9DHaZnPQGBgMCyAhjErEX1WxYkK
 Gx8gM4XMCpT0Gof7YKfk1T6Hp5mtKPJCaohPEAsZA/1thKe8GGah86NZ+xbIO/0b8z
 4T+qfDPZpI2Uw==
Received: by mail-ed1-f70.google.com with SMTP id
 c16-20020aa7d6100000b02903bc4c2a387bso2436033edr.21
 for <alsa-devel@alsa-project.org>; Wed, 28 Jul 2021 23:58:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wgSGi39fr5nLY0RGz51HyBillidzyYTFsor+uOU3rSk=;
 b=mI7l0Aotl+EmtlEXgCkPFIbUcL49Dgu/xWginvQUw8q8iOxlx+bcMOKaVpxnYMv05f
 no6m+IsaYSJFOnXjHqryQrfQ3tqUbhuHr1HSW+iJlwlKn958hNv7fTlrf6C8hX5Hp69n
 vIysrPWuZVHzI9EzAZi33GiUp7bShN+5/YsVDG1ymhrxJFeuKLBpCNOb8C+idGg2DGma
 aspgtIVKkzWIV4iD6fhN8/v2hE7zk8zHykVCbSfH9ZEsDj8cXtNKelHUW/3jr6tjxoAX
 TRu230fKRXBSJYK7xOVOmSI8nABKIXT9jk3nw5Yj8QlRyhBcKaaXMrDAh8slzUqBhKJD
 cENg==
X-Gm-Message-State: AOAM532sJPB6xxe+fbqqdiydLlxwpBKjJSqFc1AHjfZGDQkcuFzJguzU
 m/PYZerCcUzSYmg55C3SzNjvhbh0MFYHiHjAUaDhKOog0Dw7IGZIUjjEIVlpRaN35b8KVH8+q0r
 00Dxc3y2x4j3qz+yZiMqxE6tAEhQabdeyyFWrNsjq
X-Received: by 2002:a05:6402:289b:: with SMTP id
 eg27mr4469627edb.90.1627541936313; 
 Wed, 28 Jul 2021 23:58:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoaHmIDscS1JudoyHTTam6xSzSzbWI306CXe2m56uOvV912dNGIdzbln0GsnAeansSxYhDsg==
X-Received: by 2002:a05:6402:289b:: with SMTP id
 eg27mr4469618edb.90.1627541936176; 
 Wed, 28 Jul 2021 23:58:56 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.47.9])
 by smtp.gmail.com with ESMTPSA id e7sm627732ejt.80.2021.07.28.23.58.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 23:58:55 -0700 (PDT)
Subject: Re: [PATCH] ASoC: samsung: Constify static snd_soc_ops
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20210728172548.234943-1-rikard.falkeborn@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <f78b45f1-11e8-e1c3-3095-aca32de9fad1@canonical.com>
Date: Thu, 29 Jul 2021 08:58:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728172548.234943-1-rikard.falkeborn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

On 28/07/2021 19:25, Rikard Falkeborn wrote:
> These are only assigned to the ops field in the snd_soc_dai_link struct
> which is a pointer to const struct snd_soc_ops. Make them const to allow
> the compiler to put them in read-only memory.
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
> ---
>  sound/soc/samsung/aries_wm8994.c   | 2 +-
>  sound/soc/samsung/arndale.c        | 4 ++--
>  sound/soc/samsung/h1940_uda1380.c  | 2 +-
>  sound/soc/samsung/littlemill.c     | 2 +-
>  sound/soc/samsung/midas_wm1811.c   | 2 +-
>  sound/soc/samsung/neo1973_wm8753.c | 4 ++--
>  sound/soc/samsung/rx1950_uda1380.c | 2 +-
>  sound/soc/samsung/smartq_wm8987.c  | 2 +-
>  sound/soc/samsung/smdk_wm8580.c    | 2 +-
>  sound/soc/samsung/smdk_wm8994.c    | 2 +-
>  sound/soc/samsung/smdk_wm8994pcm.c | 2 +-
>  sound/soc/samsung/tm2_wm5110.c     | 6 +++---
>  sound/soc/samsung/tobermory.c      | 2 +-
>  13 files changed, 17 insertions(+), 17 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
