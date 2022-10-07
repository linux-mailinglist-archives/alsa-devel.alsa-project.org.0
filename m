Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E67745F7512
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Oct 2022 10:11:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DEE615CC;
	Fri,  7 Oct 2022 10:10:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DEE615CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665130308;
	bh=uV/LztXA4IyA35phZ8QU91Snpgx2dByjO2mskFUac7k=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MMOInMARDkjBD8rBEU7ORG88A2KBVzKE3Xaqs31unCEOjl7x1Q6udmz2W9V8XbUrw
	 F83ssTZ82yF28EAP5XmYaBh74hw413xP0NyjSHDKakSrwTBHdLlpZ7Hkw0NQQ1/KI3
	 GR+I21G6PqAE7YJsH3JhkHSaPMIdGfflhQeKAljo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E824F800BF;
	Fri,  7 Oct 2022 10:10:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA594F8025E; Fri,  7 Oct 2022 10:10:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 7E31DF800BF
 for <alsa-devel@alsa-project.org>; Fri,  7 Oct 2022 10:10:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E31DF800BF
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1665130244979584932-webhooks-bot@alsa-project.org>
References: <1665130244979584932-webhooks-bot@alsa-project.org>
Subject: master tree: Realtek ALC4080: "Failed to get the verb"
Message-Id: <20221007081050.EA594F8025E@alsa1.perex.cz>
Date: Fri,  7 Oct 2022 10:10:50 +0200 (CEST)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-ucm-conf issue #227 was opened from mavoga:

Hi,

wanted to test the UCM2 code in master for the onboard Realtek ALC4080 USB sound card (included in the list, 0db0:a073 MSI MAG X570S Torpedo Max); starting pulseaudio with new code causes this:

```
Oct 07 09:33:55 mybox systemd[2654]: Starting Sound Service...
-- Subject: A start job for unit UNIT has begun execution
-- Defined-By: systemd
-- Support: https://www.debian.org/support
-- 
-- A start job for unit UNIT has begun execution.
-- 
-- The job identifier is 540.
Oct 07 09:33:55 mybox pulseaudio[12140]: Failed to get the verb HiFi
Oct 07 09:33:55 mybox pulseaudio[12140]: Failed to get the verb HiFi 5+1
Oct 07 09:33:55 mybox pulseaudio[12140]: Failed to get the verb HiFi 7+1
Oct 07 09:33:55 mybox pulseaudio[12140]: No UCM verb is valid for hw:0
Oct 07 09:33:58 mybox pulseaudio[12140]: Failed to find a working profile.
[...]
```

v1.2.7.2 (without profile variants) works well. Is this expected in this development phase?

Debian up-to-date testing here, libasound2 v1.2.7.2

Thank you for your precious work!

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/227
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
