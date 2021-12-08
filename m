Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2965646DD9A
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 22:27:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A70D226FB;
	Wed,  8 Dec 2021 22:26:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A70D226FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638998820;
	bh=pga8xOBV9hsl4INJgKLxEYNTQm9nbSaOiMZSBoxY+R4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lSySm3bFQM67F9M8Ntj3Tk5sx04TvMSicIC9qqiHXEmc7r6OIdhTqaC3Neqb/6ywA
	 jLfHJghwD/9JKasSRQcpGmdSey9lzY2sCFOt2jHgvyVYKDwIs7J09ak+1yt4hzPlV1
	 GNcfFu5aQLz3lpE97Z5/fmaNxtrgpAWbAinaO9Mc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4BD6F800AB;
	Wed,  8 Dec 2021 22:25:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CFACF804E5; Wed,  8 Dec 2021 22:25:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 695ADF800AB
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 22:25:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 695ADF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="hWTxjrqo"
Received: by mail-ot1-x32d.google.com with SMTP id
 47-20020a9d0332000000b005798ac20d72so4081636otv.9
 for <alsa-devel@alsa-project.org>; Wed, 08 Dec 2021 13:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vTplaHA8dACYaNRJ7c99MAwqPqMNOUpH/T8J8+0tyxw=;
 b=hWTxjrqosr+1DcGt2tRCkFcpkINz1Z96h5k8CwbfX3cuSGWLUX8VcT6jxlkZ1CrixT
 vRJ2BuGEI7dl53IsOu5tnPk3Vic4v/Ih58ahSODj1YCpJS6OG7fjwq1mD2VWumzsdUhz
 BVNsChOrSwkPYbd+08qRZy4wyOeP2kT1Vl2ts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vTplaHA8dACYaNRJ7c99MAwqPqMNOUpH/T8J8+0tyxw=;
 b=Q9Qhdv+07fm12pyVTg4hXoErvLe8/CqGrb0+qF07uomB1gzWGo3QHxHLnLP5g6Z62B
 f0omYLM3Bkjj/lc2cYoZvFiYm5miQ+sWMKCToK+honbrC78weafLwP6vnZgyv/vJ3pDw
 l1P2lBXbkSjEceFxGM2gI2ETcIfDPtgsyEmNlr9lPMaqWOXsqErq4yxQ01pYzprnYh5f
 LI3thAPQkog1PgccmQVJZlUg0UqiWdmDnN7JGn6yr+xZxmq4XsAYPNRx6IjjLiLGedUi
 QG0XYeLC6nsOoj0NewxRuNaPO5KYEjv6iIv+NT19DOExHrOfqOpABidDc7+izPX8yY3n
 hKKA==
X-Gm-Message-State: AOAM530XM2hHzNEUPJ9lNKGJksJsH8EHSQeGHwZvMuvGLFyfdHwebpgJ
 riW8RmFi4OWgqUzs3M4wrvnJwQ==
X-Google-Smtp-Source: ABdhPJxGDRLvRucHxyslIHBl7vElGLuJx9Xe2feNaQWNV+qYs8YRDab6m4Hu/YP+HZfbQP+uU+IdaA==
X-Received: by 2002:a9d:578a:: with SMTP id q10mr1712667oth.149.1638998737713; 
 Wed, 08 Dec 2021 13:25:37 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id w17sm679324oth.17.2021.12.08.13.25.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 13:25:37 -0800 (PST)
Subject: Re: [PATCH v3 2/3] kselftest: alsa: optimization for
 SNDRV_CTL_ELEM_ACCESS_VOLATILE
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 Jaroslav Kysela <perex@perex.cz>, Shuah Khan <shuah@kernel.org>
References: <20211208211745.533603-1-broonie@kernel.org>
 <20211208211745.533603-3-broonie@kernel.org>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <62df6074-6d22-2a4d-0191-369de56a2fe3@linuxfoundation.org>
Date: Wed, 8 Dec 2021 14:25:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20211208211745.533603-3-broonie@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Shuah Khan <skhan@linuxfoundation.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kselftest@vger.kernel.org
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

On 12/8/21 2:17 PM, Mark Brown wrote:
> From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> 
> The volatile attribute of control element means that the hardware can
> voluntarily change the state of control element independent of any
> operation by software. ALSA control core necessarily sends notification
> to userspace subscribers for any change from userspace application, while
> it doesn't for the hardware's voluntary change.
> 
> This commit adds optimization for the attribute. Even if read value is
> different from written value, the test reports success as long as the
> target control element has the attribute. On the other hand, the
> difference is itself reported for developers' convenience.
> 
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> Link: https://lore.kernel.org/r/Ya7TAHdMe9i41bsC@workstation
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>   tools/testing/selftests/alsa/mixer-test.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
> index ab51cf7b9e03..171d33692c7b 100644
> --- a/tools/testing/selftests/alsa/mixer-test.c
> +++ b/tools/testing/selftests/alsa/mixer-test.c
> @@ -307,9 +307,13 @@ bool show_mismatch(struct ctl_data *ctl, int index,
>   	}
>   
>   	if (expected_int != read_int) {
> -		ksft_print_msg("%s.%d expected %lld but read %lld\n",
> -			       ctl->name, index, expected_int, read_int);
> -		return true;
> +		// NOTE: The volatile attribute means that the hardware can voluntarily change the
> +		// state of control element independent of any operation by software.

Let's stick to kernel comment format :)

> +		bool is_volatile = snd_ctl_elem_info_is_volatile(ctl->info);
> +
> +		ksft_print_msg("%s.%d expected %lld but read %lld, is_volatile %d\n",
> +			       ctl->name, index, expected_int, read_int, is_volatile);
> +		return !is_volatile;
>   	} else {
>   		return false;
>   	}
> 

With that change:

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
