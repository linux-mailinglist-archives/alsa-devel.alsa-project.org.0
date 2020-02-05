Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A4D152770
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Feb 2020 09:15:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70386168E;
	Wed,  5 Feb 2020 09:14:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70386168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580890514;
	bh=zP1Uqm7kMpp6ZBqGdlB0dNUak8opQMf+ksoTG4NsqJQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ejHdnbG5IWuXJa++ypxecSLPeWVwz9Keg9y59GmMTtUCqUmnHawVVzXuva4ap6KJ6
	 lqymsBRWeHW0kRPQFBckGeGOtiFuewX3jq5utFEyjrdrkvjHcNlD9MXZGMWGBHD/BP
	 htFYCtf2ZON1vEHcF3ibEucDx3t1NeTlmrCJ38XU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 972D0F80273;
	Wed,  5 Feb 2020 09:12:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 678A3F80150; Wed,  5 Feb 2020 09:12:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A132BF800E2
 for <alsa-devel@alsa-project.org>; Wed,  5 Feb 2020 09:12:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A132BF800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mforney-org.20150623.gappssmtp.com
 header.i=@mforney-org.20150623.gappssmtp.com header.b="M/hnK0Ay"
Received: by mail-pj1-x1044.google.com with SMTP id d5so640290pjz.5
 for <alsa-devel@alsa-project.org>; Wed, 05 Feb 2020 00:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mforney-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=i/ew3DHCyPkr9noAQwkl2sD9XyVm/lp03qhxO5bPoVs=;
 b=M/hnK0Ays4uzymZq6vQP8gdW8NRem9O2puSZRBU0As/I9AldfH1rDSeSEdKHYKve7b
 OBsZS9HGCX6p4aY6U2Y/+cS3Ws9KCO2z915XPKoHazg0pzTV9mLA9SF0DreILTOdhDiS
 OAc0ysxqvgzCj0ilXPrKRaGnpDrvIod9V5xKLZ5ms9i7oIQ52fmemmzQAxAuDqY9aGNN
 bvlHzfDQTsG6EMg+lun1eL75WH/ZGE6OCuWVqom7yReP9J8StvGckAqUoxSYIAlRlP4p
 BPhUc2t2hPcLdO2aaMrtuif4BB4rDQj10AQgeWXn/hPXfJAPMUUPUqKUGWceI9/LOYip
 stGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i/ew3DHCyPkr9noAQwkl2sD9XyVm/lp03qhxO5bPoVs=;
 b=AWiokObvm2uALKhcxPcRuaNz1ftKiE7bwRur7L7quBG2ZIu75fIhejK9wIdDC6o3gm
 +xhKL81qfiC55Zp+LVHbmxlefd7jUAbhpT5OSSJBf2okQ2hcnJk5/MDpGSWMYzyEKEIL
 USG12cnBFzPKEN4/XNg5TUpE9L2OKJtqkG7euEVSeMlZfKoa0rJBzrJe96XLbrav/w1z
 2DDoLGE8hcKylkj87uUJj/US1f11y15ZuwkrCLSnQLRI3vb0xIeVxHWtGg03qEZrr14Z
 08ATWzHJAakhudbjOcOtgg8joTQWFfn0KQSsQ1D/XxQoEbXPhl5WqzegG9Q+COgmoh2t
 bEsw==
X-Gm-Message-State: APjAAAWekIzahxg1aOAxBybRo5fuzemJDEP6FVRRyoMU7LrmEQRGbfG5
 clZs/LEM5sFOHD25DD7Z2Km7x0lI0Z79vw==
X-Google-Smtp-Source: APXvYqzOq+mRPT39KoajKmfWJTfnh9Htzo/nuOja20NNAXcRbQUX5s6VBKDPwqequ8o3eioSsR0gqQ==
X-Received: by 2002:a17:902:8a85:: with SMTP id
 p5mr35103198plo.154.1580890359935; 
 Wed, 05 Feb 2020 00:12:39 -0800 (PST)
Received: from localhost ([2601:647:5180:4570:16dd:a9ff:fee7:6b79])
 by smtp.gmail.com with ESMTPSA id q17sm19018992pfg.123.2020.02.05.00.12.39
 for <alsa-devel@alsa-project.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Feb 2020 00:12:39 -0800 (PST)
From: Michael Forney <mforney@mforney.org>
To: alsa-devel@alsa-project.org
Date: Wed,  5 Feb 2020 00:12:19 -0800
Message-Id: <20200205081221.18665-2-mforney@mforney.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200205081221.18665-1-mforney@mforney.org>
References: <20200205081221.18665-1-mforney@mforney.org>
MIME-Version: 1.0
Subject: [alsa-devel] [PATCH alsa-utils 2/4] Avoid pointer arithmetic on
	`void *`
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

