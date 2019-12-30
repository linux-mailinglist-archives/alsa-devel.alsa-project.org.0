Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 286C812D4AB
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Dec 2019 22:29:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2BCB16D2;
	Mon, 30 Dec 2019 22:28:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2BCB16D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577741376;
	bh=cZr7I0E9Nzb75O4fAvGcix1VhkI3irtdGXeyBQgG1MU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q0u4Cz+Hp+xM+x5UW9JP2u4wVsXrAHg/VHvSHl7TA7Gd2mXwmeFeILVpWF69JcU3F
	 Z1XDjPVBtIkuTYzpS04SzX8jKCqhlqpTD6eoVly4MzUuhyKQtMhgqr4kNh+BuCCC9B
	 ce9SFvJSIPY/81/QUH1asstP4x5SDYFFo1HBjQuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F0E5F80258;
	Mon, 30 Dec 2019 22:27:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CD81F80246; Mon, 30 Dec 2019 22:27:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E82AAF8015F
 for <alsa-devel@alsa-project.org>; Mon, 30 Dec 2019 22:27:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E82AAF8015F
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D59BBAD41
 for <alsa-devel@alsa-project.org>; Mon, 30 Dec 2019 21:27:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon, 30 Dec 2019 22:27:42 +0100
Message-Id: <20191230212742.28925-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH] ALSA: uapi: Add linux/types.h include back
	(but carefully)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

A few uapi/sound/*.h headers have been corrected for recovering from
the compile errors with the existing user-space code (alsa-lib) by the
recent commits.  OTOH, these introduced another regression, as now
linux/types.h inclusion became mandatory for the uapi header checks.

As a compromise, this patch re-adds linux/types.h inclusions again,
but conditionally not to break other non-standard user-space stuff
again.

Fixes: 2e4688676392 ("ALSA: emu10k1: Make uapi/emu10k1.h compilable again")
Fixes: d63e63d42107 ("ALSA: hdsp: Make uapi/hdsp.h compilable again")
Fixes: 4fa406caf950 ("ALSA: hdspm: Drop linux/types.h inclusion in uapi header")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/uapi/sound/emu10k1.h | 4 ++++
 include/uapi/sound/hdsp.h    | 4 ++++
 include/uapi/sound/hdspm.h   | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/include/uapi/sound/emu10k1.h b/include/uapi/sound/emu10k1.h
index 6bcd76f64c1c..88609cc0524c 100644
--- a/include/uapi/sound/emu10k1.h
+++ b/include/uapi/sound/emu10k1.h
@@ -23,6 +23,10 @@
 #ifndef _UAPI__SOUND_EMU10K1_H
 #define _UAPI__SOUND_EMU10K1_H
 
+#ifdef __linux__
+#include <linux/types.h>
+#endif
+
 /*
  * ---- FX8010 ----
  */
diff --git a/include/uapi/sound/hdsp.h b/include/uapi/sound/hdsp.h
index 7ac2d3f2a9b3..b8df62b60f4d 100644
--- a/include/uapi/sound/hdsp.h
+++ b/include/uapi/sound/hdsp.h
@@ -20,6 +20,10 @@
  *   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
  */
 
+#ifdef __linux__
+#include <linux/types.h>
+#endif
+
 #define HDSP_MATRIX_MIXER_SIZE 2048
 
 enum HDSP_IO_Type {
diff --git a/include/uapi/sound/hdspm.h b/include/uapi/sound/hdspm.h
index 3fbfd9dc5f51..14af3d00ea3f 100644
--- a/include/uapi/sound/hdspm.h
+++ b/include/uapi/sound/hdspm.h
@@ -21,6 +21,10 @@
  *   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
  */
 
+#ifdef __linux__
+#include <linux/types.h>
+#endif
+
 /* Maximum channels is 64 even on 56Mode you have 64playbacks to matrix */
 #define HDSPM_MAX_CHANNELS      64
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
