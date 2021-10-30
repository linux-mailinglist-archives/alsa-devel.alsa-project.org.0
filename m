Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A6444098C
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Oct 2021 16:34:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE470169C;
	Sat, 30 Oct 2021 16:33:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE470169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635604458;
	bh=3VhZ5GYm5O03OYfyy72+Px/Fbs+b4QmFFnZkVKjeD3E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gwf+KT0MZWm1yYJV+ZWGO0dY2R4KUDk+UcO3J6cWy80WpnyrYFfgtPYsWVtgiBPNk
	 BEwSUB6xC9JtXDf8MshmvcEMaDOjkopK9BSL+2q0w/VfUZOHE+z1NSmMpW6lEV654o
	 5AbPiIqYA0pVYx9JwtzCvKc8AhWzzOfj4MVBmv08=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EE98F800F4;
	Sat, 30 Oct 2021 16:33:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 148ABF8026C; Sat, 30 Oct 2021 16:32:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com
 [IPv6:2607:f8b0:4864:20::a2f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C09FBF800F4
 for <alsa-devel@alsa-project.org>; Sat, 30 Oct 2021 16:32:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C09FBF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jacTmjJq"
Received: by mail-vk1-xa2f.google.com with SMTP id t127so5978659vke.13
 for <alsa-devel@alsa-project.org>; Sat, 30 Oct 2021 07:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PibixaHg70I0d4jdZY7GuoR5LAHkTaADgU2S/nIEubI=;
 b=jacTmjJqgxpnk10o7kKmFd05ImVp9cIC+ijBAh783YMtsYps98UlorGUy3RXFIXdSP
 50fclkeFGyDRxSCSHyUbCtReP68o2BiSUsHPdTbMkfCZJV+5sWpOLqwhs9HrcC+OCfkY
 w0iRoFz83Xu8Vmh2HFApcRZjNAq/kLrnsrzhjO+bGzQGvtOy+4zulYNJ+R/FcRAOjkRo
 M2o2Ner0R954PwxZQPXPOeXLqk40Vx1hto6Qbu5/q8F4fVyVxd7LLBlhD7maOzEgxIDe
 xzCLdiNki3OkJ6skRobS4iIGKSY2QE5Le7AUghkdRQWnmycUzW9v/8505uMDiaj9eWXP
 sfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PibixaHg70I0d4jdZY7GuoR5LAHkTaADgU2S/nIEubI=;
 b=c+Cs/QaKeOKeG8Z0IEuu1g1R8h9tbdxJNhJarYAHzP1YNau/i4Pdv0gYsSOibnCvxn
 RXeBQ8GoVMxd//eylE9bC63WWauTlknEQYrdCS14ygqU53M2Vt3RJ5YHR8B9mpgP/i4M
 7UEP8HS4qHjxpxH+zWOoC5JFKhFzqdKdKX2JqkO8b2GVaU3GX+Z8HqUehnWSMn8DF3Yf
 WF13bBA1IilQ72ZBP0QMTB0GNn6HAuP4a9bzpY7ezxxYgtyK+iaZj1zS5EcO/bdUMUHh
 FnBxXTUhJPXunT0F7D/FIq6fVghsZSFdGfqylfnmu5JWo5jfcL3dpHjpVdE4xsCV2MNf
 xD3A==
X-Gm-Message-State: AOAM532QFt+V9HBRpU6RxSTK7vbqfdljI20Z7vMOclj9GlKjBsExJcqf
 xAf+v5BepdZxVdVp2OQdJakW1IphumkNZDbFu0JAeMv7RbY=
X-Google-Smtp-Source: ABdhPJxz3yfOWYoS8d8NxgkDrhc+FYQ23LJA4SKwy4/4tX7gnpLOq89JaXXbt4NKGCRs6hKIqpnjftnRkiCl+vlkQKo=
X-Received: by 2002:ac5:c196:: with SMTP id z22mr19001881vkb.2.1635604368032; 
 Sat, 30 Oct 2021 07:32:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211029183105.28503-1-skryking@gmail.com>
 <s5h7ddusw91.wl-tiwai@suse.de>
In-Reply-To: <s5h7ddusw91.wl-tiwai@suse.de>
From: Jason Ormes <skryking@gmail.com>
Date: Sat, 30 Oct 2021 09:32:36 -0500
Message-ID: <CABDyYE53Eh4+rMyJC94MePSnhxCy5h_1Eh-nwj-d46NUaaDJbQ@mail.gmail.com>
Subject: Re: [PATCH] HX-Stomp XL USB_ID.
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>
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

It appears to, it's basically just the HX Stomp that they have added a few
more buttons to.  The USB ID has changed so it doesn't get the fixed rate
that it needs.  After I added it, I've spent several hours recording
through it without any issues.  Even the midi functionality works.

Jason Ormes

On Sat, Oct 30, 2021, 4:22 AM Takashi Iwai <tiwai@suse.de> wrote:

> On Fri, 29 Oct 2021 20:31:05 +0200,
> Jason Ormes wrote:
> >
> > Signed-off-by: Jason Ormes <skryking@gmail.com>
>
> Could you give a bit more description?
> e.g. does the device work fully compatibly?
>
>
> thanks,
>
> Takashi
>
> > ---
> >  sound/usb/format.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/sound/usb/format.c b/sound/usb/format.c
> > index 50efccbffb8a..e8fc2c350a9f 100644
> > --- a/sound/usb/format.c
> > +++ b/sound/usb/format.c
> > @@ -414,6 +414,7 @@ static int
> line6_parse_audio_format_rates_quirk(struct snd_usb_audio *chip,
> >       case USB_ID(0x0e41, 0x4242): /* Line6 Helix Rack */
> >       case USB_ID(0x0e41, 0x4244): /* Line6 Helix LT */
> >       case USB_ID(0x0e41, 0x4246): /* Line6 HX-Stomp */
> > +        case USB_ID(0x0e41, 0x4253): /* Line6 HX-Stomp XL*/
> >       case USB_ID(0x0e41, 0x4247): /* Line6 Pod Go */
> >       case USB_ID(0x0e41, 0x4248): /* Line6 Helix >= fw 2.82 */
> >       case USB_ID(0x0e41, 0x4249): /* Line6 Helix Rack >= fw 2.82 */
> > --
> > 2.25.1
> >
>
