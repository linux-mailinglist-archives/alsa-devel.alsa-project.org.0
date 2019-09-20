Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BE2B99DA
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Sep 2019 00:53:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 664B31677;
	Sat, 21 Sep 2019 00:52:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 664B31677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569020024;
	bh=yyGw5yPGENl/v2jVZ6XYfiI1QlGevdFW+tSyVUYuEm0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dOwXNs5j+fWtJWvl0qFlkHrYeFnCPP2BD+8elOrW1DrUCX8MOtCzpG3gr9V7on7rN
	 wHn5lLGPCUg3hq9UIThwIDDqqmBeLqeWOaLCKT00CgY5zDlidjRnUmOI7UfT3y4P1c
	 IvRQiDccy23DDj4Xf0FQ2x9Hf20UqL1oqWFH+bzY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B64A8F80506;
	Sat, 21 Sep 2019 00:51:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86714F80506; Sat, 21 Sep 2019 00:51:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 379C8F800C7
 for <alsa-devel@alsa-project.org>; Sat, 21 Sep 2019 00:51:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 379C8F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XxpsH7YC"
Received: by mail-pl1-x642.google.com with SMTP id e5so3853153pls.9
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 15:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0P3XLXQhDOk6yT8L9UZqipY6hQ6gvzDoPp4owKec9vk=;
 b=XxpsH7YCa/PUyweMsFxZ83TPOyD0WUZjPit3c8pITmQgtwko6irwDaxc9pADFQztvC
 4U90FTq1tsr90gbU3BH0dXMjgwrxN9irMCPTc5p97PU3oec9/cqWzdg6C2yhY/HsfNln
 aScdV6JxcUYSWR5y5Hv9upvbjhCmXfYVsD9tu4NY5ITzk7+s1hqedARflggKmV1Dur7v
 fiOu8/6RUGHJEhmjdorBPStTRSD4Ln8RO9iV39xPXYgVi3HpcU5c3nwZPcYP/tfnsq7x
 oh49U2WdVkdA819mAvnTSbQQg3Gu+tax53st1QAbHmpdvq4sxTse2UtHV/IylCvTkm9n
 Q3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0P3XLXQhDOk6yT8L9UZqipY6hQ6gvzDoPp4owKec9vk=;
 b=pQHuHqbQOpBmB9VMbYAyxiWD2HejJ/MYbTxPMPc6YGM44yoM/EM2ihK7oGlzLR+lbB
 KSvw5BjluGhmPB4BGeRuvqkT2yJXJirp656w7RjGt13NaxS1NuXhkpVyUbZjox1ePeGA
 C5nu/0UrxlwFtJDznUI3UYMdUs5wOu/tR+7Sv6R8zIcksTHdn/iy3SFKimJ8FQYhk7SL
 MOS7R90qjW6K7Q/CcYFmypmbFhPFhG8GRHAehpGSywE9l17oRl249iNXLZ2PzLIdGj/z
 RgPJg9s+eh95p+45R2eJ7mp89OxxfQv/QpjtJlVt6/+Coyx2YLlx02uEUxXBjMQh1TaQ
 5dLA==
X-Gm-Message-State: APjAAAUOYb3RXA9cHWDzgPAvzfwNsdhlDVmIxipodDXLNdHJ1tEgDvf4
 U3VCq+GHktNDN+GeVeB65is=
X-Google-Smtp-Source: APXvYqxuXYaN7Iqu31wZ7eEfynHGlkievoHDsqLPDXtQ855SljuXpLCmyBe3bDgUiLJ0h23ehjlQAQ==
X-Received: by 2002:a17:902:fe91:: with SMTP id
 x17mr19665279plm.106.1569019907795; 
 Fri, 20 Sep 2019 15:51:47 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id g24sm2039646pfi.81.2019.09.20.15.51.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 20 Sep 2019 15:51:47 -0700 (PDT)
Date: Fri, 20 Sep 2019 15:50:58 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Message-ID: <20190920225055.GB21389@Asurada-Nvidia.nvidia.com>
References: <cover.1568861098.git.shengjiu.wang@nxp.com>
 <57e3bda7b94fecf94d17f2eacf1c6beebcac74ff.1568861098.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <57e3bda7b94fecf94d17f2eacf1c6beebcac74ff.1568861098.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, lars@metafoo.de, timur@kernel.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 festevam@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH V3 3/4] ASoC: pcm_dmaengine: Extract
 snd_dmaengine_pcm_refine_runtime_hwparams
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

On Thu, Sep 19, 2019 at 08:11:41PM +0800, Shengjiu Wang wrote:
> When set the runtime hardware parameters, we may need to query
> the capability of DMA to complete the parameters.
> 
> This patch is to Extract this operation from
> dmaengine_pcm_set_runtime_hwparams function to a separate function
> snd_dmaengine_pcm_refine_runtime_hwparams, that other components
> which need this feature can call this function.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

> @@ -145,58 +140,15 @@ static int dmaengine_pcm_set_runtime_hwparams(struct snd_pcm_substream *substrea

> +	ret = snd_dmaengine_pcm_refine_runtime_hwparams(substream,
> +							dma_data,
> +							&hw,
> +							chan);
> +	if (ret)
> +		return ret;
>  
>  	return snd_soc_set_runtime_hwparams(substream, &hw);
> +
> }

Just a nit, why add a line here? :)

The rest looks good to me, not sure whether the name "refine"
would be the best one though, would like to wait for opinions
from others.

Thanks
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
