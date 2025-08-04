Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E847CB1A93A
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Aug 2025 20:39:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C50A96024F;
	Mon,  4 Aug 2025 20:39:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C50A96024F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754332757;
	bh=2NmHUfC/ffCtRXtLj+H9mxKTy0vQUZHa6MoZeUzNVmI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=VkK0DPotKS511MuxWwfmIu7e3UMxi3gIGmLIR1FKUPvsbETkAF6CYkX2YGA/YaW1V
	 P1kZfDtb70u8xMhuRNnP7XbNo+p/NSKozwIP2BOm7WTF7RmLuIzqQb85/gUV5pt73p
	 gMu9dQ4qpGpL4FTtijqWSEnnW/g75Jk1i1/9O78Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23A04F805CB; Mon,  4 Aug 2025 20:38:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2866F80553;
	Mon,  4 Aug 2025 20:38:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04F9DF804CF; Mon,  4 Aug 2025 20:37:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 20274F800FE
	for <alsa-devel@alsa-project.org>; Mon,  4 Aug 2025 20:37:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20274F800FE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1858a440daddbf00-webhooks-bot@alsa-project.org>
In-Reply-To: <1858a440d847c100-webhooks-bot@alsa-project.org>
References: <1858a440d847c100-webhooks-bot@alsa-project.org>
Subject: ALC4082: S/PDIF volume redirecting to headphone volume - asus rog
 crosshair x670e hero
Date: Mon,  4 Aug 2025 20:37:40 +0200 (CEST)
Message-ID-Hash: XS6I4ROQTCLGPM46XHM7X7T6XNN3DKHR
X-Message-ID-Hash: XS6I4ROQTCLGPM46XHM7X7T6XNN3DKHR
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XS6I4ROQTCLGPM46XHM7X7T6XNN3DKHR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #598 was opened from LuanVSO:

hi, i had a problem where opening the kde plasma volume applet would make the volume on my headphone jump to the maximum.
after muting the "PCM 2" channel on alsamixer i notice that the volume on the headphone would go muted instead.
so i edited the ALC4080-HiFi.conf file and remove every mention of S/PDIF and rebooted my machine.

after the change the problem didn't happen anymore.
what do you need to fix the mapping problem?

i think this happens because the "PCM 2" volume controls is redirecting to headphone output, but it doenst have a slider, so it is either max or muted:

<img width="1259" height="967" alt="Image" src="https://github.com/user-attachments/assets/3b266bb7-7e1c-4a7a-b448-affabf06b01c" />

