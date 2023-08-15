Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1375077D172
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 20:01:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98C83741;
	Tue, 15 Aug 2023 20:00:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98C83741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692122484;
	bh=FXj+8sKlqlXMsxDORfC7Bhw1b26oH7JFDlqvBHhhND8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L9NRVuh2ZsjiouOH3o3EPVuZ5aCzoTr5z1UgXBkvKg7tSUyE8+w3dwaIah3/GNBUL
	 rP+a2y1ZH9Jsq/exGRe7VbllJVbOYIZSyFBRQLKS1ys+/Sr9eY4cwhZGY+FLlFXj4G
	 1oPAYMXsjPM65LV7W78cZs/42liZn2El1MEtBqRM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D57DF801EB; Tue, 15 Aug 2023 20:00:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39F68F8016A;
	Tue, 15 Aug 2023 20:00:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EEF0EF8016D; Tue, 15 Aug 2023 20:00:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88CBEF800EE
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 20:00:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88CBEF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=eZp7hoaV
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1bdbf10333bso34065965ad.1
        for <alsa-devel@alsa-project.org>;
 Tue, 15 Aug 2023 11:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692122419; x=1692727219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXj+8sKlqlXMsxDORfC7Bhw1b26oH7JFDlqvBHhhND8=;
        b=eZp7hoaVU1AMpYqIxli0D9Os8ytjUBe3C1AZyGrgQcyZlBFG3syJ7BgX2s3Ygzk6bw
         W3HP67Lr3wT3llB24VKQJHpAS0WMEvLpixi7OMFOV4+4rzUORdQG4x9HGhcLGmXHYVkW
         TTIGd7ZIvsRxGZsTVCghldp5XD18Vt/QkEGhUZEg2+jTVSHyzpoJVVBDr47vOC74/OCD
         7xsTknl1rhqDsizQr4y6bWrnlHc9/m5gY0B+I1i8YP+A61WkDnk2YKsjxBGbn7RgynNk
         VZR/RfJf95OgiehOYHoEnu9zXAZR2EUY5dEgLOSBdZrBWrJ7wBbuciq9cSUzcJrAIaiC
         79Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692122419; x=1692727219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FXj+8sKlqlXMsxDORfC7Bhw1b26oH7JFDlqvBHhhND8=;
        b=OQ0gCiFihwDAHygN0C39YW3EcXw92P0Zv/zFg+hNviTyV3oX1EaKc94G084PxuYrIU
         RX7WiGrvnbJdgXgvxryFHuSnlY6onSB09C3Nf9gSWIxB9xzuhDfr3YoXSHAdsMrvGEXC
         kkoOo5mK8qv/yLuqqdl42vhXElRlXNMGHOkDKQowfHVwAxTEyW53gcJl80wuhBofkXC+
         HpXbm/2k1boyQHrKiGeqsG0mxyiJlGuEUN8Ua0pMNAyGTLmH5ePQG2SyAVTjmPyzTHoO
         8saAubcDLUBMgB23lWd/NWRR7PMmRvYqtPP7OYOkVdAc8J+98LB43SET/ArKAOCls3jr
         Tsiw==
X-Gm-Message-State: AOJu0Yw6D654cBCgaWttlvE1i2KVuytFiDg0WI34l80dQiziYerXG9bA
	bpRYrpSvSoTGOGs7XqOLo6xHNzFIofnZ2Io95mE0Ig==
X-Google-Smtp-Source: 
 AGHT+IFAi5FgUWSQIF16+MS4SZAOtyCFJrGXuq9I2nlN3EPINCf7JliZdMwCndQGl2cGG1osK593CBedfedPivltRGQ=
X-Received: by 2002:a17:903:41cc:b0:1bd:f71d:5298 with SMTP id
 u12-20020a17090341cc00b001bdf71d5298mr3620111ple.3.1692122418381; Tue, 15 Aug
 2023 11:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <ZNuDLk5hgmfKrZg6@arch>
 <850c5b2c-265e-a565-8a88-58a88f8fb4e8@linux.intel.com>
 <CAOReqxjbjkhkqfvTWs9i5NxK6QAsk42Daw1pA_1+b1zG5mbKmQ@mail.gmail.com>
 <ZNuyuerb0M6IGRKj@arch>
In-Reply-To: <ZNuyuerb0M6IGRKj@arch>
From: Curtis Malainey <cujomalainey@google.com>
Date: Tue, 15 Aug 2023 11:00:07 -0700
Message-ID: 
 <CAOReqxi_fkthH7SPdQ6ycyMx+2Mpi+JHHYhPJKi-u82SsfN9gA@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: hda: intel-dsp-cfg: Add Chromebook quirk to
 ADL/RPL
To: Brady Norander <bradynorander@gmail.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
	broonie@kernel.org, cezary.rojewski@intel.com,
	amadeuszx.slawinski@linux.intel.com, perex@perex.cz, tiwai@suse.de,
	cujomalainey@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: E7N3JNIPLFDIOL3WCROIYYXISZWKCPQJ
X-Message-ID-Hash: E7N3JNIPLFDIOL3WCROIYYXISZWKCPQJ
X-MailFrom: cujomalainey@google.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E7N3JNIPLFDIOL3WCROIYYXISZWKCPQJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Aug 15, 2023 at 10:15=E2=80=AFAM Brady Norander <bradynorander@gmai=
l.com> wrote:
>
> On Tue, Aug 15, 2023 at 09:56:44AM -0700, Curtis Malainey wrote:
> > On Tue, Aug 15, 2023 at 8:56=E2=80=AFAM Pierre-Louis Bossart <
> > pierre-louis.bossart@linux.intel.com> wrote:
> > > On 8/15/23 08:52, Brady Norander wrote:
> > > > AlderLake and RaptorLake Chromebooks currently use the HDA driver b=
y
> > > > default. Add a quirk to use the SOF driver on these platforms, whic=
h is
> > > > needed for functional internal audio.
> > > >
> > > > Signed-off-by: Brady Norander <bradynorander@gmail.com>
> > >
> > > Thanks for the patch
> > >
> > > Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > >
> >
> > Now that I am looking closer at the patch, I am very curious why we are=
 not
> > hitting the following case and using SOF
>
> The DMIC detection looks for DMIC endpoints in the NHLT, but these
> devices don't have NHLT.

There would be the brokenness then. Is the DMIC not something that
shows up in coreboot? Or is it only defined in the topology? If the
latter we should probably extend this patch farther back to GLK.
