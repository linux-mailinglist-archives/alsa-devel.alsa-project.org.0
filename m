Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA15D2C70D9
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Nov 2020 21:33:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 362A11870;
	Sat, 28 Nov 2020 21:32:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 362A11870
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606595583;
	bh=pSc4TVNwLrhg4OosZd5k1Gn2qh8LrkGQb//ejaC+qhI=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HjzHwJ71/O0s986Ne24Z1kuns9woRyGY7jm7QSrGuIh+I8mLwmhsJWALuL4ojj08c
	 M+pg4yB6lJBOfEcV8x46zRdJiRVWWIMQG6VTbbR6aJSGBawsnXuSl92iQ4N8+x1vXd
	 plhNN7fMlo9UNSadA9mjE0c5l1dgbtSHkdpoBdDc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADC25F800D0;
	Sat, 28 Nov 2020 21:31:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA41DF800EA; Sat, 28 Nov 2020 21:31:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 084FDF800EA
 for <alsa-devel@alsa-project.org>; Sat, 28 Nov 2020 21:31:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 084FDF800EA
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2A01EAC17
 for <alsa-devel@alsa-project.org>; Sat, 28 Nov 2020 20:31:06 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils] alsactl: Make sure the kernel driver loaded before
 alsa-restore.service
Date: Sat, 28 Nov 2020 21:31:01 +0100
Message-Id: <20201128203101.7333-1-tiwai@suse.de>
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

alsa-restore.service requires the sound devices having been set up
beforehand.  However, systemd tends to start this service too early
before the driver setup, which leads to the unsuccessful state
restore.

For assuring the kernel driver setup before this service, add the
dependency on sound.target.

BugLink: https://bugzilla.suse.com/show_bug.cgi?id=1179363
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 alsactl/alsa-restore.service.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/alsactl/alsa-restore.service.in b/alsactl/alsa-restore.service.in
index a84c2e842444..104b97a6ef68 100644
--- a/alsactl/alsa-restore.service.in
+++ b/alsactl/alsa-restore.service.in
@@ -8,6 +8,8 @@ Description=Save/Restore Sound Card State
 ConditionPathExists=!@daemonswitch@
 ConditionPathExistsGlob=/dev/snd/control*
 ConditionPathExists=@asoundrcfile@
+Requires=sound.target
+After=sound.target
 
 [Service]
 Type=oneshot
-- 
2.26.2

