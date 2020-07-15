Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1832F220340
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 06:16:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 696A31663;
	Wed, 15 Jul 2020 06:15:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 696A31663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594786567;
	bh=PHK7zHdynjGn/Avml604F3Qg6U5HHXg5KyDagaBgm5g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B9hrPpJaSw7ARO/GheV7ezTdUi6eHT+1FVV/38l6yV/yseWt3w0gifRPJY6Kk3LL2
	 96jWUzh8rbj99+aEHMZ4S3J1bWx3Dbn43wZJV/edTqwMfDPqWI4aR8VNoiyU1CVrsa
	 wXveZ0GFiOExFwtPyni2Zb1tXOli7h6wXCdyXOco=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B0BDF80113;
	Wed, 15 Jul 2020 06:14:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D120EF8021D; Wed, 15 Jul 2020 06:14:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B75DF80113
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 06:14:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B75DF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="K1HTY9Dw"
Received: by mail-qt1-x842.google.com with SMTP id k18so673103qtm.10
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 21:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=foDNNdgIp5gEZxCFX16NjXsSXtzimT2AqP9s4DUPnRU=;
 b=K1HTY9DwxKkwlxnhxfdiEyaM+jc4pxAHsm3ZoHLNf46o0NPweVzUmsjJtWpbSuLE+5
 lvihYceaJxRcEpAn5Y7EIeZe/uvSunAtgqS9kNlEQiAGK00zW7tqpXxTeSY/4j+aQStZ
 dmrHIkiZe+s8yH734YCb8MWgS9ATNCn5XMcrXihLhLhW4cwiabHZHBVUHd1gjGLW4Q1k
 a0OvsQS95Pvuit+60T/5UuMN5I0UHd0X5zOBO38F201gGpVLceSzNqKd3aGWubrmj2EM
 Mn2jFZoMXI7qVziDUAk642VoUW2CExUIyYCmfbb46N7N3LTCKRJRuW2yeEO85s+bRLIn
 UHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=foDNNdgIp5gEZxCFX16NjXsSXtzimT2AqP9s4DUPnRU=;
 b=sz9eKAbp6DuHC7llVjNQ8s4h8cRVIewG7SMZg7WiKQMpEq3E06Oh3I5cO96lClYfht
 uc1w3r43V1F2/702chz4FPMeO2pjwsY3dI09M/bkeFTkSJwtD4NxuPkQ9T0gSp/rZjUE
 6zjb2fqzH6ZCM3Ka/jqrs82AeXAt56U+RfMNR2H+zqAnU052xAG0qRqfMOMKIHxqmoc2
 z/uYCz6iy40o3XmN6BiCIIATCZ1OqgNNMowUe/S+AJeln+Lanj0re9aiac2UZ2qqMFf9
 CX19VT5IBY9ChwfgyiQq869vLl2Bm6J0EHP6K2J7Q7K9E+OrBB1QNF7bP1cd+6GFhA57
 pVlg==
X-Gm-Message-State: AOAM530Q30ljrnbCg/YaNyXy6Mcwd1KtsSchOzOLWdYv5X9zJWqAxpSi
 24uUWdr59zohjDd5603Q31S7AmJFpBGtijk1j2A=
X-Google-Smtp-Source: ABdhPJz9uu3YAldIkZ25DwFl7GQTjr4Q/2qWdCJALV+nDYpRz3j+ggBoJDewGFe15ct9g6o4fvRHNE0l6dRRFxn2zpM=
X-Received: by 2002:ac8:41c6:: with SMTP id o6mr8114697qtm.292.1594786452616; 
 Tue, 14 Jul 2020 21:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <1594717536-5188-1-git-send-email-shengjiu.wang@nxp.com>
 <1594717536-5188-4-git-send-email-shengjiu.wang@nxp.com>
 <20200714211432.GA10818@Asurada-Nvidia>
In-Reply-To: <20200714211432.GA10818@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 15 Jul 2020 12:14:01 +0800
Message-ID: <CAA+D8ANQ_B9jJUhLYQnKxKJcVrmvakxPo58h433QqFhdu2nRPA@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: fsl-asoc-card: Support Headphone and Microphone
 Jack detection
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 kuninori.morimoto.gx@renesas.com, Timur Tabi <timur@kernel.org>,
 samuel@sholland.org, katsuhiro@katsuster.net,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 linuxppc-dev@lists.ozlabs.org
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

On Wed, Jul 15, 2020 at 5:16 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> Hi Shengjiu,
>
> The whole series looks good to me. Just a couple of small
> questions inline:
>
> On Tue, Jul 14, 2020 at 05:05:36PM +0800, Shengjiu Wang wrote:
> > Use asoc_simple_init_jack function from simple card to implement
> > the Headphone and Microphone detection.
> > Register notifier to disable Speaker when Headphone is plugged in
> > and enable Speaker when Headphone is unplugged.
> > Register notifier to disable Digital Microphone when Analog Microphone
> > is plugged in and enable DMIC when Analog Microphone is unplugged.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/Kconfig         |  1 +
> >  sound/soc/fsl/fsl-asoc-card.c | 69 ++++++++++++++++++++++++++++++++++-
> >  2 files changed, 68 insertions(+), 2 deletions(-)
>
> >  static int fsl_asoc_card_late_probe(struct snd_soc_card *card)
> >  {
> >       struct fsl_asoc_card_priv *priv = snd_soc_card_get_drvdata(card);
> > @@ -745,8 +789,29 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
> >       snd_soc_card_set_drvdata(&priv->card, priv);
> >
> >       ret = devm_snd_soc_register_card(&pdev->dev, &priv->card);
> > -     if (ret && ret != -EPROBE_DEFER)
> > -             dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
> > +     if (ret) {
> > +             if (ret != -EPROBE_DEFER)
> > +                     dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
>
> I think we may move this EPROBE_DEFER to the asrc_fail label.

If we move this to asrc_fail label, then it will be hard to define the
error message.
There are many places that goto asrc_fail.

>
> > +             goto asrc_fail;
> > +     }
> > +
> > +     if (of_property_read_bool(np, "hp-det-gpio")) {
>
> Could we move this check inside asoc_simple_init_jack? There's no
> problem with doing it here though, yet I got a bit confused by it
> as I thought it's a boolean type property, which would be against
> the DT bindings until I saw asoc_simple_init_jack() uses the same
> string to get the GPIO. Just it probably would be a bit tricky as
> we need it to be optional here.
>
> Otherwise, I think we may add a line of comments to indicate that
> the API would use the same string to get the GPIO.

In asoc_simple_init_jack, gpio_is_valid() will be invalid when there is
no "hp-det-gpio" property, and asoc_simple_init_jack will return 0.

The reason why I add a check here is mostly for
snd_soc_jack_notifier_register().
when there is no jack created, there will be a kernel dump.

or I can use this code:

-       if (of_property_read_bool(np, "hp-det-gpio")) {
-               ret = asoc_simple_init_jack(&priv->card, &priv->hp_jack,
-                                           1, NULL, "Headphone Jack");
-               if (ret)
-                       goto asrc_fail;
+       ret = asoc_simple_init_jack(&priv->card, &priv->hp_jack,
+                                   1, NULL, "Headphone Jack");
+       if (ret)
+               goto asrc_fail;

+       if (priv->hp_jack.jack.jack)
                snd_soc_jack_notifier_register(&priv->hp_jack.jack,
&hp_jack_nb);
-       }

what do you think?

best regards
wang shengjiu
