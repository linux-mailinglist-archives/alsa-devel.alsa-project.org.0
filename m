Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDC8531138
	for <lists+alsa-devel@lfdr.de>; Mon, 23 May 2022 15:53:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AA6217E5;
	Mon, 23 May 2022 15:52:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AA6217E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653314010;
	bh=nUld3xBPZpHgQMNsAddhsnq1ESakv72x1HcKuJXb+hw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=suCsYgzTk8ZtXXHExUqNTeOrnCMdZ2mvgs7dQ9WVIcwF4iefQ6du/Simjdp6CCt1o
	 F5b0J9dBM/OfCmH4kGXUmhwvbPs1MYhl7Z2n2NhHgqf3D8eQdslLxzHzBmRofVlhom
	 I+yWW80s13pOBdClNnF8FCGa2SeBSF9HhWKy4hnA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C77D9F8025E;
	Mon, 23 May 2022 15:52:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48BCBF80236; Mon, 23 May 2022 15:52:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AF27F80116
 for <alsa-devel@alsa-project.org>; Mon, 23 May 2022 15:52:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AF27F80116
Received: by mail-qt1-f176.google.com with SMTP id hh4so12532165qtb.10
 for <alsa-devel@alsa-project.org>; Mon, 23 May 2022 06:52:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EHMcsEmvvJZ5YK4UB7JWYPJGU7GAR4VtM9LZecjaIGM=;
 b=exEjCyfhBIIGUgjzxALZCJ5jRTwjNU8m3VxaL8JY0RmnQn6IAKb4Ip98e9zfFIluLg
 /NmeAre5saG6eLGhaushBsCr7UekczuN79fwjy3hUaBUp18hStE/QCwmNK6AYMSE9yW2
 NObhQEYv5DW7Y4qKrpL0VJzeMFvswqKOT9vwo5DEna+w+pbs1n+jVWPDtbh6rb6vpG/4
 HOV66bO25zyvBykHjW5nZU783k/DA/Qs4KKMEGOqVhMmNs7PlduQq2FV7M/i5oOF791q
 7CUABeZQS7kWK4ttfEQju0pdgyRJg1WRnih46sxXcT+yGJV0hFlawCzdinS2OKt8sSHR
 igcg==
X-Gm-Message-State: AOAM533+KPPcn48K3IvUfYacfTmbbpR5T+VS07sBO/r4uQd2OLDKhKa/
 7MvdJBTPNynCw3rdshK309Kv2EOLON+h6g==
X-Google-Smtp-Source: ABdhPJxtZ7RUVZ9bHTmh4gAy9iZncjiiYnSvPh2Zvzdu0d9mYf5rDmMYq0+ASNtwqtBGdKCpOyS90A==
X-Received: by 2002:ac8:7f94:0:b0:2f9:2a3f:5fcd with SMTP id
 z20-20020ac87f94000000b002f92a3f5fcdmr8628644qtj.330.1653313942408; 
 Mon, 23 May 2022 06:52:22 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com.
 [209.85.128.182]) by smtp.gmail.com with ESMTPSA id
 bi12-20020a05620a318c00b006a370031c3esm3783424qkb.106.2022.05.23.06.52.21
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 06:52:22 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-2ef5380669cso148563877b3.9
 for <alsa-devel@alsa-project.org>; Mon, 23 May 2022 06:52:21 -0700 (PDT)
X-Received: by 2002:a81:2143:0:b0:2fb:1274:247e with SMTP id
 h64-20020a812143000000b002fb1274247emr23349727ywh.384.1653313941447; Mon, 23
 May 2022 06:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220523132353.1767614-1-Vsujithkumar.Reddy@amd.com>
 <20220523132353.1767614-2-Vsujithkumar.Reddy@amd.com>
In-Reply-To: <20220523132353.1767614-2-Vsujithkumar.Reddy@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 May 2022 15:52:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUY1MPGT4QO0aL1m+NHrs0eQ357YEOcjKpt0fQ4KSekWg@mail.gmail.com>
Message-ID: <CAMuHMdUY1MPGT4QO0aL1m+NHrs0eQ357YEOcjKpt0fQ4KSekWg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] ASoC: amd: acp: Add support for nau8825 and
 max98360 card
To: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Sunil-kumar.Dommati@amd.com, Geert Uytterhoeven <geert+renesas@glider.be>,
 ajitkumar.pandey@amd.com, Kai Vehmanen <kai.vehmanen@intel.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Vijendar.Mukunda@amd.com,
 Jia-Ju Bai <baijiaju1990@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Bard Liao <bard.liao@intel.com>
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

Hi Sujith,

On Mon, May 23, 2022 at 3:24 PM V sujith kumar Reddy
<Vsujithkumar.Reddy@amd.com> wrote:
> We have new platform with nau8825 as a primary codec and max98360 as an
> amp codec. Add machine struct to register sof audio based sound card
> on such Chrome machine.
>
> Signed-off-by: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>

Thanks for your patch!

> --- a/sound/soc/amd/acp-config.c
> +++ b/sound/soc/amd/acp-config.c
> @@ -130,4 +130,25 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_sof_machines[] = {
>  };
>  EXPORT_SYMBOL(snd_soc_acpi_amd_sof_machines);
>
> +struct snd_soc_acpi_mach snd_soc_acpi_amd_rmb_sof_machines[] = {
> +       {
> +               .id = "AMDI1019",
> +               .drv_name = "rmb-dsp",
> +               .pdata = (void *)&acp_quirk_data,

You can assign an arbitrary pointer type to "void *" without casting.
In fact the cast makes the code less safe, as it prevents the compiler
from informing you in case a future patch changes types.

The same applies to below, and to the existing casts.

> +               .fw_filename = "sof-rmb.ri",
> +               .sof_tplg_filename = "sof-acp-rmb.tplg",
> +       },
> +       {
> +               .id = "10508825",
> +               .drv_name = "nau8825-max",
> +               .pdata = (void *)&acp_quirk_data,
> +               .machine_quirk = snd_soc_acpi_codec_list,
> +               .quirk_data = &amp_max,
> +               .fw_filename = "sof-rmb.ri",
> +               .sof_tplg_filename = "sof-acp-rmb.tplg",
> +       },
> +       {},
> +};

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
