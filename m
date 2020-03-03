Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3B91776CE
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Mar 2020 14:19:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 271161684;
	Tue,  3 Mar 2020 14:18:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 271161684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583241560;
	bh=65n561VtKXigdEgKq6a3V5RunbVkoTfwTsHNKg2JC6Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HUOiwb5SvEAbs2oh7KoC9zpPr3IgB/v+JvLumb1B7349Jx0XX9GJzomrCHp0Ghuuf
	 6c1bjDgHriwQe8nL0OPwt1U0t7iBOdrjyN1YWForM40oAdjIFRB8749Er0AgxBvuEZ
	 uhHIXy/zDBCPW1peGmdLuKsayQ/7rWGYoyYjTNRo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DB14F80131;
	Tue,  3 Mar 2020 14:17:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3A8DF8025F; Tue,  3 Mar 2020 14:17:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30892F80131
 for <alsa-devel@alsa-project.org>; Tue,  3 Mar 2020 14:17:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30892F80131
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OuocMO5b"
Received: by mail-wm1-x341.google.com with SMTP id 6so3133586wmi.5
 for <alsa-devel@alsa-project.org>; Tue, 03 Mar 2020 05:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x1haolJvTMTs4qAKKQpFP8pY7Ez4bO8I0NW3W3vGhjY=;
 b=OuocMO5bejjzlYN7dgw8I+8i7eYd2hQHN4Z6zRclkIyqy204aGYP9hBgL0OfmqkUs2
 VwkGfDLA7OjW5W7CCKViNtEZZaKACTs29/be0YTbgm/2tmmJdc+zsgurpV68PSrI4n0y
 qZGu/h11pBgohxtCnuw9NS+/rL/fghbF5xQ9vGE6m3ZCWB4kYe1/SQko1ja8UCdmqBMb
 wMtj0pF8zR9m+qrZJof85tZdKOtQBz+s9o0hc2wRsHqnPExf3XHgaNSMhvoJxkLgV23j
 plKLYqojWrxfJGa8HkPldn1PPKxCakR7AHxQ8v1Qd88GfCwh9lu8b/GzjTgtAxKvVLgD
 qWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x1haolJvTMTs4qAKKQpFP8pY7Ez4bO8I0NW3W3vGhjY=;
 b=ttVaVzLjW4urkvAUPqjqkk7jyJxP9ma7xbjFcXak7bMAzdLd2+NonC+AONHA6wXKGt
 qHmhsThGkieeafhbPz2sBiQ/okkEuFMcXwbAWj6sagI1ljx1KfBuhmJxlDLOdz9W/cVS
 +bvXtHDDAZFodQVt6VNwppO9YFg8Oju3xnHtFFCZfsuHw8PDNGKjsvQvjaa27ZhBsL5A
 EWN/xK/S833aQykg2TdCzAn/oO2VY4DGy4cgH7LDWROmxmBVWRwYafXT5xkx280cw1hq
 VIGBBCqv13IToZmS6rA4ye5oEpNfaQdM0P/M7Nx1qLiMvR2v5sAr98HJBHNw8f8v4nMG
 CwZw==
X-Gm-Message-State: ANhLgQ0z8u2GyEM7VjDJqLYBNt0p87CXLf3aLWFIBbo+T+MlBUI5ROnx
 T9LVOWkR4MS82Khzk9Ll4qORJcOM9UyDPUPcwvA=
X-Google-Smtp-Source: ADFU+vtrqxh9biAxeykoHsq+WDr8PQuEooauex3an4mdH3DhWCElhBl6tZ0babeoVFgVsf3/xOOvr2qyvHAvbWS8TDs=
X-Received: by 2002:a1c:9e51:: with SMTP id h78mr4179705wme.44.1583241453088; 
 Tue, 03 Mar 2020 05:17:33 -0800 (PST)
MIME-Version: 1.0
References: <20200302205700.29746-1-daniel.baluta@oss.nxp.com>
 <20200302205700.29746-3-daniel.baluta@oss.nxp.com>
 <CAFQqKeUSf_KJ3MBumZTEEUc+kUdLnL5y=kvQ2x75FziJUECqpA@mail.gmail.com>