(also the S/PDIF aways appeared as connected even though i did not have anything connected to it, don't know if it is expected)

[alsa-info.sh](https://paste.centos.org/view/c6545d44)
<details>
<summary>edited ALC4080-HiFi.conf</summary>

```
Define {
	SpeakerMixer "PCM"
	SpeakerMindex "0"
	SpeakerJack "Speaker - Output Jack"
	SpeakerPCM "hw:${CardId}"

	HeadphonesName "Front Headphones"
	HeadphonesMixer "PCM"
	HeadphonesMindex "1"
	HeadphonesJack "Headphone - Output Jack"
	HeadphonesPCM "hw:${CardId},1"

	Mic1Name "Microphone"
	Mic1Mixer "Mic"
	Mic1Mindex "0"
	Mic1Jack "Mic - Input Jack"
	Mic1PCM "hw:${CardId},2"

	Mic2Name ""
	Mic2Mixer ""
	Mic2Mindex "0"
	Mic2Jack ""
	Mic2PCM ""

	Line1Name "Line Input"
	Line1Mixer "Line"
	Line1Mindex "0"
	Line1Jack "Line - Input Jack"
	Line1PCM "hw:${CardId},1"

#	SpdifName "S/PDIF Output"
#	SpdifPCM "hw:${CardId},3"
#	SpdifMixer "PCM"
#	SpdifMindex "2"
}

If.speaker_ctl {
	Condition {
		Type ControlExists
		Control "name='Speaker Playback Switch'"
	}
	True.Define.SpeakerMixer "Speaker"
}

If.front_hp_ctl {
	Condition {
		Type ControlExists
		Control "name='Front Headphone Playback Switch'"
	}
	True.Define {
		HeadphonesMixer "Front Headphone"
		HeadphonesMindex "0"
	}
}

#If.spdif_ctl {
#	Condition {
#		Type ControlExists
#		Control "name='IEC958 Playback Switch'"
#	}
#	True.Define {
#		SpdifMixer "IEC958"
#		SpdifMindex "0"
#	}
#}

#If.spdif_nodev {
#	Condition {
#		Type RegexMatch
#		String "${CardComponents}"
#		Regex "USB(0db0:36e7)"
#	}
#	True.Define.SpdifName ""
#}

#If.spdif_dev2 {
#	Condition {
#		Type RegexMatch
#		String "${CardComponents}"
#		Regex "USB(0b05:(1996|1a5[23c])|0db0:1feb)"
#	}
#	True.Define.SpdifPCM "hw:${CardId},2"
#}

If.gigabyte-aorus-ultra {
	Condition {
		Type RegexMatch
		String "${CardComponents}"
		Regex "USB(0414:a014)"
	}
	True.Define {
		Mic1Name "Front Microphone"
		Mic1PCM "hw:${CardId},0"
		Mic2Name "Rear Microphone"
		Mic2Mixer "Mic"
		Mic2Mindex "1"
		Mic2Jack "name='Mic - Input Jack',index=1"
		Mic2PCM "hw:${CardId},1"
		SpdifName ""
		Line1Name ""
	}
}

If.asus-rog-usb {
	Condition {
		Type RegexMatch
		String "${CardComponents}"
		Regex "USB(0b05:1996)"
	}
	True.Define {
		Mic1Name "Front Microphone"
		Mic2Name "Microphone"
		Mic2Mixer "Analog In"
		Mic2Jack "Analog In - Input Jack"
		Mic2PCM "hw:${CardId}"
	}
}

If.asrock-taichi {
	Condition {
		Type RegexMatch
		String "${CardComponents}"
		Regex "USB(26ce:0a0[68b])"
	}
	True.Define {
		Line1Name ""
		Mic1Name "Rear Input"
		Mic1PCM "hw:${CardId},0"
		Mic2Name "Front Microphone"
		Mic2Mixer "Mic"
		Mic2Jack "Front Mic - Input Jack"
		Mic2PCM "hw:${CardId},1"
	}
}

If.wrx80-sage {
	Condition {
		Type RegexMatch
		String "${CardComponents}"
		Regex "USB(0b05:1984)"
	}
	True.Define {
		Mic2Name "Front Microphone"
		Mic2Mixer "Analog In"
		Mic2Jack "Analog In - Input Jack"
		Mic2PCM "hw:${CardId}"
	}
}

If.msi-meg-unify {
	Condition {
		Type RegexMatch
		String "${CardComponents}"
		Regex "USB(0db0:82c7)"
	}
	True.Define {
		HeadphonesName ""
		SpdifName ""
	}
}

If.asus-rog-strix {
	Condition {
		Type RegexMatch
		String "${CardComponents}"
		Regex "USB(0b05:1999)"
	}
	True.Define {
		Line1PCM "hw:${CardId},3"
		HeadphonesName ""
		SpdifName ""
	}
}

SectionVerb {
	EnableSequence [
		disdevall ""
	]

	Value.TQ "HiFi"
}

SectionDevice."Speaker" {
	Comment "Speakers"

	EnableSequence [
		cset "name='${var:SpeakerMixer} Playback Switch',index=${var:SpeakerMindex} on"
	]

	DisableSequence [
		cset "name='${var:SpeakerMixer} Playback Switch',index=${var:SpeakerMindex} off"
	]

	Value {
		PlaybackChannels 2
		PlaybackPriority 200
		PlaybackPCM "${var:SpeakerPCM}"
		JackControl "${var:SpeakerJack}"
		PlaybackMixerElem "${var:SpeakerMixer},${var:SpeakerMindex}"
	}

	Variant."HiFi 5+1".Value.PlaybackChannels 6
	Variant."HiFi 7+1".Value.PlaybackChannels 8
}

If.headphones {
	Condition {
		Type String
		Empty "${var:HeadphonesName}"
	}
	False.SectionDevice."Headphones" {
		Comment "${var:HeadphonesName}"

		EnableSequence [
			cset "name='${var:HeadphonesMixer} Playback Switch',index=${var:HeadphonesMindex} on"
		]

		DisableSequence [
			cset "name='${var:HeadphonesMixer} Playback Switch',index=${var:HeadphonesMindex} off"
		]

		Value {
			PlaybackPriority 300
			PlaybackPCM "${var:HeadphonesPCM}"
			JackControl "${var:HeadphonesJack}"
			PlaybackMixerElem "${var:HeadphonesMixer},${var:HeadphonesMindex}"
		}
	}
}

#If.spdif {
#	Condition {
#		Type String
#		Empty "${var:SpdifName}"
#	}
#	False.SectionDevice."SPDIF" {
#		Comment "${var:SpdifName}"
#
#		EnableSequence [
#			cset "name='${var:SpdifMixer} Playback Switch',index=${var:SpdifMindex} on"
#		]
#
#		DisableSequence [
#			cset "name='${var:SpdifMixer} Playback Switch',index=${var:SpdifMindex} off"
#		]
#
#		Value {
#			PlaybackPriority 100
#			PlaybackPCM "${var:SpdifPCM}"
#			PlaybackMixerElem "${var:SpdifMixer},${var:SpdifMindex}"
#		}
#	}
#}

If.line1 {
	Condition {
		Type String
		Empty "${var:Line1Name}"
	}
	False.SectionDevice."Line1" {
		Comment "${var:Line1Name}"

		EnableSequence [
			cset "name='${var:Line1Mixer} Capture Switch',index=${var:Line1Mindex} on"
		]

		DisableSequence [
			cset "name='${var:Line1Mixer} Capture Switch',index=${var:Line1Mindex} off"
		]

		Value {
			CapturePriority 100
			CapturePCM "${var:Line1PCM}"
			JackControl "${var:Line1Jack}"
			CaptureMixerElem "${var:Line1Mixer},${var:Line1Mindex}"
		}
	}
}

If.mic1 {
	Condition {
		Type String
		Empty "${var:Mic1Name}"
	}
	False.SectionDevice."Mic1" {
		Comment "${var:Mic1Name}"

		EnableSequence [
			cset "name='${var:Mic1Mixer} Capture Switch',index=${var:Mic1Mindex} on"
		]

		DisableSequence [
			cset "name='${var:Mic1Mixer} Capture Switch',index=${var:Mic1Mindex} off"
		]

		Value {
			CapturePriority 300
			CapturePCM "${var:Mic1PCM}"
			JackControl "${var:Mic1Jack}"
			CaptureMixerElem "${var:Mic1Mixer},${var:Mic1Mindex}"
		}
	}
}

If.mic2 {
	Condition {
		Type String
		Empty "${var:Mic2Name}"
	}
	False.SectionDevice."Mic2" {
		Comment "${var:Mic2Name}"

		EnableSequence [
			cset "name='${var:Mic2Mixer} Capture Switch',index=${var:Mic2Mindex} on"
		]

		DisableSequence [
			cset "name='${var:Mic2Mixer} Capture Switch',index=${var:Mic2Mindex} off"
		]

		Value {
			CapturePriority 400
			CapturePCM "${var:Mic2PCM}"
			JackControl "${var:Mic2Jack}"
			CaptureMixerElem "${var:Mic2Mixer},${var:Mic2Mindex}"
		}
	}
}

```

</details>

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/598
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
