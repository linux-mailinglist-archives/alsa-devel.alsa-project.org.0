Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2B456B523
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 11:10:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1096B42;
	Fri,  8 Jul 2022 11:09:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1096B42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657271438;
	bh=T6+CL7TtKljHi6BnflA2WREBWWxzuswp1n4rQ/MQTWY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PLd7G+LyP0H3fznyihezgXJFfxiyDx5uhUFP/XRmEFNfwmxnbF79owAZ1o9+o4j3d
	 l2qpCbnL/JixGfvQa5zexyL3ZGyGHhPbLcD7m+f409AomX6oluKH9lMe2BLH0L8FFL
	 WTYlPqm4/7jHXNHqS6KBLPdiLfK4664EPSXEEgxQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B3E0F8025B;
	Fri,  8 Jul 2022 11:09:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61CE4F80167; Fri,  8 Jul 2022 11:09:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id EC293F800E9
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 11:09:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC293F800E9
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1657271373296123981-webhooks-bot@alsa-project.org>
References: <1657271373296123981-webhooks-bot@alsa-project.org>
Subject: USB-Audio: Dell-WD15-Dock: add jack controls
Message-Id: <20220708090936.61CE4F80167@alsa1.perex.cz>
Date: Fri,  8 Jul 2022 11:09:36 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #185 was opened from jscissr:

I recently added support for these to Linux, see
https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?id=4b8ea38fabab45ad911a32a336416062553dfe9c

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/185
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/185.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
