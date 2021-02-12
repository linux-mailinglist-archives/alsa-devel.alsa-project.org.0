Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF34131A40E
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Feb 2021 18:52:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4606516F6;
	Fri, 12 Feb 2021 18:52:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4606516F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613152375;
	bh=1l6bCmEEcpacfma5aWrgTI+gFaFvh0XrrDzZiPag1/Y=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P4ak7j1ugbh9D1M3ziAxAQpkNI601Y2X3GSbj41ANLG30y6M3kgLLGjTj0zAyxFcs
	 y6rcubke18lVIcxCA+rK1JPIch041gRPpNTF2Z9GtMHuQHHBMsixsjDB9yXCohJM1t
	 eTTuBDfCIq1Co5mH2rr6zfg2n8OYEoGCY9NOV6jE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B17BEF8014B;
	Fri, 12 Feb 2021 18:51:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86E08F8022B; Fri, 12 Feb 2021 18:51:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 4EE74F8010D
 for <alsa-devel@alsa-project.org>; Fri, 12 Feb 2021 18:51:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EE74F8010D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1613152273701877117-webhooks-bot@alsa-project.org>
References: <1613152273701877117-webhooks-bot@alsa-project.org>
Subject: UCM profile for the Chromebook Yoga C630.  Please add.
Message-Id: <20210212175119.86E08F8022B@alsa1.perex.cz>
Date: Fri, 12 Feb 2021 18:51:19 +0100 (CET)
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

alsa-project/alsa-ucm-conf issue #82 was edited from neil-vonholtum:

Here is the HiFi.conf file contents:


SectionVerb {
Value {
 OutputDspName "speaker_eq"
 FullySpecifiedUCM "1"
}
EnableSequence [
 cdev "hw:kblda7219max" 

 cset "name='codec1_out mo media0_in mi Switch' off"
 cset "name='codec0_out mo media0_in mi Switch' off"
 cset "name='Playback Digital Volume' 111"
 cset "name='Playback Digital Switch' 1"
 cset "name='Out DACL Mux' DAIL"
 cset "name='Out DACR Mux' DAIR"
 cset "name='Mixer Out FilterL DACL Switch' 1"
 cset "name='Mixer Out FilterR DACR Switch' 1"
 cset "name='ST Mixer Out FilterL Out FilterL Switch' 1"
 cset "name='ST Mixer Out FilterR Out FilterR Switch' 1"
 cset "name='Headphone Jack Switch' off"
 cset "name='Headset Mic Switch' off"
 cset "name='Mic Volume' 5"
 cset "name='Capture Digital Volume' 111"
 cset "name='Capture Digital Switch' 1"
 cset "name='Mixin Volume' 10"
 cset "name='Mixin Switch' 1"
 cset "name='Mixer In Mic Switch' 1"
 cset "name='Out DAIL Mux' ADC"
 cset "name='Out DAIR Mux' ADC"
 cset "name='media0_out mo codec0_in mi Switch' off"
 cset "name='media0_out mo dmic01_hifi_in mi Switch' off"
 cset "name='Pin5-Port0 Mux' 1"
 cset "name='Pin6-Port0 Mux' 2"
 cset "name='Pin7-Port0 Mux' 3"
 cset "name='Gain Ramp Rate' 1"
]
DisableSequence [
]
}

SectionDevice."Speaker".0 {
Value {
 PlaybackPCM "hw:kblda7219max,0"
}
EnableSequence [
 cdev "hw:kblda7219max"
 cset "name='codec0_out mo media0_in mi Switch' on"
 cset "name='Spk Switch' on"
]
DisableSequence [
 cdev "hw:kblda7219max"
 cset "name='codec0_out mo media0_in mi Switch' off"
 cset "name='Spk Switch' off"
]
}

SectionDevice."Headphone".0 {
Value {
 PlaybackPCM "hw:kblda7219max,0"
 MixerName "Headphone"
 JackName "kblda7219max Headset Jack"
 JackType "gpio"
 JackSwitch "2"
 OutputDspName ""
}
EnableSequence [
 cdev "hw:kblda7219max"
 cset "name='codec1_out mo media0_in mi Switch' on"
 cset "name='Headphone Jack Switch' on"
 cset "name='Headphone Switch' 1"
]
DisableSequence [
 cdev "hw:kblda7219max"
 cset "name='codec1_out mo media0_in mi Switch' off"
 cset "name='Headphone Jack Switch' off"
 cset "name='Headphone Switch' 0"
]
}

SectionDevice."Line Out".0 {
Value {
 PlaybackPCM "hw:kblda7219max,0"
 MixerName "Headphone"
 JackName "kblda7219max Headset Jack"
 JackType "gpio"
 JackSwitch "6"
 OutputDspName ""
}
EnableSequence [
 cdev "hw:kblda7219max"
 cset "name='codec1_out mo media0_in mi Switch' on"
 cset "name='Headphone Jack Switch' on"
 cset "name='Headphone Switch' 1"
]
DisableSequence [
 cdev "hw:kblda7219max"
 cset "name='codec1_out mo media0_in mi Switch' off"
 cset "name='Headphone Jack Switch' off"
 cset "name='Headphone Switch' 0"
]
}
 
SectionDevice."Internal Mic".0 {
Value {
 CapturePCM "hw:kblda7219max,3"
 CaptureChannelMap "0 1 -1 -1 -1 -1 -1 -1 -1 -1 -1"
 MaxSoftwareGain "2000"
}
EnableSequence [
 cdev "hw:kblda7219max"
 cset "name='media0_out mo dmic01_hifi_in mi Switch' on"
]
DisableSequence [
 cdev "hw:kblda7219max"
 cset "name='media0_out mo dmic01_hifi_in mi Switch' off"
]
}

SectionDevice."Mic".0 {
Value {
 CapturePCM "hw:kblda7219max,1"
 MixerName "Headset Mic"
 JackName "kblda7219max Headset Jack"
 JackType "gpio"
}
EnableSequence [
 cdev "hw:kblda7219max"
 cset "name='Headset Mic Switch' on"
 cset "name='media0_out mo codec0_in mi Switch' on"
 cset "name='Mic Switch' on"
]
DisableSequence [
 cdev "hw:kblda7219max"
 cset "name='Headset Mic Switch' off"
 cset "name='media0_out mo codec0_in mi Switch' off"
 cset "name='Mic Switch' off"
]
}

SectionDevice."HDMI1".0 {
Value {
 PlaybackPCM "hw:kblda7219max,4"
 JackName "kblda7219max HDMI/DP, pcm=4 Jack"
 JackType "gpio"
 OutputDspName ""
}
EnableSequence [
]
DisableSequence [
]
}

SectionDevice."HDMI2".0 {
Value {
 PlaybackPCM "hw:kblda7219max,5"
 JackName "kblda7219max HDMI/DP, pcm=5 Jack"
 JackType "gpio"
 OutputDspName ""
}
EnableSequence [
]
DisableSequence [
]
}

SectionDevice."HDMI3".0 {
Value {
 PlaybackPCM "hw:kblda7219max,6"
 JackName "kblda7219max HDMI/DP, pcm=6 Jack"
 JackType "gpio"
 OutputDspName ""
}
EnableSequence [
]
DisableSequence [
]
}

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/82
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
