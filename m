Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF2664868A
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Dec 2022 17:36:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4809417AD;
	Fri,  9 Dec 2022 17:35:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4809417AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670603784;
	bh=YnwTC7QjlohGu1tGo3UNpnLTrNgnd5ZUZJZQWy+aIog=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bdde6rGwklC2fIuVWuLB8rbFXiJ4lRc2iWsqFjJm2yW1CckXV9fBp+LrsTI/rVetW
	 m+GqjzgljHm1XXSk9tAUXbsi6AdQlguHEWzl4R0d0QjPMk4rjQt7yeaInXb48xLKHs
	 oEpexhWsmf4cSsTKLd34//HyZLExZvsuNb/Z/HH8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3730F80115;
	Fri,  9 Dec 2022 17:35:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9173DF8022D; Fri,  9 Dec 2022 17:35:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_DNSWL_HI,SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 1D9A5F80115
 for <alsa-devel@alsa-project.org>; Fri,  9 Dec 2022 17:35:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D9A5F80115
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1670603723617804050-webhooks-bot@alsa-project.org>
References: <1670603723617804050-webhooks-bot@alsa-project.org>
Subject: alsa-project.org is down
Message-Id: <20221209163525.9173DF8022D@alsa1.perex.cz>
Date: Fri,  9 Dec 2022 17:35:25 +0100 (CET)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

alsa-project/alsa-lib issue #287 was opened from afq984:

```
curl -i https://alsa-project.org
HTTP/2 404 
server: nginx/1.14.1
date: Fri, 09 Dec 2022 16:34:22 GMT
content-type: text/html; charset=UTF-8
x-powered-by: PHP/7.4.30

No input file specified.
```

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/287
Repository URL: https://github.com/alsa-project/alsa-lib
