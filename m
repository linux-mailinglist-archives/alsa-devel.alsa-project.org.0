Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2103124D9
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Feb 2021 15:52:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99319167D;
	Sun,  7 Feb 2021 15:51:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99319167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612709568;
	bh=BmdCZxdkIXlP0tL1X+BU/znK188WbxAVNGsCdLPPWh8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l2MVaPTHkQBibmylAHqE8vpwFbHKx1ORAobUxF+ypQ09gmcprilmGmRFBLOAllfl+
	 X/NPBRxr+A8Axf/ib6DrujJ1bSYP7FoHrvknyA1rJoR4a0+/gqroODUYMmX+TYzS31
	 596JiqCCNyMCvXjoFEZXah7q173Wi6/7jU4exUCw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1598F8016B;
	Sun,  7 Feb 2021 15:51:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E220EF8025F; Sun,  7 Feb 2021 15:51:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F137FF8016B
 for <alsa-devel@alsa-project.org>; Sun,  7 Feb 2021 15:51:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F137FF8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LDmbsx1y"
Received: by mail-ej1-x633.google.com with SMTP id w1so20580172ejf.11
 for <alsa-devel@alsa-project.org>; Sun, 07 Feb 2021 06:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Dli8mLGoWqnt4an0wn/1Rk/V+Yg896RwIrDY1Hd/ik=;
 b=LDmbsx1yOtPphJ/mtEDjscwlVA/zpfw+uZUgsxeVxsdANz5L9w7F178GQuN6gq3Unn
 bad/+XmLbgISdTteonK9V7BZ4K/G5vkGguJSdJ7R+hZtc4if1/gg0w//qNOb9yOa2fRj
 fcy9BOvcfoGBhxBht+XfmN5QvEN7rxdnD/eReHWhutrjPUH7yPIrKyjn2zmNcRGQW7cU
 IsZl3NzJN7HQcUcPiAlHYEgMWoxERcPTnA1pBHbH+OFBkT0rssCiQ1EvC+mUY0vkHLXm
 qwXcyB6vHaZEyfSmWh8ZiIKX3BpyCMWqxrOnEOfv6KJR+2sPRscZy1Ebm8OcY16ONPCC
 ARVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Dli8mLGoWqnt4an0wn/1Rk/V+Yg896RwIrDY1Hd/ik=;
 b=geXWOlSp7L6+UWlAYB5SNmLtWMQqLO9ik2jsv+X010OI5A4SWyCcD9lk+/BFDgDH4M
 yYTJRDBgJ6/IRbzxBaLHFqIn+JZa+8QFI1gxapkJCHZZ8XzDEdgP+Jzwv/7VXprUvv9H
 Td6YKqYUhdyYk2L0JX3UbdYYv3OmLK01C40b7tNvE05grIuMO27LM4e73jvv84/Pu/06
 IzC6cIWMgIcpSjXMPLvwdpGvRKfsVMr/g0b38BLWMcKmQb7i3Mnkv/7IjnyfIMWeYl9b
 arX+MbFT5CvKUiJ8uucmTBQvBDkax46owosv9rGK9WT7SFnMUA3J9uZZKSSE4QXAUPn8
 nCwg==
X-Gm-Message-State: AOAM5336upfWiJJ8EKJnmKgUhmoF/WRdId5yZ6PHZniZr2X5y/GIwpHh
 /LA/lbgKkb+5NC7N1D6kqEmkoazi9rNgqQ==
X-Google-Smtp-Source: ABdhPJzlFNoRL3+1vuz6nbFh1WWl2Mh/rVQKYPlv3EDBzGEsh89X/8IZYFFD5oUscgrt5rI6PMsyZg==
X-Received: by 2002:a17:906:86cf:: with SMTP id
 j15mr12709285ejy.194.1612709489417; 
 Sun, 07 Feb 2021 06:51:29 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8388-1987-9380-4ad8-691e-003a-5a6e.cable.dynamic.v6.surfer.at.
 [2a02:8388:1987:9380:4ad8:691e:3a:5a6e])
 by smtp.gmail.com with ESMTPSA id x17sm7477161edd.76.2021.02.07.06.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 06:51:28 -0800 (PST)
