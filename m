Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF41C3EDD20
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Aug 2021 20:34:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DA6E16AA;
	Mon, 16 Aug 2021 20:33:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DA6E16AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629138878;
	bh=Ol/DXO6ONW73XxV4vuKA21MjU5wx7W8rp6RKvJzUscc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IOBLktAQ0tzZLpasuWeKdTWGxbdFvRzSCS4vKxvb6J+V+xUoEwiHK/B3LvU3IDZhl
	 2Z4CuVJRz/hSQeho/yXGdvPin41hzupTN9iKbWIvg3VA0pFyRs+Jdha2czL8F0Ere3
	 LJWACD71r+evjFDxB2kkwKhj7gtl7dhijoXuhqwg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2706DF800AF;
	Mon, 16 Aug 2021 20:33:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 408CCF80249; Mon, 16 Aug 2021 20:33:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AE19F800AF
 for <alsa-devel@alsa-project.org>; Mon, 16 Aug 2021 20:33:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AE19F800AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jaH1ZDMj"
Received: by mail-lj1-x22d.google.com with SMTP id y6so11893848lje.2
 for <alsa-devel@alsa-project.org>; Mon, 16 Aug 2021 11:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W8Fy2zeilbZUVjVN0KITdsrqcookdRVPAeyuky/LCDY=;
 b=jaH1ZDMjfFdDMxDtK3oJHDLrrW56vNGTeqw5Jla+RgaOoJbEaJ8EeIssT7pOuAADIK
 BzhEFPFKiB/boC6GuYf/vBq+y/vKxcIItOV2gkHW2Zhi0SKtuHkTnrjONYA+lM3OVDy4
 MOdPR1aPYZ7Cippui03ZlspPPdDPMbwHvOYLhg7C5/VFvne6mHnGvMEXf2nWFATWUD+Y
 Hgt9JNM95Y3S+sHEYgcee1J++l0ffj5jEtLm9wMF6auCFGvm6xVd1CcPR0TpFaHZuW0b
 d5Yd3zj0CnDu2P3sO18IVGKy39s7TAig5sUxalbvyH++1TzaovWndJhCghw+wR4oSkM1
 K/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W8Fy2zeilbZUVjVN0KITdsrqcookdRVPAeyuky/LCDY=;
 b=Y9c0Xi89qXOz8VGwKkQcpfsWdaNu/Ha0A6bpSvkVE4az0h7/0rLx7VvL2uWtUyZ7Qe
 4g+AlmOQwMRhShv7P2AZOTKklm+9kiMu6HYfNgQRRfHHizCgJzZt0LHa08j9pYsM+mcP
 0bVH/P2NuXkdU8wqGjH8D80vN8MjPmxh2ASqqkOKwUBnFGHKDy9rlTrVKoeW7C3+T1j+
 zhRrk7IvVR6Dwv/qbMq+HiMcU4Hc3aeT+6qXrxUBlsk9/D7MHIbHeaOSNwXdmYOHq/MU
 2EQWAzKlDYWjBVdaqo7CYM5gFOvKhFLLuBbFI5+h8Jj0+5KQ+JJ6uTYLoDmFOlYG3y+l
 VgFQ==
X-Gm-Message-State: AOAM532+vCbObyLTJQt2BFJgV+NAdC5koqfsbtTYtkZpSGJcTWUuzlic
 FLodS5RaIjHkDISBpX/pL7g=
X-Google-Smtp-Source: ABdhPJyW8Wdp2IzGFmH0NpyCmsmmSc1VdmUQWMBp+SRvcEDpura5qc+nvBSaPQLm7JOg/B0KbT6EeQ==
X-Received: by 2002:a2e:b5d0:: with SMTP id g16mr13587913ljn.349.1629138777850; 
 Mon, 16 Aug 2021 11:32:57 -0700 (PDT)
Received: from [10.0.0.40] (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id h22sm10645ljk.133.2021.08.16.11.32.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 11:32:57 -0700 (PDT)
Subject: Re: [PATCH 1/3] ASoC: ti: davinci-mcasp: Use of_device_get_match_data
To: Aakash Hemadri <aakashhemadri123@gmail.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
References: <cover.1628972198.git.aakashhemadri123@gmail.com>
 <ffe9b568be52cc075df56bbf07f20a92cb54f07d.1628972198.git.aakashhemadri123@gmail.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Message-ID: <b7541f9c-8e21-300d-ed3c-ea5e610b7266@gmail.com>
Date: Mon, 16 Aug 2021 21:33:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ffe9b568be52cc075df56bbf07f20a92cb54f07d.1628972198.git.aakashhemadri123@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Bjorn Helgaas <bjorn@helgaas.com>
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



On 14/08/2021 23:19, Aakash Hemadri wrote:
> Prefer `of_device_get_match_data` over `of_match_device`
> 
> Retrieve OF match data using `of_device_get_match_data`, this is cleaner
> and better expresses intent.
> 
> Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
> ---
>  sound/soc/ti/davinci-mcasp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
> index 56a19eeec5c7..b26e8d324078 100644
> --- a/sound/soc/ti/davinci-mcasp.c
> +++ b/sound/soc/ti/davinci-mcasp.c
> @@ -1881,7 +1881,7 @@ static bool davinci_mcasp_have_gpiochip(struct davinci_mcasp *mcasp)
>  static int davinci_mcasp_get_config(struct davinci_mcasp *mcasp,
>  				    struct platform_device *pdev)
>  {
> -	const struct of_device_id *match = of_match_device(mcasp_dt_ids, &pdev->dev);
> +	const struct of_device_id *match = of_device_get_match_data(&pdev->dev);

No.
of_device_get_match_data() returns the match->data

>  	struct device_node *np = pdev->dev.of_node;
>  	struct davinci_mcasp_pdata *pdata = NULL;
>  	const u32 *of_serial_dir32;
> 

-- 
Péter
