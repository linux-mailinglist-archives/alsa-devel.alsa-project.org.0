Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6C83FAE65
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Aug 2021 22:25:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B927216BC;
	Sun, 29 Aug 2021 22:25:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B927216BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630268751;
	bh=N0ixEwR9IrPsmYEoUb/KJ9XQ6gi3qG6Zk/mzgjkMkjk=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lOX02PESMqTAe2NQA9MbDhQMIlpwCOvqCxa9QnH9D2dP4acrsyos4sf2lUl22cNJ7
	 lzxyzsE9ku87VyKAhdqgqzXsKjBo2cdSPCGV3du1KRHMYNmBfRFwVRoZdQtHYm7W0V
	 xx3pJ+atszn/5eG3OsRRbTnD1zILVrg6KHd6ktfg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12BF8F80143;
	Sun, 29 Aug 2021 22:24:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E871F8025B; Sun, 29 Aug 2021 22:23:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4809DF80246
 for <alsa-devel@alsa-project.org>; Sun, 29 Aug 2021 22:22:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4809DF80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Pnq/d4Zw"
Received: by mail-pj1-x102b.google.com with SMTP id fs6so8074465pjb.4
 for <alsa-devel@alsa-project.org>; Sun, 29 Aug 2021 13:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=lUdLcEb5Tmdc/FiLqJBGBomz5H00VjNXR4RXZ2to9hc=;
 b=Pnq/d4ZwKs4CMPhUR+nJGtdzzgOnIH0lRnaD2VgPf7f1WTX5FKHAlV4nAU6AMzVZ3K
 2posT+1xQ4N/YXVAY35x1HDK9vAN8P9Mk1Fh0k3mRp96K+83qcEMfvutvsDTIuP/75mV
 yS6VfAkM7SQrraCDFQL7fCvJA6dyEf7SOFClRjJpzjhY6NkZUhsDzc/IVxpY5jS5a+m9
 ZCYegZeFCm7lVys7DaG42zYpMREDMayLjfIC5EubkVzH/Rv28jbJzh1wazALn84+FGGV
 iJ/viKu9hw5Lvd3oo2AfUxuido4/5GKLeoj7Rzw8j/MXyQ9UT7aLCCA0F8Z3xdGwf9fF
 XwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=lUdLcEb5Tmdc/FiLqJBGBomz5H00VjNXR4RXZ2to9hc=;
 b=kVXg0N7O/Ltx1OzSU6vzGWBMFpfXq3pYT6vWPRQOHJe7AQsBCDRuibdCi9n6Eqm/v/
 T1jvhs53El//num14iASUsYqceCL7tuwDub8euPJb5/iEvvukSvRfX0VJOLBN2zkGCxN
 fvV766y8D1DiSZlDEJKH8lSQOMKWPDSjxh7qbUrGx/sf9VqquhGEiHrW3OZRFsRjbT5U
 1s/r5v6YsdWRxZKrVmdTHgqp9j75v36l/Iakxh5qJ0KIujZ8OZ0VzciEggkJreLCXTzq
 VmAUQUH6QQkrX8QmU3wen45dJ2J3Cn7HLwNcapyuZ8bnwrGxGLOdMPDYW7WNuWlQobFk
 BUHQ==
X-Gm-Message-State: AOAM530N782Y6Oz/X2pV+kMG78wLbCWStdsSwyb8Rbv8AYlbVXa0L0sW
 tn0kq3NgqtUWUAxxh/u3k8k5jYxJuG8g1nw+Pf4=
X-Google-Smtp-Source: ABdhPJwcuQGvXgpI14StoJe7dwFaCe8Q8QCBhxF3x4K88AGcABAW3cLzJTtNs+VP5wtWikeJPYY0cUvbsVrvZv8vffc=
X-Received: by 2002:a17:903:120e:b0:138:d732:3b01 with SMTP id
 l14-20020a170903120e00b00138d7323b01mr2736458plh.21.1630268555573; Sun, 29
 Aug 2021 13:22:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90b:ed4:0:0:0:0 with HTTP; Sun, 29 Aug 2021 13:22:35
 -0700 (PDT)
In-Reply-To: <20210829170019.384632-2-atafalla@dnyon.com>
References: <20210829170019.384632-1-atafalla@dnyon.com>
 <20210829170019.384632-2-atafalla@dnyon.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 29 Aug 2021 23:22:35 +0300
Message-ID: <CAHp75VdY9uoTWeJEroi3iChnToUSxe+Henmg7Yux+UWkK59jQg@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/2] ASoC: max98927: Handle reset gpio when probing
 i2c
To: Alejandro Tafalla <atafalla@dnyon.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
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

On Sunday, August 29, 2021, Alejandro Tafalla <atafalla@dnyon.com> wrote:

> Drive the reset gpio if defined in the DTS node.
>
> Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
> ---
>  sound/soc/codecs/max98927.c | 16 ++++++++++++++++
>  sound/soc/codecs/max98927.h |  1 +
>  2 files changed, 17 insertions(+)
>
> diff --git a/sound/soc/codecs/max98927.c b/sound/soc/codecs/max98927.c
> index 8b206ee77709..dacf64c4cdf7 100644
> --- a/sound/soc/codecs/max98927.c
> +++ b/sound/soc/codecs/max98927.c
> @@ -898,6 +898,22 @@ static int max98927_i2c_probe(struct i2c_client *i2c,
>                 return ret;
>         }
>
> +       max98927->reset_gpio
> +               = devm_gpiod_get_optional(&i2c->dev, "reset",
> GPIOD_OUT_HIGH);
> +       if (IS_ERR(max98927->reset_gpio)) {
> +               ret = PTR_ERR(max98927->reset_gpio);
> +               dev_err(&i2c->dev,
> +                       "Failed to request GPIO reset pin, error %d\n",
> ret);
> +               return ret;



Spamming logs is not good. Use

return dev_err_probe(...);




> +       }
> +
> +       if (max98927->reset_gpio) {
> +               gpiod_set_value_cansleep(max98927->reset_gpio, 0);



You may request the pin in a proper state, also with current code you seems
mishandle the conception of the logical pin level vs. physical one.


> +               usleep_range(5, 10)
> +               gpiod_set_value_cansleep(max98927->reset_gpio, 1);
> +               usleep_range(1, 5)
> +       }
> +
>         /* Check Revision ID */
>         ret = regmap_read(max98927->regmap,
>                 MAX98927_R01FF_REV_ID, &reg);
> diff --git a/sound/soc/codecs/max98927.h b/sound/soc/codecs/max98927.h
> index 05f495db914d..5c04bf38e24a 100644
> --- a/sound/soc/codecs/max98927.h
> +++ b/sound/soc/codecs/max98927.h
> @@ -255,6 +255,7 @@ struct max98927_priv {
>         struct regmap *regmap;
>         struct snd_soc_component *component;
>         struct max98927_pdata *pdata;



> +       struct gpio_desc *reset_gpio;


Why? Are you using it outside of ->probe()?


>         unsigned int spk_gain;
>         unsigned int sysclk;
>         unsigned int v_l_slot;
> --
> 2.32.0
>
>

-- 
With Best Regards,
Andy Shevchenko
