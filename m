Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D77D64657E
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Dec 2022 00:56:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A015117F8;
	Thu,  8 Dec 2022 00:55:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A015117F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670457376;
	bh=LBwQ70cuvnxYt8ZUGhzadREBj3O+8lxlyL2LzKhoUjA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fk5U0IByydLifHq7GpSiOZd1a5j2FOJsBl1on4xZuZSjQCWwzYb5u+O725JmsPNbJ
	 Ugn4vTdNZLvTJjg3AiGTrqoIBys1pbJWmBpZAtDoTQIIU4GfpBHCOrzhYKEmG16wNz
	 rrU7XLGzcrUZUPYeVS06HBDMLJEDL3jJDf1PgO7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 400E0F80424;
	Thu,  8 Dec 2022 00:55:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F772F8021D; Thu,  8 Dec 2022 00:55:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 2622CF8021D
 for <alsa-devel@alsa-project.org>; Thu,  8 Dec 2022 00:55:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2622CF8021D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1670457314403314114-webhooks-bot@alsa-project.org>
References: <1670457314403314114-webhooks-bot@alsa-project.org>
Subject: ucm2: alc4080 - add support for MSI PRO Z790-A WIFI
Message-Id: <20221207235517.8F772F8021D@alsa1.perex.cz>
Date: Thu,  8 Dec 2022 00:55:17 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #248 was opened from adrianrudnik:

Frontpanel did not work, with this change, back and frontpanel work correctly.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/248
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/248.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
