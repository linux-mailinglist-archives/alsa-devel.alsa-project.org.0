Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A1010328D
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 05:32:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7ADF416A6;
	Wed, 20 Nov 2019 05:31:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7ADF416A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574224359;
	bh=HICYH6aQrEfX4Wd/YG56HHUqbcuOFvytu8JSMaiHjP8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XIuy6CmfnN4cD7g6SLvuFRQ/hgOIqM6yn2XqgH1Z41kQ8oQV40ubz9ryqkvzgZQ0w
	 sds2QNCQccXqn/JSmB3ViQamDIsfgyBA4cF1FgidBo0RW/eu1KNZmVqin2IEaTyFKJ
	 k5trjl3wX8XmqsAdIXsWThVg4ZDgv8TKxjSpjcRY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75584F8015E;
	Wed, 20 Nov 2019 05:29:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3E86F8013E; Wed, 20 Nov 2019 05:29:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9784FF8013D
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 05:29:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9784FF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Qb+wAp4Q"
Received: by mail-pl1-x641.google.com with SMTP id s10so13205875plp.2
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 20:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4nfCJ/UBWZ4SqL78Yq/S2dIZKyTU02zXWyjyp+B3PUk=;
 b=Qb+wAp4QKVANVbtFRXv+0uxVC5fPaF2azUy9PUcq9XCtLoCqXePV8FRyzWPWjrwgGa
 EakjLcQdb0h0dVyyEcrqe4OjnOi6/3lK12RGDiJL7/Uu9AI5lOEiPq8XX6jcnARt1RU5
 WEGZvZv/lHelMz9GzuB9Dh7Y3IAAUTjS5n+WEITctx97rZ6uYMDyhtT0+ANqUeh72TbC
 5h2FiQ9NrrKZV+npPJF02WXa+/b9RGI/JE/xgy2fJTZBv8Ea51mpA4+BS1LZgcgJMaN1
 BDm9RBYVdSfBUWlR2zud/bdDGClK7TRakBq24EulkaYA/kZzF8uGEQqulDrlkgsSW9G5
 fcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4nfCJ/UBWZ4SqL78Yq/S2dIZKyTU02zXWyjyp+B3PUk=;
 b=oKXFErMy6vREhvBzBG3jhvScMYeC1nPcKDq9j7VLdZNv8sCITD3PmtcM8LxCtRdvFR
 Oj6Pz+OYiKOR/O4VBdZr7siaQZy0q1IhQ7fUL9FMfZ5ubY6LRcfQuwabOZGC5QH1WBg6
 qczTNAE3tQ79KyPNuT4eSTw1BahWU/LZer1+J5EEet7YYklG4hvtjnDhVQ3R4ms4WkSW
 Rqcd+XzpD3vRbjsMRYlbbWC3FsajTc7kqt84C/KalrFHFfOPyuQT6++tlxzyFjQfBkmr
 U9OVL7gAy7+JBBoNyk8B7BarCN22UqjO9JUyhZ+5AJ+3vx3I/puqrUlkk2r+bp6az0e1
 BHgQ==
X-Gm-Message-State: APjAAAWDmT9dNmPe6tbsrStwLeL1bctVVfMx+xzS3PTqf2hqPq4NLstC
 3tnhmAMlHLCrh1z2dm6P2PGzVsSrhOY=
X-Google-Smtp-Source: APXvYqyIZ6C7rdbxwaVDvrEvi0HgH719IZ2udiGWBQ6U8oI3du4hbBYyrIU1L0fdUXk9HzpaPUYORA==
X-Received: by 2002:a17:90a:db05:: with SMTP id g5mr1480436pjv.5.1574224140021; 
 Tue, 19 Nov 2019 20:29:00 -0800 (PST)
Received: from mangix-trapnet.lan ([69.42.0.214])
 by smtp.gmail.com with ESMTPSA id a6sm5447285pja.30.2019.11.19.20.28.59
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 20:28:59 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: alsa-devel@alsa-project.org
Date: Tue, 19 Nov 2019 20:28:55 -0800
Message-Id: <20191120042856.415854-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191120042856.415854-1-rosenp@gmail.com>
References: <20191120042856.415854-1-rosenp@gmail.com>
MIME-Version: 1.0
Subject: [alsa-devel] [PATCH 3/4] treewide: Fix printf formats
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

