Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D12C434F04
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 17:27:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7658168D;
	Wed, 20 Oct 2021 17:26:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7658168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634743658;
	bh=xDxTA1oor2mfalZWnHW0TtY6cZc66F1bIRSh0+XZLp4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y7uFXg6ntfl9aq1etYYijnb7J0mR4lYkKaEztHceNjW4CNKFo03JK5TpV06dWE+DC
	 cLfJLVVooq/cPrfHx9Ayd0O684Vp3qrgzUS/lI+tvK+8J4VQXZfnhpk9Pxy7mgtI+2
	 1PZJxJJ2YMq6PjMIZRmCOLIFjkFs3iKiREFsgNrw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6C52F802DF;
	Wed, 20 Oct 2021 17:26:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84F52F802DF; Wed, 20 Oct 2021 17:26:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61247F800ED
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 17:26:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61247F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="cHJlOfUd"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="n3cvOcX7"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 58CF31FD4B
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 15:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634743571; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6CVDDegU+qjLJJQnGDde/FdJOgrEhcK9CroUxiwRPh0=;
 b=cHJlOfUdGcTUOiJhxPAsaoydBR7lZTT9/yRZRbG7aYabCT8gvMCAP2RvACtbv5RCbIzwdr
 7Wt4lPbscvuHhAPO6E3nxQIRzBfnYnL306uHDuVKeiJLsQM0ztqg3LJQ3vnNajz60DnST5
 cZ/0UsFXKn+YtnYUo4dOe/lwmYX06nE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634743571;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6CVDDegU+qjLJJQnGDde/FdJOgrEhcK9CroUxiwRPh0=;
 b=n3cvOcX7ZPL2zKdnIfHEgWuT0E5kqr+MnurQeuDl5HKlgx+EpaiTUQwTgM9fE1U8arN1Nm
 rYw1Hm9f4DoJchBA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 46F13A3B81;
 Wed, 20 Oct 2021 15:26:11 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils 2/2] alsamixer: Allow setting the default
 background color in config
Date: Wed, 20 Oct 2021 17:26:08 +0200
Message-Id: <20211020152608.27985-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211020152608.27985-1-tiwai@suse.de>
References: <20211020152608.27985-1-tiwai@suse.de>
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

The recent commit c867aa8a84a7 ("alsamixer: use background color
instead of COLOR_BLACK") changed the behavior of alsamixer to take the
system default background color instead of black.  This caused
problems on the terminal setups that have bright background colors,
e.g. yellow is very hard to read.

It could be "fixed" by setting up the color configurations in
~/.config/alsamixer.rc, but this needs to change the all colors in
every element, which is pretty cumbersome.  Instead, this patch
extends the config set command to allow user to specify the default
background color.  A user like me can create their own
~/.config/alsamixer.rc file containing the line

  set background black

and the old good black background is back again.

Note that, for achieving the above, we also had to shuffle the
function call order, to parse the config at first, then initialize
curses.  This shouldn't matter for other behavior.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 alsamixer/alsamixer.1    | 4 ++++
 alsamixer/cli.c          | 8 ++++----
 alsamixer/colors.c       | 9 +++++----
 alsamixer/colors.h       | 1 +
 alsamixer/configparser.c | 9 +++++++++
 5 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/alsamixer/alsamixer.1 b/alsamixer/alsamixer.1
index 19171e12fdcf..670ab21c902f 100644
--- a/alsamixer/alsamixer.1
+++ b/alsamixer/alsamixer.1
@@ -202,6 +202,10 @@ Set the mouse wheel step to \fI<N>\fP
 
 If enabled (\fI1\fP), mixer controls can be changed by hovering over them and scrolling the mouse wheel.
 
+\fBbackground\fP \fIcolor\fP
+
+Set the default background color
+
 .TP
 \fBbind\fP \fIkey_definition\fP \fIcommand\fP
 
diff --git a/alsamixer/cli.c b/alsamixer/cli.c
index f153f280cd9f..63c4949bab96 100644
--- a/alsamixer/cli.c
+++ b/alsamixer/cli.c
@@ -152,15 +152,15 @@ int main(int argc, char *argv[])
 
 	parse_options(argc, argv);
 
-	create_mixer_object(&selem_regopt);
-
-	initialize_curses(use_color, use_mouse);
-
 	if (config_file == CONFIG_DEFAULT)
 		parse_default_config_file();
 	else if (config_file)
 		parse_config_file(config_file);
 
+	create_mixer_object(&selem_regopt);
+
+	initialize_curses(use_color, use_mouse);
+
 	create_mixer_widget();
 
 	mainloop();
diff --git a/alsamixer/colors.c b/alsamixer/colors.c
index c81ebcf089ee..f76dc26ef380 100644
--- a/alsamixer/colors.c
+++ b/alsamixer/colors.c
@@ -23,6 +23,7 @@
 #include "colors.h"
 
 struct attributes attrs;
+short background_color = -1;
 
 int get_color_pair(short fg, short bg)
 {
@@ -50,11 +51,11 @@ void init_colors(int use_color)
 		start_color();
 		use_default_colors();
 
-		get_color_pair(COLOR_CYAN, -1); // COLOR_PAIR(1)
-		get_color_pair(COLOR_YELLOW, -1);
+		get_color_pair(COLOR_CYAN, background_color); // COLOR_PAIR(1)
+		get_color_pair(COLOR_YELLOW, background_color);
 		get_color_pair(COLOR_WHITE, COLOR_GREEN);
-		get_color_pair(COLOR_RED, -1);
-		get_color_pair(COLOR_WHITE, -1);
+		get_color_pair(COLOR_RED, background_color);
+		get_color_pair(COLOR_WHITE, background_color);
 		get_color_pair(COLOR_WHITE, COLOR_BLUE);
 		get_color_pair(COLOR_RED, COLOR_BLUE);
 		get_color_pair(COLOR_GREEN, COLOR_GREEN);
diff --git a/alsamixer/colors.h b/alsamixer/colors.h
index 7ca6ac58210a..1c7bff8e7d32 100644
--- a/alsamixer/colors.h
+++ b/alsamixer/colors.h
@@ -34,6 +34,7 @@ struct attributes {
 };
 
 extern struct attributes attrs;
+extern short background_color;
 
 void init_colors(int use_color);
 int get_color_pair(short fg, short bg);
diff --git a/alsamixer/configparser.c b/alsamixer/configparser.c
index 7647987f84d6..4396d4ff302e 100644
--- a/alsamixer/configparser.c
+++ b/alsamixer/configparser.c
@@ -444,6 +444,15 @@ static int cfg_set(char **argv, unsigned int argc)
 				return ERROR_CONFIG;
 			}
 		}
+		else if (!strcmp(argv[0], "background")) {
+			int bg_color = color_by_name(argv[1]);
+			if (bg_color == -2) {
+				error_message = _("unknown color");
+				error_cause = argv[1];
+				return ERROR_CONFIG;
+			}
+			background_color = bg_color;
+		}
 		else {
 			error_message = _("unknown option");
 			error_cause = argv[0];
-- 
2.26.2

