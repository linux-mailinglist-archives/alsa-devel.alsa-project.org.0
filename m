Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 610206F506F
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 08:54:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70C5413B6;
	Wed,  3 May 2023 08:53:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70C5413B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683096882;
	bh=Ubuuf8ELpKldZXDSr7xGTRjyea3Jx6rPnRyRHy5aotA=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t4AJwyfPt2TUIWxvfUS3ADAFFqE6hWuQIPSij2T037eQuX/pO+QtR2TOvM6Zdk8od
	 NY845P6KOu28A+F5uHHe78WXokM5i0TPWhgA6RLQzD+Llz46zilxm293toCMMrSCK3
	 jCyodlF1Vb+JHQhm53AbphHdZueLvOkMFI2K9oJs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AA3BF805A8;
	Wed,  3 May 2023 08:52:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE133F8049E; Wed,  3 May 2023 07:43:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 27F1FF80087
	for <alsa-devel@alsa-project.org>; Wed,  3 May 2023 07:43:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27F1FF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=ERzOwCN8
Received: by mail-vs1-xe31.google.com with SMTP id
 ada2fe7eead31-430192c84a1so1766611137.1
        for <alsa-devel@alsa-project.org>;
 Tue, 02 May 2023 22:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683092586; x=1685684586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rsAmWnHYdqf8PxIDTx7JVpNph88uEqYsba4Oi5M9pys=;
        b=ERzOwCN8Snpnb6R6BMPDcCWmrygLOdCFBKCPjPfmNrRa9r/Bde491tD+EBUO98Pr0p
         PcYay5OeQR1WNpFBwkdiaJIM3+7iqCOlKWMHHMJye7Atdu9Zb1AXDB2Npq44wRmcUwya
         fT9UCI9jNpd5nzKnTAiA4RiZ5eQKjVAkYXREU/mWQP0b6z00COHDWedWjnAIFXF1mG2g
         jVQTFpY3OSTck2RfgXgOJYWJFuIRizX2uecYY6kr6Rg/WxtYCl4mc669GUNBZa33AZM1
         BV8zqOBEt5IvAUNRKH1DuV38cIW5jEK3tCOuqPoQYxu82LJovSQ7MCSld2eA2GwZEAMP
         P8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683092586; x=1685684586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rsAmWnHYdqf8PxIDTx7JVpNph88uEqYsba4Oi5M9pys=;
        b=lGBFm705Xdd25tzrU1ksYBORekPhSAYlV1kQqCEdSv1R6chhnbqfzp86Wqqvieder0
         dXkLyt5G4orKiaPOtiOXufcr2XbGn5QZb/7D2ATDf/SyAlvMmgSRR3oUyYMULDYsZh5d
         fvb1yhk35SDm1WrsLgk5u7IML/uHMEMVLsNX6m9o976ewrEMs+FcX1GnJcOUyW/xdrvg
         S6TtZsVdN372f4byLPMcR3Emc+u0C7AR83LwOnmiTkeWz+Y2EEV8bS4uJ9Z4CFkGRjFb
         oPyz0MFIyXttE/8y+LA8R/0ULIAL/XT7draMOMdeuv+/baSxEEJuwjX7qLuZX+w/n8Yi
         fBug==
X-Gm-Message-State: AC+VfDwsC7jHgoNduMMKfjv1ZdF+5g4p0CnCgsSLUZ/+ot3sADW4UWIq
	vp6pBPdvX9DgZnrvVDoxCGARHUlMXb77h8myk1g=
X-Google-Smtp-Source: 
 ACHHUZ7ykK9Pomy4WV89OB6bwk9/UoxMqZtNJrFwUkc6HainGydy65lfIkZPMMydRIzSTL7GURxd1oHI9zPRV9FHxyI=
X-Received: by 2002:a67:fb11:0:b0:42e:38c1:8a54 with SMTP id
 d17-20020a67fb11000000b0042e38c18a54mr942121vsr.0.1683092585868; Tue, 02 May
 2023 22:43:05 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAAJw_ZsbTVd3Es373x_wTNDF7RknGhCD0r+NKUSwAO7HpLAkYA@mail.gmail.com>
 <ZE9B4avbDtIXOu4O@debian.me> <87r0s0pnim.wl-tiwai@suse.de>
 <CAAJw_ZsDdiB=b2PZydQWF2fjSULit3NWE-Bf1icBEryN-GuqUw@mail.gmail.com>
 <87fs8gp0i7.wl-tiwai@suse.de>
 <CAAJw_ZveoPfnBsSkHZqmLiVWATcOosR--6Ds4cdekdi=t1yV7A@mail.gmail.com>
 <b449cbf6-8286-e22d-ca87-b1bc3dce29d7@gmail.com>
In-Reply-To: <b449cbf6-8286-e22d-ca87-b1bc3dce29d7@gmail.com>
From: Jeff Chua <jeff.chua.linux@gmail.com>
Date: Wed, 3 May 2023 13:42:55 +0800
Message-ID: 
 <CAAJw_Zur2fz7FnO-qyzd_mSoCcroCREcvHKo8sOMrrMDGxXv2g@mail.gmail.com>
Subject: Re: linux-6.4 alsa sound broken
To: Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: jeff.chua.linux@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MJ7ZF2YY7VKGKVBI27HPCSQJAMRKLCQM
X-Message-ID-Hash: MJ7ZF2YY7VKGKVBI27HPCSQJAMRKLCQM
X-Mailman-Approved-At: Wed, 03 May 2023 06:51:59 +0000
CC: Takashi Iwai <tiwai@suse.de>, lkml <linux-kernel@vger.kernel.org>,
 Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
 Linux ALSA Subsystem Development <alsa-devel@alsa-project.org>,
 Linux Regressions <regressions@lists.linux.dev>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MJ7ZF2YY7VKGKVBI27HPCSQJAMRKLCQM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, May 3, 2023 at 12:40=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> On 5/1/23 22:03, Jeff Chua wrote:
> >> There was no description about which sound backend is used.  Is it
> >> PulseAudio, pipewire or dmix/dsnoop?
> >
> > Just pure alsautils.
> >
> > arecord -D hw:1,0,0 -f S16_LE -r 48000 recorded.wav
> > aplay -D hw:1,1,0 /local/share/sounds/alsa/Side_Right.wav
> >
> > [recorded.wav] attached.
> > [Side_Right.wav] attached.
> > aplay: version 1.2.8 by Jaroslav Kysela <perex@perex.cz>
> > arecord: version 1.2.8 by Jaroslav Kysela <perex@perex.cz>
> >
> > alsautils, alsaplugins alsalibs all using latest git pull.
>
> Are you sure you build alsa tools straight from the git repo?
> Can you also reproduce with latest stable version of these?
> Otherwise it's anyone's guess due to moving parts...


All cloned from ...
https://github.com/alsa-project/alsa-lib.git
https://github.com/alsa-project/alsa-utils.git
https://github.com/alsa-project/alsa-plugins.git

arecord is symbolic link to aplay.

I just recompiled all the alsa-lib, utils and plugins, and retest and
it's the same issue.

GNU C Library (GNU libc) development release version 2.37.9000.
gcc version 11.3.1 20230315 (GCC)
binutils-2.40

Linux kernel is ...
commit 348551ddaf311c76b01cdcbaf61b6fef06a49144 (HEAD -> master,
origin/master, origin/HEAD)
Merge: 7df047b3f0aa b7badd752de0
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue May 2 15:40:41 2023 -0700


Thanks,
Jeff
