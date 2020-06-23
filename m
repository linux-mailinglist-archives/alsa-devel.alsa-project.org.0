Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA73206655
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 23:52:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85B3717DB;
	Tue, 23 Jun 2020 23:51:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85B3717DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592949152;
	bh=RgEBYk2Dok5eVHlAwX08WDATqbyLqDY0+vEqR0LeYgw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mk8MDqfnwX1J5Uf8QUXxapLaN2blL3F+T+d4PNleBzrw/1uXD92tInt6AnbsE+5bf
	 f5EhnPXCXGaJyjQ9l8UG4J8Y7gZ9wsxiwTXQog0qtOF4gPgS3QUYPZcc1s5pZgMRNF
	 CJFrYRS+dwu0RPQOsB4Oa9xHKQEU96DIzT8aGG9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFB39F80218;
	Tue, 23 Jun 2020 23:50:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D01FCF80234; Tue, 23 Jun 2020 23:50:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83140F8010E
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 23:50:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83140F8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="o3Kl26jU"
Received: by mail-ej1-x643.google.com with SMTP id dr13so301066ejc.3
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 14:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=MONW8M1UgUiTHOBbm43FfwYiUcxCoFmRqVGZKIWiRG0=;
 b=o3Kl26jUyHcMf4kX8MpIZlKd1WkZ2LR1lbFzQdSgsNBldD7jBVTOJt2iKp42+ImbSy
 smUmP57Ext9TtMw2Y6e5LUbKlg0DvH6YL79POelZbq4C9rprSQLb81SQbuNeS5uppyW5
 L8dNcNnZAe3tGfOGSqj0z9mu1KY3lVDvMo53FwJmFy5OQo28gy02+i5CPAASG1ee8gYA
 X3MfeSehTrp4sUqTUpOXDRI3k+9WshfJwSfKMUTsZhd385fC/ykIN3m8IDqQU7nvKdoU
 quvSphFDOlYrLNvB5XarY6y5v9XkmrptTIRxlOyBXnu4zywSmDi0CcreOJSobR7PuEHo
 x/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MONW8M1UgUiTHOBbm43FfwYiUcxCoFmRqVGZKIWiRG0=;
 b=ROW8f7Yk7uoBLKHuXpb6LOFwjn0bruwchHnaSG02CGzC/+Cg8oHGhJ0EzwpiqP1TQt
 eMzTQws2s6v1v9qPyxYIrCCcj4ydL3jVktxUXBya7NB9ZXS5uWGjDF5WYaoQWYbTWQHE
 u+DezFbrjYwRxNS6KllAlrUFs0/c6V5PXZEwdpjhPwwwbgGawTMF2FZm8eo5enlrovyJ
 9eF6lEV+k6/nHd4iC6MGHn18zb96NJwAO9UH2J5XFIx1Edl024erA/ch0ZUnk66NnJbK
 ClG12JAcDEud0+S9O4/aOUWxzbCyYlAqD5rYzDaGwGsloyaTjeZEvwgl6I+LeifhN4Z3
 3hnw==
X-Gm-Message-State: AOAM5301amzxz29EOy2ala5R25FekvTfuNsprKa69dgp3wxMD6A6tAUx
 LTookGLpbXY7csjWmhz7W6qDJJd4
X-Google-Smtp-Source: ABdhPJzjXw+QuznIoNKh0QK6dOoGDJ6GQz0TOVvuIoPtkNI+oDVn/LVq7/815EPTNnquf/73iE2Ltw==
X-Received: by 2002:a17:906:481b:: with SMTP id
 w27mr21407971ejq.27.1592949042220; 
 Tue, 23 Jun 2020 14:50:42 -0700 (PDT)
Received: from gluon.localnet
 (dynamic-2a01-0c22-ac1d-1300-a6b1-7b74-b942-89e2.c22.pool.telefonica.de.
 [2a01:c22:ac1d:1300:a6b1:7b74:b942:89e2])
 by smtp.gmail.com with ESMTPSA id v24sm283571eja.29.2020.06.23.14.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 14:50:41 -0700 (PDT)
