Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1784F6559DB
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Dec 2022 12:04:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 912D1AEA7;
	Sat, 24 Dec 2022 12:03:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 912D1AEA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671879864;
	bh=P/Q27H9RPGa8JqPDyEUnihJ4Y+FCyqMf36dqDFMo2hE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=r96unjhDmkAjyjPm9nTn89SjuZ+w5msR8DFeFglDFT45xHZ5Bs6RJtNF+6aTnPAWA
	 Hu0+bZgZFd7MZBskqxzP8MzCSTSP3e/u7NCE3IVmeV/6sLoJAcyLafL0x0q6F+G1KN
	 hrt7AE62ZnE+pdymHfXlaQWrbhSZZ2EdN61FFivI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A463F8032B;
	Sat, 24 Dec 2022 12:03:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 493A5F80249; Sat, 24 Dec 2022 12:03:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9EB6F80249
 for <alsa-devel@alsa-project.org>; Sat, 24 Dec 2022 12:03:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9EB6F80249
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=LwWziywd
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-460bb6ec44bso96399107b3.1
 for <alsa-devel@alsa-project.org>; Sat, 24 Dec 2022 03:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wscqc2C27Eeh5FeH6qcDsPHlAH/sUr+ViavfKbnFGHc=;
 b=LwWziywdJQwYB9g0yUQ9icpLt6u+Cr4FiA2ZBk85IYMHET1ZVjouC9XVzrxd/NjSth
 wQ+MI4Ty9oifNntiIYGhw9FlLKO/3r50BP5FsZrAiBGBrCVEm5ITA+n1KovFZ47Bh+LB
 XHa7o8N7uMS99sG7iS1B+SEfCkuMlQlMCaJnelB0n5wkpyVca8jxYaVFDnwX+5+oSPjc
 PhpHYUwxtkb+KW9l3vpx7L1iBj6GY76QLALqk7uKarmgQ1N5SN9venCHK8n6445E1iC+
 GQdcpLcRPetwAPlT7L+8C9b7a8JS1WU4g3ODd8hmZHzR7SrJrwEjJ6hDIktMjv24QvoX
 Hs4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wscqc2C27Eeh5FeH6qcDsPHlAH/sUr+ViavfKbnFGHc=;
 b=xzyVfb3gE8lA6VH17OX4dMmF+oEFATTtkIczxkF0wGbUesiuUc5R6M3WAkawmopI/p
 4T8un7EWrIXPAcDMOBms/CEkLQQye8rXoM2KeSt0BtVcchVkyAKNToR2m+4d/M16L9DS
 8JRWdfPKno01nLs4s3CbQX9LcpNJHNwj/NlIHyXSCk3Z8eGJIifQL2mXqAwzLb1DB0r+
 lcP01JorhSLSfju/fA6M3jnVDDuvUUAVCFfWGPQ/viKuOUVF7HMGSIC4F4EqXf3AX5t9
 hIUhMuAoALi0HFVFQAqwIjY2LYOErYI+UH7fvqivtWSkXg/fP9+oiJ3ItZkVPnLOUUQ2
 fk8g==
X-Gm-Message-State: AFqh2koqxOuUUfSIgvKOdSgx4N+jtHroqSz7njfRcF8tKByrZ8OgIz5v
 yiWGYigsyFk2RkOKoieYcWEY44bEyotyU21shPKgmg==
X-Google-Smtp-Source: AMrXdXu6D08PplIiID9SMCkGNDJyskeH2mIep/a2zhdjuZ4jecR/HSzkQfPRduxZlxVHiF1IkHSnx71TNlwJSs2QMIQ=
X-Received: by 2002:a0d:f2c1:0:b0:3d6:2151:4038 with SMTP id
 b184-20020a0df2c1000000b003d621514038mr1216250ywf.418.1671879800394; Sat, 24
 Dec 2022 03:03:20 -0800 (PST)
