Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A021994EB38
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2024 12:34:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3F802097;
	Mon, 12 Aug 2024 12:34:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3F802097
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723458868;
	bh=53diBSJIt3VJL8ICb+KbhOnHfQVqCPJkKKJXnKOXMfw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HJ8uE0uq9o+zcfXL7XcLdwzqD1AvDrz/B6HzA7LkMJvehnXO8dZNjrhdOPWZGE2/S
	 CyfqWViBX+ZzMf1bUeB8E3u6ZQXX//yhGYHegHImnEOYJp43upY3toB/dMUYgiXlG+
	 hXNEBniQE3VBLUDgF9WKUCcnOczKF0urteyIq8Dk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CBDCF805B0; Mon, 12 Aug 2024 12:33:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D57AF805AF;
	Mon, 12 Aug 2024 12:33:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA488F8016E; Mon, 12 Aug 2024 12:27:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3BF9F8016E
	for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2024 12:24:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3BF9F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=D+0uUm5D
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-397ba4f7387so19427315ab.0
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Aug 2024 03:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723458263; x=1724063063;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPC3vtsqYn5XJUeqo67iJn2rVnzxW9E5GvxuWYZUQ5I=;
        b=D+0uUm5DApWRlehGOc8lkkIjefbUt3hsF3L7VA1jHRYRobRLuj5QRv35prwqpk5saq
         wmqJiM3l5ZnS3FENdR5kllnrmkQSXnhdh4inZFmS3VHt6k5ll2acOcuEoTpxcVX5QjO+
         E2pcXotftbiHrcgwEee098r92eSdIHJJ0b1Xkq8yBDTy+D3Ovn7LEVWxCW5bDleGCthr
         1oJAVPa8xCIB4OsyALJpEsncxQ+boynrbY25hduExx0Pg7x57HHUtK9VPB3buAB86EoV
         McuENUABomXuJFThxKHBflINN1DMB9W9GsS7djoxMO2QPPV7TpsEy2JwInUl5VRCYCKV
         A0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723458263; x=1724063063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mPC3vtsqYn5XJUeqo67iJn2rVnzxW9E5GvxuWYZUQ5I=;
        b=EbqwX3RWdnMObO086DC7lZfWCf7ldKP2eatxS6FrShjk5UhhvjVRWdfxzd4mgZ9xne
         Pw7WxI11akB0EUxm1YLftW/ms/FXXA8nAMNuueWDoUJICzGBaJApidpMYSfhwUsPQobS
         /9g5HGbsqAJj0xWPXhaEUA1IoHcFd38ZsEZiBWyH8pDOBluzMn4myRe1Fy7NRAEYxEwM
         dX5/BpnUoY1FQgvzX0P4ECFJt+Zmfn6D4EVKtOJYpPI/L7igZvUrNpHsG8nvaV0fSxfS
         Xk8gHuwBadOC655iG/mf8okQbEK1rhCK2lrtpWTjFAz2NB8Vw2BnIlsn2ws55MdA1m4m
         RPlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPibrYrjszuE9+9AneGDh4C6GwN2i8Qvj87mzd1I5ybyrFWezfV9m5czOqx5e+VqY2cy0Jb5JOlr/fmMAkHMvZ8TGLkUrsdpKwWPk=
X-Gm-Message-State: AOJu0YwAx1XdWZ1ScWkMiNsAxIntgsWkNjG72HZ/tkASjz6a0j0Lb94t
	uemiQBU7tONdwKqImBy4ZCeZOFgCtUrSKeaRPbIpcVyhNyr6YrjeAx2hF2XhY/AZCP2xKeY3NGy
	rOT9FtGqGMPPjcy7M37YxqPufaKQ=
X-Google-Smtp-Source: 
 AGHT+IHdQ3RNrczHyEp+b16RjNhnMCOeSegrx7nTq50uxdHKAwi7ql6H7scu59mGUC+Dyrjh2BuMJ/sg9salc/H/EqI=
X-Received: by 2002:a05:6e02:1a04:b0:397:2dcd:80e5 with SMTP id
 e9e14a558f8ab-39b7a463914mr85661235ab.27.1723458263144; Mon, 12 Aug 2024
 03:24:23 -0700 (PDT)
