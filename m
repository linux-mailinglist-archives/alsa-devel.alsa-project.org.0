Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 380141765F2
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Mar 2020 22:28:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D248E168B;
	Mon,  2 Mar 2020 22:27:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D248E168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583184515;
	bh=MxKNYRSc4U7voliI7J7coFQApA12uIgHOK0zI9+Ui+Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=McZifljBGr3fL9hI7F2qVb8zmh82riaNvmeJs0Xzx/6Vsks9HrtPt34CneWtaCOZJ
	 jhBMMM2ValuZg3c7XBpaBd4w61BAIosYFo0aRKYI+DO6aOSeAPWQ6DF+erZCAmyy+a
	 NyM+FeefO3rWb51nzrhoO5odNrw7VM6XcZgVVSbw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07109F80130;
	Mon,  2 Mar 2020 22:26:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F621F801ED; Mon,  2 Mar 2020 22:26:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB475F80130
 for <alsa-devel@alsa-project.org>; Mon,  2 Mar 2020 22:26:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB475F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="kiu3jdBq"
Received: by mail-il1-x141.google.com with SMTP id x7so794425ilq.11
 for <alsa-devel@alsa-project.org>; Mon, 02 Mar 2020 13:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T0HZC5wGaYiacULJL5eqjWlCdMswXyLb5S9WIdniaEo=;
 b=kiu3jdBqgM2ZLAIdq1yGcAG9wjOEhNEPM5mqLfTqDKcBmYvo7UUPh25gp6iGPlRNEG
 QoQqN43/oUpGR8SiHDd+GUXPy0ROOozxfSxvHkazWRJUZErg5EjS2Mi2Iqvti7beVKKH
 FnRTkaDkcpCp2LLq21/YKHE4WtzpHSyuqofIDawJvTA7MiblFa9fCIsfn9WWHi7wMSt6
 Yc2Wtcag8Odtncb6YoDURAE2dH5N/5BUbYx3uIRDInJWePTKv0A2t6i51+ZLlxSpb3OL
 Tuad5jrJCPEN6TFU37M2a/DaveMdN80agphGjJLTU160MaQlFcKdTi+q6oly5aafUDcL
 Jc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T0HZC5wGaYiacULJL5eqjWlCdMswXyLb5S9WIdniaEo=;
 b=XE8fv/a7TPHoYPY0cCo9QslkbkcugrSQcuXPWibZQg2ohW2HkOuWPFqOMw8NegYKd4
 eSwuC2rEYzJd2a/qrHFKDUWju/3L5wjzeqWgnJ2lhX1Cqi/mpczQAxcb9bAE0amMiP8/
 +PpuTAQfnkVn7ZBAIOJ8ak4bq/jYmeEfXSDMNkT8vy5pTgAaj/Y3pMD8QQcxOj+sOvq4
 pA/yHQ+y0JZnCJZbgOTDLuTXVv9d5vQjR8aifB07NgX7IztQke+TVZZtx4gk1DVi5zao
 HBQNvyhTz9TRluIq941S1Iq8mLMTk8n8lxDfOu4gKKmt039Yfy8+2eXdUKQWI+YNCvPG
 ooZQ==
X-Gm-Message-State: ANhLgQ3e2bjuOjVp7t+ECt+jb/wMLiLHJ1MqIBMcOIe7jw8tOy2aXIsx
 56tgBL0u28wtsJnm6BVZM4r8kfmFSe1sbHsfC6dEWA==
X-Google-Smtp-Source: ADFU+vuybSmz4rAptQcaRCKizlpWTIlyU2DreJwStc/RUwlUnqnLGVLDG0eFSiL5Ldwsx+yJ67a8ZK/MAIaA44SxCY0=
X-Received: by 2002:a92:8893:: with SMTP id m19mr1561572ilh.54.1583184406823; 
 Mon, 02 Mar 2020 13:26:46 -0800 (PST)
MIME-Version: 1.0
References: <20200302205700.29746-1-daniel.baluta@oss.nxp.com>
 <20200302205700.29746-3-daniel.baluta@oss.nxp.com>
