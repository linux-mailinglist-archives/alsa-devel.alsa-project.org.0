Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7B59D3547
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2024 09:20:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77D021939;
	Wed, 20 Nov 2024 09:20:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77D021939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732090858;
	bh=+FUHqLxxFIe7TkxHQW2uQ1xoPdZwVpBc69J+zw+IDr4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=NDj01OY5LtaAMMm03L2SgidZz//xFLhpUM1WI3piz8U5s3gk66OqkpMuR/p4YMrXd
	 6AnemkvSI6w98w62oO3XyzI07DeOxTdPIepoGE1rlng+mYBbr50LWPf4Pqc4vibBPd
	 hWBpgg48p/e/Ftsi/hMrAbugWM1i2pyub9om6rNQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D77B1F805C3; Wed, 20 Nov 2024 09:20:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25289F805AF;
	Wed, 20 Nov 2024 09:20:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99DF5F8026D; Wed, 20 Nov 2024 09:20:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id E2F94F800D2
	for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2024 09:20:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2F94F800D2
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1732090818219266653-webhooks-bot@alsa-project.org>
References: <1732090818219266653-webhooks-bot@alsa-project.org>
Subject: alsactl: 90-alsa-restore.rules - fix AMD acp-pdm-mach link name
 acp-dmic-codec
Message-Id: <20241120082020.99DF5F8026D@alsa1.perex.cz>
Date: Wed, 20 Nov 2024 09:20:20 +0100 (CET)
Message-ID-Hash: KHXNEPZFU5UCDBBCZEKXNKDQLB2QZSZB
X-Message-ID-Hash: KHXNEPZFU5UCDBBCZEKXNKDQLB2QZSZB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KHXNEPZFU5UCDBBCZEKXNKDQLB2QZSZB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #281 was opened from pma1:

The link name of AMD ACP digital microphones driver acp-pdm-mach is acp-dmic-codec.
fix it to make UCM initialize it again.

Fixes: 8116639 ("alsactl: 90-alsa-restore.rules - add support for AMD ACP digital microphone")

# arecord -l
**** List of CAPTURE Hardware Devices ****
card 1: Generic_1 [HD-Audio Generic], device 0: ALC257 Analog [ALC257 Analog]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 2: acppdmmach [acp-pdm-mach], device 0: (null) dmic-hifi-0 []
  Subdevices: 1/1
  Subdevice #0: subdevice #0

# ls -la /sys/class/sound/controlC2/device/
total 0
drwxr-xr-x 5 root root    0 Nov 20 15:50 .
drwxr-xr-x 3 root root    0 Nov 20 15:50 ..
drwxr-xr-x 3 root root    0 Nov 20 15:47 controlC2
lrwxrwxrwx 1 root root    0 Nov 20 15:47 device -> ../../../acp-pdm-mach
-rw-r--r-- 1 root root 4096 Nov 20 15:50 id
-r--r--r-- 1 root root 4096 Nov 20 15:47 number
drwxr-xr-x 3 root root    0 Nov 20 15:47 pcmC2D0c
drwxr-xr-x 2 root root    0 Nov 20 15:50 power
lrwxrwxrwx 1 root root    0 Nov 20 15:47 subsystem -> ../../../../../../../../class/sound
-rw-r--r-- 1 root root 4096 Nov 20 15:47 uevent

# ls -la /sys/class/sound/controlC2/device/device/
total 0
drwxr-xr-x 5 root root    0 Nov 20 15:50 .
drwxr-xr-x 4 root root    0 Nov 20 15:50 ..
drwxr-xr-x 3 root root    0 Nov 20 15:50 acp-dmic-codec
lrwxrwxrwx 1 root root    0 Nov 20 15:47 driver -> ../../../../../../bus/platform/drivers/acp_mach
-rw-r--r-- 1 root root 4096 Nov 20 15:50 driver_override
-r--r--r-- 1 root root 4096 Nov 20 15:50 modalias
drwxr-xr-x 2 root root    0 Nov 20 15:50 power
drwxr-xr-x 3 root root    0 Nov 20 15:50 sound
lrwxrwxrwx 1 root root    0 Nov 20 15:47 subsystem -> ../../../../../../bus/platform
-rw-r--r-- 1 root root 4096 Nov 20 15:50 uevent

After the change of link name acp-dmic-codec,
the micmute led can work on ThinkPad T14s Gen 6.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/281
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/281.patch
Repository URL: https://github.com/alsa-project/alsa-utils
