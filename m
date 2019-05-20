Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3261D2300F
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2019 11:19:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A445F1612;
	Mon, 20 May 2019 11:18:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A445F1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558343973;
	bh=FmnKDuEJDBwXZAreGbOq56B/L4ODBuk71VtA4HcTkhU=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IseGDwowNYWgAt8M8gLNAbx0mBmE7GFEohgmTpaaH6RzbAAOkJJYlkQifcPjGXreC
	 MqzX/5titnV0nmBGYqyrSFqOKYzj9i1ayT+NLG7zsMEM5f8iW7Tk7EzmCiTG0b9ewZ
	 xWBAVjfzljF53kKSo97fGvNYuF21NpVsXhsm+sI0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2C6BF89636;
	Mon, 20 May 2019 11:17:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70CDDF80726; Mon, 20 May 2019 10:46:25 +0200 (CEST)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E686F80726
 for <alsa-devel@alsa-project.org>; Mon, 20 May 2019 10:37:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E686F80726
Received: by mail-ed1-f67.google.com with SMTP id b8so22551500edm.11
 for <alsa-devel@alsa-project.org>; Mon, 20 May 2019 01:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/OoImjvp6vhdhmP+jZDUwoMoIjk9haGYNqVuRUXiioc=;
 b=fUNkmZsslNLibk0HtsLpsNDd1vShfqszxsg9dN2gKfUp/yUK6mCAz4AmuNchi8MEbt
 +q0IDaaqMD5iz3t5tbbm9GbHIdsJNJ6bkNUwlGK1cawCSgSjM4dj1Q1Bwix8hjUIu2u1
 6a0AllzOwMbNQcpFqnGHmDyf+2jtc1ATVwuJD0sewG3eia15ec15KY3J6bVeWLEnO5dK
 0ITtO0rsG6xrlie4UFTJhhc5lOE21SIrsYXeRmcqcW0tvSz69o8Vf3hY7akz761OKmPy
 FDA0nEyQkerAj9pWkXj4cybA7kVdNS3zHFqppXH4hcL03HN7IXjQ4cd81NS2GNKIEpB9
 HLUA==
X-Gm-Message-State: APjAAAUqoXpwDGVlv4HN9vgNFdfFgL0iEQydsP4Dg4ykmtjtwY+UDWFH
 gnIT+eVEnVoqoNf92fDo8rjpQyhnVRY=
X-Google-Smtp-Source: APXvYqxNMw+Jv9mFvX95M23pZ/Oe1C9oluCJezDYi8hRi2/rjZIZJfmtUBoCYXTb0TXZadtsbJGrrA==
X-Received: by 2002:a50:9738:: with SMTP id c53mr72716921edb.156.1558341422638; 
 Mon, 20 May 2019 01:37:02 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id 4sm5401052edz.24.2019.05.20.01.37.01
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 01:37:02 -0700 (PDT)
To: nariman <narimantos@gmail.com>, broonie@kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
References: <20190519175706.3998-1-narimantos@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <783c330c-b706-9d19-467d-a19d2f414a05@redhat.com>
Date: Mon, 20 May 2019 10:37:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190519175706.3998-1-narimantos@gmail.com>
Content-Language: en-US
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: bytcr_5640.c:Refactored if
 statement and removed buffer
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi all,

On 19-05-19 19:57, nariman wrote:
> From: Nariman Etemadi <narimantos@gmail.com>
> 
> in function snd_byt_rt5640_mc_probe and removed buffer yt_rt5640_codec_aif_name & byt_rt5640_cpu_dai_name
> 
> Signed-off-by: Nariman Etemadi <narimantos@gmail.com>

Series (all 4 patches) look good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>   sound/soc/intel/boards/bytcr_rt5640.c | 26 ++++----------------------
>   1 file changed, 4 insertions(+), 22 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
> index 940eb27158da..0d91642ca287 100644
> --- a/sound/soc/intel/boards/bytcr_rt5640.c
> +++ b/sound/soc/intel/boards/bytcr_rt5640.c
> @@ -1075,8 +1075,6 @@ static struct snd_soc_dai_link byt_rt5640_dais[] = {
>   
>   /* SoC card */
>   static char byt_rt5640_codec_name[SND_ACPI_I2C_ID_LEN];
> -static char byt_rt5640_codec_aif_name[12]; /*  = "rt5640-aif[1|2]" */
> -static char byt_rt5640_cpu_dai_name[10]; /*  = "ssp[0|2]-port" */
>   static char byt_rt5640_long_name[40]; /* = "bytcr-rt5640-*-spk-*-mic" */
>   
>   static int byt_rt5640_suspend(struct snd_soc_card *card)
> @@ -1268,28 +1266,12 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
>   	log_quirks(&pdev->dev);
>   
>   	if ((byt_rt5640_quirk & BYT_RT5640_SSP2_AIF2) ||
> -	    (byt_rt5640_quirk & BYT_RT5640_SSP0_AIF2)) {
> -
> -		/* fixup codec aif name */
> -		snprintf(byt_rt5640_codec_aif_name,
> -			sizeof(byt_rt5640_codec_aif_name),
> -			"%s", "rt5640-aif2");
> -
> -		byt_rt5640_dais[dai_index].codec_dai_name =
> -			byt_rt5640_codec_aif_name;
> -	}
> +	    (byt_rt5640_quirk & BYT_RT5640_SSP0_AIF2))
> +		byt_rt5640_dais[dai_index].codec_dai_name = "rt5640-aif2";
>   
>   	if ((byt_rt5640_quirk & BYT_RT5640_SSP0_AIF1) ||
> -	    (byt_rt5640_quirk & BYT_RT5640_SSP0_AIF2)) {
> -
> -		/* fixup cpu dai name name */
> -		snprintf(byt_rt5640_cpu_dai_name,
> -			sizeof(byt_rt5640_cpu_dai_name),
> -			"%s", "ssp0-port");
> -
> -		byt_rt5640_dais[dai_index].cpu_dai_name =
> -			byt_rt5640_cpu_dai_name;
> -	}
> +	    (byt_rt5640_quirk & BYT_RT5640_SSP0_AIF2))
> +		byt_rt5640_dais[dai_index].cpu_dai_name = "ssp0-port";
>   
>   	if (byt_rt5640_quirk & BYT_RT5640_MCLK_EN) {
>   		priv->mclk = devm_clk_get(&pdev->dev, "pmc_plt_clk_3");
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