From: Stanislav Kazmin <stas.kazmin@gmail.com>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: Re: [HDAudio][ALC295] speakers not working on Acer Travelmate P614
Date: Tue, 23 Jun 2020 23:50:39 +0200
Message-ID: <1665408.c0yUS1ZBRE@gluon>
In-Reply-To: <s5h366ln2vc.wl-tiwai@suse.de>
References: <CA+-1zuv3SeumhdMbqXjZU0tbmh7HB9LwTK2bfNTe5nOCmz4BgA@mail.gmail.com>
 <s5h366ln2vc.wl-tiwai@suse.de>
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

Hello,

so I have tested the following three cases:
```
sudo hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DIR 0x01
sudo hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_MASK 0x01
sudo hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DATA 0x01
aplay /usr/share/sounds/alsa/Front_Center.wav 
```

```
sudo hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DIR 0x02
sudo hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_MASK 0x02
sudo hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DATA 0x02
aplay /usr/share/sounds/alsa/Front_Center.wav 
```

```
sudo hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DIR 0x04
sudo hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_MASK 0x04
sudo hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DATA 0x04
aplay /usr/share/sounds/alsa/Front_Center.wav 
```

But this did not solved the problem.

> And try turn on EAPD on non-used pins.

I have not found how to do that exactly. Do I have to use the pins which I 
have seen in hdajackretask? 

Could you provide an example on how to do it?

And how to start with the coefficient changes properly?

Best,

Stanislav

On Dienstag, 23. Juni 2020 18:49:59 CEST Takashi Iwai wrote:
> On Tue, 23 Jun 2020 17:49:18 +0200,
> 
> Stanislav Kazmin wrote:
> > Hello, I have the following problem on my Acer TravelMate P614-51T-G2:
> > 
> > I have all the audio sinks correctly identified (like HDMI, DMic,
> > Headphones) but the internal speakers do not produce any sound.
> > 
> > What I have tried so far:
> > 
> > - hard/soft shutdown on Windows and reboot
> > - disable/re-enable speakers and microphone in BIOS
> > - uninstall pulseaudio and test alsa alone (so it is defeitely **not** a
> > pulseaudio issue)
> > - switch from sof-hda-dsp to snd-hda-intel driver (without Dmic support)
> > - retask pins 0x14, 0x16, 0x1b to "Internal Speakers" through
> > hdajackretask
> > (only basic, without advanced features)
> > - removed/reconnected the headphones
> > 
> > `alsamixer` shows all needed sinks and nothing is muted.
> > 
> > I already discussed the issue at sof github
> > https://github.com/thesofproject/ sof/issues/3058 but since the same
> > issue occurs on `snd-hda-intel` legacy river, I was advised to
> > communicate with alsa-devel team.
> > 
> > The alsa-info.sh result are linked at http://alsa-project.org/db/?
> > f=252f92c7a1df3c755d16ee69353b26d2535a4d81
> > 
> > I have tested the kernel 5.8-rc1 but it does not make any difference.
> > 
> > Let me know if I can do anything else to test the issue.
> 
> It's hard to know and the only way is to some trial-and-errors.
> The first shot I'd take is to toggle GPIO pins.  You can change the
> bit via hda-verb program like
>   hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DIR 0x01
>   hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_MASK 0x01
>   hda-verb /dev/snd/hwC0D0 0x01 SET_GPIO_DATA 0x01
> 
> to turn on the bit 0 of GPIO.  The first 0x01 is the node ID and it's
> 0x01 on Realtek, and the last 0x01 the GPIO bit 0.  For toggling the
> bit 1, pass 0x02 in the last argument, and for bit 2, pass 0x04.
> 
> And try turn on EAPD on non-used pins.  This can be done via hda-verb,
> too.
> 
> If this doesn't help, you might need to try some COEF changes as done
> in various quirks in sound/pci/hda/patch_realtek.c.
> 
> 
> HTH,
> 
> Takashi



