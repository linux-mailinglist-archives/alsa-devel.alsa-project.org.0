Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9D8332E68
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 19:40:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C971B1867;
	Tue,  9 Mar 2021 19:39:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C971B1867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615315228;
	bh=DZvKjV35vWqAPtpWegGgnDSV7d90NgxrTuJ9/Lj0gSk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dhPL3fn4w1FsbgRAAbPBPrP6s+lCRtRBPIwoWREx9ru95PZ1jHtx7VSvE4jnPtMP+
	 zW1+EkH1sd8V9pMv1B+sq2MzLzWS+yEmuopAPdH7j/W+8Q07scz3RIpWTqLytWvAUu
	 ShroZ+ErzO7wbt1+LDleVZPpmCQymaJ8C6FbY/5A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64361F80256;
	Tue,  9 Mar 2021 19:38:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12058F80227; Tue,  9 Mar 2021 19:38:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97742F80166
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 19:38:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97742F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="rgScRL5N"
Received: by mail-qk1-x735.google.com with SMTP id d20so14128645qkc.2
 for <alsa-devel@alsa-project.org>; Tue, 09 Mar 2021 10:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zgU8bMpRI1bkrqtIh7ngjsrwlApcszyOztBVWzVM7vo=;
 b=rgScRL5NzA/2QSvhyr14tpKtPUqv6Z+CDVV6ACPJUJ8RIq7UBPvm9M67SN+xDtT4k8
 aupjDvvIbk2bUSMSIPuCKK+IUwDv3UFr5SzDKFnx3iTWNFjPmNx5GzQ7jVSAyTv22tIQ
 c2vCc93kPLHWbMHtGaz6AQ6EIHtuHjdX0RAiFetSmxy5Ck0IaMlTZY1+UvC8Qz31D2HS
 DJu+DxTUwdGMtjtk+EywRaaV23hwiKlL1Jhud9EVNU4fTkc+neBnbgmYijedJFyoaslH
 by/uMQ2Zym9OU91etac30eayk3yCDtt8jRuqB2eBSnNwf1dqP/35wP119uVMwB/ZGyc0
 HLJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zgU8bMpRI1bkrqtIh7ngjsrwlApcszyOztBVWzVM7vo=;
 b=eHQwvj6VZGngCqRaX/SaNObvf4WVet/FLv+XQrTLmIBA8xNa3nXnp8MRw9nYvlcW/u
 0ct7ZS6jTR64CgFLbos5W1eSYZ9wid/+0gzUtqFi5sZpvIa9xJHCmQoUYFkSKBt6Bx/y
 QsH0xKqijxgYCdvlB0lEEECP/gNu2x9HeZWi/wXw10UW5YGu0MA7AtL6A8Grqt6skL4u
 CPAVcEAHOPH83M7/O37CPJT+FhaQDcFZ6dEueiIJ5oKgk0+Ar48FOfWVQbfjrPg2kg7O
 hZe7FYSX3ZuMBRRCfu+rmGic6AFh0io3eGeJ0uWNsf4pjERxklKxjDxuMLWPSHgxMi7o
 0ftQ==
X-Gm-Message-State: AOAM531/OOEHqmmGL0jyfuuuVdy7KBWPsMkJOZy16pXkzxQodY109rx0
 z8+d1J9L/qSCfFz7IqnOra+RcuB6770WPJuLsBJO3g==
X-Google-Smtp-Source: ABdhPJygtTpgzFM3VZSwSYuOlCvMWdtcpRB/BW/DaqpP6VN8AwChkHOWORhfWEnCFcI8m5Iqv3SHgzfTtPZxzyXH3zE=
X-Received: by 2002:a37:5943:: with SMTP id n64mr27376037qkb.127.1615315127514; 
 Tue, 09 Mar 2021 10:38:47 -0800 (PST)
MIME-Version: 1.0
References: <20210309085827.32032-1-shumingf@realtek.com>
In-Reply-To: <20210309085827.32032-1-shumingf@realtek.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Tue, 9 Mar 2021 10:38:37 -0800
Message-ID: <CAOReqxgPnL51MNY6Z4JHnNSbkjKnuZG+LQGWYNKMaob4f_pqcw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rt5682: add delay time of workqueue to control next
 IRQ event
