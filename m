Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CA3A5902A
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Mar 2025 10:47:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 399046050D;
	Mon, 10 Mar 2025 10:47:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 399046050D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741600077;
	bh=3GKCyneBL9NzsPpoo8Jip0E8IBfZBlKle17abwFJRcA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=YLNKj1mUJBI4Up7n2PmK9Pm/BPI6jTYWYH+xNvZmxFFomED2Bfg7Qyz7HOQnAH+VM
	 FqnjVOAGp1osDHHOlkFwaHO4/D77v2WEPv5ttXSE90Dkm7Lz3nHo4nFnpySoffYUee
	 sgZ95sttiiFEgofdYnZWPlcqmARrMxPIk474y91w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 551B9F89828; Sun,  9 Mar 2025 12:30:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 32D80F89825;
	Sun,  9 Mar 2025 12:30:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66AEBF89813; Sun,  9 Mar 2025 12:30:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 263A6F89810
	for <alsa-devel@alsa-project.org>; Sun,  9 Mar 2025 12:30:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 263A6F89810
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1741519804640769482-webhooks-bot@alsa-project.org>
References: <1741519804640769482-webhooks-bot@alsa-project.org>
Subject: Channel count in Focusrite Scarlett Gen 4 (1235:8218) SplitPCM
 configuration
Message-Id: <20250309113009.66AEBF89813@alsa1.perex.cz>
Date: Sun,  9 Mar 2025 12:30:09 +0100 (CET)
Message-ID-Hash: 4XNGUPFEMDUD5SJONANLKAL6FD4VRHID
X-Message-ID-Hash: 4XNGUPFEMDUD5SJONANLKAL6FD4VRHID
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4XNGUPFEMDUD5SJONANLKAL6FD4VRHID/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #515 was edited from pv:

The configuration https://github.com/alsa-project/alsa-ucm-conf/blob/master/ucm2/USB-Audio/Focusrite/Scarlett-2i-HiFi.conf specifies `HWChannels 2` for the Mic1 and Mic2 devices. This gets translated to `CaptureChannels 2` for `alsaucm open '<<<SplitPCM=1>>>hw:2'`.

However, we've got a report https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/4597#note_2815906 that looks like snd_pcm_hw_params_set_channels(pcm_handle, hwparams, 2) for the CapturePCM "_ucm0001.hw:Gen,0" fails with error. The PCM can be opened with 4 channels, though. Without `SplitPCM=1`, it also probably works but I'm not sure what channel count the `dshare` plugin is using.

The issue also affects the `Direct` profile, which also specifies `CaptureChannels 2`.

Is the `HWChannels 2` for Mic1/2 input direction right?

Shall `CaptureChannels 2` in UCM device be interpreted as that the device can be opened with exactly 2 channels, or that it can be opened with some number of channels >= 2?

<details>

```
$ alsaucm open '<<<SplitPCM=1>>>hw:2' dump text
Verb.HiFi {
	Comment Default
	Device.Line1 {
		Comment "Headphones / Line 1-2"
		Values {
			CaptureCTL "_ucm0001.hw:Gen"
			PlaybackCTL "_ucm0001.hw:Gen"
			PlaybackPCM "_ucm0001.hw:Gen"
			PlaybackPriority 200
		}
	}
	Device.Mic1 {
		Comment "Input 1 Mic/Inst/Line"
		Values {
			CaptureCTL "_ucm0001.hw:Gen"
			CaptureChannel0 0
			CaptureChannelPos0 MONO
			CaptureChannels 2
			CapturePCM "_ucm0001.hw:Gen,0"
			CapturePriority 200
			PlaybackCTL "_ucm0001.hw:Gen"
		}
	}
	Device.Mic2 {
		Comment "Input 2 Mic/Inst/Line"
		Values {
			CaptureCTL "_ucm0001.hw:Gen"
			CaptureChannel0 1
			CaptureChannelPos0 MONO
			CaptureChannels 2
			CapturePCM "_ucm0001.hw:Gen,0"
			CapturePriority 100
			PlaybackCTL "_ucm0001.hw:Gen"
		}
	}
}
Verb.Direct {
	Comment "Direct Scarlett Solo 4th Gen"
	Device.Direct {
		Comment "Direct Scarlett Solo 4th Gen"
		Values {
			CaptureCTL "_ucm0001.hw:Gen"
			CaptureChannels 2
			CapturePCM "_ucm0001.hw:Gen"
			CapturePriority 1000
			PlaybackCTL "_ucm0001.hw:Gen"
			PlaybackChannels 2
			PlaybackPCM "_ucm0001.hw:Gen"
			PlaybackPriority 1000
		}
	}
}
```

</details>

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/515
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
