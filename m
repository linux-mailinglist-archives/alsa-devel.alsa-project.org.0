Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEB0CC50A9
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Dec 2025 20:52:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 221BA60223;
	Tue, 16 Dec 2025 20:52:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 221BA60223
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765914763;
	bh=BCYJaLZNf28iVlWus/elo6oLUOB63o4BP4yoyALiv9w=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=McgQJYzeV9o91k2cqBvCRZslxAD8Iky1zVYxATek4OUFAOcimY6gmBYDa9wRHVeWC
	 /m6z/b9gChKB7YT5pgnqcWfhWtaVzkGNXI2thd6hWPhn8Z8+bI/V7HrhCeKjgnn9GY
	 Tra4bU8MEZdeJ1LN0+QR0w2IMQcsPPBzV7HJL9Lk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA29CF805E3; Tue, 16 Dec 2025 20:52:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6364AF805D8;
	Tue, 16 Dec 2025 20:52:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C34D4F80217; Tue, 16 Dec 2025 20:52:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id D4BFEF800DF
	for <alsa-devel@alsa-project.org>; Tue, 16 Dec 2025 20:51:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4BFEF800DF
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1881ca14cfc13600-webhooks-bot@alsa-project.org>
In-Reply-To: <1881ca14cfb83600-webhooks-bot@alsa-project.org>
References: <1881ca14cfb83600-webhooks-bot@alsa-project.org>
Subject: Behringer UMC404HD Line A/B volume too low when used in "Pro Audio"
 mode
Date: Tue, 16 Dec 2025 20:52:01 +0100 (CET)
Message-ID-Hash: AKO4IHHHKJFIITVRDHMBL2S4AJIWSZJX
X-Message-ID-Hash: AKO4IHHHKJFIITVRDHMBL2S4AJIWSZJX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AKO4IHHHKJFIITVRDHMBL2S4AJIWSZJX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #662 was edited from mrbumpy409:

The Behringer UMC404HD shows five volume faders in alsamixer:
* **Line A** and **UMC404HD 192k Output Front**: These faders are linked (changing one changes the other) and control the level of **L & R MAIN OUT** and **PLAYBACK OUTPUT A 1/L & 2/R** on the back of the unit.
* **Line B** and **UMC404HD 192k Output Back**: These faders are linked and control the level of **PLAYBACK OUTPUT B 3/L & 4/R**.
* **UMC404HD 192k Output 1**: The primary volume control for the unit.

How these sliders are used by Pipewire depends on the mode selected for the Behringer:
* **Default**: Two output devices are presented to the user:
  - **UMC404HD 192k Line A**: Controls the "Line A" volume in alsamixer.
  - **UMC404HD 192k Line B**: Controls the "Line B" volume in alsamixer.
  - The "UMC404HD 192k Output 1" slider in alsamixer appears to be unused.
* **Direct UMC404HD 192k**: One output device is presented to the user:
  - **Direct UMC404HD 192k**: Doesn't seem to be manipulating any of the hardware output levels in alsamixer.
  - The "Line A" and "Line B" channels are not available via Pipewire in this mode.
* **Pro Audio**: One output device is presented to the user:
  - **UMC404HD 192k Pro**: Controls the "UMC404HD 192k Output 1" output level in alsamixer.
  - The "Line A" and "Line B" channels are not available via Pipewire in this mode.

I would imagine most people are using a Behringer UMC404HD for recording purposes, and therefore would likely be using it in "Pro Audio" mode (or at least they should be if they care about latency).

Since a recent update (Fedora 43 KDE), the levels of the "Line A" and "Line B" channels (and their linked pairs) are being set by default to **41**, which results in audio that is far too quiet when using the line outputs (headphone output is unaffected). Furthermore, these low levels throw off the balance between the computer's output and the UMC404HD's live input monitoring. "Line A" and "Line B" channels should both be at **100** by default to match the Windows driver (and previous ALSA version?) and provide correct balance with the live monitoring feature.

Currently, I have to run alsamixer on every boot to adjust "Line A" and "Line B" to **100**. Am I right to report this to ALSA, or is this something Pipewire should be handling? Pipewire doesn't appear to touch the "Line A" or "Line B" levels at all when in "Pro Audio" mode, so I'd assume this is ALSA's doing, but I don't really know.

### My System

* **OS:** Fedora Linux 43 Plasma Desktop Edition (Plasma Desktop 6.5.4, KDE Frameworks 6.21.0, Qt 6.10.1)
* **Linux Kernel:** 6.17.11-300.fc43.x86_64 (64-bit)

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/662
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
