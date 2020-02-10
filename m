Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 954DC1572CE
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 11:27:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32F1983E;
	Mon, 10 Feb 2020 11:27:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32F1983E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581330473;
	bh=yMjqGIN74TyCpZ3H2GdUDozVdAix329JAXoKvyTQ1Yg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FtCAoH5yIWj6AaRDeZK9GfjMvseCzn63rrGZTh+3RYmFeZJmvyIUTKU2E6dQdDU/k
	 +9xzF/jRh19xAtr8tjI20HqHnaFl6R7nUQbe8qmoBBpg9i44wVRfKluwQOP64doR1e
	 MX90ohxK+qSETTG85DyP/QNStWnZ459rLh03i42A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0B52F802FD;
	Mon, 10 Feb 2020 11:20:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF0A2F80157; Mon, 10 Feb 2020 04:04:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B09F5F80118
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 04:04:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B09F5F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CNttfqco"
Received: by mail-pf1-x444.google.com with SMTP id 185so2979931pfv.3
 for <alsa-devel@alsa-project.org>; Sun, 09 Feb 2020 19:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+v3tugkO1iOaOq7ovlKkaRUNoP5wxMdesvR7lwgSDp8=;
 b=CNttfqcoV4DUETNVZ151AX1GoPCGswSucCrZ7FqXJVVVd5FVzp1/G9yKj2WumW512R
 lzQr7kBs/olQiHV97kKC8r2U9K2qBBb4fICgK8DCNYDTQnfvr4BSgY+VttQ3AqvZPY1N
 2bKC9pdtpKMS/sr26RmTDpMbyAeLEN1cScUKu8XC4QLKfjVAsV859IDi325uE9AZ3chG
 e0DQRaURNyp2ax7QHcgzaJ2FDULxpwTqhJsTExKwNNNZEqZOWTf7fEXEzM7SENOY9G+K
 kYvRztckLjngK++nKjDcYC0EP396Kwtu4zPBuacVCKea4XslKGtKT6G3DTWNyAn0pnQy
 TMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+v3tugkO1iOaOq7ovlKkaRUNoP5wxMdesvR7lwgSDp8=;
 b=b5Ltqv+OYtHTl8Sx161n24OZcCNalC+a0eoS5uw+lBjqRxndI2KATYmO6DZ3QLac4z
 Slh/mArvqJNmHGVX3pKIU8hbvmsjVuNvsD49yueLVEaRODkABQSl1LSUMe1Kb8GBcj7+
 getsiaUDI8Y9+ZhrXgVSOgcLOmbj01JpWqcWq59/dXs4ranRfGXn2UowVMpj0VWej0wi
 6BfzRHyd4GvE368P0uklIgqxT7UrNx0fmANGwMcTqQ/nHJYsijJRmzjdowx4MVlH2o3A
 lf1K5cntJ0UzJo005uHEos26hiOHpUgZS5JJwJF9WtK5AsJ5SZ83vmT/SsuR5t5tYbt5
 RMQw==
X-Gm-Message-State: APjAAAWa+E2c9v9sWJEndw+jfj90xD18yFZGLguZ9F0cYeo9tZ1Srars
 cEwLZ8myHYdLzIupEajHHA0=
X-Google-Smtp-Source: APXvYqyqAkF1kb2L/Z2ThpDSVEyV9/PCas0aP0/u5srrP7gK+MpWwzSeiK32cpiFxtR4UwxsnRSVRQ==
X-Received: by 2002:a65:68ce:: with SMTP id k14mr11674041pgt.336.1581303861067; 
 Sun, 09 Feb 2020 19:04:21 -0800 (PST)
Received: from f3 (ag119225.dynamic.ppp.asahi-net.or.jp. [157.107.119.225])
 by smtp.gmail.com with ESMTPSA id x65sm10697309pfb.171.2020.02.09.19.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2020 19:04:20 -0800 (PST)
Date: Mon, 10 Feb 2020 12:04:16 +0900
From: Benjamin Poirier <benjamin.poirier@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>
Message-ID: <20200210030416.GA3302@f3>
References: <20191129144027.14765-1-perex@perex.cz> <20200210025249.GA2700@f3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200210025249.GA2700@f3>
X-Mailman-Approved-At: Mon, 10 Feb 2020 11:20:06 +0100
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Kailang Yang <kailang@realtek.com>
Subject: Re: [alsa-devel] [PATCH] ALSA: hda - fixup for the bass speaker on
 Lenovo Carbon X1 7th gen
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2020/02/10 11:52 +0900, Benjamin Poirier wrote:
> On 2019/11/29 15:40 +0100, Jaroslav Kysela wrote:
> > The auto-parser assigns the bass speaker to DAC3 (NID 0x06) which
> > is without the volume control. I do not see a reason to use DAC2,
> > because the shared output to all speakers produces the sufficient
> > and well balanced sound. The stereo support is enough for this
> > purpose (laptop).
> > 
> > Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> > ---
> >  sound/pci/hda/patch_realtek.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> 
> This patch is now commit d2cd795c4ece ("ALSA: hda - fixup for the bass
> speaker on Lenovo Carbon X1 7th gen"). There was then followup commit
> 86353aa70ed0 ("ALSA: hda/realtek - Add quirk for the bass speaker on
> Lenovo Yoga X1 7th gen").

Sorry, commit id 86353aa70ed0 is the backport on stable/linux-5.4.y
branch, mainline id is:
54a6a7dc107d ("ALSA: hda/realtek - Add quirk for the bass speaker on
Lenovo Yoga X1 7th gen")

> 
> As a result of those, the maximum sound output level on my laptop
> reduced to ~60% of what it used to be.
> 
> Moreover, the quirk name is inaccurate. I have a "ThinkPad X1 Carbon
> 7th" (as confirmed by dmidecode) and its audio device id is:
>         Subsystem: Lenovo Cannon Point-LP High Definition Audio Controller [17aa:2292]
> but the patches list:
> 	SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Yoga 7th", ALC285_FIXUP_SPEAKER2_TO_DAC1),
> 	SND_PCI_QUIRK(0x17aa, 0x2293, "Thinkpad X1 Carbon 7th", ALC295_FIXUP_DISABLE_DAC3),
> (notice the mixup of id 0x2292).
> 
> Applying the following diff brings the volume back to previous levels
> and brings functional volume control:
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index 68832f52c1ad..ed41e3fb5566 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -7260,7 +7260,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x17aa, 0x224c, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
>  	SND_PCI_QUIRK(0x17aa, 0x224d, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
>  	SND_PCI_QUIRK(0x17aa, 0x225d, "Thinkpad T480", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
> -	SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Yoga 7th", ALC285_FIXUP_SPEAKER2_TO_DAC1),
> +	SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Yoga 7th", ALC295_FIXUP_DISABLE_DAC3),
>  	SND_PCI_QUIRK(0x17aa, 0x2293, "Thinkpad X1 Carbon 7th", ALC285_FIXUP_SPEAKER2_TO_DAC1),
>  	SND_PCI_QUIRK(0x17aa, 0x30bb, "ThinkCentre AIO", ALC233_FIXUP_LENOVO_LINE2_MIC_HOTKEY),
>  	SND_PCI_QUIRK(0x17aa, 0x30e2, "ThinkCentre AIO", ALC233_FIXUP_LENOVO_LINE2_MIC_HOTKEY),
> 
> I can send a patch to fix the problems for my laptop but then I don't
> know what's up for other devices that built on
> ALC285_FIXUP_SPEAKER2_TO_DAC1.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
