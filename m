Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A7152AC57
	for <lists+alsa-devel@lfdr.de>; Tue, 17 May 2022 22:00:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C499283D;
	Tue, 17 May 2022 21:59:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C499283D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652817602;
	bh=mXJ7G3pcDBgEYT231EA5HD8x5zociQQwV3WUSPIB2ds=;
	h=Date:Subject:To:References:In-Reply-To:From:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TBTq2mXAd1VNivu47qcm1O8akuluNUBXorhr9uHm2jsJ6zk1Ksqnysmv20nGAotdj
	 KFr1a9xkdbVICul3cJftA0GKBOknhxDkD4zdYCCU+fsGCu+SgNZ+ok1uv1EXZ2YtOi
	 QJUazoK6WNiUWGGUiSMtdAsTW5X1NgDm5drZbqa0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC026F800D8;
	Tue, 17 May 2022 21:59:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BA8BF802DB; Tue, 17 May 2022 21:59:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C45F8F800F0
 for <alsa-devel@alsa-project.org>; Tue, 17 May 2022 21:58:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C45F8F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nSUQMuEI"
Received: by mail-ed1-x536.google.com with SMTP id g12so287858edq.4
 for <alsa-devel@alsa-project.org>; Tue, 17 May 2022 12:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:in-reply-to:cc:from:content-transfer-encoding;
 bh=mXJ7G3pcDBgEYT231EA5HD8x5zociQQwV3WUSPIB2ds=;
 b=nSUQMuEI2xHqeSbHfwRKYzwbd1V0p7cZl2C+veGiM3JkwXor6dUmkxgzwWjVYNSNup
 WeSOovvuUb48whuk6WJPDWtvmkoby5UgOKdl6coQf3j449ENU/gKb6dAreFHN713eEm4
 nezG7t9LdDc6uWdRf9zx2uNoXl0DgiZ30dN+L0pGVjEdGp5iMaVb+5JlTawTjlmxnbWF
 mdNhlqDP6q55eaJNJa4WN/h3rcM/udibAWGzIVJctg/WYcjdGLEjl91kWTM0VZgtvmu/
 R40ZG9pc5SjxDaEk8vRjRFLeOqruGbzeNt5hL7tB3uGcX5pCCHHlIPbjYSEKo5bDPg/F
 CNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:in-reply-to:cc:from
 :content-transfer-encoding;
 bh=mXJ7G3pcDBgEYT231EA5HD8x5zociQQwV3WUSPIB2ds=;
 b=1AuxQR0g72SsgJfuXz8/w6RC2uRF1fLo/ug0CKhgdyliCjT5Z3iFlM8G6Jof4fBG/W
 Ce+ZDQE0VP2SC7ySxNgaXLDaHq2vhWeb1jPtEjD2jef3mnOXvdPQeginrQeTT3R6r6At
 v0JRchd6bWZiD3rtoHmes5WTIquzNd3oaXBVVWIbYsj4V1kXw9IOus6hr4c7YpB5j1cG
 dUoRJpPRaNoYPK9yHK2Arx1VYDXM10MWQoIigQS8eM3oA1iaZfEfhs7l7Dpo9AHu8XZP
 6F+NIZPS+YdD7Ieyd7M1EWV6d0464AZijLdAlW4swSTF9Z8M+JE/0l4cJaYcypN2pdNg
 3u4A==
X-Gm-Message-State: AOAM533Qr+t86qHH+fiJn5aIvf/tJP/7GT/9H0n4gHavR2Tu1hscBrUv
 vL9hauMCCfN4idalHkRGDC8=
X-Google-Smtp-Source: ABdhPJydxHDbx8WlKZIM9n+9FS4epjFiT45egbiXxDzWwLRT845F//NOfBUeciwimzMeJoBRDgrPIg==
X-Received: by 2002:a05:6402:2c3:b0:42a:ad46:aa33 with SMTP id
 b3-20020a05640202c300b0042aad46aa33mr14654414edx.385.1652817534019; 
 Tue, 17 May 2022 12:58:54 -0700 (PDT)
Received: from [192.168.1.110] ([178.233.88.73])
 by smtp.gmail.com with ESMTPSA id
 vf3-20020a170907238300b006f3ef214ddasm82974ejb.64.2022.05.17.12.58.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 12:58:53 -0700 (PDT)
Message-ID: <fde0dc8a-a861-3c8e-1316-cfa81affc19e@gmail.com>
Date: Tue, 17 May 2022 22:58:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] ASoC: ops: Fix the bounds checking in
 snd_soc_put_volsw_sx and snd_soc_put_xr_sx
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <c2163c71-2f71-9011-3966-baeab8e8dc8f@gmail.com>
 <20220517011201.23530-1-tannayir@gmail.com> <YoOdauC5Q8POpHLe@sirena.org.uk>
 <2f331adf-6f95-06c1-a366-ea81b5bf6ec2@gmail.com>
 <YoPnhDRMwoT42vS7@sirena.org.uk>
In-Reply-To: <YoPnhDRMwoT42vS7@sirena.org.uk>
From: =?UTF-8?Q?Tan_Nay=c4=b1r?= <tannayir@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marex@denx.de>, alsa-devel@alsa-project.org,
 stable@vger.kernel.org
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

I've debugged the kernel again after applying the fix in
698813ba8c58 ("ASoC: ops: Fix bounds check for _sx controls")
but it didn't fix the problem.

The commit message in your fix states this:
 > For _sx controls the semantics of the max field is not the usual one, max
 > is the number of steps rather than the maximum value. This means that our
 > check in snd_soc_put_volsw_sx() needs to just check against the maximum
 > value.

For some reason, this is not the case on my end.
Both the $platform_max and $max fields are set to the maximum value
of the range that is specified inside the codec code which is -84 to 40
and not the number of steps.
This was also the reason behind my patch to the bounds check.
