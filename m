Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9EC21CEFD
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jul 2020 07:48:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 110A584A;
	Mon, 13 Jul 2020 07:47:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 110A584A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594619323;
	bh=ALzkq5Xn5oLo1zsXv9OCp3kucR+kGx6e3WuazYtZqVY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Gn4vTug2+mXHnW/lgsCjNwDN9j71BYXEdmfvDfP1wuiL9O3xQmj21LeqSJQBmg30+
	 6V6NBsiJIJ5LTqtolovrHN/XsIYTtHNYKyNiNGwFBvXltdRqTrpyrCi9hx8/ztFa7N
	 n/N07xL7W2FyaA7dbngmtk2Q3Nl1hKCRL6NHM+I8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F197F80254;
	Mon, 13 Jul 2020 07:47:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6CD4F802BD; Mon, 13 Jul 2020 07:47:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE72BF800B2
 for <alsa-devel@alsa-project.org>; Mon, 13 Jul 2020 07:46:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE72BF800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jMoXLTCy"
Received: by mail-pg1-x541.google.com with SMTP id t6so5569782pgq.1
 for <alsa-devel@alsa-project.org>; Sun, 12 Jul 2020 22:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9kV5eC0cfq+MjIEnWUDIKxJV7K4FUREjkw+lgvlD4Uw=;
 b=jMoXLTCythtx3HGF5GZ6oId4eAVXVdttTQYfkJaWTJDlVkSSBNxBSvG4Er0bX5LwpD
 KzMi23WGsq0qfeI2W/Spv/YglgHox7rikA2RmrJxcHlr33b7pmi84ldrLdO/X6LXo78A
 09rrNrEICOQbTMjLeJz8b8/clw58r7zvN+6Nmkj9Nbta2KKYgwy3LjPoXrT3nBpZnPLZ
 HPQg2V8vCM9ZYMRakkPOeZbGaLkmdb2Mgd+oP5FKjkQqZw3aWE0Ub9Jwq5klkWZ8kojC
 uXGJ1VuK6RKjwcBX6Ovn0HGSnQ3dUfedAarQgsXStIu9AUPS+SHfn8SKgKYN8scag5ph
 8TeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9kV5eC0cfq+MjIEnWUDIKxJV7K4FUREjkw+lgvlD4Uw=;
 b=RZwBnje/OYoH1rUdlBUdzggmwJ9kTDi9wkxBqtUyrScGXh/3cyDTvNHDANkdJhY82i
 1O8sdTXYblQ/ZcnNcSBlureGoHYCla12yDzUEVtiw1r1B4nxB7VbHR3LqFVzMfSgz60E
 IKQ4/Hd7+/DwMH5omrQZHjb/oztilrUayg2aRFKE5lQKub+x/EalUqFm2JVA8y8bGST1
 XuQXwfeJIBCUOJ8UFHVZccjfNUNpe5GUBROZZ0ghwZ26tS2xV72LmB2RTIfh2AmpmjMR
 VoUIPmZwFnAwiGj8qUP0y6KTPrFbeIrdFz/9PjIH4CrR/Ls7Sl+71gpVUKvavriwShju
 JA/Q==
X-Gm-Message-State: AOAM531bwMw9k1HgbUBrbS86Q7SrwKZm34fA8NbYzb3XH33VCgMFEbVy
 8+SRaKh24H45UR8ybYqDwKI=
X-Google-Smtp-Source: ABdhPJwoIbfopc4mkXHGHOYIDdIWyAPBWA8Uk2RkGjNFMKQaPHzh/t4GTCT+If0xasw8S6pXhdIoOA==
X-Received: by 2002:a62:be04:: with SMTP id l4mr31692348pff.323.1594619211592; 
 Sun, 12 Jul 2020 22:46:51 -0700 (PDT)
Received: from anarsoul-xps15.lan (216-71-213-236.dyn.novuscom.net.
 [216.71.213.236])
 by smtp.gmail.com with ESMTPSA id b18sm13041357pju.10.2020.07.12.22.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2020 22:46:51 -0700 (PDT)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Pavel Machek <pavel@denx.de>, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] ALSA: line6: add hw monitor volume control for POD HD500
Date: Sun, 12 Jul 2020 22:46:35 -0700
Message-Id: <20200713054635.58534-1-anarsoul@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
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

Add hw monitor volume control for POD HD500. The same change may
work for HD500X but I don't have it to test.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
v3: - use EXPORT_SYMBOL_GPL instead of EXPORT_SYMBOL
    - use GFP_KERNEL instead of GFP_ATOMIC for allocating a message
    - use lower case for float lookup table
v2: clamp volume value to [0, ARRAY_SIZE() -1] in
    podhd_set_monitor_level()

 sound/usb/line6/driver.c |   3 +-
 sound/usb/line6/driver.h |   4 ++
 sound/usb/line6/podhd.c  | 124 ++++++++++++++++++++++++++++++++++++++-
 3 files changed, 129 insertions(+), 2 deletions(-)

