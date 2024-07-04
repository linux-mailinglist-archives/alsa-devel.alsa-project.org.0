Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 447DB927D02
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2024 20:29:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46B97F54;
	Thu,  4 Jul 2024 20:28:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46B97F54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720117746;
	bh=JujhFe59mhr8xS9BtyfacrfTUrmOPSDyMjq3PFl1uO8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=PW5AOXEjfzv5zhvznZ2+BEXDYEZhceyC4LPKfnvumvuhqSqU+/UODxBspbI5tKc2p
	 jorJuZc0TugxUgUlJ52oETuJcbcick4VK5mWYF7QYExkfbMjdSYIeljmhhKUgHotoB
	 5M5V2wT+mvRoNGI7EyaZd2GaSHoqlMIXb7ZUjZ4A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 889DBF805B0; Thu,  4 Jul 2024 20:28:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D817CF805AD;
	Thu,  4 Jul 2024 20:28:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1325FF8025E; Thu,  4 Jul 2024 20:28:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 07E9BF800F8
	for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2024 20:28:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07E9BF800F8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1720117699071914434-webhooks-bot@alsa-project.org>
References: <1720117699071914434-webhooks-bot@alsa-project.org>
Subject: [A52] Pipeware errors
Message-Id: <20240704182825.1325FF8025E@alsa1.perex.cz>
Date: Thu,  4 Jul 2024 20:28:25 +0200 (CEST)
Message-ID-Hash: BKOPPX7ZDFEDZDDPET5G2YTHD5NG5352
X-Message-ID-Hash: BKOPPX7ZDFEDZDDPET5G2YTHD5NG5352
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BKOPPX7ZDFEDZDDPET5G2YTHD5NG5352/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-plugins issue #59 was opened from ManuLinares:

https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/4085

I'm getting this errors:

```
jul 03 21:12:38 thought pipewire[63110]: ALSA lib confmisc.c:165:(snd_config_get_card) Cannot get card index for %f
jul 03 21:12:38 thought pipewire[63110]: spa.alsa: 'plug:{SLAVE="a52:0,'hw:%f,3'"}': playback open failed: No such device
jul 03 21:12:38 thought pipewire[63110]: mod.adapter: 0x5b856abf1c30: can't get format: No such device
jul 03 21:12:38 thought pipewire[63110]: mod.adapter: usage: node.name=<string>
jul 03 21:14:21 thought wireplumber[63111]: wplua: [string "alsa.lua"]:182: attempt to concatenate a nil value (local 'node_name')
                                            stack traceback:
                                                    [string "alsa.lua"]:182: in function <[string "alsa.lua"]:175>
```

could this be related to the this commit? https://github.com/alsa-project/alsa-plugins/commit/dfc65f2d1f239256c201c68b70a5d08e6afa879f

Issue URL     : https://github.com/alsa-project/alsa-plugins/issues/59
Repository URL: https://github.com/alsa-project/alsa-plugins
