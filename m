Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDDD1B4C0
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2019 13:18:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49E9D16A3;
	Mon, 13 May 2019 13:17:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49E9D16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557746284;
	bh=ZgQUteAr6pmBphjDSsiRqbShhP3zluyCFOwQQ8WATx0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FYjV+liSAIXD7y18cMLSPIA8WLQk8orRF4te2k3UlhHJhnL59o65oGVH1uNfeTzTA
	 7PmTaXLjkmr1LZsbDfu4xOMnSgTLunHZq4kWOtDlkv3UrQV3FwfTUk3xL3otmSQwVy
	 f4OgqVAKpl7BMnFt75iVLY7YGmJhVwDaymaz/gkQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 391ACF89720;
	Mon, 13 May 2019 13:15:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7022F80733; Mon, 13 May 2019 13:14:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D632F80733
 for <alsa-devel@alsa-project.org>; Mon, 13 May 2019 13:14:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D632F80733
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="p9pxyutt"
Received: by mail-ed1-x541.google.com with SMTP id w11so16995404edl.5
 for <alsa-devel@alsa-project.org>; Mon, 13 May 2019 04:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UWmGYQkX5ziDlQEAMnWWXiWNixr8ETc6toa2bNjqovo=;
 b=p9pxyutt3nteInevAPKvPqzooCTEiAwiquO+LcBVrdiBLukNvM4nG5ZQTW8QtcyVsT
 jZu83ZbINTP8vZ1TSPWXxh5LjStyLFesGIRHR0+bfcipRebTmcyfmwuuq1535mJYI57o
 BQVkIel/2raqaE1U4wX0nqm+mfOXENzHoVhjZwIBa6g6xt0zCpSNOGuEVqYYPsX13Dpc
 KCwgP5qExQ7UQjKJV1L05mlKOZtObyxN6jEO1eU4V3cqqL+R2Mf19P3nkYLaz7Mq8NKd
 LzY9b+fdOOZ5sgFqb0W4J0L+kJbV8R09Q3kjrTXFIrCmycJoSB8gpMN17V5612EdGpaR
 /0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UWmGYQkX5ziDlQEAMnWWXiWNixr8ETc6toa2bNjqovo=;
 b=VEC6ks9CLVz9HQEuxzcMtdx1s6UajudQgjR91TGDRveILL1FQLQCB7feUi7nwE6Uix
 lQwEqEUiboVXFl/DkHoy48RjEoKWBQxgr9vqEawWRYiTHUygtrX8jOa4SSe+SG5f8meF
 udjN5lyryGHg1Qzj20WAgQ0Bs9absFiSXl17DdmZOvRQJ0EJtX2td7Nhe46bjn+WGtgn
 DbYZpRMtwXRsjX+FiIO/P232ymF3g4u+VNSVDk+pPqvfiEDYiPdexk/rD6P2CO/WJ4IU
 y0ufw/L2Sfbwd6mdgHjG9kCrQSOO7RmFECCu0Tr3s17Mhz+ECgoma3hSRbUM9s6jUey/
 v7vg==
X-Gm-Message-State: APjAAAWLh01qOdilNn6TVo9HBkCqciIb5EXZfStELyGIHGWye6ZZq6MQ
 ilDXmgMeB9zgFkGNTH9aFgcdea1Dp4PL+uFjBjA=
X-Google-Smtp-Source: APXvYqxehO6qr0CVLbZ/ewnxhNOUYns80zBSSRxZ/Oe/UAEL7fk2757r5dLBz6+hh8X23yEasknD3OzQVXJ3eUtlp7s=
X-Received: by 2002:a50:9441:: with SMTP id q1mr28451354eda.101.1557746086425; 
 Mon, 13 May 2019 04:14:46 -0700 (PDT)
MIME-Version: 1.0
References: <1557741724-6859-1-git-send-email-viorel.suman@nxp.com>
 <1557741724-6859-3-git-send-email-viorel.suman@nxp.com>
In-Reply-To: <1557741724-6859-3-git-send-email-viorel.suman@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 13 May 2019 14:14:35 +0300
Message-ID: <CAEnQRZDqaXPaE_RiSRmKfqOkwORp5zPoigG2sDAt52zwVWwGow@mail.gmail.com>
To: Viorel Suman <viorel.suman@nxp.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "S.j. Wang" <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Viorel Suman <viorel.suman@gmail.com>,
 Julia Lawall <Julia.Lawall@lip6.fr>, Mark Brown <broonie@kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>, Colin Ian King <colin.king@canonical.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [alsa-devel] [PATCH V2 2/2] ASoC: ak4458: add return value for
	ak4458_probe
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

On Mon, May 13, 2019 at 1:05 PM Viorel Suman <viorel.suman@nxp.com> wrote:
>
> AK4458 is probed successfully even if AK4458 is not present - this
> is caused by probe function returning no error on i2c access failure.
> Return an error on probe if i2c access has failed.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

> ---
>  sound/soc/codecs/ak4458.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
> index baf990a..7156215 100644
> --- a/sound/soc/codecs/ak4458.c
> +++ b/sound/soc/codecs/ak4458.c
> @@ -539,9 +539,10 @@ static void ak4458_power_on(struct ak4458_priv *ak4458)
>         }
>  }
>
> -static void ak4458_init(struct snd_soc_component *component)
> +static int ak4458_init(struct snd_soc_component *component)
>  {
>         struct ak4458_priv *ak4458 = snd_soc_component_get_drvdata(component);
> +       int ret;
>
>         /* External Mute ON */
>         if (ak4458->mute_gpiod)
> @@ -549,21 +550,21 @@ static void ak4458_init(struct snd_soc_component *component)
>
>         ak4458_power_on(ak4458);
>
> -       snd_soc_component_update_bits(component, AK4458_00_CONTROL1,
> +       ret = snd_soc_component_update_bits(component, AK4458_00_CONTROL1,
>                             0x80, 0x80);   /* ACKS bit = 1; 10000000 */
> +       if (ret < 0)
> +               return ret;
>
> -       ak4458_rstn_control(component, 1);
> +       return ak4458_rstn_control(component, 1);
>  }
>
>  static int ak4458_probe(struct snd_soc_component *component)
>  {
>         struct ak4458_priv *ak4458 = snd_soc_component_get_drvdata(component);
>
> -       ak4458_init(component);
> -
>         ak4458->fs = 48000;
>
> -       return 0;
> +       return ak4458_init(component);
>  }
>
>  static void ak4458_remove(struct snd_soc_component *component)
> --
> 2.7.4
>
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
