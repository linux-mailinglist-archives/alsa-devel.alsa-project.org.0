Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BDB183236
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 14:59:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E25D816F1;
	Thu, 12 Mar 2020 14:59:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E25D816F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584021592;
	bh=dysdb4Mqgb5qdZSooO0za60yCJ0ozymgk9JgxhcVm38=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KpzSYdqesMyouyDqOyBNQDfAJnxleuLD++Br93DoT/xsKm/qwtFEo6ianrTJjpmK2
	 KWTPO7tPGarNb8Z+SBvXSjbX5acXTLwDXrIWYDgWVm45iTQ9PUNx3aXGvk7AEhLiUf
	 7JnIiXOUZt8lMeq82droKJhhHbt6LsnGh5yZYgjw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B27CF8021C;
	Thu, 12 Mar 2020 14:58:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 797DBF8020C; Thu, 12 Mar 2020 14:58:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59081F80086
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 14:58:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59081F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="CQ22swji"
Received: by mail-io1-xd44.google.com with SMTP id q128so5750411iof.9
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 06:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q5jWP/1noFwzObY4I4oTofdUqp0/aBf7noRWrJzokWw=;
 b=CQ22swjiCopu7kqfLfnsrwhHAPSRfwKKCA6r4elFcV1FPK4WrNMHXrVMCCf2D4NZFD
 0IYw/mgKcl4tOAFqMJQz1vrsNdteWH3dC6JxmyacveLw7yeBuspIZstI1ms2bwO7tZ++
 eDYZA4gV9gss+gE35AUmYFGboXEqWRhaiWKQyfuAgZmczwqEGPxuZcTg7xD5DBGV0kxv
 qG0eQPJfq/3RJtGfsyV0OSqiozYrJKv6Lj8bZXn14zynI2g+FVka0y0Ar3whQgM3vxPf
 pAPpcQ9MrA83L8s7CSDDAl8F5kpaFX3IqzwuAmEnuZX597mi8d8BSQcxld3gyLFQrcOy
 kasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q5jWP/1noFwzObY4I4oTofdUqp0/aBf7noRWrJzokWw=;
 b=HodbnP+vEjmREY9xlIgj87++xAwb23jaYCb4bxStRNj7CyMrHD5d3x3gvxP7YTYxYc
 9Lz9sQ1xsQzWyjMaHK2gxZ+FxRUv2nmktzLy40UcqYqi0l93JDDMV7C7eb38eoghh/rp
 eLCSNGxgkcrYBLiASA1cjMx1uP1/uAa18bDLvJoFZ33qgo0/9mtbw2xNEok4Cb8nQ8+0
 kYq45PwRXwiR2bdu0iFbjQudbDePgGJNQMnscsVWhiH37ncF2nhzzBipY+UlhHwM4Nx/
 HQi+SEnecf7Y2QK17fdPIjpnz/0VBU44GuxI1naKM8r1so+Mo5MS7Yqx0xziCUmo7XZV
 Jwmg==
X-Gm-Message-State: ANhLgQ0xOLGNOv68Nd3zy0JKZ9QK7ultJzZvj48ljggLmG/OzlVEcEvX
 POZkoMPX1T8gauVqQ7IZaFYAx8eLna0FGs4/47yzJw==
X-Google-Smtp-Source: ADFU+vuJuUGRnEC3iVhGRSxroos2Ede9Dpwj56z+iJgPmm+9YKj7N4Outv5g/paeciUkpT4sh1lIb3Qq6pAc+vGaW/U=
X-Received: by 2002:a6b:e806:: with SMTP id f6mr7929034ioh.52.1584021482487;
 Thu, 12 Mar 2020 06:58:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200312122239.14489-1-amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20200312122239.14489-1-amadeuszx.slawinski@linux.intel.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Thu, 12 Mar 2020 06:57:51 -0700
Message-ID: <CAFQqKeUOQ5EU57SvEpzkSJ=khsRZ=E-WqarFoq2xpoycmhHqeA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: topology: Perform component check upfront
To: =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
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

On Thu, Mar 12, 2020 at 3:14 AM Amadeusz S=C5=82awi=C5=84ski <
amadeuszx.slawinski@linux.intel.com> wrote:

