Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF29742BCE4
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Oct 2021 12:35:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FF8D1690;
	Wed, 13 Oct 2021 12:34:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FF8D1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634121318;
	bh=yfiUP4NcsQnVDtsKzoKUFgFLQaSTNQJYUH6gxYzBH74=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uEznWWM49hLMXvyUAO+MC69P/P1Xv7HTBFCOcaqkB9yCYTvlvQRVLHiQbML+IhHdk
	 JuW6B00uFRa9gqV8ffFmwvnxJlNehUxpU9zO4zMQRf0o7vwQR1aMYVe49oRRiD+eBU
	 pULhxhrrUjbgkgMDtV5a3gPQOnlzsHnnhQuevQYk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6523F80085;
	Wed, 13 Oct 2021 12:34:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 330A3F80269; Wed, 13 Oct 2021 12:34:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF23BF80088
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 12:33:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF23BF80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="MC2/AAQu"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="KHsJS7Xu"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id 7555AA1A3D404;
 Wed, 13 Oct 2021 12:33:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1634121229; bh=yfiUP4NcsQnVDtsKzoKUFgFLQaSTNQJYUH6gxYzBH74=;
 h=From:To:Cc:Subject:Date:From;
 b=MC2/AAQuSD/8yy0fZJLiYsgkiSLeQ4kgwNfd1BQocqgN95yjWJqmspsHa+d7cm4o8
 oYqIOneofzfZQ49d0/AF/6mNXjsukJOKgo4abN9SCGpLj3it8Q5hbR0Oz1rP94C+La
 afuJuEraB+tJ4BCHyJPEXEm5+jx6c63zuQKanJ7M=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YPSFSbEYLlLT; Wed, 13 Oct 2021 12:33:43 +0200 (CEST)
Received: from precision.doma (ip28.insite.cz [81.0.237.28])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id B87BFA1A3D403;
 Wed, 13 Oct 2021 12:33:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1634121223; bh=yfiUP4NcsQnVDtsKzoKUFgFLQaSTNQJYUH6gxYzBH74=;
 h=From:To:Cc:Subject:Date:From;
 b=KHsJS7Xum/AvDNpezYA1UzDi56Wlst1Ltu2tyn4zZiBrmrh266RCBdQdBXg3bxzi3
 oEju8l5Cq8LEItItHXFJ68h+nuo/8Mp04rbW/sSPlxSUXgmhSrdvv6JgVrztsJhypM
 3601XW3hGdAz86XtifCUoSoVFQLFnHiNVyUBlRbU=
From: Pavel Hofman <pavel.hofman@ivitera.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3] alsaloop: added option prateshift for PLAYSHIFT ctl elem
 used in PLAYSHIFT
Date: Wed, 13 Oct 2021 12:33:43 +0200
Message-Id: <20211013103343.40522-1-pavel.hofman@ivitera.com>
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

If snd-aloop device is on playback side, the required sync mode is
PLAYSHIFT. That means Loopback ctl elem "PCM Rate Shift 100000" of the
corresponding capture side of the Loopback pipe must be controlled (by
a reciprocal).

ASCII name of the playback rate shift ctl elem is specified with newly
added option -x/--prateshift, e.g.:
-P hw:Loopback,0 -S playshift \
-x iface=PCM,name='PCM Rate Shift 100000',device=1

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---

Notes:
    * using snd_ctl_elem_id_alloca instead of snd_ctl_elem_id_malloc
    * removed corresponding snd_ctl_elem_id_free calls

 alsaloop/alsaloop.1 | 11 +++++--
 alsaloop/alsaloop.c | 11 ++++++-
 alsaloop/alsaloop.h |  1 +
 alsaloop/pcmjob.c   | 77 +++++++++++++++++++++++++++++++++------------
 4 files changed, 77 insertions(+), 23 deletions(-)

diff --git a/alsaloop/alsaloop.1 b/alsaloop/alsaloop.1
index 6bacfd5..006494d 100644
--- a/alsaloop/alsaloop.1
+++ b/alsaloop/alsaloop.1
@@ -57,6 +57,11 @@ Use given CTL device for playback.
 
 Use given CTL device for capture.
 
+.TP
+\fI\-x <ctl_ascii_name>\fP | \fI\-\-prateshift=<ctl_ascii_name>\fP
+
+Specify ctl ascii name for playshift sync mode (see the Examples section).
+
 .TP
 \fI\-l <latency>\fP | \fI\-\-latency=<frames>\fP
 
@@ -195,10 +200,12 @@ Verbose xrun profiling.
 Set process wake timeout.
 
 .SH EXAMPLES
