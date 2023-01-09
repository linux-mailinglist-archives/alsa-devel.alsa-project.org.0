Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E748166294E
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 16:05:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6481DB203;
	Mon,  9 Jan 2023 16:04:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6481DB203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673276736;
	bh=2/4D4iDRiOUXZN7pZYqgVuH+kh0cotwdMGqSwyloW9k=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YjzZAlS1o4Yhf2z3FzKNwfPjvPrL9V5MFJmjbM2IjNCPspuHTssnegIP7ilcPB991
	 lUkOZjZceSBDBLUfC6mim3kR3p79Mxw8MrucKlEfGK0L74NLmR8YP6Rco+lfTcHM1b
	 K5okr2N05NaUFcLRXWj2AsoAoLs2DBtCioHfdqi0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9CD1F802BE;
	Mon,  9 Jan 2023 16:04:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D42ABF8030F; Mon,  9 Jan 2023 16:04:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A5B0F8026A
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 16:04:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A5B0F8026A
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256
 header.s=default header.b=qbD1ZBfL
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id C0A0EA0042;
 Mon,  9 Jan 2023 16:04:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz C0A0EA0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1673276672; bh=yM+03FSHnu9RNBHhrGm0JoZhagoJhPvzZUzRzaEddh4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qbD1ZBfLOLOiEnpFF8zUlHyoe3jZBctEV2XWgaQcMxaLhoDGqA38dVpjF981wT6qF
 sMd7lU7APhX2qsSV1p5vEO+ctMaN3DQXycKWzRS7tY1jKpuczWOEzZSjqD+d2tjTvc
 uGa9rbVPluwcvVBauwp7DGxdzQO3cT4xkkJwYy2M=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  9 Jan 2023 16:04:28 +0100 (CET)
Message-ID: <b5cf8bd4-4659-42f3-2f36-d94c1d587068@perex.cz>
Date: Mon, 9 Jan 2023 16:04:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] ALSA: control-led: use strscpy in set_led_id()
Content-Language: en-US
To: ALSA development <alsa-devel@alsa-project.org>
References: <20230109134724.332868-1-perex@perex.cz>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230109134724.332868-1-perex@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Takashi Iwai <tiwai@suse.de>, yang.yang29@zte.com.cn,
 stable@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 09. 01. 23 14:47, Jaroslav Kysela wrote:
> The use of strncpy() in the set_led_id() was incorrect.
> The len variable should use 'min(sizeof(buf2) - 1, count)'
> expression.
> 
> Use strscpy() function to simplify things and handle the error gracefully.
> 
> Reported-by: yang.yang29@zte.com.cn
> BugLink: https://lore.kernel.org/alsa-devel/202301091945513559977@zte.com.cn/
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> ---
>   sound/core/control_led.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/core/control_led.c b/sound/core/control_led.c
> index f975cc85772b..45c8eb5700c1 100644
> --- a/sound/core/control_led.c
> +++ b/sound/core/control_led.c
> @@ -530,12 +530,11 @@ static ssize_t set_led_id(struct snd_ctl_led_card *led_card, const char *buf, si
>   			  bool attach)
>   {
>   	char buf2[256], *s, *os;
> -	size_t len = max(sizeof(s) - 1, count);
>   	struct snd_ctl_elem_id id;
>   	int err;
>   
> -	strncpy(buf2, buf, len);
> -	buf2[len] = '\0';
> +	if (strscpy(buf2, buf, min(sizeof(buf2), count)) < 0)

Please, don't use this version of path (see v2). This min() expression will 
strip the last char and buf is '\0' terminated.

v2: https://lore.kernel.org/alsa-devel/20230109150119.342771-1-perex@perex.cz/

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
