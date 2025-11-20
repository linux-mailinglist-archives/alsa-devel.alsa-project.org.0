Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E49C76A7C
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Nov 2025 00:49:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED0606018F;
	Fri, 21 Nov 2025 00:49:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED0606018F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763682599;
	bh=FK81E0DJ6QALGddJA6A99B01aIAsAy8stZy0NYmX6fs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=GuV1fKd4ATlIOXnuguOa0HLnHT4HGYuXz9WBPuWqPSZacPXM9f69bZ2Apx6QOHpAq
	 zh37YQ33D7NGJ0AFhP5YzDRNArVbWiCNfUcSnGUYL3sVJpB37ZSu1iTM6U54TXlZ/f
	 P/ybGyZHrWqPqvnJ8lo7QMmShCpw29UlkzhlK1T4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AE29F805C8; Fri, 21 Nov 2025 00:49:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1168F805C1;
	Fri, 21 Nov 2025 00:49:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1B04F80448; Fri, 21 Nov 2025 00:49:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CF6CF80134
	for <alsa-devel@alsa-project.org>; Fri, 21 Nov 2025 00:49:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CF6CF80134
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1879dbef7fb81800-webhooks-bot@alsa-project.org>
In-Reply-To: <1879dbef7ed4ea00-webhooks-bot@alsa-project.org>
References: <1879dbef7ed4ea00-webhooks-bot@alsa-project.org>
Subject: SplitPCMDevice macro broken with two or more channels
Date: Fri, 21 Nov 2025 00:49:13 +0100 (CET)
Message-ID-Hash: WONAL367KOXIYNK2U32P4BSC34Z2FKIA
X-Message-ID-Hash: WONAL367KOXIYNK2U32P4BSC34Z2FKIA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WONAL367KOXIYNK2U32P4BSC34Z2FKIA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #646 was opened from karcsesz:

I have a Behringer XR18 that I am currently trying to write a custom UCM profile for that splits its 18x18 audio interface into separate mono and stereo virtual devices.

I am able to create mono devices using the `SplitPCM` and `SplitPCMDevice` macros, however only when none of the channels higher than Channel0 are defined, as the created Capture/PlaybackPCM configuration values have the channel IDs duplicated:

```
$ alsaucm -c3 dump text
[snip]
Verb."18x18 Stereo" {
	Comment "9x9 Stereo Duplex"
	Device."Ch1 In" {
		Comment "Ch1 from"
		Values {
			CaptureCTL "_ucm0001.hw:XR18"
			CaptureChannels 2
			CapturePCM "_ucm0001.behringer_xr18_stereo_in:XR18,0,0,1,1"
			PlaybackCTL "_ucm0001.hw:XR18"
		}
	}
	Device."Ch2 In" {
		Comment "Ch2 from"
		Values {
			CaptureCTL "_ucm0001.hw:XR18"
			CaptureChannels 2
			CapturePCM "_ucm0001.behringer_xr18_stereo_in:XR18,0,2,3,3"
			PlaybackCTL "_ucm0001.hw:XR18"
		}
	}
[snip]
```

`spa-acp-tool` also fails to find the PCM devices due to this issue
```
$ spa-acp-tool -vvv -c3
[snip]
I       alsa-ucm.c:2567      Probing profile 18x18 Stereo
I       alsa-ucm.c:2571      Set ucm verb to 18x18 Stereo
D      alsa-util.c:714         Trying _ucm0001.behringer_xr18_stereo_in:XR18,0,16,17,17 with SND_PCM_NO_AUTO_FORMAT ...
I           conf.c:5541      Unknown parameter 4
I           conf.c:5712      Parse arguments error: No such file or directory
I            pcm.c:2722      Unknown PCM behringer_xr18_stereo_in:XR18,0,16,17,17
I      alsa-util.c:721       Error opening PCM device _ucm0001.behringer_xr18_stereo_in:XR18,0,16,17,17: No such file or directory
I       alsa-ucm.c:2611      Profile '18x18 Stereo' mapping '18x18 Stereo: Ch9 In: source': input PCM open failed
I       alsa-ucm.c:2621      Profile 18x18 Stereo not supported
```
Appropriate snippet from the verb configuration:
```
Include.pcm_split.File "/common/pcm/split.conf"

Macro [
[snip]
	{
		SplitPCM {
			Name "behringer_xr18_stereo_in"
			Direction Capture
			Format S24_3LE
			Channels 2
			HWChannels 18
			HWChannelPos0 FL
			HWChannelPos1 FR
			HWChannelPos2 FL
			HWChannelPos3 FR
			HWChannelPos4 FL
			HWChannelPos5 FR
			HWChannelPos6 FL
			HWChannelPos7 FR
			HWChannelPos8 FL
			HWChannelPos9 FR
			HWChannelPos10 FL
			HWChannelPos11 FR
			HWChannelPos12 FL
			HWChannelPos13 FR
			HWChannelPos14 FL
			HWChannelPos15 FR
			HWChannelPos16 FL
			HWChannelPos17 FR
		}
	}
[snip]
]
[snip]
SectionDevice."Ch1 In" {
	Comment "Ch1 from"
	Macro.pcm_split.SplitPCMDevice {
		Name "behringer_xr18_stereo_in"
		Direction Capture
		HwChannels 18
		Channels 2
		Channel0 0
		Channel1 1
		ChannelPos0 FL
		ChannelPos1 FR
	}
}

SectionDevice."Ch2 In" {
	Comment "Ch2 from"
	Macro.pcm_split.SplitPCMDevice {
		Name "behringer_xr18_stereo_in"
		Direction Capture
		HwChannels 18
		Channels 2
		Channel0 2
		Channel1 3
		ChannelPos0 FL
		ChannelPos1 FR
	}
}
[snip]
```

My current hunch is the append within the `SplitPCMDevice_addchn` macro somehow getting called twice (maybe due to [evaluation restart](https://www.alsa-project.org/alsa-doc/alsa-lib/group__ucm__conf.html#autotoc_md18)?)

[alsa-info.txt](https://github.com/user-attachments/files/23665421/alsa-info.txt)

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/646
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
