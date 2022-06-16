Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3548D54DB23
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 08:55:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDE5D1948;
	Thu, 16 Jun 2022 08:54:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDE5D1948
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655362545;
	bh=32zQCLJ485TNPNJ6+/V9LdRmaZ/jAc/fwIL7dY464vQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mjFKeqH9EzBLO9+7XC/mF0Gm538D3Oudat2Eem5GzUhCjemrHDIZWou/BOO8o2FG7
	 iZU1i6aUyLMDIOCn9bGoLecYFmCyJhDFcLDYKpoCCSgtMMLADbev9uRvZsfKfUCGSX
	 vr0jlZko5sKC3PLajCz0eR78/UsbWd3TGYlQWZDA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AC68F80310;
	Thu, 16 Jun 2022 08:54:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38E73F800B9; Thu, 16 Jun 2022 08:54:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C5ACF800B9
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 08:54:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C5ACF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="sjTqIOhb"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="IW7UnC0U"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id 4CC6BA1A3D402;
 Thu, 16 Jun 2022 08:54:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1655362472; bh=32zQCLJ485TNPNJ6+/V9LdRmaZ/jAc/fwIL7dY464vQ=;
 h=From:To:Cc:Subject:Date:From;
 b=sjTqIOhb70yZviv7Ai2lnuzed/qWaDOyzdUUyRVysLrqEE4hbiZyDKtIvxlaDAo7G
 ztabv83Uun4tF3IAsv4NbKqRVrpkGqW5sLUlz4FjpsEvpiDoZws7UD/PpzcIQt9S4t
 npvUL8l+neL/m055RdRBHxBBhjO8V4BOsGZeQCbk=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2GGf2KWE8RjF; Thu, 16 Jun 2022 08:54:27 +0200 (CEST)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id EDD4EA1A3D400;
 Thu, 16 Jun 2022 08:54:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1655362467; bh=32zQCLJ485TNPNJ6+/V9LdRmaZ/jAc/fwIL7dY464vQ=;
 h=From:To:Cc:Subject:Date:From;
 b=IW7UnC0UE6VWJBWPx9/wjIZ5QQSG4cz/RXy19oZUjVdincT3tvLyXS9HAwoTXfTos
 ilN/TEvQD9uI6K+YPjgwG2AedtA4zVS/fRVb+9zB4Ki11JMZZ0Hv3lVG8iGJslqMWD
 YmZ+fQhfB9n7Xcx3jGXLh5fRUPQd5Rs1+CMaDO3Y=
From: Pavel Hofman <pavel.hofman@ivitera.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] aplay: Support setting timestamp
Date: Thu, 16 Jun 2022 08:54:26 +0200
Message-Id: <20220616065426.27915-1-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pavel Hofman <pavel.hofman@ivitera.com>
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

To allow enabling timestamp and specify its type, a new option
--tstamp-type=TYPE is added. Recognized values are none (default),
gettimeofday, monotonic, monotonic-raw.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 aplay/aplay.1 |  4 ++++
 aplay/aplay.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/aplay/aplay.1 b/aplay/aplay.1
index 3bba59d..d3b7dce 100644
--- a/aplay/aplay.1
+++ b/aplay/aplay.1
@@ -207,6 +207,10 @@ sampling rates, numbers of channels, period and buffer bytes/sizes/times.
 For raw device hw:X this option basically lists hardware capabilities of
 the soundcard.
 .TP
+\fI\-\-tstamp\-type=TYPE\fP
+Specifies timestamp type inside the software configuration container.
+Types are: none (default), gettimeofday, monotonic, monotonic\-raw.
+.TP
 \fI\-\-fatal\-errors\fP
 Disables recovery attempts when errors (e.g. xrun) are encountered; the
 aplay process instead aborts immediately.
