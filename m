Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9FF48F7A3
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jan 2022 16:49:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A38351944;
	Sat, 15 Jan 2022 16:48:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A38351944
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642261746;
	bh=+/Ibk+dZ5x2b/lddqp9ZLg7gJkWp2jTTIKTs9hF2sA4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MMEBOvf+xFQDPYbUVKiC8svR5w9719jJjmyIb6YpVgMqtfauwHDnlOFCb9+VyhYF3
	 0iCwSXVMxahu4xfaypeD50YXJO77UmlwiWER7h0QEmyndDdQJ/2Sk492W852VyZvvW
	 V84xNGBUVJ5RyoNW4eFWVddXXkfXhMam657I3QdM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C6C8F8020C;
	Sat, 15 Jan 2022 16:48:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 648F5F801D8; Sat, 15 Jan 2022 16:47:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C221F800CE
 for <alsa-devel@alsa-project.org>; Sat, 15 Jan 2022 16:47:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C221F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="l5bNrwPv"
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 60A4440045
 for <alsa-devel@alsa-project.org>; Sat, 15 Jan 2022 15:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1642261674;
 bh=SCGx+pe7Mx58OJ6yNkGqzophzPntwDGYMFFr6horyKk=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=l5bNrwPvPHlOVKiyYn1KV5H2/2xRzIZk7j2U8z5qTeRw6PF0k+MnAsDqwGrHiEw6N
 dUFiviCMr1BTX0sD3gznBYktrkiSMR3XKv6jBJRxWm2RPZYhg3sKGhiTEZvW643L96
 +TA/ASGm0Fg77AElXFwRBk0UQJFdKMdTTOfwumPeZNSqNyOcPuWkKGQdndScJacjQ4
 c7UZOZ2ElXLLzq8WU6zbaN60/or1wK9t0oB1EqbwRk9G98W3PaCzaGaZWK53icjvPW
 YQgSVDlJra3RrkQ+0ukEoDwkv3A1JpK+UA3Kg9L1AM+h4t63aIgn6dLXILAD8Css5J
 JvCQYXcznx/Iw==
Received: by mail-ot1-f69.google.com with SMTP id
 v21-20020a05683018d500b00590a3479c4eso2710422ote.11
 for <alsa-devel@alsa-project.org>; Sat, 15 Jan 2022 07:47:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SCGx+pe7Mx58OJ6yNkGqzophzPntwDGYMFFr6horyKk=;
 b=GGkJ1IAMwJAXYP8VgKjpBXiZv6FAdZYS/i4Pb6DoSI5huj9OojRiwd1io0dMccK0fX
 0sCwDLZXqAJhiriXtKyWiNOu0M8m+0HF9z0aIqL//UjrZ4QcIZr5vtJghBFv5r6kuI+d
 2qIQPaqHPWdkmgyZoGjXCKI5IgOawQGAteYF17gxHId5R97nN59sDV6nCBGmQA2gbyIz
 /iHxNe/iIfKdAauDAbf4pu4RTQepHAMGWwAKszEQKZwLHajYB6QLe09Iw7FG4Q4RygFe
 8i4N60xA9uI+B9FdmKQ5iLSiAkwd1DrY5DSbhHb27s9+K+qWVDHZ0GFh58ifLaw5iGXA
 8WJQ==
X-Gm-Message-State: AOAM532HzN7b4Sp3vIySKfVsBGpc2YHm8nsIx9KRv8YX4+fSZ3sd8HjW
 T2o8oPVXg2h/4GOsSbqLvHP6hyty1OJ/uVDPxXKVYbQJwhqI+eZF7CMBy6nnNFY3EfkqpR0REM0
 QTae7xWeiTcm09nSpuE2+eVD+3n+DMSju4goUHUhR0FG95OaApeZ2kqgX
X-Received: by 2002:a05:6808:1985:: with SMTP id
 bj5mr5062771oib.146.1642261673294; 
 Sat, 15 Jan 2022 07:47:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJws0fopQWorqJJDXM0Osf/+zxVftZOwozMAe4VcuVDfbySYsW+5BoINdwNBuJkmk16drIq87EQucC9uX2+1md0=
X-Received: by 2002:a05:6808:1985:: with SMTP id
 bj5mr5062746oib.146.1642261672871; 
 Sat, 15 Jan 2022 07:47:52 -0800 (PST)
MIME-Version: 1.0
References: <20220114164904.lgj7yimbei6fmloe@localhost.localdomain>
 <20220114165050.ouw2nknuspclynro@localhost.localdomain>
