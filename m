Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AD04931BF
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jan 2022 01:20:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8E002E8B;
	Wed, 19 Jan 2022 01:19:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8E002E8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642551622;
	bh=QSCplCLjAh3bK8fuBrxiKgKrA0P0KcoqVOgcqtRLwHE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wh66xD8JZCHXTFlbL14Tvo2pj4RmLvMoe+CmuxtfT8AXNaDgJYVzGbaVwa3K3/Wix
	 K4myKophz64P2KBz8cOkmzhDfZ/O48DTjumn0hdwzzx6m1onHjO01MXdsd1ydq+EqJ
	 T239zHSdXjUyASC7D5cFSYmLrekeK8cf8jxWRTk8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 426DEF800CE;
	Wed, 19 Jan 2022 01:19:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B21EF8023B; Wed, 19 Jan 2022 01:19:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03869F800D8
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 01:19:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03869F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="lm8aivL+"
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C50DE3F31F
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 00:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1642551546;
 bh=QSCplCLjAh3bK8fuBrxiKgKrA0P0KcoqVOgcqtRLwHE=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=lm8aivL+ZWTNUCy3r679jTrF/cnURbyqQnBvwUOpMUIYnAS1WIJYRysauKCcJC3j2
 j5XtFRe99lW6XGE4Fx21/me/LvdULnaYQLksnGRuTgJLV14sFClb5sD+PAVAFQqPCt
 b3M5TYvtt7gqoJNWdYxR6dIxQBOxQyCGe0Rt3GlScuPbnppFV61Jgr1jUPbZ4g8rOP
 O8qOrtknMxVVhVLY2ufd2GaQMqvq2+qrBlp0P7j9hjubA4hoH5+0aQpSQMb/AJz3vm
 w2PnAvTLSUblvQkV4m/5nks/zmRrSyReZomiAy/R6l2V4bKYxDOg9zgYG0mWz3TZEt
 atUgS5kQkYemw==
Received: by mail-ot1-f72.google.com with SMTP id
 39-20020a9d0eaa000000b0058f56d89582so353596otj.0
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 16:19:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QSCplCLjAh3bK8fuBrxiKgKrA0P0KcoqVOgcqtRLwHE=;
 b=Oia0bVFnUp4oJegTV0T9R189V1xP1E4EGUJpmBrSEFZmD74jVMT0CO3tsxfBpLoH8S
 Dy75icy+0yr/YN6rBM4+w7Z05F1rJYcEh5rpQrvwg8WQSW58QlhPY/36qZItxhI04TYH
 f+0CNbccOnOVVGZ4uSPn9P7V8aSZbEB9Y6LRSxlrUvF3os2RLTx0stTrjC9SnsIhbx3h
 2SMDRfG1Orqy3d9Z0mAVU3f5x/fPMQXN82X4zQ46iLo2BpmIWuGsYaw1gyMW2wTMvYYr
 PKh62flCnuiba5MvlO7w6adClpwWKgX228W+csGFU4rjx9abZa9SUXomTYTUvaOr4L7C
 oeGw==
X-Gm-Message-State: AOAM531DYCJY1oetwYzjqv471rROstsnoTr6f5UF6ashttdJBlPAr798
 UumdH6KyfmUZQLOd77DafB0mpzZam8YWxjX4JPLqPbEMNzZHr63ADbSaH77ToaY7xIgxlh733X+
 zL7ZFJXLX7Q5LwxuCD0ikPGsoXfQ0QiRgH6ujviM2qLLQ/C8u+Xkvbb1O
X-Received: by 2002:a4a:4994:: with SMTP id z142mr20364644ooa.78.1642551545488; 
 Tue, 18 Jan 2022 16:19:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwK/qk0KbWw4aZe2tSGjXq4jI8Rl1MTLRatX+XFGTTKTsxvw3z9+j+R4HQU6W1TjVQYUbkgr5oXAPwXmzqbR7s=
X-Received: by 2002:a4a:4994:: with SMTP id z142mr20364618ooa.78.1642551545067; 
 Tue, 18 Jan 2022 16:19:05 -0800 (PST)
MIME-Version: 1.0
References: <20220114164904.lgj7yimbei6fmloe@localhost.localdomain>
 <20220114165050.ouw2nknuspclynro@localhost.localdomain>
 <CAAd53p6KXD2mEHgkU_TpTrsU-vQ9Vxdip+6sPfDaVoSOkmaz-g@mail.gmail.com>
 <20220115163208.xmvum6ehqcadonj7@localhost.localdomain>
 <CAAd53p64w38NCo7c0cnKCyjaswa0_Rns-CjWBwOnph3V5J2taQ@mail.gmail.com>
 <20220117181112.bmbjcofdjjpsfgzo@localhost.localdomain>
In-Reply-To: <20220117181112.bmbjcofdjjpsfgzo@localhost.localdomain>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Wed, 19 Jan 2022 08:18:52 +0800
Message-ID: <CAAd53p7OWs2ULT10hwC=E7t+KHEidUFMiRmDHGwEM_8+Bib8fA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] ALSA: hda/realtek: fix speakers and micmute on HP
 855 G8
To: Alexander Sergeyev <sergeev917@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Kailang Yang <kailang@realtek.com>,
 Jeremy Szu <jeremy.szu@canonical.com>, linux-kernel@vger.kernel.org,
 Elia Devito <eliadevito@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Werner Sembach <wse@tuxedocomputers.com>, Hui Wang <hui.wang@canonical.com>,
 Sami Loone <sami@loone.fi>, Cameron Berkenpas <cam@neo-zeon.de>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Jan 18, 2022 at 2:05 AM Alexander Sergeyev <sergeev917@gmail.com> wrote:
>
> On Mon, Jan 17, 2022 at 08:12:08AM +0800, Kai-Heng Feng wrote:
> > If this issue also happens to cold boot it seems to be a BIOS issue.
>
> I've discussed the problem in more detail [1] before sending the patch.
> In short, speakers seems to reliably work in live Ubuntu which differs in
> using initrd with modules vs UEFI stub with built-in drivers in my case
> (I've tried Ubuntu kernel sources). I've tried using modules as well
> (modprobe'ing the list of modules which are load by Ubuntu) with no
> success.
>
> It was suggested that there is a timing issue somewhere. I'm opened for
> ideas to try to debug the problem origins further (to avoid the need in
> the fixup).

Yes it does sound like a timing issue.
Most system firmwares are only test against Windows.

HP has started to enable Ubuntu on some of their systems, but your
case (EFI stub) is uncovered.

>
> > > > If the issue only happen to warm boot, please try reverting commit
> > > > 9d3fcb28f9b9 "Revert "PM: ACPI: reboot: Use S5 for reboot"".
> > > > Many HP systems requires it to have a functional reboot.
> >
> > If possible, please still give that commit a try.
>
> Well, the first cold boot (with this commit reverted) didn't have any
> sound, the same goes for the subsequent reboot.

Thanks for the testing.

Kai-Heng

>
> [1] https://lkml.org/lkml/2022/1/12/221
