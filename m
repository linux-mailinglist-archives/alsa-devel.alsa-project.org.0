Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E9D1F8408
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Jun 2020 17:52:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E7A5166D;
	Sat, 13 Jun 2020 17:52:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E7A5166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592063570;
	bh=E1pU+ylqMPUwlFqyn/zw1GrW8EVNP9rnKFqnNgKmU1U=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sR/Lq83TCdFKQ3EUDEBJkDDDIhfjuJJTcAEUlhX/FM+kzDeB1UeEy/n7s0nUfDNDd
	 gReVb3+rmaojc9H5yMHSxX7Sq8plhxjtWBuvBZGEoVuf9id34nCg/Xc7S3H9wEl4U9
	 n6RjrthYM8JjlxfWdoWjFogHh3JMA2leeNNOuDdk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A55AAF800CC;
	Sat, 13 Jun 2020 17:51:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CC27F800C7; Sat, 13 Jun 2020 17:51:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 033A2F800C7
 for <alsa-devel@alsa-project.org>; Sat, 13 Jun 2020 17:50:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 033A2F800C7
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1592063458222615004-webhooks-bot@alsa-project.org>
References: <1592063458222615004-webhooks-bot@alsa-project.org>
Subject: dlmisc.c: fix uclibc build
Message-Id: <20200613155106.6CC27F800C7@alsa1.perex.cz>
Date: Sat, 13 Jun 2020 17:51:06 +0200 (CEST)
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

alsa-project/alsa-lib pull request #58 was opened from bkuhls:

RTLD_DL_LINKMAP & RTLD_DI_ORIGIN, are unsupported on uClibc:
https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/tree/include/dlfcn.h#n106

This patch adds detection for uClibc because uClibc also defines
__GLIBC__:
https://lists.gnu.org/archive/html/bug-gnulib/2010-11/msg00280.html

Request URL   : https://github.com/alsa-project/alsa-lib/pull/58
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/58.patch
Repository URL: https://github.com/alsa-project/alsa-lib