In-Reply-To: <CAFQqKeUSf_KJ3MBumZTEEUc+kUdLnL5y=kvQ2x75FziJUECqpA@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 3 Mar 2020 15:17:21 +0200
Message-ID: <CAEnQRZBOpYASGTuBQ2Fz6Lg=L5otR2r8yr=XhsWSCHjmaB_L8w@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] ASoC: SOF: Use multi PM domains helpers
To: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Pavel Machek <pavel@ucw.cz>, Fabio Estevam <festevam@gmail.com>,
 khilman@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 dl-linux-imx <linux-imx@nxp.com>, "Brown, Len" <len.brown@intel.com>,
 linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Paul Olaru <paul.olaru@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Aisheng Dong <aisheng.dong@nxp.com>, Greg KH <gregkh@linuxfoundation.org>,
 "S.j. Wang" <shengjiu.wang@nxp.com>, rjw@rjwysocki.net,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
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

On Mon, Mar 2, 2020 at 11:26 PM Sridharan, Ranjani
<ranjani.sridharan@intel.com> wrote:
>
>
>
> On Mon, Mar 2, 2020 at 1:00 PM Daniel Baluta <daniel.baluta@oss.nxp.com> wrote:
>>
>> From: Daniel Baluta <daniel.baluta@nxp.com>
>>
>> Use dev_multi_pm_attach / dev_multi_pm_detach instead of the hardcoded
>> version.
>>
>> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>> ---
>>  sound/soc/sof/imx/imx8.c | 54 +++++-----------------------------------
>>  1 file changed, 6 insertions(+), 48 deletions(-)
>>
>> diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
>> index b692752b2178..ca740538a2d5 100644
>> --- a/sound/soc/sof/imx/imx8.c
>> +++ b/sound/soc/sof/imx/imx8.c
>> @@ -51,10 +51,7 @@ struct imx8_priv {
>>         struct imx_sc_ipc *sc_ipc;
>>
>>         /* Power domain handling */
>> -       int num_domains;
>> -       struct device **pd_dev;
>> -       struct device_link **link;
>> -
>> +       struct dev_multi_pm_domain_data *mpd;
>>  };
>>
>>  static void imx8_get_reply(struct snd_sof_dev *sdev)
>> @@ -207,7 +204,6 @@ static int imx8_probe(struct snd_sof_dev *sdev)
>>         struct resource res;
>>         u32 base, size;
>>         int ret = 0;
>> -       int i;
>>
>>         priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>>         if (!priv)
>> @@ -218,39 +214,9 @@ static int imx8_probe(struct snd_sof_dev *sdev)
>>         priv->sdev = sdev;
>>
>>         /* power up device associated power domains */
>> -       priv->num_domains = of_count_phandle_with_args(np, "power-domains",
>> -                                                      "#power-domain-cells");
>> -       if (priv->num_domains < 0) {
>> -               dev_err(sdev->dev, "no power-domains property in %pOF\n", np);
>> -               return priv->num_domains;
>> -       }
>> -
>> -       priv->pd_dev = devm_kmalloc_array(&pdev->dev, priv->num_domains,
>> -                                         sizeof(*priv->pd_dev), GFP_KERNEL);
>> -       if (!priv->pd_dev)
>> -               return -ENOMEM;
>> -
>> -       priv->link = devm_kmalloc_array(&pdev->dev, priv->num_domains,
>> -                                       sizeof(*priv->link), GFP_KERNEL);
>> -       if (!priv->link)
>> -               return -ENOMEM;
>> -
>> -       for (i = 0; i < priv->num_domains; i++) {
>> -               priv->pd_dev[i] = dev_pm_domain_attach_by_id(&pdev->dev, i);
>> -               if (IS_ERR(priv->pd_dev[i])) {
>> -                       ret = PTR_ERR(priv->pd_dev[i]);
>> -                       goto exit_unroll_pm;
>> -               }
>> -               priv->link[i] = device_link_add(&pdev->dev, priv->pd_dev[i],
>> -                                               DL_FLAG_STATELESS |
>> -                                               DL_FLAG_PM_RUNTIME |
>> -                                               DL_FLAG_RPM_ACTIVE);
>> -               if (!priv->link[i]) {
>> -                       ret = -ENOMEM;
>> -                       dev_pm_domain_detach(priv->pd_dev[i], false);
>> -                       goto exit_unroll_pm;
>> -               }
>> -       }
>> +       priv->mpd = dev_multi_pm_attach(&pdev->dev);
>> +       if (IS_ERR(priv->mpd))
>> +               return PTR_ERR(priv->mpd);
>>
>>         ret = imx_scu_get_handle(&priv->sc_ipc);
>>         if (ret) {
>> @@ -329,25 +295,17 @@ static int imx8_probe(struct snd_sof_dev *sdev)
>>  exit_pdev_unregister:
>>         platform_device_unregister(priv->ipc_dev);
>>  exit_unroll_pm:
>
> Can we also rename the label to exit_pm_detach maybe? It is no longer an unroll anymore right?

Sure, will do in v2.
