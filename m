Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F872001C5
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jun 2020 07:51:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47655167E;
	Fri, 19 Jun 2020 07:51:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47655167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592545917;
	bh=Ffjriv1tNRJ7y8b/w+Kj+GicHWMU3A8EkpJaDGg/6Uk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t2FSkl+FlEyoc2alDxLXG4wDUvqLnMXJ/KYe4xKOr/moKgnUw0QPrGQrixrVK7CsI
	 pminTqKuCS/PrbZ3aLtXAckZyL6LDOCHusGBrZ2DuS29Rrur4Pb3IKn0Z9jKv4CjBt
	 E3NWpriNiocISuOs5kf8mI/Gqhe9efZfwA8a6c+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E2D6F800EF;
	Fri, 19 Jun 2020 07:50:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 111E7F80252; Fri, 19 Jun 2020 07:50:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B4DCF800EF
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 07:50:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B4DCF800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VLVq/MTQ"
Received: by mail-pj1-x1042.google.com with SMTP id ne5so3624502pjb.5
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 22:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=uJunhxgU/GhtFdUD98Pvml4aHtu/6+uQFMKPVljojZY=;
 b=VLVq/MTQU/NNg1KDEodPCc0dIVnRN0lPQnSff9+nrJhdE1v5B72E4p0G+nx7HDdROB
 TwUXIT0/yD8D0OJ+3VxMmx+8x23YbT8Wxj//0vsxG6/Pag1QcQlwYCEIhI9n09u4bPaF
 dR7NvqkQyN/C+6IU3hD6PN/CmCZsXNgwBR9NIg8ZJ8KWDhDpnNHqyBXnwffA9CRTJ8h3
 LbaWrqCCkrPlv1EKl5zAswa/WrO+a2HBU0tpoe5lafMudJGyYhwoW7Qw74dZ2u1El1yR
 Ab7eDkHYshROtUglv+eB0hoCm1UgWZDNEr1+xgIzG5oodweXDbRJ9G5zWb2M9ZPjnjxL
 3s8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uJunhxgU/GhtFdUD98Pvml4aHtu/6+uQFMKPVljojZY=;
 b=beNyTLl50fh9iMuy9qQpZAEBd9Ehx+BQqOobsaBFcKCTPvbW7HTThbGfpum7kdlc31
 zTPWYHPRYYnVbA9Vbj79wQxo2RWCMWdTpo56wnOt5DWoKCrPmDiRUTbHsFNSusqCJdu+
 O9VSnqrr4//ob46d4fIgqo9L6wpOYrmDNMaWH+nPcobblaSQxw/XiWXTVOh0Pcs1Yw0A
 qPhd40iPGUDHjroNjPuorVjDJZo8An3AO2nXtwJPAG2bW8yAKxo9Ewr28J7yqKWtMXTU
 BTRuEpwWwN2HYiMMGiVwo7UpwsDeapRcyuS3hcHWgv5j59nd3cvsiZgbSZDvalf6G6yw
 SfYQ==
X-Gm-Message-State: AOAM532smq5cwKE0jUZJdEzBROX+KTubQpRQioLVREs07ZMhyKAwag9z
 LY18L7n6psT+e9bl1aNaU/A=
X-Google-Smtp-Source: ABdhPJx9GYYwyzfa4Sv6g1ItpE1EMJ1VSw6RWycMP3Mmz6sGniIT+wDPwVV1zAwACzJLNVQELZuDEQ==
X-Received: by 2002:a17:90a:1a17:: with SMTP id
 23mr1880621pjk.231.1592545803758; 
 Thu, 18 Jun 2020 22:50:03 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id w17sm5028544pff.27.2020.06.18.22.50.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 18 Jun 2020 22:50:03 -0700 (PDT)
Date: Thu, 18 Jun 2020 22:49:43 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_spdif: Add pm runtime function
Message-ID: <20200619054942.GA25856@Asurada-Nvidia>
References: <1592481334-3680-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592481334-3680-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, broonie@kernel.org,
 festevam@gmail.com, linux-kernel@vger.kernel.org
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

On Thu, Jun 18, 2020 at 07:55:34PM +0800, Shengjiu Wang wrote:
> Add pm runtime support and move clock handling there.
> Close the clocks at suspend to reduce the power consumption.
> 
> fsl_spdif_suspend is replaced by pm_runtime_force_suspend.
> fsl_spdif_resume is replaced by pm_runtime_force_resume.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

LGTM, yet some nits, please add my ack after fixing:

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

> @@ -495,25 +496,10 @@ static int fsl_spdif_startup(struct snd_pcm_substream *substream,

>  
> -disable_txclk:
> -	for (i--; i >= 0; i--)
> -		clk_disable_unprepare(spdif_priv->txclk[i]);
>  err:
> -	if (!IS_ERR(spdif_priv->spbaclk))
> -		clk_disable_unprepare(spdif_priv->spbaclk);
> -err_spbaclk:
> -	clk_disable_unprepare(spdif_priv->coreclk);
> -
>  	return ret;

Only "return ret;" remains now. We could clean the goto away.

> -static int fsl_spdif_resume(struct device *dev)
> +static int fsl_spdif_runtime_resume(struct device *dev)

> +disable_rx_clk:
> +	clk_disable_unprepare(spdif_priv->rxclk);
> +disable_tx_clk:
> +disable_spba_clk:

Why have two duplicated ones? Could probably drop the 2nd one.
