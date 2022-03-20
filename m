Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD3A4E4295
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Mar 2022 16:12:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50F1716D5;
	Tue, 22 Mar 2022 16:11:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50F1716D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647961957;
	bh=5vZj/bNP8k1FG7q4QIEvMAZwlyiOCZjgU3AhimqBAFw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TmxvbEU0jgA4IMjTH1NkCcQkoiAKVsXF0ianCGMCm0Mm0KwXoYHXtj8IskA2uih16
	 pPojQjoFLnK1eix9XP9CIrkGV+jgKDtuZPU3sTxLhTKduP6MZL8gkm79B7dtDeFhZS
	 /xe4VgAYO9h9NVg4lYeLXypYnvLpeqLolkfjhXMA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7E2AF80526;
	Tue, 22 Mar 2022 16:10:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB24DF80253; Sun, 20 Mar 2022 14:02:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5356F80109
 for <alsa-devel@alsa-project.org>; Sun, 20 Mar 2022 14:02:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5356F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FfWmFrmG"
Received: by mail-qv1-xf2a.google.com with SMTP id gh15so5151612qvb.8
 for <alsa-devel@alsa-project.org>; Sun, 20 Mar 2022 06:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gcqW7UEzOxBVIMD41+JK63ucodStg12ZivivGDJ0W6o=;
 b=FfWmFrmGHALDvL4MH8F2YLXXFyioPrRSCqFEqBQHOFAe1GzMRkzG1+kC1Vt3P7CdL/
 f9FVI4HECemmhYuoC3PQsfex8TnvaDby54wpfVE4i/jfbjnjL6h7LPkMA+36gv2Enk0Q
 OVgKseA+QBk8b5UIWQzcpS2zNfEeZJUO5+OrNGHR277cK57nzRBhhbb1sNa7Gsw11JaT
 4h1YYnEgKQ/ChwYoRTxRck98XrF/gPQvNa+Dh89ecjljCl/Tux5bHKhtBjDKxy8CnXuM
 tDwD90eIHq1YpUUFgdcp1CT7JHlRWYwcGlofNmtxoYiJroCR0eFYZ29ALG4lBoHXnhPK
 89xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gcqW7UEzOxBVIMD41+JK63ucodStg12ZivivGDJ0W6o=;
 b=kr67KV8IlnwA6Ttlqbl8V269IalNDs7gJvBznyEvAApbxxukeYVY7DzuGCygZtKnkX
 hed+AFZN9AAqCQLQqFQikdTy5K3ad7jEr8GxNVwISinBjPy5zw/y5AZMgbYsUmjIfcz+
 LYVoy02g8msDs7QQjcMiCxdevITiQpoX7j+fzzeH0TEcM2JjTPd2lmjHZxmLaTQJOau4
 ALCZGDgUnzYYW9Im9nSZ/g+ef/KROf4JI05hBKOuQjdJCi5w22s2LXJwworDfQHqQET7
 MJFIc2jTOe+s8b5dQzqx1niBGgVyd71RWiqe77HwDbqzlhRxEisxhVx0esZ8A3tHJGIU
 7iSA==
X-Gm-Message-State: AOAM533a803Y7DIjUb6hQNs2PdN/6BdPwVSQswHmoGlLDYI1m0xxVSW3
 1DKNmy/3EMnbWZsZ0uWV2ZlykM805Yvl4EHXC4U=
X-Google-Smtp-Source: ABdhPJz9f2B/NfP6ZH1mQTpSC0rxnf2LlpHCnhNEJPE/jjb3sXdjiEJXss/Q+Y+2AwHgvuArm3fA/P++Ur+6HqS0BOA=
X-Received: by 2002:a05:6214:c67:b0:435:bbb2:5c40 with SMTP id
 t7-20020a0562140c6700b00435bbb25c40mr12738681qvj.21.1647781323142; Sun, 20
 Mar 2022 06:02:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220318093536.15385-1-tangmeng@uniontech.com>
In-Reply-To: <20220318093536.15385-1-tangmeng@uniontech.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sun, 20 Mar 2022 21:01:52 +0800
Message-ID: <CAA+D8APyyp1j=kSsTxYQFHqqajU6KbdAYmenkFtfxBPaBMO2uA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: Fix jack_event() always return 0
To: Meng Tang <tangmeng@uniontech.com>
X-Mailman-Approved-At: Tue, 22 Mar 2022 16:10:02 +0100
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
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

Hi

On Fri, Mar 18, 2022 at 5:35 PM Meng Tang <tangmeng@uniontech.com> wrote:

> Today, hp_jack_event and mic_jack_event always return 0. However,
> snd_soc_dapm_disable_pin and snd_soc_dapm_enable_pin may return a
> non-zero value, this will cause the user who calling hp_jack_event
> and mic_jack_event don't know whether the operation was really
> successfully.
>
> This patch corrects the behavior by properly returning 1 when the
> value gets updated.
>
> Signed-off-by: Meng Tang <tangmeng@uniontech.com>
> ---
>  sound/soc/fsl/fsl-asoc-card.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
> index 370bc790c6ba..f2641c2cb047 100644
> --- a/sound/soc/fsl/fsl-asoc-card.c
> +++ b/sound/soc/fsl/fsl-asoc-card.c
> @@ -457,16 +457,18 @@ static int fsl_asoc_card_audmux_init(struct
> device_node *np,
>  static int hp_jack_event(struct notifier_block *nb, unsigned long event,
>                          void *data)
>  {
> +       int ret;
> +
>         struct snd_soc_jack *jack = (struct snd_soc_jack *)data;
>         struct snd_soc_dapm_context *dapm = &jack->card->dapm;

The "int ret" should be here.
The variables have order, the short one should be behind the long one.


>




>         if (event & SND_JACK_HEADPHONE)
>                 /* Disable speaker if headphone is plugged in */
> -               snd_soc_dapm_disable_pin(dapm, "Ext Spk");
> +               ret = snd_soc_dapm_disable_pin(dapm, "Ext Spk");
>         else
> -               snd_soc_dapm_enable_pin(dapm, "Ext Spk");
> +               ret = snd_soc_dapm_enable_pin(dapm, "Ext Spk");
>
> -       return 0;
> +       return ret;
>  }
>
>  static struct notifier_block hp_jack_nb = {
> @@ -476,16 +478,18 @@ static struct notifier_block hp_jack_nb = {
>  static int mic_jack_event(struct notifier_block *nb, unsigned long event,
>                           void *data)
>  {
> +       int ret;
> +
>         struct snd_soc_jack *jack = (struct snd_soc_jack *)data;
>         struct snd_soc_dapm_context *dapm = &jack->card->dapm;
>
ditto.

>
>         if (event & SND_JACK_MICROPHONE)
>                 /* Disable dmic if microphone is plugged in */
> -               snd_soc_dapm_disable_pin(dapm, "DMIC");
> +               ret = snd_soc_dapm_disable_pin(dapm, "DMIC");
>         else
> -               snd_soc_dapm_enable_pin(dapm, "DMIC");
> +               ret = snd_soc_dapm_enable_pin(dapm, "DMIC");
>
> -       return 0;
> +       return ret;
>  }
>
>  static struct notifier_block mic_jack_nb = {
> --
> 2.20.1
>
>
>
>
