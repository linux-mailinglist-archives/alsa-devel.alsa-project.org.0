Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E638C43CC89
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 16:41:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57A8016B8;
	Wed, 27 Oct 2021 16:40:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57A8016B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635345700;
	bh=q6rmUgt2OyIq70aYN6usSVplhJOCncgOHrlu5mIRvO4=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pOKUxInql3op2xmQwS4DqZG9I+bx7BVQjHyM9BXb/Wo2Fut1CLIb2q9A61/DIeZsY
	 Lbz2m6zJQ+ckcZvYJUVG1rHHLjEMQw9sAZOyRlhqHeg+jCDHhSd/qDHQIPVctirU9A
	 ZBCN5K7v7JvVgii5Y/UX04V9XqdlLODjkP5aJQoU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D5C4F800FF;
	Wed, 27 Oct 2021 16:40:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85F70F8025A; Wed, 27 Oct 2021 16:40:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABA54F800FF
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 16:40:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABA54F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="udlpxWJ2"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="psY+U3u5"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 879DF1FD47
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 14:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635345610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Zi6nJlBSER2tBx+JpqR6A3FVA/Kt0zJlvf+nEr8SOh0=;
 b=udlpxWJ230AAGQp/G+fWpQqdKOzWC6N+Tk+4c8bEZ0oH3fMrAVbw/Ze5gTyx2Uy+fXmQ5o
 vRFQwbSwG8HZwttvFHvHtxLaROIn4nqPLx4mR8accP1Sl2kvKo2PB22Rske5ti4Rgfx6FU
 aYo7uSZR8WXmGY7qf7oNsA6vh76Fxrs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635345610;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Zi6nJlBSER2tBx+JpqR6A3FVA/Kt0zJlvf+nEr8SOh0=;
 b=psY+U3u5s9wn8oum1dLK+2CRYn/5gRkwvB5aTrtP0/PR//+27DCsc79zrERW0VseuXQ26D
 YpwKhUbJlF7gl8CQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 76F15A3B8A;
 Wed, 27 Oct 2021 14:40:10 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils] alsactl: Add --quiet option to suppress alsa-lib
 error messages
Date: Wed, 27 Oct 2021 16:40:08 +0200
Message-Id: <20211027144008.27002-1-tiwai@suse.de>
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

alsactl prints error messages from alsa-lib as is, and it's rather
annoying to see the error messages like

  alsactl[xxx]: alsa-lib parser.c:242:(error_node) UCM is not supported for this HDA model (HDA Intel PCH...)
  alsactl[xxx]: alsa-lib main.c:1405:(snd_use_case_mgr_open) error: failed to import hw:0 use case configuration -6

that are recorded in the syslog at each boot.

This patch adds --quiet (or -q) option to suppress those error
messages from alsa-lib, and applies to the systemd services as
default.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 alsactl/alsa-restore.service.in | 4 ++--
 alsactl/alsa-state.service.in   | 4 ++--
 alsactl/alsactl.1               | 4 ++++
 alsactl/alsactl.c               | 5 +++++
 alsactl/alsactl.h               | 2 ++
 alsactl/utils.c                 | 2 ++
 6 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/alsactl/alsa-restore.service.in b/alsactl/alsa-restore.service.in
index 80fd5fd48203..06bc21c355de 100644
--- a/alsactl/alsa-restore.service.in
+++ b/alsactl/alsa-restore.service.in
@@ -11,5 +11,5 @@ ConditionPathExistsGlob=/dev/snd/control*
 [Service]
 Type=oneshot
 RemainAfterExit=true
-ExecStart=-@sbindir@/alsactl restore
-ExecStop=-@sbindir@/alsactl store
+ExecStart=-@sbindir@/alsactl -q restore
+ExecStop=-@sbindir@/alsactl -q store
diff --git a/alsactl/alsa-state.service.in b/alsactl/alsa-state.service.in
index 5a8fe5eeed7e..6b6e704ad8e5 100644
--- a/alsactl/alsa-state.service.in
+++ b/alsactl/alsa-state.service.in
@@ -9,5 +9,5 @@ ConditionPathExists=@daemonswitch@
 
 [Service]
 Type=simple
-ExecStart=-@sbindir@/alsactl -s -n 19 -c rdaemon
-ExecStop=-@sbindir@/alsactl -s kill save_and_quit
+ExecStart=-@sbindir@/alsactl -q -s -n 19 -c rdaemon
+ExecStop=-@sbindir@/alsactl -q -s kill save_and_quit
diff --git a/alsactl/alsactl.1 b/alsactl/alsactl.1
index 8296663a7c2d..0a0b4597a137 100644
--- a/alsactl/alsactl.1
+++ b/alsactl/alsactl.1
@@ -94,6 +94,10 @@ Use debug mode: a bit more verbose.
 \fI\-v, \-\-version\fP
 Print alsactl version number.
 
+.TP
+\fI\-q, \-\-quiet\fP
+Suppress error messages from alsa-lib.
+
 .TP
 \fI\-f, \-\-file\fP
 Select the configuration file to use. The default is /var/lib/alsa/asound.state.
diff --git a/alsactl/alsactl.c b/alsactl/alsactl.c
index 05738fb6b35f..e3bef2c69558 100644
--- a/alsactl/alsactl.c
+++ b/alsactl/alsactl.c
@@ -52,6 +52,7 @@ int use_syslog = 0;
 char *command;
 char *statefile = NULL;
 char *lockfile = SYS_LOCKFILE;
+int verbose_error = 1;
 
 #define TITLE	0x0100
 #define HEADER	0x0200
@@ -74,6 +75,7 @@ static struct arg args[] = {
 { 'h', "help", "this help" },
 { 'd', "debug", "debug mode" },
 { 'v', "version", "print version of this program" },
+{ 'q', "quiet", "suppress errors from alsa-lib" },
 { HEADER, NULL, "Available state options:" },
 { FILEARG | 'f', "file", "configuration file (default " SYS_ASOUNDRC ")" },
 { FILEARG | 'a', "config-dir", "boot / hotplug configuration directory (default " SYS_ASOUND_DIR ")" },
@@ -370,6 +372,9 @@ int main(int argc, char *argv[])
 			printf("alsactl version " SND_UTIL_VERSION_STR "\n");
 			res = EXIT_SUCCESS;
 			goto out;
+		case 'q':
+			verbose_error = 0;
+			break;
 		case '?':		// error msg already printed
 			help();
 			res = EXIT_FAILURE;
diff --git a/alsactl/alsactl.h b/alsactl/alsactl.h
index bbdf6c88baeb..f9c25931c924 100644
--- a/alsactl/alsactl.h
+++ b/alsactl/alsactl.h
@@ -83,3 +83,5 @@ static inline int hextodigit(int c)
 }
 
 #define ARRAY_SIZE(a) (sizeof (a) / sizeof (a)[0])
+
+extern int verbose_error;
diff --git a/alsactl/utils.c b/alsactl/utils.c
index a50797259f21..dfb06e1a4a15 100644
--- a/alsactl/utils.c
+++ b/alsactl/utils.c
@@ -182,6 +182,8 @@ void error_handler(const char *file, int line, const char *function, int err, co
 	char buf[2048];
 	va_list arg;
 
+	if (!verbose_error)
+		return;
 	va_start(arg, fmt);
 	vsnprintf(buf, sizeof(buf), fmt, arg);
 	va_end(arg);
-- 
2.31.1

