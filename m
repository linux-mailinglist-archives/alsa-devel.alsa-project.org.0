Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C642D71EC
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Dec 2020 09:40:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D24D16DF;
	Fri, 11 Dec 2020 09:39:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D24D16DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607676024;
	bh=sg8tQPWnSUqaG6Xf+1Hr63aR/eEnz05zNhmY1jg6xWs=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y2H/4AayDepIH1AJ3x7roLwhyFhofH6soyzVFztPVKCrFPQe7Sud3BgPrnIvLfLcA
	 7MqiP6+BqzVoI5YqNdasMvJ2JfNBmCKzBcz5+d1M0/eB/Nq5sqsYKM5L2U/QhnUz9C
	 oQzV/HuF4dlLIKgZXJ+kPIZIcfn99YjCNly1iZJ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A923BF8020D;
	Fri, 11 Dec 2020 09:38:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35F8FF8020D; Fri, 11 Dec 2020 09:38:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63D8DF80105
 for <alsa-devel@alsa-project.org>; Fri, 11 Dec 2020 09:38:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63D8DF80105
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AF199AC10
 for <alsa-devel@alsa-project.org>; Fri, 11 Dec 2020 08:38:35 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] alsactl: Skip restore during the lock
Date: Fri, 11 Dec 2020 09:38:04 +0100
Message-Id: <20201211083804.800-1-tiwai@suse.de>
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

Currently alsactl-restore tries to initialize the device when an error
is found for restore action.  But this isn't the right behavior in the
case where the lock is held; it implies that another alsactl is
running concurrently, hence you shouldn't initialize the card at the
same time.  The situation is found easily when two alsactls get
started by both udev and systemd (note that those two invocations are
the designed behavior, see /usr/lib/udev/rules.d/78-sound-cards.rules
for details).

This patch changes load_state() not to handle the initialization if
the locking fails.

BugLink: https://bugzilla.opensuse.org/show_bug.cgi?id=1179904
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 alsactl/state.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/alsactl/state.c b/alsactl/state.c
index ea1d3bcaaddf..8d1d814341bd 100644
--- a/alsactl/state.c
+++ b/alsactl/state.c
@@ -1663,7 +1663,12 @@ int load_state(const char *file, const char *initfile, int initflags,
 		err = snd_input_stdio_attach(&in, stdin, 0);
 	} else {
 		lock_fd = state_lock(file, 10);
-		err = lock_fd >= 0 ? snd_input_stdio_open(&in, file, "r") : lock_fd;
+		/* skip restore if already locked; i.e. concurrent accesses */
+		if (lock_fd < 0) {
+			err = 0;
+			goto out_global;
+		}
+		err = snd_input_stdio_open(&in, file, "r");
 	}
 	if (err >= 0) {
 		err = snd_config_load(config, in);
@@ -1781,6 +1786,7 @@ single:
 	err = finalerr;
 out:
 	snd_config_delete(config);
+out_global:
 	snd_config_update_free_global();
 	return err;
 }
-- 
2.26.2

