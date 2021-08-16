Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4EE3EDD26
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Aug 2021 20:36:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EA5D16AA;
	Mon, 16 Aug 2021 20:35:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EA5D16AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629138991;
	bh=i7JF1o3e1znX/mRWNTdI229j724tjh+eXlHMV4Sn2xY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XLTrswA/dwq0uIfmbCKkDE01suIY9h6aoz2tGG0ixa++4gAF+B1RJFfP4eYYsGVnG
	 BwNBH+i5xD87mSN1u3Ru4K7qgsywTpC3tSGYGb2aT7QUpD2IkUFLalGKlLd7MBWiKL
	 E0Db2iZRrtj3AXhoD1ZOQKDInUZjiOMc/ILRrLyY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F956F800AF;
	Mon, 16 Aug 2021 20:35:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F3D6F8028D; Mon, 16 Aug 2021 20:35:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E89ADF80246
 for <alsa-devel@alsa-project.org>; Mon, 16 Aug 2021 20:34:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E89ADF80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oFNy3cH0"
Received: by mail-lf1-x12e.google.com with SMTP id y34so36331212lfa.8
 for <alsa-devel@alsa-project.org>; Mon, 16 Aug 2021 11:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uFoizD91rABkFIcWHSzEWuX3hfrFZBSWrwl/QtKpAiU=;
 b=oFNy3cH0ASHTjVBWzJXJtojGzpn3ptld69kfnNagomXNGKcQaRdAxvH6yh51NmocmG
 MBXis16EBBwqcs+XiKcAzL5rwoH/OT/gMIGkGPj1yI2h4nOSsUl/ZhNLcdYRPIkQJZib
 aNIvVnVncu5G4g2ZNovJ3n4yvSGUgyE7NZl7Uq3a4JzZPmLg/cSPGtYqdNHtfV1SOeiH
 nJ8J55kXehL9kDQOFiCmn8PWMKSqjEfGM/5Q2g6Bl1TWAhTaRakqLdGntxed5gWXQqSg
 aaHwYXzldWnJ4NrIOIh9w38zlNdEWxLjD44TmfCopZQS5pRcsj+jD0tQoiY71SBao2sD
 /iWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uFoizD91rABkFIcWHSzEWuX3hfrFZBSWrwl/QtKpAiU=;
 b=Mwq86kYNCmKI1juE1h0ToweecpST61+qQk+BvJRIBtuo3Otwqn5eniPnizQvdNuWo6
 PmKNjh6ux+S0iv+o/WS7mPMahdbxODX1lCCusGWEZW5faTNlrzF8ljQFqw91hBKzaQED
 XC6xYVnQdCp8kRp4vH+7uhnzON/jnzkmhRRrNejY8vMQ1ibDfF9DvP3NQ8M+tZAA+3C0
 K79xlBECdCieXlVuE/y0Gwi+k3+DAnYSyLmMm3qIDyiqyYYChGLwIcSvmBsbbB3i46p1
 olOoLBmKDdlcik74+4Pa9tzFMu02/vWOvGzWzlrITEMZk5jbMG7lBdwN3LDeOTb3opXW
 G1mg==
X-Gm-Message-State: AOAM5320/cq3eUpHzrOGvxGkTqW0qUP7ibXr7umXK9IP3OqSrYnDRlz/
 8uttkRCJBv0+jV6CbxjMMtM=
X-Google-Smtp-Source: ABdhPJziOViJn7QDLtX6gHrzZuO48V6h3j0n8idKXpMfINxC1WqPkQblzeiYIpUM7DO/U3MN0SQiPw==
X-Received: by 2002:a05:6512:3231:: with SMTP id
 f17mr12041211lfe.364.1629138896736; 
 Mon, 16 Aug 2021 11:34:56 -0700 (PDT)
Received: from [10.0.0.40] (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id r3sm2379lfc.114.2021.08.16.11.34.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 11:34:56 -0700 (PDT)
Subject: Re: [PATCH 2/3] ASoC: ti: omap-mcbsp: Use of_device_get_match_data
To: Aakash Hemadri <aakashhemadri123@gmail.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
References: <cover.1628972198.git.aakashhemadri123@gmail.com>
 <44f3b21198dd1e40e1e5e783db2b3dd76505b562.1628972198.git.aakashhemadri123@gmail.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Message-ID: <ed02b26b-d1cc-dfc2-ef35-1430677fb1df@gmail.com>
Date: Mon, 16 Aug 2021 21:35:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <44f3b21198dd1e40e1e5e783db2b3dd76505b562.1628972198.git.aakashhemadri123@gmail.com>
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
>  sound/soc/ti/omap-mcbsp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
> index 4479d74f0a45..fcb651487854 100644
> --- a/sound/soc/ti/omap-mcbsp.c
> +++ b/sound/soc/ti/omap-mcbsp.c
> @@ -1373,7 +1373,7 @@ static int asoc_mcbsp_probe(struct platform_device *pdev)
>  	const struct of_device_id *match;
>  	int ret;
>  
> -	match = of_match_device(omap_mcbsp_of_match, &pdev->dev);
> +	match = of_device_get_match_data(&pdev->dev);

Similarly incorrect,
of_device_get_match_data() is retrieving the match->data

>  	if (match) {
>  		struct device_node *node = pdev->dev.of_node;
>  		struct omap_mcbsp_platform_data *pdata_quirk = pdata;
> 

-- 
Péter
