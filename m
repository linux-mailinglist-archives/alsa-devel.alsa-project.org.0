Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34121305717
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jan 2021 10:38:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2C98173B;
	Wed, 27 Jan 2021 10:37:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2C98173B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611740321;
	bh=R/uQlTWNdG+k5h7Ft75S1o4rsHb6qVg74kw0wovuzgs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AnkXm6LiS07wbLdxbhNTIWo204OeAhgl1ufwQwBynLk1dBr7zcj420EpxTNBpMMdf
	 h80XozU1xWQ/tTKOEGpyJEAKqYv6owbcGk9sbUrJXzpAfetAszkG1IWiBfryO8Q+4f
	 jZU7t+DUYBQU0Nbi8/8yDcFiw0TeCS07Xv5jWbag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 051C6F8025F;
	Wed, 27 Jan 2021 10:37:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A065F8011C; Wed, 27 Jan 2021 10:37:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28641F8011C
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 10:36:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28641F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="EZMOnKt9"
Received: by mail-wr1-x434.google.com with SMTP id q7so1135551wre.13
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 01:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n/kqykwF7WfGWy8Z+fXVcbnHREVmYPsyHz1xe2yNwDQ=;
 b=EZMOnKt9rg8lQfG/fBb5x3uePsX9SmkzZh6wKBRVBtIhmRum3HhO6rZxr1F1X6kkZp
 DPz7Y42p7XA3wmho91Jyj2d213k7JCizlCbVYXNNF2X39UgzYQQrCqENmAW0Xfdk3yrR
 45/tO91tsGtXFX8qPRtdipo8e2pwk5pLwu+pwS7P3rgwrvoF1eBkkHFTLST/k33nE7y7
 OoWbQGZ3n1B9nRcTURp23P9s+78Zcm6NTg0eMrAYmRBHEhaKyTBeVq2FuDuK1o3Pof0T
 U/R45Urz/3RCKYzM07fjwZOy30INIo7Ae1eiIsr9sz6kQJFeCZnOvSuF2mz/mHhh0UNg
 sr7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n/kqykwF7WfGWy8Z+fXVcbnHREVmYPsyHz1xe2yNwDQ=;
 b=OlKKbDbE2Sp/xvOhCBz7dyrWsIZ864lFwUEo3/D9diNKLlg79kSph7jYW/ap4gi3Fo
 SPI9PoWvZ3mXCcPevz9WZqdRCkJEjP9vTcVBIB5zOF+o/FyKiOQ9eweNeCyPWGAzcVi2
 FKVLLzHFoUSibqO8g4Y/NjzVhZ0u/psS0ZhnHVRrF3wLlbavzTNnFLsMmf7hanst1RBi
 6ZeYneYaWPG8V5CeiHOyXKN1XP0alqVGPHgy9+KuwqPZc5BzGVDMOxZNk0GXs/xd+Z0U
 jwkyuLq3T/t/spuW1bmEQgwtizpVZTMsCkjv8Zwz5YIMIbVFQ+wCyWC/300cY97MDkBG
 TCmQ==
X-Gm-Message-State: AOAM533mMnkfy61MDK8pSwk0ti/3Yvff7bu5vE4mqlQKAzMKL7g+wPXP
 h23yN1t2H3UKVN70Ye6j9+TLe3bulaLMuw==
X-Google-Smtp-Source: ABdhPJyQymyDfw2jMfBsC/3QW7n9om+8aKwy8TCre/W6+8tjUs32iPIAki/0Xoegxd62NRmRLxX3Pw==
X-Received: by 2002:a5d:6511:: with SMTP id x17mr10425311wru.313.1611740216082; 
 Wed, 27 Jan 2021 01:36:56 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id f189sm1905555wmf.45.2021.01.27.01.36.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 Jan 2021 01:36:55 -0800 (PST)
Subject: Re: [PATCH] ASoC: q6asm: fix 'physical' typos
To: Bjorn Helgaas <helgaas@kernel.org>, Patrick Lai <plai@codeaurora.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20210126212023.2921168-1-helgaas@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <622e17cc-9770-8fe4-4ac2-750ed71270b9@linaro.org>
Date: Wed, 27 Jan 2021 09:36:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210126212023.2921168-1-helgaas@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Bjorn Helgaas <bhelgaas@google.com>, alsa-devel@alsa-project.org
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



On 26/01/2021 21:20, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> Fix misspellings of "physical".
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>   sound/soc/qcom/qdsp6/q6asm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
> index a6618efe22f2..36bf8bd4edd7 100644
> --- a/sound/soc/qcom/qdsp6/q6asm.c
> +++ b/sound/soc/qcom/qdsp6/q6asm.c
> @@ -491,7 +491,7 @@ static int __q6asm_memory_map_regions(struct audio_client *ac, int dir,
>    *
>    * @dir: direction of audio stream
>    * @ac: audio client instanace
> - * @phys: physcial address that needs mapping.
> + * @phys: physical address that needs mapping.
>    * @period_sz: audio period size
>    * @periods: number of periods
>    *
> 
