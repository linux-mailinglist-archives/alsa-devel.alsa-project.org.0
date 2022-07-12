Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6788E571919
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 13:54:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CB2E165D;
	Tue, 12 Jul 2022 13:53:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CB2E165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657626882;
	bh=kMayY13lS8wPkfl7o0T2/VRc9Cze5g2oSue1Me5WoAM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZJYPCuA3CbA4AolcCs3mGp9iMUcQFRCyJ6GSo0Rsdh6eTycp1/hIsRpcTxBmAj+Ze
	 raKc0wAL0GP+7ExajnxHELrV4pzq7neijb9T56FXtoO7+sgsIF6LakGi0bmsYuBXD3
	 GjFWQOzKXtQTTJ6yAQGe3O9MoxVmY6BdZmPEdEsg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 063E6F80279;
	Tue, 12 Jul 2022 13:53:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A01BF80246; Tue, 12 Jul 2022 13:53:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 20409F800BD
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 13:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20409F800BD
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1657626815520700932-webhooks-bot@alsa-project.org>
References: <1657626815520700932-webhooks-bot@alsa-project.org>
Subject: NetBSD/OpenBSD/FreeBSD build support
Message-Id: <20220712115340.7A01BF80246@alsa1.perex.cz>
Date: Tue, 12 Jul 2022 13:53:40 +0200 (CEST)
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

alsa-project/alsa-lib pull request #250 was opened from jg1uaa:

to build alsa-lib on *BSD, small fix is required.
(reference: FreeBSD/NetBSD ports diff)

There is no problem to compile modified code on Linux(Debian-11), FreeBSD-13.1, NetBSD-current and OpenBSD-7.1.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/250
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/250.patch
Repository URL: https://github.com/alsa-project/alsa-lib
