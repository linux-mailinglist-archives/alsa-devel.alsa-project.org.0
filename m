Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1355017A8A3
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 16:16:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93A561666;
	Thu,  5 Mar 2020 16:15:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93A561666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583421375;
	bh=GzusCbHel0lKZcdDlPZCyXqjF7mJQOP7PCGAgZGNMjI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B4QK3r1FS8ZVaaTEydDOz/JVN0EwjAEXhVLVEVO4A5TC7NR0FtgWWcRTCYI/YkGFm
	 VjPnEBuLxEU1oPZZsQC3QYft73tiPHjRNjByP+KQzY2g2pXYV87Ql4iIR8+vfxLuQh
	 atGQ/ob+nVYTmgigO+ZTwWW/qDlgIaujoL7GJsvM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A76C1F80266;
	Thu,  5 Mar 2020 16:14:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C434F8025F; Thu,  5 Mar 2020 16:14:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56C69F8012D
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 16:14:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56C69F8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ahTbGUlf"
Received: by mail-io1-xd44.google.com with SMTP id m25so6820216ioo.8
 for <alsa-devel@alsa-project.org>; Thu, 05 Mar 2020 07:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=51dZ94o27u62kwc2oYFwvk6ivNJ3I+soou67OZK/PCk=;
 b=ahTbGUlfAJjMDKXZUWgJ7iSWEYRe6gegS5Q6d2I6cBIiBb+NJFusF2sFBK0CRcAI8d
 N93pMUYGkLe1qHSapHXJowPzwhF0/NGaP5SAo7LU1FiX0X6DZmzxmYb7eNcAteV4ou1H
 gb5klUIqhY+rdvw0esP1EOdTa1omjvPdEP9kL6vlhfZRwnt0PNS4bRny6le8M8pZBJcR
 +PGKdw1ukEW5Fz41wNuCtxui+f6XnhmC9mztZpiikA4VS3pzA/FwprvCLzUXFAM3yBSs
 VLKfMfrAXzFTznBmJGqBDsU5JIPH8e7L3QGpbNGb/hAf2LUet9xw0hhA0PnfkC0TxOX7
 ceow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=51dZ94o27u62kwc2oYFwvk6ivNJ3I+soou67OZK/PCk=;
 b=ojwg3/JwaQG8+RVCZ85vIniz3YaPNPt0OfWyh5A70zOSnusyWVLGfR2vE8ANJZrCzL
 Ez7gTYIfWNbbjhG4pa/2nxMSy9//r1noZLs2ZRmTM6h0cuIZumhk7zTg6XoQzySQ+Msf
 UoHewXBWGyhSKk0npPPJtDiqaheRU1jCWNjxRRL9pkvJOPQrGUhGSrVRPo3kmlIaLdRB
 Ck/BS2IXQaUel8CznA7L5VvC9XS1vykhkb/gRqADEo8MDcbSu9lRZSlefaF5xfvQiwcl
 +9bJhfMn/ow80HyOiGi2uortv3pMApeQBQ0tYSthzuV0kMtxie0YCAmVie9zoNzfMwQq
 QuPQ==
X-Gm-Message-State: ANhLgQ2vvWbpH33pm3Lu9RXFHScUqiterQyv1SJRiYMKUKmkyosrzX/c
 YXyWww3LlwhlL03NmFsxl9VmHCplmCrSZm30DtM=
X-Google-Smtp-Source: ADFU+vvj1rKFxBpfUnOfJHo94Aj9YFxwCX2grOAMmLGb1AwSbWaMmByVsZgMlWATypZOqP4iyNmhWLU6+BbtaSQ6QT4=
X-Received: by 2002:a6b:6e02:: with SMTP id d2mr6387452ioh.150.1583421260826; 
 Thu, 05 Mar 2020 07:14:20 -0800 (PST)
MIME-Version: 1.0
References: <20200303153619.24720-1-gladiac@gmail.com>
 <20200303153619.24720-2-gladiac@gmail.com>
 <s5h7dzyg8gq.wl-tiwai@suse.de>
In-Reply-To: <s5h7dzyg8gq.wl-tiwai@suse.de>
From: Chris <gladiac@gmail.com>
Date: Thu, 5 Mar 2020 16:14:10 +0100
Message-ID: <CAE3uWP3Shf+vEwV-wUDUmzizSOCS5cSvND+-=rZijefgkmp2tQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] ALSA: hda/realtek - Fix silent output on Gigabyte
 X570 Aorus Master
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 kailang@realtek.com, tiwai@suse.com
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

Hello, I am really sorry for the mess-up. It is the exact same patch. I
just re-sent it because v1 did not show up in the alsa-devel mailinglist
because i did not do the registration beforehand. Please ignore v2.
Thanks a lot, Chris

Takashi Iwai <tiwai@suse.de> schrieb am Do., 5. M=C3=A4rz 2020, 15:52:

> On Tue, 03 Mar 2020 16:36:19 +0100,
> Christian Lachner wrote:
> >
> > The Gigabyte X570 Aorus Master motherboard with ALC1220 codec
> > requires a similar workaround for Clevo laptops to enforce the
> > DAC/mixer connection path. Set up a quirk entry for that.
> >
> > BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=3D205275
> > Signed-off-by: Christian Lachner <gladiac@gmail.com>
>
> What's the difference from v1?  I already applied v1.
>
>
> thanks,
>
> Takashi
>
>
> > ---
> >  sound/pci/hda/patch_realtek.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/sound/pci/hda/patch_realtek.c
> b/sound/pci/hda/patch_realtek.c
> > index 477589e7ec1d..8722616c6cc6 100644
> > --- a/sound/pci/hda/patch_realtek.c
> > +++ b/sound/pci/hda/patch_realtek.c
> > @@ -2447,6 +2447,7 @@ static const struct snd_pci_quirk
> alc882_fixup_tbl[] =3D {
> >       SND_PCI_QUIRK(0x1071, 0x8258, "Evesham Voyaeger",
> ALC882_FIXUP_EAPD),
> >       SND_PCI_QUIRK(0x1458, 0xa002, "Gigabyte EP45-DS3/Z87X-UD3H",
> ALC889_FIXUP_FRONT_HP_NO_PRESENCE),
> >       SND_PCI_QUIRK(0x1458, 0xa0b8, "Gigabyte AZ370-Gaming",
> ALC1220_FIXUP_GB_DUAL_CODECS),
> > +     SND_PCI_QUIRK(0x1458, 0xa0cd, "Gigabyte X570 Aorus Master",
> ALC1220_FIXUP_CLEVO_P950),
> >       SND_PCI_QUIRK(0x1462, 0x1228, "MSI-GP63",
> ALC1220_FIXUP_CLEVO_P950),
> >       SND_PCI_QUIRK(0x1462, 0x1276, "MSI-GL73",
> ALC1220_FIXUP_CLEVO_P950),
> >       SND_PCI_QUIRK(0x1462, 0x1293, "MSI-GP65",
> ALC1220_FIXUP_CLEVO_P950),
> > --
> > 2.25.1
> >
>
