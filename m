Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9DB6EE779
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Apr 2023 20:20:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74B781085;
	Tue, 25 Apr 2023 20:19:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74B781085
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682446826;
	bh=a5e362dR6ySmw3iQpUCph0QtcBgaA6XNxOfsDsKytJ8=;
	h=Date:From:To:Subject:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hJYlXt7/n12Z+/NphaDoZAzM9C5E9aJS0PRW5xL2qfbKy36n6WyOhRBXNcz4bs+kd
	 irYtt2Zi2stk8UJ+87o3JmME2UAtKn0f3FJp3POt0PRZGJJpOk+K4wNEaqMNMvlJiu
	 ZskjuGOXzD6x7WZT3p+ca/3ZWZUeHWY1tXttPNyk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC5DEF8018A;
	Tue, 25 Apr 2023 20:19:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A70FEF80236; Tue, 25 Apr 2023 20:19:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CB328F800F8
	for <alsa-devel@alsa-project.org>; Tue, 25 Apr 2023 20:19:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB328F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hUbarVpp
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 578856100E;
	Tue, 25 Apr 2023 18:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805DDC433D2;
	Tue, 25 Apr 2023 18:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682446765;
	bh=a5e362dR6ySmw3iQpUCph0QtcBgaA6XNxOfsDsKytJ8=;
	h=Date:From:To:Cc:Subject:From;
	b=hUbarVppEHXayqsLjl4Il6wCkfQW/tj7LIAge1mA22D+CPDvYi9xL0fuAL8c0GZky
	 iX0Uh7x6sV2naYai+MHUlMcALiypzNGTq87og0UNAq7BfGlp6yMgrDr/dRgZojq7Zx
	 +7tGAJMTY1XptODsTAeBLUTyjQsiWeI8RBbTAbbX5uq0iSdNnl6MSCYs5eqD6Z4xZw
	 LNoI3ncfEk86w6aaFgMhYkuqMxgL+fybqVF2rREnco5ALB9JVAduDtP9VOhcnH+NCR
	 9/pNrcNSQHXT4Oi/naqPpgSbdhalLWijaJLmovHrZhTUwKtMDw/SX/rx4C5YfUbLrm
	 CaRfNdXdJn5cg==
Date: Tue, 25 Apr 2023 11:19:24 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: USB sound card freezes USB after resume from suspend
Message-ID: <20230425111924.05cf8b13@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MLVKW5LEGL3AWZEOJHNZWQXXYTH3Z4XM
X-Message-ID-Hash: MLVKW5LEGL3AWZEOJHNZWQXXYTH3Z4XM
X-MailFrom: kuba@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, regressions@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MLVKW5LEGL3AWZEOJHNZWQXXYTH3Z4XM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi!

For a few weeks now I can't use any USB devices if I suspend my laptop
with my USB sound card active and resuming it without it connected.

USB worker threads seems to be sitting in:

[<0>] snd_pcm_dev_disconnect+0x1e8/0x280 [snd_pcm]
[<0>] snd_device_disconnect_all+0x42/0x80 [snd]
[<0>] snd_card_disconnect+0x128/0x290 [snd]
[<0>] usb_audio_disconnect+0x11a/0x2c0 [snd_usb_audio]
[<0>] usb_unbind_interface+0x8c/0x270
[<0>] device_release_driver_internal+0x1b2/0x230
[<0>] bus_remove_device+0xd8/0x150
[<0>] device_del+0x18b/0x410
[<0>] usb_disable_device+0xc6/0x1e0
[<0>] usb_disconnect+0xda/0x2c0
[<0>] usb_disconnect+0xbf/0x2c0
[<0>] usb_disconnect+0xbf/0x2c0
[<0>] usb_disconnect+0xbf/0x2c0
[<0>] hub_event+0xf01/0x1cd0
[<0>] process_one_work+0x1c4/0x3d0
[<0>] worker_thread+0x4d/0x380
[<0>] kthread+0xe6/0x110
[<0>] ret_from_fork+0x29/0x50

Which is:

snd_pcm_dev_disconnect (/usr/src/debug/kernel-6.2.12/linux-6.2.12-300.fc38.x86_64/sound/core/pcm.c:818 /usr/src/debug/kernel-6.2.12/linux-6.2.12-300.fc38.x86_64/sound/core/pcm.c:812 /usr/src/debug/kernel-6.2.12/linux-6.2.12-300.fc38.x86_64/sound/core/pcm.c:1129) snd_pcm

It happens on Fedora 37 and Fedora 38, it seems to have coincided with
the 6.2 kernel but I'm not 100% sure.

The USB devices come back after half an hour or so, silently.
There's nothing of note in dmesg.
