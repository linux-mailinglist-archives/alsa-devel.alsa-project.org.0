Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D23171456E
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 09:26:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 370DC206;
	Mon, 29 May 2023 09:25:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 370DC206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685345204;
	bh=Ndxc3sPrrSiLVxnXpQlWWVqnhymmOsarFiW+5WbZBk4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YbV5yRmLg4DxmTy/TJM4s8d/Khda+arwKvsA3aZrK2JF1FBJqtPDNAWvdNd3XZQZy
	 eqiCJVXD20iLRnMAlPbNXMqxFIe84TrUTxTfWtKuyDhH8KLEQb5WsE2aDC77YIMEJd
	 3fzujcZLgd+ZW+slcZXv8ZBy8fOM1UiiGBh9fM2A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A30FAF8042F; Mon, 29 May 2023 09:25:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02FB8F8026A;
	Mon, 29 May 2023 09:25:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47B43F8042F; Mon, 29 May 2023 09:25:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 21446F80086
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 09:25:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21446F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=P/iSYFpQ
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-969f90d71d4so424111066b.3
        for <alsa-devel@alsa-project.org>;
 Mon, 29 May 2023 00:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685345139; x=1687937139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKRg7l5upkPsHIbZGSw6Q8T2a/KMJm+ptNrO6T1korM=;
        b=P/iSYFpQmgEljYGK2XHIQlE5MqGp/QLon7aRZTfpzPWXUEusqmS6BApSim4mj9x/D5
         /93UGSQD5xtqefIXombswSsHyQ0W8CSIXotboM6ZBjl4+yzw+1os8u05fsG5cfZCi3li
         1ygO3ysknEbwRLDUQLwIcar7XMX9nV3bWyD6TDPpwDyFtPy+lvJzPvhF8HNp/UBILU/o
         8keIrXXXOxNsb0/18B87quiSqb2Phqy5MHvfj9jY30rHP2e4v+cEVgApXOeBsQWxqJYs
         l+sQwrzPPssAkdh/xWmlPAppqVW9yQFOUo4zM2HtFD3mZvfux1+i1qi22kQjhVkguHaE
         Bl2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685345139; x=1687937139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VKRg7l5upkPsHIbZGSw6Q8T2a/KMJm+ptNrO6T1korM=;
        b=jEI0u7buKPLhv8tnCtdVK8j+MwuwuqI9jDioJ7vYrnIL9gW4RekGf1X4ZOpu1On5pG
         87dcDGP7A73NXEIME+ntbI4Om1jm0K/skYBWiq7448ZLSj+ZZ7kUnsBv0HFCwg9QjbdP
         dP5FP9N/o8wfQMcuJZa4G6gbqv1SUv2P7DwDDowT8H377oJnHD/3GH0InDfqJVsP2gRY
         V3EQmJBxqJKMdyyuCI+vOKunuR7Bb0FlfDM7G2I96tOVfhAraFjitVATHvuiO3iKeYJb
         ABjaKXlmuQ5AHiNb/pfZGYx+PwZpnBGGAP+v1yj5sHISJejEgqHMONWBoASfIX3PdrP0
         DMRw==
X-Gm-Message-State: AC+VfDxFoT2W4/sE4EMzzd/yuLefdNykETeuLzOsQOIlKxHjocsoeuCO
	fEhQVieF+4Tj8ofNx+9n+LyeDKOFygur7n5wdJo=
X-Google-Smtp-Source: 
 ACHHUZ5o0wacQ702LrQubMWpOhTJauZeqW+GMEsMsxGDKb9Shv3EqNUyOU1XwX5LqkT2fpMFJ+G7vKhrUy0+dhXHY3I=
X-Received: by 2002:a17:907:7243:b0:94c:ea3b:27a with SMTP id
 ds3-20020a170907724300b0094cea3b027amr9760839ejc.16.1685345138979; Mon, 29
 May 2023 00:25:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230525122837.649627-1-daniel.baluta@oss.nxp.com>
 <69c2b7cd-f211-47ef-b42a-609ee792de11@sirena.org.uk>
 <CAEnQRZAseAmOHLBsBQuW+SqEFbT-pbrjpUiPhSuv8Ww2VoJf_w@mail.gmail.com>
 <9484d916-2983-40a3-bad9-b2125e48e2b6@sirena.org.uk>
In-Reply-To: <9484d916-2983-40a3-bad9-b2125e48e2b6@sirena.org.uk>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 29 May 2023 10:25:26 +0300
Message-ID: 
 <CAEnQRZA+dXPN6xeV1SZk6YbaZSqTxoP7AJ9mqko98Jj25cs0Kg@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: SOF: imx: Add OF machine descriptors for i.MX
 platforms
To: Mark Brown <broonie@kernel.org>
Cc: Daniel Baluta <daniel.baluta@oss.nxp.com>, alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
	yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com, linux-imx@nxp.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: Z3FA4BJXEYP5J65S5Q6KUEVOHAWQXEL7
X-Message-ID-Hash: Z3FA4BJXEYP5J65S5Q6KUEVOHAWQXEL7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z3FA4BJXEYP5J65S5Q6KUEVOHAWQXEL7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, May 26, 2023 at 6:32=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, May 25, 2023 at 09:35:40PM +0300, Daniel Baluta wrote:
> > On Thu, May 25, 2023 at 8:07=E2=80=AFPM Mark Brown <broonie@kernel.org>=
 wrote:
>
> > > > +     {
> > > > +             .compatible =3D "fsl,imx8qm",
> > > > +             .drv_name =3D "asoc-simple-card",
> > > > +             .sof_tplg_filename =3D "sof-imx8.tplg",
> > > > +     },
>
> > > It seems a bit sad to be adding simple-card rather than audio-graph-c=
ard
> > > at this point - is there some great reason for this?
>
> > This is what we used so far and it works pretty well for us.
>
> > Is there a plan to deprecate simple-card? And switch to audio-graph-car=
d?
>
> > We could have a look at this if this is the correct direction.
>
> It's already deprecated, and audio-graph-card (really you want to use
> the audio-graph-card2 binding) is much more featureful so will cover
> more machines.  If you're doing something new then it's best to use
> audio-graph-card for future proofing, simple-card is a bit too simple
> and inflexible.

Ok! Thanks for clarifications! Will use audio-graph-card!
