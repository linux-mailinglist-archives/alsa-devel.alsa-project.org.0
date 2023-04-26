Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F5C6EEEA2
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Apr 2023 08:58:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15A071071;
	Wed, 26 Apr 2023 08:57:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15A071071
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682492294;
	bh=YEtxQwemM8ElH7uDTalSPRuOLzWLhR8ZM28SUEeE//A=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=eTlOVjqwHAFKnyRRbGuxYCitkjvM8ecVgnNvKREww0RcB7rcLiFdhaHSXJCj6PAiI
	 H3UuyTnMIhEWuDTs7d4owjuhjnhu4aq9JEOxDWc1SCuNm9/sGQMwFyU30RNjv5ZKGY
	 PNK6VgSycAYWSr5RC9z/Lldwm4tYfCf1Uwbvl6ug=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55B56F8018A;
	Wed, 26 Apr 2023 08:57:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B9EFF80236; Wed, 26 Apr 2023 08:57:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 083B7F800AC
	for <alsa-devel@alsa-project.org>; Wed, 26 Apr 2023 08:57:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 083B7F800AC
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1682492231896585226-webhooks-bot@alsa-project.org>
References: <1682492231896585226-webhooks-bot@alsa-project.org>
Subject: USB Audio (HyperX DuoCast) Microphone record volume is too low
Message-Id: <20230426065719.7B9EFF80236@alsa1.perex.cz>
Date: Wed, 26 Apr 2023 08:57:19 +0200 (CEST)
Message-ID-Hash: 6UU3QNKXXIBKGF3FRLNVAXZEBQMFYYA7
X-Message-ID-Hash: 6UU3QNKXXIBKGF3FRLNVAXZEBQMFYYA7
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6UU3QNKXXIBKGF3FRLNVAXZEBQMFYYA7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #308 was opened from nitin88:

Hi,
I purchased HyperX DuoCast for office meetings and avoid through whole hoop of Motherboard specific PCIe sound card issues and support as I use pretty much latest hardware. But the sound issues around Linux is still killing me.

1. My DuoCast hardware gain set to Max and still the record volume is too low.
2. Alsamixer disabled Mic volume (atleast can't change anything from here)
3. Pulse Audio Volume Control installed and has 100% volume (under Input devices)

I can record the sound clip and it's barely audible. If I set to 150% gain in Pulse Audio Volume Control, its acceptable and others can hear over meetings.
Can anyone please tell me how do I fix this? Everyone suggests using USB audio and with USB audio, it's pretty much same state.

If I use Logitech Webcam USB Audio for recording, everything works so smooth and recorded audio is on-par with expectations.

Based on 2, 3 - I don't think I have any other hardware issue than most likely Linux audio mess. Because I can increase the mic volume for Logitech in Alsamixer but not for HyperX Duocast.
I noticed following details

```
Control: name="PCM Playback Volume", index=0
    Info: id=8, control=2, cmask=0x3, channels=2, type="S16"
    Volume: min=-10240, max=-1536, dBmin=-4000, dBmax=-600
```

Alsa info: 
[alsa-info.txt](https://github.com/alsa-project/alsa-ucm-conf/files/11329890/alsa-info.txt)

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/308
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
