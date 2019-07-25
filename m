Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6573977755
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jul 2019 08:47:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBF302059;
	Sat, 27 Jul 2019 08:47:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBF302059
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564210076;
	bh=TPzBXH97jfQQ4BU+rZzDwSnRtMs8PNU/eAXgn0CAsPU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Bctn11KDemibCI7nxb6j3Q1HfD5YUx34qzTE3ICaNxV8H0GElWdYZ0zBjcedf2amH
	 WJMyUS9sxchWglKiTKMvQTghmAZ0318b8t+o1H12+EdqE6WZ4doRbD+ZFs0Sk7xQnn
	 /xKuY5BC5eZLQYgADWKFOLo6KN9y7RHcoyMc8QnE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55F73F804CC;
	Sat, 27 Jul 2019 08:43:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DE83F803D0; Thu, 25 Jul 2019 17:06:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,MIME_HTML_ONLY,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25C9FF8015A
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 17:06:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25C9FF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net
 header.b="UNnzeRUg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1564067187;
 bh=nZdAlE6LEKH5uZ/WWxENaDagon5dPMTHrRFxbOQdUIY=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=UNnzeRUg1h6VOCM3NbFO9szAOstxA/REMua48UMNdBnihRihX0dSQ0C8GDA2dJ7rj
 SSJCthM7sCx7/5kaEIpzFxTuX3Uo3T//953gcbD1dWDG2gzBBnX+k+geyIC4WGLOxw
 yoUA30Fduss4Hwm3uSCsF0Nt8HuS7AjV0BfmUsAI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.110.102.68] ([80.110.102.68]) by web-mail.gmx.net
 (3c-app-gmx-bs19.server.lan [172.19.170.71]) (via HTTP); Thu, 25 Jul 2019
 17:06:26 +0200
Message-ID: <trinity-99f29eaa-68be-4969-9769-07d51a51e210-1564067186868@3c-app-gmx-bs19>
From: "github repository" <githubrepository@gmx.net>
To: alsa-devel@alsa-project.org
Date: Thu, 25 Jul 2019 17:06:26 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:sVggSt7xdyNqoA+PsLY6Oa2Sj/ccny6i3pGOddQ8Sodd7667W3yIBEy4NDRbTBrCDoJXS
 FsyYXbBP3KhZjURdIs44Q8uzVU2A8/fgu3y/DSAuyN9CYpa3IoAcbvFLiDqfiriYJqEdnCoLDdWS
 6kqkD3424NjfF47VQYQjdldbT/It0ADizm9hC0lwFgxlx+l0UcpbZ+9V2qleqkUKBDuS3vAMgdsN
 yxB2pqNCpnBcPULuyefduBGb74nuOwr1JauNd4shST5DbiMenJUUe88CKlUWdeveU0/F49rCgbRL
 lg=
X-UI-Out-Filterresults: notjunk:1;V03:K0:3D5/0tXcisY=:DQgcxH8su2TWGH3spfqo+a
 zVHoiWcm1vtmC6FuUvyzEOCcWRfgNtxHLCTjqlNuFHN6MgH4ZpXByNXcXxPm8CNQCdF2msVTR
 ++kYMpz0zthbvT36uJt4p4r/1J4Bv8f0NdAeaVxpVY8Db2n35szW0tSOiDmmBkeYvt5Cmhg6j
 LzZ8SaAHcchZ118iZf/TahrdkK8UkYLIN7+70zWRhOyxa6HPogn3wCssmahRSPYDKqyaOinEK
 4QzHByNS4h7Lbvqf7uck5ERaYF0JC3Q3DWtG9r/HR2q49tBPjdzOff+eVfQ1WNjlQd6hDcsVs
 URZThz2M5irbW2KbmGKq1ubFsrVbnCsEyGiSt04pEE4wCWk6PYqnVMUcejPV+82Kj63CPgomY
 Z0gJEKEi/iuRlHnB6LN3r5Hlz4gW8efdoCjIUlpTHKTS1HkXB4oWoqbFCANx/To9QpUgsv5Ij
 tCOfy3Oc9W8EftPCFJWACqFiN1jcIFL1qSaI3n0ce4w58Q99VAMif0z6nCSjOjLM2LpAizfyH
 sndQDUUjrf5t23YpEM0+lv6KPbZLauCysGGGxW/9rPamgb1k1DvOh2Tq4O0J/I8M2HTbnHD++
 FrOxgwmKTiyABbJUepRwCin5I0C3BwsnGXdeZ1aAW6BRykHtJ5Aw/jHKa29AGksUeANSjdGwH
 GNIg=
