Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A314897CB89
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2024 17:19:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC29284D;
	Thu, 19 Sep 2024 17:19:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC29284D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726759164;
	bh=GeWjAQjMb1x5EDRzLnJ/P3RbR2eIklM0hY9AmCDIKjU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Vc1OOwj3Jnfhk+9sltHgxS+8SW3n/DFsxaARoYbykpD0cKPQvxyGqie3A0SqNXEXV
	 7L1Ux/Ikhun/Za/VjUNmwHvrzuCRbjEMVNl++uzLGpPe96wQ/tuPlPj8uUpuPdZAyo
	 JcHNT5Y0yY6gqkvMrxb4hK8jQM1Xto1cRMgFUdq4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0B17F805A0; Thu, 19 Sep 2024 17:18:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3196F805A0;
	Thu, 19 Sep 2024 17:18:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28D8EF80236; Thu, 19 Sep 2024 17:18:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 71367F800D0
	for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2024 17:18:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71367F800D0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1726759121773774147-webhooks-bot@alsa-project.org>
References: <1726759121773774147-webhooks-bot@alsa-project.org>
Subject: Handling values
Message-Id: <20240919151848.28D8EF80236@alsa1.perex.cz>
Date: Thu, 19 Sep 2024 17:18:48 +0200 (CEST)
Message-ID-Hash: NRMWHI66MYVUV3U3TXWLSSJO6FCHUNRD
X-Message-ID-Hash: NRMWHI66MYVUV3U3TXWLSSJO6FCHUNRD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NRMWHI66MYVUV3U3TXWLSSJO6FCHUNRD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #442 was opened from thenameisluk:

i have similar config to https://github.com/alsa-project/alsa-ucm-conf/blob/master/ucm2/Qualcomm/sc7180/adau7002-max98357a/HiFi.conf
for [homestar](https://wiki.postmarketos.org/wiki/Lenovo_IdeaPad_Duet_5_(google-homestar))
```
# Use case configuration for ALC5682+MAX98357A on SC7180

SectionVerb {
	Value {
		TQ "HiFi"
	}
}

SectionDevice."Speaker" {
	Comment "Speaker"


	Value {
		PlaybackChannels 4
		PlaybackPCM "hw:${CardId},1"
		PlaybackPriority 100
		PlaybackMixerElem "Speaker"
		PlaybackVolume "Speaker Playback Volume"
	}
}

SectionDevice."Mic" {
	Comment "Internal Microphone"

	EnableSequence [
		cset "name='IF1 01 ADC Swap Mux' 1"
		cset "name='Stereo1 ADC L2 Mux' 1"
		cset "name='Stereo1 ADC R2 Mux' 1"
		cset "name='Stereo1 ADC MIXL ADC2 Switch' 1"
		cset "name='Stereo1 ADC MIXR ADC2 Switch' 1"
	]

	DisableSequence [
		cset "name='Stereo1 ADC L2 Mux' 0"
		cset "name='Stereo1 ADC R2 Mux' 0"
		cset "name='Stereo1 ADC MIXL ADC2 Switch' 0"
		cset "name='Stereo1 ADC MIXR ADC2 Switch' 0"
	]

	Value {
		CapturePCM "hw:${CardId},0"
		CapturePriority 100
		CaptureMixerElem "STO1 ADC"
		CaptureVolume "STO1 ADC Capture Volume"
	}
}

SectionDevice."HDMI" {
	Comment "HDMI Jack"
	
	ConflictingDevice [
		"Speaker"
	]

	EnableSequence [
	]

	DisableSequence [
	]

	Value {
		PlaybackPriority 200
		PlaybackPCM "hw:${CardId},2"
		JackControl "HDMI Jack"
	}
}
```

the speaker and mic section is irrelevant here
hdmi is causing issues

without
```
	ConflictingDevice [
		"Speaker"
	]
```
pipewire doesn't want to use the ucm at all unless the hdmi is plugged in

with it
pipewire will only configure hdmi if hdmi is plugged in (when you restart it or at boot)

it's all on the same card
and the interface never goes away, only switches between
```
# amixer -c 0 contents
numid=9,iface=CARD,name='HDMI Jack'
  ; type=BOOLEAN,access=r-------,values=1
  : values=off
...

```
without hdmi and
```
# amixer -c 0 contents
numid=9,iface=CARD,name='HDMI Jack'
  ; type=BOOLEAN,access=r-------,values=1
  : values=on
```
with hdmi

```sudo alsactl monitor```also shows
```
node hw:0, #9 (0,0,0,HDMI Jack,0) VALUE
```
when plugging in and unplugging

knowing all this i am unable to figure out how to handle it with ucm2
and would appreciate some help getting it working without that ConflictingDevice

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/442
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
