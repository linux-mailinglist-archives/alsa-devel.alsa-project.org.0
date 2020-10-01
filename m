Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C9727F997
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 08:41:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C54E183F;
	Thu,  1 Oct 2020 08:40:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C54E183F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601534487;
	bh=7ClyvoKvp/AUgm0tLbxKJZRpFnkiHGe4BqLW33CrZ1g=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VLTbhrEqbEdH6MoreeExkD7cTvMjC2gevmcuiIZLOOrfWgtoidfPi5kYprbYdSalF
	 BKf+PchKmtS+venB3v7WHvcEhkDikhXUdVaLJN2WJY5e0MFQqrMkzJYb0dl1JvRYj0
	 vAqI5gExNjNmvDx6wP02wTF0Qm8kB79WWn3BzU24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C4D7F801D8;
	Thu,  1 Oct 2020 08:39:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75239F801F5; Thu,  1 Oct 2020 08:39:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id EE527F800AB
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 08:39:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE527F800AB
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1601534369443474054-webhooks-bot@alsa-project.org>
References: <1601534369443474054-webhooks-bot@alsa-project.org>
Subject: unable to initialize sum ring buffer error
Message-Id: <20201001063943.75239F801F5@alsa1.perex.cz>
Date: Thu,  1 Oct 2020 08:39:43 +0200 (CEST)
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

alsa-project/alsa-lib issue #83 was opened from Komal1809:

i am using alsa-lib-1.1.4.1 library version. Whenever trying to play audio from file using aplay  getting error as alsa-lib-1.1.4.1/src/pcm/pcm_dmix.c:1177: **(snd_pcm_dmix_open) unable to initialize sum ring buffer** 

Note : audio is getting played at the start once system reboot

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/83
Repository URL: https://github.com/alsa-project/alsa-lib
