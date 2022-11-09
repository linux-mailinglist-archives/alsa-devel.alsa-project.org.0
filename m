Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C93106234B6
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 21:39:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5672B1637;
	Wed,  9 Nov 2022 21:38:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5672B1637
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668026351;
	bh=6iOgHpEFZn5WEgVBi3tsnArI6YiumK9ShemfJ2sAsUQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WYBo1+4/C9xuEwKXjGJarKD6q72zNEXU5gLZVWbDUMwPBSgIFSF/egu/KpGdVESIW
	 SEd2HKaMVZwcg0LkMsNF9Q7DUTIbUsYDmyVhuSshz9xeukCpyw5cUvOyt7ihH9r4WZ
	 NJrfN6Q8OFanZ42sFGLXjbjGTsdBF9CD9MBZRn7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF555F800EC;
	Wed,  9 Nov 2022 21:38:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB70DF80217; Wed,  9 Nov 2022 21:38:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A1B0F80114
 for <alsa-devel@alsa-project.org>; Wed,  9 Nov 2022 21:38:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A1B0F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ohufbu7O"
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-36cbcda2157so173086747b3.11
 for <alsa-devel@alsa-project.org>; Wed, 09 Nov 2022 12:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vJZNuhocEbCBWZdP9rPe7tMs7CPsIHiP8ayiKe8jV40=;
 b=ohufbu7ON1cnzEiDyPxM4Jp8XEffJ3TYX3z8T6zkk4rHHMGkQiHsSuY3nOlqkHbCtH
 e5xWKsv2hEsgsnNjYR0D9QoVwBLK7cd2n90O7GxS8vdEr5V05r6zoLpJnbqB1KbFbtKM
 Cnp/U5HL5RZhcepFfFIxQ9P52gL0mMeVnuElCADp8vO/mozRhoe9VFfya/wkLsloOs30
 asye6QMcIxmFfythwm1vjr+xl+AZfjL3UD4P3bQ8goIN9eGManjFNJ8G873+JXAoP9P6
 k2r1GNOM64+O+AdFJwa3WOuzUjlklC70jOiONm3BU22Lx/1XYMwjYjQgR5hb6yXxUkYJ
 mP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vJZNuhocEbCBWZdP9rPe7tMs7CPsIHiP8ayiKe8jV40=;
 b=GTKy47DWjLpr4xFLMtRNShxdD6B+Nu0ghEzFpPApoP8yeD5XtecBvRFNYGmZb3CaIs
 Z1Pwgy96bsgJzEVnqPKOEqMxxi/FfiWJzmzJ4KI+RDcDDfDNq9ZaTvVu5oB5PyGI0rE3
 WEqHKqgOTJjd1u1vJCfxVtLMvVL0ITmiY+ahdlIfBQZKVGcpKQ5DQgeP+0jajg5q0Rwz
 yB8D94Mp0P7oRXfIhjk7P7hY/rqccdAmcZu2umOggf4xGfdn/Zd7gmWGGUOaM9+EDZvV
 MB55al6zKAuDTPOmQ0mEBeBTpurL1b2zmMImXQIqOUeduQIwQ0aOghUPyMpj1XccvNbO
 a5yA==
X-Gm-Message-State: ACrzQf1YgiRAeOORdKOnHWlyzAATmpcsAiwrpgppo+FFLlWS/tJrvO/K
 1BnoMh5Rw2FxcOrONiCG5C9J2a6CmiyZLVnhG4c=
X-Google-Smtp-Source: AMsMyM4ymp1hd2NsBtEem9OZ9RfdVTVdaY/1YGgYjKxF0liSHALhMPOoown8oFB9ehUXHmU8hjEY7boRnfCg+iXIgak=
X-Received: by 2002:a81:9347:0:b0:370:7d99:ccfd with SMTP id
 k68-20020a819347000000b003707d99ccfdmr48660247ywg.98.1668026288615; Wed, 09
 Nov 2022 12:38:08 -0800 (PST)
MIME-Version: 1.0
References: <20221109171732.5417-1-edson.drosdeck@gmail.com>
In-Reply-To: <20221109171732.5417-1-edson.drosdeck@gmail.com>
From: edson drosdeck <edson.drosdeck@gmail.com>
Date: Wed, 9 Nov 2022 16:32:59 -0400
Message-ID: <CAMSsBRwKX8swbHGxtJQ6bqKO+zvUVJHjnvBSHwBtjoYY5Z-w2A@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add Positivo C6300 model quirk
To: perex@perex.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: sbinding@opensource.cirrus.com, tanureal@opensource.cirrus.com,
 tangmeng@uniontech.com, p.jungkamp@gmx.net, tcrawford@system76.com,
 tiwai@suse.com, wse@tuxedocomputers.com, linux-kernel@vger.kernel.org,
 kai.heng.feng@canonical.com, alsa-devel@alsa-project.org
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

This patch is working

Em qua., 9 de nov. de 2022 =C3=A0s 13:18, Edson Juliano Drosdeck <
edson.drosdeck@gmail.com> escreveu:

> Positivo Master C6300 (1849:a233) require quirk for anabling headset-mic
>
> Signed-off-by: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
> ---
>  sound/pci/hda/patch_realtek.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.=
c
> index 701a72ec5629..7875566d6183 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -9608,6 +9608,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[=
]
> =3D {
>         SND_PCI_QUIRK(0x17aa, 0x511f, "Thinkpad",
> ALC298_FIXUP_TPT470_DOCK),
>         SND_PCI_QUIRK(0x17aa, 0x9e54, "LENOVO NB",
> ALC269_FIXUP_LENOVO_EAPD),
>         SND_PCI_QUIRK(0x1849, 0x1233, "ASRock NUC Box 1100",
> ALC233_FIXUP_NO_AUDIO_JACK),
> +       SND_PCI_QUIRK(0x1849, 0xa233, "Positivo Master C6300",
> ALC269_FIXUP_HEADSET_MIC),
>         SND_PCI_QUIRK(0x19e5, 0x3204, "Huawei MACH-WX9",
> ALC256_FIXUP_HUAWEI_MACH_WX9_PINS),
>         SND_PCI_QUIRK(0x19e5, 0x320f, "Huawei WRT-WX9 ",
> ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
>         SND_PCI_QUIRK(0x1b35, 0x1235, "CZC B20", ALC269_FIXUP_CZC_B20),
> --
> 2.37.2
>
>
