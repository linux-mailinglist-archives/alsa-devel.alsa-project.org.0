Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AAA711434
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 20:37:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF3D5886;
	Thu, 25 May 2023 20:36:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF3D5886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685039827;
	bh=t/ms0pwOAuDnl9IxrHsVJUCzq/i6WgFJfupJsy3w7/E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fRlgd7HzSJ5IO17TjhYGdQRAzgRLbbLotNNx1BFR73dM9GSqLN9pRvqoxDpat2zuT
	 fblU3TmM7pEC7GOLAP8SzzSgRpeqRf388OehHtU6rVDcWEhsqxiwm+MirWmlawE2SA
	 g1v2vXwh7RrttWR8sm178yoTYYYMUM3LEVgqIGrM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE535F8055A; Thu, 25 May 2023 20:36:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B006F800DF;
	Thu, 25 May 2023 20:36:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD92EF80552; Thu, 25 May 2023 20:35:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34A04F800DF
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 20:35:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34A04F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=g9JfbEY9
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-96f50e26b8bso171815666b.2
        for <alsa-devel@alsa-project.org>;
 Thu, 25 May 2023 11:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685039753; x=1687631753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7LfxAZR8t52u4AO1SI5kqvS9LLBpQSJuHQCFUX9OzGQ=;
        b=g9JfbEY9bxh9EFIPrAmrY+rOfrj+WxxnuJ/cu8Dy8jgAuxdkF7fJ2GQ1kUODnVFDDz
         +hBd/VU0QaeUH2K+JB3vk6q2kH+7eqi54cjsOTvNUgE5r+nXS3C6PV2JrI6tjglNMGAP
         h/52M9XN3BDzkpN0nx83F6MNLOM075WaOwoUQGDGM7nsbMETbyvN+F9OJ45JlObjkAoB
         VlsoaCqwUJr1ckApxtYKGoKag0/TgNw/iB25yH2nu1Y7nHljvljytaCKr5NSJ0pMBcGT
         QlO0NXoj8ryYtS/Hk5r5LLvG0XWLQeHITLweEidUZmOz49K4Ax6Fy5RV+mBaYxZzNg7S
         Y7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685039753; x=1687631753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7LfxAZR8t52u4AO1SI5kqvS9LLBpQSJuHQCFUX9OzGQ=;
        b=fI3Vqn2DTV9TPO/e3dENgQhcsl/uYe7LXEvmAie2o9dYQDRUOe8mE28xa8+QbnTvyo
         IJKySnHmenZZI0JEmTccX1OEdHUseVEw18zrz8EnfkV41F3DNJK/sv0bXL6zC8PhSEhm
         2EVM9xjvyK8pev47CIN2Gu8avULoZGf8JeYGclJzF330q4qX5ncMXW8cNlYPxpKfaINU
         oY5qguJeK6dLO5Gr/7vCe3gnhsarC3bldjTR8w0oILY/OAKO+9Ru0a7JcghHX4FUn/c0
         CQ8JGBzoXXNrMk7JkmRYG4Q/LsQJPkiwZhMlvJT8AFbONpZChfcUA3P5H1XfTJmJ/Io/
         O0kg==
X-Gm-Message-State: AC+VfDyfCYlxHoF7Y/1j6YNyqnjEvH5uc/q3ELRUGdzkO4h5Tm7Ak7B5
	k74L4JD5sX2oMAwu1Mv1rbjrVWvwbDBwlo92SBo=
X-Google-Smtp-Source: 
 ACHHUZ6HhImvycIW5y9vQ9Fb6/lTe4cNBTqpqgaXHCHK9T60sVxAPi6KnVa8R196FbkpqvqTomfV6C0HgBOSM2p6AwU=
X-Received: by 2002:a17:906:6a0c:b0:96f:3e35:748a with SMTP id
 qw12-20020a1709066a0c00b0096f3e35748amr3072640ejc.6.1685039753202; Thu, 25
 May 2023 11:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230525122837.649627-1-daniel.baluta@oss.nxp.com>
 <69c2b7cd-f211-47ef-b42a-609ee792de11@sirena.org.uk>
In-Reply-To: <69c2b7cd-f211-47ef-b42a-609ee792de11@sirena.org.uk>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 25 May 2023 21:35:40 +0300
Message-ID: 
 <CAEnQRZAseAmOHLBsBQuW+SqEFbT-pbrjpUiPhSuv8Ww2VoJf_w@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: SOF: imx: Add OF machine descriptors for i.MX
 platforms
To: Mark Brown <broonie@kernel.org>
Cc: Daniel Baluta <daniel.baluta@oss.nxp.com>, alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
	yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com, linux-imx@nxp.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: ZAER6GKO3BZCPDKYTX42UBN2BKFAVKAL
X-Message-ID-Hash: ZAER6GKO3BZCPDKYTX42UBN2BKFAVKAL
X-MailFrom: daniel.baluta@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZAER6GKO3BZCPDKYTX42UBN2BKFAVKAL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, May 25, 2023 at 8:07=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, May 25, 2023 at 03:28:37PM +0300, Daniel Baluta wrote:
>
> > +static struct snd_sof_of_mach sof_imx8_machs[] =3D {
> > +     {
> > +             .compatible =3D "fsl,imx8qxp",
> > +             .drv_name =3D "asoc-simple-card",
> > +             .sof_tplg_filename =3D "sof-imx8.tplg",
> > +     },
> > +     {
> > +             .compatible =3D "fsl,imx8qm",
> > +             .drv_name =3D "asoc-simple-card",
> > +             .sof_tplg_filename =3D "sof-imx8.tplg",
> > +     },
> > +     {}
>
> It seems a bit sad to be adding simple-card rather than audio-graph-card
> at this point - is there some great reason for this?

This is what we used so far and it works pretty well for us.

Is there a plan to deprecate simple-card? And switch to audio-graph-card?

We could have a look at this if this is the correct direction.
