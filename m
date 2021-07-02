Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FF83BA3C2
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jul 2021 19:52:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92FBB16B8;
	Fri,  2 Jul 2021 19:51:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92FBB16B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625248355;
	bh=xKbnGb2xSI9K6n9nujM1F0DLC+XJBUVekEIDxVAOhyw=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vVGChG8Dt/p2Brf0QMu+HUcf90M/Vz1fViGBcaJkUe7wHYjLC7GdgWcu3xczAGCEW
	 xLb+q+3sgZBqcF3vcLR9LgkKtfXReRtV+E4IbDMMhZ4qQIrMeQ8dNcp1FbUY/lJJx2
	 JDBBfEgesoEZ2hVlBtAUHcVuAwKmjm/lE6lFYf0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F020BF80165;
	Fri,  2 Jul 2021 19:51:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41075F80229; Fri,  2 Jul 2021 19:51:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net
 [194.109.24.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B39DF80165
 for <alsa-devel@alsa-project.org>; Fri,  2 Jul 2021 19:50:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B39DF80165
Received: from cust-b66e5d83 ([IPv6:fc0c:c157:b88d:62c6:5e3c:5f07:82d0:1b4])
 by smtp-cloud8.xs4all.net with ESMTPA
 id zNJXlBWog48ZvzNJYlMoiI; Fri, 02 Jul 2021 19:50:56 +0200
Received: from localhost (localhost [127.0.0.1])
 by keetweej.vanheusden.com (Postfix) with ESMTP id 54EE6160CD1
 for <alsa-devel@alsa-project.org>; Fri,  2 Jul 2021 19:50:55 +0200 (CEST)
Received: from keetweej.vanheusden.com ([127.0.0.1])
 by localhost (mauer.intranet.vanheusden.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id ZwbCVHuLW5sS for <alsa-devel@alsa-project.org>;
 Fri,  2 Jul 2021 19:50:52 +0200 (CEST)
Received: from belle.intranet.vanheusden.com (belle.intranet.vanheusden.com
 [192.168.64.100])
 by keetweej.vanheusden.com (Postfix) with ESMTP id E22F81626C7
 for <alsa-devel@alsa-project.org>; Fri,  2 Jul 2021 19:50:52 +0200 (CEST)
Received: by belle.intranet.vanheusden.com (Postfix, from userid 1000)
 id DAC661623D6; Fri,  2 Jul 2021 19:50:52 +0200 (CEST)
Date: Fri, 2 Jul 2021 19:50:52 +0200
From: folkert <folkert@vanheusden.com>
To: alsa-devel@alsa-project.org
Subject: timestamp
Message-ID: <20210702175052.GI80002@belle.intranet.vanheusden.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: www.vanheusden.com
X-Chameleon-Return-To: folkert@vanheusden.com
X-Xfmail-Return-To: folkert@vanheusden.com
X-Phonenumber: +31-6-41278122
X-URL: http://www.vanheusden.com/
X-PGP-KeyID: 1F077C42
X-GPG-fingerprint: AC89 09CE 41F2 00B4 FCF2  B174 3019 0E8C 1F28 D8AE
X-Key: http://pgp.surfnet.nl:11371/pks/lookup?op=get&search=0x1F077C42
Read-Receipt-To: <folkert@vanheusden.com>
Reply-By: Thu 01 Jul 2021 09:01:16 PM CEST
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4xfOgzIvr3hD0DCp9HLM8hEHL4dSqMdF/WVORvPHsBXULEou/oIYB/bQZNUKFJnOScrQhKLYsxiUAKKpfSiA+/q6nQfTqIWH6L8nkkSXZdjH5oht3OQU1h
 8qvkrB1hkoEYV1/lCqce0f2JLuRi7wluGzxkChRLDYoL63tj+ikTjmdK+ChlBjMqRTu6cRtIu6Qgppojardh0f/WyrsmyI1iw08FhSIUnBEdn906Xa16Qawu
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

Hi,

Please consider including the following patch. This patch adds a '-T'
flag which prepends MIDI messages outputted by '--dump' with a
timestamp.
E.g.:

1625245188.993861810) C964
1625245188.994318675) F8
1625245188.995468101) 99647F
1625245189.494490183) F8
1625245189.495448424) 99647F
1625245189.995470260) F8
1625245189.996461381) 99647F
1625245190.494519924) F8
[...]


