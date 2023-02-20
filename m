Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C52F269D4FB
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Feb 2023 21:29:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21129EB3;
	Mon, 20 Feb 2023 21:28:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21129EB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676924955;
	bh=WoUsDdTqnQiHFQbNUq2TDZkO4z6hK7XK7+vzyZk9eG0=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TZA5+sonWZLAA7t4us0a1rwzh4dD9aPn9vpvuIEOzrD0oAVfXlFzhSaUd/ZQmS8Up
	 LCGQLPaJ0kVKivyWalEX/9DvosPzwBVjqK1DBUeAVBUp13QHbu1tixWgs2T27+oOpK
	 /6F1MT4HrOsal2/mSsicXT9AMdsaBYprln3MM9jg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B531F8025A;
	Mon, 20 Feb 2023 21:28:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2C49F80266; Mon, 20 Feb 2023 18:11:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	HK_RANDOM_ENVFROM,HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 618CFF800BA
	for <alsa-devel@alsa-project.org>; Mon, 20 Feb 2023 18:11:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 618CFF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=Es+PiD55
Received: by mail-io1-xd35.google.com with SMTP id y140so1327262iof.6
        for <alsa-devel@alsa-project.org>;
 Mon, 20 Feb 2023 09:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nEOyqyX16+a0s8LVg/pF7pxqSztYrWWhg38vHHBi3tk=;
        b=Es+PiD554nf4b0lw9BenSHvyrbUQvjUaddCdjlFQzviROGfsy+bH6ztbIzUJj8HN3D
         kPFalkX9vL9YMjqz+RQVaezLe3n/aWJABu/mKRnRsZo/vKgmoFbWvroh6JVpowJoBHGr
         ouIETH64oNwmqNZtENWIe7zqF1yBoI9U+pI2+rgWa0wIwTubNonQomcCnOuI+qJ1Bgyb
         c5z1Hq8/EpN92SQK6JIMTTvJqi37WvromkSXSCfimYdo4Cphf5I8fw2JhNUTYXlvXl1y
         1ylrOYnpce4/fJktTg6YdKuj1QoRl2oV/CPtP27vQ5fjr4KMO/oZ0fCrGc1WANg5I610
         tb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nEOyqyX16+a0s8LVg/pF7pxqSztYrWWhg38vHHBi3tk=;
        b=DLGQy1TKDQH+U/1p0Dxt/2FcpP4vEzpyoVADUXD2nmH751BpwSboAHQJhpefN6h1Ij
         Jgs1tuJ2QXlDwIty6pNw3AonQfxk1WX/xTkKAODHl9hd7yazMCCgsQN3ekMgQ9LyijOD
         5JF9kaUhYfFqaPbV/XjpeDTBGPW4U75lPUOB7+4/nXK3wV7dRQidLpwA5Rv8LiiSmGHZ
         8V5k135NfggbXF6yLWzQEPmzJOajEZJkuz+XjJov0fn3bwUVO8Tcgf/V2NoXXeOQapOq
         9OMefc5z5mSEwEcR4fWND1+2o3y3cRXlvmpJXxnExkLZa34kzpcqQNf8KRYeUETiCZM7
         Z+Ag==
X-Gm-Message-State: AO0yUKVro3qZNzVtiypY1CX78XWWgbt+TUeycklpviu9vErN+e+H+ecM
	sHXt7lUPRXZMuw6tECiWKGFcfclWgNvC4o9KMEXB5A==
X-Google-Smtp-Source: 
 AK7set+503zOSFCrMzUFKu9VpHP1CxTcABe7Y2qzNdRVr4GS9RE0Nr+Aep7G/9QRg/X7y9lOZcCc6YFmXuu71RYiegk=
X-Received: by 2002:a6b:6207:0:b0:71c:479d:741a with SMTP id
 f7-20020a6b6207000000b0071c479d741amr2462205iog.38.1676913075061; Mon, 20 Feb
 2023 09:11:15 -0800 (PST)
MIME-Version: 1.0
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-13-quic_wcheng@quicinc.com>
In-Reply-To: <20230126031424.14582-13-quic_wcheng@quicinc.com>
From: Albert Wang <albertccwang@google.com>
Date: Tue, 21 Feb 2023 01:11:04 +0800
Message-ID: 
 <CANqn-rhAWKVrSGKkoDCC+Jy6qdceSqo22KYb-5k+haHpcgQJaA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 12/22] sound: usb: card: Introduce USB SND platform
 op callbacks
