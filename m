Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A3DACF75
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Sep 2019 17:25:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AEBB1667;
	Sun,  8 Sep 2019 17:24:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AEBB1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567956343;
	bh=JDDIN/oOoDvrGmrLvQ70toilKikVbVb3LM4g0rePAm8=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=j8/YoL+/zUndJkGwenYpZO5o6wc2sXN6hRouq79/ayqjbexoolWyb60yB03xiQ6Bv
	 +P9tqKtwk9JdvfOWq9smV3OI5/33/TDZS5SfBISy4/c4TCIOS8gEudEOA1flFhGWE9
	 nCdyljnCQSmeCQFohi91FnTRLai1VyuMHktEXSn8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA762F80368;
	Sun,  8 Sep 2019 17:23:58 +0200 (CEST)
X-Original-To: Alsa-devel@alsa-project.org
Delivered-To: Alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17078F80368; Sun,  8 Sep 2019 17:23:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4E03F80157
 for <Alsa-devel@alsa-project.org>; Sun,  8 Sep 2019 17:23:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4E03F80157
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Vhj5UVXD"
Received: by mail-qk1-x736.google.com with SMTP id f13so10442759qkm.9
 for <Alsa-devel@alsa-project.org>; Sun, 08 Sep 2019 08:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=gMp2jtqsNn33IZhqUINmLTf1n/0uL3rUnHKsc9QARK0=;
 b=Vhj5UVXDLAl5J5dCDRSofMw83ppdXb0s1xYKnFJtupgM199HVytPdhxyO7JPmuHo9A
 siPd4ypLXuyUSRY7CyRgzq6elk9H7MXjRY6UsQ1ipjw2/v9x8x/aznntAddcApsLdLsh
 MtccC9V1EStiILcCTiBtswCkr4A2bEgubJJG/vWs8SouMpfbfmWU9XKplwCufoDwlz0p
 1iuLq7rsrb5h2hZp136tiqHvCtS99hzdrUmyuUllRjvzmFQzC3QwBPh6Iyx5W74+p4MO
 ROECbXMjzCBT1pzjJgkyXUzCUaSdu6hi2/raMzM3SnxJjCQpPwUOTJI8xg2H4EfpV6/5
 ojFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=gMp2jtqsNn33IZhqUINmLTf1n/0uL3rUnHKsc9QARK0=;
 b=GGuOXwRU2R7ki4pyPPWBm/KpFKLhNXnjDbZJntMSd4gBcmnWC4z3XaRX0mu0B9pA0i
 1jfPM03eHguEggBrrKa+vmSJO1U7mfYfMYPHDz6vYT8yhNnouWXgzsDC0VaLzcMe6tTS
 zwcnPTAJDWRFCpTMtnM18dH+jrNx9jOLakFq+1S0PU4OiAFkK4FFxoGU5gEpk2XVr9Om
 4RexE92FnnZv6uq9zLvnaKv+f24H7FW2FdOmen8mDBkdGC2nDonSAKc4oiAAQJZK1Nhi
 s/nb+UwUMMmBQpRC4bkuq+uaXv+3JyLZ1zUCTYR2NmL+8pSUHScSPL2XC6lYVrCDw7d2
 8teA==
X-Gm-Message-State: APjAAAUdl73Gk0XRmJwsH+0se4p6WulX0j80OjJD1xRAuTMNDpDDgfZn
 NofgBNAJpPhtcY3JODSUsv9fQ79ZaqcFiHvLgiUeMuuy
X-Google-Smtp-Source: APXvYqyOKsYAyRaj9iT39maF5CF5HCVrma2vYq0oiUWkdxSBaaP7qnkUbQD+/rwX7HIe+exfKMQaD9zaGKzGyGeMPtk=
X-Received: by 2002:a37:a946:: with SMTP id s67mr19467901qke.470.1567956228072; 
 Sun, 08 Sep 2019 08:23:48 -0700 (PDT)
MIME-Version: 1.0
From: Pavel Hofman <pavhofman@gmail.com>
Date: Sun, 8 Sep 2019 17:23:36 +0200
Message-ID: <CA+SWvNx9hGJN0v9erykioJUKyd726VzfP4b77u0RUHh_mgFooQ@mail.gmail.com>
To: Alsa-devel@alsa-project.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] Measuring Device Throughput - MMAP vs. RW
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

