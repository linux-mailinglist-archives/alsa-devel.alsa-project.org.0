Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB3F5ED3B
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2019 22:10:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 178251696;
	Wed,  3 Jul 2019 22:09:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 178251696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562184619;
	bh=htnZadatx3SLnNKn0ZWQxDOZuwcFWHMT+cKUQVCbaRk=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ICyymAY9JYkF7ZYDxTLgYfgn68+n5DMSiC7dPg6cK9UhvYvvoCq2yKtmZVs/PBt18
	 6Hjpo4hlAouDWORBl4BffQEubL22YKOrCOtoPYj4N9fIdQbD62hZD3pM5QYuth0e5H
	 0aLJrGs0pdPpR5skJ49E8V6Vpo9EsoVPMNVUtjRA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47838F800F2;
	Wed,  3 Jul 2019 22:08:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EC66F800EA; Wed,  3 Jul 2019 22:08:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id F3DCEF800C5
 for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2019 22:08:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3DCEF800C5
MIME-Version: 1.0
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1562184509209604025-webhooks-bot@alsa-project.org>
References: <1562184509209604025-webhooks-bot@alsa-project.org>
Message-Id: <20190703200832.7EC66F800EA@alsa1.perex.cz>
Date: Wed,  3 Jul 2019 22:08:32 +0200 (CEST)
Subject: [alsa-devel] when aplaymidi exits the sustained notes are played
	forever.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-utils issue #22 was opened from mercuriete:

Transfered from here:
https://github.com/OpenTTD/OpenTTD/issues/7637

### Expected Result
All notes are stoped before exit aplaymidi

### Actual Result
Notes are sustained forever and I have to press the panic button on Qsynth

### Steps to Reproduce

1. Open Qsynth with fluid-soundfonts
2. do this: ```aplaymidi --port 128:0 file.mid```
3. do control+c to kill aplaymidi
4. Qsynth plays a note forever.

### Possible fix

Capture SIGINT and send midi off messages before exit properly.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/22
Repository URL: https://github.com/alsa-project/alsa-utils
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
