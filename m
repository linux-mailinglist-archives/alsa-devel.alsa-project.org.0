Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCF2C666E2
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Nov 2025 23:32:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E270F601FA;
	Mon, 17 Nov 2025 23:31:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E270F601FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763418726;
	bh=GlJaWuB64EtC8ScRFNhzw+4sOiZWOYvi5IAsOj1MpfY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=PDXfnyNeqO8iz2c+0yosDM5LSpN9rw39Wcval7eZfeAaKhzz3bKOku4qGnD2HW32t
	 NUqcMyA9t484ppxoE5whTASMHPTgVIBLF7fesidK4YIgfpb/PIxOOHI6Tr/4PgZMqy
	 lUm3buqG1oMlFRWOJUX/j3XvE9czOoouXVLiWruE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD7DCF805C1; Mon, 17 Nov 2025 23:31:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FECBF805C6;
	Mon, 17 Nov 2025 23:31:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E38FF80551; Mon, 17 Nov 2025 23:31:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D0E0F8012B
	for <alsa-devel@alsa-project.org>; Mon, 17 Nov 2025 23:31:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D0E0F8012B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1878ebee917a5a00-webhooks-bot@alsa-project.org>
In-Reply-To: <1878ebee90853200-webhooks-bot@alsa-project.org>
References: <1878ebee90853200-webhooks-bot@alsa-project.org>
Subject: Lenovo Yoga Pro 14 built-in speakers volume not controlled by
 GNOME/PipeWire
Date: Mon, 17 Nov 2025 23:31:15 +0100 (CET)
Message-ID-Hash: AXNKOAYXUGTGNAP2PWZIXUWQTKFZRRHX
X-Message-ID-Hash: AXNKOAYXUGTGNAP2PWZIXUWQTKFZRRHX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AXNKOAYXUGTGNAP2PWZIXUWQTKFZRRHX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #642 was opened from 2O77:

Device: Lenovo Yoga Pro 14 14IMH9
Sound card: sof-hda-dsp
Problem: ALSA Post-Mixer / Pre-Mixer controls work via alsamixer, but GNOME volume slider or PipeWire sink volume does not affect hardware output. Likely an issue in the UCM profile for this device.

Steps to reproduce:
1. Boot Fedora (GNOME or KDE) or openSUSE Tumbleweed.
2. Attempt to change volume via GNOME slider or `pactl` / PipeWire controls.
3. Observe that output volume of laptop speakers does not change.
4. Testing with headphones (AirPods, Beats) or external speakers works correctly.

Notes:
- This issue is specific to the built-in laptop speakers.
- Different desktop environments (GNOME, KDE) and distributions (Fedora GNOME, Fedora KDE, openSUSE Tumbleweed) were tested and exhibit the same problem.
- ALSA `Post-Mixer` / `Pre-Mixer` controls work correctly when adjusted via `alsamixer`.

Expected behavior:
- GNOME / PipeWire slider should affect the actual hardware output volume of the laptop speakers.

Suggested area:
- UCM profile for sof-hda-dsp on this Lenovo model may need adjustment.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/642
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