Found with cppcheck

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 alsactl/init_parse.c  |  4 ++--
 alsaloop/pcmjob.c     | 10 +++++-----
 amixer/amixer.c       |  6 +++---
 aplay/aplay.c         |  2 +-
 axfer/subcmd-list.c   |  2 +-
 axfer/xfer-libffado.c |  2 +-
 axfer/xfer-options.c  |  2 +-
 7 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/alsactl/init_parse.c b/alsactl/init_parse.c
index 562e674..c048fd3 100644
--- a/alsactl/init_parse.c
+++ b/alsactl/init_parse.c
@@ -187,7 +187,7 @@ static int init_space(struct space **space, int card)
 		return -ENOMEM;
 	res->ctl_id_changed = ~0;
 	res->linenum = -1;
-	sprintf(device, "hw:%u", card);
+	sprintf(device, "hw:%d", card);
 	err = snd_hctl_open(&res->ctl_handle, device, 0);
 	if (err < 0)
 		goto error;
@@ -734,7 +734,7 @@ dbvalue:
 			elem = snd_hctl_elem_next(elem);
 		}
 		snd_ctl_elem_id_free(id);
-		sprintf(res, "%u", index);
+		sprintf(res, "%d", index);
 		dbg("do_ctl_count found %s controls", res);
 		return res;
 	}
diff --git a/alsaloop/pcmjob.c b/alsaloop/pcmjob.c
index 29d1aba..b252486 100644
--- a/alsaloop/pcmjob.c
+++ b/alsaloop/pcmjob.c
@@ -120,7 +120,7 @@ static int setparams_stream(struct loopback_handle *lhandle,
 	}
 	err = snd_pcm_hw_params_set_rate_resample(handle, params, lhandle->resample);
 	if (err < 0) {
-		logit(LOG_CRIT, "Resample setup failed for %s (val %i): %s\n", lhandle->id, lhandle->resample, snd_strerror(err));
+		logit(LOG_CRIT, "Resample setup failed for %s (val %u): %s\n", lhandle->id, lhandle->resample, snd_strerror(err));
 		return err;
 	}
 	err = snd_pcm_hw_params_set_access(handle, params, lhandle->access);
@@ -135,13 +135,13 @@ static int setparams_stream(struct loopback_handle *lhandle,
 	}
 	err = snd_pcm_hw_params_set_channels(handle, params, lhandle->channels);
 	if (err < 0) {
-		logit(LOG_CRIT, "Channels count (%i) not available for %s: %s\n", lhandle->channels, lhandle->id, snd_strerror(err));
+		logit(LOG_CRIT, "Channels count (%u) not available for %s: %s\n", lhandle->channels, lhandle->id, snd_strerror(err));
 		return err;
 	}
 	rrate = lhandle->rate_req;
 	err = snd_pcm_hw_params_set_rate_near(handle, params, &rrate, 0);
 	if (err < 0) {
-		logit(LOG_CRIT, "Rate %iHz not available for %s: %s\n", lhandle->rate_req, lhandle->id, snd_strerror(err));
+		logit(LOG_CRIT, "Rate %uHz not available for %s: %s\n", lhandle->rate_req, lhandle->id, snd_strerror(err));
 		return err;
 	}
 	rrate = 0;
@@ -152,7 +152,7 @@ static int setparams_stream(struct loopback_handle *lhandle,
 	    !lhandle->loopback->src_enable &&
 #endif
 	    (int)rrate != lhandle->rate) {
-		logit(LOG_CRIT, "Rate does not match (requested %iHz, got %iHz, resample %i)\n", lhandle->rate, rrate, lhandle->resample);
+		logit(LOG_CRIT, "Rate does not match (requested %uHz, got %uHz, resample %u)\n", lhandle->rate, rrate, lhandle->resample);
 		return -EINVAL;
 	}
 	lhandle->pitch = (double)lhandle->rate_req / (double)lhandle->rate;
@@ -1613,7 +1613,7 @@ __again:
 	if (count > loop->play->buffer_size)
 		count = loop->play->buffer_size;
 	if (err != count) {
-		logit(LOG_CRIT, "%s: initial playback fill error (%i/%i/%i)\n", loop->id, err, (int)count, loop->play->buffer_size);
+		logit(LOG_CRIT, "%s: initial playback fill error (%i/%i/%u)\n", loop->id, err, (int)count, loop->play->buffer_size);
 		err = -EIO;
 		goto __error;
 	}
