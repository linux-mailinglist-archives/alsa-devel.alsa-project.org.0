Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 409451F8D47
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jun 2020 07:24:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC644166D;
	Mon, 15 Jun 2020 07:23:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC644166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592198660;
	bh=IuBX4Aw/TPtTZgXkVJoFKi88LJZ0a1XdKEA3/6CMgZ4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SAvpOAGOt4RHOl3zbLtbgDqGREX95vmFrekogr0Ce/3EUIIZ1WoQJwCQHj3yVYS7N
	 yBmHMCwlj9A9SA3XN40kwwVOrKTj96Mo6rrZur3896+0bH0cfJv5pDKr9sJJtpoMqh
	 PvVJ41xmGOYFfOIXxb+OvsU8X1AmuzuQV1q+U8xk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDB87F801D9;
	Mon, 15 Jun 2020 07:22:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC392F8013E; Mon, 15 Jun 2020 07:22:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C7325F8013E
 for <alsa-devel@alsa-project.org>; Mon, 15 Jun 2020 07:22:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7325F8013E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1592198545331270933-webhooks-bot@alsa-project.org>
References: <1592198545331270933-webhooks-bot@alsa-project.org>
Subject: sof-hda-dsp: add initial kcontrol values
Message-Id: <20200615052235.DC392F8013E@alsa1.perex.cz>
Date: Mon, 15 Jun 2020 07:22:35 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #35 was opened from libinyang:

This patch adds the initial values of sof-hda-dsp card.

Signed-off-by: Libin Yang <libin.yang@intel.com>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/35
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/35.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
