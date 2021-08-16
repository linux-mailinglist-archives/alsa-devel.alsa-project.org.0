Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EB03EDD21
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Aug 2021 20:34:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1826B16BC;
	Mon, 16 Aug 2021 20:34:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1826B16BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629138894;
	bh=BL4B6QdVithncoszW1YveN748eT7e4DV+zPpkHOGw6s=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bU7JPOQiX9xTpxcLvAJsPJc7lFLuLUxYh2steM0RjE2vBP2V6BGnzUMnw713Eks0w
	 CBnG3UIFVPmT3uHXlCaDYT1sxEPdJQmNL12Fukujacq/6jLGNFREl0ERf+TeOFRjRj
	 dB9oNfwxi760ZXP93HAnq5YypSctK6IyaxA4CXG0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA547F802C8;
	Mon, 16 Aug 2021 20:33:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5762EF802BE; Mon, 16 Aug 2021 20:33:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05EC2F80259
 for <alsa-devel@alsa-project.org>; Mon, 16 Aug 2021 20:33:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05EC2F80259
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NOitTu/4"
Received: by mail-lj1-x22f.google.com with SMTP id n6so28618778ljp.9
 for <alsa-devel@alsa-project.org>; Mon, 16 Aug 2021 11:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YTS8ZgXCuH1PuqQv5c9vfhOBKUsRFjCQLfWXK7K1MRc=;
 b=NOitTu/47BOg5MpNdaYFQ7Dno4q6xm8dU1P6f5zjdlyVLEJ8Z/asMZW1XsBErQLaiI
 cOXtgJcyR+jwpZT5F0TcFtw9iwUOPlSUr7Io61W6MFceIzXD8aBVYsrA+bluGOxkaKM2
 G4w4cPffp1gWB3hmrS/ZBFxUG1g/wC2Sj4FjSUU0f1gAtWvCv6M3/IA2GbxVfGozrvgh
 BpjM4HvFFTPAjwpza7nepEa+WvBPIkTSq4oh26QxYq779cFw7xtRfcQoB73jYIN3Ly6I
 LDXwxxkLd543p2zDb0RKNLiL9W6TSO1i4inBO30ug4ynLBdenUjptPJfgdSb8hS0LOH8
 IKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YTS8ZgXCuH1PuqQv5c9vfhOBKUsRFjCQLfWXK7K1MRc=;
 b=ltRH6qssLx1J/EljBYXXnrSr9VwTvem8R8WKuLDRY5n1cO1LBlQ3+/mL35HMio2lmf
 5T/xDGMGrfptJKW9fztijAvHiBMCH8hSKK7dDBDEhOLuZRF1klE4+lZw87RirSCg5Af9
 5nUxNKrWiknpGVxtiY9GZhbaq5H0Ls8+rYZYhyll4gq9M2UIIfR/S4S3WzYcoPNc/w7B
 TxVxc1dfs+z3Zz8Kf2PvbX+n6+ppPx1oL6TjyB+kE768b8O4nevydb8q84DuIxo2G8Dr
 7/Oj5dlQeQnrtgxB1/invG/N4l7A7An7xe3w28zZzzYCBHlyuokiewMjRa770GW07zFX
 xscQ==
X-Gm-Message-State: AOAM533NvTG/ianpg1MxKRmFfFf3KQpkqBFL8muK4/IoPYcQkBAq0xts
 ETBqzXxFExI80e9qJNM2ro4=
X-Google-Smtp-Source: ABdhPJw38xHx3nos1WlUP6JJqE+mD3b9t9CUEFVpmd6uX2c8AzflQM/WrxswEmPSISK7ZyrQC76u4w==
X-Received: by 2002:a2e:8008:: with SMTP id j8mr4401ljg.233.1629138831261;
 Mon, 16 Aug 2021 11:33:51 -0700 (PDT)
Received: from [10.0.0.40] (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id bu14sm3076lfb.6.2021.08.16.11.33.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 11:33:50 -0700 (PDT)
Subject: Re: [PATCH 3/3] ASoC: ti: davinci-evm: Use of_device_get_match_data
To: Aakash Hemadri <aakashhemadri123@gmail.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
References: <cover.1628972198.git.aakashhemadri123@gmail.com>
 <6ebb350fa8a960b8775ce324b7786dbaa865a1c8.1628972198.git.aakashhemadri123@gmail.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Message-ID: <b096a803-093a-b70f-2999-38bfe8978513@gmail.com>
Date: Mon, 16 Aug 2021 21:34:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6ebb350fa8a960b8775ce324b7786dbaa865a1c8.1628972198.git.aakashhemadri123@gmail.com>
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
>  sound/soc/ti/davinci-evm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/ti/davinci-evm.c b/sound/soc/ti/davinci-evm.c
> index b043a0070d20..bf13f3d25cec 100644
> --- a/sound/soc/ti/davinci-evm.c
> +++ b/sound/soc/ti/davinci-evm.c
> @@ -389,7 +389,7 @@ static int davinci_evm_probe(struct platform_device *pdev)
>  	struct clk *mclk;
>  	int ret = 0;
>  
> -	match = of_match_device(of_match_ptr(davinci_evm_dt_ids), &pdev->dev);
> +	match = of_device_get_match_data(&pdev->dev);

incorrect,
of_device_get_match_data() is retrieving the match->data

>  	if (!match) {
>  		dev_err(&pdev->dev, "Error: No device match found\n");
>  		return -ENODEV;
> 

-- 
Péter