In-Reply-To: <20200302205700.29746-3-daniel.baluta@oss.nxp.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Mon, 2 Mar 2020 13:26:36 -0800
Message-ID: <CAFQqKeUSf_KJ3MBumZTEEUc+kUdLnL5y=kvQ2x75FziJUECqpA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] ASoC: SOF: Use multi PM domains helpers
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

On Mon, Mar 2, 2020 at 1:00 PM Daniel Baluta <daniel.baluta@oss.nxp.com>
wrote:

> From: Daniel Baluta <daniel.baluta@nxp.com>
>
> Use dev_multi_pm_attach / dev_multi_pm_detach instead of the hardcoded
> version.
>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  sound/soc/sof/imx/imx8.c | 54 +++++-----------------------------------
>  1 file changed, 6 insertions(+), 48 deletions(-)
>
> diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
> index b692752b2178..ca740538a2d5 100644
> --- a/sound/soc/sof/imx/imx8.c
> +++ b/sound/soc/sof/imx/imx8.c
> @@ -51,10 +51,7 @@ struct imx8_priv {
>         struct imx_sc_ipc *sc_ipc;
>
>         /* Power domain handling */
> -       int num_domains;
> -       struct device **pd_dev;
> -       struct device_link **link;
> -
> +       struct dev_multi_pm_domain_data *mpd;
>  };
>
>  static void imx8_get_reply(struct snd_sof_dev *sdev)
> @@ -207,7 +204,6 @@ static int imx8_probe(struct snd_sof_dev *sdev)
>         struct resource res;
>         u32 base, size;
>         int ret = 0;
> -       int i;
>
>         priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>         if (!priv)
> @@ -218,39 +214,9 @@ static int imx8_probe(struct snd_sof_dev *sdev)
>         priv->sdev = sdev;
>
>         /* power up device associated power domains */
> -       priv->num_domains = of_count_phandle_with_args(np, "power-domains",
> -
> "#power-domain-cells");
> -       if (priv->num_domains < 0) {
> -               dev_err(sdev->dev, "no power-domains property in %pOF\n",
> np);
> -               return priv->num_domains;
> -       }
> -
> -       priv->pd_dev = devm_kmalloc_array(&pdev->dev, priv->num_domains,
> -                                         sizeof(*priv->pd_dev),
> GFP_KERNEL);
> -       if (!priv->pd_dev)
> -               return -ENOMEM;
> -
> -       priv->link = devm_kmalloc_array(&pdev->dev, priv->num_domains,
> -                                       sizeof(*priv->link), GFP_KERNEL);
> -       if (!priv->link)
> -               return -ENOMEM;
> -
> -       for (i = 0; i < priv->num_domains; i++) {
> -               priv->pd_dev[i] = dev_pm_domain_attach_by_id(&pdev->dev,
> i);
> -               if (IS_ERR(priv->pd_dev[i])) {
> -                       ret = PTR_ERR(priv->pd_dev[i]);
> -                       goto exit_unroll_pm;
> -               }
> -               priv->link[i] = device_link_add(&pdev->dev,
> priv->pd_dev[i],
> -                                               DL_FLAG_STATELESS |
> -                                               DL_FLAG_PM_RUNTIME |
> -                                               DL_FLAG_RPM_ACTIVE);
> -               if (!priv->link[i]) {
> -                       ret = -ENOMEM;
> -                       dev_pm_domain_detach(priv->pd_dev[i], false);
> -                       goto exit_unroll_pm;
> -               }
> -       }
> +       priv->mpd = dev_multi_pm_attach(&pdev->dev);
> +       if (IS_ERR(priv->mpd))
> +               return PTR_ERR(priv->mpd);
>
>         ret = imx_scu_get_handle(&priv->sc_ipc);
>         if (ret) {
> @@ -329,25 +295,17 @@ static int imx8_probe(struct snd_sof_dev *sdev)
>  exit_pdev_unregister:
>         platform_device_unregister(priv->ipc_dev);
>  exit_unroll_pm:
>
Can we also rename the label to exit_pm_detach maybe? It is no longer an
unroll anymore right?

Thanks,
Ranjani
