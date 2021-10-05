Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90166423073
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Oct 2021 20:56:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C24D166D;
	Tue,  5 Oct 2021 20:55:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C24D166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633460208;
	bh=IXrxCfWNfsJ9hZyWTfV5rqxc/ygdgLXpMku/2YL4pew=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=r5ViCDbIh0uNzCp1hcKF0AKNWSJff2w+Ba7+rGfc6Ochfvxaw4djS/+hdDUqqXFec
	 OaFO9Fe+4v8RnpwH9uxLaQ249PfyoAp/czCTpIUBpgUnMNLVqL7mYZwCGCyb/T3WwX
	 kFebTcsbYZIR5mtWVhN5RfBqwij/o9RzDUXRX0Fc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F2F8F8028B;
	Tue,  5 Oct 2021 20:55:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28E2CF8027D; Tue,  5 Oct 2021 20:55:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78E6EF8010B
 for <alsa-devel@alsa-project.org>; Tue,  5 Oct 2021 20:55:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78E6EF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="l76wseuj"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="dongRwNU"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id C7A38A1A3D403;
 Tue,  5 Oct 2021 20:55:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1633460119; bh=IXrxCfWNfsJ9hZyWTfV5rqxc/ygdgLXpMku/2YL4pew=;
 h=From:To:Cc:Subject:Date:From;
 b=l76wseujgcmcYMgHIxyUNajzNPuW7MQP2XY5UdFWCpBNJK7GNp+rdMUtir0iebE0V
 8xqqSt5v4qNqQn08ta0qjlYvJWC2GOhUFXMRL0gU45oVdxvbgMi4yO2dlOMfVhgR4q
 f1Dj41Oh3PN9T+q81KJ+YKT1uSAqoE4n6IHcBLj4=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Lsy1PmFMZhE; Tue,  5 Oct 2021 20:55:14 +0200 (CEST)
Received: from precision.doma (ip28.insite.cz [81.0.237.28])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id 4C327A1A3D402;
 Tue,  5 Oct 2021 20:55:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1633460114; bh=IXrxCfWNfsJ9hZyWTfV5rqxc/ygdgLXpMku/2YL4pew=;
 h=From:To:Cc:Subject:Date:From;
 b=dongRwNUAWj9iEWn2lWCvKSjfoE+Hoq+QoYtlLmWmK8s/B8pFZ78Llwt4e4XU7t7/
 /uYWWl6R/MC/JbYyo9kOkbGPFLJ5QcBLXYHBaxWuTVuO1AJFZdJj3i5k5lAoSplVkG
 kL2TNGq0MTS7iw0tXEE9kY/wY57WaFCZ5BPOlTO4=
From: Pavel Hofman <pavel.hofman@ivitera.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] alsaloop: added option prateshift for ctl elem used in
 PLAYSHIFT sync
Date: Tue,  5 Oct 2021 20:55:13 +0200
Message-Id: <20211005185513.5409-1-pavel.hofman@ivitera.com>
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
 alsaloop/alsaloop.1 | 11 ++++--
 alsaloop/alsaloop.c | 11 +++++-
 alsaloop/alsaloop.h |  1 +
 alsaloop/pcmjob.c   | 86 ++++++++++++++++++++++++++++++++++-----------
 4 files changed, 86 insertions(+), 23 deletions(-)

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
index 845ab82..4b56d03 100644
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
@@ -1172,44 +1173,89 @@ static int get_channels(struct loopback_handle *lhandle)
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
+		snd_ctl_elem_id_free(id);
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
+	if (snd_ctl_elem_id_malloc(&id))
+		return -ENOMEM;
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
+	if (snd_ctl_elem_value_malloc(elem) < 0)
+		return -ENOMEM;
+	if (snd_ctl_elem_id_malloc(&id)) {
+		snd_ctl_elem_value_free(*elem);
+		return -ENOMEM;
+	}
+	if (snd_ctl_ascii_elem_id_parse(id, ascii_name)) {
+		snd_ctl_elem_id_free(id);
+		snd_ctl_elem_value_free(*elem);
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

