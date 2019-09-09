Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 439B7ADFEB
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2019 22:27:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD6EE166B;
	Mon,  9 Sep 2019 22:26:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD6EE166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568060846;
	bh=C4vVRo9gbMf9u8QsgVLeUSzZbq83DppV1939zKoQ7n4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W/mke08B5BeaTKR6kn6crl8BYIsY5IXkTlOx+9bzd8Xzychf0cLBg3SybaI4bAdlG
	 +ypOhkKr6o2kTaG5q2+mp2YQdmg1mBkOqlqEuwSn1cI1VfdZj758zCjque5BCd2dBk
	 Nzj54S6eJcjnmLPpGYTrQBsVBNcJ5NjyHY5/hBxs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44CB4F804CF;
	Mon,  9 Sep 2019 22:25:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45679F80323; Mon,  9 Sep 2019 22:24:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
 DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F097F80094
 for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2019 22:20:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F097F80094
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Hv0mLxLc"
Received: by mail-pg1-x544.google.com with SMTP id n4so8489504pgv.2
 for <alsa-devel@alsa-project.org>; Mon, 09 Sep 2019 13:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=f8kcD/av2IHtuxWBUd9aJrd7r9hFL0IzQqelqnKxuvQ=;
 b=Hv0mLxLcScQ94ymOj99jHE5Kt1cXtpZWue2SaJ5v6OKjJ7L7Ao4eWhXannThE12GW7
 Wmci9TLL/AR6PRHyLB0Vzog+19uWg4E1/Wh4sroDjJQQtKGvmyOj1OK7+pxbQv4DPC55
 SiExlpS1JidbNG1Zt22gYsII4PKp7RVNf7dPjpcaahb/ZV3ZF/nvnrvfuOLdP9kkwjZ1
 C3zLNhMfI+gSlZAByou/WFjhDKrnZxdjifSD8dlozMMvgWBVEpcdy9VtDy4UCkoXWpIl
 n1jg2pl9cWP3Bdf53t4EUovTYOauq8gC109oHaF7/HBraLt4RfNnL/DVqPZEjwWy2aFm
 LzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=f8kcD/av2IHtuxWBUd9aJrd7r9hFL0IzQqelqnKxuvQ=;
 b=HAF7U4+IMDEy+hpxnL4lUGS+7yTRrukRWzqOvJzOkIvKlCBn23SfwpInxE3SaNtrXI
 VnqcimlGFgo6aNfb2EZvqr5y5IDZMVNXxbIcNEVBql+d4zBGAMWm2B5qZG7az/5aabWs
 wA0il/VHobS/1IXDWaY+x8F9gXmHjRcyeqW1Hb1A4NxO8v4Fy0orgzER8psaX4oBU8QI
 +jJTCpBiGtuS6wDWsjGSjevn14UV5PWl15x1gU0uNdu8z/AZU47i1Gr2TDPdOA59qXXB
 mdj3FcL60gLSpj2JvnWTP+srk96EZRAJfvIrpsizF8KzSFToGcs6wz1Gh/Xcc8SyRxEa
 2UTg==
X-Gm-Message-State: APjAAAWU/uD61BSZcgDaP01eboKTEfjCWAfxJJLzlLZMtGbWxg+9UgCd
 lvubpxuN7tGugp0N24LGJgA=
X-Google-Smtp-Source: APXvYqzFYT+lG/hdw0tQ+UPPVLQYZKqrbn7uN1Vn51POIuZlnzmyKI1abdpHBuq7s3lqUdd3yDYsSg==
X-Received: by 2002:a63:3046:: with SMTP id w67mr24304918pgw.37.1568060409962; 
 Mon, 09 Sep 2019 13:20:09 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id r30sm32034684pfl.42.2019.09.09.13.20.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Sep 2019 13:20:09 -0700 (PDT)
Date: Mon, 9 Sep 2019 13:19:45 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Message-ID: <20190909201945.GC10344@Asurada-Nvidia.nvidia.com>
References: <cover.1568025083.git.shengjiu.wang@nxp.com>
 <f62fda1f49af8159eb23a978147a321dd6849d1a.1568025083.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f62fda1f49af8159eb23a978147a321dd6849d1a.1568025083.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 2/3] ASoC: fsl_asrc: update supported
	sample format
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

On Mon, Sep 09, 2019 at 06:33:20PM -0400, Shengjiu Wang wrote:
> The ASRC support 24bit/16bit/8bit input width, so S20_3LE format
> should not be supported, it is word width is 20bit.

I thought 3LE used 24-bit physical width. And the driver assigns
ASRC_WIDTH_24_BIT to "width" for all non-16bit cases, so 20-bit
would go for that 24-bit slot also. I don't clearly recall if I
had explicitly tested S20_3LE, but I feel it should work since
I put there...

Thanks
Nicolin

> So replace S20_3LE with S24_3LE in supported list and add S8
> format in TX supported list
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_asrc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index 4d3804a1ea55..584badf956d2 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c
> @@ -624,7 +624,7 @@ static int fsl_asrc_dai_probe(struct snd_soc_dai *dai)
>  
>  #define FSL_ASRC_FORMATS	(SNDRV_PCM_FMTBIT_S24_LE | \
>  				 SNDRV_PCM_FMTBIT_S16_LE | \
> -				 SNDRV_PCM_FMTBIT_S20_3LE)
> +				 SNDRV_PCM_FMTBIT_S24_3LE)
>  
>  static struct snd_soc_dai_driver fsl_asrc_dai = {
>  	.probe = fsl_asrc_dai_probe,
> @@ -635,7 +635,8 @@ static struct snd_soc_dai_driver fsl_asrc_dai = {
>  		.rate_min = 5512,
>  		.rate_max = 192000,
>  		.rates = SNDRV_PCM_RATE_KNOT,
> -		.formats = FSL_ASRC_FORMATS,
> +		.formats = FSL_ASRC_FORMATS |
> +			   SNDRV_PCM_FMTBIT_S8,
>  	},
>  	.capture = {
>  		.stream_name = "ASRC-Capture",
> -- 
> 2.21.0
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