X-Mailman-Approved-At: Sat, 27 Jul 2019 08:43:35 +0200
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] Kernel 5.2.2 - RSpeaker not working - MacBookAir 3,2
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

   Ladies and gentlemen,

   I tested alsa on Kernel 5.2.2 on an MacBook Air 3,2 with alsa-lib
   1.1.9, fftw 3.3.8, ncurses 6.1. Somehow I was not able to get the right
   speaker to work. On Kernel  4.19.60 everything works. Same setup
   different results. Distribution: Arch Linux


   lsmod | grep snd

   snd_hda_codec_hdmi     65536  3
   snd_hda_codec_cirrus    20480  1
   snd_hda_codec_generic    94208  1 snd_hda_codec_cirrus
   ledtrig_audio          16384  1 snd_hda_codec_generic
   snd_hda_intel          49152  0
   snd_hda_codec         155648  4
   snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec_ci
   rrus
   snd_hda_core          102400  5
   snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec,sn
   d_hda_codec_cirrus
   snd_hwdep              16384  1 snd_hda_codec
   snd_pcm               135168  4
   snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec,snd_hda_core
   snd_timer              40960  1 snd_pcm
   snd                   106496  7
   snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hwdep,snd_hda_intel,snd_hd
   a_codec,snd_timer,snd_pcm
   soundcore              16384  1 snd


   aplay -L

   null
       Discard all samples (playback) or generate zero samples (capture)
   default:CARD=NVidia
       HDA NVidia, CS4206 Analog
       Default Audio Device
   sysdefault:CARD=NVidia
       HDA NVidia, CS4206 Analog
       Default Audio Device
   front:CARD=NVidia,DEV=0
       HDA NVidia, CS4206 Analog
       Front speakers
   surround21:CARD=NVidia,DEV=0
       HDA NVidia, CS4206 Analog
       2.1 Surround output to Front and Subwoofer speakers
   surround40:CARD=NVidia,DEV=0
       HDA NVidia, CS4206 Analog
       4.0 Surround output to Front and Rear speakers
   surround41:CARD=NVidia,DEV=0
       HDA NVidia, CS4206 Analog
       4.1 Surround output to Front, Rear and Subwoofer speakers
   surround50:CARD=NVidia,DEV=0
       HDA NVidia, CS4206 Analog
       5.0 Surround output to Front, Center and Rear speakers
   surround51:CARD=NVidia,DEV=0
       HDA NVidia, CS4206 Analog
       5.1 Surround output to Front, Center, Rear and Subwoofer speakers
   surround71:CARD=NVidia,DEV=0
       HDA NVidia, CS4206 Analog
       7.1 Surround output to Front, Center, Side, Rear and Woofer
   speakers
   iec958:CARD=NVidia,DEV=0
       HDA NVidia, CS4206 Digital
       IEC958 (S/PDIF) Digital Audio Output
   hdmi:CARD=NVidia,DEV=0
       HDA NVidia, HDMI 0
       HDMI Audio Output
   hdmi:CARD=NVidia,DEV=1
       HDA NVidia, HDMI 0
       HDMI Audio Output
   hdmi:CARD=NVidia,DEV=2
       HDA NVidia, HDMI 0
       HDMI Audio Output

   aplay -l

   **** List of PLAYBACK Hardware Devices ****
   card 0: NVidia [HDA NVidia], device 0: CS4206 Analog [CS4206 Analog]
     Subdevices: 1/1
     Subdevice #0: subdevice #0
   card 0: NVidia [HDA NVidia], device 1: CS4206 Digital [CS4206 Digital]
     Subdevices: 1/1
     Subdevice #0: subdevice #0
   card 0: NVidia [HDA NVidia], device 3: HDMI 0 [HDMI 0]
     Subdevices: 1/1
     Subdevice #0: subdevice #0
   card 0: NVidia [HDA NVidia], device 7: HDMI 0 [HDMI 0]
     Subdevices: 1/1
     Subdevice #0: subdevice #0
   card 0: NVidia [HDA NVidia], device 8: HDMI 0 [HDMI 0]
     Subdevices: 1/1
     Subdevice #0: subdevice #0

   ls -l /dev/snd

   total 0
   drwxr-xr-x 2 root root       60 Jul 25 14:25 by-path
   crw-rw---- 1 root audio 116, 12 Jul 25 14:25 controlC0
   crw-rw---- 1 root audio 116,  8 Jul 25 14:25 hwC0D0
   crw-rw---- 1 root audio 116,  9 Jul 25 14:25 hwC0D3
   crw-rw---- 1 root audio 116, 10 Jul 25 14:25 hwC0D4
   crw-rw---- 1 root audio 116, 11 Jul 25 14:25 hwC0D5
   crw-rw---- 1 root audio 116,  3 Jul 25 14:25 pcmC0D0c
   crw-rw---- 1 root audio 116,  2 Jul 25 14:25 pcmC0D0p
   crw-rw---- 1 root audio 116,  4 Jul 25 14:25 pcmC0D1p
   crw-rw---- 1 root audio 116,  5 Jul 25 14:25 pcmC0D3p
   crw-rw---- 1 root audio 116,  6 Jul 25 14:25 pcmC0D7p
   crw-rw---- 1 root audio 116,  7 Jul 25 14:25 pcmC0D8p
   crw-rw---- 1 root audio 116,  1 Jul 25 14:25 seq
   crw-rw---- 1 root audio 116, 33 Jul 25 14:25 timer
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
