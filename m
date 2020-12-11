Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E6D2D8265
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Dec 2020 23:52:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB25C1765;
	Fri, 11 Dec 2020 23:51:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB25C1765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607727168;
	bh=RmYEX0VnQ3qopEVdpclKtw7C1gfwXixXI8ZBem6ydo4=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VK2MrpVJROVtXwAl57+Wh1lM4S9J2z9NMajOPnb6wsmZTah5KPpeLA3ffOHcWcN+4
	 5V5ltBGzz/Yw+XBmNX7kC+rQ1Fxm2kQvNlWvY8rmt06prMxYYTKW7lWauamdxD1NdM
	 l+ojDDND7AvA/i2mZQM3xkY/gyipMKiy+GrAfWNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 127E1F80217;
	Fri, 11 Dec 2020 23:51:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14705F80105; Fri, 11 Dec 2020 23:51:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A368FF801D8
 for <alsa-devel@alsa-project.org>; Fri, 11 Dec 2020 23:50:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A368FF801D8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A35D8AB91;
 Fri, 11 Dec 2020 22:50:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils 1/2] alsactl: Fix double decrease of lock timeout
Date: Fri, 11 Dec 2020 23:50:55 +0100
Message-Id: <20201211225056.12301-1-tiwai@suse.de>
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

The state_lock() has a loop to wait for the lock file creation, and
the timeout value gets decremented twice mistakenly, which leads to a
half timeout (5 seconds) than expected 10 seconds.  Fix it.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 alsactl/lock.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/alsactl/lock.c b/alsactl/lock.c
index 4a485392b3bd..05f6e4d2a102 100644
--- a/alsactl/lock.c
+++ b/alsactl/lock.c
@@ -63,7 +63,6 @@ static int state_lock_(const char *file, int lock, int timeout, int _fd)
 			if (fd < 0) {
 				if (errno == EBUSY || errno == EAGAIN) {
 					sleep(1);
-					timeout--;
 				} else {
 					err = -errno;
 					goto out;
-- 
2.26.2