diff --git a/sound/usb/line6/driver.c b/sound/usb/line6/driver.c
index 7629116f570e..3e07251b80e3 100644
--- a/sound/usb/line6/driver.c
+++ b/sound/usb/line6/driver.c
@@ -97,7 +97,7 @@ static void line6_stop_listen(struct usb_line6 *line6)
 /*
 	Send raw message in pieces of wMaxPacketSize bytes.
 */
-static int line6_send_raw_message(struct usb_line6 *line6, const char *buffer,
+int line6_send_raw_message(struct usb_line6 *line6, const char *buffer,
 				  int size)
 {
 	int i, done = 0;
@@ -132,6 +132,7 @@ static int line6_send_raw_message(struct usb_line6 *line6, const char *buffer,
 
 	return done;
 }
+EXPORT_SYMBOL_GPL(line6_send_raw_message);
 
 /*
 	Notification of completion of asynchronous request transmission.
diff --git a/sound/usb/line6/driver.h b/sound/usb/line6/driver.h
index 1a4e3700c80c..62c686bed0ca 100644
--- a/sound/usb/line6/driver.h
+++ b/sound/usb/line6/driver.h
@@ -108,6 +108,8 @@ enum {
 	LINE6_CAP_CONTROL_MIDI = 1 << 4,
 	/* device provides low-level information */
 	LINE6_CAP_CONTROL_INFO = 1 << 5,
+	/* device provides hardware monitoring volume control */
+	LINE6_CAP_HWMON_CTL =	1 << 6,
 };
 
 /*
@@ -185,6 +187,8 @@ extern int line6_read_data(struct usb_line6 *line6, unsigned address,
 			   void *data, unsigned datalen);
 extern int line6_read_serial_number(struct usb_line6 *line6,
 				    u32 *serial_number);
+extern int line6_send_raw_message(struct usb_line6 *line6,
+					const char *buffer, int size);
 extern int line6_send_raw_message_async(struct usb_line6 *line6,
 					const char *buffer, int size);
 extern int line6_send_sysex_message(struct usb_line6 *line6,
diff --git a/sound/usb/line6/podhd.c b/sound/usb/line6/podhd.c
index e39dc85c355a..0410d256aa50 100644
--- a/sound/usb/line6/podhd.c
+++ b/sound/usb/line6/podhd.c
@@ -11,6 +11,7 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <sound/core.h>
+#include <sound/control.h>
 #include <sound/pcm.h>
 
 #include "driver.h"
@@ -37,6 +38,9 @@ struct usb_line6_podhd {
 
 	/* Firmware version */
 	int firmware_version;
+
+	/* Monitor level */
+	int monitor_level;
 };
 
 #define line6_to_podhd(x)	container_of(x, struct usb_line6_podhd, line6)
@@ -250,6 +254,115 @@ static void podhd_disconnect(struct usb_line6 *line6)
 	}
 }
 