> Function soc_tplg_dbytes_create(), calls soc_tplg_init_kcontrol() to
> perform additional driver specific initialization. While
> soc_tplg_init_kcontrol() ensures that component is valid before invoking
> ops->control_load, there is no such check at the end of
> soc_tplg_dbytes_create() where list_add() is used.
>
> Also in quite a few places, there is reference of tplg->comp->dapm or
> tplg->comp->card, without any checks for tplg->comp.
>
> In consequence of the above this may lead to referencing NULL pointer.
>
> This allows for removal of now unnecessary checks.
>
> Signed-off-by: Amadeusz S=C5=82awi=C5=84ski <amadeuszx.slawinski@linux.in=
tel.com>
> ---
>  sound/soc/soc-topology.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> index 575da6aba807..66958c57d884 100644
> --- a/sound/soc/soc-topology.c
> +++ b/sound/soc/soc-topology.c
> @@ -251,7 +251,7 @@ static int soc_tplg_vendor_load_(struct soc_tplg *tpl=
g,
>  {
>         int ret =3D 0;
>
> -       if (tplg->comp && tplg->ops && tplg->ops->vendor_load)
> +       if (tplg->ops && tplg->ops->vendor_load)
>                 ret =3D tplg->ops->vendor_load(tplg->comp, tplg->index, h=
dr);
>         else {
>                 dev_err(tplg->dev, "ASoC: no vendor load callback for ID
> %d\n",
> @@ -283,7 +283,7 @@ static int soc_tplg_vendor_load(struct soc_tplg *tplg=
,
>  static int soc_tplg_widget_load(struct soc_tplg *tplg,
>         struct snd_soc_dapm_widget *w, struct snd_soc_tplg_dapm_widget
> *tplg_w)
>  {
> -       if (tplg->comp && tplg->ops && tplg->ops->widget_load)
> +       if (tplg->ops && tplg->ops->widget_load)
>                 return tplg->ops->widget_load(tplg->comp, tplg->index, w,
>                         tplg_w);
>
> @@ -295,7 +295,7 @@ static int soc_tplg_widget_load(struct soc_tplg *tplg=
,
>  static int soc_tplg_widget_ready(struct soc_tplg *tplg,
>         struct snd_soc_dapm_widget *w, struct snd_soc_tplg_dapm_widget
> *tplg_w)
>  {
> -       if (tplg->comp && tplg->ops && tplg->ops->widget_ready)
> +       if (tplg->ops && tplg->ops->widget_ready)
>                 return tplg->ops->widget_ready(tplg->comp, tplg->index, w=
,
>                         tplg_w);
>
> @@ -307,7 +307,7 @@ static int soc_tplg_dai_load(struct soc_tplg *tplg,
>         struct snd_soc_dai_driver *dai_drv,
>         struct snd_soc_tplg_pcm *pcm, struct snd_soc_dai *dai)
>  {
> -       if (tplg->comp && tplg->ops && tplg->ops->dai_load)
> +       if (tplg->ops && tplg->ops->dai_load)
>                 return tplg->ops->dai_load(tplg->comp, tplg->index,
> dai_drv,
>                         pcm, dai);
>
> @@ -318,7 +318,7 @@ static int soc_tplg_dai_load(struct soc_tplg *tplg,
>  static int soc_tplg_dai_link_load(struct soc_tplg *tplg,
>         struct snd_soc_dai_link *link, struct snd_soc_tplg_link_config
> *cfg)
>  {
> -       if (tplg->comp && tplg->ops && tplg->ops->link_load)
> +       if (tplg->ops && tplg->ops->link_load)
>                 return tplg->ops->link_load(tplg->comp, tplg->index, link=
,
> cfg);
>
>         return 0;
> @@ -327,7 +327,7 @@ static int soc_tplg_dai_link_load(struct soc_tplg
> *tplg,
>  /* tell the component driver that all firmware has been loaded in this
> request */
>  static void soc_tplg_complete(struct soc_tplg *tplg)
>  {
> -       if (tplg->comp && tplg->ops && tplg->ops->complete)
> +       if (tplg->ops && tplg->ops->complete)
>                 tplg->ops->complete(tplg->comp);
>  }
>
> @@ -684,7 +684,7 @@ EXPORT_SYMBOL_GPL(snd_soc_tplg_widget_bind_event);
>  static int soc_tplg_init_kcontrol(struct soc_tplg *tplg,
>         struct snd_kcontrol_new *k, struct snd_soc_tplg_ctl_hdr *hdr)
>  {
> -       if (tplg->comp && tplg->ops && tplg->ops->control_load)
> +       if (tplg->ops && tplg->ops->control_load)
>                 return tplg->ops->control_load(tplg->comp, tplg->index, k=
,
>                         hdr);
>
> @@ -1174,7 +1174,7 @@ static int soc_tplg_kcontrol_elems_load(struct
> soc_tplg *tplg,
>  static int soc_tplg_add_route(struct soc_tplg *tplg,
>         struct snd_soc_dapm_route *route)
>  {
> -       if (tplg->comp && tplg->ops && tplg->ops->dapm_route_load)
> +       if (tplg->ops && tplg->ops->dapm_route_load)
>                 return tplg->ops->dapm_route_load(tplg->comp, tplg->index=
,
>                         route);
>
> @@ -2564,7 +2564,7 @@ static int soc_tplg_manifest_load(struct soc_tplg
> *tplg,
>         }
>
>         /* pass control to component driver for optional further init */
> -       if (tplg->comp && tplg->ops && tplg->ops->manifest)
> +       if (tplg->ops && tplg->ops->manifest)
>                 ret =3D tplg->ops->manifest(tplg->comp, tplg->index,
> _manifest);
>
>         if (!abi_match) /* free the duplicated one */
> @@ -2736,6 +2736,10 @@ int snd_soc_tplg_component_load(struct
> snd_soc_component *comp,
>         struct soc_tplg tplg;
>         int ret;
>
> +       /* component needs to exist to keep and reference data while
> parsing */
> +       if (!comp)
> +               return -EINVAL;
> +

Amadeusz,

Thanks for this change. I agree that the checks for tplg->comp in the above
functions should be removed but is the check here really necessary at all?
snd_soc_tplg_component_load() is typically called when a component is
probed. Can it ever be null at all if it is getting probed?

Thanks,
Ranjani
