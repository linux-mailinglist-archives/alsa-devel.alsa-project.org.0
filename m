Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D801712807F
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 17:18:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85AC71669;
	Fri, 20 Dec 2019 17:17:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85AC71669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576858714;
	bh=yHV23Uiw3EIiCgW5PT06GhHmZMuMAJFpWw9Tp1N4TDU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V/oU1zNkwoD4q76GLAxtJJXuCV6gNwDMJvz6wI2x1qrmCTkEmC9uFZRw/NKRfXXcP
	 KzEhO9Kl8u8evWX5phuYIqlO3G81ea1x8qiE/RUNKkVqzVX8j8psSKIpZXn8uyEmj4
	 TVIZ7H7enZOoXaKwNlICMCpWLUdQ6sJmIpJXD3oA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95565F8015A;
	Fri, 20 Dec 2019 17:17:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FF70F80247; Fri, 20 Dec 2019 17:17:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 829DCF80059
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 17:17:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 829DCF80059
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C4AAFAE2C
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 16:17:12 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri, 20 Dec 2019 17:17:12 +0100
Message-Id: <20191220161712.23394-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH alsa-lib] uapi: Move typedefs from uapi to
	sound/*
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

For keeping uapi/*.h cleaner.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/emu10k1.h      |  9 +++++++++
 include/sound/hdsp.h         | 10 ++++++++++
 include/sound/hdspm.h        |  8 ++++++++
 include/sound/sb16_csp.h     |  4 ++++
 include/sound/uapi/emu10k1.h | 10 ----------
 include/sound/uapi/hdsp.h    |  9 ---------
 include/sound/uapi/hdspm.h   |  8 --------
 7 files changed, 31 insertions(+), 27 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index f06ecee51c2b..0832f95bd995 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1,2 +1,11 @@
 #include <alsa/sound/type_compat.h>
 #include <alsa/sound/uapi/emu10k1.h>
+#ifndef __emu10k1_type_defined
+#define __emu10k1_type_defined
+typedef struct snd_emu10k1_fx8010_info emu10k1_fx8010_info_t;
+typedef struct snd_emu10k1_fx8010_control_gpr emu10k1_fx8010_control_gpr_t;
+typedef struct snd_emu10k1_fx8010_code emu10k1_fx8010_code_t;
+typedef struct snd_emu10k1_fx8010_tram emu10k1_fx8010_tram_t;
+typedef struct snd_emu10k1_fx8010_pcm_rec emu10k1_fx8010_pcm_t;
+typedef struct emu10k1_ctl_elem_id emu10k1_ctl_elem_id_t;
+#endif
diff --git a/include/sound/hdsp.h b/include/sound/hdsp.h
index 78fb745b607a..e8f931569548 100644
--- a/include/sound/hdsp.h
+++ b/include/sound/hdsp.h
@@ -1,2 +1,12 @@
 #include <alsa/sound/type_compat.h>
 #include <alsa/sound/uapi/hdsp.h>
+#ifndef __hdsp_type_defined
+#define __hdsp_type_defined
+typedef enum HDSP_IO_Type HDSP_IO_Type;
+typedef struct hdsp_peak_rms hdsp_peak_rms_t;
+typedef struct hdsp_config_info hdsp_config_info_t;
+typedef struct hdsp_firmware hdsp_firmware_t;
+typedef struct hdsp_version hdsp_version_t;
+typedef struct hdsp_mixer hdsp_mixer_t;
+typedef struct hdsp_9632_aeb hdsp_9632_aeb_t;
+#endif
diff --git a/include/sound/hdspm.h b/include/sound/hdspm.h
index af6d19eda87f..d9095d9f10bb 100644
--- a/include/sound/hdspm.h
+++ b/include/sound/hdspm.h
@@ -1,2 +1,10 @@
 #include <alsa/sound/type_compat.h>
 #include <alsa/sound/uapi/hdspm.h>
+#ifndef __hdspm_type_defined
+#define __hdspm_type_defined
+typedef struct hdspm_peak_rms hdspm_peak_rms_t;
+typedef struct hdspm_config_info hdspm_config_info_t;
+typedef struct hdspm_version hdspm_version_t;
+typedef struct hdspm_channelfader snd_hdspm_channelfader_t;
+typedef struct hdspm_mixer hdspm_mixer_t;
+#endif
diff --git a/include/sound/sb16_csp.h b/include/sound/sb16_csp.h
index 24121fcbd888..fd02bc565e21 100644
--- a/include/sound/sb16_csp.h
+++ b/include/sound/sb16_csp.h
@@ -1 +1,5 @@
 #include <alsa/sound/uapi/sb16_csp.h>
+#ifndef __sb16_csp_type_defined
+#define __sb16_csp_type_defined
+typedef struct snd_sb_csp_microcode snd_sb_csp_microcode_t;
+#endif
diff --git a/include/sound/uapi/emu10k1.h b/include/sound/uapi/emu10k1.h
index c1150e4d0231..6bcd76f64c1c 100644
--- a/include/sound/uapi/emu10k1.h
+++ b/include/sound/uapi/emu10k1.h
@@ -382,14 +382,4 @@ struct snd_emu10k1_fx8010_pcm_rec {
 #define SNDRV_EMU10K1_IOCTL_SINGLE_STEP	_IOW ('H', 0x83, int)
 #define SNDRV_EMU10K1_IOCTL_DBG_READ	_IOR ('H', 0x84, int)
 
-#ifndef __KERNEL__
-/* typedefs for compatibility to user-space */
-typedef struct snd_emu10k1_fx8010_info emu10k1_fx8010_info_t;
-typedef struct snd_emu10k1_fx8010_control_gpr emu10k1_fx8010_control_gpr_t;
-typedef struct snd_emu10k1_fx8010_code emu10k1_fx8010_code_t;
-typedef struct snd_emu10k1_fx8010_tram emu10k1_fx8010_tram_t;
-typedef struct snd_emu10k1_fx8010_pcm_rec emu10k1_fx8010_pcm_t;
-typedef struct emu10k1_ctl_elem_id emu10k1_ctl_elem_id_t;
-#endif
-
 #endif /* _UAPI__SOUND_EMU10K1_H */
