Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A37F26D1CD
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 05:33:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0680D1671;
	Thu, 17 Sep 2020 05:32:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0680D1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600313591;
	bh=SnzmcvK2XGiaPPfM4fft1MPoub3yoSDTjRUgu2honAc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=emCib8Cb5uMny4HHwOBHvPBQPzo9yGkqxmdYirNRP3/Rw95JcrdkbSSjP+wmshYc4
	 KSJMlq6a3Neqia6QZv7lv4FkacDsbkNUR6/M4doMhMS/rIKNP01Tk8WDTK7M0XVt3m
	 OvuN4PFBw3R9zEtVUbbJQavYQ5ub7bCNShoR6GDU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 212D0F800E8;
	Thu, 17 Sep 2020 05:31:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C864AF80212; Thu, 17 Sep 2020 05:31:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id BDE70F800E8
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 05:31:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDE70F800E8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1600313482498797894-webhooks-bot@alsa-project.org>
References: <1600313482498797894-webhooks-bot@alsa-project.org>
Subject: "aplay -D oss -l" still reads sound cards through ALSA, not OSS
Message-Id: <20200917033127.C864AF80212@alsa1.perex.cz>
Date: Thu, 17 Sep 2020 05:31:27 +0200 (CEST)
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

alsa-project/alsa-utils issue #56 was opened from yurivict:

I don't have any ALSA devices, only OSS devices.

When the OSS PCM is selected ```aplay``` still tries to read ALSA devices:
```
$ /usr/bin/aplay -D oss -l
aplay: device_list:272: no soundcards found...
```

```
$ /usr/bin/aplay -L
null
    Discard all samples (playback) or generate zero samples (capture)
oss
    Open Sound System
```

alsa-lib-1.1.8
alsa-plugins-oss-1.1.6
alsa-utils-1.1.8

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/56
Repository URL: https://github.com/alsa-project/alsa-utils
