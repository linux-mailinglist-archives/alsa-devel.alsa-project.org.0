Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A411C7DE6D
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Nov 2025 09:44:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C25A60203;
	Sun, 23 Nov 2025 09:44:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C25A60203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763887498;
	bh=IQmC4p4TQEzWjBBMFz6HWbl8Iae8WbBiP3I+QD+TKD8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=SJSEEJnhKQy1yHPDgGFfJU+QP26YsdGxGK6IAINUnHJ65MRjny81C//j5sXVF78E/
	 WhO1NwfXvMfniXeeQbYKQdV4fyTnGzhULMJDqLTqW2FMZeTmiuOUQtw4lDRDbIctVk
	 c8yzK8bhk89xUjltZv0Q5iAA4jKKxqqW94CEOQFg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50BB0F805C6; Sun, 23 Nov 2025 09:44:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0E8CF805C9;
	Sun, 23 Nov 2025 09:44:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7CDAF8051D; Sun, 23 Nov 2025 09:43:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id A7EC0F8016E
	for <alsa-devel@alsa-project.org>; Sun, 23 Nov 2025 09:43:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7EC0F8016E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <187a96465f610200-webhooks-bot@alsa-project.org>
In-Reply-To: <187a96465ea09d00-webhooks-bot@alsa-project.org>
References: <187a96465ea09d00-webhooks-bot@alsa-project.org>
Subject: Add MSI MPG B850I Edge TI Wifi motherboard support for ALC4080
Date: Sun, 23 Nov 2025 09:43:58 +0100 (CET)
Message-ID-Hash: RAZYDJYPAPL3FXLQLDM4ZAVFGQN6AM7R
X-Message-ID-Hash: RAZYDJYPAPL3FXLQLDM4ZAVFGQN6AM7R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RAZYDJYPAPL3FXLQLDM4ZAVFGQN6AM7R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #647 was opened from YourNumNums:

The MSI MPG B850I Edge TI Wifi motherboard only plays sound out of the rear i/o panel auxiliary port. I do not see any way to activate the rear optical output or the front auxiliary port.

Here is my [alsa-info](https://alsa-project.org/db/?f=67f95e30cfe710cefa38544c4b5dd6c1b31cb1ad), and the device ID is below:

```
$ lsusb | grep Audio
Bus 001 Device 004: ID 0db0:d4fa Micro Star International USB Audio
```

This looks like a similar issue to [issue 172](https://github.com/alsa-project/alsa-ucm-conf/issues/172), except this time `d4fa` needs to be added to the 0db0 regex for ucm2/USB-Audio/USB-Audio.conf for ALC4080 support.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/647
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
