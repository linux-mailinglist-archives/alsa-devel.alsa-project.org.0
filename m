Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D744AEADA
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Feb 2022 08:15:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F582187B;
	Wed,  9 Feb 2022 08:15:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F582187B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644390958;
	bh=kAyYrRm9RURN1R+wVfTuXkSWdRa09rUJgLiLBOLXQrk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mrEWdPFpCVKGgcG8MQBZ7kauJwVlyLnIhtopwsYYc2QmYLERSUtXdLFawaIvFBPwV
	 u6ImXhw4Lkhcmm6OeRPqCZOKQZGEzdOiFtiVs6Ud7HUnkSCHt+RWpMLaZtBhDmp4Ss
	 1IqtKh55t+Ue1c69hFZkaJY9deQsJXsVuFORA0Pw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E8C0F8016B;
	Wed,  9 Feb 2022 08:14:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F6B8F8016A; Wed,  9 Feb 2022 08:14:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,MIME_HTML_ONLY,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.web.de (mout.web.de [212.227.17.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59811F800A7
 for <alsa-devel@alsa-project.org>; Wed,  9 Feb 2022 08:14:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59811F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="nArzUzHJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1644390880;
 bh=MEoaMzVESXUBRSJO2YgU3U5Am+Mlnfm5fvmShg8aQ1o=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=nArzUzHJUH1w8PUAIE0l5L2fnH+bw21hFRvrNbFDD90HfRmCf5ugU3MqVwAFbE1y4
 iRajVC3MaIWAEQVsDptTn/cp+rKnV1zRihkTbIM99nvWmNv/qG+UqPJXvr7vHFdzuw
 N7Yb2h6gkk7kuhvXxOmlqxaDnOXKd4xpIq7N6/OA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [87.134.109.82] ([87.134.109.82]) by web-mail.web.de
 (3c-app-webde-bap12.server.lan [172.19.172.12]) (via HTTP); Wed, 9 Feb 2022
 08:14:40 +0100
Message-ID: <trinity-c5ab92fd-fbab-4431-8579-f8576a9ba71e-1644390880605@3c-app-webde-bap12>
From: dmummenschanz@web.de
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: Aw: Re: Cannon Lake PCH cAVS (ALC892) not detected by kernel driver
Date: Wed, 9 Feb 2022 08:14:40 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <209270c3-4a46-d6a1-0f1d-d4400ecc5962@linux.intel.com>
References: <trinity-f018660b-95c9-442b-a2a8-c92a56eb07ed-1644345967148@3c-app-webde-bap22>
 <209270c3-4a46-d6a1-0f1d-d4400ecc5962@linux.intel.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:Y6Js/e12ZJeGfHkVOjXVYMlH+KLzZdYx44h2sK9k+Z0mqiiFClJJFAZHgTyBJHUrTs4LD
 954F5OKLO9V8z8IQ+ZDuPAzMhMWi1Nr+gojCxU5Exk0KDrvVjunmJFaR1O4zENpFOIeKjohvVWxz
 xs0nmD8wQruomUg3NnVNqxaH3xk5FrG868qBWAwoJU6Qsoibx0YzAkHwzbe1tDcnOyA2KYyyxWAU
 kzz3q2d+RZgx18xcbQVdTtLfgxqKI0pKfsIdGono+YkkckcAei/jgWUWpKi7EwaOlSa3PtijpZwg
 bw=
X-UI-Out-Filterresults: notjunk:1;V03:K0:erWU1ZirkWg=:QIGmcMQJJYhjidqCdKpVBA
 ejOi5a/Z4ha1NnFvpFK4aWQO4Ew5zXIemEnv0/nH6oyF2QkYX1enDEeuGhtG6VGL0DovnRNv9
 gB0nB30j9VfVcFIpr4rX5CNWF2aiyV58cuAvfUSvUTdGcnZ1fmh6+84bfk0OxyFEDIjKqerHy
 84rRes4jIE2AFLBzPewjw2ar0y372w0LHZArLKXe1BR8/l9tPDEHi9vF4eve/+nzb1egiH3H0
 yjBx1m1WsJZENQvNW1t2FXxsW62An5e/NNMxcsdHk0ZGxxjOv6JWf696xPyLgz/z3JZVP4kRY
 r0L1NahNbysCzfc7dFQLrkNWSYeP/CkNioUbBCEqgYyFVIpFbsq2OIR7/Ps4XWO1XkE16hMk6
 Q04/DXmPSGz5mwO1rPRz45Mzy16TI9o20vCrBslzFB7Sk/MuE8jdla3a4tL7H3ET/VPdH28W5
 1Qav3iROwMaaU02udazcY4GeKJk3BR+Y5a1/0iZizLJ0zoBxDkU4gxQKA7uWLgRhuzA6dfmnZ
 4OAVWZts637sxEbOyyXtuEw//zDZLs/TVaJtAoL/ueP7cqARUc/p25Zlca760KoI+eSX2R7fB
 P2NPL4CDQ1Z6eokdWHXxuWzGqr/ueSpDGdyysvokb+3El5K7ISX3Sp7A0kknO6Yzlnrcn5Hm3
 arfM6CujaKa0kTkRGGLbsFb+M/1j6EB5nnLsX4BRlMlseR8jQ16v/pQRsfPHe5Am48oVGw8Dn
 QtSAbfHy03iBZ0jglob6CF0uOxxsTpsDHhP7hF2O7lp6J2gBzTwnKCLVBtpe22JPEUJ5Fsxiq
 RLsCoKT
MIME-Version: 1.0
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

   The information about the codec is based on the string windows
   provides:

   HDAUDIO\FUNC_01&VEN_10EC&DEV_0892&SUBSYS_15580351&REV_1003\4&16AF2B56&&
   0001

   Here is the alsa-info output for the 5.16 mainline kernel:

   http://alsa-project.org/db/?f=38c48cd24dc4ba9a9487dd96f857120cc9ce4367

   Kernel config for the sound part:

   CONFIG_SOUND=y
   CONFIG_SND=y
   CONFIG_SND_TIMER=y
   CONFIG_SND_PCM=m
   CONFIG_SND_HWDEP=m
   CONFIG_SND_RAWMIDI=m
   CONFIG_SND_JACK=y
   CONFIG_SND_JACK_INPUT_DEV=y
   CONFIG_SND_PCM_TIMER=y
   CONFIG_SND_HRTIMER=y
   CONFIG_SND_DYNAMIC_MINORS=y
   CONFIG_SND_MAX_CARDS=8
   CONFIG_SND_PROC_FS=y
   CONFIG_SND_VMASTER=y
   CONFIG_SND_DMA_SGBUF=y
   CONFIG_SND_CTL_LED=m
   CONFIG_SND_PCI=y
   #
   # HD-Audio
   #
   CONFIG_SND_HDA=m
   CONFIG_SND_HDA_GENERIC_LEDS=y
   CONFIG_SND_HDA_INTEL=m
   CONFIG_SND_HDA_HWDEP=y
   CONFIG_SND_HDA_RECONFIG=y
   CONFIG_SND_HDA_CODEC_REALTEK=m
   CONFIG_SND_HDA_CODEC_ANALOG=m
   CONFIG_SND_HDA_CODEC_SIGMATEL=m
   CONFIG_SND_HDA_CODEC_VIA=m
   CONFIG_SND_HDA_CODEC_HDMI=m
   CONFIG_SND_HDA_CODEC_CIRRUS=m
   CONFIG_SND_HDA_CODEC_CS8409=m
   CONFIG_SND_HDA_CODEC_CONEXANT=m
   CONFIG_SND_HDA_CODEC_CA0110=m
   CONFIG_SND_HDA_CODEC_CA0132=m
   CONFIG_SND_HDA_CODEC_CA0132_DSP=y
   CONFIG_SND_HDA_CODEC_CMEDIA=m
   CONFIG_SND_HDA_CODEC_SI3054=m
   CONFIG_SND_HDA_GENERIC=m
   CONFIG_SND_HDA_POWER_SAVE_DEFAULT=5
   # end of HD-Audio


   Also tried current ubuntu distro with same results.

   Any advice?


   Gesendet: Dienstag, 08. Februar 2022 um 22:55 Uhr
   Von: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>
   An: dmummenschanz@web.de, alsa-devel@alsa-project.org
   Betreff: Re: Cannon Lake PCH cAVS (ALC892) not detected by kernel
   driver
   On 2/8/22 12:46, dmummenschanz@web.de wrote:
   > Hello,
   >
   > the audio chip Cannon Lake PCH cAVS ALC892 does not get recognized on
   > my system. Only the HDMI devices are recognized.
   >
   > lspci shows the following audio device:
   > 00:1f.3 Audio device: Intel Corporation Cannon Lake PCH cAVS (rev 10)
   >
   > dmesg only shows:
   >
   > [ 189.559786] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops
   > i915_exit [i915])
   > [ 189.581395] input: HDA Intel PCH HDMI/DP,pcm=3 as
   > /devices/pci0000:00/0000:00:1f.3/sound/card0/input20
   > [ 189.581503] input: HDA Intel PCH HDMI/DP,pcm=7 as
   > /devices/pci0000:00/0000:00:1f.3/sound/card0/input21
   > [ 189.581628] input: HDA Intel PCH HDMI/DP,pcm=8 as
   > /devices/pci0000:00/0000:00:1f.3/sound/card0/input22
   > [ 189.581711] input: HDA Intel PCH HDMI/DP,pcm=9 as
   > /devices/pci0000:00/0000:00:1f.3/sound/card0/input23
   > [ 189.581849] input: HDA Intel PCH HDMI/DP,pcm=10 as
   > /devices/pci0000:00/0000:00:1f.3/sound/card0/input24
   >
   >
   > ALSA-info file:
   >
   [1]http://alsa-project.org/db/?f=96102ee84f258d1cac83ed3379535655018151
   1c
   I see to references to ALC892 in this profile, is this information
   based
   on the hardware specs or Windows logs?
   we usually ask people to try with a more recent kernel, but in your
   case
   I would try to go back to a mainline release. I have no idea what this
   version might contain audio-wise: 5.17.0-rc3-drmtip
   >
   > There is a workaround availble:
   >
   > echo auto | tee /sys/devices/pci0000\:00/0000\:00\:1f.3/power/control
   > echo 1 | tee /sys/devices/pci0000\:00/0000\:00\:1f.3/remove
   > echo 1 | tee /sys/bus/pci/rescan
   >
   > unfortunately this doesn't work for me. The device never shows up.
   > Sound on winX works fine on this device btw.
   > I'm happy to assist with any attempts to make the sound work.

References

   1. http://alsa-project.org/db/?f=96102ee84f258d1cac83ed33795356550181511c
