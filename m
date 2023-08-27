Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D113789DCF
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Aug 2023 14:17:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F5B5846;
	Sun, 27 Aug 2023 14:16:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F5B5846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693138633;
	bh=n7GPHkzuEyJz8xM/RDAdmy9cky670T+7bzkNS1rM+Es=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l4VEZBLBBx+JI/QYU6lt+nRH7T+/IdXLCqBLMUsfwyzeSFJFAYxk1ZDDUGd9f+1JB
	 iPuXrSrTU1orAncdNP6CKZA6+klwYiRSZ/SAEQHFRY3xk/h2jc6bkhdJkSAo3n+eHl
	 QlftdmM81wvyTIJvexhKbvAry1AM0YZbYbOprwI0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2590F80249; Sun, 27 Aug 2023 14:16:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 274EFF80155;
	Sun, 27 Aug 2023 14:16:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9977F80158; Sun, 27 Aug 2023 14:16:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1F37F80074
	for <alsa-devel@alsa-project.org>; Sun, 27 Aug 2023 14:16:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1F37F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=glPoHyK4
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1c4c7a83bcdso1724671fac.0
        for <alsa-devel@alsa-project.org>;
 Sun, 27 Aug 2023 05:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693138573; x=1693743373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhxICFeGkDE2p17yC8izuoNjV+Z/iSI5rHHAjSvkmHw=;
        b=glPoHyK4XgY4XfEpkbQSpCwxsu9p7pC8YvPcSkKscCVQo0lr6ziV/COWFB4o1orXf8
         xFiWZ9EZ4Z2hsC1GLsd9skmQXMfc9C2iUo+XEFuuIJoY5jfebtVz+RA3zJ3++HBLVXuK
         MMUbkadAzJJgsIO1jTIUCz8MWDnnPsUDSZ9fhwnQU34L3ZHGv4iMCGgnf6kxfWLMm7hA
         AMkFtU+EMmCUxrTyXhUq+mH3uNCFReKUV8sGIx2hMB59adBLlOc6ojpyKp+nY9HKdRO0
         jtmhXQzyhUb/e5YJl6s4/1Jm8yF0EltsodG//DBU6w0R5D8PR8RJoo6XwvhjApRA/w54
         ngsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693138573; x=1693743373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mhxICFeGkDE2p17yC8izuoNjV+Z/iSI5rHHAjSvkmHw=;
        b=l1hMhBqWbUclH665ccGFHr4crFxZloC7lN36a9NY1FVPzAn2F8m47UmXC92CE62UH8
         CZfrA2tFYqGDYph2W8O+EeKw98/LYErXYYJe+CyjO9ZlibZA2Jt6v7QlOpbOqoImNasn
         FygJL/lxYK9cR+SbFTLty0AnD4RevYcFcOiYwrf4t1xGgNN6gNZBPOPu7Any/O4PEisS
         p9sl8YXzDxA6MZYP341WR6DLPQjUwXSGtP2UA9O+txMCMiLCPDuxnlqHgHxV0ikJNheY
         wLcDdrGcOEaSfxJQbhDlOmH9aKse9s7GKLZ6uPA54UUmaAkvZh4DXDwBE4ahcIqGMC0N
         AiHw==
X-Gm-Message-State: AOJu0Yzj61aDMtoQ7UyePE1t7P3bL3z5OKvMoscwhXr7qAEEWnx/qdRA
	oyXgd29mQyyO6qZuQXhHf5/ThglxX2D+3SQMwDw=
X-Google-Smtp-Source: 
 AGHT+IEuFbu3ypnxCPMjRAy9jZ5umJQygWrfnlYh8Z97NtpdIHgolR1SEqkq2yYJgDmchyspR/bvLesvrkcnv9Frry4=
X-Received: by 2002:a05:6870:5693:b0:1be:dbd9:dd21 with SMTP id
 p19-20020a056870569300b001bedbd9dd21mr8542691oao.48.1693138573344; Sun, 27
 Aug 2023 05:16:13 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAHCN7xKQ549ExO83Yur=_MPv3aYFdR0nfzUSuEXO74OddAr5gQ@mail.gmail.com>
 <ZOs5exw+95zzzawK@finisterre.sirena.org.uk>
In-Reply-To: <ZOs5exw+95zzzawK@finisterre.sirena.org.uk>
From: Adam Ford <aford173@gmail.com>
Date: Sun, 27 Aug 2023 07:16:01 -0500
Message-ID: 
 <CAHCN7x+jkU-UoR9DAPorC_i8Z-6sf4Qg2qRW444mzU1DcKiwnA@mail.gmail.com>
Subject: Re: Question about simple-audio-card with dummy CODEC
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	ALSA Development Mailing List <alsa-devel@alsa-project.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 2TUIC4LDXX2X7PZ5KGIORHPZUENFC36P
X-Message-ID-Hash: 2TUIC4LDXX2X7PZ5KGIORHPZUENFC36P
X-MailFrom: aford173@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2TUIC4LDXX2X7PZ5KGIORHPZUENFC36P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, Aug 27, 2023 at 6:54=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Sat, Aug 26, 2023 at 11:15:30PM -0500, Adam Ford wrote:
>
> > I am asking what is the best way to let simple-audio-card  use a dummy
> > codec?  If the dummy codec is the better option, what compatible name
> > should I use?
>
> We have a driver for DMICs, dmic.c - you should use that.  In general

Thank you. This looks like exactly what I need.  I just didn't know
what it was called.

> you should never use the dummy CODEC, you should use a driver for the
> specific thing on the board which will at least describe the
> capabilities of the hardware even if it doesn't have any ops that do
> anything.

I thought the dummy codec was a bad idea based on my searching.  I
appreciate the quick response.

adam