diff -uNr t3/alsa-utils-1.2.3/amidi/amidi.1 alsa-utils-1.2.3/amidi/amidi.1
--- t3/alsa-utils-1.2.3/amidi/amidi.1	2020-06-07 19:19:42.000000000 +0200
+++ alsa-utils-1.2.3/amidi/amidi.1	2021-07-02 14:35:25.416330576 +0200
@@ -6,6 +6,7 @@
 .SH SYNOPSIS
 \fBamidi\fP [\fI\-p port\fP] [\fI\-s file\fP | \fI\-S data\fP]
 [\fI\-r file\fP] [\fI\-d\fP] [\fI\-t seconds\fP] [\fI\-a\fP]
+[\fI\-T\fP]
 
 .SH DESCRIPTION
 .B amidi
@@ -41,6 +42,10 @@
 options to specify what data to send or receive.
 
 .TP
+.I \-T
+Adds a timestamp in front of each MIDI message.
+
+.TP
 .I \-h, \-\-help
 Help: prints a list of options.
 
diff -uNr t3/alsa-utils-1.2.3/amidi/amidi.c alsa-utils-1.2.3/amidi/amidi.c
--- t3/alsa-utils-1.2.3/amidi/amidi.c	2020-06-07 19:19:42.000000000 +0200
+++ alsa-utils-1.2.3/amidi/amidi.c	2021-07-02 19:41:34.476470438 +0200
@@ -36,6 +36,7 @@
 #include <unistd.h>
 #include <fcntl.h>
 #include <alsa/asoundlib.h>
+#include <time.h>
 #include "aconfig.h"
 #include "version.h"
 
@@ -80,6 +81,7 @@
 		"-r, --receive=file              write received data into a file\n"
 		"-S, --send-hex=\"...\"            send hexadecimal bytes\n"
 		"-d, --dump                      print received data as hexadecimal bytes\n"
+		"-T, --timestamp                 adds a timestamp in front of each dumped message\n"
 		"-t, --timeout=seconds           exits when no data has been received\n"
 		"                                for the specified duration\n"
 		"-a, --active-sensing            include active sensing bytes\n"
@@ -356,7 +358,7 @@
 /*
  * prints MIDI commands, formatting them nicely
  */
-static void print_byte(unsigned char byte)
+static void print_byte(unsigned char byte, struct timespec *ts)
 {
 	static enum {
 		STATE_UNKNOWN,
@@ -426,7 +428,18 @@
 		if (running_status)
 			fputs("\n  ", stdout);
 	}
-	printf("%c%02X", newline ? '\n' : ' ', byte);
+
+	if (newline) {
+		printf("\n");
+
+		/* Nanoseconds does not make a lot of sense for serial MIDI (the
+		 * 31250 bps one) but I'm not sure about MIDI over USB.
+		 */
+		if (ts)
+			printf("%lld.%.9ld) ", (long long)ts->tv_sec, ts->tv_nsec);
+	}
+
+	printf("%02X", byte);
 }
 
 static void sig_handler(int dummy)
