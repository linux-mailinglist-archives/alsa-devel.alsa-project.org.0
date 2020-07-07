Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E85DB216E1F
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 15:56:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7809611C;
	Tue,  7 Jul 2020 15:55:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7809611C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594130195;
	bh=/LomU/noErb69os6ByFzX+r+Xw0EW1eRWDL5rLLoDVM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XdHAX3o6FlPYNYa4F4L2rOvv43nUSY2K5aGSafYlFUXK2BvhxHhfxU/5QDq5/s7XH
	 EvZlQcfrACG3PHB7sb9uxVKEIa4pticC+rUUedyYVKOedy8zhWmxw2QDjIFRLaAjjA
	 2txORFM4D6Ekfnfs4gn7BKNpowbplfbpkhvbIDWw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 822D4F80257;
	Tue,  7 Jul 2020 15:54:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E337DF80216; Tue,  7 Jul 2020 15:54:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 660D1F800DF
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 15:54:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 660D1F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Z7xophkP"
Received: by mail-vk1-xa42.google.com with SMTP id c11so4341209vkn.11
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 06:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S3jdzOO32cHlgwmkrkbUpdIm/1MzyDL/EIRbxMTEa5A=;
 b=Z7xophkPQOkh4ARlxVwFuQJQTBEkSwbOlfOmHHyVle/OWVRWv195/0w2f2t+18snII
 n3FQ2codAubRjrUSwmyf3H/bvuc0OsNnp3dke2n7VO6YXh/6U9sff01yJTCcBXB97N4O
 6B26hIolpF+/goAhq8UKgXegM8/9vMeegLeLdtHGeuWYpcRucq5jfbOcGwqaVg8ngSrA
 1JAP0gkX+J8Um4gTC2fymZhoWIPl9qMkepe+SA81ejzI+RbrXNzlK46JX9YIvPugCwKS
 f8ceM9b+8mKnMjWN+emWh7vUYj6LvvjD7sNWmzfTZebUC506AFLaUOgH5ESXowrLhRpq
 RYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S3jdzOO32cHlgwmkrkbUpdIm/1MzyDL/EIRbxMTEa5A=;
 b=UJL/OMxsQXT7oI4HW4CUu4KkphpDDpwzZh9EuQF9oKkE2wdxgR1vppke+YcuT+ONob
 4JsexZ+DICaW3i2vHhYOyqYaaCBjYqHvhWuyMLrAomZAjP2/63aPgCacMGkdQ0cDNwPO
 1o0CNGN75Im3RCKAS0TlyZd6DseCianMOShwQlPyhIsHmo0OniH17XfsKKSzCd2i4RLP
 NjRUi7JJ2b13vKY4DRen29y8NxkYZ525yjiNWTU7lEEUtfrBA4NOMXFtoPIVI56I5Q/R
 3DPPJCxVL4gUg4t8zpIegJ4LaRyjCGjHDL1FfUbe0+wl0YfkmCFRFvUMnX3GWNN/L/ok
 oGDQ==
X-Gm-Message-State: AOAM532pzwDsqW1/+pGIqD9wv/Up6S5Z1GFz1yUNTaEw/1DmwbdW0ebL
 YcJoBkQC6lC3sSsxYTsAMG+Pf/42h6Psbd1jtH6lKA==
X-Google-Smtp-Source: ABdhPJw9SoRYf79I1P+jKjjZvaJuTnoqHslNrUEV0toooQ5NEaW+6rlt/daKxhkuVtAbPlSqKvED9krSaR3HLLT6Tbw=
X-Received: by 2002:a1f:1889:: with SMTP id 131mr29817788vky.59.1594130077760; 
 Tue, 07 Jul 2020 06:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200624103247.7115-1-daniel.baluta@oss.nxp.com>
 <20200624103247.7115-2-daniel.baluta@oss.nxp.com>
In-Reply-To: <20200624103247.7115-2-daniel.baluta@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 7 Jul 2020 15:54:01 +0200
Message-ID: <CAPDyKFr8BTkM2W_qbXK1KxtuoZC=uO14_uY9zCWvzfyU0h1a6Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] PM / domains: Introduce multi PM domains helpers
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Linux PM <linux-pm@vger.kernel.org>,
 Kevin Hilman <khilman@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>
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

On Wed, 24 Jun 2020 at 12:33, Daniel Baluta <daniel.baluta@oss.nxp.com> wrote:
>
> From: Daniel Baluta <daniel.baluta@nxp.com>
>
> This patch introduces helpers support for multi PM domains.
>
> API consists of:
>
> 1) dev_multi_pm_attach - powers up all PM domains associated with a given
> device. Because we can attach one PM domain per device, we create
> virtual devices (children of initial device) and associate PM domains
> one per virtual device.
>
> 2) dev_multi_pm_detach - detaches all virtual devices from PM domains
> attached with.

Nit pick:
I suggest to rename the helpers into
dev_pm_domain_attach|detach_multi(), to be more consistent with
existing function names. It's a bit long I admit that, but I prefer
the consistency.