In-Reply-To: <20220114165050.ouw2nknuspclynro@localhost.localdomain>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Sat, 15 Jan 2022 23:47:40 +0800
Message-ID: <CAAd53p6KXD2mEHgkU_TpTrsU-vQ9Vxdip+6sPfDaVoSOkmaz-g@mail.gmail.com>
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

On Sat, Jan 15, 2022 at 12:46 AM Alexander Sergeyev
<sergeev917@gmail.com> wrote:
>
> There are several PCI ids associated with HP EliteBook 855 G8 Notebook
> PC. Commit 0e68c4b11f1e6 ("ALSA: hda/realtek: fix mute/micmute LEDs for
> HP 855 G8") covers 0x103c:0x8896, while this commit covers 0x103c:0x8895
> which needs some additional work on top of the quirk from 0e68c4b11f1e6.
>
> Note that the device can boot up with working speakers and micmute LED
> without this patch, but the success rate would be quite low (order of
> 16 working boots across 709 boots) at least for the built-in drivers
> scenario. This also means that there are some timing issues during early
> boot and this patch is a workaround.
>
> With this patch applied speakers and headphones are consistenly working,
> as well as mute/micmute LEDs and the internal microphone.

Does this issue happen to warm boot (reboot) or cold boot?
If the issue only happen to warm boot, please try reverting commit
9d3fcb28f9b9 "Revert "PM: ACPI: reboot: Use S5 for reboot"".
Many HP systems requires it to have a functional reboot.

Kai-Heng

>
> Signed-off-by: Alexander Sergeyev <sergeev917@gmail.com>
> ---
>  sound/pci/hda/patch_realtek.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index eef973661b0a..668274e52674 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -6948,6 +6948,7 @@ enum {
>         ALC285_FIXUP_LEGION_Y9000X_AUTOMUTE,
>         ALC287_FIXUP_LEGION_16ACHG6,
>         ALC287_FIXUP_CS35L41_I2C_2,
> +       ALC285_FIXUP_HP_SPEAKERS_MICMUTE_LED,
>  };
>
>  static const struct hda_fixup alc269_fixups[] = {
> @@ -8698,6 +8699,16 @@ static const struct hda_fixup alc269_fixups[] = {
>                 .type = HDA_FIXUP_FUNC,
>                 .v.func = cs35l41_fixup_i2c_two,
>         },
> +       [ALC285_FIXUP_HP_SPEAKERS_MICMUTE_LED] = {
> +               .type = HDA_FIXUP_VERBS,
> +               .v.verbs = (const struct hda_verb[]) {
> +                        { 0x20, AC_VERB_SET_COEF_INDEX, 0x19 },
> +                        { 0x20, AC_VERB_SET_PROC_COEF, 0x8e11 },
> +                        { }
> +               },
> +               .chained = true,
> +               .chain_id = ALC285_FIXUP_HP_MUTE_LED,
> +       },
>  };
>
>  static const struct snd_pci_quirk alc269_fixup_tbl[] = {
> @@ -8911,6 +8922,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>         SND_PCI_QUIRK(0x103c, 0x8870, "HP ZBook Fury 15.6 Inch G8 Mobile Workstation PC", ALC285_FIXUP_HP_GPIO_AMP_INIT),
>         SND_PCI_QUIRK(0x103c, 0x8873, "HP ZBook Studio 15.6 Inch G8 Mobile Workstation PC", ALC285_FIXUP_HP_GPIO_AMP_INIT),
>         SND_PCI_QUIRK(0x103c, 0x888d, "HP ZBook Power 15.6 inch G8 Mobile Workstation PC", ALC236_FIXUP_HP_GPIO_LED),
> +       SND_PCI_QUIRK(0x103c, 0x8895, "HP EliteBook 855 G8 Notebook PC", ALC285_FIXUP_HP_SPEAKERS_MICMUTE_LED),
>         SND_PCI_QUIRK(0x103c, 0x8896, "HP EliteBook 855 G8 Notebook PC", ALC285_FIXUP_HP_MUTE_LED),
>         SND_PCI_QUIRK(0x103c, 0x8898, "HP EliteBook 845 G8 Notebook PC", ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST),
>         SND_PCI_QUIRK(0x103c, 0x88d0, "HP Pavilion 15-eh1xxx (mainboard 88D0)", ALC287_FIXUP_HP_GPIO_LED),
> --
> 2.34.1
>