diff --git a/include/sound/uapi/hdsp.h b/include/sound/uapi/hdsp.h
index 88c92a3fb477..7ac2d3f2a9b3 100644
--- a/include/sound/uapi/hdsp.h
+++ b/include/sound/uapi/hdsp.h
@@ -97,13 +97,4 @@ struct hdsp_9632_aeb {
 
 #define SNDRV_HDSP_IOCTL_GET_9632_AEB _IOR('H', 0x45, struct hdsp_9632_aeb)
 
-/* typedefs for compatibility to user-space */
-typedef enum HDSP_IO_Type HDSP_IO_Type;
-typedef struct hdsp_peak_rms hdsp_peak_rms_t;
-typedef struct hdsp_config_info hdsp_config_info_t;
-typedef struct hdsp_firmware hdsp_firmware_t;
-typedef struct hdsp_version hdsp_version_t;
-typedef struct hdsp_mixer hdsp_mixer_t;
-typedef struct hdsp_9632_aeb hdsp_9632_aeb_t;
-
 #endif /* __SOUND_HDSP_H */
diff --git a/include/sound/uapi/hdspm.h b/include/sound/uapi/hdspm.h
index 2d91f90eb5e1..3fbfd9dc5f51 100644
--- a/include/sound/uapi/hdspm.h
+++ b/include/sound/uapi/hdspm.h
@@ -219,12 +219,4 @@ struct hdspm_mixer_ioctl {
 /* use indirect access due to the limit of ioctl bit size */
 #define SNDRV_HDSPM_IOCTL_GET_MIXER _IOR('H', 0x44, struct hdspm_mixer_ioctl)
 
-/* typedefs for compatibility to user-space */
-typedef struct hdspm_peak_rms hdspm_peak_rms_t;
-typedef struct hdspm_config_info hdspm_config_info_t;
-typedef struct hdspm_version hdspm_version_t;
-typedef struct hdspm_channelfader snd_hdspm_channelfader_t;
-typedef struct hdspm_mixer hdspm_mixer_t;
-
-
 #endif
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
