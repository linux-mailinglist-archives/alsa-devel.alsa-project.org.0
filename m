Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A87B387902B
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Mar 2024 09:58:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E49AB6A;
	Tue, 12 Mar 2024 09:58:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E49AB6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710233938;
	bh=hCuAECMxyUMz1hZTguq6+lQ0cqK698NyJVkF+okRlBU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=jBZTLLpu3Kj4yzPykTiz66xf+1PMXchPcr5PZInafRGj65MjBApe3mAIgF1NfzqH7
	 iy3r7clzJf068hq0pBsQwgnEU1auM87lvSUTyXavfJmZWUignf2ltyo57B2YxM5zxg
	 P+Mr72HuPtKkAcblfxHmg62FnC5fxFPmkRgkQ0O8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD99BF8057A; Tue, 12 Mar 2024 09:58:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1543F8059F;
	Tue, 12 Mar 2024 09:58:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A3F3F8028D; Tue, 12 Mar 2024 09:55:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id A8175F80088
	for <alsa-devel@alsa-project.org>; Tue, 12 Mar 2024 09:55:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8175F80088
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1710233728147776365-webhooks-bot@alsa-project.org>
References: <1710233728147776365-webhooks-bot@alsa-project.org>
Subject: Focusrite USB UCM2 profile forcing 48kHz
Message-Id: <20240312085536.5A3F3F8028D@alsa1.perex.cz>
Date: Tue, 12 Mar 2024 09:55:36 +0100 (CET)
Message-ID-Hash: MWR4V7WNBU25VSU7OUWPV45AULZ4CRZL
X-Message-ID-Hash: MWR4V7WNBU25VSU7OUWPV45AULZ4CRZL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MWR4V7WNBU25VSU7OUWPV45AULZ4CRZL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #388 was opened from geoffreybennett:

I'm creating UCM2 profiles for the Focusrite USB interfaces. They support:
```
$ cat /proc/asound/Gen/stream0 
Focusrite Scarlett 4i4 4th Gen at usb-0000:00:14.0-6.4.1, high speed : USB Audio

Playback:
  Status: Running
    Interface = 1
    Altset = 1
    Packet Size = 216
    Momentary freq = 48000 Hz (0x6.0000)
  Interface 1
    Altset 1
    Format: S32_LE
    Channels: 6
    Endpoint: 0x01 (1 OUT) (SYNC)
    Rates: 44100, 48000, 88200, 96000, 176400, 192000
    Data packet interval: 125 us
    Bits: 24
    Channel map: FL FR FC LFE RL RR

Capture:
  Status: Running
    Interface = 2
    Altset = 1
    Packet Size = 216
    Momentary freq = 48000 Hz (0x6.0000)
  Interface 2
    Altset 1
    Format: S32_LE
    Channels: 6
    Endpoint: 0x81 (1 IN) (SYNC)
    Rates: 44100, 48000, 88200, 96000, 176400, 192000
    Data packet interval: 125 us
    Bits: 24
    Channel map: FL FR FC LFE RL RR
```
When I use my UCM2 profile that splits the inputs and outputs up, PipeWire will only select 48kHz. The Pro Audio and Direct profiles can use all the sample rates.

To me it sounded like https://github.com/alsa-project/alsa-ucm-conf/issues/313 but @perexg advised https://github.com/alsa-project/alsa-ucm-conf/issues/313#issuecomment-1989386017:

> For configurations using split macros, the default rate is hardcoded to 48kHz in the alsa-lib direct plugins. It would be better to create a bug in alsa-lib issue tracker.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/388
Repository URL: https://github.com/alsa-project/alsa-lib
