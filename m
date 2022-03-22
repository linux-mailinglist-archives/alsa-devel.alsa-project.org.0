Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F224E3DE2
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Mar 2022 12:58:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89C781692;
	Tue, 22 Mar 2022 12:57:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89C781692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647950301;
	bh=t8pxcym9iSTsPP+6Q5Ob/Yj/ZujPqhRL5s1Loz19qaM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TXwUKGgWCngWBMzMXIdzF4jO251RH2lntf+YPvENlslezjX5R4/2T/elwJh6QRJ7X
	 ZGFzs22MgX7KyUMpqO5E79O9QGaZTzUQCR948I4+ngKCktd18ZKvLiVDlzMoCWuDPQ
	 sfASSFPT3wv0W1ugBt3lAvja7iebJ+HRvykQo8AY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43A5CF804B2;
	Tue, 22 Mar 2022 12:57:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FFF8F8049C; Tue, 22 Mar 2022 12:57:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 76DF1F80116
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 12:56:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76DF1F80116
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1647950216971451044-webhooks-bot@alsa-project.org>
References: <1647950216971451044-webhooks-bot@alsa-project.org>
Subject: pcm: plugin - fix avail_min calculation on rate plugin
Message-Id: <20220322115703.9FFF8F8049C@alsa1.perex.cz>
Date: Tue, 22 Mar 2022 12:57:03 +0100 (CET)
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

alsa-project/alsa-lib pull request #218 was opened from aditpape:

commit 88e4ae27, ff1f669d introduced a dynamic recalculation of the slave's
avail_min value.
The calculated avail_min setting did not take into account, that the avail_min value
depends on the used sampling rate and must be adapted accordingly
if the slave is using a different sampling rate.
That leads to too large/too small calculated avail_min settings and inaccurate
period wake-up events if a rate converter plugin is used.

This patch is adapting the avail_min calculation to consider a different
sampling rate between actual pcm and it's slave.

Signed-off-by: Andreas Pape <apape@de.adit-jv.com>

Request URL   : https://github.com/alsa-project/alsa-lib/pull/218
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/218.patch
Repository URL: https://github.com/alsa-project/alsa-lib
