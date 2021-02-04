Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB96330F77E
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 17:19:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F63C1679;
	Thu,  4 Feb 2021 17:18:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F63C1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612455578;
	bh=uzKoTCNYWRYhkTIbjFp88AYze+iIUcLXb2KDOFXvGdM=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Km6W8PxPA2Ln7l+tLS1Zvusaphx1CtJ959b+neOWOuCaA9LdayqJh87V1Cyq761kj
	 zRwaKReFAsYAeDbqiS8QqkeubEq2heWx/AKyOd+UwLKvptjtT+AL+mi/k2jwdu8YXE
	 CFTB2Y09fRe5CFQkU+DttQsa7yCUTwc5rD3XoakQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57F0FF80139;
	Thu,  4 Feb 2021 17:18:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86449F80171; Thu,  4 Feb 2021 17:18:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE278F80139
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 17:17:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE278F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qsuG2H6W"
Received: by mail-ed1-x532.google.com with SMTP id z22so4816564edb.9
 for <alsa-devel@alsa-project.org>; Thu, 04 Feb 2021 08:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=tIZ30PJ/XaKGtaTrqhw9e5H6pDT/+pZcMyU/ip6dZkg=;
 b=qsuG2H6W52d3GdXTj1Fk99Duji/oOQP8B87ukiZtx3gp4xmY44AaqpmxLc9QnA5KM2
 JvfPQsJldzIZVUeFToOG8wy2D1I4DtwmqzeRHYRWVSRq9TyoeG3hTnK1KikkSF080BgG
 PV79KXDmkAIQbQFOOkTiInD7vjlYKuE6JzKiQq4bVUcrgm6EK3e5Z/nskB+ERCheIW/z
 3Rrqtj1JCAw6JEBDXBLn6oFxtut5X0q1apLxssarxLG4QI573TlITHaLqAzaTMLkQheI
 v1vddnqf7Xy3ZjPw8lE3rARWMlwE1v6vLzs1nuga+juT4D6LtcKOYarP300BanA5Tnuv
 uUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=tIZ30PJ/XaKGtaTrqhw9e5H6pDT/+pZcMyU/ip6dZkg=;
 b=EhL07jqkOGtGB9FdJgWWhYWLGEEQroK6rgMKpJ0MM21XRIstBcrouRHHqGz0LhT0+B
 umRIksI4FBVpqjogEZsT1y/4G724rZnx1pq7lL94nzHmxPxAv5+kkLw74GEJdPxTJZE1
 Qpa02/bkNyfqO62Pak8dM4+FFnd3dxz3C7F9X3pNojT893wCz7yqpclT52Y3ae9Y+kvP
 rePy4e9sPY0yj/0FEH0yQ1CMgonPT7iWvg6/VMMUh+XEqpWL1TIYzsG08ElGL37INzrC
 VQ6WUgmVEKSqwxnF8l0qMWXmAPjzRRMopVbru7hgtPwZrc/ld+mQE011KaqV8qPTZ+sy
 +hkw==
X-Gm-Message-State: AOAM530MnzkXx+6dduDklrult16pV98qC+RXE4yB6rBDRq7wSYa3PTc+
 0VENlbC+tnIzos75mFSkK4JK7mImQ84tNA==
X-Google-Smtp-Source: ABdhPJyuuOo+VGskPwl2utb5gc3cbLM7uadfOW6spGjJpIk083ugN2VzRBbx5kceaArPJAUqeplMqw==
X-Received: by 2002:aa7:d399:: with SMTP id x25mr8630820edq.237.1612455473902; 
 Thu, 04 Feb 2021 08:17:53 -0800 (PST)
Received: from ?IPv6:2a02:8388:1987:9380:20:6c65:c6a1:793b?
 (2a02-8388-1987-9380-0020-6c65-c6a1-793b.cable.dynamic.v6.surfer.at.
 [2a02:8388:1987:9380:20:6c65:c6a1:793b])
 by smtp.gmail.com with ESMTPSA id c16sm147821ejm.86.2021.02.04.08.17.52
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 08:17:53 -0800 (PST)
To: alsa-devel@alsa-project.org
From: fassl <superfassl@gmail.com>
Subject: [PATCH] alsa-tools/hdspmixer: enhance preset save and add hardware
 ouput loopback buttons
Message-ID: <2e9bb0b8-ee14-9dc9-1bd8-ecffca3982ac@gmail.com>
Date: Thu, 4 Feb 2021 17:17:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

From 3c887b31fa57ca3004c2eaf0ee5abc0b3f94da70 Mon Sep 17 00:00:00 2001
From: Jasmin Fazlic <superfassl@gmail.com>
Date: Thu, 4 Feb 2021 15:58:33 +0100
Subject: [PATCH 1/2] alsa-tools/hdspmixer: enhance saving of presets

Changing the version in the file header would make
a preset file not readable by older versions of the
tool. If we just append new data always at the end
of the save procedure we should have no problems
reading them with different versions, as they all
just read to a certain point and ignore the rest
of the file.

This patch implements the logic to save the presets
first to a file called file_name.tmp and appends any
extra data that would come after in a possibly present
file_name file.

Any data written by newer versions would remain in
the preset file and from now on no old version should
remove data written by newer versions.

Also since we write to a temporary file and rename
afterwards an extra feature is gained of not corrupting
the preset should we crash.

Signed-off-by: Jasmin Fazlic <superfassl@gmail.com>
---
 hdspmixer/src/HDSPMixerWindow.cxx | 98 ++++++++++++++++++++-----------
 1 file changed, 64 insertions(+), 34 deletions(-)

diff --git a/hdspmixer/src/HDSPMixerWindow.cxx b/hdspmixer/src/HDSPMixerWindow.cxx
index 9efc25d..3b3d668 100644
--- a/hdspmixer/src/HDSPMixerWindow.cxx
+++ b/hdspmixer/src/HDSPMixerWindow.cxx
@@ -353,18 +353,25 @@ void HDSPMixerWindow::save()
             sizeof(inputs->strips[0]->data[0][0][0]->fader_pos) /
             sizeof(inputs->strips[0]->data[0][0][0]->fader_pos[0]));
 
