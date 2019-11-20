Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8535110328A
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 05:30:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF4DD168E;
	Wed, 20 Nov 2019 05:30:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF4DD168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574224253;
	bh=CwXHxfXsgKkGWLjKW+CVFSabYPUuFquiTZSOGPt+d08=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=srLIO90K7OeOT4pe5N6s9T9z9GcUSGBC6qp1nu+sI8unypTX+yNL8JM7WeqXwsVHc
	 XLC5lrHfKrqZf3bxStvfGNYnoHf3WOe2cbUTUDvDPLzVmWhEEex6BN0FR+mnHCQbu8
	 BWf1LdYQ2F4GqvVzXLMHkGPVDgkl/CXm/2wSSyRQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE145F8013E;
	Wed, 20 Nov 2019 05:29:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EC4EF800FF; Wed, 20 Nov 2019 05:29:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A21C0F800FF
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 05:29:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A21C0F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MDyJHePA"
Received: by mail-pl1-x643.google.com with SMTP id e3so13194566plt.7
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 20:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s5lWFvUeOBcFk6YFHqGR6+n59NlM2aTMEft0kV+ckQU=;
 b=MDyJHePAtP7zG+7VKYQV3EH8VDJRBMIcrlFHt52XVfRefnqS9IpReno5s0ixOWWG0W
 laXxw4KIfztZPBiINUP7qBaMNJLKN2xCfMlYn61iiuy0zMqUiPviM4m7I8O0e62udOyo
 C/e5MlHNmYnBcFGyLaHpBr/KKhsDZlVx1HNLOZfEQVRbqpMNP1IwYB8v2u7gdotOimqZ
 SUI49XDUOKdx+dZLnfZiS7CpJDPx0huLLJOgCIp/w2iFpBYJIESxoRU7l5Bb0O85mG+Y
 Wcekns0USrYgJd+pXTwqoRiaRRJaBJo2iJUxrGVz+E0+sA5XdCyuZxK2qxrnFLuQdQBH
 TYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s5lWFvUeOBcFk6YFHqGR6+n59NlM2aTMEft0kV+ckQU=;
 b=BrYwJ7Ujw8GnSP7Tc7DTOHFiiUGrh0LD3+XrIrMP/Qo0XYmrbRf7Q9GVmG/fjFZeu/
 nd4gJI5Y3Dxk5LUh57KkZEM9tSzjkFzxqrG1JKxuiZvIv+U49Upru1wXq818L1gNYHyY
 mCfnN4+9Rq+SmhISyF3FOGPIcINfPrHY/Gr0EjLbX4LkesTMoQ2rkDLMMorAl78A0BHn
 RJKbxKg8tI6gsqgYejP4xFH9NhXj0IMRfrcXT/vHHjKxViqDjZ3p6nrNcVt7ab7iCi3a
 ARdjTmjZbzbOq6uHRm+HyZTSbtH2VrMQDT5iqKa/D25oY3Q9Fvs0L4A7++kW/f4HPFOz
 1uog==
X-Gm-Message-State: APjAAAWKcnhq+nS8eOOWaxFYTK/JELHyzRc6FxCg1Iv8E7OI0GBB1hSb
 HQiUzhaeB66L9Byj37mOYou57yvU4Fo=
X-Google-Smtp-Source: APXvYqyclkxEyIhQUDsnqNycxjK4CWbks2J6pkl+A153vpyhdV6zblBwn2lvymEnyHeskWV7Uodfww==
X-Received: by 2002:a17:902:8341:: with SMTP id
 z1mr887234pln.222.1574224138506; 
 Tue, 19 Nov 2019 20:28:58 -0800 (PST)
Received: from mangix-trapnet.lan ([69.42.0.214])
 by smtp.gmail.com with ESMTPSA id a6sm5447285pja.30.2019.11.19.20.28.57
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 20:28:57 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: alsa-devel@alsa-project.org
Date: Tue, 19 Nov 2019 20:28:53 -0800
Message-Id: <20191120042856.415854-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [alsa-devel] [PATCH 1/4] treewide: sys/poll to poll
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Fixes warning on musl:

warning redirecting incorrect #include <sys/poll.h> to <poll.h>

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 amidi/amidi.c               | 2 +-
 amixer/amixer.c             | 2 +-
 aplay/aplay.c               | 2 +-
 seq/aplaymidi/arecordmidi.c | 2 +-
 seq/aseqdump/aseqdump.c     | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/amidi/amidi.c b/amidi/amidi.c
index b6e05e1..c6268e4 100644
--- a/amidi/amidi.c
+++ b/amidi/amidi.c
@@ -31,7 +31,7 @@
 #include <signal.h>
 #include <sys/timerfd.h>
 #include <sys/types.h>
-#include <sys/poll.h>
+#include <poll.h>
 #include <sys/stat.h>
 #include <unistd.h>
 #include <fcntl.h>
diff --git a/amixer/amixer.c b/amixer/amixer.c
index ad9c482..f7f31f0 100644
--- a/amixer/amixer.c
+++ b/amixer/amixer.c
@@ -28,7 +28,7 @@
 #include <errno.h>
 #include <assert.h>
 #include <alsa/asoundlib.h>
-#include <sys/poll.h>
+#include <poll.h>
 #include <stdint.h>
 #include "amixer.h"
 #include "../alsamixer/volume_mapping.h"
diff --git a/aplay/aplay.c b/aplay/aplay.c
index 274bbce..5241068 100644
--- a/aplay/aplay.c
+++ b/aplay/aplay.c
@@ -44,7 +44,7 @@
 #include <assert.h>
 #include <termios.h>
 #include <signal.h>
-#include <sys/poll.h>
+#include <poll.h>
 #include <sys/uio.h>
 #include <sys/time.h>
 #include <sys/stat.h>
diff --git a/seq/aplaymidi/arecordmidi.c b/seq/aplaymidi/arecordmidi.c
index f3db65e..604cd0d 100644
--- a/seq/aplaymidi/arecordmidi.c
+++ b/seq/aplaymidi/arecordmidi.c
@@ -27,7 +27,7 @@
 #include <string.h>
 #include <signal.h>
 #include <getopt.h>
-#include <sys/poll.h>
+#include <poll.h>
 #include <alsa/asoundlib.h>
 #include "aconfig.h"
 #include "version.h"
diff --git a/seq/aseqdump/aseqdump.c b/seq/aseqdump/aseqdump.c
index 7904540..578e06f 100644
--- a/seq/aseqdump/aseqdump.c
+++ b/seq/aseqdump/aseqdump.c
@@ -25,7 +25,7 @@
 #include <string.h>
 #include <signal.h>
 #include <getopt.h>
-#include <sys/poll.h>
+#include <poll.h>
 #include <alsa/asoundlib.h>
 #include "aconfig.h"
 #include "version.h"
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
