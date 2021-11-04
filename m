Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEE4444FF1
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Nov 2021 09:09:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFC471693;
	Thu,  4 Nov 2021 09:08:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFC471693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636013342;
	bh=7wBWPUC3ijYVBCMwsE2Yvm2zU9deB0nYVWBkCQ17x7Y=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HAArIv5zD+x5FDqw2R1vWQMBZIoG8Djnw3M9ZFHX1vDVe3TtQAdpEdEqlCwdaFAKf
	 gzYGzFLnNifCAxhUoMRgl+/pIbU/dekbCK7vjz5XpP6xa5mZSFeYLDrXD0IfsZohQ7
	 bCYL3oXImGiAL+CS1tKmhzTasW2AbcTZD4Uqf5Xg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD952F8049C;
	Thu,  4 Nov 2021 09:07:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A746F802E8; Thu,  4 Nov 2021 09:07:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 9F55CF8025D
 for <alsa-devel@alsa-project.org>; Thu,  4 Nov 2021 09:07:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F55CF8025D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1636013255463222980-webhooks-bot@alsa-project.org>
References: <1636013255463222980-webhooks-bot@alsa-project.org>
Subject: Intel SOF HDA: Lenovo m920sff support (Realtek ALC 233)
Message-Id: <20211104080745.3A746F802E8@alsa1.perex.cz>
Date: Thu,  4 Nov 2021 09:07:45 +0100 (CET)
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

alsa-project/alsa-ucm-conf issue #114 was edited from perexg:

More info: https://github.com/thesofproject/linux/issues/3088

```
Simple mixer control 'Master',0
Simple mixer control 'Headphone',0
Simple mixer control 'Headphone+LO',0
Simple mixer control 'Speaker',0
Simple mixer control 'Front Mic',0
Simple mixer control 'Front Mic Boost',0
Simple mixer control 'Line Out',0
Simple mixer control 'Mic',0
Simple mixer control 'Mic Boost',0
Simple mixer control 'IEC958',0
Simple mixer control 'IEC958',1
Simple mixer control 'IEC958',2
Simple mixer control 'Capture',0
Simple mixer control 'Auto-Mute Mode',0
Simple mixer control 'Dmic0',0
Simple mixer control 'Dmic1 2nd',0
Simple mixer control 'Loopback Mixing',0
Simple mixer control 'PGA1.0 1 Master',0
Simple mixer control 'PGA2.0 2 Master',0
Simple mixer control 'PGA3.0 3 Master',0
Simple mixer control 'PGA4.0 4 Master',0
Simple mixer control 'PGA7.0 7 Master',0
Simple mixer control 'PGA8.0 8 Master',0
Simple mixer control 'PGA9.0 9 Master',0
```

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/114
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
