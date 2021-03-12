Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D530338D38
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 13:39:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D872171C;
	Fri, 12 Mar 2021 13:38:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D872171C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615552764;
	bh=VE+3Of20Udv2kSyKJ9EdXEYgzzAKdBtr2SeFBmoD/D4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jkFxcUzTk2nyoDMKXzT+A9lssqDy3LTRW3EHQ+famxfGfDx2tfw17DtBb7Z8uPPF2
	 ix0D2ruUmm3VfBA1Gz7klJlQJQeNa0YCVQbOzpqQLaTZ3vHehTm3cTGuKIoeWg4uew
	 6hr9q3bYr/HMB7dnbvIbeF6HC80lhM5slc5W2+yo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09116F8012A;
	Fri, 12 Mar 2021 13:37:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DF77F801D8; Fri, 12 Mar 2021 13:37:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A70EF8012A
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 13:37:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A70EF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pFeKserx"
Received: by mail-wr1-x42e.google.com with SMTP id y16so4733403wrw.3
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 04:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=q8qLwX4mEs2ipnlk7bkb5HbH/jXQ15M3RcYXRP29Zjs=;
 b=pFeKserxEawFZxws0IHjjZKJKbc83tP0Ux+w6btpkyZh6j8dUT6aGXuQ5uWmTOxrne
 UQB8FhShG9HRW00oUM/MAsg2t29uM5STQZKWAt/gIvoZDHSPi1f2iiVrZ57kQqmR55/J
 ArEB8A3Z+SssqmwhZxi/AulTruNK5ra/n93RvuZhq1OWPYf1FipOI8SjNkQ/rLT96H3X
 kgaeY4gkZZ7rwCGraSMpAT+GZ/07GdsvV4S8w/C6hLP0rRqHppofSqGwr8oispm6+Cnh
 NZCVxXyP3vKgp5/Zh8b4iLe46dKGryOBDOKnmrO60jfPoW808W3vXG+jp8tntXVrfaj8
 VwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q8qLwX4mEs2ipnlk7bkb5HbH/jXQ15M3RcYXRP29Zjs=;
 b=Wjv7T5qccjA1K0lY5axFW6tMnvTBYQCAJyC1y3O+/tFXSz570GacodfR8DmoqvkOJa
 S97FiSVKxF3MOSMoa4xMTvvkOeNQcTdwWHAhKdYQnDBOc3w3bUiLUFY68tFC5nXCq6uH
 KDoIinyhII2Bqga3FABB4GWWskbY6FNqtYOcS+eMfMcTqXZz5yPmwRmqYOLusAtdiU7K
 S4y6mnn/snPftetx/EGpZcmtzQOEoJkxYNekhvHOozOV9MV5CSGIoatG0PY6lbgC3Jke
 8phLHL6v3aS8deu4cVypedz1m4UlCJCNatgfc+yar2SPI7oofs8AjsoDW7HkA/jzkRXQ
 RhFg==
X-Gm-Message-State: AOAM5327tQLU8TKyAjrczo7egJjUs8ghHhRiOOFPvz63Io70OWflntI/
 i6yaLmQTUDymYahXjkKEBMSBc7WNGsGnQmYy8RE=
X-Google-Smtp-Source: ABdhPJzvdxXqdrG0wvuThxwWaZnmsvjpNQrP4+l6gk5gejzEATYvFCNwsS3inTaU1HHaDShxDqhyBCE7U1t7XSv6XYM=
X-Received: by 2002:adf:e64d:: with SMTP id b13mr14067492wrn.204.1615552662199; 
 Fri, 12 Mar 2021 04:37:42 -0800 (PST)
MIME-Version: 1.0
References: <20210309082328.38388-1-daniel.baluta@oss.nxp.com>
 <20210309153455.GB4878@sirena.org.uk>
 <CAEnQRZB_VgsEPYgxtWQWUgs2+noRt1AMMHf2crJ_9Hg7s7NJ0Q@mail.gmail.com>
 <20210312104931.GA5348@sirena.org.uk>
 <CAEnQRZDe_Q-N7L_7z7aVz1o3guKd6R+WFrOfT9KPbggJP8SPZw@mail.gmail.com>
 <20210312115748.GC5348@sirena.org.uk>
In-Reply-To: <20210312115748.GC5348@sirena.org.uk>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 12 Mar 2021 14:37:30 +0200
Message-ID: <CAEnQRZAAU34YS778WJVD6uubSwQxjA-5LTG9g0CvSdSZOuO+tQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: core: Don't set platform name when of_node is set
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 "S.j. Wang" <shengjiu.wang@nxp.com>, Daniel Baluta <daniel.baluta@oss.nxp.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, dl-linux-imx <linux-imx@nxp.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
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

On Fri, Mar 12, 2021 at 1:59 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Mar 12, 2021 at 12:59:29PM +0200, Daniel Baluta wrote:
> > On Fri, Mar 12, 2021 at 12:50 PM Mark Brown <broonie@kernel.org> wrote:
>
> > > If an explicit name has been provided why would we override it with a=
n
> > > autogenerated one?
>
> > Wait, are you asking why the initial code:
>
> >   dai_link->platforms->name =3D component->name;
>
> > is there in the initial code?
>
> No, just the opposite!  If there's an explict name configured why do you
> want to ignore it?

Because the initial assignment:

dai_link->platforms->name =3D component->name;

doesn't take into consideration that dai_link->platform->of_node is
also explicitly configured.

So, my change only configures the name  (dai_link->platform->name)
if the dai->platform->of_node wasn't previously explicitly configured.

Otherwise, we end up with both dai_link->platforms->name and
dai->link->platforms->of_node
configured and we hit this error:

soc_dai_link_sanity_check:
/*
 * Platform may be specified by either name or OF node, but it
 * can be left unspecified, then no components will be inserted
 * in the rtdcom list
 */
if (!!platform->name =3D=3D !!platform->of_node) {
    dev_err(card->dev,
    "ASoC: Neither/both platform name/of_node are set for %s\n", link->name=
);
    return -EINVAL;
}

I start with a simple-audio-card node:


sof-sound-wm8960 {
    compatible =3D "simple-audio-card";

    simple-audio-card,dai-link {
       format =3D "i2s";
       cpu {
            sound-dai =3D <&dsp 1>;
       };
       sndcodec: codec {
            sound-dai =3D <&wm8960>;
       };
}

Notice that doesn't have any platform field.

But then in sound/soc/generic/simple-card-utils.c:asoc_simple_canonicalize_=
platform
explicitly sets dai_link->platforms->of_node like this:

=C2=BB       if (!dai_link->platforms->of_node)
=C2=BB       =C2=BB       dai_link->platforms->of_node =3D dai_link->cpus->=
of_node;

I hope this is more clear.
