Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE06701A95
	for <lists+alsa-devel@lfdr.de>; Sun, 14 May 2023 00:38:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 627B8EAC;
	Sun, 14 May 2023 00:37:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 627B8EAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684017518;
	bh=h9sUukgjBGkeX8nm182r0/i4q0M3Yb9YVOPgtFCEo4s=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=tsme2ZLTNA3K9BdkHf/6Gv0mt1PgsnjkspVD0Er/87xZxj3zLMFGdcLqYF6hddz1g
	 8dycol9c9xj7mYpcAaseskE3qu0uXMy1xznOrMl5uvc6lfuayIfElS86KJkhFW8+Am
	 NzvGBUIa9gIeYK0JgFp0yaDOBqURLOQPwemvx+Aw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A956BF80552; Sun, 14 May 2023 00:37:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21D02F8025A;
	Sun, 14 May 2023 00:37:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04EA2F80272; Sun, 14 May 2023 00:37:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 67887F80087
	for <alsa-devel@alsa-project.org>; Sun, 14 May 2023 00:37:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67887F80087
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1684017453858162642-webhooks-bot@alsa-project.org>
References: <1684017453858162642-webhooks-bot@alsa-project.org>
Subject: Set C-Media USB 7.1 sound card to six_channel for surround40
Message-Id: <20230513223742.04EA2F80272@alsa1.perex.cz>
Date: Sun, 14 May 2023 00:37:42 +0200 (CEST)
Message-ID-Hash: L6GNPFB3DIXBJTOHRQGX76VQ4L2ECKUU
X-Message-ID-Hash: L6GNPFB3DIXBJTOHRQGX76VQ4L2ECKUU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L6GNPFB3DIXBJTOHRQGX76VQ4L2ECKUU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib pull request #319 was opened from runderwo:

This 7.1 analog sound card identifies as the following: 0d8c:0102 C-Media Electronics, Inc. CM106 Like Sound Device (lsusb)
 1 [ICUSBAUDIO7D   ]: USB-Audio - ICUSBAUDIO7D (/proc/asound/cards)

It has the following four-channel analog stream layout:
  Interface 1
    Altset 3
    Format: S16_LE
    Channels: 4
    Endpoint: 6 OUT (ADAPTIVE)
    Rates: 44100, 48000
    Bits: 16
    Channel map: FL FR FC LFE
(/proc/asound/card1/stream0)

This layout makes it impossible to play audio to the surround (SL/SR) speakers plugged into the "Surround" jack in 4 channel mode.  Instead, set six_channel so that the six-channel layout will be used to access those speakers:
  Interface 1
    Altset 4
    Format: S16_LE
    Channels: 6
    Endpoint: 6 OUT (ADAPTIVE)
    Rates: 44100, 48000
    Bits: 16
    Channel map: FL FR FC LFE SL SR

Tested with speaker-test -Dsurround40:CARD=ICUSBAUDIO7D,DEV=0 -c4

The speaker system that required surround40 in order to downmix LFE into the front/rear mix is a Klipsch ProMedia v.2-400, which has 4 speakers and a subwoofer with an internal crossover, connected via front and rear stereo analog cables.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/319
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/319.patch
Repository URL: https://github.com/alsa-project/alsa-lib
