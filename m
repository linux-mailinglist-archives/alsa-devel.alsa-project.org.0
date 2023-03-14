Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 894066B9BC6
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Mar 2023 17:38:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3E881342;
	Tue, 14 Mar 2023 17:37:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3E881342
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678811918;
	bh=1pyrULOGQqe3k70cHTeL2UGT1WQH9QdcWdN8rdO3DcM=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pdhvZlSVGDCwuV3Og0b1mJ3yiDJaIGYbNesMBHlP0oIOWFOlCJnluApNG4vwcvKGg
	 xHiGW7trPo/4ToyAtMR8e2Hou/f+UFcAcE189SC7bIqQsms21HJPKoD6ytpB+OAxR0
	 zXZliGw3v6YBLEguEa32P77oO4vQBX7qHPQODLXs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E1F9F8032D;
	Tue, 14 Mar 2023 17:37:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5B9BF80423; Tue, 14 Mar 2023 17:37:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 76FB8F80272
	for <alsa-devel@alsa-project.org>; Tue, 14 Mar 2023 17:37:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76FB8F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=RvXo81au
Received: by mail-ed1-x52c.google.com with SMTP id j11so64484756edq.4
        for <alsa-devel@alsa-project.org>;
 Tue, 14 Mar 2023 09:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678811852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/za17hscILXMYDNEFJAfU0x+/d+UxB9pPnmfHSM0Yo=;
        b=RvXo81auGFsdaYyzozWvFDu53E6OZGPj1/IIcyLb9eDD2kQscDMlZPgfal94OhR66M
         yArZe2qhbbGGcwBprgCkfBhtvKo7I0eRm5EKjYmihneboZeh1K9y/fuyPlaqWWMy0biA
         PjdRJBrSlX0MvFaWYVIFVb+uSaMVNpahfCN5GWOjVENEMGtAhUJVQ3OpH9IwKATwdMJm
         GVIaWUFVGNlDe65q0JM2AO/x86+G9z68XXMoOQ57O0dIWPmJpDNCF9HmABZJdKWSM3Ei
         IjZYU6JMbM/mMyUlbeUzm8F+Lzuo7+jef+EYd4nBSuKaOlWk70csCubqyMZqsePdhnZY
         /R5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678811852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/za17hscILXMYDNEFJAfU0x+/d+UxB9pPnmfHSM0Yo=;
        b=ieM1kZEMr6UIABqjRCPiK0rY2z4txwj8fNiYCQMIl3fA9aL/z9LzBICsfpbNCUVaTY
         G//evku4gKY/R3N3LvNfQBkBJ7/uyYLlbyz8vyWofSJkdHOLWw3mjg70NAtXsOROpcUy
         /rtttWJ1yujZS3/jvwck3ns7Ii+H6Ys4c/H3LPHmiV7jFxqrM6LGPScPK3vQinUrEZ3u
         SMIo0c8z5CLF5J8OYDQvJJxzTh90lNYOt83J0ljLogoi26qSKW+NrMuI2lNcLfxSLLrZ
         7H/Zpxb4O5eRMo6AdJHkbtyPGsOiWnXPKitoMjQ/gTHuW9Te5z9u3jbhlkuRcsFMJPJh
         hrig==
X-Gm-Message-State: AO0yUKUZ6WshIdmriWFSHi3YbMkmFpoBDk2K9ofrX9SnRJSGUML5242U
	lOoRUg+bPGdSr53pqKG5FFNsxRtD+hDgmanBRmk=
X-Google-Smtp-Source: 
 AK7set9qHO+MH9xAROxLYOE4p043LeWqXnPRsevKXosllot95F0KIdU/0MxvEzFV4Xs2KqeuIq+REdqIbhJF91WRAFI=
X-Received: by 2002:a50:f68a:0:b0:4fa:ff23:a87a with SMTP id
 d10-20020a50f68a000000b004faff23a87amr5365843edn.5.1678811852580; Tue, 14 Mar
 2023 09:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230314153409.1805280-1-daniel.baluta@oss.nxp.com>
 <6d9d09aa-d83e-e811-1d43-34780ea05d4d@linux.intel.com>
In-Reply-To: <6d9d09aa-d83e-e811-1d43-34780ea05d4d@linux.intel.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 14 Mar 2023 18:37:20 +0200
Message-ID: 
 <CAEnQRZAj-FW-fCWsyupUDAH4Z2kTf0RL1acivyDHszMuU-75pg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: soc-compress: Inherit atomicity from DAI link for
 Compress FE
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: C6KGQ5QDACOGM2TXM4AUQKBQM7XIRL7U
X-Message-ID-Hash: C6KGQ5QDACOGM2TXM4AUQKBQM7XIRL7U
X-MailFrom: daniel.baluta@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Daniel Baluta <daniel.baluta@oss.nxp.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
 linux-kernel@vger.kernel.org, paul.olaru@nxp.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C6KGQ5QDACOGM2TXM4AUQKBQM7XIRL7U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Mar 14, 2023 at 6:14=E2=80=AFPM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 3/14/23 10:34, Daniel Baluta wrote:
> > From: Daniel Baluta <daniel.baluta@nxp.com>
> >
> > After commit bbf7d3b1c4f40 ("ASoC: soc-pcm: align BE 'atomicity' with
> > that of the FE") BE and FE atomicity must match.
> >
> > In the case of Compress PCM there is a mismatch in atomicity between FE
> > and BE and we get errors like this:
> >
> > [   36.434566]  sai1-wm8960-hifi: dpcm_be_connect: FE is atomic but BE
> > is nonatomic, invalid configuration
>
> Not clear on the 'FE is atomic' in the case of a compressed stream,
> which has to be handled with some sort of IPC, i.e. be nonatomic.
>

'FE is atomic' in this message is printed because this is the default value
of nonatomic field when PCM struct associated for a Compress PCM
struct is allocated.

No one changes 'nonatomic' field for Compress FE until my current patch.

> Also not sure why the FE is not set as nonatomic by the SOF parts?
> If it's needed for PCM, why wouldn't it be needed for compressed data?

FE is not touched for SOF parts. Only BE is set to nonatomic by SOF.

See: sound/soc/topology.c

=C2=BB       /* Set nonatomic property for FE dai links as their trigger
action involves IPC's */
=C2=BB       if (!link->no_pcm) {
=C2=BB       =C2=BB       link->nonatomic =3D true;
=C2=BB       =C2=BB       return 0;
=C2=BB       }

FE for PCM is modified by sound/soc/soc-pcm.c

int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
=C2=BB       pcm->nonatomic =3D rtd->dai_link->nonatomic;

So, I guess people assumed that is enough to use RTD dai link to set
pcm->noatomic field
and didn't look at it in SOF.

When FE for Compress PCM is created, we don't use soc_new_pcm but instead
we use snd_pcm_new_internal which doesn't inherit the nonatomic field
of the rtd->dai_link
as Normal PCM does inside soc_pcm_new.

So, my patch makes sure we inherit the nonatomic field from
rtd->dai_link also for Compress PCM
similar with what already happens for Normal PCM.

tl;dr: when creating a Normal PCM pcm->nonatomic is inherited from RTD
DAI link. when creating a
Compress PCM pcm->nonatomic field is not set. This patch makes sure
that for Compres PCM
we also inherit nonatomic from RTD DAI link.


thanks,
Daniel.
