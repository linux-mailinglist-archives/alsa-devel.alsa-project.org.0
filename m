Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0336ACF24D
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Jun 2025 16:48:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6472E601EE;
	Thu,  5 Jun 2025 16:48:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6472E601EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749134908;
	bh=D22kCPwWvy4vHdOTO85krtXl39Hn1SpFmJ0GQkA5iTY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=DF1qbnn//UExuTy4yTB6zk3hgpgcqB03oKZHbZoxux+cqPbgpnM6DnnB00anH4PLK
	 DYT2a8uXsYkG15C5buaMu6MY29nz8r5auZif5tK2Uk9FTJXl1kVagS4zdj4iu0+rIB
	 4FNurs5HwamEg83iWgos7qPMoc84krFyt+aLWM6Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3BDEF805AC; Thu,  5 Jun 2025 16:47:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2153F805AC;
	Thu,  5 Jun 2025 16:47:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A06D4F80154; Thu,  5 Jun 2025 16:47:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id F103FF800E4
	for <alsa-devel@alsa-project.org>; Thu,  5 Jun 2025 16:47:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F103FF800E4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18462ce5eff6d900-webhooks-bot@alsa-project.org>
In-Reply-To: <18462ce5eff12900-webhooks-bot@alsa-project.org>
References: <18462ce5eff12900-webhooks-bot@alsa-project.org>
Subject: alsaloop: link existing mixer controls
Date: Thu,  5 Jun 2025 16:47:53 +0200 (CEST)
Message-ID-Hash: 4VZ2E7APRJSH27GCR66UD53UBQWFEC7N
X-Message-ID-Hash: 4VZ2E7APRJSH27GCR66UD53UBQWFEC7N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4VZ2E7APRJSH27GCR66UD53UBQWFEC7N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #303 was opened from bravl:

Hi,

I'm trying to link the volume controls of 2 soundcards together. We've got 2 souncards, an UAC2Gadget card and a custom soundcard. We use alsaloop to create the following setup:

```
UAC2Gadget record -> alsaloop -> Custom soundcard speaker out
Custom soundcard mic in -> alsaloop -> UAC2Gadget soundcard playback
```

For this the alsaloop.conf looks like
```
-P hw:CARD=customsoundcard,DEV=0 -C hw:CARD=UAC2Gadget,DEV=0 -S 5 -T 1"                                                          
-C hw:CARD=customsoundcard,DEV=1 -P hw:CARD=UAC2Gadget,DEV=0 -S 5 -T 2                                                                                                               
```

This setup works perfectly. But we would like to control the volume of the custom soundcard's speaker out via the UAC2Gadgets' PCM Record volume.

The cards expose the following controls:
```sh
$ amixer -c1 controls #custom soundcard
numid=1,iface=MIXER,name='Master Volume'
numid=2,iface=MIXER,name='Speaker Volume'

$ amixer -c2 controls #UAC2Gadget
numid=3,iface=MIXER,name='PCM Playback Switch'
numid=4,iface=MIXER,name='PCM Playback Volume'
numid=6,iface=MIXER,name='PCM Capture Switch'
numid=7,iface=MIXER,name='PCM Capture Volume'
numid=1,iface=PCM,name='Capture Pitch 1000000'
numid=8,iface=PCM,name='Capture Rate'
numid=2,iface=PCM,name='Playback Pitch 1000000'
numid=5,iface=PCM,name='Playback Rate'
```

Adding `-m "name=Speaker Volume"` creates a new linked control to the UAC2Gadget card called "Speaker Volume" as expected.
Adding `-m "name=Speaker Volume"@name="PCM Capture Volume"` does not work. Resulting in:

```
Unable to create control '0,MIXER,0,0,PCM Capture Volume,0': Device or resource busy
playback hw:CARD=customsoundcard,DEV=0/capture hw:CARD=UAC2Gadget,DEV=0: Unable to remove control '0,MIXER,0,0,PCM Capture Volume,0': Invalid argument
```

Looking at the alsaloop code, it seems that this is expected behaviour because it's trying to remove a control which was created by the UAC2Gadget driver.

Is the above conclusion correct or is there a different way to allow alsaloop to sync 2 existing driver controls?

Thanks

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/303
Repository URL: https://github.com/alsa-project/alsa-utils