-
-    FILE *file;
-
-    if ((file = fopen(file_name, "w")) == NULL) {
-    fl_alert("Error opening file %s for saving", file_name);
+    FILE *in,*out;
+
+    /* We want to append any existing extra data that might got written by a
+     * newer version to this file, therefore write our data to file_name.tmp
+     * and append the old data. Also this way we would not corrupt the file
+     * should we crash.
+     */
+    std::string const tmp = file_name + std::string(".tmp");
+    char const * const tmpc = tmp.c_str();
+
+    if ((out = fopen(tmpc, "w")) == NULL) {
+    fl_alert("Error opening file %s for saving", tmpc);
     }
     if (dirty) {
     inputs->buttons->presets->save_preset(current_preset+1);
     }
     /* since hdspmixer 1.11, we also store the meter level settings. Indicate
      * the new on-disk structure via a small header */
-    if (fwrite((void *)&header, sizeof(char), sizeof(header), file) !=
+    if (fwrite((void *)&header, sizeof(char), sizeof(header), out) !=
             sizeof(header)) {
         goto save_error;
     }
@@ -374,99 +381,122 @@ void HDSPMixerWindow::save()
         for (int preset = 0; preset < 8; ++preset) {
         for (int channel = 0; channel < HDSP_MAX_CHANNELS; ++channel) {
             /* inputs pans and volumes */
-            if (fwrite((void *)&(inputs->strips[channel]->data[card][speed][preset]->pan_pos[0]), sizeof(int), pan_array_size, file) != pan_array_size) {
+            if (fwrite((void *)&(inputs->strips[channel]->data[card][speed][preset]->pan_pos[0]), sizeof(int), pan_array_size, out) != pan_array_size) {
             goto save_error;
             }
-            if (fwrite((void *)&(inputs->strips[channel]->data[card][speed][preset]->fader_pos[0]), sizeof(int), pan_array_size, file) != pan_array_size) {
+            if (fwrite((void *)&(inputs->strips[channel]->data[card][speed][preset]->fader_pos[0]), sizeof(int), pan_array_size, out) != pan_array_size) {
             goto save_error;
             }
             /* playbacks pans and volumes */
-            if (fwrite((void *)&(playbacks->strips[channel]->data[card][speed][preset]->pan_pos[0]), sizeof(int), pan_array_size, file) != pan_array_size) {
+            if (fwrite((void *)&(playbacks->strips[channel]->data[card][speed][preset]->pan_pos[0]), sizeof(int), pan_array_size, out) != pan_array_size) {
             goto save_error;
             }
-            if (fwrite((void *)&(playbacks->strips[channel]->data[card][speed][preset]->fader_pos[0]), sizeof(int), pan_array_size, file) != pan_array_size) {
+            if (fwrite((void *)&(playbacks->strips[channel]->data[card][speed][preset]->fader_pos[0]), sizeof(int), pan_array_size, out) != pan_array_size) {
             goto save_error;
             }
             /* inputs mute/solo/dest */
-            if (fwrite((void *)&(inputs->strips[channel]->data[card][speed][preset]->mute), sizeof(int), 1, file) != 1) {
+            if (fwrite((void *)&(inputs->strips[channel]->data[card][speed][preset]->mute), sizeof(int), 1, out) != 1) {
             goto save_error;
             }
-            if (fwrite((void *)&(inputs->strips[channel]->data[card][speed][preset]->solo), sizeof(int), 1, file) != 1) {
+            if (fwrite((void *)&(inputs->strips[channel]->data[card][speed][preset]->solo), sizeof(int), 1, out) != 1) {
             goto save_error;
             }
-            if (fwrite((void *)&(inputs->strips[channel]->data[card][speed][preset]->dest), sizeof(int), 1, file) != 1) {
+            if (fwrite((void *)&(inputs->strips[channel]->data[card][speed][preset]->dest), sizeof(int), 1, out) != 1) {
             goto save_error;
             }
             /* playbacks mute/solo/dest */
-            if (fwrite((void *)&(playbacks->strips[channel]->data[card][speed][preset]->mute), sizeof(int), 1, file) != 1) {
+            if (fwrite((void *)&(playbacks->strips[channel]->data[card][speed][preset]->mute), sizeof(int), 1, out) != 1) {
             goto save_error;
             }
-            if (fwrite((void *)&(playbacks->strips[channel]->data[card][speed][preset]->solo), sizeof(int), 1, file) != 1) {
+            if (fwrite((void *)&(playbacks->strips[channel]->data[card][speed][preset]->solo), sizeof(int), 1, out) != 1) {
             goto save_error;
             }
-            if (fwrite((void *)&(playbacks->strips[channel]->data[card][speed][preset]->dest), sizeof(int), 1, file) != 1) {
+            if (fwrite((void *)&(playbacks->strips[channel]->data[card][speed][preset]->dest), sizeof(int), 1, out) != 1) {
             goto save_error;
             }
             /* outputs volumes */
-            if (fwrite((void *)&(outputs->strips[channel]->data[card][speed][preset]->fader_pos), sizeof(int), 1, file) != 1) {
+            if (fwrite((void *)&(outputs->strips[channel]->data[card][speed][preset]->fader_pos), sizeof(int), 1, out) != 1) {
             goto save_error;
             }
            
          }
         /* Lineouts */           
-        if (fwrite((void *)&(outputs->strips[HDSP_MAX_CHANNELS]->data[card][speed][preset]->fader_pos), sizeof(int), 1, file) != 1) {
+        if (fwrite((void *)&(outputs->strips[HDSP_MAX_CHANNELS]->data[card][speed][preset]->fader_pos), sizeof(int), 1, out) != 1) {
             goto save_error;
         }
-        if (fwrite((void *)&(outputs->strips[HDSP_MAX_CHANNELS+1]->data[card][speed][preset]->fader_pos), sizeof(int), 1, file) != 1) {
+        if (fwrite((void *)&(outputs->strips[HDSP_MAX_CHANNELS+1]->data[card][speed][preset]->fader_pos), sizeof(int), 1, out) != 1) {
             goto save_error;
         }
         /* Global settings */
-        if (fwrite((void *)&(data[card][speed][preset]->input), sizeof(int), 1, file) != 1) {
+        if (fwrite((void *)&(data[card][speed][preset]->input), sizeof(int), 1, out) != 1) {
             goto save_error;
         }
-        if (fwrite((void *)&(data[card][speed][preset]->output), sizeof(int), 1, file) != 1) {
+        if (fwrite((void *)&(data[card][speed][preset]->output), sizeof(int), 1, out) != 1) {
             goto save_error;
         }
-        if (fwrite((void *)&(data[card][speed][preset]->playback), sizeof(int), 1, file) != 1) {
+        if (fwrite((void *)&(data[card][speed][preset]->playback), sizeof(int), 1, out) != 1) {
             goto save_error;
         }
-        if (fwrite((void *)&(data[card][speed][preset]->submix), sizeof(int), 1, file) != 1) {
+        if (fwrite((void *)&(data[card][speed][preset]->submix), sizeof(int), 1, out) != 1) {
             goto save_error;
         }
-        if (fwrite((void *)&(data[card][speed][preset]->submix_value), sizeof(int), 1, file) != 1) {
+        if (fwrite((void *)&(data[card][speed][preset]->submix_value), sizeof(int), 1, out) != 1) {
             goto save_error;
         }
-        if (fwrite((void *)&(data[card][speed][preset]->solo), sizeof(int), 1, file) != 1) {
+        if (fwrite((void *)&(data[card][speed][preset]->solo), sizeof(int), 1, out) != 1) {
             goto save_error;
         }
-        if (fwrite((void *)&(data[card][speed][preset]->mute), sizeof(int), 1, file) != 1) {
+        if (fwrite((void *)&(data[card][speed][preset]->mute), sizeof(int), 1, out) != 1) {
             goto save_error;
         }       
-        if (fwrite((void *)&(data[card][speed][preset]->last_destination), sizeof(int), 1, file) != 1) {
+        if (fwrite((void *)&(data[card][speed][preset]->last_destination), sizeof(int), 1, out) != 1) {
             goto save_error;
         }
-        if (fwrite((void *)&(data[card][speed][preset]->rmsplus3), sizeof(int), 1, file) != 1) {
+        if (fwrite((void *)&(data[card][speed][preset]->rmsplus3), sizeof(int), 1, out) != 1) {
             goto save_error;
         }
-        if (fwrite((void *)&(data[card][speed][preset]->numbers), sizeof(int), 1, file) != 1) {
+        if (fwrite((void *)&(data[card][speed][preset]->numbers), sizeof(int), 1, out) != 1) {
             goto save_error;
         }
-        if (fwrite((void *)&(data[card][speed][preset]->over), sizeof(int), 1, file) != 1) {
+        if (fwrite((void *)&(data[card][speed][preset]->over), sizeof(int), 1, out) != 1) {
             goto save_error;
         }
-        if (fwrite((void *)&(data[card][speed][preset]->level), sizeof(int), 1, file) != 1) {
+        if (fwrite((void *)&(data[card][speed][preset]->level), sizeof(int), 1, out) != 1) {
             goto save_error;
         }
-        if (fwrite((void *)&(data[card][speed][preset]->rate), sizeof(int), 1, file) != 1) {
+        if (fwrite((void *)&(data[card][speed][preset]->rate), sizeof(int), 1, out) != 1) {
             goto save_error;
         }
         }
     }
     }
-    fclose(file);
+
+    /* If the file we want to write already exists it could be possible that it
+    * was saved with a newer version. If that is the case we just append its
+    * content to the new output file and that way ensure that we don't lose any
+    * data the new version wrote.
+    */
+    if ((in = fopen(file_name, "r")) != NULL) {
+        if (!fseek(in, ftell(out), SEEK_SET)) {
+            char buff[512];
+            size_t read;
+            while ((read = fread(&buff, sizeof(char), sizeof(buff), in)) != 0)
+                fwrite(buff, sizeof(char), read, out);
+            if (ferror(in) || ferror(out))
+                fl_alert("Error appending %s to %s", file_name, tmpc);
+        }
+        fclose(in);
+    }
+
+    fclose(out);
+
+    if (rename(tmpc, file_name))
+        fl_alert("Error renaming %s to %s", tmpc, file_name);
+    ::remove(tmpc);
+
     return;
 save_error:
-    fclose(file);
+    fclose(out);
     fl_alert("Error saving presets to file %s", file_name);
     return;
 }
-- 
2.27.0
From 2dbf462a9126da817db40f4d62207b47e245f3e7 Mon Sep 17 00:00:00 2001
From: Jasmin Fazlic <superfassl@gmail.com>
Date: Thu, 4 Feb 2021 17:00:22 +0100
Subject: [PATCH 2/2] alsa-tools/hdspmixer: add output loopback buttons

This patch adds "LPBK" buttons to the output strip
channels allowing to toggle the hardware output
loopback state.

Efforts were made to hide the buttons for not yet
enabled devices but due to difficulties in implementation
was cancelled for the time being. Should it be a no-go
efforts should be made to fix this and hide them,
although I would think fixing the driver for other
devices would be an effort with much more merit.

This is currently only enabled for HDSP9632 devices
with following driver patch:
https://github.com/tiwai/sound/commit/da2a040ee7cfe1dd57d5bec7906cb979c5787a86

Signed-off-by: Jasmin Fazlic <superfassl@gmail.com>
---
 hdspmixer/pixmaps/loopback.xpm        |  69 ++++
 hdspmixer/pixmaps/output.xpm          | 498 +++++++++++++++-----------
 hdspmixer/pixmaps/output_r.xpm        | 498 +++++++++++++++-----------
 hdspmixer/src/HDSPMixerCard.cxx       |  34 ++
 hdspmixer/src/HDSPMixerCard.h         |   2 +
 hdspmixer/src/HDSPMixerLoopback.cxx   | 133 +++++++
 hdspmixer/src/HDSPMixerLoopback.h     |  48 +++
 hdspmixer/src/HDSPMixerOutput.cxx     |   1 +
 hdspmixer/src/HDSPMixerOutput.h       |   3 +
 hdspmixer/src/HDSPMixerOutputData.h   |   1 +
 hdspmixer/src/HDSPMixerOutputs.cxx    |   4 +-
 hdspmixer/src/HDSPMixerPresetData.cxx |   1 +
 hdspmixer/src/HDSPMixerPresetData.h   |   1 +
 hdspmixer/src/HDSPMixerPresets.cxx    |   2 +
 hdspmixer/src/HDSPMixerWindow.cxx     |  68 ++++
 hdspmixer/src/Makefile.am             |   2 +
 hdspmixer/src/defines.h               |   2 +-
 hdspmixer/src/pixmaps.cxx             |   1 +
 hdspmixer/src/pixmaps.h               |   1 +
 19 files changed, 931 insertions(+), 438 deletions(-)
 create mode 100644 hdspmixer/pixmaps/loopback.xpm
 create mode 100644 hdspmixer/src/HDSPMixerLoopback.cxx
 create mode 100644 hdspmixer/src/HDSPMixerLoopback.h

diff --git a/hdspmixer/pixmaps/loopback.xpm b/hdspmixer/pixmaps/loopback.xpm
new file mode 100644
index 0000000..a327467
--- /dev/null
+++ b/hdspmixer/pixmaps/loopback.xpm
@@ -0,0 +1,69 @@
+/* XPM */
+char const * loopback_xpm[] = {
+"34 15 51 1",
+"     c None",
+".    c #2E3038",
+"+    c #FFFB7C",
+"@    c #FDF97B",
+"#    c #2E2D11",
+"$    c #000000",
+"%    c #383716",
+"&    c #898740",
+"*    c #F1EE75",
+"=    c #22210A",
+"-    c #727034",
+";    c #E2DE6D",
+">    c #D5D267",
+",    c #787637",
+"'    c #FBF77A",
+")    c #AAA750",
+"!    c #ABA851",
+"~    c #CDC962",
+"{    c #83813C",
+"]    c #C8C560",
+"^    c #84823D",
+"/    c #F7F378",
+"(    c #949145",
+"_    c #B7B457",
+":    c #949245",
+"<    c #353414",
+"[    c #87853F",
+"}    c #F1ED75",
+"|    c #3B3A17",
+"1    c #DFDB6C",
+"2    c #161505",
+"3    c #4B4A20",
+"4    c #E5E16E",
+"5    c #FEFA7C",
+"6    c #E8E470",
+"7    c #535124",
+"8    c #FAF679",
+"9    c #E7E370",
+"0    c #66642E",
+"a    c #E4E06E",
+"b    c #F6F277",
+"c    c #EAE671",
+"d    c #E0DC6C",
+"e    c #B9B658",
+"f    c #5F5D2A",
+"g    c #EDE973",
+"h    c #69672F",
+"i    c #DDD96A",
+"j    c #333342",
+"k    c #32323E",
+"l    c #313136",
+"..................................",
+".++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++.",
+".+++@#++++@$$%&*@$$=-;+@#++>,*+++.",
+".+++@#++++@#+')!@#+@~{+@#+]^/++++.",
+".+++@#++++@#+'!!@#+@~(+@#_:'+++++.",
+".+++@#++++@$$<[}@$$$|1+@234++++++.",
+".+++@#++++@#++++@#+5678@#90a+++++.",
+".+++@#++++@#++++@#+59#b@#+c0d++++.",
+".+++@$$$$e@#++++@$$2f]+@#++ghi+++.",
+".++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++.",
+"..jklllllllllkj....jklllllllllkj.."};
diff --git a/hdspmixer/pixmaps/output.xpm b/hdspmixer/pixmaps/output.xpm
index 8f7cd65..c827b1c 100644
--- a/hdspmixer/pixmaps/output.xpm
+++ b/hdspmixer/pixmaps/output.xpm
@@ -1,220 +1,282 @@
 /* XPM */
 char const * output_xpm[] = {
-"36 208 9 1",
-"     c #595966",
-".    c #2E3038",
-"+    c #000000",
-"@    c #474951",
-"#    c #404044",
-"$    c #7A7A8F",
-"%    c #27272B",
-"&    c #616176",
-"*    c #737384",
-"                                    ",
-" .................................. ",
-" .................................. ",
-" .................................. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" .................................. ",
-" .................................. ",
-" .................................. ",
-" .................................. ",
-" .................................. ",
-" .................................. ",
-" .................................. ",
-" .................................. ",
-" ..................++++++++++...... ",
-" .@@@@@@@#$@@@.....++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" .@@@@@@@#$@@@.....++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" .@@@@@@@#$@@@.....++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" .@@@@@@@#$@@@.....++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" .@@@@@@@#$@@@.....++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" .@@@@@@@#$@@@.....++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" .@@@@@@@#$@@@.....++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" .@@@@@@@#$@@@.....++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" .@@@@@@@#$@@@.....++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ..................++++++++++...... ",
-" .................................. ",
-" .................................. ",
-" .................................. ",
-" .................................. ",
-" .................................. ",
-" .................................. ",
-" .................................. ",
-" .................................. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" .................................. ",
-" .................................. ",
-" .................................. ",
-" .................................. ",
-" ..******************************.. ",
-" ..******************************.. ",
-" ..******************************.. ",
-" ..******************************.. ",
-" ..******************************.. ",
-" ..******************************.. ",
-" ..******************************.. ",
-" ..******************************.. ",
-" ..******************************.. ",
-" ..******************************.. ",
-" ..******************************.. ",
-" ..******************************.. ",
-" .................................. ",
-" .................................. ",
-" .................................. ",
-"                                    "};
+"36 224 55 1",
+"     c None",
+".    c #595966",
+"+    c #2E3038",
+"@    c #000000",
+"#    c #474951",
+"$    c #404044",
+"%    c #7A7A8F",
+"&    c #27272B",
+"*    c #616176",
+"=    c #737384",
+"-    c #757585",
+";    c #D4D4D4",
+">    c #D6D6D6",
+",    c #D3D3D4",
+"'    c #C3C3C6",
+")    c #848491",
+"!    c #D5D5D5",
+"~    c #CACACB",
+"{    c #93939C",
+"]    c #9D9DA5",
+"^    c #C8C8CA",
+"/    c #787888",
+"(    c #B6B6BA",
+"_    c #A3A3AA",
+":    c #C5C5C7",
+"<    c #A7A7AE",
+"[    c #C4C4C6",
+"}    c #7D7D8C",
+"|    c #797989",
+"1    c #C0C0C2",
+"2    c #AFAFB4",
+"3    c #BFBFC2",
+"4    c #D3D3D3",
+"5    c #95959F",
+"6    c #D5D5D6",
+"7    c #D1D1D2",
+"8    c #91919B",
+"9    c #757586",
+"0    c #8E8E99",
+"a    c #D1D1D1",
+"b    c #8F8F99",
+"c    c #CBCBCD",
+"d    c #92929C",
+"e    c #7F7F8D",
+"f    c #8C8C97",
+"g    c #96969F",
+"h    c #AFAFB5",
+"i    c #CECECF",
+"j    c #A6A6AD",
+"k    c #8A8A96",
+"l    c #CCCCCD",
+"m    c #9898A1",
+"n    c #333342",
+"o    c #32323E",
+"p    c #313136",
+"....................................",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++@@@@@@@@@@++++++.",
+".+#######$%###+++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".+#######$%###+++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".+#######$%###+++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".+#######$%###+++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".+#######$%###+++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".+#######$%###+++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".+#######$%###+++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".+#######$%###+++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".+#######$%###+++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++++++++++++@@@@@@@@@@++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++==============================++.",
+".++==============================++.",
+".++==============================++.",
+".++==============================++.",
+".++==============================++.",
+".++==============================++.",
+".++==============================++.",
+".++==============================++.",
+".++==============================++.",
+".++==============================++.",
+".++==============================++.",
+".++==============================++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+"....................................",
+".++++++++++++++++++++++++++++++++++.",
+".+================================+.",
+".+================================+.",
+".+================================+.",
+".+===-;====->>,')->>!~{=-;==]^)===+.",
+".+===-;====-;=/((-;=-_:=-;=<[}====+.",
+".+===-;====-;=|((-;=-_1=-;23/=====+.",
+".+===-;====->>,[)->>>45=-678======+.",
+".+===-;====-;====-;=90a|-;bcd=====+.",
+".+===-;====-;====-;=9b;e-;=fcg====+.",
+".+===->>>>h-;====->>6ij=-;==klm===+.",
+".+================================+.",
+".+================================+.",
+".+================================+.",
+".++nopppppppppon++++nopppppppppon++.",
+"...................................."};
diff --git a/hdspmixer/pixmaps/output_r.xpm b/hdspmixer/pixmaps/output_r.xpm
index ab2ca99..51b1984 100644
--- a/hdspmixer/pixmaps/output_r.xpm
+++ b/hdspmixer/pixmaps/output_r.xpm
@@ -1,220 +1,282 @@
 /* XPM */
 char const * output_r_xpm[] = {
-"36 208 9 1",
-"     c #595966",
-".    c #2E3038",
-"+    c #000000",
-"@    c #474951",
-"#    c #404044",
-"$    c #7A7A8F",
-"%    c #27272B",
-"&    c #616176",
-"*    c #737384",
-"                                    ",
-" .................................. ",
-" .................................. ",
-" .................................. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" .................................. ",
-" .................................. ",
-" .................................. ",
-" .................................. ",
-" .................................. ",
-" .................................. ",
-" .................................. ",
-" .................................. ",
-" ..................++++++++++...... ",
-" .@@@@@@@#$@@@.....++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" .@@@@@@@#$@@@.....++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" .@@@@@@@#$@@@.....++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" .@@@@@@@#$@@@.....++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" .@@@@@@@#$@@@.....++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" .@@@@@@@#$@@@.....++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" .@@@@@@@#$@@@.....++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" .@@@@@@@#$@@@.....++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" .@@@@@@@#$@@@.....++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ........%&........++++++++++...... ",
-" ..................++++++++++...... ",
-" .................................. ",
-" .................................. ",
-" .................................. ",
-" .................................. ",
-" .................................. ",
-" .................................. ",
-" .................................. ",
-" .................................. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" ..++++++++++++++++++++++++++++++.. ",
-" .................................. ",
-" .................................. ",
-" .................................. ",
-" .................................. ",
-" ..******************************.. ",
-" ..******************************.. ",
-" ..******************************.. ",
-" ..******************************.. ",
-" ..******************************.. ",
-" ..******************************.. ",
-" ..******************************.. ",
-" ..******************************.. ",
-" ..******************************.. ",
-" ..******************************.. ",
-" ..******************************.. ",
-" ..******************************.. ",
-" .................................. ",
-" .................................. ",
-" .................................. ",
-"                                    "};
+"36 224 55 1",
+"     c None",
+".    c #595966",
+"+    c #2E3038",
+"@    c #000000",
+"#    c #474951",
+"$    c #404044",
+"%    c #7A7A8F",
+"&    c #27272B",
+"*    c #616176",
+"=    c #737384",
+"-    c #757585",
+";    c #D4D4D4",
+">    c #D6D6D6",
+",    c #D3D3D4",
+"'    c #C3C3C6",
+")    c #848491",
+"!    c #D5D5D5",
+"~    c #CACACB",
+"{    c #93939C",
+"]    c #9D9DA5",
+"^    c #C8C8CA",
+"/    c #787888",
+"(    c #B6B6BA",
+"_    c #A3A3AA",
+":    c #C5C5C7",
+"<    c #A7A7AE",
+"[    c #C4C4C6",
+"}    c #7D7D8C",
+"|    c #797989",
+"1    c #C0C0C2",
+"2    c #AFAFB4",
+"3    c #BFBFC2",
+"4    c #D3D3D3",
+"5    c #95959F",
+"6    c #D5D5D6",
+"7    c #D1D1D2",
+"8    c #91919B",
+"9    c #757586",
+"0    c #8E8E99",
+"a    c #D1D1D1",
+"b    c #8F8F99",
+"c    c #CBCBCD",
+"d    c #92929C",
+"e    c #7F7F8D",
+"f    c #8C8C97",
+"g    c #96969F",
+"h    c #AFAFB5",
+"i    c #CECECF",
+"j    c #A6A6AD",
+"k    c #8A8A96",
+"l    c #CCCCCD",
+"m    c #9898A1",
+"n    c #333342",
+"o    c #32323E",
+"p    c #313136",
+"....................................",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++@@@@@@@@@@++++++.",
+".+#######$%###+++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".+#######$%###+++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".+#######$%###+++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".+#######$%###+++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".+#######$%###+++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".+#######$%###+++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".+#######$%###+++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".+#######$%###+++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".+#######$%###+++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++&*++++++++@@@@@@@@@@++++++.",
+".++++++++++++++++++@@@@@@@@@@++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++==============================++.",
+".++==============================++.",
+".++==============================++.",
+".++==============================++.",
+".++==============================++.",
+".++==============================++.",
+".++==============================++.",
+".++==============================++.",
+".++==============================++.",
+".++==============================++.",
+".++==============================++.",
+".++==============================++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+".++++++++++++++++++++++++++++++++++.",
+"....................................",
+".++++++++++++++++++++++++++++++++++.",
+".+================================+.",
+".+================================+.",
+".+================================+.",
+".+===-;====->>,')->>!~{=-;==]^)===+.",
+".+===-;====-;=/((-;=-_:=-;=<[}====+.",
+".+===-;====-;=|((-;=-_1=-;23/=====+.",
+".+===-;====->>,[)->>>45=-678======+.",
+".+===-;====-;====-;=90a|-;bcd=====+.",
+".+===-;====-;====-;=9b;e-;=fcg====+.",
+".+===->>>>h-;====->>6ij=-;==klm===+.",
+".+================================+.",
+".+================================+.",
+".+================================+.",
+".++nopppppppppon++++nopppppppppon++.",
+"...................................."};
diff --git a/hdspmixer/src/HDSPMixerCard.cxx b/hdspmixer/src/HDSPMixerCard.cxx
index ce40ba7..72232c8 100644
--- a/hdspmixer/src/HDSPMixerCard.cxx
+++ b/hdspmixer/src/HDSPMixerCard.cxx
@@ -231,6 +231,8 @@ void HDSPMixerCard::adjustSettings() {
             /* should never happen */
             break;
         }
+
+        max_channels = sizeof(channel_map_mf_ss);
     }
    
     if (type == Digiface) {
@@ -253,6 +255,8 @@ void HDSPMixerCard::adjustSettings() {
             /* should never happen */
             break;
         }
+
+        max_channels = sizeof(channel_map_df_ss);
     }
 
     if (type == RPM) {
@@ -263,6 +267,8 @@ void HDSPMixerCard::adjustSettings() {
         channel_map_input = channel_map_playback = channel_map_rpm;
         dest_map = dest_map_rpm;
         meter_map_input = meter_map_playback = channel_map_rpm;
+
+        max_channels = sizeof(channel_map_rpm);
     }
 
 
@@ -286,6 +292,8 @@ void HDSPMixerCard::adjustSettings() {
             /* should never happen */
             break;
         }
+
+        max_channels = sizeof(channel_map_df_ss);
     }
 
     if (type == H9632) {
@@ -312,6 +320,8 @@ void HDSPMixerCard::adjustSettings() {
             meter_map_input = meter_map_playback = channel_map_h9632_qs;
             break;
         }
+
+        max_channels = sizeof(channel_map_h9632_ss);
     }
 
     if (HDSPeMADI == type) {
@@ -341,6 +351,7 @@ void HDSPMixerCard::adjustSettings() {
             break;
         }
 
+        max_channels = sizeof(channel_map_unity_ss);
     }
 
     if (HDSPeAIO == type) {
@@ -379,6 +390,7 @@ void HDSPMixerCard::adjustSettings() {
             break;
         }
 
+        max_channels = sizeof(channel_map_aio_out_ss);
     }
 
     if (HDSP_AES == type) {
@@ -394,6 +406,7 @@ void HDSPMixerCard::adjustSettings() {
         meter_map_input = channel_map_aes32;
         meter_map_playback = channel_map_aes32;
 
+        max_channels = sizeof(channel_map_aes32);
     }
 
     if (HDSPeRayDAT == type) {
@@ -426,6 +439,7 @@ void HDSPMixerCard::adjustSettings() {
             break;
         }
 
+        max_channels = sizeof(channel_map_raydat_ss);
     }
 
     window_width = (channels_playback+2)*STRIP_WIDTH;
@@ -545,3 +559,23 @@ int HDSPMixerCard::initializeCard(HDSPMixerWindow *w)
     return 0;
 }
 
+int HDSPMixerCard::supportsLoopback() const
+{
+    int err = 0;
+    snd_ctl_elem_value_t *elemval;
+    snd_ctl_elem_id_t * elemid;
+    snd_ctl_t *handle;
+    snd_ctl_elem_value_alloca(&elemval);
+    snd_ctl_elem_id_alloca(&elemid);
+    if ((err = snd_ctl_open(&handle, name, SND_CTL_NONBLOCK)) < 0)
+    return err;
+
+    snd_ctl_elem_id_set_name(elemid, "Output Loopback");
+    snd_ctl_elem_id_set_interface(elemid, SND_CTL_ELEM_IFACE_HWDEP);
+    snd_ctl_elem_id_set_index(elemid, 0);
+    snd_ctl_elem_value_set_id(elemval, elemid);
+    err = snd_ctl_elem_read(handle, elemval);
+    snd_ctl_close(handle);
+
+    return err;
+}
diff --git a/hdspmixer/src/HDSPMixerCard.h b/hdspmixer/src/HDSPMixerCard.h
index faaeefa..eecfca3 100644
--- a/hdspmixer/src/HDSPMixerCard.h
+++ b/hdspmixer/src/HDSPMixerCard.h
@@ -52,6 +52,7 @@ public:
     HDSPMixerCard(int cardtype, int id, char *shortname);
     int channels_input, channels_playback, window_width, window_height, card_id;
     int channels_output;
+    int max_channels;
     int type;
     int last_preset; /* Last activated preset before switching to another card */
     int last_dirty; /* Last dirty flag before switching to another card */
@@ -68,6 +69,7 @@ public:
     void adjustSettings();
     void getAeb();
     hdsp_9632_aeb_t h9632_aeb;
+    int supportsLoopback() const;
 };
 
 #endif
diff --git a/hdspmixer/src/HDSPMixerLoopback.cxx b/hdspmixer/src/HDSPMixerLoopback.cxx
new file mode 100644
index 0000000..fcfec2a
--- /dev/null
+++ b/hdspmixer/src/HDSPMixerLoopback.cxx
@@ -0,0 +1,133 @@
+/*
+ *   HDSPMixer
+ *   
+ *   Copyright (C) 2003 Thomas Charbonnel (thomas@undata.org)
+ *   
+ *   This program is free software; you can redistribute it and/or modify
+ *   it under the terms of the GNU General Public License as published by
+ *   the Free Software Foundation; either version 2 of the License, or
+ *   (at your option) any later version.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *   GNU General Public License for more details.
+ *
+ *   You should have received a copy of the GNU General Public License
+ *   along with this program; if not, write to the Free Software
+ *   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+
+#pragma implementation
+#include "HDSPMixerLoopback.h"
+
+HDSPMixerLoopback::HDSPMixerLoopback(int x, int y, int idx):Fl_Widget(x, y, 34, 15)
+{
+    basew = (HDSPMixerWindow *)window();
+    index = idx;
+}
+
+void HDSPMixerLoopback::draw()
+{
+    if (_loopback == 1)
+    fl_draw_pixmap(loopback_xpm, x(), y());
+}
+
+int HDSPMixerLoopback::get()
+{
+    auto const card { basew->cards[basew->current_card] };
+
+    if (card->supportsLoopback() != 0)
+    return -1;
+
+    if (index >= card->max_channels)
+    return -1;
+
+    int err;
+    snd_ctl_elem_value_t *elemval;
+    snd_ctl_elem_id_t * elemid;
+    snd_ctl_t *handle;
+    snd_ctl_elem_value_alloca(&elemval);
+    snd_ctl_elem_id_alloca(&elemid);
+    char const * const name = basew->cards[basew->current_card]->name;
+    if ((err = snd_ctl_open(&handle, name, SND_CTL_NONBLOCK)) < 0) {
+    fprintf(stderr, "Error accessing ctl interface on card %s\n.", name);
+    return -1;
+    }
+   
+    snd_ctl_elem_id_set_name(elemid, "Output Loopback");
+    snd_ctl_elem_id_set_interface(elemid, SND_CTL_ELEM_IFACE_HWDEP);
+    snd_ctl_elem_id_set_index(elemid, index);
+    snd_ctl_elem_value_set_id(elemval, elemid);
+    if ((err = snd_ctl_elem_read(handle, elemval)) < 0)
+    fprintf(stderr, "cannot read loopback: %d\n", err);
+    else
+    _loopback = snd_ctl_elem_value_get_integer(elemval, 0);
+
+    snd_ctl_close(handle);
+
+    return _loopback;
+}
+
+void HDSPMixerLoopback::set(int l)
+{
+    auto const card { basew->cards[basew->current_card] };
+
+    if (card->supportsLoopback() != 0)
+    return;
+
+    if (index >= card->max_channels)
+    return;
+
+    if (l != _loopback) {
+    int err;
+   
+    snd_ctl_elem_id_t *id;
+    snd_ctl_elem_value_t *ctl;
+    snd_ctl_t *handle;
+
+    snd_ctl_elem_value_alloca(&ctl);
+    snd_ctl_elem_id_alloca(&id);
+    snd_ctl_elem_id_set_name(id, "Output Loopback");
+    snd_ctl_elem_id_set_interface(id, SND_CTL_ELEM_IFACE_HWDEP);
+    snd_ctl_elem_id_set_device(id, 0);
+    snd_ctl_elem_id_set_index(id, index);
+    snd_ctl_elem_value_set_id(ctl, id);
+
+    if ((err = snd_ctl_open(
+            &handle, basew->cards[basew->current_card]->name, SND_CTL_NONBLOCK)) < 0) {
+        fprintf(stderr, "Alsa error 1: %s\n", snd_strerror(err));
+        return;
+    }
+
+    snd_ctl_elem_value_set_integer(ctl, 0, l);
+    if ((err = snd_ctl_elem_write(handle, ctl)) < 0) {
+        fprintf(stderr, "Alsa error 2: %s\n", snd_strerror(err));
+        snd_ctl_close(handle);
+        return;
+    }
+
+    _loopback = l;
+   
+    snd_ctl_close(handle);
+
+    redraw();
+    }
+}
+
+int HDSPMixerLoopback::handle(int e)
+{
+    int button3 = Fl::event_button3();
+    switch (e) {
+    case FL_PUSH:
+        set(!_loopback);
+        if (button3)
+        relative->set(_loopback);
+        basew->checkState();
+        redraw();
+        return 1;
+    default:
+        return Fl_Widget::handle(e);
+    }     
+}
+
diff --git a/hdspmixer/src/HDSPMixerLoopback.h b/hdspmixer/src/HDSPMixerLoopback.h
new file mode 100644
index 0000000..07f1f0c
--- /dev/null
+++ b/hdspmixer/src/HDSPMixerLoopback.h
@@ -0,0 +1,48 @@
+/*
+ *   HDSPMixer
+ *   
+ *   Copyright (C) 2003 Thomas Charbonnel (thomas@undata.org)
+ *   
+ *   This program is free software; you can redistribute it and/or modify
+ *   it under the terms of the GNU General Public License as published by
+ *   the Free Software Foundation; either version 2 of the License, or
+ *   (at your option) any later version.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *   GNU General Public License for more details.
+ *
+ *   You should have received a copy of the GNU General Public License
+ *   along with this program; if not, write to the Free Software
+ *   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+
+#pragma interface
+#ifndef HDSPMixerLoopback_H
+#define HDSPMixerLoopback_H
+
+#include <FL/Fl.H>
+#include <FL/Fl_Widget.H>
+#include "HDSPMixerWindow.h"
+#include "pixmaps.h"
+
+class HDSPMixerWindow;
+
+class HDSPMixerLoopback:public Fl_Widget
+{
+private:
+    HDSPMixerWindow *basew;
+    int _loopback{-1};
+public:
+    HDSPMixerLoopback *relative;
+    int index;
+    HDSPMixerLoopback(int x, int y, int idx);
+    void draw();
+    int handle(int e);
+    int get();
+    void set(int l);
+};
+
+#endif
+
diff --git a/hdspmixer/src/HDSPMixerOutput.cxx b/hdspmixer/src/HDSPMixerOutput.cxx
index 0053fe0..7f80a74 100644
--- a/hdspmixer/src/HDSPMixerOutput.cxx
+++ b/hdspmixer/src/HDSPMixerOutput.cxx
@@ -204,6 +204,7 @@ HDSPMixerOutput::HDSPMixerOutput(int x, int y, int w, int h, int num):Fl_Group(x
     peak = new HDSPMixerPeak(x+3, y+4, 0);
     gain = new HDSPMixerGain(x+3, y+175, 0);
     meter = new HDSPMixerMeter(x+20, y+27, false, peak);
+    loopback = new HDSPMixerLoopback(x+1, y+208, out_num);
     end();
 }
 
diff --git a/hdspmixer/src/HDSPMixerOutput.h b/hdspmixer/src/HDSPMixerOutput.h
index 6278cfd..1e04ae5 100644
--- a/hdspmixer/src/HDSPMixerOutput.h
+++ b/hdspmixer/src/HDSPMixerOutput.h
@@ -27,6 +27,7 @@
 #include <FL/fl_draw.H>
 #include <alsa/sound/hdsp.h>
 #include "HDSPMixerFader.h"
+#include "HDSPMixerLoopback.h"
 #include "HDSPMixerPeak.h"
 #include "HDSPMixerGain.h"
 #include "HDSPMixerMeter.h"
@@ -36,6 +37,7 @@
 
 class HDSPMixerFader;
 class HDSPMixerGain;
+class HDSPMixerLoopback;
 class HDSPMixerPeak;
 class HDSPMixerMeter;
 class HDSPMixerOutputData;
@@ -56,6 +58,7 @@ public:
     HDSPMixerFader *fader;
     HDSPMixerGain *gain;
     HDSPMixerMeter *meter;
+    HDSPMixerLoopback *loopback;
     HDSPMixerOutput(int x, int y, int w, int h, int out);
     void draw();
     void draw_background();
diff --git a/hdspmixer/src/HDSPMixerOutputData.h b/hdspmixer/src/HDSPMixerOutputData.h
index 885047b..75b9109 100644
--- a/hdspmixer/src/HDSPMixerOutputData.h
+++ b/hdspmixer/src/HDSPMixerOutputData.h
@@ -26,6 +26,7 @@ class HDSPMixerOutputData
 {
 public:
     int fader_pos;
+    int loopback;
     HDSPMixerOutputData();
 };
 
diff --git a/hdspmixer/src/HDSPMixerOutputs.cxx b/hdspmixer/src/HDSPMixerOutputs.cxx
index 0b4e7f4..342685d 100644
--- a/hdspmixer/src/HDSPMixerOutputs.cxx
+++ b/hdspmixer/src/HDSPMixerOutputs.cxx
@@ -25,13 +25,15 @@ HDSPMixerOutputs::HDSPMixerOutputs(int x, int y, int w, int h, int nchans):Fl_Gr
 {
     int i;
     for (i = 0; i < HDSP_MAX_CHANNELS+2; i += 2) {
-    strips[i] = new HDSPMixerOutput((i*STRIP_WIDTH), y, STRIP_WIDTH, SMALLSTRIP_HEIGHT, i);
+    strips[i] = new HDSPMixerOutput((i*STRIP_WIDTH), y, STRIP_WIDTH, SMALLSTRIP_HEIGHT, i);
     strips[i+1] = new HDSPMixerOutput(((i+1)*STRIP_WIDTH), y, STRIP_WIDTH, SMALLSTRIP_HEIGHT, i+1);
     /* Setup linked stereo channels */
     strips[i]->fader->relative = strips[i+1]->fader;
     strips[i+1]->fader->relative = strips[i]->fader;
     strips[i]->fader->gain = strips[i]->gain;
     strips[i+1]->fader->gain = strips[i+1]->gain;
+    strips[i]->loopback->relative = strips[i+1]->loopback;
+    strips[i+1]->loopback->relative = strips[i]->loopback;
    
     }
     empty_aebo[0] = new HDSPMixerEmpty((nchans-6)*STRIP_WIDTH, y, 2*STRIP_WIDTH, SMALLSTRIP_HEIGHT, 0);
diff --git a/hdspmixer/src/HDSPMixerPresetData.cxx b/hdspmixer/src/HDSPMixerPresetData.cxx
index 276d101..6359732 100644
--- a/hdspmixer/src/HDSPMixerPresetData.cxx
+++ b/hdspmixer/src/HDSPMixerPresetData.cxx
@@ -36,5 +36,6 @@ HDSPMixerPresetData::HDSPMixerPresetData()
     over = 3;
     level = 0;
     rate = 1;
+    loopback = 0;
 }
 
diff --git a/hdspmixer/src/HDSPMixerPresetData.h b/hdspmixer/src/HDSPMixerPresetData.h
index 58536d3..3b46b92 100644
--- a/hdspmixer/src/HDSPMixerPresetData.h
+++ b/hdspmixer/src/HDSPMixerPresetData.h
@@ -38,6 +38,7 @@ public:
     int over;
     int rate;
     int rmsplus3;
+    int loopback;
     HDSPMixerPresetData();
 };
 
diff --git a/hdspmixer/src/HDSPMixerPresets.cxx b/hdspmixer/src/HDSPMixerPresets.cxx
index aeeb9c9..82654d9 100644
--- a/hdspmixer/src/HDSPMixerPresets.cxx
+++ b/hdspmixer/src/HDSPMixerPresets.cxx
@@ -143,6 +143,7 @@ void HDSPMixerPresets::save_preset(int prst) {
     basew->playbacks->strips[i]->data[card][speed][p]->dest = basew->playbacks->strips[i]->targets->selected;
    
     basew->outputs->strips[i]->data[card][speed][p]->fader_pos = basew->outputs->strips[i]->fader->pos[0];
+    basew->outputs->strips[i]->data[card][speed][p]->loopback = basew->outputs->strips[i]->loopback->get();
     }
     /* Line outs */
     basew->outputs->strips[HDSP_MAX_CHANNELS]->data[card][speed][p]->fader_pos = basew->outputs->strips[HDSP_MAX_CHANNELS]->fader->pos[0];
@@ -188,6 +189,7 @@ void HDSPMixerPresets::restore_preset(int prst) {
     basew->playbacks->strips[i]->targets->selected = basew->playbacks->strips[i]->data[card][speed][p]->dest;
    
     basew->outputs->strips[i]->fader->pos[0] = basew->outputs->strips[i]->data[card][speed][p]->fader_pos;
+    basew->outputs->strips[i]->loopback->set(basew->outputs->strips[i]->data[card][speed][p]->loopback);
     }
     /* Line outs */
     basew->outputs->strips[HDSP_MAX_CHANNELS]->fader->pos[0] = basew->outputs->strips[HDSP_MAX_CHANNELS+1]->data[card][speed][p]->fader_pos;
diff --git a/hdspmixer/src/HDSPMixerWindow.cxx b/hdspmixer/src/HDSPMixerWindow.cxx
index 3b3d668..4a911c1 100644
--- a/hdspmixer/src/HDSPMixerWindow.cxx
+++ b/hdspmixer/src/HDSPMixerWindow.cxx
@@ -471,6 +471,29 @@ void HDSPMixerWindow::save()
     }
     }
 
+    /* Output loopback data */
+    for (int channel = 0; channel < HDSP_MAX_CHANNELS; ++channel) {
+        auto const strip = outputs->strips[channel];
+
+        for (int card = 0; card < MAX_CARDS; ++card) {
+            auto const data = strip->data[card];
+
+            for (int speed = 0; speed < 3; ++speed) {
+                auto const spd = data[speed];
+
+                for (int preset = 0; preset < 8; ++preset) {
+                    auto const data = spd[preset];
+
+                    if (fwrite((void *)&(data->loopback),
+                           sizeof(int),
+                           1,
+                           out) != 1)
+                        goto save_error;
+                }
+            }
+        }
+    }
+
     /* If the file we want to write already exists it could be possible that it
     * was saved with a newer version. If that is the case we just append its
     * content to the new output file and that way ensure that we don't lose any
@@ -519,6 +542,7 @@ void HDSPMixerWindow::load()
     bool ondisk_v1 = false;
     int pan_array_size = 14; /* old (pre 1.0.24) HDSP_MAX_DEST */
     int channels_per_card = 26; /* old (pre 1.0.24) HDSP_MAX_CHANNELS */
+    bool res = true;
 
     if (fread(&buffer, sizeof(char), sizeof(buffer), file) != sizeof(buffer)) {
             goto load_error;
@@ -647,6 +671,46 @@ void HDSPMixerWindow::load()
         }
     }
     }
+
+    /* Output loopback data */
+    for (int channel = 0; channel < HDSP_MAX_CHANNELS; ++channel) {
+        auto const strip = outputs->strips[channel];
+
+        for (int card = 0; card < MAX_CARDS; ++card) {
+            auto const data = strip->data[card];
+
+            for (int speed = 0; speed < 3; ++speed) {
+                auto const spd = data[speed];
+
+                for (int preset = 0; preset < 8; ++preset) {
+                    auto const data = spd[preset];
+
+                    /* TODO: Somewhere we get a value of 5 from, investigate
+                     * this another day. For now just reset it here and
+                     * continue looping to reset the value.
+                     */
+                    data->loopback = 0;
+
+                    if (feof(file)) {
+                        res = true;
+                        continue;
+                    }
+
+                    if (ferror(file)) {
+                        res = false;
+                        continue;
+                    }
+
+                    if (fread((void *)&(data->loopback), sizeof(int), 1, file) != 1)
+                        res = false;
+                }
+            }
+        }
+    }
+
+    if (!res)
+        goto load_error;
+
     fclose(file);
     setTitleWithFilename();
     resetMixer();
@@ -844,6 +908,8 @@ void HDSPMixerWindow::restoreDefaults(int card)
         }       
         outputs->strips[i]->data[card][speed][preset]->fader_pos = (preset != 4) ? 137*CF : 0;
         outputs->strips[i+1]->data[card][speed][preset]->fader_pos = (preset != 4) ? 137*CF : 0;
+        outputs->strips[i]->data[card][speed][preset]->loopback = 0;
+        outputs->strips[i+1]->data[card][speed][preset]->loopback = 0;
         if (preset == 3 || preset == 7) {
             inputs->strips[i]->data[card][speed][preset]->mute = 1;
             inputs->strips[i+1]->data[card][speed][preset]->mute = 1;
@@ -1051,6 +1117,8 @@ void HDSPMixerWindow::checkState()
     /* Outputs row */
     if (outputs->strips[i]->data[current_card][speed][p]->fader_pos != outputs->strips[i]->fader->pos[0])
         corrupt++;
+    if (outputs->strips[i]->data[current_card][speed][p]->loopback != outputs->strips[i]->loopback->get())
+        corrupt++;
     }
 
     /* Global settings */
diff --git a/hdspmixer/src/Makefile.am b/hdspmixer/src/Makefile.am
index e80a8ac..ebc4c3c 100644
--- a/hdspmixer/src/Makefile.am
+++ b/hdspmixer/src/Makefile.am
@@ -15,6 +15,8 @@ hdspmixer_SOURCES = \
     HDSPMixerEmpty.h \
     HDSPMixerOutput.cxx \
     HDSPMixerOutput.h \
+    HDSPMixerLoopback.cxx \
+    HDSPMixerLoopback.h \
     HDSPMixerIOMixer.cxx \
     HDSPMixerIOMixer.h \
     HDSPMixerSelector.cxx \
diff --git a/hdspmixer/src/defines.h b/hdspmixer/src/defines.h
index af5c382..e76141b 100644
--- a/hdspmixer/src/defines.h
+++ b/hdspmixer/src/defines.h
@@ -34,7 +34,7 @@
 
 #define STRIP_WIDTH       36
 #define FULLSTRIP_HEIGHT  253
-#define SMALLSTRIP_HEIGHT 208
+#define SMALLSTRIP_HEIGHT 224
 #define MENU_HEIGHT       20
 
 #define MIN_WIDTH  2*STRIP_WIDTH
diff --git a/hdspmixer/src/pixmaps.cxx b/hdspmixer/src/pixmaps.cxx
index 2f7c589..34f8834 100644
--- a/hdspmixer/src/pixmaps.cxx
+++ b/hdspmixer/src/pixmaps.cxx
@@ -47,6 +47,7 @@
 #include "../pixmaps/over.xpm"
 #include "../pixmaps/peak.xpm"
 #include "../pixmaps/solo.xpm"
+#include "../pixmaps/loopback.xpm"
 #include "../pixmaps/iomixer_r.xpm"
 #include "../pixmaps/output_r.xpm"
 #include "../pixmaps/matrix_black.xpm"
diff --git a/hdspmixer/src/pixmaps.h b/hdspmixer/src/pixmaps.h
index b980a62..3548ba3 100644
--- a/hdspmixer/src/pixmaps.h
+++ b/hdspmixer/src/pixmaps.h
@@ -49,6 +49,7 @@ extern char const * output_xpm[];
 extern char const * over_xpm[];
 extern char const * peak_xpm[];
 extern char const * solo_xpm[];
+extern char const * loopback_xpm[];
 extern char const * iomixer_r_xpm[];
 extern char const * output_r_xpm[];
 extern char const * matrix_white_xpm[];
-- 
2.27.0



