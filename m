Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E99877137
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Mar 2024 13:57:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AB7DA4D;
	Sat,  9 Mar 2024 13:56:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AB7DA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709989017;
	bh=PVdx/k3JskFnVw+7FY7uLMiFcC0VvQuoTImjhf2Kbz4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=vE8EySrUml8ZFx0y85I6pAWXASs5wu8NrSDCvpkB7T+nvcxgpenOiSrnJe7MSl2wP
	 lOaCDplJqHZrGKeG31ooTg6WhF16+Y+hBZ9ZTkRXsvq7NumPHqqlbd8fd2+nEaIz4j
	 Lh3cAILiIpRRkuUlKUdxYyp0XALqLYfAN7K13rSA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B22FF8058C; Sat,  9 Mar 2024 13:56:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6D54F805A0;
	Sat,  9 Mar 2024 13:56:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4899F8024E; Sat,  9 Mar 2024 13:56:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B49BF8014B
	for <alsa-devel@alsa-project.org>; Sat,  9 Mar 2024 13:56:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B49BF8014B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1709988967430800676-webhooks-bot@alsa-project.org>
References: <1709988967430800676-webhooks-bot@alsa-project.org>
Subject: Unable to find amixer simple control
Message-Id: <20240309125617.D4899F8024E@alsa1.perex.cz>
Date: Sat,  9 Mar 2024 13:56:17 +0100 (CET)
Message-ID-Hash: TLSQG4ZPNZU3OKL2LSQ6ZJLWE5PWZYP6
X-Message-ID-Hash: TLSQG4ZPNZU3OKL2LSQ6ZJLWE5PWZYP6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TLSQG4ZPNZU3OKL2LSQ6ZJLWE5PWZYP6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #256 was opened from Ovalelephant35:

Following are the output of terminal when trying to fetch amixer set:-
```0
amixer: Unable to find simple control 'DC Mode Enable',0
1709919772.617362 WARNING measure-activity: Problem with amixer set "DC Mode Enable" mute amixer: Unable to find simple control 'V_REFOUT Enable',0
1709919772.664983 WARNING measure-activity: Problem with amixer set "V_REFOUT Enable" unmute amixer: Unable to find simple control 'Mic Boost (+20dB)',0
1709919772.766386 WARNING measure-activity: Problem with amixer set "Mic Boost (+20dB)" unmute amixer: Unable to find simple control 'DC Mode Enable',0
1709919772.866294 WARNING measure-activity: amixer: Could not get DC Mode
amixer: Unable to find simple control 'V_REFOUT Enable',0
1709919772.916730 WARNING measure-activity: amixer: Could not get mic bias voltage. amixer: Unable to find simple control 'Mic Boost (+20dB)',0
1709919773.016803 WARNING measure-activity: amixer: Could not get mic boost Traceback (most recent call last):
File "/usr/bin/sugar-activity3", line 5, in <module>
activityinstance.main()
File "/usr/lib/python3.7/dist-packages/sugar3/activity/activityinstance.py", line 230, in main instance = create_activity_instance(activity_constructor, activity_handle)
O
File "/usr/lib/python3.7/dist-packages/sugar3/activity/activityinstance.py", line 59, in create_activity_insta activity = constructor(handle)
File "/home/user/Activities/Measure/measure.py", line 187, in
self.audiograb
ag(self.wave.new buffer, self)
init
File "/home/user/Activities/Measure/audiograb.py", line 125, in init
self.pipeline.add(self.alsasrc)
TypeError: Argument 1 does not allow None as a value
Exited with status 1, pid 20470 activity id 53d702f16908eb0372466a8f3d74df190d6d00ca
```
Installed alsa-utils when amixer was missing using this command
```sudo apt-get alsa-utils```

Currently on using command ```amixer controls``` this is the output
```
numid=3, iface-MIXER, name='Master Playback Volume' 
numid=2,iface-MIXER, name='Capture Switch'
numid=1, iface-MIXER, name='Capture Volume' 
```

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/256
Repository URL: https://github.com/alsa-project/alsa-utils
