Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1E33955D8
	for <lists+alsa-devel@lfdr.de>; Mon, 31 May 2021 09:14:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EFBE850;
	Mon, 31 May 2021 09:13:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EFBE850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622445289;
	bh=UHj36/6kg0eScdDw0KmdpzR9Tk4qqy2D+AjEpqKfyys=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lv8NBz3yOajC02MrLEXoqJsy2ohG8fPNd+H1WiBc6x7ZMekeCAIruXfMQe/jhDQQJ
	 MqVQ+GW9knzptMetSPxd5hF3pksUV+WqK9N4f5tUjc6gZPpabcUeI5sIUiP7L0B2gU
	 nd8gR3B78yzbZjEGrJJe/OaILOj9fNF1HWdNIKhA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE596F80096;
	Mon, 31 May 2021 09:13:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33562F80253; Mon, 31 May 2021 09:13:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FE9CF80161
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 09:13:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FE9CF80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Tp9Af5PZ"
Received: by mail-qt1-x832.google.com with SMTP id m13so7323042qtk.13
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 00:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yPnIo42plkwFrQDyxV2qx/s2cknNkAGZDVtx3wbOgvs=;
 b=Tp9Af5PZOT1pgH/udgKZCP5uYa6IETW7cLxSNlICLKoZBpazH6eoBaMbErfh4PiY69
 ZoKenJXw/hfXSNe3QTHHJUOulDCKS4mckM2v7xUz0AOKJN1X9z60aWCOU0dQq64zOmPb
 0OpX/Ls4vxYX6evECby6KGRXXXDYsg+Xr9cRcYcNtFWyxrBv2DUM7dToHqzcGahi2O1d
 mBWjAiXxxToWo7fkbaCA9oZRU/qc0/TATOekuO6BMXH+cKvTks/F+m3jJvi06JOFV2A3
 y1r3BKbP6+Ws0j3BfJkL/fwFd2tT8q48cSXfLZOh9/s4RQkhqPwK01T/4grlfIVPRV8C
 0T+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yPnIo42plkwFrQDyxV2qx/s2cknNkAGZDVtx3wbOgvs=;
 b=AYz06c76cFD4xiw8qX8r+v558TPMe40CMN6QyOro5csz7CmIx3Z8D5PgRw73YCsB2S
 pCwcpu1eXf+FaT0E6FxYwciU/pzEWb+4CcODD+E3PFSvv+o6sesN7dPwiKhc+bBb+dak
 rOcM6eaXvaBug1BwSO2QwVDn5ql3cRk7S6Vh4hNqd8UHOcw5e29pLobnWoygHE16Q1Db
 bws3WRd/t+kDbdz9j/dKkH6TkETzG4TXja7x+6DHYzOwMBaK60V6kYNFEdbI4fQIzI6f
 fK39mWS3/3sSbAHfRwuMXMHhVfGHLju/C2/cW9N9+3XMZgksUgjPv3DLSZFBCNG+aUt4
 P8+A==
X-Gm-Message-State: AOAM531KQcBKwVZWGWpnv2hJoqBeUVVnhZdSmNjg+VybVg0tcg9+e0mr
 F6+1WJw1CBzIM/JC4570p6u30MgdtenVSpasHLo=
X-Google-Smtp-Source: ABdhPJwqutod0yLild77qYJkxAUuP6UWl9+wI+5CsvXM3euJPYCcMm5SprLhD6u2aBWc3gjpwazA7aQ94EnX1pITFQc=
X-Received: by 2002:ac8:5197:: with SMTP id c23mr13620903qtn.292.1622445183449; 
 Mon, 31 May 2021 00:13:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210527163409.22049-1-nicolas.cavallari@green-communications.fr>
In-Reply-To: <20210527163409.22049-1-nicolas.cavallari@green-communications.fr>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 31 May 2021 15:12:52 +0800
Message-ID: <CAA+D8APeigNMB4gTNTTVE4-vj0J9y5DEh+3P7p9iTZq1KdGuPg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: Set .owner attribute when
 registering card.
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
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

On Fri, May 28, 2021 at 12:35 AM Nicolas Cavallari
<nicolas.cavallari@green-communications.fr> wrote:
>
> Otherwise, when compiled as module, a WARN_ON is triggered:
>
> WARNING: CPU: 0 PID: 5 at sound/core/init.c:208 snd_card_new+0x310/0x39c [snd]
> [...]
> CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.10.39 #1
> Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
> Workqueue: events deferred_probe_work_func
> [<c0111988>] (unwind_backtrace) from [<c010c8ac>] (show_stack+0x10/0x14)
> [<c010c8ac>] (show_stack) from [<c092784c>] (dump_stack+0xdc/0x104)
> [<c092784c>] (dump_stack) from [<c0129710>] (__warn+0xd8/0x114)
> [<c0129710>] (__warn) from [<c0922a48>] (warn_slowpath_fmt+0x5c/0xc4)
> [<c0922a48>] (warn_slowpath_fmt) from [<bf0496f8>] (snd_card_new+0x310/0x39c [snd])
> [<bf0496f8>] (snd_card_new [snd]) from [<bf1d7df8>] (snd_soc_bind_card+0x334/0x9c4 [snd_soc_core])
> [<bf1d7df8>] (snd_soc_bind_card [snd_soc_core]) from [<bf1e9cd8>] (devm_snd_soc_register_card+0x30/0x6c [snd_soc_core])
> [<bf1e9cd8>] (devm_snd_soc_register_card [snd_soc_core]) from [<bf22d964>] (fsl_asoc_card_probe+0x550/0xcc8 [snd_soc_fsl_asoc_card])
> [<bf22d964>] (fsl_asoc_card_probe [snd_soc_fsl_asoc_card]) from [<c060c930>] (platform_drv_probe+0x48/0x98)
> [...]
>
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

> ---
>  sound/soc/fsl/fsl-asoc-card.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
> index c62bfd1c3ac7..4f55b316cf0f 100644
> --- a/sound/soc/fsl/fsl-asoc-card.c
> +++ b/sound/soc/fsl/fsl-asoc-card.c
> @@ -744,6 +744,7 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
>         /* Initialize sound card */
>         priv->pdev = pdev;
>         priv->card.dev = &pdev->dev;
> +       priv->card.owner = THIS_MODULE;
>         ret = snd_soc_of_parse_card_name(&priv->card, "model");
>         if (ret) {
>                 snprintf(priv->name, sizeof(priv->name), "%s-audio",
> --
> 2.32.0.rc0
>
