Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA4B842E3
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 05:23:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99BCA857;
	Wed,  7 Aug 2019 05:22:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99BCA857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565148180;
	bh=0nCnpqyT+Do/E1xuHQUPofgSJAHLElVzXyhdSNQpB6E=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TOivmbMqcDncJjcz7lgxB5JxN1GjvxZA5iEU7J6m26a5f0g5RfzkgkF8aXxDZ7hD9
	 UvaevqsHSPu7LPSWb6m5Vv7HQv7bzuP406QPo5U7DnSlhU2UTw5gZ/m2OXaz+pIfTO
	 xc5UyII9KxPO48yrw1WjVimHyD6kss92SP2UAAsc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5873AF80227;
	Wed,  7 Aug 2019 05:21:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED0C8F80290; Wed,  7 Aug 2019 05:21:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1625EF800F4
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 05:21:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1625EF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="ZFyaS4Uy"
Received: by mail-yw1-xc44.google.com with SMTP id g19so31060800ywe.2
 for <alsa-devel@alsa-project.org>; Tue, 06 Aug 2019 20:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+qQ0USyczW1A8BOcG2ubyyoajzQ2U4QRLU+fY3GhcD4=;
 b=ZFyaS4UyFV8fdg1XNYIUkzHeZBfshfNjSpx3oGIukjFemmF085GKQ/aKKmVl7vMl/p
 KnjUKdMcSmVQlxjL51Dtf6tK2qqbXY3EBjoa0XeUOvYCP5cxIlsqeQCC30mfcPUJkt69
 zFSBoxkbLv3t/9+R7zCEDCj0jPCqVzBwH0m7WE8q8o76eKZbbueVaMsRCDL6FQiSXNbK
 tcK1RP88jY2qUxhoGTgGtdJKzkVJS1HUkmkRNa6tj7oYrewa9L4pSiGKbgquK9syzD4e
 vDPeVA8DujgOG+9hkeMDN8Ng3BusfwXnhg8zUSLPfiLpx2+1J0RXt9WXykFfXx0O+NB+
 babQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+qQ0USyczW1A8BOcG2ubyyoajzQ2U4QRLU+fY3GhcD4=;
 b=dlj+0YX55YKDY4hxbwCeRoYCu4+UR/mTt2bplXWnkI6pvct+FViDq/bkN2F2YlDoXV
 B/BfIRnWm86WbWjx9xnJ8m3PnjBElfO5TSg5xrM57klZ3vTaQ5tF2gE+DTk6fZ50+1Sd
 Qz+NmBEP2dYEQAtwRSuO9RBWgyGKUX2/wasFnKZ6WlRkFBu6qMGZp7bCE+VoKkL8AMAC
 JREHsxVl9/lygtfYs+ICUxzdZEaAKNA6bDJjUbH9RKvWt9XQ4J4q4HrKKPc2tbW7c2yv
 6UHGSEY8CcwUQ9tKAOx1rFxY5Y3FRKnWtk1G/kYvsUAjyRjWuhfqdHSh1QQwZ09y6xhU
 VMlA==
X-Gm-Message-State: APjAAAUClkdowpKtgLhPPKtbMsQpZd0SmBTuYDCiJTjWqLxaDxU2og3d
 gUaOqSzLyg+PH5GuKnNfwwnstKmDARBOlCSwv5c3dw==
X-Google-Smtp-Source: APXvYqyAkKvPFCN9GiikA6hIEY3JbGGytlJZ2sHJNvdc0WzD5bYJob3+O3NquDJYdx/Q/6PTZTviFP85ttTgAH5Fydo=
X-Received: by 2002:a81:9c53:: with SMTP id n19mr4420768ywa.137.1565148067796; 
 Tue, 06 Aug 2019 20:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <87pnlhahr6.wl-kuninori.morimoto.gx@renesas.com>
 <87pnlh9320.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pnlh9320.wl-kuninori.morimoto.gx@renesas.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Tue, 6 Aug 2019 20:20:56 -0700
Message-ID: <CAFQqKeWU0az5o6XRe1Ro40BiVtQ5JFL6PK83+wKMwjb4kdSwUw@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v2 25/25] ASoC: soc-topology: use
 for_each_component_dais() at remove_dai()
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

On Tue, Aug 6, 2019 at 6:48 PM Kuninori Morimoto <
kuninori.morimoto.gx@renesas.com> wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> commit 52abe6cc1866a ("ASoC: topology: fix oops/use-after-free case
> with dai driver") fixups remove_dai() error, but it is using
> list_for_each_entry() for component->dai_list.
>
> We already have for_each_component_dais() macro for it.
> Let's use exising method.
>
The series looks good now. Thanks for the quick turnaround, Morimoto-san.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> v1 -> v2
>
>         - no change
>
>  sound/soc/soc-topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> index dc463f1..b869071 100644
> --- a/sound/soc/soc-topology.c
> +++ b/sound/soc/soc-topology.c
> @@ -530,7 +530,7 @@ static void remove_dai(struct snd_soc_component *comp,
>         if (dobj->ops && dobj->ops->dai_unload)
>                 dobj->ops->dai_unload(comp, dobj);
>
> -       list_for_each_entry(dai, &comp->dai_list, list)
> +       for_each_component_dais(comp, dai)
>                 if (dai->driver == dai_drv)
>                         dai->driver = NULL;
>
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
