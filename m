Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B3949D979
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jan 2022 04:45:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C41B91B52;
	Thu, 27 Jan 2022 04:44:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C41B91B52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643255110;
	bh=aGKzmSbqzKgSA4BoBZdkVjwis5+7CKaeM89gV7afKVM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=miJdHLekfutmMCS8mFnXi6O1RqIO068B1WNRfochxcff5RzAWk6WqMwvhYh7QL3gh
	 sryZAY0BbBt/KccMwSjjUf/a2BmAdfU1KmNaEqnLGbSsHnB647RRxnIVRjCA7hdys4
	 iN51Qx1TzjSrWVK0FljToJDZsciy6ixYpGxiOfgs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 248D9F8025A;
	Thu, 27 Jan 2022 04:44:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCD76F80254; Thu, 27 Jan 2022 04:44:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 09B8FF800C9
 for <alsa-devel@alsa-project.org>; Thu, 27 Jan 2022 04:43:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09B8FF800C9
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1643255038921880960-webhooks-bot@alsa-project.org>
References: <1643255038921880960-webhooks-bot@alsa-project.org>
Subject: Add support for AMD ACP Microphone devices for Yellow Carp platform
Message-Id: <20220127034403.BCD76F80254@alsa1.perex.cz>
Date: Thu, 27 Jan 2022 04:44:03 +0100 (CET)
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

alsa-project/alsa-ucm-conf issue #136 was opened from vijendarmukunda:

We have tried to add similar changes which were applied for Renoir platform for YC platform by following below link.
https://github.com/alsa-project/alsa-ucm-conf/issues/54

But we are unable to create links.

Without ALSA UCM changes, we are able to observe similar issues earlier reported on Renoir platform as mentioned below.
1) Fallback profile is getting loaded and capture endpoint name is not listed as "Digital Microphone"
2) Mic Mute Led button is not reflected with Mute status.

Attached pa-info and alsa info output.
[painfo.txt](https://github.com/alsa-project/alsa-ucm-conf/files/7947396/painfo.txt)
[alsa-info.txt](https://github.com/alsa-project/alsa-ucm-conf/files/7947401/alsa-info.txt)
a

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/136
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
