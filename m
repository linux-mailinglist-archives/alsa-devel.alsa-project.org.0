Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5137178CCCC
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 21:18:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FD9DA4A;
	Tue, 29 Aug 2023 21:18:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FD9DA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693336738;
	bh=X2t40mAu2/QsAUc+P5iBJXSXuGzsrr88EkpyLZFdv9U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GM92psQdg1OeLsfhz62L1fz2Q7v86/BH3Tw9923wA5H6g5XhYB3bjzcazMQKdVuaK
	 /i88kKyX4GurEhPRIir8FYwlfh6Mo2R4ACPiMVXQLVTrAMW0IEmfLXbAPxdt1y9zsp
	 G8NnT46QljzCW5lwyqozkB8hLKAnTFtkhGDKpKcE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1201F80005; Tue, 29 Aug 2023 21:18:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78142F80005;
	Tue, 29 Aug 2023 21:18:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25C19F80155; Tue, 29 Aug 2023 21:18:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED377F80005
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 21:18:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED377F80005
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=GAsLIZtM
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-26f9521de4cso2573534a91.0
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 12:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693336680; x=1693941480;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIPc4LBNV0ClWvi5rl+BTpbrtim01ePs516GeK/aZHU=;
        b=GAsLIZtMR2rHJ/YiDb06cpxhR2sY84puxPTdPvbdxUAl0dowP2jvFMMeQ/65kA7a5k
         4Ap5JSUAKtlqO12qwHYDx0goDyEAbBsRMsJw0rYCMsfY2XEW3/v1OTOE6Jp/BMcMs9NA
         vgJPT+Fx07ooJuOyS8GsbeYaT/aUzpSOv5TjvZL11bLcGsVycDPZQACO4dd1a437ZwKb
         8amdiYkRm/LTSsRHMKRrzZKlIDFMUoNleCkiqenOIuoycNk12Ldo+PA7PAk6Y+VZB+i/
         LmyEMBjVziy1mT21jJIxEb/VNxVo2kMVrvGYbfihwb3n/m60ZPtA2LteHubJHzXXaJnH
         PTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693336680; x=1693941480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BIPc4LBNV0ClWvi5rl+BTpbrtim01ePs516GeK/aZHU=;
        b=Ni2lActVq6kh1JWJg3woD6AIf4zCMWQQakBYd8g36yOePh2XDPT3fkp2ua4XCcmyBf
         zhaq5YmSLtHPCOmvDclTwJRSR7PCOkHBX5SHvAvhdo/pcsCeRPK188hqOUrr5TuYXiVV
         7fwN0aQ8Ey4tON2RhsyAgj+vMOFKj0+VGF38DICSQvqhYEEfVCfzytbkga+ThK4IgOvH
         030UX5W1BYzhoO1lHvtgDYVP9uuOf0WKFreQPMCSkUVx0kGBsIhZpmItYeCbGaPonIm+
         x/ZK7mMkeT0s5e/u8jwZ3yCVu0Cdn/Px5YRk03cbNEst375R+vrZE5EXehZY8w5KBST2
         mHxQ==
X-Gm-Message-State: AOJu0Yzs1fUxO1RIRWN0tlelHW19fBnuGGl/VV4sbVzu5Ivc/LBt6Yiz
	ldCA4VvpiMTxebRTRoMlMa74T3Bv9l89+3WlqBZr1Q==
X-Google-Smtp-Source: 
 AGHT+IEQiDP2YIcAM3UEHJMeftLbrHg2g7vZuMMxaUIjFqAKhqaj+M7+BfAsXLppI+Zabrdg8B66z10Hh5eauB5e/fc=
X-Received: by 2002:a17:90a:ebc9:b0:26b:f67:9d1b with SMTP id
 cf9-20020a17090aebc900b0026b0f679d1bmr97256pjb.30.1693336679386; Tue, 29 Aug
 2023 12:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230824213312.1258499-1-cujomalainey@chromium.org>
 <ce20d02b-56ed-acd1-411b-8c68d8cabea8@perex.cz>
 <CAOReqxiDZOAEYYb5c73AHu+Nd2vZinLR5qdMAVJnEcV8TS6=Nw@mail.gmail.com>
 <6d498d35-841d-4ea4-2fd9-990f9b02563e@linux.intel.com>
 <6fc8a33a-52f2-0cd1-6259-b2b974548602@perex.cz>
In-Reply-To: <6fc8a33a-52f2-0cd1-6259-b2b974548602@perex.cz>
From: Curtis Malainey <cujomalainey@google.com>
Date: Tue, 29 Aug 2023 12:17:48 -0700
Message-ID: 
 <CAOReqxh2-m5QmHJz-iN0eeuGFfuo0WqAHDcKKXs4ZB4AwK-qrg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ucm: docs: Add EchoReferenceDev
To: Jaroslav Kysela <perex@perex.cz>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 cujomalainey@chromium.org,
	alsa-devel@alsa-project.org, tiwai@suse.com, ethan.geller@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: IFJ6SF6A6SJZZACU5ZW5B7JH5M6RX6CB
X-Message-ID-Hash: IFJ6SF6A6SJZZACU5ZW5B7JH5M6RX6CB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IFJ6SF6A6SJZZACU5ZW5B7JH5M6RX6CB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Aug 29, 2023 at 8:37=E2=80=AFAM Jaroslav Kysela <perex@perex.cz> wr=
ote:
>
>
> The modifiers may define extra PCM streams in the standard Value section =
- you
> can use CapturePCM value for the modifier like "Echo Reference". Modifier=
s may
> alter the characteristics of the original UCM device stream (using comman=
d
> sequences), too.

Thanks for the clarification, that indeed is where the assumption I
think for most of us is not as clear. I would have never thought a
modifier would carry a PCM.

I will trigger some work internally to convert our value to the modifier sy=
ntax.

Curtis

>
> Modifiers are an extra layer on top of devices. I don't think that we hav=
e any
> default relation between the modifier PCM device and the original PCM dev=
ice
> (from the UCM device definition). A new value to describe this (like
> "ReplacePlaybackPCM 1") may be introduced. Another issue is when multiple
> modifiers with this description are active - they conflict, so it should =
be
> described somewhere, too. Perhaps, "ConflictingModifier" array may be add=
ed to
> API. But those extensions are not required for the "Echo Reference" modif=
ier.
>
>                                                 Jaroslav
>
> --
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
>
