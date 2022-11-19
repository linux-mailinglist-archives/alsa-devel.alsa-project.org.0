Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7608630F95
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Nov 2022 17:46:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13A34161F;
	Sat, 19 Nov 2022 17:45:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13A34161F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668876392;
	bh=6K6Rz9lsVPufN3jNM3UyJcF20Zvx4oUh5ol+x7x5NFc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zfi0i53KUS5H7+QgzoHWZf46P4CadsfWrTZBmIsfOTMH33dWns0ZaSW+sGvk6hlo+
	 3tsn1JX2/vQlJV9ebZpk3mBBiOHJe67vjQhuXf58Onh223GTfnoazY9L3RAK8sBTiE
	 HIfjt07E2S2paGl8s1fQJwTpKwty3mNJ/uDoBmPI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8248F8023B;
	Sat, 19 Nov 2022 17:45:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83A20F80217; Sat, 19 Nov 2022 17:45:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 84C5FF800B5
 for <alsa-devel@alsa-project.org>; Sat, 19 Nov 2022 17:45:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84C5FF800B5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1668876331896210909-webhooks-bot@alsa-project.org>
References: <1668876331896210909-webhooks-bot@alsa-project.org>
Subject: es8336 HiFi.conf
Message-Id: <20221119164535.83A20F80217@alsa1.perex.cz>
Date: Sat, 19 Nov 2022 17:45:35 +0100 (CET)
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

alsa-project/alsa-ucm-conf issue #244 was opened from junocomp:

I believe the current HiFi.conf for es8336 is incorrect and does not enable the require volumes for the speakers. 

I have attached my conf file, this enables the speakers from startup, detects the HDMI audio and enables the internal microphone. I have tested this on 3 devices with Debian now and it seems to work. Can other people test it too please. If it works, it will be worth pushing it upstream.

Make sure you backup your /usr/share/alsa/ucm2/Intel/sof-essx8336/HiFi.conf and replace it with the configuration below. Restart your machine to take effect.

```
SectionVerb {
	EnableSequence [
		#disdevall ""
		# Disable all inputs / outputs
		#   (may be duplicated with disdevall)
		cset "name='Left Headphone Mixer Left DAC Switch' on"
		cset "name='Right Headphone Mixer Right DAC Switch' on"
	]
}

SectionDevice."Mic" {
		Comment "Analog Microphone"

		EnableSequence [
			cset "name='Internal Mic Switch' on"
			cset "name='Headset Mic Switch' on"
		]

		DisableSequence [

				]

		Value {
			CapturePriority 100
			CapturePCM "hw:${CardId}"
			CaptureMixerElem "ADC PGA Gain"
			CaptureMasterElem "ADC"
		}
}

SectionDevice."Speaker" {
	Comment "Speakers"

	ConflictingDevice [
		"Headphones"
	]

	EnableSequence [
		cset "name='Speaker Switch' on"
		cset "name='Differential Mux' lin1-rin1"
	]

	DisableSequence [
		cset "name='Speaker Switch' off"
		cset "name='Differential Mux' lin2-rin2"
	]
	Value {
		PlaybackPriority 100
		PlaybackPCM "hw:${CardId}"
		# The es8316 only has a HP-amp which is muxed to the speaker
		# or to the headpones output
		PlaybackMixerElem "Headphone Mixer"
		PlaybackMasterElem "DAC"
	}
}

SectionDevice."Headphones" {
	Comment "Headphones"

	ConflictingDevice [
		"Speaker"
	]
	
	EnableSequence [
                cset "name='Headset Mic Switch' on"
                cset "name='Speaker Switch' off"
                cset "name='Differential Mux' lin2-rin2"
        ]
        
        DisableSequence [
		cset "name='Differential Mux' lin1-rin1"
	]

	Value {
		PlaybackPriority 300
		PlaybackPCM "hw:${CardId}"
		PlaybackMixerElem "Headphone Mixer"
		PlaybackMasterElem "DAC"
		JackControl "Headphone Jack"
		JackHWMute "Speaker"
	}
}

Include.hdmi.File "/Intel/sof-essx8336/Hdmi.conf"
```

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/244
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
