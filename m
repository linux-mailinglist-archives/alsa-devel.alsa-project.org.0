Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7883537B9
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Apr 2021 12:03:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F4A916D9;
	Sun,  4 Apr 2021 12:02:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F4A916D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617530597;
	bh=RK6SZqG5u+HXbCKzWNtL/h0+l000JpoF9HXa97f3+z8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AMV36dLeEc6XUMzyc/5mYD4lU98xFZ1PQT1Ypdh9me7W+mZkNGChhcfD05pAutfpz
	 HA5Ll28JVPxlQOJTuhfwKHeFWFGkZZ+Gdl1r4/T6xKvVKPJvlnc6498WbM4GaEJivh
	 2SlRGQa2NQS196oifYMy2ZlxFcwVKbDhJ3n4hQ0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C647F80249;
	Sun,  4 Apr 2021 12:01:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9572FF8020B; Sun,  4 Apr 2021 12:01:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 4C6E8F800F3
 for <alsa-devel@alsa-project.org>; Sun,  4 Apr 2021 12:01:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C6E8F800F3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1617530500461167097-webhooks-bot@alsa-project.org>
References: <1617530500461167097-webhooks-bot@alsa-project.org>
Subject: ALC1220 and presence of ucm2/ucm.conf breaks audio
Message-Id: <20210404100148.9572FF8020B@alsa1.perex.cz>
Date: Sun,  4 Apr 2021 12:01:48 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #86 was opened from devnull0000:

I'd want to make a better report but I am not an ALSA expert, so the issue is that after update I lose any sound and I use ALC1220 codec on MSI MEG X570 GODLIKE motherboard.

Deep googling gave me the report: https://bugs.archlinux.org/task/67058 
So indeed deletion of the file helped immediately. 
The bug is super confusing because it looks like the device is present at alsa level but absent on Pulse Audio and it is not shown in GUI at all.

I am at alsa-ucm-conf-1.2.4, linux-5.11.11, pulseaudio 13.0, gentoo.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/86
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
