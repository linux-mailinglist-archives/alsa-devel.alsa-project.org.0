Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 881712D8287
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Dec 2020 00:01:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FE261740;
	Sat, 12 Dec 2020 00:00:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FE261740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607727685;
	bh=QXlTqffLfiMKu/NGbDRChQ2RLOPF4V15G6y2vjW1Bxo=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A/s6KyNC0ZFsp0StuZlP4NKCUwmm9nPrwf06DIlJZ7FlEaaJugk9bePfxSz8EV50D
	 QXYOXpcEgDhSHx1BEjQW58WNNCyLKcPJe1T22lQxbar5Yt1tLY5WduUMT6fDOltebe
	 KIJ9NafyBSCsTjEabWO2wtDA1eedFGFvUQPRf5Nw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA06FF80105;
	Fri, 11 Dec 2020 23:59:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0046BF8020D; Fri, 11 Dec 2020 23:59:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 409C6F8011F
 for <alsa-devel@alsa-project.org>; Fri, 11 Dec 2020 23:59:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 409C6F8011F
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E9159AB7F
 for <alsa-devel@alsa-project.org>; Fri, 11 Dec 2020 22:59:41 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils] alsactl: Remove asound.state file check from
 alsa-restore.service again
Date: Fri, 11 Dec 2020 23:59:41 +0100
Message-Id: <20201211225941.12958-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

We added the check of asound.state file presence some time ago to
assure that alsactl gets called only if the state file is already
present.  Since then, the situation has changed significantly:
e.g. now alsactl does initialize if the state file isn't present, and
the same alsa-restore.service is used to save the state.  This means
that we should start this service no matter the state file exists at
the boot time or not.  So, revert the old change again.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 alsactl/alsa-restore.service.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/alsactl/alsa-restore.service.in b/alsactl/alsa-restore.service.in
index a84c2e842444..80fd5fd48203 100644
--- a/alsactl/alsa-restore.service.in
+++ b/alsactl/alsa-restore.service.in
@@ -7,7 +7,6 @@
 Description=Save/Restore Sound Card State
 ConditionPathExists=!@daemonswitch@
 ConditionPathExistsGlob=/dev/snd/control*
-ConditionPathExists=@asoundrcfile@
 
 [Service]
 Type=oneshot
-- 
2.26.2