Hi,
Gathering data for USB async gadget feedback (
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-August/154819.html
) requires measuring average data rate to/from a device. For testing I
added measuring/averaging code to methods snd_pcm_hw_writei, snd_pcm_hw_readi,
and snd_pcm_hw_mmap_commit in
https://github.com/alsa-project/alsa-lib/blob/master/src/pcm/pcm_hw.c . In
all cases I take the parameter "size" of all the three methods as the
number of samples written/read.

RW: The averaging works very well for R/W access (hw:X) for playback and
capture, I get same values on the same device (playback/capture timed by
one clock).

MMAP: When mmap is used (e.g. plughw:X + sample format conversion), I get
very stable results for MMAP playback on all soundcards I have tested. But
for capture I get identical results to playback for one soundcard (PCI
Envy24), while the averaged rate calculated from "size" in
snd_pcm_hw_mmap_commit fluctuates for capture on Intel HDA.

The averaging is simply summing "size" in every call of the method and
dividing by passed nanosecs every approx 10 seconds:

Working OK (Infrasonic Quartet, and all soundcards for read/write mode):
Playback
MMAP Time: 19440.900391, averaged samplerate: 48000.511829
MMAP Time: 19451.140625, averaged samplerate: 48000.360218
MMAP Time: 19461.380859, averaged samplerate: 48000.176846
MMAP Time: 19471.619141, averaged samplerate: 48000.664570
MMAP Time: 19481.861328, averaged samplerate: 48000.199970
MMAP Time: 19492.101562, averaged samplerate: 48000.589854
MMAP Time: 19502.341797, averaged samplerate: 48000.288977
MMAP Time: 19512.580078, averaged samplerate: 48000.516104
MMAP Time: 19522.820312, averaged samplerate: 48000.225282

Capture:
MMAP Time: 19454.578125, averaged samplerate: 48000.430766
MMAP Time: 19464.818359, averaged samplerate: 48000.397611
MMAP Time: 19475.056641, averaged samplerate: 48000.400049
MMAP Time: 19485.296875, averaged samplerate: 48000.293275
MMAP Time: 19495.539062, averaged samplerate: 48000.549048
MMAP Time: 19505.779297, averaged samplerate: 48000.445214
MMAP Time: 19516.017578, averaged samplerate: 48000.417299
MMAP Time: 19526.257812, averaged samplerate: 48000.376264
MMAP Time: 19536.498047, averaged samplerate: 48000.422957
MMAP Time: 19546.738281, averaged samplerate: 48000.538619
MMAP Time: 19556.976562, averaged samplerate: 48000.241647
MMAP Time: 19567.216797, averaged samplerate: 48000.447243

Fluctuating Capture (Intel HDA):
Playback - OK:
MMAP Time: 19574.498047, averaged samplerate: 47998.971874
MMAP Time: 19584.568359, averaged samplerate: 47998.871734
MMAP Time: 19594.636719, averaged samplerate: 47998.929850
MMAP Time: 19604.707031, averaged samplerate: 47998.972555
MMAP Time: 19614.775391, averaged samplerate: 47998.925531
MMAP Time: 19624.845703, averaged samplerate: 47998.893351
MMAP Time: 19634.916016, averaged samplerate: 47998.949489
MMAP Time: 19644.986328, averaged samplerate: 47998.593678
MMAP Time: 19655.056641, averaged samplerate: 47999.230857
MMAP Time: 19665.125000, averaged samplerate: 47998.777034
MMAP Time: 19675.195312, averaged samplerate: 47999.177460
MMAP Time: 19685.263672, averaged samplerate: 47998.798503

Capture - fluctuating, clearly some samples are not counted:
MMAP Time: 19539.853516, averaged samplerate: 47191.039837
MMAP Time: 19549.923828, averaged samplerate: 46369.921890
MMAP Time: 19559.994141, averaged samplerate: 47998.831508
MMAP Time: 19570.148438, averaged samplerate: 47190.998307
MMAP Time: 19580.302734, averaged samplerate: 47191.275432
MMAP Time: 19590.373047, averaged samplerate: 47998.894343
MMAP Time: 19600.443359, averaged samplerate: 47998.906779
MMAP Time: 19610.511719, averaged samplerate: 47999.174771
MMAP Time: 19620.582031, averaged samplerate: 47998.747971
MMAP Time: 19630.650391, averaged samplerate: 47998.881964
MMAP Time: 19640.722656, averaged samplerate: 47998.999974
MMAP Time: 19650.791016, averaged samplerate: 47998.769240

I suspect the size parameter of snd_pcm_hw_mmap_commit is not the actual
amount of samples read during the MMAP capture. Please how to calculate the
number of samples read from the variables available in that method?

Thanks a lot.

Pavel.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
