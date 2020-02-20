Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ECE16543A
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 02:27:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3FA516AD;
	Thu, 20 Feb 2020 02:26:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3FA516AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582162026;
	bh=/n2WOmw6ezicbB+haorqLBjnHXZncYSZv+xlrbbEbBc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=APtT4KfhkZAB0+RcLCy1SDRfEFNWz8e4dQZsgqLr8lwbK7Rr2SJcUNzg8ss5tqIEX
	 g+lVihOit6CT1M0/btsREBEtc80NBlgw3+q5RRBaCPV/xASbvOy2L2YUODbhYwe7Ne
	 O1An2eOy4BTL2sZhh6EVt+Ot+cYKuVDIUY0a3LEY=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD722F80114;
	Thu, 20 Feb 2020 02:25:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 196A8F8025F; Thu, 20 Feb 2020 02:25:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60215F80142
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 02:25:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60215F80142
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="COPkRnrg"
Received: by mail-io1-xd43.google.com with SMTP id t26so2782577ioi.13
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 17:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C13tlNOVNERgH19CZ8euKWJ4OuxvMfkU5f1kvN1IJag=;
 b=COPkRnrgBkV2WjJGRog2ycprQEcr8B2bWumaasETjBQsPI9P4yPuinxNswa9dsSWMo
 fznQcPLS//iUtOTlEKOSxjWB35zh9gay1W+jCEnKJZ7AWynHI84ga8YTgKGLTk6x8NJK
 nI+g+3pcKGRyrQTfWFSUpbUW2clmvsrz7LzayazwzMSLeQDe69mP8zXWClqwMJUSvWLD
 tz6uHCZNTaJ7QwlcrHmL5iHH+Xrld8a/pzNeDgHcD8OcnwkWEI8dOEsoCPBsTlZa6iBu
 6cVeffLWsQeny27NFQIDksblsAh2HKfamHKLPzufPi4jL55vXL7MP80XdlshIIt8X7Jp
 4jww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C13tlNOVNERgH19CZ8euKWJ4OuxvMfkU5f1kvN1IJag=;
 b=N+TaqfbSEILd2WQ7349GrYtxnhZ94+4EpVi8ydgTXgCpw6Iwyj7evM11WQ1oeDiCxr
 n2v27c+RbcJRBB+pd2CcJ9725uaDqfkvK1dc/o6jf+9ypfDAO0jUW6JYKdIrBBU71DwU
 U/8QruntCds5lfSRsWf4PaDgGMmCEjHp2AM3kpepwZ0Yg8JW7zbsYitVVneOeTexN5Gs
 jox6MgIqZCHFJWqO3CzT4D4CeVHWi+OkTeHQ573B0vzlxQc1EgwgsA2Cg4zQAIMMBVn7
 rfiecHKHF1qwYb6St/rQNQyTF6S/tqXy7P1Kqvw6Uh3zxkRZf2H8vdLUPGLe+mVllLe6
 OgQw==
X-Gm-Message-State: APjAAAVUWKag0uZAWD5ULWyRkX4urFSrbvX1xd5FxiWnwH/MMK41ZhiX
 SKdnngCd8rdYbiHsvC92EbdV3m39RPG9FIagKSXFVg==
X-Google-Smtp-Source: APXvYqyIyyUbrbS5M0IwpiYHeDwLiZ4/+sT4qLC1qyaBfEPWdJ+pRqaqCThcbgVvvR+iKyZyoPskP513MyNk5tM9BkU=
X-Received: by 2002:a02:cc1b:: with SMTP id n27mr19679628jap.122.1582161913060; 
 Wed, 19 Feb 2020 17:25:13 -0800 (PST)
MIME-Version: 1.0
References: <20200219182650.1416-1-kai.vehmanen@linux.intel.com>
 <87blput7hh.wl-kuninori.morimoto.gx@renesas.com>
 <878skyt6om.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878skyt6om.wl-kuninori.morimoto.gx@renesas.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Wed, 19 Feb 2020 17:25:03 -0800
Message-ID: <CAFQqKeX8oDOUsN_=OfO7Sn_vTmdE-BbHL8Jruji_rAY85mB98g@mail.gmail.com>
Subject: Re: [PATCH][RFC] ASoC: soc-component: count
 snd_soc_component_open/close()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, digetx@gmail.com
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

On Wed, Feb 19, 2020 at 5:01 PM Kuninori Morimoto <
kuninori.morimoto.gx@renesas.com> wrote:

> ASoC component open/close and snd_soc_component_module_get/put are
> called once for each component, but we need it for each substream.
> To solve this issue, this patch counts open / get,
> and call close / put accordingly.
>
> Fixes: dd03907bf129 ("ASoC: soc-pcm: call snd_soc_component_open/close()
> once")
> Reported-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> I tidyuped code.
> I hope it can solve the issue.
>
>  include/sound/soc-component.h |  5 +++--
>  sound/soc/soc-component.c     | 35 ++++++++++++++++++++++-------------
>  2 files changed, 25 insertions(+), 15 deletions(-)
>
> diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
> index 1866ecc8e94b..4e78925858c0 100644
> --- a/include/sound/soc-component.h
> +++ b/include/sound/soc-component.h
> @@ -181,10 +181,11 @@ struct snd_soc_component {
>         const char *debugfs_prefix;
>  #endif
>
> +       u8 opened;
> +       u8 module;
> +
>         /* bit field */
>         unsigned int suspended:1; /* is in suspend PM state */
> -       unsigned int opened:1;
> -       unsigned int module:1;
>  };
>
>  #define for_each_component_dais(component, dai)\
> diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
> index ee00c09df5e7..bdd36be1fb70 100644
> --- a/sound/soc/soc-component.c
> +++ b/sound/soc/soc-component.c
> @@ -297,14 +297,16 @@ EXPORT_SYMBOL_GPL(snd_soc_component_set_jack);
>  int snd_soc_component_module_get(struct snd_soc_component *component,
>                                  int upon_open)
>  {
> -       if (component->module)
> -               return 0;
> +       if (unlikely(component->module == 0xff)) {
> +               dev_warn(component->dev, "too many module get (%s)\n",
> component->name);
> +               return -EBUSY;
> +       }
>
>         if (component->driver->module_get_upon_open == !!upon_open &&
>             !try_module_get(component->dev->driver->owner))
>                 return -ENODEV;
>
> -       component->module = 1;
> +       component->module++;
>
Thanks, Morimoto-san for the alternate fix. I understand the rationale for
having a count for component->opened, but what is the rationale for the
module count? What it is intended to protect?

Thanks,
Ranjani