diff --git a/aplay/aplay.c b/aplay/aplay.c
index 63a4e34..5d15a32 100644
--- a/aplay/aplay.c
+++ b/aplay/aplay.c
@@ -139,6 +139,8 @@ static int use_strftime = 0;
 volatile static int recycle_capture_file = 0;
 static long term_c_lflag = -1;
 static int dump_hw_params = 0;
+static int enable_tstamp = 0;
+static snd_pcm_tstamp_type_t tstamp_type = SND_PCM_TSTAMP_TYPE_GETTIMEOFDAY;
 
 static int fd = -1;
 static off64_t pbrec_count = LLONG_MAX, fdcount;
@@ -244,6 +246,8 @@ _("Usage: %s [OPTION]... [FILE]...\n"
 "    --process-id-file   write the process ID here\n"
 "    --use-strftime      apply the strftime facility to the output file name\n"
 "    --dump-hw-params    dump hw_params of the device\n"
+"    --tstamp-type=TYPE  set timestamp (TYPE: none (default), gettimeofday,\n"
+"                        monotonic, monotonic-raw)\n"
 "    --fatal-errors      treat all errors as fatal\n"
   )
 		, command);
@@ -430,6 +434,7 @@ enum {
 	OPT_PROCESS_ID_FILE,
 	OPT_USE_STRFTIME,
 	OPT_DUMP_HWPARAMS,
+	OPT_TSTAMP_TYPE,
 	OPT_FATAL_ERRORS,
 };
 
@@ -517,6 +522,7 @@ int main(int argc, char *argv[])
 		{"use-strftime", 0, 0, OPT_USE_STRFTIME},
 		{"interactive", 0, 0, 'i'},
 		{"dump-hw-params", 0, 0, OPT_DUMP_HWPARAMS},
+		{"tstamp-type", 1, 0, OPT_TSTAMP_TYPE},
 		{"fatal-errors", 0, 0, OPT_FATAL_ERRORS},
 #ifdef CONFIG_SUPPORT_CHMAP
 		{"chmap", 1, 0, 'm'},
@@ -799,6 +805,23 @@ int main(int argc, char *argv[])
 		case OPT_DUMP_HWPARAMS:
 			dump_hw_params = 1;
 			break;
+		case OPT_TSTAMP_TYPE:
+			if (strcasecmp(optarg, "gettimeofday") == 0) {
+				enable_tstamp = 1;
+				tstamp_type = SND_PCM_TSTAMP_TYPE_GETTIMEOFDAY;
+			} else if (strcasecmp(optarg, "monotonic") == 0) {
+				enable_tstamp = 1;
+				tstamp_type = SND_PCM_TSTAMP_TYPE_MONOTONIC;
+			} else if (strcasecmp(optarg, "monotonic-raw") == 0) {
+				enable_tstamp = 1;
+				tstamp_type = SND_PCM_TSTAMP_TYPE_MONOTONIC_RAW;
+			} else if (strcasecmp(optarg, "none") == 0)
+				enable_tstamp = 0;
+			else {
+				error(_("unrecognized timestamp type %s"), optarg);
+				return 1;
+			}
+			break;
 		case OPT_FATAL_ERRORS:
 			fatal_errors = 1;
 			break;
@@ -1453,6 +1476,15 @@ static void set_params(void)
 		stop_threshold = (double) rate * stop_delay / 1000000;
 	err = snd_pcm_sw_params_set_stop_threshold(handle, swparams, stop_threshold);
 	assert(err >= 0);
+	if (enable_tstamp) {
+		err = snd_pcm_sw_params_set_tstamp_mode(handle, swparams, SND_PCM_TSTAMP_ENABLE);
+		assert(err >= 0);
+		err = snd_pcm_sw_params_set_tstamp_type(handle, swparams, tstamp_type);
+		if (err < 0) {
+			error(_("Unable to set the requested timestamp type."));
+			prg_exit(EXIT_FAILURE);
+		}
+	}
 
 	if (snd_pcm_sw_params(handle, swparams) < 0) {
 		error(_("unable to install sw params:"));
-- 
2.25.1

