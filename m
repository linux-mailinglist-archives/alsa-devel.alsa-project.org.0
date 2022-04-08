Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A342A4F8F54
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 09:16:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BB281702;
	Fri,  8 Apr 2022 09:16:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BB281702
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649402212;
	bh=6466gEGhxznW7rwa3hxyltu9py8601v4dqiiQAcvWk0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h4iCA1G/aEZn+vfn3rqcSYRcbZS6Eaw7p0RfLqB2vV/cHyp/qfYH++p07vLJnLfqX
	 q9xues3xLI4vUy8b32Dpbvju3S8xTgno9zghwUmHr09PL4cuhLzOl/vE8t28cydaS7
	 mDwnZ/DcfedP78Y7sYi6BWns0GCCg7jZC8n9JRHA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B218DF8012A;
	Fri,  8 Apr 2022 09:15:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AEF5F8014E; Fri,  8 Apr 2022 09:15:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11403F80054
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 09:15:42 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id C3043A003F;
 Fri,  8 Apr 2022 09:15:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz C3043A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1649402141; bh=rjFZNSHy7qwYLLuTgA1fJ9Peq7sBnKo73nRP4i9Z6NY=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=dxarWlC7r9ol4cGzW0VGZRY+mEDK/sHwYilZvBkoF21G6hoHoyImz8927rwEPQmEp
 7XIIADIS7ZiWz5umk8THtU2HOwOVT77WU/Rrpc/Q17Ch6c1R24mHxwAj1cgHK8znVw
 VCqFZGkCJn9wIIKi7peKp3KQtK+v8gas0IxCH2ic=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri,  8 Apr 2022 09:15:39 +0200 (CEST)
Message-ID: <31de7ea6-5319-7f9e-81a1-f0b501d5bdf9@perex.cz>
Date: Fri, 8 Apr 2022 09:15:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ALSA: usb-audio: Increase max buffer size
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220407212740.17920-1-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20220407212740.17920-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>
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

On 07. 04. 22 23:27, Takashi Iwai wrote:
> The current limit of max buffer size 1MB seems too small for modern
> devices with lots of channels and high sample rates.
> Let's make bigger, 4MB.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

Thanks,
	Jaroslav

> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   sound/usb/pcm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
> index 6a460225f2e3..37ee6df8b15a 100644
> --- a/sound/usb/pcm.c
> +++ b/sound/usb/pcm.c
> @@ -659,7 +659,7 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
>   #define hwc_debug(fmt, args...) do { } while(0)
>   #endif
>   
> -#define MAX_BUFFER_BYTES	(1024 * 1024)
> +#define MAX_BUFFER_BYTES	(4 * 1024 * 1024)
>   #define MAX_PERIOD_BYTES	(512 * 1024)
>   
>   static const struct snd_pcm_hardware snd_usb_hardware =


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
