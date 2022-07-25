Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B745805A8
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jul 2022 22:31:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0FE01E2;
	Mon, 25 Jul 2022 22:30:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0FE01E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658781100;
	bh=TI10duyRXIrEi88p/99wdhJruXWwJmi7GlWtfLG7ApE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f5gozW1q1rK760R4kKmITd2rXfp0w4VlgPlP5IrG8np2Nkd2le2TAmDIjbR6M9AFs
	 kloC+Pa+tG5QxYOby6sfRtFfPFbJEKl/l2ZlpQhlpzrYg7YymQPTZI9qnPIW6FpeM0
	 TGYgpKOpx7TF4NMVkbIrmswFQxU0zQFOtJQhemRg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25380F80212;
	Mon, 25 Jul 2022 22:30:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CFD6F80163; Mon, 25 Jul 2022 22:30:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SCC_BODY_URI_ONLY,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7374FF80088
 for <alsa-devel@alsa-project.org>; Mon, 25 Jul 2022 22:30:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7374FF80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="ZuVBkM87"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658781032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XR/XGl5d+vD331sf91Cdt4PhYy4RnDiWcXKqjqi8ODs=;
 b=ZuVBkM87FFykPm+R3alPR2NULAqXz3yWtCmRMhRBLpGoy/xT0BeTIvxP3uS7I02sQuQYUE
 TO5QYLcP3OEUCosjlRX91f9WI7mk2Z1gjZEek1PGA70PrTJhel6u2BT8ewphGOMKxaqv9K
 JZ2vthHRzO6pBDWTuh6Ww5+rUzN22So=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48--c29X8tqN0SYsDnl8Sg3TQ-1; Mon, 25 Jul 2022 16:30:31 -0400
X-MC-Unique: -c29X8tqN0SYsDnl8Sg3TQ-1
Received: by mail-oo1-f72.google.com with SMTP id
 f9-20020a4a8309000000b0042dfddae1d9so914458oog.3
 for <alsa-devel@alsa-project.org>; Mon, 25 Jul 2022 13:30:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=XR/XGl5d+vD331sf91Cdt4PhYy4RnDiWcXKqjqi8ODs=;
 b=ZerSI8XVNAQBY9qYjzR9woqESieqWoZ0uOabQ+0s/UUW4G+FSX5KnxnEqJRe8WIPvR
 xbMFP4RlXN6wSYMEx4Vr+tfr7FsoXbmJ6Jlzznr/eliSan5602Qy1++MT1JR5ikuYdKN
 ThIj/MtiapixJmACxE+q1qlW3tchvmAq5LxrsYv3i7HYvXt0o4x0wKHRvkQZIKGBcaWw
 3T34WvTaV9VmgIiLVvp8KVccwOi6ObbbUQylRdNZE5s3KxdvoZNjTvI/FRHgppnZSl+J
 qL0FpMeTlIKe1WViSRMxvoHp+apaAliw/05j2UEFsr6Yl3OwOdVmOMBj+t3M6WjSRwLD
 io/Q==
X-Gm-Message-State: AJIora/Jmn8sn9xiy5eCF0MzSPS+CI88qZWDgf6AqxeW34Gup93AN/3O
 sKzv134bKSewUF3vx1v7hqMjolx801MoRrrAcHr9MrZVB4dqqRgBfhtSW+ZpLtKyGPHxtqSVH4a
 ORBO4zHFGzdYAPbYoZgNvJCw=
X-Received: by 2002:a05:6870:f222:b0:10b:7326:18c2 with SMTP id
 t34-20020a056870f22200b0010b732618c2mr14678588oao.55.1658781030627; 
 Mon, 25 Jul 2022 13:30:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vMKdLBsCrpyPFiMwp1I36On67rQNmu7kKIT17kKg4MZ0q/jXm/7VX99Y0AfExWzkcNf7gWrA==
X-Received: by 2002:a05:6870:f222:b0:10b:7326:18c2 with SMTP id
 t34-20020a056870f22200b0010b732618c2mr14678576oao.55.1658781030337; 
 Mon, 25 Jul 2022 13:30:30 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com.
 [24.205.208.113]) by smtp.gmail.com with ESMTPSA id
 o31-20020a056870911f00b0010c7487aa73sm6507887oae.50.2022.07.25.13.30.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 13:30:29 -0700 (PDT)
Subject: Re: [PATCH] ASoC: amd: acp: Fix initialization of ext_intr_stat1 in
 i2s_irq_handler()
To: Nathan Chancellor <nathan@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20220725180539.1315066-1-nathan@kernel.org>
From: Tom Rix <trix@redhat.com>
Message-ID: <fd7188f2-8e42-3683-0ef5-2ddde56b3efc@redhat.com>
Date: Mon, 25 Jul 2022 13:30:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220725180539.1315066-1-nathan@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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


On 7/25/22 11:05 AM, Nathan Chancellor wrote:
> Clang warns:
>
>    ../sound/soc/amd/acp/acp-platform.c:117:19: error: variable 'ext_intr_stat1' is uninitialized when used here [-Werror,-Wuninitialized]
>                            if (stream && (ext_intr_stat1 & stream->irq_bit)) {
>                                           ^~~~~~~~~~~~~~
>    ../sound/soc/amd/acp/acp-platform.c:97:35: note: initialize the variable 'ext_intr_stat1' to silence this warning
>            u32 ext_intr_stat, ext_intr_stat1, i;
>                                             ^
>                                              = 0
>    1 error generated.
>
> The variable was not properly renamed, correct it to resolve the
> warning.
>
> Fixes: 93f53881473c ("ASoC: amd: acp: Modify local variables name to generic")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1675
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Tom Rix <trix@redhat.com>
> ---
>   sound/soc/amd/acp/acp-platform.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
> index 10730d33c3b0..f561d39b33e2 100644
> --- a/sound/soc/amd/acp/acp-platform.c
> +++ b/sound/soc/amd/acp/acp-platform.c
> @@ -100,7 +100,7 @@ static irqreturn_t i2s_irq_handler(int irq, void *data)
>   		return IRQ_NONE;
>   
>   	if (adata->rsrc->no_of_ctrls == 2)
> -		ext_intr_stat = readl(ACP_EXTERNAL_INTR_STAT(adata, (rsrc->irqp_used - 1)));
> +		ext_intr_stat1 = readl(ACP_EXTERNAL_INTR_STAT(adata, (rsrc->irqp_used - 1)));
>   
>   	ext_intr_stat = readl(ACP_EXTERNAL_INTR_STAT(adata, rsrc->irqp_used));
>   
>
> base-commit: be0aa8d4b0fcb4532bf7973141e911998ab39508

