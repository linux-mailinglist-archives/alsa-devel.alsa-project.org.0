Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6C69D79DC
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Nov 2024 02:53:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B177A846;
	Mon, 25 Nov 2024 02:53:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B177A846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732499604;
	bh=rkHqjmcs9qa+kn2YAUVHi3bkhm2WuYZYoMQUO1cLp+g=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=SmhStsu8ic6D0xPyu1QzEPpqSG44HaIsvlPtkyaruyd3r/5xXAKvUeqDUpQofY45L
	 nJ+eS8Xda0CXXCMrqLZdYadfd1xXgK/YipoTRwQHBNvBNekpXQX2U9tmxh2fRFbiDo
	 cnkIB6K2XE4Mn7BTh3MBxznYSHg+CS+QbxIIWaHk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFEBAF805AF; Mon, 25 Nov 2024 02:52:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2944FF805AC;
	Mon, 25 Nov 2024 02:52:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29FE0F80496; Mon, 25 Nov 2024 02:52:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 70D9CF8019B
	for <alsa-devel@alsa-project.org>; Mon, 25 Nov 2024 02:52:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70D9CF8019B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1732499566576049089-webhooks-bot@alsa-project.org>
References: <1732499566576049089-webhooks-bot@alsa-project.org>
Subject: Motu D828 (2024) not working again
Message-Id: <20241125015249.29FE0F80496@alsa1.perex.cz>
Date: Mon, 25 Nov 2024 02:52:49 +0100 (CET)
Message-ID-Hash: NWRJPLPBU46YG42E4MFFAG2NXIMTWM6T
X-Message-ID-Hash: NWRJPLPBU46YG42E4MFFAG2NXIMTWM6T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NWRJPLPBU46YG42E4MFFAG2NXIMTWM6T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #471 was opened from beatboxa:

I had previously gotten my MOTU D828 working with UCM.  I recently used Ubuntu 24.04's software updater, and now my UCM appears to have stopped working.  The UCM files are still present in the directories where they previously worked.

The output of spa-acp-tool -c 0 -vvvv info now begins with the following:

```
UCM is not supported for this USB device (MOTU 828 at usb-0000:59:00.0-6, high speed @ USB07fd:000e)
error: failed to import hw:0 use case configuration -6
UCM is not supported for this USB device (MOTU 828 at usb-0000:59:00.0-6, high speed @ USB07fd:000e)
error: failed to import 828 use case configuration -6
UCM not available for card 828
Check for file: /home/beatboxa/.config/alsa-card-profile/mixer/profile-sets/default.conf
Check for file: /home/beatboxa/.config/alsa-card-profile/profile-sets/default.conf
Check for file: /etc/alsa-card-profile/mixer/profile-sets/default.conf
Check for file: /etc/alsa-card-profile/profile-sets/default.conf
Loading profile set: /usr/share/alsa-card-profile/mixer/profile-sets/default.conf
Parsing configuration file '/usr/share/alsa-card-profile/mixer/profile-sets/default.conf'
Parsing configuration file '/usr/share/alsa-card-profile/mixer/profile-sets/9999-custom.conf'
Looking at profile input:analog-stereo
Checking for recording on Analog Stereo (analog-stereo)
Trying front:0 with SND_PCM_NO_AUTO_FORMAT ...
ALSA device open 'front:0' capture: 0x5804b63f3d90
snd_pcm_hw_params_set_format(Signed 16 bit Little Endian) failed: Invalid argument
snd_pcm_hw_params_set_format(Signed 16 bit Big Endian) failed: Invalid argument
snd_pcm_hw_params_set_format(Float 32 bit Little Endian) failed: Invalid argument
snd_pcm_hw_params_set_format(Float 32 bit Big Endian) failed: Invalid argument
snd_pcm_hw_params_set_format(Signed 32 bit Little Endian) failed: Invalid argument
snd_pcm_hw_params_set_format(Signed 32 bit Big Endian) failed: Invalid argument
snd_pcm_hw_params_set_format(Signed 24 bit Little Endian) failed: Invalid argument
snd_pcm_hw_params_set_format(Signed 24 bit Big Endian) failed: Invalid argument
snd_pcm_hw_params_set_channels(2) failed: Invalid argument
ALSA device close 0x5804b63f3d90

```
And goes on from there.

Previously, my configuration worked, and is tracked in this thread:  #https://github.com/alsa-project/alsa-ucm-conf/pull/416

Is there some little thing I need to change to get UCM working again?

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/471
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