The pointer operand to the binary `+` operator must be to a complete
object type.

Signed-off-by: Michael Forney <mforney@mforney.org>
---
 aplay/aplay.c                     | 4 ++--
 axfer/xfer-libasound-irq-mmap.c   | 7 ++++---
 axfer/xfer-libasound-timer-mmap.c | 4 ++--
 bat/common.c                      | 2 +-
 seq/aplaymidi/aplaymidi.c         | 2 +-
 5 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/aplay/aplay.c b/aplay/aplay.c
index 908093c..08395f6 100644
--- a/aplay/aplay.c
+++ b/aplay/aplay.c
@@ -442,7 +442,7 @@ static ssize_t xwrite(int fd, const void *buf, size_t count)
 	size_t offset = 0;
 
 	while (offset < count) {
-		written = write(fd, buf + offset, count - offset);
+		written = write(fd, (char *)buf + offset, count - offset);
 		if (written <= 0)
 			return written;
 
@@ -1210,7 +1210,7 @@ static int test_au(int fd, void *buffer)
 	hwparams.channels = BE_INT(ap->channels);
 	if (hwparams.channels < 1 || hwparams.channels > 256)
 		return -1;
-	if ((size_t)safe_read(fd, buffer + sizeof(AuHeader), BE_INT(ap->hdr_size) - sizeof(AuHeader)) != BE_INT(ap->hdr_size) - sizeof(AuHeader)) {
+	if ((size_t)safe_read(fd, (char *)buffer + sizeof(AuHeader), BE_INT(ap->hdr_size) - sizeof(AuHeader)) != BE_INT(ap->hdr_size) - sizeof(AuHeader)) {
 		error(_("read error"));
 		prg_exit(EXIT_FAILURE);
 	}
diff --git a/axfer/xfer-libasound-irq-mmap.c b/axfer/xfer-libasound-irq-mmap.c
index a13b3c3..386e741 100644
--- a/axfer/xfer-libasound-irq-mmap.c
+++ b/axfer/xfer-libasound-irq-mmap.c
@@ -146,9 +146,10 @@ static int irq_mmap_process_frames(struct libasound_state *state,
 	// TODO: Perhaps, the complex layout can be supported as a variation of
 	// vector type. However, there's no driver with this layout.
 	if (layout->vector == NULL) {
-		frame_buf = areas[0].addr;
-		frame_buf += snd_pcm_frames_to_bytes(state->handle,
-						     frame_offset);
+		char *buf;
+		buf = areas[0].addr;
+		buf += snd_pcm_frames_to_bytes(state->handle, frame_offset);
+		frame_buf = buf;
 	} else {
 		int i;
 		for (i = 0; i < layout->samples_per_frame; ++i) {
diff --git a/axfer/xfer-libasound-timer-mmap.c b/axfer/xfer-libasound-timer-mmap.c
index 1c642fe..ba26e29 100644
--- a/axfer/xfer-libasound-timer-mmap.c
+++ b/axfer/xfer-libasound-timer-mmap.c
@@ -100,8 +100,8 @@ static void *get_buffer(struct libasound_state *state,
 
 	if (layout->vector == NULL) {
 		char *buf;
-		buf = areas[0].addr + snd_pcm_frames_to_bytes(state->handle,
-							      frame_offset);
+		buf = areas[0].addr;
+		buf += snd_pcm_frames_to_bytes(state->handle, frame_offset);
 		frame_buf = buf;
 	} else {
 		int i;
diff --git a/bat/common.c b/bat/common.c
index d3d1f28..339e749 100644
--- a/bat/common.c
+++ b/bat/common.c
@@ -231,7 +231,7 @@ int generate_input_data(struct bat *bat, void *buffer, int bytes, int frames)
 		load = 0;
 
 		while (1) {
-			err = fread(buffer + load, 1, bytes - load, bat->fp);
+			err = fread((char *)buffer + load, 1, bytes - load, bat->fp);
 			if (0 == err) {
 				if (feof(bat->fp)) {
 					fprintf(bat->log,
diff --git a/seq/aplaymidi/aplaymidi.c b/seq/aplaymidi/aplaymidi.c
index 12d6fac..b086e70 100644
--- a/seq/aplaymidi/aplaymidi.c
+++ b/seq/aplaymidi/aplaymidi.c
@@ -633,7 +633,7 @@ static void handle_big_sysex(snd_seq_event_t *ev)
 		check_snd("sync output", err);
 		if (sleep(1))
 			fatal("aborted");
-		ev->data.ext.ptr += MIDI_BYTES_PER_SEC;
+		ev->data.ext.ptr = (char *)ev->data.ext.ptr + MIDI_BYTES_PER_SEC;
 		length -= MIDI_BYTES_PER_SEC;
 	}
 	ev->data.ext.len = length;
-- 
2.25.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
