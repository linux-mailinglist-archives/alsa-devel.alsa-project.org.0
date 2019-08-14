Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEC98C596
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 03:40:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38A0E16A5;
	Wed, 14 Aug 2019 03:39:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38A0E16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565746811;
	bh=wJvYJr9qbTu8+cvOZwy12vxUIZB2/8HC44dC5LBBscM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F4IIu2rKYkUstHeySYJVQVEgeo2ys2UW3cDTzHOjL94UpuPtDspgP3ClxRFTttH95
	 n49N4JyRjSpTq9IxS4km1oDLk4ejXwzcCZQyCS5ZWjGkYUVcONjmZifSpf+P2Usx/p
	 fFadf1EWKBhiQbmhYbQi08xUUXBJjAtep8QpNgJ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5548DF803F4;
	Wed, 14 Aug 2019 03:38:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C75AFF80214; Wed, 14 Aug 2019 03:38:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBEAEF8015A
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 03:38:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBEAEF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mf1bbFYL"
Received: by mail-pg1-x543.google.com with SMTP id u17so52204569pgi.6
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 18:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=E9r2CKaxmujb7ntSffi+Z+EeKWCGq3B69sAfi5aF5qg=;
 b=mf1bbFYLx3M6P0kgQW6J6zV8FhHUY21KRmfmz2T5veeQ+8Lh4Tb632DNtV5PzizqEG
 d0UidxYQG1k3hb78mZNwvPt8+TM+L0SYrCPHRRbos4vNqOvdTMFN0pA2uMP1Gb3IHH0J
 LQzSnIisUgufPRAYjBAB9sp3lkbIVmlNY1O2jaLPUrXBpwitIOtH6mWwLgIXBew3tz8/
 /YH1jwNfphKKk1pT4yfoVz/NR1nvXpGTsECIzLOG6bNIZM2jj7k5EchUFudwdg8wXcn5
 M2eLcPL3C5Kciz2V/jrNSXmzo4PppvvcDgQML7nxL5at7quJ9VfXBjN9c6LUm2RCBW0n
 6zdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=E9r2CKaxmujb7ntSffi+Z+EeKWCGq3B69sAfi5aF5qg=;
 b=FG7rj1r90rkjtF20qrpKVyf2vOeybwtdDiR1VYe87bxPtS+E4qU1TKVsa5RFPtihTT
 6T1pufZ3KhmucFwIRU4Rz5oYcIF/HvCSMWLiqnIoLm82kAMxnpBCfdHQLxbk49g1X8qu
 FeLc3Pky21j/WPudpLiBvyvbdrN3jAYQy0iWRxDqGXpYuX4/RIMo2+m/k2ZxvbllJfxh
 xRIWNDXBxcBNwr2DhFdxwlgwpQ7GnIIqKWeiqWNCfxcbXEceQ6ldK7IkOk94+3sUWO9N
 nOh8g+yTau/XH5y2z6K9VivrnqbsBGPZmIKo8asm7c2EdwenmeHqp4tLZ1kr47FwNlGz
 XY+Q==
X-Gm-Message-State: APjAAAUX5hV2xTN7G0+daSDNgfGHDNU3QccXbpmIOCKFL+2GWHh3WrR6
 P2285y5wTln4cifP6T1NlrU=
X-Google-Smtp-Source: APXvYqzXKOsatok399OUXkjXNqZajIPiVhATh4HYHbxZWpGXyxq/JKE1DQo26W2cxGqXsNk1FnA2wQ==
X-Received: by 2002:a17:90a:8a84:: with SMTP id
 x4mr4738103pjn.105.1565746695820; 
 Tue, 13 Aug 2019 18:38:15 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id c5sm9140567pfo.175.2019.08.13.18.38.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 13 Aug 2019 18:38:15 -0700 (PDT)
Date: Tue, 13 Aug 2019 18:39:16 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <20190814013916.GB13398@Asurada-Nvidia.nvidia.com>
References: <20190811195545.32606-1-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190811195545.32606-1-daniel.baluta@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, linux-kernel@vger.kernel.org,
 broonie@kernel.org, linux-imx@nxp.com, festevam@gmail.com
Subject: Re: [alsa-devel] [RFC PATCH] ASoC: fsl_sai: Enable data lines based
 on input channels
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

On Sun, Aug 11, 2019 at 10:55:45PM +0300, Daniel Baluta wrote:
> An audio data frame consists of a number of slots one for each
> channel. In the case of I2S there are 2 data slots / frame.
> 
> The maximum number of SAI slots / frame is configurable at
> IP integration time. This affects the width of Mask Register.
> SAI supports up to 32 slots per frame.
> 
> The number of datalines is also configurable (up to 8 datalines)
> and affects TCE/RCE and the number of data/FIFO registers.
> 
> The number of needed data lines (pins) is computed as follows:
> 
> * pins = channels / slots.
> 
> This can be computed in hw_params function so lets move TRCE bits
> seting from startup to hw_params.
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  sound/soc/fsl/fsl_sai.c | 34 +++++++++++++---------------------
>  sound/soc/fsl/fsl_sai.h |  2 +-
>  2 files changed, 14 insertions(+), 22 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 69cf3678c859..b70032c82fe2 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c

> @@ -480,13 +483,17 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,

> -	regmap_write(sai->regmap, FSL_SAI_xMR(tx), ~0UL - ((1 << channels) - 1));
> +	regmap_write(sai->regmap, FSL_SAI_xMR(tx), ~0UL - ((1 << slots) - 1));

Would this break mono channel audio?

>  static int fsl_sai_dai_probe(struct snd_soc_dai *cpu_dai)

> @@ -881,6 +872,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	sai->pdev = pdev;
> +

Seemly unnecessary
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
