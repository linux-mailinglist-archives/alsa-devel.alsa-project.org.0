Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DACD065C78B
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 20:31:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EDED6417;
	Tue,  3 Jan 2023 20:30:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EDED6417
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672774296;
	bh=m7ZwI/3d5ZRCf0yxI1ai0kL0fT5rS0WsrJU7lWNFk4M=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VSDc/qcMCADNj7sftveObrMDBA+cKPVm+QXYBAtVozMi5hHICSLcmh+CyuuTbhZ8R
	 rHUqrywygZGXzsEvRhbhmy7zCjcaXD6RXqXtJuR+Uw8AFnP+4hIUeUWOUQWi9wXgqY
	 uqNwmbvJHHGWhVfejD8NX09Akk1w6itDzEpkIPQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8BCCF800F8;
	Tue,  3 Jan 2023 20:30:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA5E2F804AA; Tue,  3 Jan 2023 20:30:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3987EF800F8
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 20:30:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3987EF800F8
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=ralston.id.au header.i=@ralston.id.au
 header.a=rsa-sha256 header.s=google header.b=N9bLaVOs
Received: by mail-oi1-x231.google.com with SMTP id r130so27934186oih.2
 for <alsa-devel@alsa-project.org>; Tue, 03 Jan 2023 11:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ralston.id.au; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=m7ZwI/3d5ZRCf0yxI1ai0kL0fT5rS0WsrJU7lWNFk4M=;
 b=N9bLaVOsVdePDS7BXQFXBFCPkjSWH/GqIpDqdL/WcEBvUZ94/z8+RJlmT94rsjkZNz
 uOa9iK4BgofdUwymsP32NTb51Eihk7OTko2NfRUjplTmIWGAgLXngyFnsXLhfxbVRo26
 G+rB8Os7QNOX6N3JB7a5sJGzwVtUjPo1QWBMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m7ZwI/3d5ZRCf0yxI1ai0kL0fT5rS0WsrJU7lWNFk4M=;
 b=4pMa81vqRbQR7MV/gRK4plQEaV6n4dMxOvDvvVaAZSHEmb2+n+TE8YFtPRvxQcV0Qq
 DCk0fNp4Kr61UgTuuFYguXRj4qG1b/T9EBjtuM34Cf4OMtmhTjVrWY5rUGxvfZyO3P3x
 YSJwUre1LMfFgbSgsDe2sJXkbxKfSBlfXXgR6Zg5Vfpnm9o5/XJ/32koIVc1v2gXS3lD
 wWO9ZmbiJRa+I+J18OCTRpCN1AeWUp6yYfybAtJyDSxAVwuJEDt3eYNYAQVKKRYuDZli
 OQGQIiOlMxPflUvlaUnqTewlMYgKZVi8nLxEX/FQASmTK46ECwzv1L2nUu/MjL0w5vm6
 4dow==
X-Gm-Message-State: AFqh2kqlQBCIa2IrBxUagQtEPhkWCrS4Es+kob1aNSo77ev4nrsyWrlY
 HWTjJ2v0Aa8TXeli5aV+B5x0bCeZJdsnua8HcmdMPw==
X-Google-Smtp-Source: AMrXdXu1u697rSaneDA2cqYDMAV81q1Y4RbB367bFHud5eZ6ZBV0aEUZioE62U9BiZvd0os6H9zrblsBcS2/esbvlHQ=
X-Received: by 2002:a05:6808:609:b0:35c:dee:db96 with SMTP id
 y9-20020a056808060900b0035c0deedb96mr3176138oih.235.1672774230210; Tue, 03
 Jan 2023 11:30:30 -0800 (PST)
MIME-Version: 1.0
References: <CAC2975JXkS1A5Tj9b02G_sy25ZWN-ys+tc9wmkoS=qPgKCogSg@mail.gmail.com>
 <bf646395-1231-92f6-7c5a-5b7765596358@leemhuis.info>
 <87zgb0q7x4.wl-tiwai@suse.de>
 <CAC2975K24Gt3rGieAToHjb7FEHv84aqiRSQx7EOuR2Q7KByUXw@mail.gmail.com>
 <87sfgrrb5f.wl-tiwai@suse.de>
 <CAC2975+cUqiFC0LO-D-fi0swH+x=_FMuG+==mhg6HH4pc_YDRA@mail.gmail.com>
 <87bknfr6rd.wl-tiwai@suse.de>
 <CAC2975+CP0WKmXouX_8TffT1+VpU3EuOzyGHMv+VsAOBjCyhnA@mail.gmail.com>
 <878rijr6dz.wl-tiwai@suse.de>
 <CAC2975+Ybz2-jyJAwAUEu5S1XKfp0B-p4s-gAsMPfZdD61uNfQ@mail.gmail.com>
 <87zgazppuc.wl-tiwai@suse.de>
 <CAC2975+476CHDL3YM=uExHu96UB2rodAng9PVYHX+vGnSCppGA@mail.gmail.com>
 <CAC2975Ja-o6-qCWv2bUkt3ps7BcKvb96rao_De4SGVW1v8uE=A@mail.gmail.com>
 <CAC2975KFqvTitbJHJZ6a4Tuxsq=nPGvW3vjAAtkQxw=sBgeDqw@mail.gmail.com>
In-Reply-To: <CAC2975KFqvTitbJHJZ6a4Tuxsq=nPGvW3vjAAtkQxw=sBgeDqw@mail.gmail.com>
From: Michael Ralston <michael@ralston.id.au>
Date: Wed, 4 Jan 2023 06:29:54 +1100
Message-ID: <CAC2975Jw63j26DhvDjiLc7dXwaRz=eK0aWNuErQ8dkEn_Gemjg@mail.gmail.com>
Subject: Re: USB-Audio regression on behringer UMC404HD
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, regressions@lists.linux.dev,
 Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
 Thorsten Leemhuis <regressions@leemhuis.info>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 4 Jan 2023 at 06:27, Michael Ralston <michael@ralston.id.au> wrote:
>
> On Wed, 4 Jan 2023 at 06:24, Michael Ralston <michael@ralston.id.au> wrote:
> >
> > I did a diff between the sound/usb directory for 6.0.16 and 6.1.2 and
> > reverted that entire directory.
> >
> > It is working with that change, so there must be something else.
> >
>
> Logs below...
>

This line from the logs stands out to me as different. Could this mean anything?

> Jan 04 06:20:27 leatherback kernel: usb 1-4: clock source 41 is not
> valid, cannot use

--
Michael
