Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 122E44AC8A1
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Feb 2022 19:33:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A940185E;
	Mon,  7 Feb 2022 19:32:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A940185E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644258828;
	bh=4AkJhKcTG1eAcSCAESumZzfpHv2pBQn/dIfra0MV2zw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qtbRXwasvMbjHcmjNp29LtCQnCTRWsuEpgdm40N/7eDNURlNcpfykpK9U25DVhsD7
	 BtYuRb97oruMyWINdpLpl2FkVl1Kp1bbMzqYxPNMCCOrpQqEvwZaNC6kUuA9hHUYws
	 ji7qt+OVqbF3PvowwLfc9+97OYU0bySt4yKmjB30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14C4FF800E9;
	Mon,  7 Feb 2022 19:32:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29A05F80240; Mon,  7 Feb 2022 19:32:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D238F800E9
 for <alsa-devel@alsa-project.org>; Mon,  7 Feb 2022 19:32:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D238F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="Dj8tHg/5"
Received: by mail-io1-xd2a.google.com with SMTP id d188so18001808iof.7
 for <alsa-devel@alsa-project.org>; Mon, 07 Feb 2022 10:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lHF1VpH0DQWDH5n7whaT5A/13tsAV04BQTsvPAisIH0=;
 b=Dj8tHg/5t1JB+owhj2ZjiEZL01octdxE8ToKWyyO+Mc27jiSIyo4407/YMOcfmzSnt
 p17FI0FIsTEzmPy2Y5xTPdNLD097MXmh1K+EyMfe5VjMNf1/JZ3EH0bidk6DQhir9imY
 vQWBjEHVY4rmWu/aXT0leiUl8vc/d8lFpNc4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lHF1VpH0DQWDH5n7whaT5A/13tsAV04BQTsvPAisIH0=;
 b=pRz6SBVm97BTA9kqlRC6+Ljgm9RjDOV9lbUPTu+1PbTIzKovqQde37PFSTLkEoePDA
 qqAOuIOVQ940cqxhBwQMf43PEvF6i40KLyRVwGIbBYdrVRHIE4BtYcJPYwqha+jM523L
 7Z0smFXhO8CLT+WbbCJIhCLOxUY+UXbImntpiq00lndv0GveDEuxysxfCZj2o8hrSUnk
 av7A+7sNkG6Jybo2uZwjB27+izu4UlPucPZfJ8nFmDOBdm41mjS7cSqz2P6qNe4RHRTV
 4MsPlu5PU9+CeW84G3f9iD/RWYcB5TVl5ozSQNkkrnerXovGhubLE//qo3+EIPPk8qN/
 Yong==
X-Gm-Message-State: AOAM530om6sYkl5mFtoT+glTfNgUB+UTXgfFde0gvHn66Mgg07z/Xaai
 8S3AXmFA+Ei1M+6MjFDTngRLZA==
X-Google-Smtp-Source: ABdhPJwAi7OgegFLvzLu3DSbiMS8FE+D6rNCLKTStU8ZEgIomXfkDkIRujGcZ3DVxw92MTT9otWwPQ==
X-Received: by 2002:a5e:c20b:: with SMTP id v11mr398967iop.197.1644258753611; 
 Mon, 07 Feb 2022 10:32:33 -0800 (PST)
Received: from [192.168.1.128] ([71.205.29.0])
 by smtp.gmail.com with ESMTPSA id c11sm1632610iln.56.2022.02.07.10.32.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 10:32:33 -0800 (PST)
Subject: Re: [PATCH][next] kselftest: alsa: fix spelling mistake "desciptor"
 -> "descriptor"
To: Colin Ian King <colin.i.king@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shuah Khan <shuah@kernel.org>, alsa-devel@alsa-project.org,
 linux-kselftest@vger.kernel.org
References: <20220207092235.240284-1-colin.i.king@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <3c47e21f-45de-1bd1-a547-225b3ef0ebc0@linuxfoundation.org>
Date: Mon, 7 Feb 2022 11:32:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220207092235.240284-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
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

On 2/7/22 2:22 AM, Colin Ian King wrote:
> There are some spelling mistakes in some ksft messages. Fix them.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   tools/testing/selftests/alsa/mixer-test.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 

Looks good to me. If it goes through sounds tree:

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah


