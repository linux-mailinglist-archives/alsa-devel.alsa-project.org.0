Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6BB34B31A
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Mar 2021 00:44:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19C05167B;
	Sat, 27 Mar 2021 00:43:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19C05167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616802275;
	bh=rS9LXgDUqmvRIE8skq/XpRmasj9Lm9o6Mf9FsgZczeM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vu83gczX6y0kqTs7SReFshRVsQeJ6jNzdrJ+JHHWW9JO/uXhojevrKepjxWOrvVzq
	 2uxO90L+uBWyqVq2f0TCZ0fk1zyi+cMx82uZLOpmDKVS8FhbYAc5Y4aFHoXhHAcFBj
	 TYHredIeaWyq5kaXNleXA/JqKTmQ3cqyW9kJ/fJQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CD34F801D5;
	Sat, 27 Mar 2021 00:43:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 511FDF8016B; Sat, 27 Mar 2021 00:43:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02B46F800D0
 for <alsa-devel@alsa-project.org>; Sat, 27 Mar 2021 00:43:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02B46F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qDtAynPU"
Received: by mail-ej1-x62c.google.com with SMTP id hq27so10800002ejc.9
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 16:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=ZcwgrhehNHleImw9fRqp8leB18AJZHMX8Rff9F1AdTs=;
 b=qDtAynPUlzzK/7eyABQUOFvY6UKQMmZ5N5q/v+nZkHN/v/SG4q1vUDeBOtARQ2xyJV
 blaNP/Df5r/DmLTnaAfi8H5UmgU/5C2fGD/b2yDVrU1OQgY18/wUuV0NQMWQ9q8tZQAu
 mBP5DZZnPxHwHPqlbxtYsfijFI+34fe4I3BMcE5I1HOvH4mWDSHklIuVLmZdHgzLawha
 LTXJTrZhfcL1+0IFxEGjinFT4r6pbuF4p5Vl7givJHA0Fqy9kydVRRPTn6AIGO+3GnCp
 iizb1uvDl50+OW/s1uwVOmF499LoCvtOL7yfzbFaCVEQMr/jkR+5ymJtNMGsW86dCM/T
 5/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=ZcwgrhehNHleImw9fRqp8leB18AJZHMX8Rff9F1AdTs=;
 b=sARA2v98JmV7BL2A3RsfhF7bqEFvkHxYPkgjabN+OWsbW9DsuKzPb1LMElUuiPtj/t
 hL6Tr3T397sx6gTkNKA1zGAfbMxisVyYI2y7XU9+LHDeAcdfawy8Zby7+TOMJ2HO2OGi
 ZKlYIqfjtEJQ98ozPtrIVseH/rhSjFE2207eUFQ60FQ30HVzfJVv0s8KGbiCrd5OCZEf
 H8Dm85cdBsNplI5ADI7oqXynolUapvahQZS5/EfxL6CLMjtfoVnRU9Bnnw5oFi5FcPTD
 wT2yOV2VWIhAaZeiTrh0r/m/wgrdfN2upJOLYNwWWuIziZ8H1nPst6OjZtoR2mqMHFnN
 hM/A==
X-Gm-Message-State: AOAM531xgyN5VuS9rbAWdDScEnbi4OPSTTrtc2m5m5cmSe+8mJWptWOP
 uPc2//Ms86n6TMvYFde/Uq6a1RX9TYNLYe2BpQQd+Kx1a8c=
X-Google-Smtp-Source: ABdhPJxuMQhg2sfDPa7lh58lWyerH0+eT9bt+ClSTovvxr+4GuMnaQLlp1Dd3w3d8ByIVCrTNEAA7BQAFnSfDnlX1zg=
X-Received: by 2002:a17:906:a51:: with SMTP id
 x17mr17918849ejf.25.1616802181496; 
 Fri, 26 Mar 2021 16:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAOsVg8r+7utMRpxkwpsRoPCqFX3Q9GfRsSskKwuAZ1tLiCSLTQ@mail.gmail.com>
In-Reply-To: <CAOsVg8r+7utMRpxkwpsRoPCqFX3Q9GfRsSskKwuAZ1tLiCSLTQ@mail.gmail.com>
From: Lucas <jaffa225man@gmail.com>
Date: Fri, 26 Mar 2021 18:42:50 -0500
Message-ID: <CAOsVg8ptS3d351_P8s51PzOZyq+VCXYvZteZm87w2Pimqx-Zpw@mail.gmail.com>
Subject: Re: Patch for some Roland devices' USB digital audio
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Soon after posting it, I realized that output inclusion is implied for
anything using USB implicit feedback.  So, now I've tested that on the
"Boutique" D-05 and VG-99.  They seem to be working as expected.
There is one caveat, namely the D-05's analog outputs aren't as clean as
the other two devices, with little quiet occasional clicks sounding
something like dust on an LP record's play.  Possibly that can be chalked
up to it having only 1/8" minijack connections, but I suspect something
more driver-related as I've not noticed it during use as a synthesizer.
Its firmware version is "1.02(1033)," so not up-to-date which may mean it's
just the hardware itself, but I've decided not to risk any changes with it
yet.  If I knew I could revert it, that would be another story.  Also USB
captures from it, play perfectly cleanly on my usual sound device, the
Edirol UA-4FX.

You probably already know this, as someone coded them, but here are the
commands I've had to use for format compatibility with these devices:

D-05:
  arecord -D hw:Boutique -f S32_LE -c 2 -r 96000 ./file.wav
  aplay -D hw:Boutique -f S32_LE -c 2 -r 96000 ./ile.wav
INTEGRA-7:
  arecord -D hw:INTEGRA7 -f S32_LE -c 2 -r 96000 ./file.wav
    (then change MENU->SYSTEM->SOUND->Sampling Rate to 44.1 [kHz]
(otherwise its 96[kHz])
     and  change MENU->SYSTEM->SOUND->Ext Part Source Select to USB AUDIO)
  arecord -D hw:INTEGRA7 -f S32_LE -c 2 -r 44100 ./file-44100.wav
  aplay -D hw:INTEGRA7 -f S32_LE -c 2 -r 44100 ./file-44100.wav
VG-99:
  arecord -D hw:VG99 -f S24_3LE -c 2 -r 44100 ./file.wav
  aplay -D hw:VG99 -f S24_3LE -c 2 -r 44100 ./file.wav

I have another of the devices I added, with the patch, arriving soon (the
R-26) so I'll have to get back to you with how that works too.

Thanks to anyone looking into adding this,

  Lucas

On Thu, Mar 25, 2021 at 4:18 PM Lucas <jaffa225man@gmail.com> wrote:

> I don't know if the D-05 and VG-99 have digital audio playback/output, as
> I only tried it with the INTEGRA-7.  It does work, but only when the
> INTEGRA-7's "Sampling Rate" is set to "44.1 kHz" and "Ext Part Source
> Select" is set to "USB AUDIO".
>
