Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EF0CBB69A
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Dec 2025 05:46:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B06FD60226;
	Sun, 14 Dec 2025 05:46:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B06FD60226
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765687594;
	bh=eCJocvY/QsrfC6P9vP+X055rK60eu+9BR34mIt3liAU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=UXg5t8dYuLVTZRUxVlWf5PwprOrAFgPy6UGotbwRlm7CKaVznuwf+36LBMHwUERzE
	 64ctvOdl9j1pHoU9txAfZyMseA7KL7eH7WEP0g4UFRMONqRdvNLEy4XVfPZl+OgNbf
	 Mt2R7bMB7wBjbmEkCvxdKgq5HX1f6FPj1nwToFDU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2BF1F805D3; Sun, 14 Dec 2025 05:46:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BEE5CF805D7;
	Sun, 14 Dec 2025 05:45:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47205F80236; Sun, 14 Dec 2025 05:45:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 37AEBF800E4
	for <alsa-devel@alsa-project.org>; Sun, 14 Dec 2025 05:45:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37AEBF800E4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1880fb7626f4cb00-webhooks-bot@alsa-project.org>
In-Reply-To: <1880fb7625e82d00-webhooks-bot@alsa-project.org>
References: <1880fb7625e82d00-webhooks-bot@alsa-project.org>
Subject: amixer decrease volume fails when volume is 100 and increment is 1 or
 2
Date: Sun, 14 Dec 2025 05:45:41 +0100 (CET)
Message-ID-Hash: ALYBD6IC7UN2SPUQLSH3Z2AR4IFGIDPC
X-Message-ID-Hash: ALYBD6IC7UN2SPUQLSH3Z2AR4IFGIDPC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ALYBD6IC7UN2SPUQLSH3Z2AR4IFGIDPC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #313 was opened from vExcess:

If the volume is at 100%, running either of the following fails to decrease the volume
```
amixer -D pulse sset Master 2%-
amixer -D pulse sset Master 1%-
```

Running `amixer -D pulse sset Master 2%-` outputs
```
Simple mixer control 'Master',0
  Capabilities: pvolume pswitch pswitch-joined
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 65536
  Mono:
  Front Left: Playback 64225 [98%] [on]
  Front Right: Playback 64225 [98%] [on]
```
It looks like it has decreased the volume by 2%, but it actually hasn't. When I run the command repeatedly it stays at 98% and doesn't go lower. But even though amixer says the volume is at 98%, Linux Mint still reports it as 100%.

I'm using alsa-utils 1.2.9-1ubuntu5

```
OS: Linux Mint 22.2 x86_64
Host: 83DD IdeaPad Slim 5 16AHP9
Kernel: 6.11.0-29-generic
```

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/313
Repository URL: https://github.com/alsa-project/alsa-utils
