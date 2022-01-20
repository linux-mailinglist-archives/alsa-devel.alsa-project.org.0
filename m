Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8EF4956F3
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 00:24:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D06CD2E25;
	Fri, 21 Jan 2022 00:23:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D06CD2E25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642721065;
	bh=DsoBBDVe61/U78vQIsF6wIFiY8uR3kLTYkP8hwpbvCk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sgsKuK4u0ut4wR3rovq89zu4jPS/rYDpK6kx7PDz/AkrMzX+PQKF+zBklL+qBltFv
	 b13OjKfSfagkuAxljNcqtXW60miYyQ87E9Ou1qp2HNmVt8HgmqHRVPhTRO14pXJGuO
	 zch+SS1XwFu2BN5pgY2yTAW9o9HaJFW1DQjHbWYI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 505BBF80128;
	Fri, 21 Jan 2022 00:22:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31CE9F80128; Fri, 21 Jan 2022 00:22:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8203BF80128
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 00:22:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8203BF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="j4GGCU1L"
Received: by mail-pf1-x432.google.com with SMTP id y27so3077331pfa.0
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 15:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=egMwIptYpGbsC4XxY+2pETIXKwRmweD4aAOClQc8FOg=;
 b=j4GGCU1LW7aQgvrd+Lz43oPyrQTqCIyQoc6damDU85BEiX4EjPHox+J6XMEr6p37Ug
 FUVyNP5vcpMg6VQVjWSQsAXBlSyyHvX1azVDGc6U6R65pQjxW9MeXOI5KViTR8vEFY8o
 ANrlB37o2SeyYSXsKBblX32sWYT9tDRU319IY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=egMwIptYpGbsC4XxY+2pETIXKwRmweD4aAOClQc8FOg=;
 b=T9SHT/Njr/qHAz0mo2VCcL4ocXJpF1zPtT0wnWXQi2mXA4ms0ougYGnfsm7RtdQQzD
 vXd2Ec97q7I/RxkB50jYEAxIXJXfH1UXk8E/vrAvfA8vV5x9oCgF5sfDoBTpPSynL2my
 2UqlhJ4cmeclwVOqHpa4ut1AN1p6DqgKhziz17TQLRLFjhg8xxoVu90sBgCQNayr1C94
 x5qw/mgvS73JU5aSbQuCZ7EkHsXCXzBI+XyWGPz3dxqvbhZAJJN7Fu/935R5fCqKp9yv
 LwgE6EYA8a/CyzL7JM5dnSUbd8VA/9IEP0eIywSJOFbIfCGEy60dH5s7rtjqYVwwd5mD
 ixjA==
X-Gm-Message-State: AOAM531WfImeLMZhEGQXlixmrkAfW2UHQfetVKvu92AgPVtX29snbIdN
 qH30cH52GW/QG94SMyE3od5NaAwEFSYGNQ==
X-Google-Smtp-Source: ABdhPJym1c+5Elx/jqSx5/twwAq6/wX0UlB8jSjMP5BZBOA7fq0C2i3GvWJv84TUYMV6NEMTCS4VFg==
X-Received: by 2002:a63:1d7:: with SMTP id 206mr840156pgb.111.1642720932694;
 Thu, 20 Jan 2022 15:22:12 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id x18sm3202700pgj.41.2022.01.20.15.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 15:22:12 -0800 (PST)
Date: Thu, 20 Jan 2022 15:22:11 -0800
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v2][next] ALSA: usb-audio: scarlett2: Use struct_size()
 helper in scarlett2_usb()
Message-ID: <202201201522.5E744C15E9@keescook>
References: <20220120211600.GA28841@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220120211600.GA28841@embeddedor>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org,
 "Geoffrey D. Bennett" <g@b4.vu>
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

On Thu, Jan 20, 2022 at 03:16:00PM -0600, Gustavo A. R. Silva wrote:
> Make use of the struct_size() helper instead of an open-coded version,
> in order to avoid any potential type mistakes or integer overflows that,
> in the worst scenario, could lead to heap overflows.
> 
> Also, address the following sparse warnings:
> sound/usb/mixer_scarlett_gen2.c:1064:28: warning: using sizeof on a flexible structure
> sound/usb/mixer_scarlett_gen2.c:1065:29: warning: using sizeof on a flexible structure
> 
> Link: https://github.com/KSPP/linux/issues/174
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Looks good to me!

Reviewed-by: Kees Cook <keescook@chromium.org>

> ---
> Changes in v2:
>  - Use correct format specifier %zu for type size_t argument.
> 
>  sound/usb/mixer_scarlett_gen2.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
> index 53ebabf42472..7ff8a4817c67 100644
> --- a/sound/usb/mixer_scarlett_gen2.c
> +++ b/sound/usb/mixer_scarlett_gen2.c
> @@ -1061,9 +1061,9 @@ static int scarlett2_usb(
>  {
>  	struct scarlett2_data *private = mixer->private_data;
>  	struct usb_device *dev = mixer->chip->dev;
> -	u16 req_buf_size = sizeof(struct scarlett2_usb_packet) + req_size;
> -	u16 resp_buf_size = sizeof(struct scarlett2_usb_packet) + resp_size;
>  	struct scarlett2_usb_packet *req, *resp = NULL;
> +	size_t req_buf_size = struct_size(req, data, req_size);
> +	size_t resp_buf_size = struct_size(resp, data, resp_size);
>  	int err;
>  
>  	req = kmalloc(req_buf_size, GFP_KERNEL);
> @@ -1111,7 +1111,7 @@ static int scarlett2_usb(
>  		usb_audio_err(
>  			mixer->chip,
>  			"Scarlett Gen 2/3 USB response result cmd %x was %d "
> -			"expected %d\n",
> +			"expected %zu\n",
>  			cmd, err, resp_buf_size);
>  		err = -EINVAL;
>  		goto unlock;
> -- 
> 2.27.0
> 

-- 
Kees Cook
