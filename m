Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6437D3BF0C8
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jul 2021 22:35:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4EB4850;
	Wed,  7 Jul 2021 22:34:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4EB4850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625690111;
	bh=9qUXM4H2wtZyrMeQ+ei5PDaC7rgS+Ilb1nmD+VJT8mc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ri6weKjxXMDfqP3m82KWZgyCnsSA0SjEKjtjNlpPIxOalFp/HYOUXiJkhQRbW5Ams
	 xNTleN0Qf9IpomiIwb9ss/ehKJZpW9PYDo2XGWiWS3MQBgv6VvUveTzIdOWLNbL2Xf
	 DfuOqKuCDRzCP9VxpKKmJkJyk61c7LjTeT4Fmw3Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72763F8012A;
	Wed,  7 Jul 2021 22:33:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CEB5F80224; Wed,  7 Jul 2021 22:33:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FROM_LOCAL_NOVOWEL,HK_RANDOM_ENVFROM,
 HK_RANDOM_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACD61F8012F
 for <alsa-devel@alsa-project.org>; Wed,  7 Jul 2021 22:33:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACD61F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Y7teMaxB"
Received: by mail-ed1-x529.google.com with SMTP id h2so5176583edt.3
 for <alsa-devel@alsa-project.org>; Wed, 07 Jul 2021 13:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RksO08zxXShmv/TbRX/JnQALfaTc9XSb/QqN0uX0Y4c=;
 b=Y7teMaxBpvvKQ2gnp5u8kzquNml4aUTJpZl5jIW1lKNpT8ve4ZLtzc/vUNwsNvhqtp
 e0O3MvxbR+K7v8lrbKbXDJQjN+cz35SF8NgNYZLfyFCmlAgWsI44MSKyzjegkMwU+vte
 92HL+Ve+mX19cYQvEVbbBWmk4DELZB3xCkswltxfaTeOEyEu6ZespLqNGXkwgTDggNmr
 7Xu4l4KUl3MPnitEsBrOQ8uLWDQwKQIKN1CspgpX2TY4zpyZAT34emBtjii2hLQ5Pz2R
 FB5Bp/m+eDQRrAyXNb/mIBM+UdkhiidNSP6fwcIs9h27GGGPGHQaY8q43ABqQlje4KDt
 cMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RksO08zxXShmv/TbRX/JnQALfaTc9XSb/QqN0uX0Y4c=;
 b=sF10R9Q2zEP+ZaX+5PB8xf35++y3tUBe9hXr3sAg+ZHzYBgm35+ASBQOd7ruA50Lyq
 HTXOQe9RieyeMigGUWpgWHIzJyVCoyUogPrbWdJFpj1rpBOK5ZK4uYrhZJUA/w1xEo+g
 MLVshpiCkX6v9NQC4KYRmzaE1t7dhUw+K3Jl8K4euo9FYPPf9JIDp4Ju8xlI2657q7m1
 OVtSABmc38x0Yk8tjIchy275fn9/wvleA1A5TfXK4our+bIG62ggoTTXo3iSeKXHQS6l
 siweoSEDgo+fO8JqntJJ7lEBRoC2tCwRlw+V/gsNSIl7/BTOkkB8UbBB40wdUcUH1tZi
 h68g==
X-Gm-Message-State: AOAM533bAvHi0zOsZ33POieCeQNHOsFU0lDnylSj3F528qJkI5EWJ8lL
 DMv1cAVdd2t+GvBWv5ikapddUEZLvdLkhPzUnvo=
X-Google-Smtp-Source: ABdhPJzL4aKhFnDbKJLykRHEyOt/2yk5mRO6vIgkimxjmW2858+h68zn4jLxxbwEIpTXiZisK01GMIBFtDZ8ByOBvSI=
X-Received: by 2002:a50:8fc3:: with SMTP id y61mr31809870edy.107.1625690013534; 
 Wed, 07 Jul 2021 13:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <YJ4yBmIV6RJCo42U@google.com> <s5hk0o18tio.wl-tiwai@suse.de>
 <YJ5cHdv6MVmAKD3b@google.com> <YKDYQfDf7GiMfGCN@google.com>
 <YKDYbaprE3K2QpCe@google.com> <s5hbl9b6mah.wl-tiwai@suse.de>
 <CAMo8BfKKMQkcsbOQaeEjq_FsJhdK=fn598dvh7YOcZshUSOH=g@mail.gmail.com>
 <s5ho8be8v3z.wl-tiwai@suse.de>
 <CAMo8Bf+FF8Ofq=FwoZZXp9vKiMaUZNAm+W=OJmu2j2XN6kLb-Q@mail.gmail.com>
 <s5hk0m26lfu.wl-tiwai@suse.de>
In-Reply-To: <s5hk0m26lfu.wl-tiwai@suse.de>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 7 Jul 2021 13:33:22 -0700
Message-ID: <CAMo8BfLj+VLUbfUmHUSHOfc3PwbWd2w_xnaTZa9HyrcmvJCAkQ@mail.gmail.com>
Subject: Re: ALSA: intel8x0: div by zero in snd_intel8x0_update()
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Leon Romanovsky <leon@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
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

On Wed, Jul 7, 2021 at 11:14 AM Takashi Iwai <tiwai@suse.de> wrote:
> On Wed, 07 Jul 2021 19:50:07 +0200, Max Filippov wrote:
> > It didn't change anything in my case. My further observation is that
> > the snd_intel8x0_update is called before the ichdev->prepared
> > is set to one and as a result IRQ is apparently never cleared.
>
> So it's broken in anyway no matter whether
> intel8x0_measure_ac97_clock() is called or not, right?

The change that you suggested didn't eliminate the call to
intel8x0_measure_ac97_clock, it's still called and an interrupt
flood happens at the same place.

I've also tried the following change instead and it fixes my issue:

diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index 5b124c4ad572..13d1c9edea10 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -692,11 +692,14 @@ static inline void snd_intel8x0_update(struct
intel8x0 *chip, struct ichdev *ich
       int status, civ, i, step;
       int ack = 0;

-       if (!ichdev->prepared || ichdev->suspended)
-               return;
-
       spin_lock_irqsave(&chip->reg_lock, flags);
       status = igetbyte(chip, port + ichdev->roff_sr);
+       if (!ichdev->prepared || ichdev->suspended) {
+               spin_unlock_irqrestore(&chip->reg_lock, flags);
+               iputbyte(chip, port + ichdev->roff_sr,
+                        status & (ICH_FIFOE | ICH_BCIS | ICH_LVBCI));
+               return;
+       }
       civ = igetbyte(chip, port + ICH_REG_OFF_CIV);
       if (!(status & ICH_BCIS)) {
               step = 0;


> I'm afraid that something is wrong in VM, then.  The driver has been
> working over decades on thousands of real different boards.
>
> Skipping the clock measurement on VM would be still useful,
> independent from your problem, though.

-- 
Thanks.
-- Max
