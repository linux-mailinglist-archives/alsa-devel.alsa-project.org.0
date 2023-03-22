Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CC06C4C85
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 14:56:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 333521FE;
	Wed, 22 Mar 2023 14:55:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 333521FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679493368;
	bh=e5UM3336SxMhXdyS4Q1uRjbi5lB5Q99W5R14NgY6b9Y=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=lDHkGKHiUGEZv+d8o5bp+1LytIYjs7UM9kXUqdnSdU35eRG7wx1iT35CSFb3TFo5p
	 usDRfeHv46NCAW2Wlb/zpwMBSjTK+mXNzUs9ecghJSr/AcCgjH0LT4GsR4ICbAo199
	 MHw82AwuLc270TPrnca4HnEPWbD2jhS0+VctP8Kc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8B41F80254;
	Wed, 22 Mar 2023 14:55:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0CF3F8027B; Wed, 22 Mar 2023 14:55:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F6E0F80093
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 14:55:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F6E0F80093
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1679493309694831848-webhooks-bot@alsa-project.org>
References: <1679493309694831848-webhooks-bot@alsa-project.org>
Subject: conf: add support for Amlogic AIU and AXG cards
Message-Id: <20230322135512.F0CF3F8027B@alsa1.perex.cz>
Date: Wed, 22 Mar 2023 14:55:12 +0100 (CET)
Message-ID-Hash: 3VQ3EMAT774ERVDTRS5KX2Y3BV32PEZC
X-Message-ID-Hash: 3VQ3EMAT774ERVDTRS5KX2Y3BV32PEZC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3VQ3EMAT774ERVDTRS5KX2Y3BV32PEZC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib pull request #308 was opened from chewitt:

This submission adds generic card confs for the Amlogic AIU and AXG audio cards. AIU is used with GXBB/GXL/GXM boards and supports HDMI and hinted S/PDIF output. The AXG conf is used with G12A/G12B/SM1 boards and supports HDMI only output. Hinting S/PDIF support does not work with AXG due to the card always presenting three outputs (with internal routing controlling what they are) so the hint always returns true.

This is an AIU device with HDMI and S/PDIF hardware:
```
WP2:~ # aplay -L
null
    Discard all samples (playback) or generate zero samples (capture)
default:CARD=WETEKPLAY2
    WETEK-PLAY2, 
    Default Audio Device
sysdefault:CARD=WETEKPLAY2
    WETEK-PLAY2, 
    Default Audio Device
iec958:CARD=WETEKPLAY2,DEV=0
    WETEK-PLAY2, 
    IEC958 (S/PDIF) Digital Audio Output
hdmi:CARD=WETEKPLAY2,DEV=0
    WETEK-PLAY2, 
    HDMI Audio Output
WP2:~ # aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: WETEKPLAY2 [WETEK-PLAY2], device 0: fe.dai-link-0 (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: WETEKPLAY2 [WETEK-PLAY2], device 1: fe.dai-link-1 (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```
This is an AXG device with HDMI only hardware:
```
N2PLUS:~ # aplay -L
null
    Discard all samples (playback) or generate zero samples (capture)
default:CARD=ODROIDN2
    ODROID-N2, 
    Default Audio Device
sysdefault:CARD=ODROIDN2
    ODROID-N2, 
    Default Audio Device
hdmi:CARD=ODROIDN2,DEV=0
    ODROID-N2, 
    HDMI Audio Output
N2PLUS:~ # aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: ODROIDN2 [ODROID-N2], device 0: fe.dai-link-0 (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: ODROIDN2 [ODROID-N2], device 1: fe.dai-link-1 (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: ODROIDN2 [ODROID-N2], device 2: fe.dai-link-2 (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```
The confs have been in use with the Kodi distro LibreELEC for around two years and other distros supporting Amlogic boards on upstream kernels (Armbian, Manjaro, etc.) have borrowed them from our repo too. The prime reason for submitting them is to allow everyone to drop some patches. Although the confs are known-working it would be great if someone with better alsa knowlege than myself could vet them for correctness.

ping @jeromebrunet for awareness

Request URL   : https://github.com/alsa-project/alsa-lib/pull/308
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/308.patch
Repository URL: https://github.com/alsa-project/alsa-lib
