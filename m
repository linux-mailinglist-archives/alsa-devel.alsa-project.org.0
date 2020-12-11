Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B9C2D8266
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Dec 2020 23:52:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 578271776;
	Fri, 11 Dec 2020 23:52:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 578271776
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607727176;
	bh=h/gViz4biH66ZOf7E3+xdonpro9NW4DpmLv0PcmvmoY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oWU5zQnK5ExPXdEOWatwNEWgC7vsjyC+kB8dGr5QgqIf+6HACq0bKvDqK6aGMnsA7
	 7haYw18bmuH8CyTovG0lq/6iRukCwlMfgoU1pBhj8qYVWMzmC/fDNW1lqiyPlwE6UI
	 XpY9ziFGUXluwnuU1xVmO/6WqhAW2bV0gI1nTWpw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DA76F802BE;
	Fri, 11 Dec 2020 23:51:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56053F8021D; Fri, 11 Dec 2020 23:51:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1057F8011F
 for <alsa-devel@alsa-project.org>; Fri, 11 Dec 2020 23:50:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1057F8011F
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B191DAC10;
 Fri, 11 Dec 2020 22:50:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils 2/2] alsactl: Fix race at creating a lock file
Date: Fri, 11 Dec 2020 23:50:56 +0100
Message-Id: <20201211225056.12301-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201211225056.12301-1-tiwai@suse.de>
References: <20201211225056.12301-1-tiwai@suse.de>
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

A race at creating a lock file in state_lock() was discovered
recently: namely, between the first open(O_RDWR) and the second
open(O_RDWR|O_CREAT|O_EXCL) calls, another alsactl invocation may
already create a lock file, then the second open() will return EEXIST,
which isn't handled properly and treated as a fatal error.

In this patch, we check EEXIST case and try again open() with O_RDWR.
This must succeed usually, and if it fails, handle finally as the
fatal error.

BugLink: https://bugzilla.opensuse.org/show_bug.cgi?id=1179904
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 alsactl/lock.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/alsactl/lock.c b/alsactl/lock.c
index 05f6e4d2a102..5b4746231996 100644
--- a/alsactl/lock.c
+++ b/alsactl/lock.c
@@ -63,10 +63,15 @@ static int state_lock_(const char *file, int lock, int timeout, int _fd)
 			if (fd < 0) {
 				if (errno == EBUSY || errno == EAGAIN) {
 					sleep(1);
-				} else {
-					err = -errno;
-					goto out;
+					continue;
 				}
+				if (errno == EEXIST) {
+					fd = open(nfile, O_RDWR);
+					if (fd >= 0)
+						break;
+				}
+				err = -errno;
+				goto out;
 			}
 		}
 	}
-- 
2.26.2