From: Jasmin Fazlic <superfassl@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] alsa-tools/hdspmixer: enhance saving of presets
Date: Sun,  7 Feb 2021 15:50:47 +0100
Message-Id: <20210207145048.14580-2-superfassl@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <2e9bb0b8-ee14-9dc9-1bd8-ecffca3982ac@gmail.com>
References: <2e9bb0b8-ee14-9dc9-1bd8-ecffca3982ac@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jasmin Fazlic <superfassl@gmail.com>
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
-    FILE *file;
-
-    if ((file = fopen(file_name, "w")) == NULL) {
-	fl_alert("Error opening file %s for saving", file_name);
+	FILE *in,*out;
+
+	/* We want to append any existing extra data that might got written by a
+	 * newer version to this file, therefore write our data to file_name.tmp
+	 * and append the old data. Also this way we would not corrupt the file
+	 * should we crash.
+	 */
+	std::string const tmp = file_name + std::string(".tmp");
+	char const * const tmpc = tmp.c_str();
+
+    if ((out = fopen(tmpc, "w")) == NULL) {
+	fl_alert("Error opening file %s for saving", tmpc);
     }
     if (dirty) {
 	inputs->buttons->presets->save_preset(current_preset+1);
     }
     /* since hdspmixer 1.11, we also store the meter level settings. Indicate
      * the new on-disk structure via a small header */
-    if (fwrite((void *)&header, sizeof(char), sizeof(header), file) !=
+    if (fwrite((void *)&header, sizeof(char), sizeof(header), out) !=
             sizeof(header)) {
         goto save_error;
     }
@@ -374,99 +381,122 @@ void HDSPMixerWindow::save()
 	    for (int preset = 0; preset < 8; ++preset) {
 		for (int channel = 0; channel < HDSP_MAX_CHANNELS; ++channel) {
 		    /* inputs pans and volumes */
-		    if (fwrite((void *)&(inputs->strips[channel]->data[card][speed][preset]->pan_pos[0]), sizeof(int), pan_array_size, file) != pan_array_size) {
+		    if (fwrite((void *)&(inputs->strips[channel]->data[card][speed][preset]->pan_pos[0]), sizeof(int), pan_array_size, out) != pan_array_size) {
 			goto save_error;
 		    }
-		    if (fwrite((void *)&(inputs->strips[channel]->data[card][speed][preset]->fader_pos[0]), sizeof(int), pan_array_size, file) != pan_array_size) {
+		    if (fwrite((void *)&(inputs->strips[channel]->data[card][speed][preset]->fader_pos[0]), sizeof(int), pan_array_size, out) != pan_array_size) {
 			goto save_error;
 		    }
 		    /* playbacks pans and volumes */
-		    if (fwrite((void *)&(playbacks->strips[channel]->data[card][speed][preset]->pan_pos[0]), sizeof(int), pan_array_size, file) != pan_array_size) {
+		    if (fwrite((void *)&(playbacks->strips[channel]->data[card][speed][preset]->pan_pos[0]), sizeof(int), pan_array_size, out) != pan_array_size) {
 			goto save_error;
 		    }
-		    if (fwrite((void *)&(playbacks->strips[channel]->data[card][speed][preset]->fader_pos[0]), sizeof(int), pan_array_size, file) != pan_array_size) {
+		    if (fwrite((void *)&(playbacks->strips[channel]->data[card][speed][preset]->fader_pos[0]), sizeof(int), pan_array_size, out) != pan_array_size) {
 			goto save_error;
 		    }
 		    /* inputs mute/solo/dest */
-		    if (fwrite((void *)&(inputs->strips[channel]->data[card][speed][preset]->mute), sizeof(int), 1, file) != 1) {
+		    if (fwrite((void *)&(inputs->strips[channel]->data[card][speed][preset]->mute), sizeof(int), 1, out) != 1) {
 			goto save_error;
 		    }
-		    if (fwrite((void *)&(inputs->strips[channel]->data[card][speed][preset]->solo), sizeof(int), 1, file) != 1) {
+		    if (fwrite((void *)&(inputs->strips[channel]->data[card][speed][preset]->solo), sizeof(int), 1, out) != 1) {
 			goto save_error;
 		    }
-		    if (fwrite((void *)&(inputs->strips[channel]->data[card][speed][preset]->dest), sizeof(int), 1, file) != 1) {
+		    if (fwrite((void *)&(inputs->strips[channel]->data[card][speed][preset]->dest), sizeof(int), 1, out) != 1) {
 			goto save_error;
 		    }
 		    /* playbacks mute/solo/dest */
-		    if (fwrite((void *)&(playbacks->strips[channel]->data[card][speed][preset]->mute), sizeof(int), 1, file) != 1) {
+		    if (fwrite((void *)&(playbacks->strips[channel]->data[card][speed][preset]->mute), sizeof(int), 1, out) != 1) {
 			goto save_error;
 		    }
-		    if (fwrite((void *)&(playbacks->strips[channel]->data[card][speed][preset]->solo), sizeof(int), 1, file) != 1) {
+		    if (fwrite((void *)&(playbacks->strips[channel]->data[card][speed][preset]->solo), sizeof(int), 1, out) != 1) {
 			goto save_error;
 		    }
-		    if (fwrite((void *)&(playbacks->strips[channel]->data[card][speed][preset]->dest), sizeof(int), 1, file) != 1) {
+		    if (fwrite((void *)&(playbacks->strips[channel]->data[card][speed][preset]->dest), sizeof(int), 1, out) != 1) {
 			goto save_error;
 		    }
 		    /* outputs volumes */
-		    if (fwrite((void *)&(outputs->strips[channel]->data[card][speed][preset]->fader_pos), sizeof(int), 1, file) != 1) {
+		    if (fwrite((void *)&(outputs->strips[channel]->data[card][speed][preset]->fader_pos), sizeof(int), 1, out) != 1) {
 			goto save_error;
 		    }
 		    
  		}
 		/* Lineouts */		    
-		if (fwrite((void *)&(outputs->strips[HDSP_MAX_CHANNELS]->data[card][speed][preset]->fader_pos), sizeof(int), 1, file) != 1) {
+		if (fwrite((void *)&(outputs->strips[HDSP_MAX_CHANNELS]->data[card][speed][preset]->fader_pos), sizeof(int), 1, out) != 1) {
 		    goto save_error;
 		}
-		if (fwrite((void *)&(outputs->strips[HDSP_MAX_CHANNELS+1]->data[card][speed][preset]->fader_pos), sizeof(int), 1, file) != 1) {
+		if (fwrite((void *)&(outputs->strips[HDSP_MAX_CHANNELS+1]->data[card][speed][preset]->fader_pos), sizeof(int), 1, out) != 1) {
 		    goto save_error;
 		}
 		/* Global settings */
-		if (fwrite((void *)&(data[card][speed][preset]->input), sizeof(int), 1, file) != 1) {
+		if (fwrite((void *)&(data[card][speed][preset]->input), sizeof(int), 1, out) != 1) {
 		    goto save_error;
 		}
-		if (fwrite((void *)&(data[card][speed][preset]->output), sizeof(int), 1, file) != 1) {
+		if (fwrite((void *)&(data[card][speed][preset]->output), sizeof(int), 1, out) != 1) {
 		    goto save_error;
 		}
-		if (fwrite((void *)&(data[card][speed][preset]->playback), sizeof(int), 1, file) != 1) {
+		if (fwrite((void *)&(data[card][speed][preset]->playback), sizeof(int), 1, out) != 1) {
 		    goto save_error;
 		}
-		if (fwrite((void *)&(data[card][speed][preset]->submix), sizeof(int), 1, file) != 1) {
+		if (fwrite((void *)&(data[card][speed][preset]->submix), sizeof(int), 1, out) != 1) {
 		    goto save_error;
 		}
-		if (fwrite((void *)&(data[card][speed][preset]->submix_value), sizeof(int), 1, file) != 1) {
+		if (fwrite((void *)&(data[card][speed][preset]->submix_value), sizeof(int), 1, out) != 1) {
 		    goto save_error;
 		}
-		if (fwrite((void *)&(data[card][speed][preset]->solo), sizeof(int), 1, file) != 1) {
+		if (fwrite((void *)&(data[card][speed][preset]->solo), sizeof(int), 1, out) != 1) {
 		    goto save_error;
 		}
-		if (fwrite((void *)&(data[card][speed][preset]->mute), sizeof(int), 1, file) != 1) {
+		if (fwrite((void *)&(data[card][speed][preset]->mute), sizeof(int), 1, out) != 1) {
 		    goto save_error;
 		}		
-		if (fwrite((void *)&(data[card][speed][preset]->last_destination), sizeof(int), 1, file) != 1) {
+		if (fwrite((void *)&(data[card][speed][preset]->last_destination), sizeof(int), 1, out) != 1) {
 		    goto save_error;
 		}
-		if (fwrite((void *)&(data[card][speed][preset]->rmsplus3), sizeof(int), 1, file) != 1) {
+		if (fwrite((void *)&(data[card][speed][preset]->rmsplus3), sizeof(int), 1, out) != 1) {
 		    goto save_error;
 		}
-		if (fwrite((void *)&(data[card][speed][preset]->numbers), sizeof(int), 1, file) != 1) {
+		if (fwrite((void *)&(data[card][speed][preset]->numbers), sizeof(int), 1, out) != 1) {
 		    goto save_error;
 		}
-		if (fwrite((void *)&(data[card][speed][preset]->over), sizeof(int), 1, file) != 1) {
+		if (fwrite((void *)&(data[card][speed][preset]->over), sizeof(int), 1, out) != 1) {
 		    goto save_error;
 		}
-		if (fwrite((void *)&(data[card][speed][preset]->level), sizeof(int), 1, file) != 1) {
+		if (fwrite((void *)&(data[card][speed][preset]->level), sizeof(int), 1, out) != 1) {
 		    goto save_error;
 		}
-		if (fwrite((void *)&(data[card][speed][preset]->rate), sizeof(int), 1, file) != 1) {
+		if (fwrite((void *)&(data[card][speed][preset]->rate), sizeof(int), 1, out) != 1) {
 		    goto save_error;
 		}
 	    }
 	}
     }
-    fclose(file);
+
+	/* If the file we want to write already exists it could be possible that it
+	* was saved with a newer version. If that is the case we just append its
+	* content to the new output file and that way ensure that we don't lose any
+	* data the new version wrote.
+	*/
+	if ((in = fopen(file_name, "r")) != NULL) {
+		if (!fseek(in, ftell(out), SEEK_SET)) {
+			char buff[512];
+			size_t read;
+			while ((read = fread(&buff, sizeof(char), sizeof(buff), in)) != 0)
+				fwrite(buff, sizeof(char), read, out);
+			if (ferror(in) || ferror(out))
+				fl_alert("Error appending %s to %s", file_name, tmpc);
+		}
+		fclose(in);
+	}
+
+	fclose(out);
+
+	if (rename(tmpc, file_name))
+		fl_alert("Error renaming %s to %s", tmpc, file_name);
+	::remove(tmpc);
+
     return;
 save_error:
-    fclose(file);
+    fclose(out);
     fl_alert("Error saving presets to file %s", file_name);
     return;
 }
-- 
2.27.0

