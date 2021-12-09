Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F310746F64F
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Dec 2021 22:59:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D32020D8;
	Thu,  9 Dec 2021 22:58:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D32020D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639087141;
	bh=foVk33JiSHu5H/0AOXtNLtYat94vLhYXc9t0kxM9R9k=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HAHwxM6Wzp998XVIrrWSZRz1QhfxNAnyIzpekLZ0xYUk3ifgRcwCnxQFsj492Khs2
	 jL04ZkBd7v5IJyRwR3vm0GvQcUEtyVYgZIS3WOhFe8AeenQBh5/xBDaYVM3idC/ZI4
	 aiURc5UW9wlX62b13aj6rdUAFjw3r0KD8l0k/1dY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6F0FF804BD;
	Thu,  9 Dec 2021 22:57:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37FA4F804AE; Thu,  9 Dec 2021 22:57:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 72F6DF8028D
 for <alsa-devel@alsa-project.org>; Thu,  9 Dec 2021 22:57:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72F6DF8028D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1639087060331087112-webhooks-bot@alsa-project.org>
References: <1639087060331087112-webhooks-bot@alsa-project.org>
Subject: microphone disappeared on alsa-ucm-conf 1.2.6.1
Message-Id: <20211209215747.37FA4F804AE@alsa1.perex.cz>
Date: Thu,  9 Dec 2021 22:57:47 +0100 (CET)
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

alsa-project/alsa-lib issue #200 was opened from galibozek:

after upgrade testing/alsa-ucm-conf 1.2.5.1-1 to 1.2.6.1-1 on arch linux my microphone disappeared on lenovo t14 gen2i

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/200
Repository URL: https://github.com/alsa-project/alsa-lib
