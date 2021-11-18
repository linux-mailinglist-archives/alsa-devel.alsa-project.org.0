Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCF6455828
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 10:36:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FDCA1899;
	Thu, 18 Nov 2021 10:35:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FDCA1899
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637228183;
	bh=92vh7Ej4XtGP8qz6NkuObXUCtApJvg5jqTF7QV2scFw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vn+cD61+c5A6mTa5tq+fDoKhrOTyhUlv8RW2jppIN7zUw1+MPW8BBLII+3O/5slCa
	 8WCXtEfF1zT70QctU8263rrHeMAdetgkDhkGKjy6ZyXy5h6rClWSda9IuyKhk/u25T
	 6+ZwnZzs6mI9Dy27TIw9nC4CqUBfSKYqzw+qd1sY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E407F8010B;
	Thu, 18 Nov 2021 10:35:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 759D6F80272; Thu, 18 Nov 2021 10:35:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
 DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 443ADF800FA
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 10:34:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 443ADF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CiErSrtG"
Received: by mail-wm1-x329.google.com with SMTP id p18so4660952wmq.5
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 01:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D2DiSr4GR4f0kjFqr84VgVUga2wtQ7vPvvBID6YBxB0=;
 b=CiErSrtGCWUEyZLfMvqTPhoO+PVvYr8F4A/5/etcwClx83yVS+uPMJHMAV81hFpwuL
 ijJni+mNbJahK2jRN4xnBWN4RDUl03g5k3nH81jW+Bi8+N+mZcdxgjBQw6ggUb5/Lv+T
 25/OlDXEoVqx+yw1VvwE1F6vhzIew79cm+7RpMypbiXuB91wHPxhurB5VblAa8iz0yBZ
 IEi6YXy2yKHdrHNXqrB6GADYDqg3tqovdTywZD5Be7MGQ8iC05jQKTj7UPC8wAxUGJ7p
 49GezO1MH3RV148uGhPaQZcUy30h5v8dOsxT/JT3vV8g/MHDIzuwS8hcP423hBk7FE46
 El2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D2DiSr4GR4f0kjFqr84VgVUga2wtQ7vPvvBID6YBxB0=;
 b=7j2eb7k03FvgGcUWK2ZR8FftBH1YRvexnZojbfXn4qTUJaA0akTGDnK1SCakYZpJzX
 m8r66IrPBx8ZwC6idfpj17pZAgczJf6A0wCctCAUA5XXM8nDYzjzbB3fmp67HVS1GwEZ
 cwfLyO43pzg38wgkWYbyoXojKshtMBjcaMSBFMFZauYQg4vtBNP4t2RaNNlphAThH8Ie
 JL4IBMZYPCWG31P4+rtqmWYEWyEV4DqrmIS/26LNv7Os3tJ7CLEGc9pBKbRDI7QlCdwC
 v1R0SRJk2rbCsxdssWYuGX8HN+Bd0WugOjf4rxRVaOUiGQBJ4hEOSZPPawAZP9DLY/sJ
 +YYQ==
X-Gm-Message-State: AOAM532yPzqFdgTVdYYVtoW8DMV708PFalWIScqZYA93TYwF+WWMGyWU
 l8JpA1Jd9B8sQLpkJsAovAZZs5KdInmD9PV13H8=
X-Google-Smtp-Source: ABdhPJxAyZQQg4jwIc6CPnTIVq1jJ9tsO++0Yd/XdFFaJWYGlAjIir88iOm9kpfeZWiCt8G3ActVocgcY5UV2vySexI=
X-Received: by 2002:a05:600c:500a:: with SMTP id
 n10mr8907382wmr.136.1637228091333; 
 Thu, 18 Nov 2021 01:34:51 -0800 (PST)
MIME-Version: 1.0
References: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
 <20211117093734.17407-17-daniel.baluta@oss.nxp.com>
 <YZU75B2JHbYHy40l@sirena.org.uk>
 <e918b4c4-dc85-dcf5-2781-5edfcd1bf1a5@nxp.com>
In-Reply-To: <e918b4c4-dc85-dcf5-2781-5edfcd1bf1a5@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 18 Nov 2021 11:34:38 +0200
Message-ID: <CAEnQRZBCc4bhX-sT43KT6Tb-=RK=J9poxRvEM_H=1oXh0_AsPA@mail.gmail.com>
Subject: Re: [PATCH 16/21] ASoC: SOF: topology: Add support for Mediatek AFE
 DAI
To: Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, AjitKumar.Pandey@amd.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Julian.Schroeder@amd.com,
 linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Balakishore.pati@amd.com,
 =?UTF-8?B?WUMgSHVuZyAo5rSq5aCv5L+KKQ==?= <yc.hung@mediatek.com>,
 vishnuvardhanrao.ravulapati@amd.com, vsreddy@amd.com,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

Hi Mark,

I noticed that you already applied this. Should I resend the entire
series or just a fixup?

On Wed, Nov 17, 2021 at 7:32 PM Daniel Baluta <daniel.baluta@nxp.com> wrote:
>
>
> On 11/17/21 7:29 PM, Mark Brown wrote:
> > On Wed, Nov 17, 2021 at 11:37:29AM +0200, Daniel Baluta wrote:
> >> From: YC Hung <yc.hung@mediatek.com>
> >>
> >> Add new sof dai and config to pass topology file configuration
> >> to SOF firmware running on Mediatek platform DSP core.
> >> Add mediatek audio front end(AFE) to the list of supported sof_dais
> > This breaks an x86 allmodconfig build:
> >
> > /mnt/kernel/sound/soc/sof/mediatek/mt8195/mt8195.c: In function 'mt8195_run':
> > /mnt/kernel/sound/soc/sof/mediatek/mt8195/mt8195.c:207:2: error: implicit declaration of function 'sof_hifixdsp_boot_sequence' [-Werror=implicit-function-declaration]
> >    207 |  sof_hifixdsp_boot_sequence(sdev, adsp_bootup_addr);
> >        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > At top level:
> > /mnt/kernel/sound/soc/sof/mediatek/mt8195/mt8195.c:201:12: error: 'mt8195_run' defined but not used [-Werror=unused-function]
> >    201 | static int mt8195_run(struct snd_sof_dev *sdev)
> >        |            ^~~~~~~~~~
> > cc1: all warnings being treated as errors
> >
> > _boot_sequence is added in "ASoC: SOF: mediatek: Add fw loader and
> > mt8195 dsp ops to load firmware" which is later in the series.
> >
> > mt8195_run should be either global, a static inline or not declared in
> > the header at all.
>
>
> YC,
>
> Please send a fix for this on top of topic/sof-dev. I will take care of
> the squash and resend.
>
>
>
