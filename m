Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0C2799A5
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2019 22:16:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2EF71802;
	Mon, 29 Jul 2019 22:15:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2EF71802
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564431372;
	bh=3K1xpLgitcOvgcDBkPzJxOqUm/+sbpx49wsc+G8+S8E=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LHwVwprrXYMk2FG65DVfOPZ2CSX1K0hJ1Ms16RNWKLkt3G1/mADAx7KVQe3ZLi0mu
	 p3MeUxJc3IJwH232FGDXChdSEe3EcxThLfvAvWy6OwdXTzzNTaREavM3XtR19dDEf9
	 iR+rc+scbU9/ALiZ3fa+i1aOssa4NkHcKD4zrcvI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36CA9F8048D;
	Mon, 29 Jul 2019 22:14:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDC1BF8048D; Mon, 29 Jul 2019 22:14:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59FBCF800E4
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 22:14:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59FBCF800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oAW3tFK8"
Received: by mail-pg1-x544.google.com with SMTP id f20so19567884pgj.0
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 13:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=a80YhmstvkFSvpLxuuKLo03NoSn39TaxaZX6joqs8MA=;
 b=oAW3tFK8X61jpoyXLcaKMiOnJ9TYUngRguXPgieCBQvf7vbjz8n4B8AGc7Yhk1Spov
 jfeQDaW7HSUgWSQJmGbemqCvojoYvAv060EXEN4coAflTTTFW0sx6k1g9dG+HbyQ+kqe
 qUQU0/i18Ci/UKnzWdJlUXx8+Ut03VJliGO3Ol7bvYUETBeW1y1xDi04lBy/SZvgDpl6
 zl+NaAyW5bW5WdKekXOjlSfdQ9oDmyL0jqEAmq32QjWeml/Tl0I1Yc31Je+9sTMrqGj4
 rjTSOmm/45LqyYqzmWonKjfTI0DCeWT4+80sPZ5FHFaQmYxVJ+gyW3Xw3n7TxC2z+RHd
 TgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=a80YhmstvkFSvpLxuuKLo03NoSn39TaxaZX6joqs8MA=;
 b=JdDfe0rZ3hxnaueGUf0sEA3NDk03W37XPpk37PcOqiOiB6ml2sS/qKM+gf9aesUthf
 zy41BUtiHCa9hvOMmZSxdjv35EW5wZdViMBmWIDOOV7rJxFsPG3L4GPnQ+1xDYmEIIeo
 0FiThHbvJYaxJM5vUaeSzJGbT1b8NAeW/L5S43qsSOZUU1hCewihzY5Dav5TNan0Ce1c
 A3yWe8axoPAMvlmO0jKCse97smVdqnlJmaTHwLnnQ95TwYd70mWj8ByYz8fFQYW3MacJ
 9vBb/CfvggUhjAVJmEcfMigrV5W6HrELkiboqs2/A+oVUZv5x1LgM+gRKhT5fFsaToON
 lkkg==
X-Gm-Message-State: APjAAAWaV5WOcaXDndA5aQNdbx5MP6H+Yi30jZzYDFB0yHePqgT+QFRI
 YSR+1BeJaI/D0+vYgPdpRj8=
X-Google-Smtp-Source: APXvYqzHimbts6Pzs9sE75ZW5J3eKE7GTyz7Rq8GUSY5Q6dToWV+ZKL5WQAvZY7dibUphM2oY0krmA==
X-Received: by 2002:a17:90a:9a83:: with SMTP id
 e3mr111562668pjp.105.1564431261030; 
 Mon, 29 Jul 2019 13:14:21 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id i74sm122243034pje.16.2019.07.29.13.14.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Jul 2019 13:14:20 -0700 (PDT)
Date: Mon, 29 Jul 2019 13:15:09 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <20190729201508.GB20594@Asurada-Nvidia.nvidia.com>
References: <20190728192429.1514-1-daniel.baluta@nxp.com>
 <20190728192429.1514-5-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190728192429.1514-5-daniel.baluta@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kernel@pengutronix.de, timur@kernel.org, robh@kernel.org,
 shengjiu.wang@nxp.com, angus@akkea.ca, tiwai@suse.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org, linux-imx@nxp.com,
 viorel.suman@nxp.com, festevam@gmail.com, mihai.serban@gmail.com,
 l.stach@pengutronix.de
Subject: Re: [alsa-devel] [PATCH v2 4/7] ASoC: dt-bindings: Document dl-mask
	property
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

On Sun, Jul 28, 2019 at 10:24:26PM +0300, Daniel Baluta wrote:
> SAI supports up to 8 data lines. This property let the user
> configure how many data lines should be used per transfer
> direction (Tx/Rx).

This sounds a bit less persuasive to me as we are adding a
DT property that's used to describe a hardware connections
and it would be probably better to mention that the mapping
between the mask and the data lines could be more flexible
than consecutive active data lines as you said previously.

> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl-sai.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl-sai.txt b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> index 2e726b983845..2b38036a4883 100644
> --- a/Documentation/devicetree/bindings/sound/fsl-sai.txt
> +++ b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> @@ -49,6 +49,13 @@ Optional properties:
>  
>    - big-endian		: Boolean property, required if all the SAI
>  			  registers are big-endian rather than little-endian.
> +  - fsl,dl-mask		: list of two integers (bitmask, first for RX, second

I am leaving this naming to DT maintainer.

> +			  for TX) representing enabled datalines. Bit 0
> +			  represents first data line, bit 1 represents second
> +			  data line and so on. Data line is enabled if
> +			  corresponding bit is set to 1. By default, if property
> +			  not present, only dataline 0 is enabled for both
> +			  directions.

To make this patch more convincing, could we add an example
as well in the Example section of this binding file? Like:
	/* RX data lines 0/1 and TX data lines 0/2 are connected */
	fsl,dl-mask = <0x3 0x5>;
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
