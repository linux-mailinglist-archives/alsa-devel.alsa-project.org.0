Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A61A326B6
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 04:42:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55167166C;
	Mon,  3 Jun 2019 04:41:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55167166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559529759;
	bh=yQas8m2qKEFuJt2R/gWjwNvv0bkiHYqYW3wPQNVohzw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=khtHrhcZU4ahOLXLZiOaTrQcm+BwWPrntghQ6pWxxuHFxiQyPJVC+kLFthfMtaD7K
	 OOtfe6KfOYiBnKc4KMsHRz6SRe3Hl6kxmK60E7eP1GolDnNe2Ho4cO5mvSPe6kQ+bf
	 U27cSXIgn6u/i9FvH1zgkZAK/6GwReCAYZgOyHV8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E7FFF896DD;
	Mon,  3 Jun 2019 04:40:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80FDCF896DD; Mon,  3 Jun 2019 04:40:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_MED,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21FD5F896CE
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 04:40:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21FD5F896CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="uBjlWOWP"
Received: by mail-ot1-x341.google.com with SMTP id t24so916685otl.12
 for <alsa-devel@alsa-project.org>; Sun, 02 Jun 2019 19:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=msRd4Zqrxk2OyewuRLkWcGgNJMQJ2hXWuTvwLrPzKqc=;
 b=uBjlWOWPTtHI6/Dqndy6ku+MaLduUT33LhfdLBwlVeDNa2IQHDE7rfJ0AvWwXBP0po
 BSulF80P6VAgvLgmR5QY+X4fMMZYHzdUVqYSl0yg+iGs44YeMaSglZn/bW7bq3cAcDFJ
 o0y+9DN+Vj+tJkMweUVUpzDB7XWzQEZQL1gQa4tz3beJQoYguv0ibX+L8CYse+YQsPbI
 rlDAEXG4rS8ykuXRSDi2ra1d9E5CEP2WPaMwPUN2r4OKXWN57+0uziuIA93o+ANdwBPh
 GiTgIa4REToNPPEfEJjslfvT4nFJqw/zSy5mlW5aSF1udINwtX9oZeSULnywaYs6Z6xs
 AIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=msRd4Zqrxk2OyewuRLkWcGgNJMQJ2hXWuTvwLrPzKqc=;
 b=tXKQwswfsIJ5dyWAvWjG76MywfGWHtOK09YAIXGB+vlro1cK85yC5lLqtD2NVOTicb
 Vj6wwawGaHVX6eh/zF/zLuOrKj/VeBaA/GfY17MWpzXo5Y781rLlwm2o7eD9XyEo1lrn
 pbjGf7ddNqvl3pgCjyLK9CzadfNU4OMPsrzBC+a/IG/VkNrli1A6EIdYqLqB18J2IzhB
 S32VxpP2MQUdPC3kDqF7bvkQGvY8hWhZMqmr07zJqPtJkk0Cn0DHQQAgJHvG2CfldPkP
 VGO0kAicF7oW0psH+2b1/qHO9gAtbXw+xg3qnye+cvOwjqoM3t9NYajzc7mUO+w1lI6Y
 oh6g==
X-Gm-Message-State: APjAAAXYcqEg0vY6qdDBPuiwL0Y7RquP9v5o/3ijHKpDMZktUwhsh/re
 kWoaMm2RPuzqsx31WHsjfE/glfTwa2C/GJ3+qEv4yQ==
X-Google-Smtp-Source: APXvYqx67FhIhL4Qy/eFKYvg/uadJjTZGiV0fRNkUKwgxWuAakpx0KO+vTcaUdb6E66zs+VfxdExz8eBroGHEKIjy1o=
X-Received: by 2002:a9d:7a54:: with SMTP id z20mr857231otm.103.1559529647672; 
 Sun, 02 Jun 2019 19:40:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190530073229.121032-1-tzungbi@google.com>
In-Reply-To: <20190530073229.121032-1-tzungbi@google.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 3 Jun 2019 10:40:36 +0800
Message-ID: <CA+Px+wXJsar1X=1EdDvMDvPv4DzDG+BmOgSopAqU48Y3Qa=acg@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, Dylan Reid <dgreid@google.com>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: core: move DAI pre-links initiation
	to snd_soc_instantiate_card
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

Please ignore this patch.

On Thu, May 30, 2019 at 3:32 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 2d3520fca613..82ff384753c7 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -2072,6 +2072,15 @@ static int snd_soc_instantiate_card(struct snd_soc_card *card)
>         mutex_lock(&client_mutex);
>         mutex_lock_nested(&card->mutex, SND_SOC_CARD_CLASS_INIT);
>
> +       for_each_card_prelinks(card, i, dai_link) {
> +               ret = soc_init_dai_link(card, dai_link);
> +               if (ret) {
> +                       dev_err(card->dev, "ASoC: failed to init link %s: %d\n",
> +                               dai_link->name, ret);
> +                       goto probe_end;
> +               }
> +       }
> +
>         card->dapm.bias_level = SND_SOC_BIAS_OFF;
>         card->dapm.dev = card->dev;
>         card->dapm.card = card;
> @@ -2241,7 +2250,7 @@ static int snd_soc_instantiate_card(struct snd_soc_card *card)
>         snd_soc_dapm_sync(&card->dapm);
>
>  probe_end:
> -       if (ret < 0)
> +       if (ret < 0 && ret != -EPROBE_DEFER)
>                 soc_cleanup_card_resources(card);
Should not call soc_cleanup_card_resources() if soc_init_dai_link()
returns fail.  Some context has not initialized yet in the case.

>
>         mutex_unlock(&card->mutex);
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
