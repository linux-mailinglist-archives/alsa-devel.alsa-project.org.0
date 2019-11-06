Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED15AF1541
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 12:38:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B95516B9;
	Wed,  6 Nov 2019 12:37:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B95516B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573040310;
	bh=1yWCRAX22Z5yrFNpew9xA6JmPACjupYxBzA/C4mfM+Q=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TkROkvS3zyWJKb5HginwnVC25HY76nIpfa/4ygxqinjc55voBXyvpir7BDeyxBXsj
	 WeFAVMT9bwI+vzPEPJJ3DvbmZK2Ut68Qs3Li1Y3GyO0OCBajyP+7MM7hMsIyHCmHou
	 KfuAWEmPx6jdfkBb4uRkGUXJDwOZp2V5RSGAcLVg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E4AEF803D0;
	Wed,  6 Nov 2019 12:36:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB30EF803D0; Wed,  6 Nov 2019 12:36:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7899F80291
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 12:36:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7899F80291
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cp3zwyxx"
Received: by mail-wr1-x443.google.com with SMTP id t1so19402545wrv.4
 for <alsa-devel@alsa-project.org>; Wed, 06 Nov 2019 03:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OCw5fZ9l2RrOi3SE8aqoJuN0UEZysLXdrRoRB/SxvBQ=;
 b=cp3zwyxxGArn6yB7UddfdzaHFMsp10QWEUHJUO0vPDt8WXjEKvzzCwG8xusRCA+PJS
 XkIAfXXJcOPnfFo39YKbHA1s4qQcxejVHSqrhFIfmpSZQqvkLx90rBW+OCy0c68xJGWI
 4+FUYZgWb15MxOtMawwLF7fnoW69g0OtktE26iIljd7V9AeTipZcWWcswuWycY31CsOh
 8/bnNr7wHEcZwGZbIYr5rL8GBPBBn9QeI2eEy76QjH6XzZzcMHLM52q6j/VD7asOqnXJ
 G12h0bezxKBl2VGTO95uzQyU2QcDUxxe2YtPboFfK9DItm5As9C6GaTRrSJHC87Eilqs
 KdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OCw5fZ9l2RrOi3SE8aqoJuN0UEZysLXdrRoRB/SxvBQ=;
 b=QJj0LZ4eWSVo5a3t6QkuvD6Y8g7e2BPrtvSkvFMfqGAsdXqi6txGgDoYsBDBuyvfbQ
 kvEuhypnIGZfRDmHPwUOydjzvsscpsdYx2PmmWMsMZ3g327RlqpiOr3ZnXjJ5Fmk1IYd
 ce8Uc/9+PDtUJ5+BpNlT46CuaO9r4ZadOqyUs0q0zHUP0b5V5IlUFwOdupljpYdvKVeB
 TlWbQ+aTUjzO2yG0604XsPZcsv2q2Tb9cjx2sBZnhJGjlsNWmqWCMg6mG5L6+v1/fvfy
 MrfjZpGVsH5OqMzUaq7pMketpp7HD2wTzMB6AiCm3wrxzfB09lDZtFTnKDnuFJ+GMdxs
 mivw==
X-Gm-Message-State: APjAAAXa0i0KGt+8pMhf4lw4ta/+exDHz8fG9IUsf6Fdc9wyeGFSiaQR
 NAGvaehL4/ADlElrG+DGRkHwddyVMh66jRya720=
X-Google-Smtp-Source: APXvYqwq2zOaSIHLbR6lNDivoEFIR2AaMIjiv6C+GRRxG2Vqs1g+sI7nHw0I9kP2JTsFUuxglZfMQIhWMhS7fqWQcnc=
X-Received: by 2002:a5d:5306:: with SMTP id e6mr2160142wrv.187.1573040198673; 
 Wed, 06 Nov 2019 03:36:38 -0800 (PST)
MIME-Version: 1.0
References: <1573025265-31852-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1573025265-31852-1-git-send-email-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 6 Nov 2019 13:36:26 +0200
Message-ID: <CAEnQRZB0tXZvArgxL+u7x1RAWGyw8bDbGRF9u6tKiPjJbMpGkw@mail.gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Takashi Iwai <tiwai@suse.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_audmix: Add spin lock to protect
	tdms
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

Hi Shengjiu,

Comments inline.

On Wed, Nov 6, 2019 at 9:30 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> Audmix support two substream, When two substream start
> to run, the trigger function may be called by two substream
> in same time, that the priv->tdms may be updated wrongly.
>
> The expected priv->tdms is 0x3, but sometimes the
> result is 0x2, or 0x1.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_audmix.c | 6 ++++++
>  sound/soc/fsl/fsl_audmix.h | 1 +
>  2 files changed, 7 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
> index c7e4e9757dce..a1db1bce330f 100644
> --- a/sound/soc/fsl/fsl_audmix.c
> +++ b/sound/soc/fsl/fsl_audmix.c
> @@ -286,6 +286,7 @@ static int fsl_audmix_dai_trigger(struct snd_pcm_substream *substream, int cmd,
>                                   struct snd_soc_dai *dai)
>  {
>         struct fsl_audmix *priv = snd_soc_dai_get_drvdata(dai);
> +       unsigned long lock_flags;
>
>         /* Capture stream shall not be handled */
>         if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
> @@ -295,12 +296,16 @@ static int fsl_audmix_dai_trigger(struct snd_pcm_substream *substream, int cmd,
>         case SNDRV_PCM_TRIGGER_START:
>         case SNDRV_PCM_TRIGGER_RESUME:
>         case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +               spin_lock_irqsave(&priv->lock, lock_flags);

Why do we need to disable interrupts here? I assume that lock is only
used in process context.

thanks,
Daniel.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
