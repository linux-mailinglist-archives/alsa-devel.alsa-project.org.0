Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6919508F
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 00:13:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B42DF167B;
	Tue, 20 Aug 2019 00:12:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B42DF167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566252799;
	bh=KRG+0lToHqwlXWtFX1vjCgddNf+zAOq7axfzrRI9lOc=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Oys/he0ulzc3P0hEFMC1D/63Kj2Kzj0HJ3ExNFcjLekwo3JDXwpfEdCDoosqa7ZxX
	 Ipe1BUJN17ojP0187cZ2gNKPjQuvRaFsCTwvGJImzAzrksBNHMB2VWEjRnVzCSsYee
	 ejxFCt9XpXxjtw0aYljUyNRz/k2oFS3c+SooQzT0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 747E3F8045E;
	Tue, 20 Aug 2019 00:11:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7F19F8045E; Tue, 20 Aug 2019 00:11:49 +0200 (CEST)
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32A9BF8011F
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 00:01:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32A9BF8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AO0/xL1K"
Received: by mail-oi1-x244.google.com with SMTP id k22so2534733oiw.11
 for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2019 15:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6SYkxdV7jcIALUM9KI4yNevvBI0M59TAZ1Ut0Rgc0Pc=;
 b=AO0/xL1KCiGPLb4/MZT6fCgX3enykCD04uYTjj4irmu2HLhA90lfIUnBoOcpcVj6qw
 qps93uXFzM6/HAPKYcdP0O6ki/5wYb12mV32nxRjAt+VpEyVzSjcN1fJcREDA+9MSf5o
 7VgJ4ImOLiutlMKHrhKRXNW/zq4szClyMlitIMzJD2B0T0tSdT/dZZP4wn5SkmQJ6Sle
 MnKqvoxXR/7WDitMmfJM3DCERy4Pi+Tuns33YkGOFa59trf9PR1r1ATWyQcSN0w3AZ4Q
 nYyUGPoNZxVk2ZxZrMpReXE6mMQ4kvhI1YTOpxkuRQkR5vox3Bf41jZTSh3DGGLX5H4q
 nt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6SYkxdV7jcIALUM9KI4yNevvBI0M59TAZ1Ut0Rgc0Pc=;
 b=uBWNOt4H40IrOlHe99PMdVOD0WY3SGVBqP+j1/GvHgDFEAm/Ug9rP94mqbaxzdD0pu
 ArLGDAg3ih0UatxcfAu94kH75IsHBj658AOUuYd1mLHqmhSwMkERwjHxLSou2zNCrgAU
 +V2Xpd8GbVrHjMqP4dYf4R3xqYgSNQLkn5GgEpT+ccRhUuY9vgS8S7xd6GUal5gSih/D
 zdokNDr6jleiKaw7s0JMgKi56+GiI2uJwWuryPnjUcV8qHSK6sjs4JUqG3w+mvMqjrUk
 QBPGlYSV+UXuaEuZg3Gv5u3QrsdeRXCTCf4KtspyX4+VT2VkbWYWpE4UBSt5bbc7Szeq
 tHdQ==
X-Gm-Message-State: APjAAAVCs9wTdVm4Tmi4LO3VEM27z5I9aI3yMOnWB19S5NVqADkHr03L
 qUYfv54mipgmC+oWjCvpeUl1E1Kxzu180RGGgPA=
X-Google-Smtp-Source: APXvYqzF8hCvhBL1RrLo3ML//+a+HjKu20yRlrywkdHuw2qGcuwpd7aVZkE/HQyRIBlqBVu7koHD7T8Sy/+hGZW0/DY=
X-Received: by 2002:aca:4797:: with SMTP id u145mr10137291oia.19.1566252105668; 
 Mon, 19 Aug 2019 15:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190819220005.10178-1-benquike@gmail.com>
In-Reply-To: <20190819220005.10178-1-benquike@gmail.com>
From: Hui Peng <benquike@gmail.com>
Date: Mon, 19 Aug 2019 18:01:34 -0400
Message-ID: <CAKpmkkWuZW-eyQxp+Xe3qovf6aiJ0++bpcf7R92Vj=h1ijjBtg@mail.gmail.com>
To: security@kernel.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: linux-kernel@vger.kernel.org, Mathias Payer <mathias.payer@nebelwelt.net>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] Fix an OOB bug in uac_mixer_unit_bmControls
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

Sorry, this is the wrong patch. I will send it again.

On Mon, Aug 19, 2019 at 6:00 PM Hui Peng <benquike@gmail.com> wrote:

> `uac_mixer_unit_get_channels` calls `uac_mixer_unit_bmControls`
> to get pointer to bmControls field. The current implementation of
> `uac_mixer_unit_get_channels` does properly check the size of
> uac_mixer_unit_descriptor descriptor and may allow OOB access
> in `uac_mixer_unit_bmControls`.
>
> Reported-by: Hui Peng <benquike@gmail.com>
> Reported-by: Mathias Payer <mathias.payer@nebelwelt.net>
> Signed-off-by: Hui Peng <benquike@gmail.com>
> ---
>  sound/usb/mixer.c | 25 ++++++++++++++++++-------
>  1 file changed, 18 insertions(+), 7 deletions(-)
>
> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> index b5927c3d5bc0..00e6274a63c3 100644
> --- a/sound/usb/mixer.c
> +++ b/sound/usb/mixer.c
> @@ -738,28 +738,39 @@ static int get_cluster_channels_v3(struct
> mixer_build *state, unsigned int clust
>  static int uac_mixer_unit_get_channels(struct mixer_build *state,
>                                        struct uac_mixer_unit_descriptor
> *desc)
>  {
> -       int mu_channels;
> +       int mu_channels = 0;
>         void *c;
>
> -       if (desc->bLength < sizeof(*desc))
> -               return -EINVAL;
>         if (!desc->bNrInPins)
>                 return -EINVAL;
> -       if (desc->bLength < sizeof(*desc) + desc->bNrInPins)
> -               return -EINVAL;
>
>         switch (state->mixer->protocol) {
>         case UAC_VERSION_1:
> +               // limit derived from uac_mixer_unit_bmControls
> +               if (desc->bLength < sizeof(*desc) + desc->bNrInPins + 4)
> +                       return 0;
> +
> +               mu_channels = uac_mixer_unit_bNrChannels(desc);
> +               break;
> +
>         case UAC_VERSION_2:
> -       default:
> -               if (desc->bLength < sizeof(*desc) + desc->bNrInPins + 1)
> +               // limit derived from uac_mixer_unit_bmControls
> +               if (desc->bLength < sizeof(*desc) + desc->bNrInPins + 6)
>                         return 0; /* no bmControls -> skip */
> +
>                 mu_channels = uac_mixer_unit_bNrChannels(desc);
>                 break;
>         case UAC_VERSION_3:
> +               // limit derived from uac_mixer_unit_bmControls
> +               if (desc->bLength < sizeof(*desc) + desc->bNrInPins + 2)
> +                       return 0; /* no bmControls -> skip */
> +
>                 mu_channels = get_cluster_channels_v3(state,
>                                 uac3_mixer_unit_wClusterDescrID(desc));
>                 break;
> +
> +       default:
> +               break;
>         }
>
>         if (!mu_channels)
> --
> 2.22.1
>
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
