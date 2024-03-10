Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6049E87773F
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Mar 2024 15:13:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93DBDB71;
	Sun, 10 Mar 2024 15:13:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93DBDB71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710080025;
	bh=xbjLboTvJH4cjJxTKGOEdTOEtyklj0zWTUsddSEEU+U=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=jYJUZK8Cd5rtX9eS97dSNb/EXlrG891JxlMFDw+KSxYk2Q8GrXUVLyQhYMP64iLSV
	 52YpVtuKf1SYa3M/5op5wiJuDMmdRef7UJytH03BSV1gG1mNDG8is1A921JGLtbMPX
	 Hgog1lZaZ4hdM7dNEQCEFttaeG35AhC9IC9djD44=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C30AF8057F; Sun, 10 Mar 2024 15:13:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A23E7F80578;
	Sun, 10 Mar 2024 15:13:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 408EEF8028D; Sun, 10 Mar 2024 15:11:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id E1A46F80093
	for <alsa-devel@alsa-project.org>; Sun, 10 Mar 2024 15:11:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1A46F80093
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1710079884499979973-webhooks-bot@alsa-project.org>
References: <1710079884499979973-webhooks-bot@alsa-project.org>
Subject: ASUS VivoBook Pro 14: platform::micmute led not working
Message-Id: <20240310141128.408EEF8028D@alsa1.perex.cz>
Date: Sun, 10 Mar 2024 15:11:28 +0100 (CET)
Message-ID-Hash: 5EQN3QB3ZYRNHFPUYPQNONLMRB3EW5PP
X-Message-ID-Hash: 5EQN3QB3ZYRNHFPUYPQNONLMRB3EW5PP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5EQN3QB3ZYRNHFPUYPQNONLMRB3EW5PP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #400 was opened from Dinolek:

There is `/sys/class/leds/platform::micmute` from `asus-nb-wmi`, but `snd_ctl_led` isn't loaded.
Microphone isn't connected to acp, so `snd_rn_pci_acp3x` isn't getting loaded.

I can get led switching working if I attach 'Capture Switch'

```
modprobe snd_ctl_led
echo 'Capture Switch' > /sys/class/sound/ctl-led/mic/card1/attach
```

[alsa-info](http://alsa-project.org/db/?f=05aff573aedf6ddd6954ca739d8de8f827a78e86)

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/400
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