To: Shuming Fan <shumingf@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>, "Nujella,
 Sathyanarayana" <sathyanarayana.nujella@intel.com>, "Arava,
 Jairaj" <jairaj.arava@intel.com>, "Flove\(HsinFu\)" <flove@realtek.com>
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

On Tue, Mar 9, 2021 at 12:58 AM <shumingf@realtek.com> wrote:
>
> From: Shuming Fan <shumingf@realtek.com>
>
> This patch keeps the delay time (50 ms) for jack detection and zero delay time for the button press.
> This patch improves the reaction of the button press.
>
> Signed-off-by: Shuming Fan <shumingf@realtek.com>

Thanks for fixing this up

Tested-by Curtis Malainey <cujomalainey@chromium.org>

> ---
>  sound/soc/codecs/rt5682-i2c.c | 2 +-
>  sound/soc/codecs/rt5682-sdw.c | 2 +-
>  sound/soc/codecs/rt5682.c     | 2 ++
>  sound/soc/codecs/rt5682.h     | 1 +
>  4 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/codecs/rt5682-i2c.c b/sound/soc/codecs/rt5682-i2c.c
> index 93c1603b42f1..8ea9f1d9fec0 100644
> --- a/sound/soc/codecs/rt5682-i2c.c
> +++ b/sound/soc/codecs/rt5682-i2c.c
> @@ -78,7 +78,7 @@ static irqreturn_t rt5682_irq(int irq, void *data)
>         struct rt5682_priv *rt5682 = data;
>
>         mod_delayed_work(system_power_efficient_wq,
> -               &rt5682->jack_detect_work, msecs_to_jiffies(250));
> +               &rt5682->jack_detect_work, msecs_to_jiffies(rt5682->irq_work_delay_time));
>
>         return IRQ_HANDLED;
>  }
> diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
> index 5e097f776561..fed80c8f994f 100644
> --- a/sound/soc/codecs/rt5682-sdw.c
> +++ b/sound/soc/codecs/rt5682-sdw.c
> @@ -677,7 +677,7 @@ static int rt5682_interrupt_callback(struct sdw_slave *slave,
>
>         if (status->control_port & 0x4) {
>                 mod_delayed_work(system_power_efficient_wq,
> -                       &rt5682->jack_detect_work, msecs_to_jiffies(250));
> +                       &rt5682->jack_detect_work, msecs_to_jiffies(rt5682->irq_work_delay_time));
>         }
>
>         return 0;
> diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
> index 559dc6db1f7c..0e2a10ed11da 100644
> --- a/sound/soc/codecs/rt5682.c
> +++ b/sound/soc/codecs/rt5682.c
> @@ -1094,6 +1094,7 @@ void rt5682_jack_detect_handler(struct work_struct *work)
>                         /* jack was out, report jack type */
>                         rt5682->jack_type =
>                                 rt5682_headset_detect(rt5682->component, 1);
> +                       rt5682->irq_work_delay_time = 0;
>                 } else if ((rt5682->jack_type & SND_JACK_HEADSET) ==
>                         SND_JACK_HEADSET) {
>                         /* jack is already in, report button event */
> @@ -1139,6 +1140,7 @@ void rt5682_jack_detect_handler(struct work_struct *work)
>         } else {
>                 /* jack out */
>                 rt5682->jack_type = rt5682_headset_detect(rt5682->component, 0);
> +               rt5682->irq_work_delay_time = 50;
>         }
>
>         snd_soc_jack_report(rt5682->hs_jack, rt5682->jack_type,
> diff --git a/sound/soc/codecs/rt5682.h b/sound/soc/codecs/rt5682.h
> index 1f9c51a5b9bf..74ff66767016 100644
> --- a/sound/soc/codecs/rt5682.h
> +++ b/sound/soc/codecs/rt5682.h
> @@ -1439,6 +1439,7 @@ struct rt5682_priv {
>         int pll_out[RT5682_PLLS];
>
>         int jack_type;
> +       int irq_work_delay_time;
>  };
>
>  extern const char *rt5682_supply_names[RT5682_NUM_SUPPLIES];
> --
> 2.29.0
>