+static const unsigned int float_zero_to_one_lookup[] = {
+0x00000000, 0x3c23d70a, 0x3ca3d70a, 0x3cf5c28f, 0x3d23d70a, 0x3d4ccccd,
+0x3d75c28f, 0x3d8f5c29, 0x3da3d70a, 0x3db851ec, 0x3dcccccd, 0x3de147ae,
+0x3df5c28f, 0x3e051eb8, 0x3e0f5c29, 0x3e19999a, 0x3e23d70a, 0x3e2e147b,
+0x3e3851ec, 0x3e428f5c, 0x3e4ccccd, 0x3e570a3d, 0x3e6147ae, 0x3e6b851f,
+0x3e75c28f, 0x3e800000, 0x3e851eb8, 0x3e8a3d71, 0x3e8f5c29, 0x3e947ae1,
+0x3e99999a, 0x3e9eb852, 0x3ea3d70a, 0x3ea8f5c3, 0x3eae147b, 0x3eb33333,
+0x3eb851ec, 0x3ebd70a4, 0x3ec28f5c, 0x3ec7ae14, 0x3ecccccd, 0x3ed1eb85,
+0x3ed70a3d, 0x3edc28f6, 0x3ee147ae, 0x3ee66666, 0x3eeb851f, 0x3ef0a3d7,
+0x3ef5c28f, 0x3efae148, 0x3f000000, 0x3f028f5c, 0x3f051eb8, 0x3f07ae14,
+0x3f0a3d71, 0x3f0ccccd, 0x3f0f5c29, 0x3f11eb85, 0x3f147ae1, 0x3f170a3d,
+0x3f19999a, 0x3f1c28f6, 0x3f1eb852, 0x3f2147ae, 0x3f23d70a, 0x3f266666,
+0x3f28f5c3, 0x3f2b851f, 0x3f2e147b, 0x3f30a3d7, 0x3f333333, 0x3f35c28f,
+0x3f3851ec, 0x3f3ae148, 0x3f3d70a4, 0x3f400000, 0x3f428f5c, 0x3f451eb8,
+0x3f47ae14, 0x3f4a3d71, 0x3f4ccccd, 0x3f4f5c29, 0x3f51eb85, 0x3f547ae1,
+0x3f570a3d, 0x3f59999a, 0x3f5c28f6, 0x3f5eb852, 0x3f6147ae, 0x3f63d70a,
+0x3f666666, 0x3f68f5c3, 0x3f6b851f, 0x3f6e147b, 0x3f70a3d7, 0x3f733333,
+0x3f75c28f, 0x3f7851ec, 0x3f7ae148, 0x3f7d70a4, 0x3f800000
+};
+
+static void podhd_set_monitor_level(struct usb_line6_podhd *podhd, int value)
+{
+	unsigned int fl;
+	static const unsigned char msg[16] = {
+		/* Chunk is 0xc bytes (without first word) */
+		0x0c, 0x00,
+		/* First chunk in the message */
+		0x01, 0x00,
+		/* Message size is 2 4-byte words */
+		0x02, 0x00,
+		/* Unknown */
+		0x04, 0x41,
+		/* Unknown */
+		0x04, 0x00, 0x13, 0x00,
+		/* Volume, LE float32, 0.0 - 1.0 */
+		0x00, 0x00, 0x00, 0x00
+	};
+	unsigned char *buf;
+
+	buf = kmalloc(sizeof(msg), GFP_KERNEL);
+	memcpy(buf, msg, sizeof(msg));
+
+	if (value < 0)
+		value = 0;
+
+	if (value >= ARRAY_SIZE(float_zero_to_one_lookup))
+		value = ARRAY_SIZE(float_zero_to_one_lookup) - 1;
+
+	fl = float_zero_to_one_lookup[value];
+
+	buf[12] = (fl >> 0) & 0xff;
+	buf[13] = (fl >> 8) & 0xff;
+	buf[14] = (fl >> 16) & 0xff;
+	buf[15] = (fl >> 24) & 0xff;
+
+	line6_send_raw_message(&podhd->line6, buf, sizeof(msg));
+	kfree(buf);
+
+	podhd->monitor_level = value;
+}
+
+/* control info callback */
+static int snd_podhd_control_monitor_info(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = 100;
+	uinfo->value.integer.step = 1;
+	return 0;
+}
+
+/* control get callback */
+static int snd_podhd_control_monitor_get(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_line6_pcm *line6pcm = snd_kcontrol_chip(kcontrol);
+	struct usb_line6_podhd *podhd = line6_to_podhd(line6pcm->line6);
+
+	ucontrol->value.integer.value[0] = podhd->monitor_level;
+	return 0;
+}
+
+/* control put callback */
+static int snd_podhd_control_monitor_put(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_line6_pcm *line6pcm = snd_kcontrol_chip(kcontrol);
+	struct usb_line6_podhd *podhd = line6_to_podhd(line6pcm->line6);
+
+	if (ucontrol->value.integer.value[0] == podhd->monitor_level)
+		return 0;
+
+	podhd_set_monitor_level(podhd, ucontrol->value.integer.value[0]);
+	return 1;
+}
+
+/* control definition */
+static const struct snd_kcontrol_new podhd_control_monitor = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "Monitor Playback Volume",
+	.index = 0,
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+	.info = snd_podhd_control_monitor_info,
+	.get = snd_podhd_control_monitor_get,
+	.put = snd_podhd_control_monitor_put
+};
+
 /*
 	Try to init POD HD device.
 */
@@ -298,6 +411,15 @@ static int podhd_init(struct usb_line6 *line6,
 			return err;
 	}
 
+	if (pod->line6.properties->capabilities & LINE6_CAP_HWMON_CTL) {
+		podhd_set_monitor_level(pod, 100);
+		err = snd_ctl_add(line6->card,
+				  snd_ctl_new1(&podhd_control_monitor,
+					       line6->line6pcm));
+		if (err < 0)
+			return err;
+	}
+
 	if (!(pod->line6.properties->capabilities & LINE6_CAP_CONTROL_INFO)) {
 		/* register USB audio system directly */
 		return snd_card_register(line6->card);
@@ -354,7 +476,7 @@ static const struct line6_properties podhd_properties_table[] = {
 		.id = "PODHD500",
 		.name = "POD HD500",
 		.capabilities	= LINE6_CAP_PCM | LINE6_CAP_CONTROL
-				| LINE6_CAP_HWMON,
+				| LINE6_CAP_HWMON | LINE6_CAP_HWMON_CTL,
 		.altsetting = 1,
 		.ctrl_if = 1,
 		.ep_ctrl_r = 0x81,
-- 
2.27.0

