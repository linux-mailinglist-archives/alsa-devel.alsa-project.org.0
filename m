Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58511513D02
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 23:07:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D604515E0;
	Thu, 28 Apr 2022 23:07:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D604515E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651180070;
	bh=71rmlgzKbrm+k2NXfIQniqBVMPU/MCYQGZ8gt9pZKmw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=doPn4v7lqdlAFBw7XDQsGCcaV4FrFrXYhjgdyKXyGCitSCZmUR7M4RSwxRAf0OZNU
	 zJzoxAN+a/wuFNfk8WKgYap3M9JLChtg7Gm+z/CHeKy4nlbQJV0GH9b1k+Ltha71Sn
	 lJ8rOn489thvV+JtHKrexpdLo3Am0TzJ2KCbb8HI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57A5BF8020D;
	Thu, 28 Apr 2022 23:06:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C941FF8012B; Thu, 28 Apr 2022 23:06:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id AE41DF8012B
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 23:06:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE41DF8012B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1651180002469324112-webhooks-bot@alsa-project.org>
References: <1651180002469324112-webhooks-bot@alsa-project.org>
Subject: conf: Use LFS calls when reading config files
Message-Id: <20220428210650.C941FF8012B@alsa1.perex.cz>
Date: Thu, 28 Apr 2022 23:06:50 +0200 (CEST)
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

alsa-project/alsa-lib pull request #223 was opened from dos1:

Although at first glance it doesn't seem useful to support config
files larger than 2GB, LFS also influences inode size. Without this,
32-bit libasound may be unable to read config files on filesystems
with 64-bit inodes, such as Btrfs or NFS.

Signed-off-by: Sebastian Krzyszkowiak <dos@dosowisko.net>

Request URL   : https://github.com/alsa-project/alsa-lib/pull/223
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/223.patch
Repository URL: https://github.com/alsa-project/alsa-lib
