Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB6865C2E2
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 16:21:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29E85E406;
	Tue,  3 Jan 2023 16:20:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29E85E406
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672759275;
	bh=toc2JlbFoFF7NCVVERtHpnT/bR/h+KwjZbozt2IXEQw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FfuvDGBXk2Rx224QDbye1uJNSi9r8ZPmVUkyu77jdlpM0STCKfO62yutGkhmCJXpm
	 y0mU5aaJnV63HS3PDpC8cL06FPmthnEejM+tNsWcqVzuhUcZRCasWa4fvbSbf96Cer
	 yceV3ym1YWEUJ2HFuhmpsFEOS2Y0+ypFnq6KmpqY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC6E1F804AA;
	Tue,  3 Jan 2023 16:20:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0917F804AA; Tue,  3 Jan 2023 16:20:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11A1BF8003C
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 16:20:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11A1BF8003C
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=ralston.id.au header.i=@ralston.id.au
 header.a=rsa-sha256 header.s=google header.b=hyeNGChJ
Received: by mail-oi1-x234.google.com with SMTP id j130so21687218oif.4
 for <alsa-devel@alsa-project.org>; Tue, 03 Jan 2023 07:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ralston.id.au; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z8vVarhYQXZ9Qhz5mKvhwtmR7SHZZ/LNj7oEL18OVmc=;
 b=hyeNGChJOIyeBdeAor9LyYJDIbYuztx7eQPHqVLU/cYmveo63Dounjfo3BQ16he9mC
 H2PBFm462b6aeUnMdHKBadoPpjesWMEruUkoYYlOuMKBK+5N+2CD3+Wr5xhnwXRMPl4c
 mMdw5sImTu+yhVbE1H9hYFjKdg7u/cJfIJmPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z8vVarhYQXZ9Qhz5mKvhwtmR7SHZZ/LNj7oEL18OVmc=;
 b=fuftXNFCZOWTsrQ6cvy4BGHaRUHRhTb0XST9qPN1N2Ghzybzw5jbPSBCnc+aC/Asb3
 H7aFqHxw+fmx6D/nWeOKbOpj57G0no3jmu/fisZ1CNA4H2meSWO1W6gtgae4sWJCoIor
 E5bt5iskNUs3hIZ3PGn79J7/RW2HC+kfa2zrE8Tv8Bm75ASDqHNPyyuXKev2+fu5jBjj
 utxjmGzaNYv08YSjhRFvQ77ydlKy3IURFFIycy374Div6fZqSV1ugOO8+5vLifM67lZd
 cP7/H3s0gNEIOUH+RkhnWFgIbkdIs9zePRdQFi4Sl+yiMEM15eBQE3dTjVaLE3TT5LNy
 8ViA==
X-Gm-Message-State: AFqh2kqaJl95iGFLLTgcRnDKvSm1ZHYSI97SWoE7Yz/i55vm6yxRzEmE
 aRyQTB8gXH1f/n/FlrJ2gLvvhkiBTwmQp3iffdXktg==
X-Google-Smtp-Source: AMrXdXu0SPE09PX79YJPOiZzyF40E/NRTrYM3mQEXId4MTVPUHDeIvG66xX/A8ZFkefsBYcMYb0vO3fCepWpRm7CMVI=
X-Received: by 2002:a05:6808:48d:b0:35c:3327:ecf0 with SMTP id
 z13-20020a056808048d00b0035c3327ecf0mr2266171oid.220.1672759217823; Tue, 03
 Jan 2023 07:20:17 -0800 (PST)
MIME-Version: 1.0
References: <CAC2975JXkS1A5Tj9b02G_sy25ZWN-ys+tc9wmkoS=qPgKCogSg@mail.gmail.com>
 <bf646395-1231-92f6-7c5a-5b7765596358@leemhuis.info>
 <87zgb0q7x4.wl-tiwai@suse.de>
 <CAC2975K24Gt3rGieAToHjb7FEHv84aqiRSQx7EOuR2Q7KByUXw@mail.gmail.com>
 <87sfgrrb5f.wl-tiwai@suse.de>
 <CAC2975+cUqiFC0LO-D-fi0swH+x=_FMuG+==mhg6HH4pc_YDRA@mail.gmail.com>
 <87bknfr6rd.wl-tiwai@suse.de>
 <CAC2975+CP0WKmXouX_8TffT1+VpU3EuOzyGHMv+VsAOBjCyhnA@mail.gmail.com>
In-Reply-To: <CAC2975+CP0WKmXouX_8TffT1+VpU3EuOzyGHMv+VsAOBjCyhnA@mail.gmail.com>
From: Michael Ralston <michael@ralston.id.au>
Date: Wed, 4 Jan 2023 02:19:41 +1100
Message-ID: <CAC2975LNYcsW1zAohijLtziXLbUyBjxHY3grD5=HjHcWBH_LPA@mail.gmail.com>
Subject: Re: USB-Audio regression on behringer UMC404HD
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 4 Jan 2023 at 02:14, Michael Ralston <michael@ralston.id.au> wrote:
>
> On Wed, 4 Jan 2023 at 02:13, Takashi Iwai <tiwai@suse.de> wrote:
> >
> > That's weird.  Is snd_usb_audio driver bound with the device at all?
> > That is, does it appear in /proc/asound/cards?
> >
>
> Yes, it's there.
>
> 0 [V49            ]: USB-Audio - V49
>                      Alesis V49 at usb-0000:08:00.1-3, full speed
> 1 [NVidia         ]: HDA-Intel - HDA NVidia
>                      HDA NVidia at 0xfc080000 irq 154
> 2 [U192k          ]: USB-Audio - UMC404HD 192k
>                      BEHRINGER UMC404HD 192k at usb-0000:08:00.1-4, high speed
> 3 [Generic        ]: HDA-Intel - HD-Audio Generic
>                      HD-Audio Generic at 0xfca00000 irq 156

Also lsusb shows this...

    |__ Port 4: Dev 5, If 0, Class=Audio, Driver=snd-usb-audio, 480M
       ID 1397:0509 BEHRINGER International GmbH
       /sys/bus/usb/devices/1-4  /dev/bus/usb/001/005
   |__ Port 4: Dev 5, If 1, Class=Audio, Driver=snd-usb-audio, 480M
       ID 1397:0509 BEHRINGER International GmbH
       /sys/bus/usb/devices/1-4  /dev/bus/usb/001/005
   |__ Port 4: Dev 5, If 2, Class=Audio, Driver=snd-usb-audio, 480M
       ID 1397:0509 BEHRINGER International GmbH
       /sys/bus/usb/devices/1-4  /dev/bus/usb/001/005
   |__ Port 4: Dev 5, If 3, Class=Audio, Driver=snd-usb-audio, 480M
       ID 1397:0509 BEHRINGER International GmbH
       /sys/bus/usb/devices/1-4  /dev/bus/usb/001/005
   |__ Port 4: Dev 5, If 4, Class=Audio, Driver=snd-usb-audio, 480M
       ID 1397:0509 BEHRINGER International GmbH
       /sys/bus/usb/devices/1-4  /dev/bus/usb/001/005
   |__ Port 4: Dev 5, If 5, Class=Vendor Specific Class, Driver=, 480M
       ID 1397:0509 BEHRINGER International GmbH
       /sys/bus/usb/devices/1-4  /dev/bus/usb/001/005

--
Michael
