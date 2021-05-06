Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B21374DC8
	for <lists+alsa-devel@lfdr.de>; Thu,  6 May 2021 05:01:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 785121689;
	Thu,  6 May 2021 05:00:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 785121689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620270090;
	bh=LadbsRSL6mLDbH/hccqxpIlq+q6xPi8/f0rCOFVVJOU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ppWJK5F2+bW1XDyC80cAiOM5BcognDjKFckS2XRvwsLtdfXEb1kgC4IozGgpGcrMA
	 VYRkZMKUv3ZZa7pNGLXKMThbVaslfINfIsFj+Rdj7lIU73yGXKzMxerZfWmlsASy6N
	 LCi4jL0IBo5JpDTZW/D9FDhDLSnWREVK7EDtw6tc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5384AF8021C;
	Thu,  6 May 2021 05:00:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53DB5F8021C; Thu,  6 May 2021 04:59:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84877F80139
 for <alsa-devel@alsa-project.org>; Thu,  6 May 2021 04:59:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84877F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bV0lkOJU"
Received: by mail-qk1-x733.google.com with SMTP id o5so3753458qkb.0
 for <alsa-devel@alsa-project.org>; Wed, 05 May 2021 19:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5nU1vgirtCThHvyYn1ZRBNMbOfWAmoUamSH+LcH56a8=;
 b=bV0lkOJUu5s4BbJ6rOBiItcFnuvbF+pPAhICL7Ag0S8hMCilMdMA4h1XNFzN990UGg
 DXxyd2rDycv94LpUuP9K+XIGsdJ1jE+FBVWhinoriPc6FS1PJXhNiJa+KmYAtD0QNcox
 YLOG2tCqtb7TWLtLkt8HjH2rDcpiHVLukewopVAnLSow3YvNLj2nBXP7VkfM7YxKtGOw
 mhiFBao0G/SVg/yiavea5HiyXhCvruWpuNQvaMkzX0uhfbHillZsPq/yeJ3D8BNUfmB2
 y0L8qmXCaTVRTsv6ycs+qIsaDYZKvFy8If6GsPAX7q5kidOzd2hB/HHRbPHw1h8BHqEm
 h7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5nU1vgirtCThHvyYn1ZRBNMbOfWAmoUamSH+LcH56a8=;
 b=FUAXPBWCpHROPG8XYkZeHeIqjmSedJqhvzV8SZXC/okt0mw8QhOieZnurVduYx6l4/
 UxGVAzi1i4CkJptL5Hek/LRaelPCIKSIm6oTmWAFxFjhyfsqPCoWRQFw3X6Zk3BkzmiT
 o7T8vUkHY9+RyJn911xWMI3bSynfXc2/jFaGsue7TgH6c+qvow58uCTm42csKIfCCwSZ
 MisSEsnuLUzaO548/l5/W1xfydrW+Nj93orgb7LGKitInJaoT6/+PejoEBlP4VAgFgHL
 yW/GPkNjUrrtuf0WdTIvVl5xvadriziFTLMpnIKX8U+Bzv0092jI3noI+Yo4Bw8Y+DuA
 nYrA==
X-Gm-Message-State: AOAM533/yA5spVLaGofJPhZrnRRTXEi+W91Dy8SJhjelzyjl5AzGFBn7
 V7QW+AQtQtJB0ZKMI0FVf8egP498WOycc6rZh9U=
X-Google-Smtp-Source: ABdhPJzDff6nOz49nsVXQ8WHxc36EDEAfLfOpn0EAONrS6s8pZ5dBpXMkQjbHpcdA6HIl/tZ0mtx4etMgnd41dZYB7w=
X-Received: by 2002:a05:620a:2903:: with SMTP id
 m3mr1886281qkp.37.1620269986820; 
 Wed, 05 May 2021 19:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210506022452.5762-1-wanjiabing@vivo.com>
In-Reply-To: <20210506022452.5762-1-wanjiabing@vivo.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 6 May 2021 10:59:35 +0800
Message-ID: <CAA+D8AOLyjnjD2gc=a20zYCfJp1EoJ9En4Q9JQXR5qbV9Mpzyg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: Remove unneeded semicolon
To: Wan Jiabing <wanjiabing@vivo.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 kael_w@yeah.net, Fabio Estevam <festevam@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Thu, May 6, 2021 at 10:26 AM Wan Jiabing <wanjiabing@vivo.com> wrote:
>
> Fix the following coccicheck warning:
>
> ./sound/soc/fsl/fsl_xcvr.c:739:2-3: Unneeded semicolon
>
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

> ---
>  sound/soc/fsl/fsl_xcvr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
> index 6cb558165848..df7c189d97dd 100644
> --- a/sound/soc/fsl/fsl_xcvr.c
> +++ b/sound/soc/fsl/fsl_xcvr.c
> @@ -736,7 +736,7 @@ static int fsl_xcvr_load_firmware(struct fsl_xcvr *xcvr)
>                         /* clean current page, including data memory */
>                         memset_io(xcvr->ram_addr, 0, size);
>                 }
> -       };
> +       }
>
>  err_firmware:
>         release_firmware(fw);
> --
> 2.25.1
>
