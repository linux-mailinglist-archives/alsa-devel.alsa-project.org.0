Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 830CE3A4E4C
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Jun 2021 13:16:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01A6F1938;
	Sat, 12 Jun 2021 13:15:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01A6F1938
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623496609;
	bh=CyZEP0DyNrH8qh6OjHC1M2VAxlEf4FU0acQMIuYU09w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TfopP22WjvEGmfGysa/3+kEU98vpWl56zoOTH6w1uHgfaFJ/xe1NCAiMAwAVeAW92
	 sXkdrETW55moG32iJkRTaMLaK/Ea9WsTEg6grNLzQy5O0qYXZRzz6qrw0xOPBIRAMW
	 QbUPQbi5eyJSclW7WB+1wGbdm+m5RfyIIYnLLoks=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63783F80227;
	Sat, 12 Jun 2021 13:15:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12D4FF80218; Sat, 12 Jun 2021 13:15:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABFF9F800FB
 for <alsa-devel@alsa-project.org>; Sat, 12 Jun 2021 13:15:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABFF9F800FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="abeKq+JN"
Received: by mail-lf1-x131.google.com with SMTP id f30so12659988lfj.1
 for <alsa-devel@alsa-project.org>; Sat, 12 Jun 2021 04:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cgwUnmJkB50r3DBuEOmmIHxo48kJwaYqA0S/tM5/SHs=;
 b=abeKq+JNpx20z5F1ICSMZabYj8NC78fKeStMImKX7nV4IpbwpwsRR5GTnMKyfwKuru
 T1ELnEOh05NMpH6YICIHo8FMtg2yGVmMtP0aGwOSFCvSlWPMXVRRi5e2FNMKnWDY8vnh
 4+y/OXxUPOpauCHLhy4A2sPnLKkMcqIJw8JpA16sTSqLzeMfRlEixcR2I6CiWIA0OqUA
 Uc3WKI9XZFVZO9J6SWbX7L+8eA05ux/u086K+Vw8iCjlRmhiUWEObo6gt0H9yydBQjHb
 VBlcyPVyQN3j2YR5MdAwyAlTuBaYdnU4AjXN4MURiH1+4yL+R8E0Ug/Jb1gWUV5/sUmB
 MuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cgwUnmJkB50r3DBuEOmmIHxo48kJwaYqA0S/tM5/SHs=;
 b=t47v3Ihsz2hsb/6RvDZYM/sGOAC665xiZ7XQs4/Hts1DXoCsbtttP3IYwcMEiMRjdE
 g7gqGqSugy0CjbdHS07g9fzTuPb85/SyC0ox8qp3PNqVMJcCqkyXGjA9VZFZtYaepe+m
 xji4CJ987ojnPqVANUdcexgM1SVOU75HAJOqnzzCJaWg0eeYJQn+sD0Uoe9H+EQXaLJY
 wE3RRowfbgC6is28wf4d7lQHOQIpOMV7p/gkDa60vldSkpGdN7GX1YRqYfBWPvLLAmPS
 rQEvLu3CLPgrSPXcKCyJRHpHKk4Ff0gL+k33UzD786/DaRBJ3dlLIxAmFCfxR7Otvkjw
 KjJg==
X-Gm-Message-State: AOAM532lT43mBv9YW7MkC9bewMEW1fxe5jsH5mV11AYhZApsI2qyt9Aj
 3pxKqtvlKHwFivlc5yhZEgsJqVwsgHhJdeppG/I=
X-Google-Smtp-Source: ABdhPJwlziM9cCOwflS0bsLUk2oJuChO0xswWolhjoHYtXv3ZWtmM95Oq9hFCjGGAf2N1nD77cf0DCe8pMtODDQ/CNk=
X-Received: by 2002:ac2:5b44:: with SMTP id i4mr5781720lfp.652.1623496511442; 
 Sat, 12 Jun 2021 04:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAHhAz+haTa8FJep+mokae4O7Gy9zzq2dbPk28fuEH5FO24uTzw@mail.gmail.com>
 <26698.1623455194@turing-police>
In-Reply-To: <26698.1623455194@turing-police>
From: Muni Sekhar <munisekharrms@gmail.com>
Date: Sat, 12 Jun 2021 16:45:00 +0530
Message-ID: <CAHhAz+goVhacpDPc-OaVuG151TS8QKYdsqdnK9UcAx+Hc07zSg@mail.gmail.com>
Subject: Re: USB sound card issues
To: =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel <alsa-devel@alsa-project.org>, linux-usb@vger.kernel.org,
 linux-sound@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>
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

On Sat, Jun 12, 2021 at 5:16 AM Valdis Kl=C4=93tnieks
<valdis.kletnieks@vt.edu> wrote:
>
> On Tue, 08 Jun 2021 16:20:07 +0530, Muni Sekhar said:
>
> > $ arecord --device hw:1,0 --channels 1 --format S16_LE --rate 32000_Hz =
x.wav
> > Recording WAVE 'x.wav' : Signed 16 bit Little Endian, Rate 32000 Hz, Mo=
no
> > arecord: pcm_read:2032: read error: Input/output error
>
> Always check the obvious stuff first  does the card support S16_LE 32Khz =
data?
Yes , it supports.
> And if it's configurable for multiple formats, was it set for the correct=
 one?
Is there a way to verify was it set for the correct one or not?
>
> Does wireshark or other USB snoop program show any traffic at all?
> Does the record die immediately, or hang for a few seconds and timeout?
What is the difference between these two ways? For my hardware, I
noticed that it hangs for a few seconds and gives EIO (arecord:
pcm_read:2032: read error: Input/output error).
> Does 'arecord -v' or arecord -vv' tell us anything more about the situati=
on?



--=20
Thanks,
Sekhar
