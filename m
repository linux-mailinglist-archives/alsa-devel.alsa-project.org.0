Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97243C2E0B6
	for <lists+alsa-devel@lfdr.de>; Mon, 03 Nov 2025 21:33:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B124601C0;
	Mon,  3 Nov 2025 21:33:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B124601C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762202036;
	bh=P6OzghuUk14uJkfaCZm8q5BTSV97Jg4naFjXZQ/2Ylg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=HRNfnRkiQ1isUOy2RZtkOW2J/hUvBmvVP40KlpqjGi0vzDgCRn6VAjoTf0JZnXgnh
	 NsJM/d6qKda8DSuu2NnRFUNT0C1VNjPKBt5szUvOciH0zJmj4x8gb1nUyhRehb+F4H
	 tGIOCuop2+WSit2ULbmtcCOQ2gGRDpbjZorUe5Ks=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA137F805D3; Mon,  3 Nov 2025 21:33:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C758F805BA;
	Mon,  3 Nov 2025 21:33:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26057F80107; Mon,  3 Nov 2025 21:33:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 22927F80107
	for <alsa-devel@alsa-project.org>; Mon,  3 Nov 2025 21:32:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22927F80107
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1874995909bf7a00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/634@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/634@alsa-project.org>
Subject: USB-Audio: Add support for DualSense PS5 controller
Date: Mon,  3 Nov 2025 21:33:03 +0100 (CET)
Message-ID-Hash: 5AISSBAZVJ42MW6AILRQ4H2V2WOKHWQM
X-Message-ID-Hash: 5AISSBAZVJ42MW6AILRQ4H2V2WOKHWQM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5AISSBAZVJ42MW6AILRQ4H2V2WOKHWQM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #634 was opened from cristicc:

The Sony DualSense wireless controller (PS5) has an internal mono speaker and a microphone, in addition to a 3.5mm jack socket for headphone output and headset microphone input.

Because this is a UAC1 device, it doesn't advertise any jack detection capability.  However, since kernel v6.18-rc1 (see [1]), the controller is able to report HP & MIC insert events via HID, i.e. through a dedicated input device managed by the hid-playstation driver.  This is further used by a quirk in the generic USB audio driver (added in v6.17, see [2]), which creates the Headphone Jack & Headset Mic Jack controls and receives hotplug events from the HID driver via input handlers.

Moreover, the device provides haptic feedback functionality, which is controlled by a pair of dedicated channels in a quadraphonic audio stream.

Ensure proper support for audio switching between headphones/headset and internal speaker/microphone by adding a UCM to split the 4.0 PCM stream into 4 mono channels or a pair of stereo (FL+FR) channels, depending on the active output device/profile.

[1] https://lore.kernel.org/all/20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com/
[2] https://lore.kernel.org/all/20250526-dualsense-alsa-jack-v1-0-1a821463b632@collabora.com/

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/634
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/634.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
