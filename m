Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B242137D9
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 11:43:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A661116DC;
	Fri,  3 Jul 2020 11:42:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A661116DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593769410;
	bh=H1A24+KeHLlEKNDI1IKdWlQkVJOV5vKgeGrvmo2Brc4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TohknJCgXBSlJcTAkNfhB75aVSgg2YGxu+hJXmzJW+Kb9ni1+8NcYBxtbR5y3+44W
	 0BuvQ1FeQh4DJ0GygbF6fzXgdgTwicUalqenuMJhfurcnHuIVxHuxYP1wuGaWDtbp1
	 dIngtlZ/g4GSJ0d+0vc2J576Xgxo6Rhw5qU//Ko8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADFFDF800ED;
	Fri,  3 Jul 2020 11:42:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CE98F80229; Fri,  3 Jul 2020 11:42:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF178F8020C
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 11:42:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF178F8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="c9qYTaAu"
Received: by mail-ej1-x643.google.com with SMTP id a1so33516071ejg.12
 for <alsa-devel@alsa-project.org>; Fri, 03 Jul 2020 02:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7O1Ho+Y9XzSIjLy6QD5J6272JRCLWOVaSjBiLZwIY/Q=;
 b=c9qYTaAutHf1dCy8vFF6iHjbK3+SETst/WIYULk8V751egju8+RQXVlSS7Eo/K9OuY
 3JPSTfkIc1KG0cyTvnap9OAdZxV7k0645fmpYM20yzkD5NfrRcm8X76BFeEOzdkq7Br8
 8SgTafL+vozPgIsfm/jKztvrkL/UMrPJRwN1sM2NLo+PguepffRZlbOlVk3Kn9kw9BpW
 kcPFcBopP59u6W8eacFj8S8YFqILevMvxolMqXAe44cZS5a74PTcc407lakMYQpj8S32
 NSO/0inoe2Eay1vI4X4sKA4h4f5LUwMbugTnZWY+Xy6HShkn3KmpSApxG+kpZehGTxFm
 2+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7O1Ho+Y9XzSIjLy6QD5J6272JRCLWOVaSjBiLZwIY/Q=;
 b=QjpWiXqRx9vdfqOHSdVjllIvq3V3ARzjKbQTC4Y8GlUiym5rumu1s6KDQPxCXZQFCA
 /OOunbhFQzTagfcl9+ZaYWgoazBFQzsmdsjJlh2Te4x1fhfiKqblIedU7/Ce0+DXpdnM
 +/4bN/8BeEimKambUhroOWURC+Vd9xMl9OwGK8x+luiX/LOtJLI1jiyiLhyZY1v0FI8q
 GC/ZZGuM5l0OAkY3B2FkIyB7wNLmjxU0zZNrZfuu5GonE//dhpAJbYP4hG/pXk2EpeFo
 ZhmYVqMfjWGF3tCrJA6BJ6Hct2q3qwfTbZIUG7c3z83Mf3Oi3+FFxDGAMCqb2sWqgGDZ
 jv0Q==
X-Gm-Message-State: AOAM530tNRHWU164oyrWGDFCLsQJwXR2bxDxgKQJgUow5yk0X3mpTzn3
 /Fu2UxDTggkkiMBPJGPdadqQMFbG
X-Google-Smtp-Source: ABdhPJxrDs/3UXU4OCPULCRFa0m9qudsx/RorVpMzQHdVW1Mt7bz/y8VHcykoyQlPj86Z6TljqJGzQ==
X-Received: by 2002:a17:906:194b:: with SMTP id
 b11mr25408636eje.28.1593769335877; 
 Fri, 03 Jul 2020 02:42:15 -0700 (PDT)
Received: from gluon.localnet
 (dynamic-2a01-0c23-600c-c800-b5bb-ab38-3fcf-cdfe.c23.pool.telefonica.de.
 [2a01:c23:600c:c800:b5bb:ab38:3fcf:cdfe])
 by smtp.gmail.com with ESMTPSA id p14sm11737217edr.23.2020.07.03.02.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 02:42:15 -0700 (PDT)
