Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 033941D5FD7
	for <lists+alsa-devel@lfdr.de>; Sat, 16 May 2020 11:01:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 708F31669;
	Sat, 16 May 2020 11:00:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 708F31669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589619686;
	bh=OgtivipS20HJEi3FJ7/5nyGHYRDk5WjwQT7nWsbsJrc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ihlsFFPIJ7FRp08xw+KP3ZW35+Chu8qJk3p/vOlJBwQJSI+SkBLNXu8Qel3AqwsHy
	 Gp7wUckejs/uZknYxA4oC/sIvyqwx63/a9bGdRDf/MfqOFQEDPpuhwWfarVX5TR1PU
	 up18554/SYfZbAN+kwyCC3E6bFVfqQgPuj77XEyY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A5D5F8015A;
	Sat, 16 May 2020 10:59:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D72B6F80158; Sat, 16 May 2020 10:59:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 95479F800E3
 for <alsa-devel@alsa-project.org>; Sat, 16 May 2020 10:59:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95479F800E3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1589619578566054106-webhooks-bot@alsa-project.org>
References: <1589619578566054106-webhooks-bot@alsa-project.org>
Subject: ucm: initialize mgr->once_list
Message-Id: <20200516085942.D72B6F80158@alsa1.perex.cz>
Date: Sat, 16 May 2020 10:59:42 +0200 (CEST)
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

alsa-project/alsa-lib pull request #50 was opened from asavah:

Initiliaze mgr->once_list otherwise eg `alsactl restore 0` will segfault in https://github.com/alsa-project/alsa-lib/blob/master/src/ucm/utils.c#L570 in case that  `/var/lib/alsa/alsa.state` is not present.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/50
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/50.patch
Repository URL: https://github.com/alsa-project/alsa-lib
