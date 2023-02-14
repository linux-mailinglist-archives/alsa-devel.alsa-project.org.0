Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F34695C23
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Feb 2023 09:07:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D247828;
	Tue, 14 Feb 2023 09:06:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D247828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676362049;
	bh=QEw3LjkY9Dwtupnvkw2ofVfbZaUuqgG3lT/imotNW00=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f9ozQonAmNfr+gSf2XR1GibehGrNMbUQCwpFan9+Kx+uGJoEf9Cbw28G4pVI9NtDm
	 /nufRNrkHCCIThTgXPtNnlnKsAvh9e7hfXhkhRw0V9OKAVXZ5U+AduDEkVlEn36ZdM
	 MQ3cnCWkdkQywfkNsLd9SmVHqy35Sbs8C+vmS2AA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC11EF800B6;
	Tue, 14 Feb 2023 09:06:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DD7BF801C0; Tue, 14 Feb 2023 09:06:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BCB7FF800E4
	for <alsa-devel@alsa-project.org>; Tue, 14 Feb 2023 09:06:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCB7FF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=shruggie-ro.20210112.gappssmtp.com
 header.i=@shruggie-ro.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=sHFGiKEN
Received: by mail-lf1-x135.google.com with SMTP id w11so22331195lfu.11
        for <alsa-devel@alsa-project.org>;
 Tue, 14 Feb 2023 00:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shruggie-ro.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QEw3LjkY9Dwtupnvkw2ofVfbZaUuqgG3lT/imotNW00=;
        b=sHFGiKENjhCNTKALM5PzduAgUpahCfLHISXl8NKLPSPK0+KbiX9nwHmXK45F1q1dkV
         7Rao/6K5MQfaTphsB73EXFbXYHQ+TWaDgWvAvf7CnFe+jnTtGrsd3XOmWIiKb8VnTr9l
         2zTyR8u0siIUVNzmtCKPfngaAkNmYGZ0N6E7Ysh6YXjvPmmeQN/Du+HL5+Uc0phlCoyb
         kaKutlltXpaG6Gd/pH+9CSa3s/UhdIacdp8BtH0R3HhfcGZJjHVPK/D4V6AVPprptDUf
         grrpJoBJYCff9MlAE/ySyluG+weidOBKLle6zIduV2Rj8GGG9aLpSJv59459kN2hx04Q
         /WWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QEw3LjkY9Dwtupnvkw2ofVfbZaUuqgG3lT/imotNW00=;
        b=PzHiUZOpgY3FBHWpRlBrqsUtgGMuZrt/Zz2DQyexkfAHm5HAmiZGS6MQseESThzutS
         uV6ITjAcfe2FtGwgiM1xA1SlmGdfivjHyuBhNNs9pXqYHfUHT3ACbHSgWj6iAMqoM1Jy
         zmOsufQuCUzP050GKJTYlwF1ih/oR+xYGm/JtnwzJ0IEDZ8Ic2oYWUEBzIbnDHSCiwIl
         BneESniuKgQBnOVdHz+qngiQfH+vPiMZKa1zsKl4P0T3OeBK1Qjfb4bNdv4w76oPBgSW
         M8x4vsc6x7zlPQdBAO4jHSp60IRH1+LADqoqzCWuHwn0ApnKTXr6ZyYlVLkg/HMSM1Nw
         0f3g==
X-Gm-Message-State: AO0yUKW47d8grvjI6xO21yrEBg4Sd6LhTwkL6El3Af/8q3JYpaqtnlPd
	V2trt/BzQkE3FfLX54TI1cfNdRb37M5Hh5NuIgYGAQ==
X-Google-Smtp-Source: 
 AK7set9aSpT5HOt+UyfSWmCk8m3mqzWjdUlEYTDjTkYTIRgGBXIsSArR4luDLxPrlA6ded4tSm7/vIfxMcJ/u8+bdHI=
X-Received: by 2002:ac2:4eda:0:b0:4db:266c:4338 with SMTP id
 p26-20020ac24eda000000b004db266c4338mr159546lfr.1.1676361978880; Tue, 14 Feb
 2023 00:06:18 -0800 (PST)
MIME-Version: 1.0
References: <20230211191315.24554-1-alex@shruggie.ro>
 <Y+ovU4lfc1SjJJKT@sirena.org.uk>
In-Reply-To: <Y+ovU4lfc1SjJJKT@sirena.org.uk>
From: Alexandru Ardelean <alex@shruggie.ro>
Date: Tue, 14 Feb 2023 10:06:07 +0200
Message-ID: 
 <CAH3L5QqODXhHUxgiWE=Lprob1+a+FMxP1YV=hKyKTMCTkCjQFw@mail.gmail.com>
Subject: Re: [PATCH] sound: soc: codec: tlv320adcx140: fix 'ti,gpio-config' DT
 property init
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: EVYY3GPYKCXTMHOJ6MOCXUN3DCSG2XE4
X-Message-ID-Hash: EVYY3GPYKCXTMHOJ6MOCXUN3DCSG2XE4
X-MailFrom: alex@shruggie.ro
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 steffen.aschbacher@stihl.de, patrick.frick@stihl.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EVYY3GPYKCXTMHOJ6MOCXUN3DCSG2XE4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Feb 13, 2023 at 2:38 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Sat, Feb 11, 2023 at 09:13:15PM +0200, Alexandru Ardelean wrote:
> > From: Steffen Aschbacher <steffen.aschbacher@stihl.de>
> >
> > When the 'ti,gpio-config' property is not defined, the
> > device_property_count_u32() will return an error, rather than zero.
>
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.

Ack.

> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.

Will do.

> There's no need to resubmit to fix this alone.

Thank you :)
