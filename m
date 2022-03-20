Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1329B4E1C0D
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Mar 2022 15:34:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 866AA16A5;
	Sun, 20 Mar 2022 15:34:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 866AA16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647786895;
	bh=Z5A/Hzxu6IWgCjzcEBgbn00BBP2hae0a7k7mXo+oPRY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UjRLrbwOHmNK+1RH1XorZtNCBkezSN/+0iU8RvvblbtZePBq2J7IJHWslRclJDpQl
	 AFh6fKndyvWnmEMEIEVP6sOWVpiXuVDpIXMgpTomVlbGFgkzBcBKgcldFcZIw+ie9Q
	 PNgd74hWICNYP7kercofyhalmtqZkkhTs+V4w5jc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02BBBF8025A;
	Sun, 20 Mar 2022 15:33:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA45DF80254; Sun, 20 Mar 2022 15:33:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19253F80054
 for <alsa-devel@alsa-project.org>; Sun, 20 Mar 2022 15:33:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19253F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="rDEVAK1f"
Received: by mail-qt1-x82a.google.com with SMTP id s11so10249114qtc.3
 for <alsa-devel@alsa-project.org>; Sun, 20 Mar 2022 07:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o1QTACLNgTMWBVvMWBXdQRAR5wUEFvN301IE3QGE3CY=;
 b=rDEVAK1f02oklJqjdGuAcoug39UJpSOSVZYe2DhoxpA1OE9ixL6uKAmIqGZbgABEsJ
 8/V2GW9V1HrNrajZ0RtvYU7E1lbzIReFL0ABI3xitMwvP4UQKOPWxPypY1qWKqrCRI2+
 sF/cDJW2YvcSn9GZdX1JYYT+/V6SRz8Tvhia/LyVHFDHYLlMGPJCbI8KgTJLZjb4XUHq
 0Dxqj9LaqnnqTXtnPxapa0yeGfGHXSHfXsK6maBKCPhgcNHC6Wwv2/2UvbyUUtut+EUA
 +2SHAKZfrjAfd3qIX2Bmjm4N9YZHC4ZpRYVOYIyhqxHHrG9JN5b10yw5OI5dXbUm/i3Y
 yhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o1QTACLNgTMWBVvMWBXdQRAR5wUEFvN301IE3QGE3CY=;
 b=UePpgE6jJ9RZtOC2WmIRQT0120K56dZmw0nQKHnPpE1gKAhzXYSw5zMsPUe48uBhCo
 KsYsXW0VXaL5RuwU1GN1W1a8D2AZK/GOhqwpd51vN3JhLeIwRQWXIMee4/IWorT4cZID
 /xhotXbyaqNDgzZH0XqFCuhQSp7z5L/K4cEdezJZAFNDFAk1NeWqZyNVky5xh0TUFHYc
 wXEsQJnIaMD5fgWrtMvdQ1kwG17Gts6bT+cMZK2XBTEq4idVQmaRf1IGkjaI/lf9ydIa
 wPmIP1WaKEauOqqoj8GUbs2JBUzC9QqreznvVEkko5l3WdjEh0GXUwniZhrJeLQOwQX0
 6Q6A==
X-Gm-Message-State: AOAM53355oZThuKgiKInzVLNgmHhQ2+cSjjougGsmUHr2p0bSkv2tDJA
 AXdd0mhE3+EufQuCL2IMjS7t581O6V6/oKl/d6enMg==
X-Google-Smtp-Source: ABdhPJx1S2mbZO1d0zk5rhucCK1mPNWHkXOv9WOKaC9FD7NuYpy/BxXguovLS/jWSvqbk/bI58P+cdkq+VeaAG2F+GQ=
X-Received: by 2002:a05:622a:181:b0:2e1:e70a:ec2a with SMTP id
 s1-20020a05622a018100b002e1e70aec2amr13586262qtw.42.1647786815919; Sun, 20
 Mar 2022 07:33:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220318071233.GB29472@kili>
In-Reply-To: <20220318071233.GB29472@kili>
From: Curtis Malainey <cujomalainey@google.com>
Date: Sun, 20 Mar 2022 07:33:26 -0700
Message-ID: <CAOReqxjYjxGjHf4fx1FQbAU5kY3_gmcLKsGMg+NhQOhf3h9vHw@mail.gmail.com>
Subject: Re: [Sound-open-firmware] [PATCH 1/2] ASoC: SOF: Prevent NULL
 dereference in sof_pcm_dai_link_fixup()
To: Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 kernel-janitors@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Sound Open Firmware <sound-open-firmware@alsa-project.org>
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

On Sun, Mar 20, 2022, 12:10 AM Dan Carpenter <dan.carpenter@oracle.com>
wrote:

> The "dia" pointer can be NULL, so handle that condition first before
> storing "dia->private".
>

Typo in commit message, it is DAI in code, not dia.


> Fixes: 839e484f9e17 ("ASoC: SOF: make struct snd_sof_dai IPC agnostic")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  sound/soc/sof/pcm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
> index 1661b0bc6f12..71f5bce0c4c7 100644
> --- a/sound/soc/sof/pcm.c
> +++ b/sound/soc/sof/pcm.c
> @@ -702,7 +702,7 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime
> *rtd, struct snd_pcm_hw_pa
>         struct snd_sof_dai *dai =
>                 snd_sof_find_dai(component, (char *)rtd->dai_link->name);
>         struct snd_sof_dev *sdev =
> snd_soc_component_get_drvdata(component);
> -       struct sof_dai_private_data *private = dai->private;
> +       struct sof_dai_private_data *private;
>         struct snd_soc_dpcm *dpcm;
>
>         /* no topology exists for this BE, try a common configuration */
> @@ -727,6 +727,7 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime
> *rtd, struct snd_pcm_hw_pa
>         /* read format from topology */
>         snd_mask_none(fmt);
>
> +       private = dai->private;
>         switch (private->comp_dai->config.frame_fmt) {
>         case SOF_IPC_FRAME_S16_LE:
>                 snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
> --
> 2.20.1
>
> _______________________________________________
> Sound-open-firmware mailing list
> Sound-open-firmware@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/sound-open-firmware
>