MIME-Version: 1.0
References: <1722940003-20126-1-git-send-email-shengjiu.wang@nxp.com>
 <1722940003-20126-2-git-send-email-shengjiu.wang@nxp.com>
 <e89a56bf-c377-43d8-bba8-6a09e571ed64@linux.intel.com>
 <CAA+D8AN9JXJr-BZf8aY7d4rB6M60pXS_DG=qv=P6=2r1A18ATA@mail.gmail.com>
 <ffa85004-8d86-4168-b278-afd24d79f9d8@linux.intel.com>
 <116041ee-7139-4b77-89be-3a68f699c01b@perex.cz>
 <930bb152-860a-4ec5-9ef0-1c96f554f365@linux.intel.com>
 <c9039808-cd04-452d-9f6c-f91811088456@perex.cz>
 <ed1192e0-00e7-4739-a687-c96dc2d62898@linux.intel.com>
 <CAA+D8AMOh=G7W5-dYw_=Xx-s0PqEu2suKYorscoWku86Rn-=+A@mail.gmail.com>
 <542d47c5-7ce3-4c17-8c0a-3a2b2a9e6c6a@linux.intel.com>
 <c3b8f7b8-fc5e-4285-bee8-7edd448a405d@perex.cz>
In-Reply-To: <c3b8f7b8-fc5e-4285-bee8-7edd448a405d@perex.cz>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 12 Aug 2024 18:24:11 +0800
Message-ID: 
 <CAA+D8ANg7C7vuxU44mAG8EnmcZjB_te5N_=4M4v_-Q9ZyPZ49g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] ALSA: compress: add Sample Rate Converter codec
 support
To: Jaroslav Kysela <perex@perex.cz>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, tiwai@suse.com,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: YG6BLIB4YZ3JHHAPLSYMQ2DTVTSTXOMN
X-Message-ID-Hash: YG6BLIB4YZ3JHHAPLSYMQ2DTVTSTXOMN
X-MailFrom: shengjiu.wang@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YG6BLIB4YZ3JHHAPLSYMQ2DTVTSTXOMN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Aug 9, 2024 at 10:01=E2=80=AFPM Jaroslav Kysela <perex@perex.cz> wr=
ote:
>
> On 09. 08. 24 14:52, Pierre-Louis Bossart wrote:
>
> >> And metadata
> >> ioctl can be called many times which can meet the ratio modifier
> >> requirement (ratio may be drift on the fly)
> >
> > Interesting, that's yet another way of handling the drift with userspac=
e
> > modifying the ratio dynamically. That's different to what I've seen bef=
ore.
>
> Note that the "timing" is managed by the user space with this scheme.
>
> >> And compress API uses codec as the unit for capability query and
> >> parameter setting,  So I think need to define "SND_AUDIOCODEC_SRC'
> >> and 'struct snd_dec_src',  for the 'snd_dec_src' just defined output
> >> format and output rate, channels definition just reuse the snd_codec.c=
h_in.
> >
> > The capability query is an interesting point as well, it's not clear ho=
w
> > to expose to userspace what this specific implementation can do, while
> > at the same time *requiring* userpace to update the ratio dynamically.
> > For something like this to work, userspace needs to have pre-existing
> > information on how the SRC works.
>
> Yes, it's about abstraction. The user space wants to push data, read data=
 back
> converted to the target rate and eventually modify the drift using a cont=
rol
> managing clocks using own way. We can eventually assume, that if this con=
trol
> does not exist, the drift cannot be controlled. Also, nice thing is that =
the
> control has min and max values (range), so driver can specify the drift r=
ange,
> too.
>
> And again, look to "PCM Rate Shift 100000" control implementation in
> sound/drivers/aloop.c. It would be nice to have the base offset for the
> shift/drift/pitch value standardized.

Thanks.

But the ASRC driver I implemented is different, I just register one sound
card, one device/subdevice.  but the ASRC hardware support 4 instances
together, so user can open the card device 4 times to create 4 instances
then the controls can only bind with compress streams.

I think I can remove the 'SNDRV_COMPRESS_SRC_RATIO_MOD',
Only define a private type for driver,  which means only the ASRC driver
and its user application know the type.

For the change in 'include/uapi/sound/compress_params.h",  should I
keep them,  is there any other suggestion for them?

Best regards
Shengjiu Wang

>
>                                         Jaroslav
>
> --
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
>