@@ -454,7 +467,7 @@
 
 int main(int argc, char *argv[])
 {
-	static const char short_options[] = "hVlLp:s:r:S::dt:aci:";
+	static const char short_options[] = "hVlLp:s:r:S::dt:aci:T";
 	static const struct option long_options[] = {
 		{"help", 0, NULL, 'h'},
 		{"version", 0, NULL, 'V'},
@@ -465,6 +478,7 @@
 		{"receive", 1, NULL, 'r'},
 		{"send-hex", 2, NULL, 'S'},
 		{"dump", 0, NULL, 'd'},
+		{"timestamp", 0, NULL, 'T'},
 		{"timeout", 1, NULL, 't'},
 		{"active-sensing", 0, NULL, 'a'},
 		{"clock", 0, NULL, 'c'},
@@ -475,6 +489,7 @@
 	int ignore_active_sensing = 1;
 	int ignore_clock = 1;
 	int do_send_hex = 0;
+	int do_print_timestamp = 0;
 	struct itimerspec itimerspec = { .it_interval = { 0, 0 } };
 
 	while ((c = getopt_long(argc, argv, short_options,
@@ -509,6 +524,9 @@
 		case 'd':
 			dump = 1;
 			break;
+		case 'T':
+			do_print_timestamp = 1;
+			break;
 		case 't':
 			if (optarg)
 				timeout = atof(optarg);
@@ -611,6 +629,7 @@
 	}
 
 	if (inputp) {
+		int need_timestamp = 0;
 		int read = 0;
 		int npfds;
 		struct pollfd *pfds;
@@ -648,6 +667,7 @@
 			unsigned char buf[256];
 			int i, length;
 			unsigned short revents;
+			struct timespec ts;
 
 			err = poll(pfds, npfds, -1);
 			if (stop || (err < 0 && errno == EINTR))
@@ -657,6 +677,11 @@
 				break;
 			}
 
+			if (clock_gettime(CLOCK_REALTIME, &ts) < 0) {
+				error("clock_getres failed: %s", strerror(errno));
+				break;
+			}
+
 			err = snd_rawmidi_poll_descriptors_revents(input, &pfds[1], npfds - 1, &revents);
 			if (err < 0) {
 				error("cannot get poll events: %s", snd_strerror(errno));
@@ -692,7 +717,8 @@
 				write(receive_file, buf, length);
 			if (dump) {
 				for (i = 0; i < length; ++i)
-					print_byte(buf[i]);
+					print_byte(buf[i], do_print_timestamp ? &ts : NULL);
+
 				fflush(stdout);
 			}
 
diff -uNr t3/alsa-utils-1.2.3/configure.ac alsa-utils-1.2.3/configure.ac
--- t3/alsa-utils-1.2.3/configure.ac	2021-07-02 19:41:46.000000000 +0200
+++ alsa-utils-1.2.3/configure.ac	2021-07-02 15:55:13.245585248 +0200
@@ -97,7 +97,7 @@
 if test x$bat = xtrue; then
 
   saved_CFLAGS="$CFLAGS"
-  saved_LDFLAGS="$LDFLAGS"
+  saved_LDFLAGS="$LDFLAGS -lrt"
   saved_LIBS="$LIBS"
   FFTW_INC=""
   FFTW_LIB=""
@@ -116,7 +116,7 @@
   FFTW_CFLAGS="$CFLAGS"
   FFTW_LIB="$LIBS"
   CFLAGS="$saved_CFLAGS"
-  LDFLAGS="$saved_LDFLAGS"
+  LDFLAGS="$saved_LDFLAGS -lrt"
   LIBS="$saved_LIBS"
   AC_SUBST(FFTW_INC)
   AC_SUBST(FFTW_LIB)
@@ -292,11 +292,11 @@
   fi
 
   saved_CFLAGS="$CFLAGS"
-  saved_LDFLAGS="$LDFLAGS"
+  saved_LDFLAGS="$LDFLAGS -lrt"
   saved_LIBS="$LIBS"
   CFLAGS="$CFLAGS $CURSES_CFLAGS"
   if test -n "$CURSESLIBDIR"; then
-    LDFLAGS="$LDFLAGS -L$CURSESLIBDIR"
+    LDFLAGS="$LDFLAGS -L$CURSESLIBDIR -lrt"
   fi
   LIBS="$CURSESLIB $LIBS"
 
@@ -342,7 +342,7 @@
                [AC_MSG_ERROR([form$NCURSESLIBSUFFIX library not found])])
 
   CFLAGS="$saved_CFLAGS"
-  LDFLAGS="$saved_LDFLAGS"
+  LDFLAGS="$saved_LDFLAGS -lrt"
   LIBS="$saved_LIBS"
 
   if test -n "$CURSESLIBDIR"; then
