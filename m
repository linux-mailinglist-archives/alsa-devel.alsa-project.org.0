Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FF0D482B
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2019 21:04:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D91A1661;
	Fri, 11 Oct 2019 21:03:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D91A1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570820649;
	bh=atoJ+9b4aszoG1r+I3w9l58K9C88f42EpERGa4CQCkU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wov6LNJKl0TZuWlA4QvLaONJVUoG9fNMGNgZ1xtPpeUn4k4eIaB1Ngn8gUyrVFgD5
	 cgqBkveem88MDymmOEV88jRsPcljb7cITbTDdfPRcK6d4ji5S9xN7fK0K0gdVzf/sB
	 iw/b8FXpCch5fwRMRqzm4FUsSg0dIbVAcWmg82Vo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF922F80308;
	Fri, 11 Oct 2019 21:01:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EE4AF80323; Fri, 11 Oct 2019 21:01:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69210F8026F
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 21:01:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69210F8026F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GznRhmLr"
Received: by mail-pg1-x541.google.com with SMTP id i32so6293808pgl.10
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 12:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=snyWrZAMzq5lG4lRitPx2HIrUxhSjSwDEgHLW43m85M=;
 b=GznRhmLrbiSnSNMpKRKnZtnlVJUIMgZ5Igqj7k9gAh6/KvPPfvWFNm4bhCg1Mjmon4
 QWfPt7fCzGhhjewfN7/xsx1noFZf/yGyTuHATAyzBFFdqKhf3aUtwrWOl4/GAHGDz7wN
 m95NHX/mg+2ktdRy+xO5ADuqFShgN1Fh+GuTUMvkFeJ5230WGT1RQ6hHyY5er+XwKBVZ
 oHeE102rEFQdllfnccTjWkHAtgT3oTF5lt+iFboSsSp8ux7FNO64p0/Qbk/zDYcS8szC
 6edlryYvHz1TGfH/ZKKmM956bYuizF4DOVQLn9Vo9qfQo2AVRfqN/PYmw8aKHsj3gfOm
 SVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=snyWrZAMzq5lG4lRitPx2HIrUxhSjSwDEgHLW43m85M=;
 b=MLnRoyf/wTW/jPhmjfHHI/rFOet4nMF50ibWipG3Y6AvYN3Xoan3igowjs8FDmm7Q5
 Sp75AZSDlNzdJXNCpoSnxlrFCfXCiPdWyTMJDZZsufwAN2fMnYuKVTFcNpzIb4nEpNHw
 KKxDL3UdpD72Z2xGFRl5Aw6Fh5I6PyyWFgmcfpdHkYy3l/ngBgqDkqqysHo/UetdlKIf
 sDh8DtjzXPGhhMEYGJHZmZKglNWPXzr2jNb9YPy6Vk4GtpB9RSQTIBIf5TaJQxXp8HF4
 VXArx0eRPpuP2AZyVE28DbXM7jY9n8Tcn/Cc37RKRIba7OxMXiiVxmJmfqV5tepTxxd0
 u41g==
X-Gm-Message-State: APjAAAXhnncwcQWk/+ywJUvP8D1pSZ/27T4E33EiWAdrJVATo6tBlXA+
 LLJ3Tq3w92bwT5YjX6Q2NAs=
X-Google-Smtp-Source: APXvYqyNO2jGjTM35Zx7/wYo2IA/ONK6kVXQIM80NOoaCi6xPGZ50ucYajK+oHsuTMe+0WILniPrqg==
X-Received: by 2002:a17:90a:2ec1:: with SMTP id
 h1mr19140199pjs.96.1570820506438; 
 Fri, 11 Oct 2019 12:01:46 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id q13sm11663683pfn.150.2019.10.11.12.01.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 11 Oct 2019 12:01:45 -0700 (PDT)
Date: Fri, 11 Oct 2019 12:01:06 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: YueHaibing <yuehaibing@huawei.com>
Message-ID: <20191011190105.GA18114@Asurada-Nvidia.nvidia.com>
References: <20191011105606.19428-1-yuehaibing@huawei.com>
 <20191011143538.15300-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011143538.15300-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 -next] ASoC: fsl_mqs: Move static
 keyword to the front of declarations
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Oct 11, 2019 at 10:35:38PM +0800, YueHaibing wrote:
> gcc warn about this:
> 
> sound/soc/fsl/fsl_mqs.c:146:1: warning:
>  static is not at beginning of declaration [-Wold-style-declaration]
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

> ---
> v2: Fix patch title
> ---
>  sound/soc/fsl/fsl_mqs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
> index f7fc44e..0c813a4 100644
> --- a/sound/soc/fsl/fsl_mqs.c
> +++ b/sound/soc/fsl/fsl_mqs.c
> @@ -143,7 +143,7 @@ static void fsl_mqs_shutdown(struct snd_pcm_substream *substream,
>  				   MQS_EN_MASK, 0);
>  }
>  
> -const static struct snd_soc_component_driver soc_codec_fsl_mqs = {
> +static const struct snd_soc_component_driver soc_codec_fsl_mqs = {
>  	.idle_bias_on = 1,
>  	.non_legacy_dai_naming	= 1,
>  };
> -- 
> 2.7.4
> 
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
