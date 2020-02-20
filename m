Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFCE1654C5
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 03:00:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AE881695;
	Thu, 20 Feb 2020 02:59:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AE881695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582164008;
	bh=+B1rrTY6fnZ+33u2BgJM/ksmKy09WcqlOmRB73KISL4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IqkI4wH5mY6TAspAnW3CxzK6Bxw/PVYziUad50CnyavkN37edZRfJXfGGVZo9e5gc
	 DZmjKh4FThorv72s5NEYYTOAvjpH8QUk82CnKYQIp67y5XvdBeSnUplkWCk5PWu+fd
	 8jmAKG7wq673DRoxePmiTuK7IKVqhnZg/M/jEj0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45FCDF80279;
	Thu, 20 Feb 2020 02:57:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAB2BF80278; Thu, 20 Feb 2020 02:57:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B81FF80142
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 02:57:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B81FF80142
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="qyWX0reZ"
Received: by mail-il1-x12f.google.com with SMTP id f5so22394485ilq.5
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 17:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kRfnimRGXObmbI8Pi8jkopO/Vz3ZCXTfImVbtsPD+Rg=;
 b=qyWX0reZgmkB4LOskZaaXeFodJ/n4VVNUOiKXQkCfEIJSmL+LelYG/KGZIqs9ZKKR8
 S/J4c4SAFZjkcQxNN2PEuM2FNbLrn95A5Wm2FrCZGJN5JMZnqavfIf++BoccdVbuTvek
 L1rfvvQO3lsOKn36zg7ajhSpOPr3BLISuW8VqVGmHk6yLboJIpLTlU3eMT7XhKwX4ak4
 JLaxTu98/mx6WihwsUwy34jzQk0VY8/4RXVhaI3KnR7AVpW3hACtFno9Ap+6ZqmsOkmh
 gk19da8xgMp0DHNs6bY3hED6EnehkNAuox1noA+WcndFrBj5VihvR5V3I8bAfOcyvUbp
 s32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kRfnimRGXObmbI8Pi8jkopO/Vz3ZCXTfImVbtsPD+Rg=;
 b=J+0ze4BOzb2zPSxqVXSlsNDLB0+Nbmiw8DmeT86JDnCry2BJnE9vuXREmVh9Y9W35U
 OlZwXA7bmRr8/bhzNXkIzJWT2r3BOcjvTWyP4RdIHSg6PdBKp3fxDGSCjRCijq5nlKG1
 G6/quouFBWRPtepaWU1ZelUBcPq4Ypk7m0W1UqygFVhvVzAPJ5JFN7m8XV+8Ri7mRXaq
 V9A3IUcOc0edNzysbicsyUTeLW7LVQYWS7lneu9KBI1SKIsS3gUA8BJedoXd0GzhkPdL
 OGl44po9hP9iySm4Tt9Mg0kC21wZqlP3wE5RDe8ilaBdGTr6H7PRlVDfv7OR5YDuhCiK
 1K9g==
X-Gm-Message-State: APjAAAUNE210sERQ5uF5YeFL/DfkiITceI4JwJzNjEcjnKGJ/Z2G6jd9
 4je37qias+KrRkAO0xkxn8QEEt3i63eHZsqAOmR/Jg==
X-Google-Smtp-Source: APXvYqww9vtlbj6jUWRN/9WQNOSLEWafy+lZ+iyVFbZMI0vpGz3qmxelYA2Gwwsgw8PetnMnpuVvFxdvjRs6nOXI2LM=
X-Received: by 2002:a92:b74a:: with SMTP id c10mr26621799ilm.86.1582163868768; 
 Wed, 19 Feb 2020 17:57:48 -0800 (PST)
MIME-Version: 1.0
References: <20200219182650.1416-1-kai.vehmanen@linux.intel.com>
 <87blput7hh.wl-kuninori.morimoto.gx@renesas.com>
 <878skyt6om.wl-kuninori.morimoto.gx@renesas.com>
 <CAFQqKeX8oDOUsN_=OfO7Sn_vTmdE-BbHL8Jruji_rAY85mB98g@mail.gmail.com>
 <875zg2t4qd.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875zg2t4qd.wl-kuninori.morimoto.gx@renesas.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Wed, 19 Feb 2020 17:57:38 -0800
Message-ID: <CAFQqKeUcgKRnWmF4bzGvfb8MNj8XtPp2cD7yBWY8XNJzUnRQjw@mail.gmail.com>
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

On Wed, Feb 19, 2020 at 5:42 PM Kuninori Morimoto <
kuninori.morimoto.gx@renesas.com> wrote:

>
> Hi Sridharan
>
> >     ASoC component open/close and snd_soc_component_module_get/put are
> >     called once for each component, but we need it for each substream.
> >     To solve this issue, this patch counts open / get,
> >     and call close / put accordingly.
> >
> >     Fixes: dd03907bf129 ("ASoC: soc-pcm: call
> snd_soc_component_open/close() once")
> >     Reported-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> >     Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> >     ---
> (snip)
> >     @@ -297,14 +297,16 @@ EXPORT_SYMBOL_GPL(snd_soc_component_set_jack);
> >      int snd_soc_component_module_get(struct snd_soc_component
> *component,
> >                                      int upon_open)
> >      {
> >     -       if (component->module)
> >     -               return 0;
> >     +       if (unlikely(component->module == 0xff)) {
> >     +               dev_warn(component->dev, "too many module get
> (%s)\n", component->name);
> >     +               return -EBUSY;
> >     +       }
> >
> >             if (component->driver->module_get_upon_open == !!upon_open &&
> >                 !try_module_get(component->dev->driver->owner))
> >                     return -ENODEV;
> >
> >     -       component->module = 1;
> >     +       component->module++;
> >
> > Thanks, Morimoto-san for the alternate fix. I understand the rationale
> for having a count for component->opened, but what is the rationale for the
> module count? What it is
> > intended to protect?
>
> I think same as open ?
> It protects calling put() from not-get-component.
> Because module_put() has WARN_ON(ret < 0).
>
Can we use the module_refcount instead of adding a new field?

Thanks,
Ranjani
