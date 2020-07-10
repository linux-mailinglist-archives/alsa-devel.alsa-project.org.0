Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 882EA21B9A2
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jul 2020 17:33:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 102201654;
	Fri, 10 Jul 2020 17:33:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 102201654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594395234;
	bh=5DM2eEuNjelvVwkrU4C/9OifFDyh8A7XpjaoG3f3d1g=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kFsT6tfTrKChHHRfSGInpCRuDo+wIe/AQDam5Ug1iRsYbxQIVUR3MIAMmZ9IAXpMH
	 y6RAbyPk7P8sqWNwHDCyC/cizPY72DkPBIY7i2T+0JLvDEWktur/QNoKXrmOyCnVJS
	 lSaI0WxrHF6v8yYfhHpWUq5nf+x4Ph3fAb9v/LW4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37963F80150;
	Fri, 10 Jul 2020 17:32:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EED0EF8015A; Fri, 10 Jul 2020 17:32:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A232F80112
 for <alsa-devel@alsa-project.org>; Fri, 10 Jul 2020 17:31:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A232F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=arunraghavan.net header.i=@arunraghavan.net
 header.b="O1ddWBG6"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="YoyBQ2O9"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id B071052E;
 Fri, 10 Jul 2020 11:31:53 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
 by compute2.internal (MEProxy); Fri, 10 Jul 2020 11:31:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 arunraghavan.net; h=mime-version:message-id:date:from:to:subject
 :content-type; s=mesmtp; bh=ck1SxKoegHCcs5Aco581sLOVMUWZu0GunS8P
 mj6tKCk=; b=O1ddWBG6EVbQCR62F/tiykjQ7thiHmIfG5DrslVmJ0dPOhxtD1VO
 SKTN5CfJebXVR71jjoY9JA653Br/tRjKPnK4Ka63gZqrShX2717oHcu+SIySjwE/
 MwDa6l5ZqiWA9y46ee3teCFs8aTxsQaRS7wBqLlfa7p6bgDeZdiemjk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=ck1SxKoegHCcs5Aco581sLOVMUWZu
 0GunS8Pmj6tKCk=; b=YoyBQ2O9FONFRxto/w86qokJMBQ8v5Gn6MPjuySnciI7M
 YnYB5UCHSF2irzlrtx5f2A2R4Ke3KUKFGxQciic7VDjkkS3SaJEjTNXiZbsu0Kt/
 GBLLWiO5ta+vqTtZweMcKbEelDfCbE9qFs1MhGzRjUi4imlu4zYLL3Mb8TfJrGcA
 5M7rm3whoMkUp0HpY59mWLXMmSRNVKnfJt4C5iDWCWQipg38iZj8e2gx3u07GMXV
 LQV0iGzwVW7SiX4rWGAtNjW0vn2yi6xPHJG2wx5cjksGEHzjobp6F9owF0i1iRK0
 DoWIUJjsb9neRH62/D3n6ugXh8acuNMtyRJSyHUrw==
X-ME-Sender: <xms:6IkIX7ZHF3X3qm2HoKn9FWT8OBE_4I6wDWhlYLRaqc6xeCPOL0BHLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrvddugdelfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfffhffvufgtsehttdertderredtnecuhfhrohhmpedftehruhhnucft
 rghghhgrvhgrnhdfuceorghruhhnsegrrhhunhhrrghghhgrvhgrnhdrnhgvtheqnecugg
 ftrfgrthhtvghrnhepudefhfegffektdeijeeuieetvdetudegveeitdevgfeuveeufffg
 tdekhfejtedvnecuffhomhgrihhnpegrlhhsrgdqphhrohhjvggtthdrohhrghdprghruh
 hnrhgrghhhrghvrghnrdhnvghtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomheprghruhhnsegrrhhunhhrrghghhgrvhgrnhdrnhgvth
X-ME-Proxy: <xmx:6IkIX6YoFf1t1lEEI0UPcQLtBe0WpitwGKMf1pGYLBGguotYZKkrRw>
 <xmx:6IkIX9_K7yj0c-NEiY8uk_4Xv9dk8lG2-qJdSA04fR8jy1fWOMdttg>
 <xmx:6IkIXxon1YqqaZu1Ub3NUqOUl24OHaa1twYyeuY0eeYsFQbrP7lCEg>
 <xmx:6YkIXz2zKIG5rgAsBXek1qsoK9AMjbdCgBcLaQ5LMACaA_Mg54D-uELAynE>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9BAE1660069; Fri, 10 Jul 2020 11:31:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-613-g8a73ad6-fm-20200709.001-g8a73ad6e