To: Wesley Cheng <quic_wcheng@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: albertccwang@google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SSSJMLSZVEMTXV4JU4EFSNLR7XDQIZHE
X-Message-ID-Hash: SSSJMLSZVEMTXV4JU4EFSNLR7XDQIZHE
X-Mailman-Approved-At: Mon, 20 Feb 2023 20:28:17 +0000
CC: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com,
 lgirdwood@gmail.com, andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, broonie@kernel.org,
 bgoswami@quicinc.com, tiwai@suse.com, robh+dt@kernel.org, agross@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SSSJMLSZVEMTXV4JU4EFSNLR7XDQIZHE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Wesley,

It looks like your audio offload driver will fetch the required
resources for a stream enable request. But we have different designs.
In the integration with your patch set, we found we still need a call
back function in card.c when the usb set interface is done, in which
we would call the new API, xhci_get_xfer_resource(), to get the EP
transfer ring address. Of course, we will try the
platform_ops->connect_cb() first to see if it is able to cover what we
need or not.


Thanks,
Albert Wang

Albert Wang | Pixel USB Software  | albertccwang@google.com | +886-918-695-245


On Thu, Jan 26, 2023 at 11:16 AM Wesley Cheng <quic_wcheng@quicinc.com> wrote:
>
> Allow for different platforms to be notified on USB SND connect/disconnect
> seqeunces.  This allows for platform USB SND modules to properly initialize
> and populate internal structures with references to the USB SND chip
> device.
>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/usb/card.c | 28 ++++++++++++++++++++++++++++
>  sound/usb/card.h | 20 ++++++++++++++++++++
>  2 files changed, 48 insertions(+)
>
> diff --git a/sound/usb/card.c b/sound/usb/card.c
> index 26268ffb8274..803230343c16 100644
> --- a/sound/usb/card.c
> +++ b/sound/usb/card.c
> @@ -117,6 +117,24 @@ MODULE_PARM_DESC(skip_validation, "Skip unit descriptor validation (default: no)
>  static DEFINE_MUTEX(register_mutex);
>  static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
>  static struct usb_driver usb_audio_driver;
> +static struct snd_usb_platform_ops *platform_ops;
> +
> +int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops)
> +{
> +       if (platform_ops)
> +               return -EEXIST;
> +
> +       platform_ops = ops;
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_usb_register_platform_ops);
> +
> +int snd_usb_unregister_platform_ops(void)
> +{
> +       platform_ops = NULL;
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_usb_unregister_platform_ops);
>
>  /*
>   * disconnect streams
> @@ -910,6 +928,10 @@ static int usb_audio_probe(struct usb_interface *intf,
>         usb_set_intfdata(intf, chip);
>         atomic_dec(&chip->active);
>         mutex_unlock(&register_mutex);
> +
> +       if (platform_ops->connect_cb)
> +               platform_ops->connect_cb(intf, chip);
> +
>         return 0;
>
>   __error:
> @@ -943,6 +965,9 @@ static void usb_audio_disconnect(struct usb_interface *intf)
>         if (chip == USB_AUDIO_IFACE_UNUSED)
>                 return;
>
> +       if (platform_ops->disconnect_cb)
> +               platform_ops->disconnect_cb(intf);
> +
>         card = chip->card;
>
>         mutex_lock(&register_mutex);
> @@ -1087,6 +1112,9 @@ static int usb_audio_suspend(struct usb_interface *intf, pm_message_t message)
>                 chip->system_suspend = chip->num_suspended_intf;
>         }
>
> +       if (platform_ops->suspend_cb)
> +               platform_ops->suspend_cb(intf, message);
> +
>         return 0;
>  }
>
> diff --git a/sound/usb/card.h b/sound/usb/card.h
> index 40061550105a..2249c411c3a1 100644
> --- a/sound/usb/card.h
> +++ b/sound/usb/card.h
> @@ -206,4 +206,24 @@ struct snd_usb_stream {
>         struct list_head list;
>  };
>
> +struct snd_usb_platform_ops {
> +       void (*connect_cb)(struct usb_interface *intf, struct snd_usb_audio *chip);
> +       void (*disconnect_cb)(struct usb_interface *intf);
> +       void (*suspend_cb)(struct usb_interface *intf, pm_message_t message);
> +};
> +
> +#if IS_ENABLED(CONFIG_SND_USB_AUDIO)
> +int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops);
> +int snd_usb_unregister_platform_ops(void);
> +#else
> +int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops)
> +{
> +       return -EOPNOTSUPP;
> +}
> +
> +int snd_usb_unregister_platform_ops(void)
> +{
> +       return -EOPNOTSUPP;
> +}
> +#endif /* IS_ENABLED(CONFIG_SND_USB_AUDIO) */
>  #endif /* __USBAUDIO_CARD_H */