>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  drivers/base/power/common.c | 93 +++++++++++++++++++++++++++++++++++++
>  include/linux/pm_domain.h   | 19 ++++++++
>  2 files changed, 112 insertions(+)
>
> diff --git a/drivers/base/power/common.c b/drivers/base/power/common.c
> index bbddb267c2e6..b0a4d0109810 100644
> --- a/drivers/base/power/common.c
> +++ b/drivers/base/power/common.c
> @@ -228,3 +228,96 @@ void dev_pm_domain_set(struct device *dev, struct dev_pm_domain *pd)
>         device_pm_check_callbacks(dev);
>  }
>  EXPORT_SYMBOL_GPL(dev_pm_domain_set);
> +
> +/**
> + * dev_multi_pm_attach - power up device associated power domains
> + * @dev: The device used to lookup the PM domains
> + *
> + * Parse device's OF node to find all PM domains specifiers. For each power
> + * domain found, create a virtual device and associate it with the
> + * current power domain.
> + *
> + * This function should typically be invoked by a driver during the
> + * probe phase, in the case its device requires power management through
> + * multiple PM domains.
> + *
> + * Returns a pointer to @dev_multi_pm_domain_data if successfully attached PM
> + * domains, NULL when the device doesn't need a PM domain or when single
> + * power-domains exists for it, else an ERR_PTR() in case of
> + * failures.
> + */
> +struct dev_multi_pm_domain_data *dev_multi_pm_attach(struct device *dev)
> +{
> +       struct dev_multi_pm_domain_data *mpd, *retp;
> +       int num_domains;
> +       int i;
> +
> +       num_domains = of_count_phandle_with_args(dev->of_node, "power-domains",
> +                                                "#power-domain-cells");
> +       if (num_domains < 2)
> +               return NULL;

dev_pm_domain_attach_* is typically wrapper functions, allowing
different types of PM domains to be supported. For example,
dev_pm_domain_attach() calls acpi_dev_pm_attach() and
genpd_dev_pm_attach(). While dev_pm_domain_attach_by_id() only calls
genpd_dev_pm_attach_by_id(), as there's no corresponding interface for
the acpi PM domain.

The above said, I don't think another layer should be needed here, but
there is something missing that makes this consistent with the
behaviour of the above mentioned functions.

How about adding a genpd OF helper ("of_genpd_num_domains(struct
device_node *)"), that deals with the above parsing and returns the
number of domains for the device? In this way, if
of_genpd_num_domains() returns an error code or zero, it's easier to
continue to try with other PM domain providers (if/when that is
supported).

> +
> +       mpd = devm_kzalloc(dev, sizeof(*mpd), GFP_KERNEL);
> +       if (!mpd)
> +               return ERR_PTR(-ENOMEM);
> +
> +       mpd->dev = dev;
> +       mpd->num_domains = num_domains;
> +
> +       mpd->virt_devs = devm_kmalloc_array(dev, mpd->num_domains,
> +                                           sizeof(*mpd->virt_devs),
> +                                           GFP_KERNEL);
> +       if (!mpd->virt_devs)
> +               return ERR_PTR(-ENOMEM);
> +
> +       mpd->links = devm_kmalloc_array(dev, mpd->num_domains,
> +                                       sizeof(*mpd->links), GFP_KERNEL);
> +       if (!mpd->links)
> +               return ERR_PTR(-ENOMEM);
> +
> +       for (i = 0; i < mpd->num_domains; i++) {
> +               mpd->virt_devs[i] = dev_pm_domain_attach_by_id(dev, i);
> +               if (IS_ERR(mpd->virt_devs[i])) {
> +                       retp = (struct dev_multi_pm_domain_data *)
> +                               mpd->virt_devs[i];
> +                       goto exit_unroll_pm;
> +               }
> +               mpd->links[i] = device_link_add(dev, mpd->virt_devs[i],
> +                                               DL_FLAG_STATELESS |
> +                                               DL_FLAG_PM_RUNTIME |
> +                                               DL_FLAG_RPM_ACTIVE);

As a suggestion to be a little bit more flexible, perhaps these bits
should be given as an in-parameter instead. Potentially we could then
also treat the in-parameter being zero, as that no device link should
be added.

Although, it's kind of hard to know as the users of this interface
aren't really widely known yet.

> +               if (!mpd->links[i]) {
> +                       retp = ERR_PTR(-ENOMEM);
> +                       dev_pm_domain_detach(mpd->virt_devs[i], false);
> +                       goto exit_unroll_pm;
> +               }
> +       }
> +       return mpd;
> +
> +exit_unroll_pm:
> +       while (--i >= 0) {
> +               device_link_del(mpd->links[i]);
> +               dev_pm_domain_detach(mpd->virt_devs[i], false);
> +       }
> +
> +       return retp;
> +}
> +EXPORT_SYMBOL(dev_multi_pm_attach);
> +

[...]

Kind regards
Uffe