diff --git a/amixer/amixer.c b/amixer/amixer.c
index f7f31f0..928f7c5 100644
--- a/amixer/amixer.c
+++ b/amixer/amixer.c
@@ -465,7 +465,7 @@ static void decode_tlv(unsigned int spaces, unsigned int *tlv, unsigned int tlv_
 	size = tlv[idx++];
 	tlv_size -= 2 * sizeof(unsigned int);
 	if (size > tlv_size) {
-		printf("TLV size error (%i, %i, %i)!\n", type, size, tlv_size);
+		printf("TLV size error (%u, %u, %u)!\n", type, size, tlv_size);
 		return;
 	}
 	switch (type) {
@@ -576,7 +576,7 @@ static void decode_tlv(unsigned int spaces, unsigned int *tlv, unsigned int tlv_
 		break;
 #endif
 	default:
-		printf("unk-%i-", type);
+		printf("unk-%u-", type);
 		while (size > 0) {
 			printf("0x%08x,", tlv[idx++]);
 			size -= sizeof(unsigned int);
@@ -611,7 +611,7 @@ static int show_control(const char *space, snd_hctl_elem_t *elem,
 	}
 	count = snd_ctl_elem_info_get_count(info);
 	type = snd_ctl_elem_info_get_type(info);
-	printf("%s; type=%s,access=%s,values=%i", space, control_type(info), control_access(info), count);
+	printf("%s; type=%s,access=%s,values=%u", space, control_type(info), control_access(info), count);
 	switch (type) {
 	case SND_CTL_ELEM_TYPE_INTEGER:
 		printf(",min=%li,max=%li,step=%li\n", 
diff --git a/aplay/aplay.c b/aplay/aplay.c
index 5241068..72fa567 100644
--- a/aplay/aplay.c
+++ b/aplay/aplay.c
@@ -3346,7 +3346,7 @@ static void playbackv(char **names, unsigned int count)
 		}
 		alloced = 1;
 	} else if (count != channels) {
-		error(_("You need to specify %d files"), channels);
+		error(_("You need to specify %u files"), channels);
 		prg_exit(EXIT_FAILURE);
 	}
 
diff --git a/axfer/subcmd-list.c b/axfer/subcmd-list.c
index e22628c..359f73f 100644
--- a/axfer/subcmd-list.c
+++ b/axfer/subcmd-list.c
@@ -31,7 +31,7 @@ static int dump_device(snd_ctl_t *handle, const char *id, const char *name,
 	       snd_pcm_info_get_name(info));
 
 	count = snd_pcm_info_get_subdevices_count(info);
-	printf("  Subdevices: %i/%i\n",
+	printf("  Subdevices: %i/%u\n",
 	       snd_pcm_info_get_subdevices_avail(info), count);
 
 	for (i = 0; i < count; ++i) {
diff --git a/axfer/xfer-libffado.c b/axfer/xfer-libffado.c
index a37cce6..6db835d 100644
--- a/axfer/xfer-libffado.c
+++ b/axfer/xfer-libffado.c
@@ -440,7 +440,7 @@ static int xfer_libffado_pre_process(struct xfer_context *xfer,
 	}
 	if (*samples_per_frame != channels) {
 		fprintf(stderr,
-			"The number of samples per frame should be %i.\n",
+			"The number of samples per frame should be %u.\n",
 			channels);
 		return -EINVAL;
 	}
diff --git a/axfer/xfer-options.c b/axfer/xfer-options.c
index 352d126..3740b16 100644
--- a/axfer/xfer-options.c
+++ b/axfer/xfer-options.c
@@ -238,7 +238,7 @@ static int validate_options(struct xfer_context *xfer)
 		xfer->frames_per_second *= 1000;
 	if (xfer->frames_per_second < 2000 ||
 	    xfer->frames_per_second > 192000) {
-		fprintf(stderr, "bad speed value '%i'\n", val);
+		fprintf(stderr, "bad speed value '%u'\n", val);
 		return -EINVAL;
 	}
 
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
