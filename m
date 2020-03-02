Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5271765EE
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Mar 2020 22:25:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D262A168B;
	Mon,  2 Mar 2020 22:25:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D262A168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583184357;
	bh=XSSMhiR4WKiuAtEzx5SaXVtltUAG9SEuPoYpvQB8a8Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eDKz/1nCD3xpV2Xj7ozax6eBbPqERWoAf7t7gYJXYPJIqY+u5NHjo7QaEoKydHV2L
	 7tMo4fj2DcV9MSXN1puMUb3APsMhEHft6c3om32WrONlUVF+IwP863q4uIuJajAvp0
	 okbm4pze/g5cRDdvQB7X+5v95nJGW1vhfoY8ti04=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8F22F800E5;
	Mon,  2 Mar 2020 22:24:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF681F801ED; Mon,  2 Mar 2020 22:24:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D7B6F80130
 for <alsa-devel@alsa-project.org>; Mon,  2 Mar 2020 22:24:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D7B6F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="yNp0R7q9"
Received: by mail-il1-x143.google.com with SMTP id x2so797172ila.9
 for <alsa-devel@alsa-project.org>; Mon, 02 Mar 2020 13:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DHzo9cHm4Co97W568deKF+/4G+RCiUU3Uy08vgx2UJY=;
 b=yNp0R7q9YFf800Iwh1sy4etDQga8qxd6WE2s5m0C+0Oz9FxwwzlXKcjc8wjAL8D4Qt
 kuRulw+jcfv2TNNiC33GWegt2mRxKpFfey+uszC8WXCujDV0Zea0LeUljeSsQAATCvsY
 laXryN3mrzB+eA8PSaoC9/cU4KpSwhNkGnGV4tlOkxiTVNhJXKbdYr5IvEm+bh8BqkgW
 nQK4leJXB3/R+9+s+j4WcVlhWusyUzP7jQhlh8BC5OdDQV8DMRfKPUQKPRAgi1BgO/Ia
 5MjnJsoyzH9xo5CCbS9F3aKhYak+mvY/hY5knVHc4V2yjII/U3qSfYCkb41KrIuDf22I
 XkJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DHzo9cHm4Co97W568deKF+/4G+RCiUU3Uy08vgx2UJY=;
 b=qw6VfGf+dECMsFU9eMxoCpyy2nkhSf/0U2gQlCcPxQBI081T3e4UQB/4S2YsVsod4T
 DsaMcmleTG7x5ac/AgHH0n4hi2s37fxOuM088JOQG7ZWSXRvh92ZwC5JgC7cLAc2Say4
 1uTK13GbRNYFzmdfUYKmfUiB3Hh/KMMSPzUBbjBBGNrMbcXq0nJNlHNLe94KSV6GDVwo
 I7AH66FCYohQnX25noN7m8FROn0w73Kdcj0SqxtT8At95flgbCcg4eNI15NG1LCJhvHr
 gVz97hdoOxhoZ9/0/D1G5UFQFROAl1k1k7evbmguJPrwkwhm2SmA7XTnScHLSHpEbQ0R
 fVLA==
X-Gm-Message-State: ANhLgQ2GL1GmP6Jy8kpLM9RQTjnfFBeGjAB0MB586F6b9II39IavJ1lt
 DNZnWWgDrXhELuUVXvkh8GLwfT06I1gP6NYMKagbew==
X-Google-Smtp-Source: ADFU+vv1y7qX6NPpYDCAPAhut8YvJTHfxDk6IQ52tgkbQhtYrtW5QSvuMipFzf54h5uiD0+vkHoo3oHj9YAWlZZcJQQ=
X-Received: by 2002:a92:b74a:: with SMTP id c10mr1598031ilm.86.1583184243577; 
 Mon, 02 Mar 2020 13:24:03 -0800 (PST)
MIME-Version: 1.0
References: <20200302205700.29746-1-daniel.baluta@oss.nxp.com>
 <20200302205700.29746-2-daniel.baluta@oss.nxp.com>
In-Reply-To: <20200302205700.29746-2-daniel.baluta@oss.nxp.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Mon, 2 Mar 2020 13:23:52 -0800
Message-ID: <CAFQqKeU8YF+aZVTafj3ZiPvNUsx3nK-8cdr8eJUm=_9_2TkRQg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] PM / domains: Introduce multi PM domains helpers
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, ulf.hansson@linaro.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, pavel@ucw.cz,
 festevam@gmail.com, khilman@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, linux-imx@nxp.com,
 "Brown, Len" <len.brown@intel.com>, linux-pm@vger.kernel.org,
 s.hauer@pengutronix.de, paul.olaru@nxp.com,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-arm-kernel@lists.infradead.org,
 aisheng.dong@nxp.com, Daniel Baluta <daniel.baluta@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>, shengjiu.wang@nxp.com, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, shawnguo@kernel.org
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

On Mon, Mar 2, 2020 at 12:59 PM Daniel Baluta <daniel.baluta@oss.nxp.com>
wrote:

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
>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  drivers/base/power/common.c | 93 +++++++++++++++++++++++++++++++++++++
>  include/linux/pm_domain.h   | 19 ++++++++
>  2 files changed, 112 insertions(+)
>
> diff --git a/drivers/base/power/common.c b/drivers/base/power/common.c
> index bbddb267c2e6..a90cc6b476e4 100644
> --- a/drivers/base/power/common.c
> +++ b/drivers/base/power/common.c
> @@ -228,3 +228,96 @@ void dev_pm_domain_set(struct device *dev, struct
> dev_pm_domain *pd)
>         device_pm_check_callbacks(dev);
>  }
>  EXPORT_SYMBOL_GPL(dev_pm_domain_set);
> +
> +/**
> + * dev_multi_pm_attach - power up device associated power domains
> + * @dev: The device used to lookup the PM domains
> + *
> + * Parse device's OF node to find all PM domains specifiers. For each
> power
> + * domain found, create a virtual device and associate it with the
> + * current power domain.
> + *
> + * This function should typically be invoked by a driver during the
> + * probe phase, in the case its device requires power management through
> + * multiple PM domains.
> + *
> + * Returns a pointer to @dev_multi_pm_domain_data if successfully
> attached PM
> + * domains, NULL if 0 or 1 PM domains specified, else an ERR_PTR() in
> case of
> + * failures.
> + */
> +struct dev_multi_pm_domain_data *dev_multi_pm_attach(struct device *dev)
> +{
> +       struct dev_multi_pm_domain_data *mpd, *retp;
> +       int num_domains;
> +       int i;
> +
> +       num_domains = of_count_phandle_with_args(dev->of_node,
> "power-domains",
> +                                                "#power-domain-cells");
> +       if (num_domains < 2)
>
Hi Daniel,

Just out of curiosity, should it be an error when num_domains is 1? Is it
an error because the expectation is that the caller would use
dev_pm_domain_attach() in that case?

+               return NULL;
> +
> +       mpd = devm_kzalloc(dev, GFP_KERNEL, sizeof(*mpd));
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
>
Should retp be PTR_ERR(mpd->virt_devs[i]) here?
Thanks,
Ranjani
