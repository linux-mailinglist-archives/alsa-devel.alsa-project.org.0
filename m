Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D014916FB9
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2024 20:02:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45EDE950;
	Tue, 25 Jun 2024 20:02:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45EDE950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719338574;
	bh=38jwKbsSHYYMVP/qS+wtmBIYQb2GDDxHDi3LrUiZqOg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=DsiYhKL0HNqGNvLhnl5YplVe/CEaMm/PNamPl3cM0/8ECdPfG+x87CzYjfoSCekIW
	 jQygWQOC2Fvg+lKu82ldzNcYpWGojRS6rZhMjdDhDpE4dlbIL7hxMIvYAeYiaQt/oj
	 mc2JYnnbAyFJp6W7rc891tPnUFi7qM5fkvC4RSJM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44A02F805AD; Tue, 25 Jun 2024 20:02:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F45DF805AF;
	Tue, 25 Jun 2024 20:02:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D720DF80495; Tue, 25 Jun 2024 19:54:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id B7FE7F8013D
	for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2024 19:50:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7FE7F8013D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1719337812030953407-webhooks-bot@alsa-project.org>
References: <1719337812030953407-webhooks-bot@alsa-project.org>
Subject: Virtual nodes created by UCM rules have the exact same nick,
 making them indistinguishable in KDE's audio applet
Message-Id: <20240625175458.D720DF80495@alsa1.perex.cz>
Date: Tue, 25 Jun 2024 19:54:58 +0200 (CEST)
Message-ID-Hash: W5ZXMNBSPO23ZHO7EVTLQ4UANAAZ3IGA
X-Message-ID-Hash: W5ZXMNBSPO23ZHO7EVTLQ4UANAAZ3IGA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W5ZXMNBSPO23ZHO7EVTLQ4UANAAZ3IGA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #426 was opened from z411:

Hello,

Recently KDE Plasma's applet started using the node's nick to show the name of the device. The problem is that for audio interfaces that separate their inputs into virtual interfaces, they end up with something like this:

```
alsa.card_name = "Volt 2"
device.profile.description = "Mono Input 1"
node.description = "Volt 2 Mono Input 1"
node.nick = "Volt 2"
```

```
alsa.card_name = "Volt 2"
device.profile.description = "Mono Input 2"
node.description = "Volt 2 Mono Input 2"
node.nick = "Volt 2"
```

Since they use the same nick, the end result is that we end up with an input list that looks like this:

![image](https://github.com/alsa-project/alsa-ucm-conf/assets/1988512/34e794ce-07ce-45b8-8be4-073dad24d339)

Could the node nick be changed to reflect that this is a virtual device that refers to a different input from the same device? We already have an issue about this open in PipeWire and KDE issue trackers but we're not sure where this should be really fixed.

Thanks.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/426
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
