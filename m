Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE55EF3C3
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 03:57:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 731701714;
	Tue,  5 Nov 2019 03:56:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 731701714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572922632;
	bh=yAzVytdiNqjcqQhVhTW3J101uadvi019uDrNXnEDuP4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KG1WShre+zNzephtQSEgMzyLtjHUu/86ip8HH+r1ddIY/bjoISHzmDmBwuxXRR3Ag
	 4Rh13q6bpIePPWyLJ4/YWWy8MJvl16pMjWuWMdg8Ponx0Y6/PTaxnyVf4oOZkfPN9u
	 gk9yLWbZij5GSZWwyZMrIBSKgJ5xgUDi0XVFFaWM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A916F8049B;
	Tue,  5 Nov 2019 03:55:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FAA2F8049B; Tue,  5 Nov 2019 03:55:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3467EF8015B
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 03:55:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3467EF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="F4GMpQBC"
Received: by mail-il1-x142.google.com with SMTP id w1so7985826ilq.11
 for <alsa-devel@alsa-project.org>; Mon, 04 Nov 2019 18:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8xv8ahGLcFkFEb+5ui4KF1A+NaNyAKTo8+ZrhMG6bno=;
 b=F4GMpQBCq8jseQ+XvJVSAtoxbTYlpExCsXJcPORKjAG5NdJqu3qu2ngBxUZPAw0gva
 1NDbiOvH869t3XJEFuUWBmE5PrjS0+NRIiTAjPvrfsHNYxO/VD8xXInhtcM1IFbJ8pvB
 LMqdrerpVrjYAZzKHxbekDk697syXU3lFi1THzDOatjVR4Di5l92UyTQuU82+yzbitlS
 Z930BYb0nqIIQq+XjpY8bI9E59nuaK97TPjR6F8oKqpk9SnxRf2en05pftVDo3G8ysfp
 ThYTMIq57n+BHmZ4HLiSID9JH2ST+k4d8bWXXiOQcrXd2eW4/zLTC6tDe7Wwo71EGS97
 /pBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8xv8ahGLcFkFEb+5ui4KF1A+NaNyAKTo8+ZrhMG6bno=;
 b=VSpQYzYCC9DRKHtfeBoGi3Jz2dmNPB0RjKkdr1/CmibkGZjiVV9g9gEw+BAyVEonXU
 LkPT7vChUnkLf118EcwHUp6HBkR6bzFHx5qh6TN/t05j6yef7HlhARIRWuyQ0fHwkN5i
 furc3KS6rVrzXWB8DbtORGwns3jQbFZGt3firQWNMerBoXAUNAMzByOQLNd0DF1q5THJ
 6TxO3SdYxCurYEn3p54Om8itn3iqBWAQ0IJeg6JCKw5xiamqRaztsRejOb+e+6OwPGB0
 jU1D3baIQCwC9mZKBii5nPwknZc1PGQEO0QkwrUdaTDoxkgc/fXpyAhW/VX4C+v9hhHR
 tJRw==
X-Gm-Message-State: APjAAAU6v45V3b4IVEp3VfP9Z2gyU/gjI2VAXnrJhB5GpshZl/e1kAtX
 GCZKyIJXkiUxs0/dg0aWiV0y/DREGYvfam/3W5wuUnm5
X-Google-Smtp-Source: APXvYqx+0rP6Gnr6ofwpdtNrqPkqRcmEYXf8quoXVqOol3B9rSw8rJtlfquAqgiTqg5LNon1nsx57IrLES3d+KRwPTw=
X-Received: by 2002:a92:d64d:: with SMTP id x13mr14311214ilp.54.1572922515212; 
 Mon, 04 Nov 2019 18:55:15 -0800 (PST)
MIME-Version: 1.0
References: <874kzrdo1x.wl-kuninori.morimoto.gx@renesas.com>
 <8736fbdnwt.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <8736fbdnwt.wl-kuninori.morimoto.gx@renesas.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Mon, 4 Nov 2019 18:55:08 -0800
Message-ID: <CAFQqKeW3x1iL-jx3HHCBh_cUGmD543fMansX1x8EMNy==MOiNA@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v2 resend 01/18] ASoC: soc-core: remove
 unneeded snd_soc_tplg_component_remove()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Oct 29, 2019 at 6:28 PM Kuninori Morimoto <
kuninori.morimoto.gx@renesas.com> wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> snd_soc_tplg_component_remove() is pair of snd_soc_tplg_component_load(),
> and it is topology related cleanup function.
>
> The driver which called _load() needs to call _remove() by its
> responsibility.
> Today, skl-pcm and topology are the user, and these are calling both
> _load() and _remove().
>
> soc-core doesn't need to call it.
> This patch remove it.
>
Morimoto-san,

When I submitted changes for fixing module load/unload errors with SOF, I
had a patch that added this change. At that time, Mark commented that this
can be left as is to make the unregister_component() robust.

Mark, do you still think it should be left as is or are you OK to remove
this?

Thanks,
Ranjani

>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-core.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index f1b41b0..b07ecfa 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -2890,8 +2890,6 @@ static int __snd_soc_unregister_component(struct
> device *dev)
>                 if (dev != component->dev)
>                         continue;
>
> -               snd_soc_tplg_component_remove(component,
> -                                             SND_SOC_TPLG_INDEX_ALL);
>                 snd_soc_component_del_unlocked(component);
>                 found = 1;
>                 break;
> --
> 2.7.4
>
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
