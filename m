Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEB14A6436
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Feb 2022 19:50:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9B8E17EF;
	Tue,  1 Feb 2022 19:49:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9B8E17EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643741434;
	bh=7yQhQZs5VQ7iOCiqGdcioTwZJYGMTm0+9hLuvtnCb+k=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FrfN9YMeaxaDLu5eyagtgn+cNSpuZo58r70SyQin6PIgk3WJhC864OTi4wb2yITE/
	 6MrJ14ZH4pqKpmm3igW3KnhI4ru+ELZ0mxjXHsBdzfFm/YOkRrJG+LyxdP2DCaqvDD
	 +DRfcSV2dfMJoHjZe63PE4dxubW/GC4qSWL2yi5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35F43F80089;
	Tue,  1 Feb 2022 19:49:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18A54F80130; Tue,  1 Feb 2022 19:49:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C23C8F800F8
 for <alsa-devel@alsa-project.org>; Tue,  1 Feb 2022 19:49:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C23C8F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="crZKCeXm"
Received: by mail-il1-x12b.google.com with SMTP id x6so2555192ilg.9
 for <alsa-devel@alsa-project.org>; Tue, 01 Feb 2022 10:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YBWpcqo7r9PmZE44Y/rtRRY/rFDY3Yz81vSI7lMsgBk=;
 b=crZKCeXmjdeNhtotolL21onTwntleBAgT/ItIhhzYnnQTNgRvOITvJKOdmFK5q7uEj
 lP/gZn4y8tVfBMCq0QQIsMahVNqGmYmzzeCTyz6P1tnDi7HQjlh6HcvMSo8YLNbrkn3d
 jksclscYjOCa9QVbKwxxBDW0ExnKY4385oUCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YBWpcqo7r9PmZE44Y/rtRRY/rFDY3Yz81vSI7lMsgBk=;
 b=xYhcPypBSb/uO1Ez7CsYKgd7qnF8Rn8obvxYGb7I7zP0BkgrmKMT0GpghkVnMdu0pW
 TOZWmtmH0lt8klh2E+Q30VzVMvv8YkQuVYs8oF5ADsuYuM/MMRlxJvBueDL0N4vkKNGq
 3m5zy4FljfE2yigITLay3JkFsXajNPlOdLTYmWp3IbTJijoGx2xZykFxfWYPayDRzNjt
 zjc08QcTD5qayrToZMPVhpgu5RPxGu1IsS9ip2pPod25MHvWWHEh5NUdxAhegfGhCxYm
 Yk+zOknSCrLwUtn6EPB0r/brUlAPdE1Fy82MqY4P8cq2ZKY7LvZ2CPylrP7/Fr7SHMgB
 5ZVg==
X-Gm-Message-State: AOAM531yh4SJBHQDkpFyIhngU/xt3wA1qwskq/u8v8aSdqTvMMuBjnJs
 lDsUmeqr6xVqOmvFP9Nj5WEAoQ==
X-Google-Smtp-Source: ABdhPJzrMNz8kG6pYoBfSNtpQG/SHDFYR5k7N9SwSYjtb9EG5VRQTM6Azj18d7UT5qM1jxuDzdB3Vg==
X-Received: by 2002:a05:6e02:1caa:: with SMTP id
 x10mr15637859ill.249.1643741356967; 
 Tue, 01 Feb 2022 10:49:16 -0800 (PST)
Received: from [192.168.1.128] ([71.205.29.0])
 by smtp.gmail.com with ESMTPSA id t7sm18534614ilu.37.2022.02.01.10.49.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 10:49:16 -0800 (PST)
Subject: Re: [PATCH] kselftest: alsa: Declare most functions static
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shuah Khan <shuah@kernel.org>
References: <20220201181530.2405077-1-broonie@kernel.org>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <d511cfff-5a0b-38e5-d1f3-b1f47ee8e596@linuxfoundation.org>
Date: Tue, 1 Feb 2022 11:49:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220201181530.2405077-1-broonie@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
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

On 2/1/22 11:15 AM, Mark Brown wrote:
> This program has only one file so most functions can be static.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
> This depends on my previously posted patch adding coverage of events:
> 
>    https://lore.kernel.org/all/20220201151551.21497-1-broonie@kernel.org/
> 
>   tools/testing/selftests/alsa/mixer-test.c | 58 ++++++++++++-----------
>   1 file changed, 30 insertions(+), 28 deletions(-)
> 

Thank you Mark. That was quick.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

