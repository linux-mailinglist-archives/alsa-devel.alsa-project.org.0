Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 504565699A6
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 07:04:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A91E3166C;
	Thu,  7 Jul 2022 07:04:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A91E3166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657170290;
	bh=U25UP+1ciHtq83km/igQdANLU9cDWpPyzlU9YWpICk8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OPPHxTrSv1gCM5oScpwIx5tQ/cs51gnd4N0CYBAQn2vZTEWMbqmkdCRtOZpfYbc3s
	 MLQLrqVfnZEQvt/4kg9QdCa804D/spVfW+lxQupgCiVzrjLIDNhLWvoq7t/iscVsH4
	 o/SqaJB1UWwybZwt4BQbcRBM6l8G8zkElYtElEBM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28B2EF8028D;
	Thu,  7 Jul 2022 07:03:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5C3FF8016A; Thu,  7 Jul 2022 07:03:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 6A9C3F80104
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 07:03:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A9C3F80104
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1657170223748095036-webhooks-bot@alsa-project.org>
References: <1657170223748095036-webhooks-bot@alsa-project.org>
Subject: How to get mixer control index from UCM
Message-Id: <20220707050347.B5C3FF8016A@alsa1.perex.cz>
Date: Thu,  7 Jul 2022 07:03:47 +0200 (CEST)
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

alsa-project/alsa-lib issue #248 was opened from Zames-Chang:

I use  Corsair VOID ELITE USB Gaming Headset. However this headset have two same name control
```
$ amixer -c 1 scontrols
Simple mixer control 'Auto Gain Control',0
Simple mixer control 'Headset',0
Simple mixer control 'Headset',1
```
use command to change 'Headset',0 is actually not working. But change 'Headset',1 will work. I want write a UCM to indicate that when seeing this headset, choose the name 'Headset' with index 1 not index 0. 

Does UCM and alsa api able to do so?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/248
Repository URL: https://github.com/alsa-project/alsa-lib
