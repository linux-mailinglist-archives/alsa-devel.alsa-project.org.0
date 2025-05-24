Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 479E7AC2ECD
	for <lists+alsa-devel@lfdr.de>; Sat, 24 May 2025 12:14:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB29B601EC;
	Sat, 24 May 2025 12:13:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB29B601EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1748081638;
	bh=3LYzinSD5GGXhf4u3fUt0es6jfbw6AvapG/Ry2wc9HI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=jmQh4Wxo2+2GB5ktugFqE6ORiOwegXizFM1zwgWDbJE/q3CW2XTB2vi5v39qi9fil
	 uIc4W5h2V1g0oVHxwgE1ksubmXWCmRtGxudvJVWXXNVxX8/ZA00/XJ6lE1iOZiz8DX
	 xWeNyeuIz+mixRx6BntiH70NslcAWPV4e52B3qZI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A49EF805BD; Sat, 24 May 2025 12:13:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C9B7F805AB;
	Sat, 24 May 2025 12:13:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5C72F8026D; Sat, 24 May 2025 12:13:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id EF26BF80246
	for <alsa-devel@alsa-project.org>; Sat, 24 May 2025 12:13:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF26BF80246
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18426ef36da44f00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/566@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/566@alsa-project.org>
Subject: USB-Audio: Solid State Labs SSL 2 - fix capture channels
Date: Sat, 24 May 2025 12:13:19 +0200 (CEST)
Message-ID-Hash: V3XLKCS7LJKKWT5DPZVAYLAGYWF6HSZO
X-Message-ID-Hash: V3XLKCS7LJKKWT5DPZVAYLAGYWF6HSZO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V3XLKCS7LJKKWT5DPZVAYLAGYWF6HSZO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #566 was opened from olfx:

Same fix as for SSL+, commit fc17ed4.
Capture configuration is the same, with 4 channels.

-- alsa-info --

Solid State Logic SSL 2 at usb-0000:00:14.0-1, high speed : USB Audio

Playback:
  Status: Stop
  Interface 1
    Altset 1
    Format: S32_LE
    Channels: 2
    Endpoint: 0x01 (1 OUT) (ASYNC)
    Rates: 44100, 48000, 88200, 96000, 176400, 192000
    Data packet interval: 125 us
    Bits: 24
    Channel map: FL FR
    Sync Endpoint: 0x81 (1 IN)
    Sync EP Interface: 2
    Sync EP Altset: 1
    Implicit Feedback Mode: Yes

Capture:
  Status: Stop
  Interface 2
    Altset 1
    Format: S32_LE
    Channels: 4
    Endpoint: 0x81 (1 IN) (ASYNC)
    Rates: 44100, 48000, 88200, 96000, 176400, 192000
    Data packet interval: 125 us
    Bits: 24
    Channel map: FL FR FC LFE

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/566
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/566.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
