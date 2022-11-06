Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C59D361E019
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Nov 2022 04:11:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 165F6E0F;
	Sun,  6 Nov 2022 04:10:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 165F6E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667704286;
	bh=gDguuYpzrmLcYvIUDE4KRXA06mz5CtB8iz8/TU0Jomg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o4JzSUiBDRM8y96D9h3jTRV9FzY2VBGfYrV+2aXbd9o5Ek31xGfAgYFuNo/lLDh36
	 rmKpE5jO2MjTJGKxTDJEwJTC9U5AsDr85sb7sqji1C1uYtew6aQzWt06SrcnQ+Ggp6
	 EjOHzYdgbK6Mfqe4Da9PBGcgu4DPp4czR8p/BMpQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94DE4F80238;
	Sun,  6 Nov 2022 04:10:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55CE5F800EC; Sun,  6 Nov 2022 04:10:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 929BAF800EC
 for <alsa-devel@alsa-project.org>; Sun,  6 Nov 2022 04:10:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 929BAF800EC
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1667704224716821909-webhooks-bot@alsa-project.org>
References: <1667704224716821909-webhooks-bot@alsa-project.org>
Subject: [Digidesign Mbox 3] Does ucm SplitPCM add latency?
Message-Id: <20221106031028.55CE5F800EC@alsa1.perex.cz>
Date: Sun,  6 Nov 2022 04:10:28 +0100 (CET)
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

alsa-project/alsa-ucm-conf issue #238 was opened from ManuLinares:

https://github.com/alsa-project/alsa-ucm-conf/pull/237

I've correctly configured ucm profile, but I notice a small latency added when using UCM **vs** not using it (having the default alsa analog-surround4.0 profile)

Is this the expected behavior of SplitPCM in UCM?

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/238
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
