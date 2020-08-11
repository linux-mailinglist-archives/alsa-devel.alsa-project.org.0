Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C88432415D7
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 06:47:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60F501663;
	Tue, 11 Aug 2020 06:46:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60F501663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597121239;
	bh=KJfozLsPQmXY/Ryjs0t1TRyeZGRC+tF+acl8da599GI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b6pTl/ZcG0tC4ZRC7ySBMyxKQT/4haoU2DMtNkfODD9KTK3GMhmBT5olRXeIFJSQB
	 jBXGye7qCx4/y/y9JaXMRLCayRt6FKq5vK8oospioKi8wBkmlhgRymPdmfgoUbSfQH
	 pToYML515bnaS8B4K81pXTKP5xGgeypPQfrfxlZU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C4C4F800D3;
	Tue, 11 Aug 2020 06:45:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38892F8015B; Tue, 11 Aug 2020 06:45:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07D0BF800D3
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 06:45:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07D0BF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Y8VmEFJg"
Received: by mail-ot1-x342.google.com with SMTP id v6so9108449ota.13
 for <alsa-devel@alsa-project.org>; Mon, 10 Aug 2020 21:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VqVbGEH3UM5W74LK5BYMJAi0qG6NT8kxjb6h52vXXjs=;
 b=Y8VmEFJgqeWxuKNnvxxPmnnjkAAWN7OtYZcooQWrZyEusHw512CnizqB+0KfRQ4Bsu
 alrl+DBjyjvCzneq7SQQiZjpRXuynwoqkfJOkDOZuqK3jxkJGKfwg+FovRrjaLK2cRjw
 L8rS00ivq5ZwpoSwIWLKH9TpOkjps8GkiEzVovMUN9Yc7hXt+0zck3q5fNWFXIE1O5Zx
 yauWcPTUYSLMJPq8pbHklbSGZr3i3A5xHkP+W5O0SVSl9kXLQFqsuVS2+BT5cG4r+qZI
 knDDWXYG+pDvWinbKFB3YyKJsh7TJjaPq0PhizmO2DUsP0CPKolM9qsE/jhOeW03wV3C
 7aIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VqVbGEH3UM5W74LK5BYMJAi0qG6NT8kxjb6h52vXXjs=;
 b=SM6VPamipLWIYKcuYcwoTnzjaIGmCUx7gyDvFQPnGI5J/4TSpg8ofcA8Ty6X+kbKzv
 jQISGhCwioRqNuJtIhLwJSBisIseRP1D2Q8Dn0rnnev3diWemYsT67jksla4Jg4IVPZI
 UDaPDDrM0eDc2CoMwkR7s4Kimuc/jeXAAGyPbyT8hD0z70hNYMnoqdYy4NGd/KkLjBrg
 dWW5PwJXfky2PE3iZH6Ub8RP0SG8qkAFcxmoDFWsoYMdZfDxp6C1+pIVP4SzkpZsWERG
 kkZGFiBYjZ6cwXVXStIOMKsBx2Z8XqSIffNd5aibprkKUeek4LMQgYZD86btgJo+Aqhz
 p5rw==
X-Gm-Message-State: AOAM533KAguNiGQT8F7Oh3zAhbPiTTSOMa4Z02nep1f+QM3tHWG5AiRR
 pgWS28USSZ6TIxh2vD52zNRWra9CUptKWNuItnNf7A==
X-Google-Smtp-Source: ABdhPJwWXZ3sF73ZeSu9WT0Jxp3tauIxDxId+08ZJhL0GRHm8DwKu8BHvvoQQTX+1bFqIbo4Rk8KGA6CZD5ZmgA65Ig=
X-Received: by 2002:a05:6830:3196:: with SMTP id
 p22mr3767761ots.102.1597121125470; 
 Mon, 10 Aug 2020 21:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200810134631.19742-1-tiwai@suse.de>
In-Reply-To: <20200810134631.19742-1-tiwai@suse.de>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 10 Aug 2020 21:45:14 -0700
Message-ID: <CALAqxLU_wTTqn9=0O2kaeOOTnGAuwOtWfupr9MusX=TceKW=hg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Make soc_component_read() returning an error code
 again
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

On Mon, Aug 10, 2020 at 6:53 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> Along with the recent unification of snd_soc_component_read*()
> functions, the behavior of snd_soc_component_read() was changed
> slightly; namely it returns the register read value directly, and even
> if an error happens, it returns zero (but it prints an error
> message).  That said, the caller side can't know whether it's an error
> or not any longer.
>
> Ideally this shouldn't matter much, but in practice this seems causing
> a regression, as John reported.  And, grepping the tree revealed that
> there are still plenty of callers that do check the error code, so
> we'll need to deal with them in anyway.
>
> As a quick band-aid over the regression, this patch changes the return
> value of snd_soc_component_read() again to the negative error code.
> It can't work, obviously, for 32bit register values, but it should be
> enough for the known regressions, so far.
>
> Fixes: cf6e26c71bfd ("ASoC: soc-component: merge snd_soc_component_read() and snd_soc_component_read32()")
> Reported-by: John Stultz <john.stultz@linaro.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/soc/soc-component.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
> index f0b4f4bc44a4..5504b92946e3 100644
> --- a/sound/soc/soc-component.c
> +++ b/sound/soc/soc-component.c
> @@ -406,7 +406,7 @@ static unsigned int soc_component_read_no_lock(
>                 ret = -EIO;
>
>         if (ret < 0)
> -               soc_component_ret(component, ret);
> +               return soc_component_ret(component, ret);

So oddly, using this instead of just "return ret;", doesn't seem to
fully resolve the issue for me. It's baffling!

My only guess is at boot up I get a *ton* of error messages:
  q6routing remoteproc-adsp:glink-edge:apr:apr-service@8:routing:
ASoC: error at soc_component_read_no_lock on
remoteproc-adsp:glink-edge:apr:5
which I suspect is causing other failures due to timing issues.

Srini sent me a patch to provide dummy read functions for the routing
and dai components that were missing it, and that seems to properly
avoid the issue.

thanks
-john