Mime-Version: 1.0
Message-Id: <a1dfd3f5-812b-48e1-976a-613a2e4f837e@www.fastmail.com>
Date: Fri, 10 Jul 2020 11:31:32 -0400
From: "Arun Raghavan" <arun@arunraghavan.net>
To: alsa-devel@alsa-project.org,
 "PulseAudio Discussion" <pulseaudio-discuss@lists.freedesktop.org>
Subject: Weird jack detection on ASRock B450M Pro4
Content-Type: text/plain
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

Hi folks,
I ran into some weird behaviour on this motherboard. First, alsa-info is here: http://alsa-project.org/db/?f=f48105f391d848b34b3779f27369130ca024f417

The weird behaviour is that the HDA card is picked up fine, but jack detection is broken on boot. However, this gets "fixed" after you run alsa-info. The before/after codec info is at:

https://arunraghavan.net/temp/alsa-codecs-before.txt
https://arunraghavan.net/temp/alsa-codecs-after.txt

The key delta is:

----
@@ -133,24 +133,24 @@
 Node 0x02 [Audio Output] wcaps 0x41d: Stereo Amp-Out
   Control: name="Front Playback Volume", index=0, device=0
     ControlAmp: chs=3, dir=Out, idx=0, ofs=0
   Device: name="ALC892 Analog", type="Audio", device=0
   Amp-Out caps: ofs=0x40, nsteps=0x40, stepsize=0x03, mute=0
-  Amp-Out vals:  [0x34 0x34]
-  Converter: stream=0, channel=0
+  Amp-Out vals:  [0x29 0x29]
+  Converter: stream=5, channel=0
   PCM:
     rates [0x560]: 44100 48000 96000 192000
     bits [0xe]: 16 20 24
     formats [0x1]: PCM
   Power states:  D0 D1 D2 D3 EPSS
   Power: setting=D0, actual=D0
 Node 0x03 [Audio Output] wcaps 0x41d: Stereo Amp-Out
   Control: name="Surround Playback Volume", index=0, device=0
     ControlAmp: chs=3, dir=Out, idx=0, ofs=0
   Amp-Out caps: ofs=0x40, nsteps=0x40, stepsize=0x03, mute=0
-  Amp-Out vals:  [0x34 0x34]
-  Converter: stream=0, channel=0
+  Amp-Out vals:  [0x29 0x29]
+  Converter: stream=5, channel=0
   PCM:
     rates [0x560]: 44100 48000 96000 192000
     bits [0xe]: 16 20 24
     formats [0x1]: PCM
   Power states:  D0 D1 D2 D3 EPSS
@@ -159,12 +159,12 @@
   Control: name="Center Playback Volume", index=0, device=0
     ControlAmp: chs=1, dir=Out, idx=0, ofs=0
   Control: name="LFE Playback Volume", index=0, device=0
     ControlAmp: chs=2, dir=Out, idx=0, ofs=0
   Amp-Out caps: ofs=0x40, nsteps=0x40, stepsize=0x03, mute=0
-  Amp-Out vals:  [0x34 0x34]
-  Converter: stream=0, channel=0
+  Amp-Out vals:  [0x29 0x29]
+  Converter: stream=5, channel=0
   PCM:
     rates [0x560]: 44100 48000 96000 192000
     bits [0xe]: 16 20 24
     formats [0x1]: PCM
   Power states:  D0 D1 D2 D3 EPSS
@@ -172,11 +172,11 @@
 Node 0x05 [Audio Output] wcaps 0x41d: Stereo Amp-Out
   Control: name="Headphone Playback Volume", index=0, device=0
     ControlAmp: chs=3, dir=Out, idx=0, ofs=0
   Amp-Out caps: ofs=0x40, nsteps=0x40, stepsize=0x03, mute=0
   Amp-Out vals:  [0x00 0x00]
-  Converter: stream=0, channel=0
+  Converter: stream=5, channel=0
   PCM:
     rates [0x560]: 44100 48000 96000 192000
     bits [0xe]: 16 20 24
     formats [0x1]: PCM
   Power states:  D0 D1 D2 D3 EPSS
----

Any thoughts on what's changing that, and how this should be fixed?

Cheers,
Arun
