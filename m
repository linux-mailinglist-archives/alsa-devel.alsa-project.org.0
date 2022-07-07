Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 775165699B5
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 07:09:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB33C1630;
	Thu,  7 Jul 2022 07:08:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB33C1630
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657170585;
	bh=Ygx+eafXicdWZ8WX0gq4rjNPyh6W3mlsBtDEc2rAEk4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UM+Fzvq+NyOaXC21IGEqXrS3j09hZEqs5Q+QCE5glTopRakHXvsoFB97yO9fud6Oj
	 FoiJb9uy7A3cdbQRSGGWZqay3fWqjS1D8CGXAyzOEwU7u/qEDnZvtOAJSAqLILjEdJ
	 0ucE2N51lTXs0y8MoM3lVZDb7AOgHviWccSFKZu0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66F00F800DF;
	Thu,  7 Jul 2022 07:08:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 712F4F8016A; Thu,  7 Jul 2022 07:08:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id E0C7DF80104
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 07:08:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0C7DF80104
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1657170518268321037-webhooks-bot@alsa-project.org>
References: <1657170518268321037-webhooks-bot@alsa-project.org>
Subject: How to get mixer control index from UCM
Message-Id: <20220707050842.712F4F8016A@alsa1.perex.cz>
Date: Thu,  7 Jul 2022 07:08:42 +0200 (CEST)
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

alsa-project/alsa-lib issue #248 was edited from Zames-Chang:

I use  Corsair VOID ELITE USB Gaming Headset. However this headset have two same name control
```
$ amixer -c 1 scontrols
Simple mixer control 'Auto Gain Control',0
Simple mixer control 'Headset',0
Simple mixer control 'Headset',1
```
use command to change 'Headset',0 is actually not working. But change 'Headset',1 will work. I want write a UCM to indicate that when seeing this headset, choose the name 'Headset' with index 1 not index 0. 

I have seen [use-case.h](https://github.com/alsa-project/alsa-lib/blob/master/include/use-case.h) recommended names for values, but I don't find a proper name to describe control index.

Is there any suggestion about how to write control index in UCM file?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/248
Repository URL: https://github.com/alsa-project/alsa-lib
