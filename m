Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BAA1EB991
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jun 2020 12:27:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D72261663;
	Tue,  2 Jun 2020 12:26:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D72261663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591093630;
	bh=GdK2lI8+4s2QKvd+0T5wR0B50aMJmms6D8Hzjv+z2y4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YYsou+7rBVQTPAETDC3IjGS8fccMSXStIPb7K60zLQJHxX++9yrWLx+kDGv8P8ru1
	 8p2QLXHHwJpBBloSFqoQx4BphJAWKe4e2lqi6WO9Zq9725aokNubzfSYZ/yQQY/Wpp
	 5SmiHWPLQCYCOTQj0aS3gkvbBo08n9lgkS/6nkXM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F96AF80260;
	Tue,  2 Jun 2020 12:25:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F4156F8026F; Tue,  2 Jun 2020 12:25:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 2C3BEF8013D
 for <alsa-devel@alsa-project.org>; Tue,  2 Jun 2020 12:25:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C3BEF8013D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1591093521068892956-webhooks-bot@alsa-project.org>
References: <1591093521068892956-webhooks-bot@alsa-project.org>
Subject: Db845c
Message-Id: <20200602102526.F4156F8026F@alsa1.perex.cz>
Date: Tue,  2 Jun 2020 12:25:26 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #29 was opened from Srinivas-Kandagatla:

Hi Jaroslav Kysela,

I removed Lenovo ucm2 configs for now, are you okay to pull DragonBoard DB845c ucm2 for now till we resolve in general naming issues with DT.  All the drivers and DT are already in mainline since 5.6.

Thanks,
srini
Changes sinc v2:
- remove Lenovo ucm2
- remove cdev references.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/29
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/29.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
