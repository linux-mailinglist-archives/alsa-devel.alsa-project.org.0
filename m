Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEE235FA50
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Apr 2021 20:16:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCA2B1671;
	Wed, 14 Apr 2021 20:15:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCA2B1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618424160;
	bh=PvrJY4JDr3SMPqPJUDzEx9LX9dnG6ONbO8SaaIgOA84=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m5Dr48oKLGDtgsJt3S9Q/NDFpB3VGeeZhWE47aEnI+nq7nsdhpSuc1ymT44xPS27O
	 Ojbiq56HsFKZKIkfRf3rcEhSgvihbXdFRnyDcWqbw98sKpki5BfUrJbo0FfRWO9gc5
	 F0MdiyuZo97JaS0MVhTilArTHr2FCQb7vaNcWT+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FBE5F80271;
	Wed, 14 Apr 2021 20:14:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42180F80269; Wed, 14 Apr 2021 20:14:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FB2BF80128
 for <alsa-devel@alsa-project.org>; Wed, 14 Apr 2021 20:14:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FB2BF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CMu2IpE+"
Received: by mail-qk1-x730.google.com with SMTP id h13so3739219qka.2
 for <alsa-devel@alsa-project.org>; Wed, 14 Apr 2021 11:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dvs6zSJd9pYepC2QbEcbXF09WdeIHSOT7v7sSkWl9is=;
 b=CMu2IpE+8pfsu3APFlp1jZx/L8TQ3CCpFjhjRlOfBa5CU6Cbex3Wbdlmc2Zn6sAaU5
 ltwceQ/EtLyLUOZMLqSws/bNjUA+OkuzDMcfeqLPmRxabFtzMDCsCK6W6ISLeP77+WxT
 HRARGaAUqEKjCAF81TT7v6RRRoAFc57zJJeMqjCAkO/2EfRM72lxEgyB9/XtIn8Mja1p
 aYPDou00f9AGwHzKfj0Sxa1HLqGZm5QNXw1kD7u/KyHUem+sWv8Dy0LukRyg3OHqnREc
 1bW6Q9852wJc6PsKN/JpuktvbU+sseosq88loCHxk5I8BVj5+VgnKtfSyzaJu0TBHgAT
 ke2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dvs6zSJd9pYepC2QbEcbXF09WdeIHSOT7v7sSkWl9is=;
 b=qWaIhxNkQG4kzqvf5eAFhOS6HB+Z0IQtUS3OhdCy0xznULdjGEqRer9dMzLzyTmz0q
 kmpq4v9V3eSXHywg+gw8yfWB1gqeMzocyrlvZ0QcXeyYi7VE5ATUppJBkYuxU72E4+tk
 901jT3xCZdTSjEjo8HUOi/A9+6W8rmpYRNKr8Z4De1z5a85rrlezqt1P/VC9a2Adx8NW
 DOyPb2y/5dfVrpcTAG/LveyYNNHVUPvhIMsKldTI0X2umG8Xz92Ey0IvGNtsRvadMmIM
 E0unTfzPp/VKIM4OqAqbUthrISFp5gHZn1iB+bSkxgqo7vjWZ7j3eeQi4jaPDz9YES3N
 +W8w==
X-Gm-Message-State: AOAM530Xowp1w9WQGEeM4Dh/BfGBIDHeSmfX9ILx4Czy8sBG64wy2x0C
 n6hoJkCabgppwnuteAxHmBj0/hfCAuTKHKfpv2Y=
X-Google-Smtp-Source: ABdhPJzIAlAZfVRMuyqyKOHTDjDDja6Lw9brJTHxIRtYBRS3XfECgbjlOz3zvk7wyV6aszX0y4/3iUP1vNIzPT3PCdA=
X-Received: by 2002:a05:620a:e05:: with SMTP id
 y5mr2545736qkm.250.1618424059059; 
 Wed, 14 Apr 2021 11:14:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210413084152.32325-1-tiwai@suse.de>
