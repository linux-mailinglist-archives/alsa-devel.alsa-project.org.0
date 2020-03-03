Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAEE1779AC
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Mar 2020 15:58:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 282BD1673;
	Tue,  3 Mar 2020 15:57:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 282BD1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583247504;
	bh=OGTb9rnq94nO9dXfuOPUPWaW8y1d04E1IMU5OdDNkP8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L9EwT5xwrhLspcPvm1gIXgLTKD8v7iwH58vnYkxafCyfkDtPqNmMo0U4uTtklmjei
	 bLzARmEV5YL/aN7dY028COZWr8iazsGQ778kY9KewtFCJdYJj9d1xGsNVV8YF9xkJz
	 oH1yRRzfwHktG+730MEGHM1Is/SrKP8JRGeXp5pw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33168F80245;
	Tue,  3 Mar 2020 15:56:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 014A7F8025F; Tue,  3 Mar 2020 15:56:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F86BF8012D
 for <alsa-devel@alsa-project.org>; Tue,  3 Mar 2020 15:56:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F86BF8012D
Received: by mail-oi1-f193.google.com with SMTP id q81so3320516oig.0
 for <alsa-devel@alsa-project.org>; Tue, 03 Mar 2020 06:56:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=x3zNZ7d0/O3piZAKwaRzICowqFDeT12MhX8I85ngdoI=;
 b=D3nWXukdFlze3KD2kjeGAkJjg7aHRki7mDZ/qcsqIYQKGa61pBIrl0HHdBVDRhIMZs
 bctgh3cUodBsPYsA4fg3/7EB005iMqCUF2uNikdb6GYUstgnu/BxE3QiF6jswpxVRBqc
 uiGfdNHUQPQslVbzFjbj1vY2y0s5/aemGqq3tU5ZP74nwhdudKNOkn8CIBztPMmj9ih0
 fiSxK+TGTQxaoLvV7PNgPl3+Wm8hI93g3vyrHOS8juu2ZbfZeh51BWZjxuod+HoQQTdO
 UweGsvqQKIKWs6hOG+B7nUSo+5OjB618EBffqwficJQTKfHfeGFne4g2k+JBPD3EGhbk
 y9LQ==
X-Gm-Message-State: ANhLgQ0nD9XNR6knDbBMjPD4gM32Xkr/2S8Dmg0iPU917EFe1hrfgPqz
 HwoSoiDMfXY5+Mp6PhDgBLQH1n//65jhrBHz+fI=
X-Google-Smtp-Source: ADFU+vsxyoz8G7LuihX+qLVDCzU7Ls0iBKTkvdUqqQNbf2pr5oeMDXiJ/hb4dyT/P9DEa3JE+h8pPzSts0auW2RHjS4=
X-Received: by 2002:aca:cdd1:: with SMTP id d200mr2565751oig.153.1583247396276; 
 Tue, 03 Mar 2020 06:56:36 -0800 (PST)
MIME-Version: 1.0
References: <20200224112537.14483-1-geert@linux-m68k.org>
 <20200303143444.GA25683@roeck-us.net>
In-Reply-To: <20200303143444.GA25683@roeck-us.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Mar 2020 15:56:25 +0100
Message-ID: <CAMuHMdWZxc5KjHaOhk5xdcjSn54i3ku7b1dW6tXhXbjku1eLww@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Fix SND_SOC_ALL_CODECS imply ac97 fallout
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>
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

Hi G=C3=BCnter

On Tue, Mar 3, 2020 at 3:34 PM Guenter Roeck <linux@roeck-us.net> wrote:
> On Mon, Feb 24, 2020 at 12:25:37PM +0100, Geert Uytterhoeven wrote:
> > On i386 randconfig:
> >
> >     sound/soc/codecs/wm9705.o: In function `wm9705_soc_resume':
> >     wm9705.c:(.text+0x128): undefined reference to `snd_ac97_reset'
> >     sound/soc/codecs/wm9712.o: In function `wm9712_soc_resume':
> >     wm9712.c:(.text+0x2d1): undefined reference to `snd_ac97_reset'
> >     sound/soc/codecs/wm9713.o: In function `wm9713_soc_resume':
> >     wm9713.c:(.text+0x820): undefined reference to `snd_ac97_reset'
> >
> > Fix this by adding the missing dependencies on SND_SOC_AC97_BUS.
> >
>
> With this patch applied, arm:pxa_defconfig reports a variety of unmet
> SND_SOC dependencies, and it fails to build.
>
> ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9713.ko] undefined!
> ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9712.ko] undefined!
> ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9705.ko] undefined!
>
> Reverting this patch fixes the problem.

Should SND_PXA2XX_SOC_AC97 in sound/soc/pxa/Kconfig select
SND_SOC_AC97_BUS instead of SND_SOC_AC97_BUS_NEW?
The latter does not exist.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