MIME-Version: 1.0
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-5-quic_wcheng@quicinc.com>
In-Reply-To: <20221223233200.26089-5-quic_wcheng@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 24 Dec 2022 13:03:09 +0200
Message-ID: <CAA8EJprFD53zmECHJ44FpjztRjwsMym2QP_Gk-JWya-SL_ryHA@mail.gmail.com>
Subject: Re: [RFC PATCH 04/14] sound: usb: card: Introduce USB SND vendor op
 callbacks
To: Wesley Cheng <quic_wcheng@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-usb@vger.kernel.org, bgoswami@quicinc.com,
 mathias.nyman@intel.com, gregkh@linuxfoundation.org, andersson@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, agross@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Thinh.Nguyen@synopsys.com,
 quic_plai@quicinc.com, linux-kernel@vger.kernel.org, quic_jackp@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On Sat, 24 Dec 2022 at 01:33, Wesley Cheng <quic_wcheng@quicinc.com> wrote:
>
> Allow for different vendors to be notified on USB SND connect/disconnect
> seqeunces.  This allows for vendor USB SND modules to properly initialize
> and populate internal structures with references to the USB SND chip
> device.

The commit message definitely needs some improvement. We do not notify
vendors on SND connect/disconnect events.


>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/usb/card.c | 22 ++++++++++++++++++++++
>  sound/usb/card.h |  7 +++++++
>  2 files changed, 29 insertions(+)
>
> diff --git a/sound/usb/card.c b/sound/usb/card.c
> index 26268ffb8274..212f55a7683c 100644
> --- a/sound/usb/card.c
> +++ b/sound/usb/card.c
> @@ -117,6 +117,21 @@ MODULE_PARM_DESC(skip_validation, "Skip unit descriptor validation (default: no)
>  static DEFINE_MUTEX(register_mutex);
>  static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
>  static struct usb_driver usb_audio_driver;
> +static struct snd_usb_vendor_ops *vendor_ops;
> +
> +int snd_usb_register_vendor_ops(struct snd_usb_vendor_ops *ops)

platform ops?

> +{
> +       vendor_ops = ops;
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_usb_register_vendor_ops);

What happens if several platforms try to register different ops? I saw
from the patch 09/14 that you register these ops unconditionally. If
other devices follow your approach there is an obvious conflict.

> +
> +int snd_usb_unregister_vendor_ops(void)
> +{
> +       vendor_ops = NULL;
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_usb_unregister_vendor_ops);
>
>  /*
>   * disconnect streams
> @@ -910,6 +925,10 @@ static int usb_audio_probe(struct usb_interface *intf,
>         usb_set_intfdata(intf, chip);
>         atomic_dec(&chip->active);
>         mutex_unlock(&register_mutex);
> +
> +       if (vendor_ops->connect_cb)
> +               vendor_ops->connect_cb(intf, chip);
> +
>         return 0;
>
>   __error:
> @@ -943,6 +962,9 @@ static void usb_audio_disconnect(struct usb_interface *intf)
>         if (chip == USB_AUDIO_IFACE_UNUSED)
>                 return;
>
> +       if (vendor_ops->disconnect_cb)
> +               vendor_ops->disconnect_cb(intf);
> +
>         card = chip->card;
>
>         mutex_lock(&register_mutex);
> diff --git a/sound/usb/card.h b/sound/usb/card.h
> index 40061550105a..a785bb256b0d 100644
> --- a/sound/usb/card.h
> +++ b/sound/usb/card.h
> @@ -206,4 +206,11 @@ struct snd_usb_stream {
>         struct list_head list;
>  };
>
> +struct snd_usb_vendor_ops {
> +       void (*connect_cb)(struct usb_interface *intf, struct snd_usb_audio *chip);
> +       void (*disconnect_cb)(struct usb_interface *intf);
> +};
> +
> +int snd_usb_register_vendor_ops(struct snd_usb_vendor_ops *ops);
> +int snd_usb_unregister_vendor_ops(void);
>  #endif /* __USBAUDIO_CARD_H */



--
With best wishes

Dmitry
