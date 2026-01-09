Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8DCD06CA2
	for <lists+alsa-devel@lfdr.de>; Fri, 09 Jan 2026 03:07:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7370B601F2;
	Fri,  9 Jan 2026 03:07:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7370B601F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1767924454;
	bh=vDG+cVWOKQv3qbNGuWu7CfeH37MWPeSjPqQyZo38YqI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=cFgOVkLbQ25ysFEKRgQ0zC1UZ/tWIIBusJkonNyeY+duDuf9qC825QEh2ZZUEL8qo
	 wqbZMrYOhhJBSsHXbVcQUlIRakP80XjGCZtMt/i/c5vXA/xpLtzJ/otqgODByjOJHE
	 FakpRHgRnp/Ea8DSBHCz1f8X4nw/4b9vtMLWJK80=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5EF8F8057E; Fri,  9 Jan 2026 03:07:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77F7EF805E2;
	Fri,  9 Jan 2026 03:07:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1D06F80526; Fri,  9 Jan 2026 03:04:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id EF6F1F80423
	for <alsa-devel@alsa-project.org>; Fri,  9 Jan 2026 03:04:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF6F1F80423
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1888edc7276ee900-webhooks-bot@alsa-project.org>
In-Reply-To: <1888edc726f04e00-webhooks-bot@alsa-project.org>
References: <1888edc726f04e00-webhooks-bot@alsa-project.org>
Subject: ASUS ROG Maximus XIII Hero (Tiger Lake,
 ALC4082) - Microphone not working - Missing USB ID 0b05:19ac
Date: Fri,  9 Jan 2026 03:04:59 +0100 (CET)
Message-ID-Hash: EJYHWIYZO6NJMDBBVOEPOQKMVCRN7LXG
X-Message-ID-Hash: EJYHWIYZO6NJMDBBVOEPOQKMVCRN7LXG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EJYHWIYZO6NJMDBBVOEPOQKMVCRN7LXG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #683 was opened from FallonBlue:

## Hardware
- **Motherboard**: ASUS ROG Maximus XIII Hero (Z490/Z590 chipset, Tiger Lake)
- **Audio Codec**: Realtek ALC4082 (connected via USB)
- **USB Device ID**: `0b05:19ac`
- **OS**: Bazzite (Fedora-based), kernel 6.17.7
- **Audio Stack**: PipeWire + WirePlumber

## Problem
The microphone input on the rear panel does not work. The device is detected as "Generic USB Audio" but ALSA UCM does not recognize it, so proper audio routing is not configured. Speaker/headphone output works fine.

## Root Cause
The USB device ID `0b05:19ac` is missing from the UCM configuration files:
- `/usr/share/alsa/ucm2/USB-Audio/USB-Audio.conf`
- `/usr/share/alsa/ucm2/USB-Audio/Realtek/ALC4080-HiFi.conf`

## Requested Fix
Please add `0b05:19ac` (ASUS ROG Maximus XIII Hero) to the ALC4080 UCM configuration, similar to how issue #165 was resolved for the Z690 Hero (`0b05:1a27`).

The device appears in lsusb as:
```
Bus 001 Device 002: ID 0b05:19ac ASUSTek Computer, Inc. USB Audio
```

## Additional Info
- Microphone works correctly in Windows
- Workaround: Using external USB microphone
- Related boards already in config: `0b05:1996` (Maximus XIII), `0b05:1a27` (Z690 Hero)

Thank you!

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/683
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