In-Reply-To: <20210413084152.32325-1-tiwai@suse.de>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Wed, 14 Apr 2021 15:19:01 -0300
Message-ID: <CAEsQvcufoQCBDpb3cscAor6GbFhsLXdP6vne-A5bc-SZPqt_9g@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: Explicitly set up the clock selector
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
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

Thanks, Dr. Iwai!

I haven't tested the finalized patch yet, but I'll give it a shot on top of
5.12-rc7. Should be OK, nevertheless thorough testing is always a good idea.

Regards,
Geraldo

Em Ter, 13 de abr de 2021 05:41, Takashi Iwai <tiwai@suse.de> escreveu:

> In the current code, we have some assumption that the audio clock
> selector has been set up implicitly and don't want to touch it unless
> it's really needed for the fallback autoclock setup.  This works for
> most devices but some seem having a problem.  Partially this was
> covered for the devices with a single connector at the initialization
> phase (commit 086b957cc17f "ALSA: usb-audio: Skip the clock selector
> inquiry for single connections"), but also there are cases where the
> wrong clock set up is kept silently.  The latter seems to be the cause
> of the noises on Behringer devices.
>
> In this patch, we explicitly set up the audio clock selector whenever
> the appropriate node is found.
>
> Reported-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=199327
> Link:
> https://lore.kernel.org/r/CAEsQvcvF7LnO8PxyyCxuRCx=7jNeSCvFAd-+dE0g_rd1rOxxdw@mail.gmail.com
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/usb/clock.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/sound/usb/clock.c b/sound/usb/clock.c
> index a746802d0ac3..17bbde73d4d1 100644
> --- a/sound/usb/clock.c
> +++ b/sound/usb/clock.c
> @@ -296,7 +296,7 @@ static int __uac_clock_find_source(struct
> snd_usb_audio *chip,
>
>         selector = snd_usb_find_clock_selector(chip->ctrl_intf, entity_id);
>         if (selector) {
> -               int ret, i, cur;
> +               int ret, i, cur, err;
>
>                 if (selector->bNrInPins == 1) {
>                         ret = 1;
> @@ -324,13 +324,17 @@ static int __uac_clock_find_source(struct
> snd_usb_audio *chip,
>                 ret = __uac_clock_find_source(chip, fmt,
>                                               selector->baCSourceID[ret -
> 1],
>                                               visited, validate);
> +               if (ret > 0) {
> +                       err = uac_clock_selector_set_val(chip, entity_id,
> cur);
> +                       if (err < 0)
> +                               return err;
> +               }
> +
>                 if (!validate || ret > 0 || !chip->autoclock)
>                         return ret;
>
>                 /* The current clock source is invalid, try others. */
>                 for (i = 1; i <= selector->bNrInPins; i++) {
> -                       int err;
> -
>                         if (i == cur)
>                                 continue;
>
> @@ -396,7 +400,7 @@ static int __uac3_clock_find_source(struct
> snd_usb_audio *chip,
>
>         selector = snd_usb_find_clock_selector_v3(chip->ctrl_intf,
> entity_id);
>         if (selector) {
> -               int ret, i, cur;
> +               int ret, i, cur, err;
>
>                 /* the entity ID we are looking for is a selector.
>                  * find out what it currently selects */
> @@ -418,6 +422,12 @@ static int __uac3_clock_find_source(struct
> snd_usb_audio *chip,
>                 ret = __uac3_clock_find_source(chip, fmt,
>                                                selector->baCSourceID[ret -
> 1],
>                                                visited, validate);
> +               if (ret > 0) {
> +                       err = uac_clock_selector_set_val(chip, entity_id,
> cur);
> +                       if (err < 0)
> +                               return err;
> +               }
> +
>                 if (!validate || ret > 0 || !chip->autoclock)
>                         return ret;
>
> --
> 2.26.2
>
>
