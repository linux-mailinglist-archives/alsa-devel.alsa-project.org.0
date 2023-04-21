Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F32F56EA8A7
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 12:53:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC539E76;
	Fri, 21 Apr 2023 12:52:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC539E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682074417;
	bh=nHx7QGgzCoQZcNEx9MiGqRBuSIxS/Of4no3PGY7HMTo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=cHDwzxDqVoYvuZ18upgABzkjYBhVM+4GlI+AmsItosprDtLYX5Ibsq6+DBxBMB7BF
	 q6p6THmfur/ROGpFMNMN4B+aDtBrRTzY8GcGZGuwe5XqyvIEwuLEeabLEQWa6Tnfrq
	 ddvI8xIAcNg9d9eTMVOU3AdMcWnWL8Vl30+gTkxE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8573F80149;
	Fri, 21 Apr 2023 12:52:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2BC1F80155; Fri, 21 Apr 2023 12:52:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 31DBFF800F8
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 12:52:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31DBFF800F8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1682074356280727386-webhooks-bot@alsa-project.org>
References: <1682074356280727386-webhooks-bot@alsa-project.org>
Subject: DAC not connecting after waking from suspend.
Message-Id: <20230421105242.D2BC1F80155@alsa1.perex.cz>
Date: Fri, 21 Apr 2023 12:52:42 +0200 (CEST)
Message-ID-Hash: E3WYCNAXQ4VK7WV5V42EX6MC3LEC5ZYO
X-Message-ID-Hash: E3WYCNAXQ4VK7WV5V42EX6MC3LEC5ZYO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E3WYCNAXQ4VK7WV5V42EX6MC3LEC5ZYO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #313 was opened from ad-on-is:

A strange issue started happening, with my USB connected DAC (fiio k3). After waking from sleep/suspend the DAC is not recognized anymore, unless I replug it.

```

alsa-lib.i686                                        1.2.8-3.fc38                        @fedora                                            
alsa-lib.x86_64                                      1.2.8-3.fc38                        @anaconda                                          
alsa-sof-firmware.noarch                             2.2.4-3.fc38                        @anaconda                                          
alsa-ucm.noarch                                      1.2.8-3.fc38                        @anaconda                                          
alsa-utils.x86_64                                    1.2.8-2.fc38                        @anaconda                                          
pipewire-alsa.i686                                   0.3.69-1.fc38                       @updates                                           
pipewire-alsa.x86_64                                 0.3.69-1.fc38                       @updates                                           
qemu-audio-alsa.x86_64                               2:7.2.0-6.fc38                      @anaconda                                          
wine-alsa.i686                                       8.5-1.fc38                          @updates                                           
wine-alsa.x86_64                                     8.5-1.fc38                          @updates    

```
```
when it's connected: cat /proc/asound/modules
   1    0 snd_usb_audio
   2    1 snd_hda_intel
   3    2 snd_usb_audio
   4    3 snd_hda_intel
   5    4 snd_usb_audio
   6    5 snd_usb_audio

after wakeup: cat /proc/asound/modules 
   1    0 snd_usb_audio
   2    1 snd_hda_intel
   3    2 snd_usb_audio
   4    3 snd_hda_intel
   5    4 snd_usb_audio
```

If you need any further info, let me know.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/313
Repository URL: https://github.com/alsa-project/alsa-lib
