Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C6B88F524
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Mar 2024 03:07:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B7B72C77;
	Thu, 28 Mar 2024 03:07:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B7B72C77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711591657;
	bh=wua7J1Hke6VQ2wvxc32Ary8BBwtga1jn5p7n59otYjc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=l1xHuViiDNOWYpWkCUTdkx+xrxONwD4P1C2F3ZryvP2iUdp1wzCxKPDVWCGjJNGu0
	 3JJmUZLPdsF72KUIj6kyg7I3CKtfxGo9eiruqlOn5msWPmN+syYT5zFSgxW3WA9MAN
	 +rEoURDIsolgO6QiPvhZ1bSfgpZ6r2pnPExhSS9A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A39BF805AA; Thu, 28 Mar 2024 03:07:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F240F80236;
	Thu, 28 Mar 2024 03:07:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33531F8025F; Thu, 28 Mar 2024 03:07:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 84AB3F801EB
	for <alsa-devel@alsa-project.org>; Thu, 28 Mar 2024 03:06:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84AB3F801EB
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1711591615910030603-webhooks-bot@alsa-project.org>
References: <1711591615910030603-webhooks-bot@alsa-project.org>
Subject: Dummy output with ES8326 codec
Message-Id: <20240328020700.33531F8025F@alsa1.perex.cz>
Date: Thu, 28 Mar 2024 03:07:00 +0100 (CET)
Message-ID-Hash: PSTMYTF5OS35CZKJX4F6EEO5SV2A3SIQ
X-Message-ID-Hash: PSTMYTF5OS35CZKJX4F6EEO5SV2A3SIQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PSTMYTF5OS35CZKJX4F6EEO5SV2A3SIQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #407 was opened from Henrythek:

## Description
During the process of using the ES8326 codec, I encountered a dummy output issue. killall pulseaudio do not work, even after masking and then unmasking the pulseaudio service and attempting to restart it, the issue persists. The dummy output occurs intermittently when plugging in or unplugging headphones, and rebooting can temporarily resolve the issue. I am using the following configuration:

- Operating System: Debian GNU/Linux 12
- Kernel Version: 6.7.0

## Error Messages
E: [pulseaudio] module-alsa-card.c: Failed to find a working profile.

E: [pulseaudio] module.c: Failed to load module "module-alsa-card" (argument: "device_id="0" name="pci-0000_00_1f.3-platform-sof-essx8336" card_name="alsa_card.pci-0000_00_1f.3-platform-sof-essx8336" namereg_fail=false tsched=yes fixed_latency_range=no ignore_dB=no deferred_volume=yes use_ucm=yes avoid_resampling=no card_properties="module-udev-detect.discovered=1""): initialization failed.

I: [pulseaudio] module-udev-detect.c: Card /devices/pci0000:00/0000:00:1f.3/sof-essx8336/sound/card0 (alsa_card.pci-0000_00_1f.3-platform-sof-essx8336) failed to load module.
## Additional Information
The UCM (Use Case Manager) configuration used is from the following repository:
[alsa-ucm-conf/ucm2/Intel/sof-essx8336](https://github.com/alsa-project/alsa-ucm-conf/tree/master/ucm2/Intel/sof-essx8336)

## Steps to Reproduce
1. Use the ES8326 codec on a Debian GNU/Linux 12 system with Kernel 6.7.0.
2. Attempt to use the audio functionality.
3. Plug in or unplug headphones.
4. Observe the dummy output issue and the error messages mentioned above.

## Additional Context
[alsa-info.txt](https://github.com/alsa-project/alsa-ucm-conf/files/14782974/alsa-info.txt)
[aplay.txt](https://github.com/alsa-project/alsa-ucm-conf/files/14782975/aplay.txt)
[pulseaudio_v.txt](https://github.com/alsa-project/alsa-ucm-conf/files/14782976/pulseaudio_v.txt)
![Screenshot from 2024-03-27 21-44-34](https://github.com/alsa-project/alsa-ucm-conf/assets/68213530/925411b3-82dc-439e-96ae-7d273bd1e57d)

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/407
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
