Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FD46C4F25
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 16:15:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09EB8E99;
	Wed, 22 Mar 2023 16:14:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09EB8E99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679498115;
	bh=1BAEfvYGiP4GqqkkucbMLg6rKokCGIvoThXxW6taIgo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=n37gGhoEFnY2vzbHvbzXeUKiBN5hYjHhRPpVrB4u8PY29BfLYxDw9mCtpdYG3Ez6N
	 jDKhNaqmdf0vHcdynR91OkjUtamZb8XVdpjkCsoYzLZ5wi4UuPT+6wDwbFNT7TPRKg
	 DyICIvRFH/TBJPMU+3ZWaWRTOhWZAlEd0vgFIaLw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D475F80254;
	Wed, 22 Mar 2023 16:14:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 331B9F8027B; Wed, 22 Mar 2023 16:14:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E736F80105
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 16:14:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E736F80105
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1679498053959976196-webhooks-bot@alsa-project.org>
References: <1679498053959976196-webhooks-bot@alsa-project.org>
Subject: USB-Audio: Add Sony inzone H7/H9 headset default/HiFi usecase
Message-Id: <20230322151420.331B9F8027B@alsa1.perex.cz>
Date: Wed, 22 Mar 2023 16:14:20 +0100 (CET)
Message-ID-Hash: I2T7VYENLCMIU4UCNATY3EEPB5FGG75G
X-Message-ID-Hash: I2T7VYENLCMIU4UCNATY3EEPB5FGG75G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I2T7VYENLCMIU4UCNATY3EEPB5FGG75G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #293 was opened from laurensmiers:

The Sony inzone H7/H9 headset has two usb audio outputs and one usb audio input.

One pair of audio output and input is the 'chat' interface which is normally connected to a chat client.

The remaining audio ouput is the 'game' interface, which is normally connected to the actual game you're playing.

The 'game' interface lists as a separate USB subdevice in alsa.

This commit adds the HiFi usecase for the Sony headset which is as follows:
- One chat device
  - One audio output
  - One audio input
- One game device
  - One audio output

Tested with pipewire and pulseaudio, verified with pavucontrol, both devices are listed and audio can be played on both. The audio is mixed in the headset itself.

Control wise there isn't much, the only thing that is reported in alsamixer is a volume control for the CAPTURE channel. However, changing the volume of this does not seem to affect the actual audio that is recorded, so I don't see a need to change this when enabling the device.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/293
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/293.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