-
-.TP
+.nf
 \fBalsaloop \-C hw:0,0 \-P hw:1,0 \-t 50000\fR
 
+\fBalsaloop \-C hw:soundcard,0 \-P hw:Loopback,0 \-t 50000 \-S playshift \\
+\-x iface=PCM,name='PCM Rate Shift 100000',device=1\fR
+.ne
 .SH BUGS
 None known.
 .SH AUTHOR
diff --git a/alsaloop/alsaloop.c b/alsaloop/alsaloop.c
index 06ffadf..4192712 100644
--- a/alsaloop/alsaloop.c
+++ b/alsaloop/alsaloop.c
@@ -175,6 +175,7 @@ void help(void)
 "-C,--cdevice   capture device\n"
 "-X,--pctl      playback ctl device\n"
 "-Y,--cctl      capture ctl device\n"
+"-x,--prateshift playback 'PCM Rate Shift 100000' ascii ctl name\n"
 "-l,--latency   requested latency in frames\n"
 "-t,--tlatency  requested latency in usec (1/1000000sec)\n"
 "-f,--format    sample format\n"
@@ -362,6 +363,7 @@ static int parse_config(int argc, char *argv[], snd_output_t *output,
 		{"cdevice", 1, NULL, 'C'},
 		{"pctl", 1, NULL, 'X'},
 		{"cctl", 1, NULL, 'Y'},
+		{"prateshift", 1, NULL, 'x'},
 		{"latency", 1, NULL, 'l'},
 		{"tlatency", 1, NULL, 't'},
 		{"format", 1, NULL, 'f'},
@@ -391,6 +393,7 @@ static int parse_config(int argc, char *argv[], snd_output_t *output,
 	char *arg_cdevice = NULL;
 	char *arg_pctl = NULL;
 	char *arg_cctl = NULL;
+	char *arg_prateshift = NULL;
 	unsigned int arg_latency_req = 0;
 	unsigned int arg_latency_reqtime = 10000;
 	snd_pcm_format_t arg_format = SND_PCM_FORMAT_S16_LE;
@@ -420,7 +423,7 @@ static int parse_config(int argc, char *argv[], snd_output_t *output,
 	while (1) {
 		int c;
 		if ((c = getopt_long(argc, argv,
-				"hdg:P:C:X:Y:l:t:F:f:c:r:s:benvA:S:a:m:T:O:w:UW:z",
+				"hdg:P:C:X:Y:x:l:t:F:f:c:r:s:benvA:S:a:m:T:O:w:UW:z",
 				long_option, NULL)) < 0)
 			break;
 		switch (c) {
@@ -446,6 +449,9 @@ static int parse_config(int argc, char *argv[], snd_output_t *output,
 		case 'Y':
 			arg_cctl = strdup(optarg);
 			break;
+		case 'x':
+			arg_prateshift = strdup(optarg);
+			break;
 		case 'l':
 			err = atoi(optarg);
 			arg_latency_req = err >= 4 ? err : 4;
@@ -627,6 +633,9 @@ static int parse_config(int argc, char *argv[], snd_output_t *output,
 			logit(LOG_CRIT, "Unable to add ossmixer controls.\n");
 			exit(EXIT_FAILURE);
 		}
+		if (arg_prateshift)
+			play->prateshift_name = arg_prateshift;
+
 #ifdef USE_SAMPLERATE
 		loop->src_enable = arg_samplerate > 0;
 		if (loop->src_enable)
diff --git a/alsaloop/alsaloop.h b/alsaloop/alsaloop.h
index 1dbcefe..7a98ef3 100644
--- a/alsaloop/alsaloop.h
+++ b/alsaloop/alsaloop.h
@@ -127,6 +127,7 @@ struct loopback_handle {
 	snd_ctl_elem_value_t *ctl_format;
 	snd_ctl_elem_value_t *ctl_rate;
 	snd_ctl_elem_value_t *ctl_channels;
+	char *prateshift_name; /* ascii name for the playback rate shift ctl elem */
 };
 
 struct loopback {
diff --git a/alsaloop/pcmjob.c b/alsaloop/pcmjob.c
index 845ab82..13fa595 100644
--- a/alsaloop/pcmjob.c
+++ b/alsaloop/pcmjob.c
@@ -1101,7 +1101,8 @@ void update_pitch(struct loopback *loop)
 #endif
 	}
 	else if (loop->sync == SYNC_TYPE_PLAYRATESHIFT) {
-		set_rate_shift(loop->play, pitch);
+		// pitch is capture-based, playback side requires reciprocal
+		set_rate_shift(loop->play, 1 / pitch);
 #ifdef USE_SAMPLERATE
 		if (loop->use_samplerate) {
 			loop->src_data.src_ratio = 
@@ -1172,44 +1173,80 @@ static int get_channels(struct loopback_handle *lhandle)
 	return snd_ctl_elem_value_get_integer(lhandle->ctl_channels, 0);
 }
 
-static void openctl_elem(struct loopback_handle *lhandle,
-			 int device, int subdevice,
-			 const char *name,
-			 snd_ctl_elem_value_t **elem)
+static int openctl_elem_id(struct loopback_handle *lhandle, snd_ctl_elem_id_t *id,
+		snd_ctl_elem_value_t **elem)
 {
 	int err;
 
 	if (snd_ctl_elem_value_malloc(elem) < 0) {
 		*elem = NULL;
+ 		return -ENOMEM;
+ 	}
+	snd_ctl_elem_value_set_id(*elem, id);
+	snd_ctl_elem_value_set_interface(*elem, SND_CTL_ELEM_IFACE_PCM);
+	err = snd_ctl_elem_read(lhandle->ctl, *elem);
+	if (err < 0) {
+		snd_ctl_elem_value_free(*elem);
+		*elem = NULL;
+		return err;
 	} else {
-		snd_ctl_elem_value_set_interface(*elem,
-						 SND_CTL_ELEM_IFACE_PCM);
-		snd_ctl_elem_value_set_device(*elem, device);
-		snd_ctl_elem_value_set_subdevice(*elem, subdevice);
-		snd_ctl_elem_value_set_name(*elem, name);
-		err = snd_ctl_elem_read(lhandle->ctl, *elem);
-		if (err < 0) {
-			snd_ctl_elem_value_free(*elem);
-			*elem = NULL;
-		} else {
-			if (verbose)
-				snd_output_printf(lhandle->loopback->output,
-						"Opened PCM element %s of %s, device %d, subdevice %d\n",
-						name, snd_ctl_name(lhandle->ctl), device, subdevice);
-		}
+		snd_output_printf(lhandle->loopback->output,
+				"Opened PCM element %s of %s, device %d, subdevice %d\n",
+				snd_ctl_elem_id_get_name(id), snd_ctl_name(lhandle->ctl),
+				snd_ctl_elem_id_get_device(id),
+				snd_ctl_elem_id_get_subdevice(id));
+		return 0;
 	}
 }
 
+static int openctl_elem(struct loopback_handle *lhandle,
+			 int device, int subdevice,
+			 const char *name,
+			 snd_ctl_elem_value_t **elem)
+{
+	snd_ctl_elem_id_t *id;
+
+	snd_ctl_elem_id_alloca(&id);
+	snd_ctl_elem_id_set_device(id, device);
+	snd_ctl_elem_id_set_subdevice(id, subdevice);
+	snd_ctl_elem_id_set_name(id, name);
+	return openctl_elem_id(lhandle, id, elem);
+}
+
+static int openctl_elem_ascii(struct loopback_handle *lhandle, char *ascii_name,
+		snd_ctl_elem_value_t **elem)
+{
+	snd_ctl_elem_id_t *id;
+
+	snd_ctl_elem_id_alloca(&id);
+	if (snd_ctl_ascii_elem_id_parse(id, ascii_name)) {
+		fprintf(stderr, "Wrong control identifier: %s\n", ascii_name);
+		return -EINVAL;
+	}
+	return openctl_elem_id(lhandle, id, elem);
+}
+
 static int openctl(struct loopback_handle *lhandle, int device, int subdevice)
 {
 	int err;
 
 	lhandle->ctl_rate_shift = NULL;
 	if (lhandle->loopback->play == lhandle) {
+		// play only
+		if (lhandle->prateshift_name) {
+			err = openctl_elem_ascii(lhandle, lhandle->prateshift_name,
+					&lhandle->ctl_rate_shift);
+			if (err < 0) {
+				logit(LOG_CRIT, "Unable to open playback PCM Rate Shift elem '%s'.\n",
+						lhandle->prateshift_name);
+				exit(EXIT_FAILURE);
+			}
+		}
 		if (lhandle->loopback->controls)
 			goto __events;
 		return 0;
 	}
+	// capture only
 	openctl_elem(lhandle, device, subdevice, "PCM Notify",
 			&lhandle->ctl_notify);
 	openctl_elem(lhandle, device, subdevice, "PCM Rate Shift 100000",
-- 
2.25.1