From: Stanislav Kazmin <stas.kazmin@gmail.com>
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Subject: Re: [HDAudio][ALC295] speakers not working on Acer Travelmate P614
Date: Fri, 03 Jul 2020 11:42:14 +0200
Message-ID: <2100677.Z98FQmKFDK@gluon>
In-Reply-To: <32519971.jW2LJBauvq@gluon>
References: <CA+-1zuv3SeumhdMbqXjZU0tbmh7HB9LwTK2bfNTe5nOCmz4BgA@mail.gmail.com>
 <s5h366ln2vc.wl-tiwai@suse.de> <32519971.jW2LJBauvq@gluon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Hello Takashi,

as I am new to mailing lists I would like to know how to proceed now, after I 
posted the question here. Because I cannot create quirks on my own and need 
someone to guide me. But it seems that no one is answering to the question 
anymore. 

Is it normal and will it be attended at some point? Or do I have to post it as 
a BUG somewhere (e. g. linux kernel)?

I do not want to hurry you or anyone else here in any way but I would like to 
know whether I have to wait or to do something.

I would be happy to test some more ideas (like COEFFS and stuff like that) but 
I need concrete recipes for it.

Thanks,

Stanislav

On Montag, 29. Juni 2020 15:46:15 CEST Stanislav Kazmin wrote:
> Hello,
> 
> unfortunately I am still lost and do not know how to attack the problem...
> 
> But I found this bug: https://bugzilla.kernel.org/show_bug.cgi?id=207423
> 
> and I wounder if it related to the problem here?
> 
> Best,
> 
> Stanislav
> 
> On Dienstag, 23. Juni 2020 18:49:59 CEST Takashi Iwai wrote:
> > On Tue, 23 Jun 2020 17:49:18 +0200,
> > 
> > Stanislav Kazmin wrote:
> > > Hello, I have the following problem on my Acer TravelMate P614-51T-G2:
> > > 
> > > I have all the audio sinks correctly identified (like HDMI, DMic,
> > > Headphones) but the internal speakers do not produce any sound.
> > > 
> > > What I have tried so far:
> > > 
> > > - hard/soft shutdown on Windows and reboot
> > > - disable/re-enable speakers and microphone in BIOS
> > > - uninstall pulseaudio and test alsa alone (so it is defeitely **not** a
> > > pulseaudio issue)
> > > - switch from sof-hda-dsp to snd-hda-intel driver (without Dmic support)
> > > - retask pins 0x14, 0x16, 0x1b to "Internal Speakers" through
> > > hdajackretask
> > > (only basic, without advanced features)
> > > - removed/reconnected the headphones
> > > 
> > > `alsamixer` shows all needed sinks and nothing is muted.
> > > 
> > > I already discussed the issue at sof github
> > > https://github.com/thesofproject/ sof/issues/3058 but since the same
> > > issue occurs on `snd-hda-intel` legacy river, I was advised to
> > > communicate with alsa-devel team.
> > > 
> > > The alsa-info.sh result are linked at http://alsa-project.org/db/?
> > > f=252f92c7a1df3c755d16ee69353b26d2535a4d81
> > > 
> > > I have tested the kernel 5.8-rc1 but it does not make any difference.
> > > 
> > > Let me know if I can do anything else to test the issue.
> > 
> > It's hard to know and the only way is to some trial-and-errors.
> > The first shot I'd take is to toggle GPIO pins.  You can change the
> > bit via hda-verb program like
> > 
> >   hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DIR 0x01
> >   hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_MASK 0x01
> >   hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DATA 0x01
> > 
> > to turn on the bit 0 of GPIO.  The first 0x01 is the node ID and it's
> > 0x01 on Realtek, and the last 0x01 the GPIO bit 0.  For toggling the
> > bit 1, pass 0x02 in the last argument, and for bit 2, pass 0x04.
> > 
> > And try turn on EAPD on non-used pins.  This can be done via hda-verb,
> > too.
> > 
> > If this doesn't help, you might need to try some COEF changes as done
> > in various quirks in sound/pci/hda/patch_realtek.c.
> > 
> > 
> > HTH,
> > 
> > Takashi



