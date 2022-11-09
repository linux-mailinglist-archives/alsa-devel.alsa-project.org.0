Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BD8623179
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 18:27:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 845FC16D6;
	Wed,  9 Nov 2022 18:27:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 845FC16D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668014874;
	bh=YqzrCo0vD+cKPCALDtg/Eex7vFEG66gDyC3IAFRcwJM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dXCeJvtqMNRPLcFkRn2oK9QzT1xHOT+0bfDHi3EgFEzS2SdwEvG/5eBoyuFSECPDe
	 YwERgbG0/hVXN8DovWnOYVpuk+fzEgk9fri6w1vfiTwRr89ucp+k0TdUg6YhFspBeL
	 Gfmec3Vn9dzm/tAM6AroL1SGiFSYsNrACKdv1+48=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5BF0F8065A;
	Wed,  9 Nov 2022 18:16:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC581F80121; Wed,  9 Nov 2022 17:48:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47016F80121
 for <alsa-devel@alsa-project.org>; Wed,  9 Nov 2022 17:48:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47016F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DjNv55Za"
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-367b8adf788so167550037b3.2
 for <alsa-devel@alsa-project.org>; Wed, 09 Nov 2022 08:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/0ABxx3z0NDO6/jiin9HGwEc2STuR8GepHH++2qFpUA=;
 b=DjNv55ZaqsDTtcolwF77eHxDm3XUu2zURo7/iLXYqMin/+LZdHQPRxXHmbwIjFgZbX
 Zw7HxMZ+Qvtv5Rdt/TlZQe63vJriwqfQCO8CdxCoK/Ftkw67qJBv7RIGOUIgZmcUah2x
 EXWxsj/ETCH/13W/4qLgUUgUQGUjTrJbrtpaHjVpT1U+ibXSRrX9BDD2uUpb/P/TEi+K
 suGp8UY4qxPFdubL8sRO17OT26H27qadJEqmxHd/FCJ/J8RQ0pVPMZnIKXx+ff0tk0bJ
 wVlTJuW3+ugy+pH8DzeK3lfyJeKoUITmVeYR5xmE72LzFl3xRIJqG2LIszkP3dl/Ye8c
 9XJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/0ABxx3z0NDO6/jiin9HGwEc2STuR8GepHH++2qFpUA=;
 b=VXbA03Hv33pYO2URrljDG9JrcCPM0bV/nyT+yZawQVnJxi4wHdKiFpTaOGTy3JF3gc
 1vLnx17VsG61g64IrYK8nTVpGm7WIEMdb2NvCt6D/3e/yTRKTvFiQ8r1ZsApRZGSxrhY
 Fntosc2gbjEV+VcEHymD/lTLfia1bs3EWS2LMHs7fwyZmK/DqVhlfGk+XB1pFzZQkX4o
 z8xnBzPy766U1+3GXyqLKsTl2OsMxfPDzkk7CcBJsVk4m+ILVLabZrb9WGOKdJ8T9+AM
 onO4UnZA2hE9Rb9L3vWFwkIa/QXlzCDx3CG0FHGw2VTuUpov/dMRhd4rN9ErZnITg+/4
 6J4g==
X-Gm-Message-State: ACrzQf2uOU3tV54av0lM7rwh1nDI+sFTQpM4FlytFVakKtfFYwZaS9/M
 PFyFDDHCgKJLO1AMophpYSb+2QfET1leJkSA9MM=
X-Google-Smtp-Source: AMsMyM5CUqpNmwPF3HNXOlsenuZb4NNph5RVVi6vPYQfFpv3Gf0gfPYnBlCzKT7U2AUTFVFcXolLCkqVce+qdHi8nN8=
X-Received: by 2002:a81:6e05:0:b0:370:18ac:adf1 with SMTP id
 j5-20020a816e05000000b0037018acadf1mr59334212ywc.414.1668012523447; Wed, 09
 Nov 2022 08:48:43 -0800 (PST)
MIME-Version: 1.0
References: <20221109160909.4578-1-edson.drosdeck@gmail.com>
In-Reply-To: <20221109160909.4578-1-edson.drosdeck@gmail.com>
From: edson drosdeck <edson.drosdeck@gmail.com>
Date: Wed, 9 Nov 2022 12:43:34 -0400
Message-ID: <CAMSsBRy030guK0wmEExui1FUrhza1coLKR=aDE6Us3GqAMYe8Q@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add Positivo C6300 model quirk
To: perex@perex.cz
X-Mailman-Approved-At: Wed, 09 Nov 2022 18:15:50 +0100
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

Disregard my previous email, the patch included with this email is
inaccurate and incorrect. A better and correct patch is going to be send
after this email.

Em qua., 9 de nov. de 2022 =C3=A0s 12:09, Edson Juliano Drosdeck <
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
> index 701a72ec5629..ad2987888966 100644
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
> ALC233_FIXUP_HEADSET_MIC),
>         SND_PCI_QUIRK(0x19e5, 0x3204, "Huawei MACH-WX9",
> ALC256_FIXUP_HUAWEI_MACH_WX9_PINS),
>         SND_PCI_QUIRK(0x19e5, 0x320f, "Huawei WRT-WX9 ",
> ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
>         SND_PCI_QUIRK(0x1b35, 0x1235, "CZC B20", ALC269_FIXUP_CZC_B20),
> --
> 2.37.2
>
>
