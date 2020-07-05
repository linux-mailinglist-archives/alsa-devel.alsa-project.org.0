Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B96502149DF
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jul 2020 05:44:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC49F16B0;
	Sun,  5 Jul 2020 05:43:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC49F16B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593920670;
	bh=6NLk9kxfB9NifSC8qM7HHRRcGwOajkI+N6rXtbLiKTQ=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=h3xNpoVbuXrlVVyAaqlwJ38VrdXOy1xZExOcemgAy+2GpRC5hx1B8+l84JElbqTIO
	 7Tn/+cYtc4+8mFbquW2E79XR65SvUzaLGEyY09OsgJJmnypKqkfziENUjikw5hM9ll
	 WWgDr8pJtJa+4ayk8rPXM3KoLolXw83dplpa4j+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1140BF80216;
	Sun,  5 Jul 2020 05:42:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 341BDF80216; Sun,  5 Jul 2020 05:42:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0A27F800DA
 for <alsa-devel@alsa-project.org>; Sun,  5 Jul 2020 05:42:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0A27F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Em3mLVBJ"
Received: by mail-wr1-x436.google.com with SMTP id z15so25952815wrl.8
 for <alsa-devel@alsa-project.org>; Sat, 04 Jul 2020 20:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=JpsMVBhQ0eJujSA2LTKBZYrXPuJgPEWcLG+df8QBVNA=;
 b=Em3mLVBJym41MTcQtAE6dsukSry4HLq0gOdmLnW+KDt3mroMXQecV9M6vHIspG3mMQ
 mLIl+7VWPsYC9k1Se62MZm5cH0gMwUdrAslQlZT52bINCFb6UejYbkss+SLieuy3vGwz
 JCAPX26vxsgCzQWf5Hwu1O10fepstrp3AhhOdM/dFu7sb4c3BdWHCDb/nbPnoObIwKBi
 1/ZM+7D5+1h7WmomoWln8+JmKjHza9QkISnhj578CzajaWkMXkbG0dvz9FH9jBpyZUW1
 wJzfCrF9wBiOMYcbTgciYaF4Co0xCComArAEtwsOggmM2AshdHSZU3XCpHYD56ePVfcA
 Jw2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=JpsMVBhQ0eJujSA2LTKBZYrXPuJgPEWcLG+df8QBVNA=;
 b=tsDwEP6yaIlq6/yusvXI9MujsIXuIUhzRNp4Gm4kdCjPvlvk0mvzEph8X0g77ZgBPW
 0xpls43ACrzToCKO+4uBBTORdngHN03VDmtFsDuV121llPGXfHtCvT18zGpL9OoD8hJ4
 u7Hsnw85nNaB9iOdQ54fqJLnA3Ew4ZWpEv6wV/NBZNmPjK2lyR6Q9Lh/uiRP6k18Brwr
 swQPDG6dRWwePLMc4saF9Ks4O3ZOdxtu/0AGYXcLvbdwLDxn2Vl7RU0JYxih7gamMG29
 Lsq/FoE8b09KLerzT/HBpEOjbMsrI9hVY0Gr7L1JHrm2qo8qFVVYa3bvv2LUt7DASvY9
 KPYg==
X-Gm-Message-State: AOAM531owQpPkuIUXQG+eR5jJwej4MZtMOSD26x7SwgoNWOZpayg99Oq
 8sPohiOFApM1rphVqJgEWbYgA40R5IUq57vQC9kxINnWIL4=
X-Google-Smtp-Source: ABdhPJyc9sO5CRZ/CyU180aOmFeSlbEqwYse41JpNVJhT1duEN5BlGhmptbUjg2b+21q9jGm1iu3lo+QdTagw4vB9rE=
X-Received: by 2002:adf:ebd0:: with SMTP id v16mr36670865wrn.241.1593920559760; 
 Sat, 04 Jul 2020 20:42:39 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?0KHRgtCw0L3QuNGB0LvQsNCyINCQ0LvQtdC60YHQsNC90LTRgNC+0LI=?=
 <lightofmysoul@gmail.com>
Date: Sun, 5 Jul 2020 06:42:29 +0300
Message-ID: <CAEo19OgAGRWGsaPZ9G=xYcdC=MgyO9jdH365ZMmS--o5BoWFKw@mail.gmail.com>
Subject: Some questions about asoc codec mixer elements naming
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
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

Hello.

I am writing an asoc codec driver and stuck with mixer and output
naming. Could someone clarify a few things?
This codec has two playback PGAs and 4 outputs:

PGA1 ->  [Speaker,Headphone,Line Out]
PGA2 ->  [Mono Output]

[PGA1] controls volume and mute for all three outputs.
[Speaker,Headphone,Line Out] have only mute.

[PGA2] controls volume and mute.
[Mono Output] also has mute.

Codec is bound to platform driver via simple-audio-card:
simple-audio-card,widgets =
    "Headphone", "Headphones",
    "Speaker", "Speakers",
    "Line", "Line Out Jack";

simple-audio-card,routing =
     "Headphones", "HPOUT",
     "Speakers", "SPKOUT",
     "Line Out Jack", "LINEOUT";

Is it possible to name mixer controls so that no further configuration
is required when the driver is loaded?
i.e. pulseaudio automatically detects all these outputs and controls,
correctly maps them and allows switching between them?

Currently i have this configuration(simplified):

SOC_DOUBLE_S8_TLV("Master Playback Volume", PGA1, ...)
SOC_DOUBLE("Master Playback Switch", PGA1, ...)

SOC_SINGLE("Speaker Playback Switch", ...)
SOC_SINGLE("Headphone Playback Switch", ...)
SOC_SINGLE("Line Out Playback Switch", ...)

SOC_SINGLE_S8_TLV("Mono Output Playback Volume", PGA2...)
SOC_SINGLE("Mono Output Playback Switch", PGA2....)

With these settings pulseaudio only detects Speaker and Headphone (but
not Line Out because it wants to find its Jack)
But as I understand "Master Playback" assumes control for all sound
streams, so this is probably not correct =\

If it is impossible to name those elements that way so everything is
autodetected, what should i use then? Write a machine audio driver or
use alsaucm?
