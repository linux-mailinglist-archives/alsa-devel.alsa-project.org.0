Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6A278C68C
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 15:59:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 471B5203;
	Tue, 29 Aug 2023 15:58:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 471B5203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693317572;
	bh=sefzA6lHX9WhOFekAvzBQoQKCW95zWs4KDR1la/OkEM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EpiOLtovtJD+8SyK/04zAaeEOz3MoCrQ6fpr954SFIe0nyAm4ICIDBLHCsjutbGCB
	 d9mUrr3Q7EEBgRKA9tgia1/jefe2cmGNsxmgJUdRl5AXVzU+OrWHI6lUPijYNOd7/n
	 2CqnQD0vFLvLiJvnpmA7YarNkoxM5ScBR22Nfuss=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6A4BF8025F; Tue, 29 Aug 2023 15:58:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46706F80155;
	Tue, 29 Aug 2023 15:58:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F359F80158; Tue, 29 Aug 2023 15:58:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C3A61F800D1
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 15:58:35 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 9C5FD11E2;
	Tue, 29 Aug 2023 15:58:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 9C5FD11E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1693317514; bh=fw7kT4B2xO97uvmzT0hQyodChWYHB31Fb+kKilpsA2I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QoAWnxQZ7Yull+m8HU+fgClKG+qgFcKiVoULaU7Ifm8Im0qx7baVXId+3jDY2MFRy
	 52l248YtlIKk0w5wqMuq3xkcFtyhMCA4AsA31NqjD0M0urJAC9ZNIcfI+AkjZsNa1A
	 fZ4XsrTS7oSKNWnyBilytowLnPP3ID0emsZfIQz4=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 29 Aug 2023 15:58:31 +0200 (CEST)
Message-ID: <1ab46008-2a1c-8e01-bb6c-7ef75d26c08d@perex.cz>
Date: Tue, 29 Aug 2023 15:58:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ALSA: pcm: Fix missing fixup call in compat hw_refine
 ioctl
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Cc: Meng_Cai@novatek.com.cn
References: <20230829134344.31588-1-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230829134344.31588-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: BACGOF6XXQP4QO6AYKP7KISTVGGLG27F
X-Message-ID-Hash: BACGOF6XXQP4QO6AYKP7KISTVGGLG27F
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BACGOF6XXQP4QO6AYKP7KISTVGGLG27F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29. 08. 23 15:43, Takashi Iwai wrote:
> The update of rate_num/den and msbits were factored out to
> fixup_unreferenced_params() function to be called explicitly after the
> hw_refine or hw_params procedure.  It's called from
> snd_pcm_hw_refine_user(), but it's forgotten in the PCM compat ioctl.
> This ended up with the incomplete rate_num/den and msbits parameters
> when 32bit compat ioctl is used.
> 
> This patch adds the missing call in snd_pcm_ioctl_hw_params_compat().
> 
> Reported-by: Meng_Cai@novatek.com.cn
> Fixes: f9a076bff053 ("ALSA: pcm: calculate non-mask/non-interval parameters always when possible")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   sound/core/pcm_compat.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
> index 42c2ada8e888..c96483091f30 100644
> --- a/sound/core/pcm_compat.c
> +++ b/sound/core/pcm_compat.c
> @@ -253,10 +253,14 @@ static int snd_pcm_ioctl_hw_params_compat(struct snd_pcm_substream *substream,
>   		goto error;
>   	}
>   
> -	if (refine)
> +	if (refine) {
>   		err = snd_pcm_hw_refine(substream, data);
> -	else
> +		if (err < 0)
> +			goto error;
> +		err = fixup_unreferenced_params(substream, data);
> +	} else {
>   		err = snd_pcm_hw_params(substream, data);
> +	}
>   	if (err < 0)
>   		goto error;
>   	if (copy_to_user(data32, data, sizeof(*data32)) ||

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

