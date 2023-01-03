Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F25765C18E
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 15:11:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E394CE01A;
	Tue,  3 Jan 2023 15:10:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E394CE01A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672755094;
	bh=ZBT8QGBM4TylsNBdJUfJE0UpwiJkpbSc92XFfa/BZbw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=iuV+SeAWOmmh6nXFmJNH8+XIx7bu4oS9zeTwidN4E30f9AgtBS+y2dW4uk36gNLNS
	 oheUWKmM1R4Zavj7YS0Wu2u3NQOrnZD6qNzCnavloNFPLLIhgXmYt69fNObrnSCmPn
	 LLbciTWz3YBqHttj9qwNmBaSzSSuip6KJz9Hkmmc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E0CAF80552;
	Tue,  3 Jan 2023 15:09:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C2EAF8047B; Tue,  3 Jan 2023 14:11:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5FF4F800F8
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 14:11:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5FF4F800F8
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=ralston.id.au header.i=@ralston.id.au
 header.a=rsa-sha256 header.s=google header.b=S5uXlrqZ
Received: by mail-ot1-x329.google.com with SMTP id
 x25-20020a056830115900b00670932eff32so19062353otq.3
 for <alsa-devel@alsa-project.org>; Tue, 03 Jan 2023 05:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ralston.id.au; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZBT8QGBM4TylsNBdJUfJE0UpwiJkpbSc92XFfa/BZbw=;
 b=S5uXlrqZ1UTZOKh9S0VWa+TJrjnr1xX00qWX1oZ2G/Qso/AUeU2XdRV8CuzJBn19RQ
 S8PUpZYTfTpZjW5xlrzgJepE/CwPmjpgb7b0RI+6PMUX7MlYhNbOqun0jKHnfOBil9Si
 9YqCLTcZiCzldnSbMlV8u/x1yZ9kAq3vTh0OY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZBT8QGBM4TylsNBdJUfJE0UpwiJkpbSc92XFfa/BZbw=;
 b=zgguircbIMNB4xtKynaNcRqCMKpdHhamr//ebSYprlxdci9YG8WTGVacfVwT3rJGin
 /icFY1Ake6EhElAR1hZRQd+GbxQbh6Ghg6MQXhFyaFBArdlbMNTla2aeQ6xKSEs3ECIb
 mHPqg16llOWJRXsjzgj2PV0ojkPP6CDehw1TeEtLlvg7TqQj5+lPMNmeyiVNTm3Jpl75
 9JgPRyj/AcP58bsJ65bcsJ69pDMnaWtpGNJn+j2yTUaOXFxS7vrfoustJ1zam4A4kk4O
 G8cOWUU22tmOHAJXR9GZZ+JyR2itPzw4huaJvoHop9+i+3BPCwVwTbLgy0mUYDP4W/18
 t4Bw==
X-Gm-Message-State: AFqh2koTwSs+NNyaKPtBXw+r8DI492AZxfwx2buvS6jceq6+Dh3L+ZoM
 IJeVzPz6oDYC+tgSnohcEGGOOhSOjvis23Y8baa1OCOzoKWa0wLvO9k=
X-Google-Smtp-Source: AMrXdXvMiRhkPudrVcodk+MiSXC0+Q1QXxeRXc6jXFUYRSTGQ3XazpqjMW5uF+w3LzN5kMlewpTk+W0So2OurVCx894=
X-Received: by 2002:a05:6830:1c8:b0:66e:b992:749f with SMTP id
 r8-20020a05683001c800b0066eb992749fmr2372045ota.52.1672751482203; Tue, 03 Jan
 2023 05:11:22 -0800 (PST)
MIME-Version: 1.0
References: <CAC2975JXkS1A5Tj9b02G_sy25ZWN-ys+tc9wmkoS=qPgKCogSg@mail.gmail.com>
 <bf646395-1231-92f6-7c5a-5b7765596358@leemhuis.info>
 <87zgb0q7x4.wl-tiwai@suse.de>
In-Reply-To: <87zgb0q7x4.wl-tiwai@suse.de>
From: Michael Ralston <michael@ralston.id.au>
Date: Wed, 4 Jan 2023 00:10:46 +1100
Message-ID: <CAC2975K24Gt3rGieAToHjb7FEHv84aqiRSQx7EOuR2Q7KByUXw@mail.gmail.com>
Subject: Re: USB-Audio regression on behringer UMC404HD
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 03 Jan 2023 15:09:07 +0100
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

Working, 6.0.16-lqx1
https://hastebin.com/omoqasiqek.apache

Not working, 6.1.1-arch1-1.1
https://hastebin.com/itasefinaz.apache

I built the working kernel myself with patched sources. Let me know if
you'd like me to run a test with any particular kernel build or
version.

--
Michael

On Tue, 3 Jan 2023 at 20:33, Takashi Iwai <tiwai@suse.de> wrote:
>
> On Tue, 03 Jan 2023 10:07:42 +0100,
> Thorsten Leemhuis wrote:
> >
> > [TLDR: I'm adding this report to the list of tracked Linux kernel
> > regressions; all text you find below is based on a few templates
> > paragraphs you might have encountered already already in similar form.
> > See link in footer if these mails annoy you.]
> >
> > [CCing alsa maintainers]
> >
> > On 02.01.23 18:29, Michael Ralston wrote:
> > > I'm currently experiencing a regression with the audio on my Behringe=
r
> > > U-Phoria UMC404HD.
> > >
> > > Alsa info is at:
> > > http://alsa-project.org/db/?f=3Df453b8cd0248fb5fdfa38e1b770e774102f66=
135
> > >
> > > I get no audio in or out for this device with kernel versions 6.1.1 a=
nd 6.1.2.
> > >
> > > The versions I have tried that work correctly include 5.15.86 LTS,
> > > 5.19.12, and 6.0.13=E2=80=9316.
> > >
> > > When I run this on 6.1.1, it will just hang until I ctrl+c:
> > > aplay -D plughw:1,0 /usr/share/sounds/alsa/Front_Center.wav
> > >
> > > I've run strace on that command, and its output is at:
> > > https://pastebin.com/WaxJpTMe
> > >
> > > Nothing out of the ordinary occurs when aplay is run, according to th=
e
> > > kernel logs.
> > >
> > > Please let me know how I can provide additional debugging information
> > > if necessary.
>
> Please boot with snd_usb_audio.dyndbg=3D+p option, and get the kernel
> logs in both working and non-working cases.
>
> I guess it's a regression due to the hw_params/prepare split, but need
> to check more details.
>
>
> thanks,
>
> Takashi
