Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3673D48FFB6
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 01:13:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B400C174E;
	Mon, 17 Jan 2022 01:12:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B400C174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642378417;
	bh=rwscmfN2VvXFl57KIDylnXT4uFX0erZr3MxoMOgqhYc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ce8rKVvnQawftoR/SZPyVC4KtmGRfN6thjR96MxWihCyAyZtF/If9y9zfKNywa5Oq
	 7qQEH/BKHo8c1UHXICWlBgdEePUoLDVTdVSzGXhSe8P9GjOhpDZerGJYVuIa7EmbBk
	 YlyclqHFihsFlouD3gJgt9t3+zIR6tqEKYud2K0g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CC65F804F3;
	Mon, 17 Jan 2022 01:12:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEB0BF80117; Mon, 17 Jan 2022 01:12:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CB62F80117
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 01:12:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CB62F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="SJz9Egyc"
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 544EB4000F
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 00:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1642378343;
 bh=rwscmfN2VvXFl57KIDylnXT4uFX0erZr3MxoMOgqhYc=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=SJz9Egycd22hPcDWzZ0UTmn5X3Zsb1AFGwbtEu/lC67VmKAbUuLSeN+ZL4FzAljxt
 mHXXidOmlu/lO+BYHZfgWWACZyz0lfmefcxrQqxXvaGrbTM2okBJyQuguSjdZC11OI
 w9dNPB6xzHAIsD8HcpPrpfugD/aQk46q0SoXSykzgerHNePc8RCu941B50Msid9vgt
 ESY9OKiM52BiLJ8APfrK3KNZxVasmdRFZJuW89yxF+SSkiFV2N7XkRd2zbi1oAAdgh
 g8IJsZZmvdrucX7aag3LOIEzSFi2tpGCH7lekrG+BXOt4rjvo+e5PmWctk4AwHKul5
 HUGiSti8ZlY6A==
Received: by mail-ot1-f69.google.com with SMTP id
 y11-20020a056830070b00b00595da7db813so3317017ots.16
 for <alsa-devel@alsa-project.org>; Sun, 16 Jan 2022 16:12:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rwscmfN2VvXFl57KIDylnXT4uFX0erZr3MxoMOgqhYc=;
 b=HORyNATPGa1CKgTRCTv98f2DWfyH4t9ssBC0jVLkVyT4d1P4UyLQEGFRl8THTUGlCn
 CfM8wJaYq5VTq1PiEVCiryPxiEIqS5300HZTIsJmmKCHvJ0SgG+2SeDKlAwN17BQ4RCP
 jwMYbEnMuLuJCz7tTyXN+j+gmW/N8CRueOY0aaEuSsapXV/p7KVJ2+X7RRfmVTxXHh0M
 5bTSmpITrABgJyRw/cuHTOnin4i0LvKLrHM6iVWMXVPNW+/Bn6aGDxkTWGXJzsuP2LuL
 46iSxXry9kqHeStS1gkDEK2RspFQJQn2TeE52sABDOBOA83NjoIOinlcEdEpD8IFhFuD
 rojw==
X-Gm-Message-State: AOAM531EY3/hTRWCsTXptF5oB65WYINqpBXybHTIyciWqIFef3TTJPGS
 dcUGhulZ31FemoKGOlxS2PRe9/EWmUtDyyfFc2eTf1kedj/I0aQJI1fXewWp05Vep6v2W66WFcc
 XCmBTz7oi/HR8yub3zKUHwquiPhcOw60YPGHayPxu6OK1+EsjCBrmPzlW
X-Received: by 2002:a05:6830:1f3a:: with SMTP id
 e26mr14466586oth.233.1642378340049; 
 Sun, 16 Jan 2022 16:12:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmTa4OSW+e+tPUzL+uPusjNQWVVyJk3wNYGeLJ1mjMfv2VVEg30AAbV0RtwuN/5IKjzG/RX3WJYkoKoLj6hlg=
X-Received: by 2002:a05:6830:1f3a:: with SMTP id
 e26mr14466553oth.233.1642378339620; 
 Sun, 16 Jan 2022 16:12:19 -0800 (PST)
MIME-Version: 1.0
References: <20220114164904.lgj7yimbei6fmloe@localhost.localdomain>
 <20220114165050.ouw2nknuspclynro@localhost.localdomain>
 <CAAd53p6KXD2mEHgkU_TpTrsU-vQ9Vxdip+6sPfDaVoSOkmaz-g@mail.gmail.com>
 <20220115163208.xmvum6ehqcadonj7@localhost.localdomain>
In-Reply-To: <20220115163208.xmvum6ehqcadonj7@localhost.localdomain>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Mon, 17 Jan 2022 08:12:08 +0800
Message-ID: <CAAd53p64w38NCo7c0cnKCyjaswa0_Rns-CjWBwOnph3V5J2taQ@mail.gmail.com>
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

On Sun, Jan 16, 2022 at 12:26 AM Alexander Sergeyev
<sergeev917@gmail.com> wrote:
>
> On Sat, Jan 15, 2022 at 11:47:40PM +0800, Kai-Heng Feng wrote:
> > > Note that the device can boot up with working speakers and micmute LED
> > > without this patch, but the success rate would be quite low (order of
> > > 16 working boots across 709 boots) at least for the built-in drivers
> > > scenario. This also means that there are some timing issues during early
> > > boot and this patch is a workaround.
> >
> > Does this issue happen to warm boot (reboot) or cold boot?
>
> The issue is definitely not limited to warm boots only. I can confirm cold
> boots with no sound and also warm boots with functioning sound. With this in
> mind, the provided numbers (16 good boots across 709 boots) are largely coming
> from reboots since the testing was scripted and driven by SSH.

If this issue also happens to cold boot it seems to be a BIOS issue.

>
> > If the issue only happen to warm boot, please try reverting commit
> > 9d3fcb28f9b9 "Revert "PM: ACPI: reboot: Use S5 for reboot"".
> > Many HP systems requires it to have a functional reboot.
>
> Interesting. I haven't noticed anything breaking with reboots on this
> particular system (at least so far).

If possible, please still give that commit a try.

Kai-Heng
