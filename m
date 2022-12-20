Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 558DE651F85
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Dec 2022 12:14:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9379190F;
	Tue, 20 Dec 2022 12:13:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9379190F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671534884;
	bh=MGLIoFBZ/iURgA2MYAqeN653sQ3hicilRZiZI9g1H2E=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r7xCUElFXJB5iZpJT2M9JrFomz0aP0w/dS2HO4a4AlGgz894LAQoTe/Ke5i5AFWbz
	 1fIvoVUDf1NP+802dWVNTQPJn05ijB4Xm1jdUdoEeX9fjVeFfoXw5wZQIWoelFI9wi
	 UeKFrfIGIYidr0l+OYT15Y8N9T06AmqH2yRLwk48=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72D1FF8026D;
	Tue, 20 Dec 2022 12:13:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 992E2F8032B; Tue, 20 Dec 2022 12:13:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C094AF801C0
 for <alsa-devel@alsa-project.org>; Tue, 20 Dec 2022 12:13:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C094AF801C0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=axis-central1 header.b=iIHhvIP5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1671534825;
 x=1703070825;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=KhmEjt73m0ueToJQBxXGSodm6fZTMjgUskYZOk86X8s=;
 b=iIHhvIP5Fy2gqfUEungyaVj8SyEC7Dmle1S6V7xKsJtvoUVV20xbxwqm
 MCDbMKi1Gk535wgAWnQRoJ22TGTQon8U3Js/gktBN1Q6d5DF6ypyYAdPn
 8UMH27gwvmTgaOg/o/P6QzHY7TlZeJj0Gc7jfA4Jt04P7x3FZ/yWPzCl7
 IJU5cb4LGE7jEPaJu7L8BE/cnbhkPsxwPEfOTRLPDKTlYZeb3nJUYHX93
 Pis0iNWY/KI6+suVCSqNqw50I/fvx/m5xlwys0lcUCU+6Ey/RJx8Fb8K+
 lZXqqs0Zudq21303hsAiSVUWHSqXDk5R/g1ck+t2ej7cyV6wMwAEAhivu g==;
Message-ID: <bd963935-f5ef-1e05-b91d-256e1fb74e26@axis.com>
Date: Tue, 20 Dec 2022 12:13:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] pcm: hw: Do not return error unless there is one
 (regression)
Content-Language: en-US
To: <alsa-devel@alsa-project.org>, <perex@perex.cz>, <tiwai@suse.de>
References: <20221216082613.2439067-1-jonashg@axis.com>
From: Jonas Holmberg <jonashg@axis.com>
In-Reply-To: <20221216082613.2439067-1-jonashg@axis.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

On 2022-12-16 09:26, Jonas Holmberg wrote:
> Add a line that was removed by mistake in commit
> 7f2d6c3aac3505ceee4b0d3e8b3ca423ce29b070.

Note that this is a regression in rate-handling in hw_refine since 
v1.2.6.1, which for example breaks a hw pcm with rate set in config 
slaved to dmix.

BR
Jonas

> 
> Signed-off-by: Jonas Holmberg <jonashg@axis.com>
> ---
>   src/pcm/pcm_hw.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/src/pcm/pcm_hw.c b/src/pcm/pcm_hw.c
> index 0588ce5e..daa3e1ff 100644
> --- a/src/pcm/pcm_hw.c
> +++ b/src/pcm/pcm_hw.c
> @@ -356,7 +356,7 @@ static int snd_pcm_hw_hw_refine(snd_pcm_t *pcm, 
> snd_pcm_hw_params_t *params)
>           if (hw->rates.min > 0) {
>                   err = _snd_pcm_hw_param_set_minmax(params, 
> SND_PCM_HW_PARAM_RATE,
>                                                      hw->rates.min, 0, 
> hw->rates.max + 1, -1);
> -
> +               if (err < 0)
>                           return err;
>           }
> 
> -- 
> 2.37.4
> 

