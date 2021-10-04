Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0980B42078B
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 10:46:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CD131690;
	Mon,  4 Oct 2021 10:46:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CD131690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633337217;
	bh=rWrqEGh/cZq4hcrLd7cqC0rOQXLLK99gk10HWa4Ocn8=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dpp1j2z+rVlUu+J+jqX3H8Od90YVsWXOxszyLRnOglmQNadjkJVx1mktNZVo2pYL8
	 Las1jtoUVgFe20R0VhQNGgfov40wnVhKKw0YrAt0dVkguJLDM1l3wt9qWI7pVP/lr/
	 WKNI3XXpKu/gtMHT20TJCTZKIkFGZZNm1KyeaMt4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FA23F80249;
	Mon,  4 Oct 2021 10:45:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09D6BF80240; Mon,  4 Oct 2021 10:45:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54B3AF80171
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 10:45:29 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 990BAA003F;
 Mon,  4 Oct 2021 10:45:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 990BAA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1633337128; bh=GyxVEALYjAZmDQ/V4158CFwkWVvEKHOCKxihnfuJl8Q=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=meHn+LHgxY+OTS3tGlHUSfQaRovK1KZEkv8fnFmEqIdCe50Wep4dXvK98zlI6ehVO
 qnsLxBAgyOkJl0TGRGSrc3Wb4/CdBC29Wdqu3TcHrOiAJz8ZZQOlO0m6q7nxEj0bCA
 47r+vf5toORPEbyIM1xkShQcz3kLK+uvN2xJo2bc=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  4 Oct 2021 10:45:26 +0200 (CEST)
Message-ID: <c350bd52-8be4-fceb-15b1-30692f9d7f49@perex.cz>
Date: Mon, 4 Oct 2021 10:45:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] alsaloop: Adding openctl_elem debug log
Content-Language: en-US
To: Pavel Hofman <pavel.hofman@ivitera.com>, alsa-devel@alsa-project.org
References: <20211001080028.6423-1-pavel.hofman@ivitera.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20211001080028.6423-1-pavel.hofman@ivitera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 01. 10. 21 10:00, Pavel Hofman wrote:
> When debugging what ctl elem was found and opened (if any) a debug log is
> helpful.
> 
> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
> ---
>   alsaloop/pcmjob.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/alsaloop/pcmjob.c b/alsaloop/pcmjob.c
> index 8b72af4..845ab82 100644
> --- a/alsaloop/pcmjob.c
> +++ b/alsaloop/pcmjob.c
> @@ -1191,6 +1191,11 @@ static void openctl_elem(struct loopback_handle *lhandle,
>   		if (err < 0) {
>   			snd_ctl_elem_value_free(*elem);
>   			*elem = NULL;
> +		} else {
> +			if (verbose)
> +				snd_output_printf(lhandle->loopback->output,
> +						"Opened PCM element %s of %s, device %d, subdevice %d\n",
> +						name, snd_ctl_name(lhandle->ctl), device, subdevice);
>   		}
>   	}
>   }
> 

Applied. Thank you.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
