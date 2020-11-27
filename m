Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6971A2C63E2
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Nov 2020 12:25:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFC571839;
	Fri, 27 Nov 2020 12:24:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFC571839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606476335;
	bh=WKFRcVd9QTRp/UhRJVJFQRMniBHxqZeBtIzbSwgDmhY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AOE7its79KkaRlKHsCFUxqmW2KEEe6nhrO9fwaGK8MLDKpql0v6DFqAOsGx6dx908
	 9GBtR64r+Wb9WOUCFEhQRDQY39kdQlHm58xBamE1xmPBgSi1kat+Z7T/g2KmhQBIo4
	 Ub1Dw8xfoCr8Ap8Hn6gK4SI9NzQSh2k8oKABTb04=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61D7CF8015F;
	Fri, 27 Nov 2020 12:24:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00F66F8019D; Fri, 27 Nov 2020 12:23:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 28127F800EA
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 12:23:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28127F800EA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1606476231002583981-webhooks-bot@alsa-project.org>
References: <1606476231002583981-webhooks-bot@alsa-project.org>
Subject: pcm: ioplug: Limit transfer size to buffer boundary
Message-Id: <20201127112358.00F66F8019D@alsa1.perex.cz>
Date: Fri, 27 Nov 2020 12:23:57 +0100 (CET)
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

alsa-project/alsa-lib pull request #103 was opened from aditpape:

Commit 1714332719fc91507ca24dd3567e50d7094b3001 introduced 2nd transfer()
call to transfer all remaining available frames.
If the prior calculated avail value exceeds the buffer size a too large size value
is passed to the underlaying plugin and results in memory corruption if not blocked by plugin internally.
Avail values > buffer size can happen if e.g. xrun detection is disabled,
as avail is calculated by pure difference between hw and app position.
This patch limits 2nd transfer call to remaining rest of a buffer size.

Signed-off-by: Andreas Pape <apape@de.adit-jv.com>

Request URL   : https://github.com/alsa-project/alsa-lib/pull/103
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/103.patch
Repository URL: https://github.com/alsa-project/alsa-lib
