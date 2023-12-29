Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5838221C6
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 20:10:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0233FEA2;
	Tue,  2 Jan 2024 20:10:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0233FEA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704222611;
	bh=zOf5lk7dCVyjEmn/S2QwvaQXTaq5j1ZU+ucwJN1cjpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D9kjUmB6Ufo99MK8OvgIdMsRtpBe///m8fc7UdgLnjS7xIbq/s6AGOv8l88nk+767
	 e4ooSXJL0qmaL8tqQIpC9hJCQfGc1XqWruMby92UUoMGRrvzMx3IsGx9m7iIy+Uq3w
	 QqzMaasFGj4AselGL+W4iaz3LN+PAP3woDZETMPY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94556F80549; Tue,  2 Jan 2024 20:08:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F2A5F805D2;
	Tue,  2 Jan 2024 20:08:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53AE4F80563; Tue,  2 Jan 2024 20:08:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DATE_IN_PAST_96_XX,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D64BF80533
	for <alsa-devel@alsa-project.org>; Tue,  2 Jan 2024 20:08:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D64BF80533
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=SexFa7bw
Received: by m.b4.vu (Postfix, from userid 1000)
	id C93AE604B1D5; Fri, 29 Dec 2023 22:49:23 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu C93AE604B1D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703852363; bh=IIDtS5l87RhlwRGtBY+MgB8DAuPPeQdYVYvLBSsHLQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SexFa7bwY2CSr7mStLVjqshxFa/gxAC0bPEYZ99n3LIS3azs0ziUTM9Eqlzofti+C
	 4bnQzDt7/AkOMAd3Iwp3JV6d+s3uVSPPJzaKfZJqasCc92GHzb+bZQHT6/ZqGCCLrh
	 vbuhItZLD0thPwO3bHbT8zSW2zSV+os7tBu7e8pgymk6zmNT/IKvpY0S5oaTJj6QQ5
	 jsyk6/2kHPSm2JRR/B5kHogPuMWDbhHCdgxw9zA07wRlGgBG3wLchRZkjmLNUCqSvN
	 Wf4QEXSfsJHk+zDaKghusSZBj3HaNB8z+n+3c2ZeADrUSa7GU9he/u8BlPfukUOZRk
	 CfexN4WRtqtpw==
Date: Fri, 29 Dec 2023 22:49:23 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 11/11] ALSA: scarlett2: Add support for uploading new
 firmware
Message-ID: <ZY65S0ojShSNSeRQ@m.b4.vu>
References: <e295050a79057ee8b7bc555a65e295691abd1ede.1703001053.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e295050a79057ee8b7bc555a65e295691abd1ede.1703001053.git.g@b4.vu>
Message-ID-Hash: QE7TFZ2CSLU7CNIPCIB3SRA2RBOTVIYJ
X-Message-ID-Hash: QE7TFZ2CSLU7CNIPCIB3SRA2RBOTVIYJ
X-MailFrom: g@b4.vu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QE7TFZ2CSLU7CNIPCIB3SRA2RBOTVIYJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add ops.write to the hwdep interface. Once the upgrade firmware flash
segment has been erased, writes to the hwdep fd are permitted, and
translated to SCARLETT2_USB_WRITE_SEGMENT commands to the device.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---

Hi Takashi,

I noticed that scarlett2_hwdep_write() was returning the wrong value
for errors encountered after the kzalloc(). Since I don't think you've
taken this set of patches yet, can you replace the previous patch 11
with this version two? Sorry, I don't know if you'd prefer I resend
all 11 patches but I erred on the side of fewer emails. Let me know if
you would like me to do different this time or next time.

Thanks,
Geoffrey.

 sound/usb/mixer_scarlett2.c | 96 +++++++++++++++++++++++++++++++++++--
 1 file changed, 93 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index ca09d0cd0cae..1f3b07bd7b3f 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -266,7 +266,8 @@ enum {
 enum {
 	SCARLETT2_FLASH_WRITE_STATE_IDLE = 0,
 	SCARLETT2_FLASH_WRITE_STATE_SELECTED = 1,
-	SCARLETT2_FLASH_WRITE_STATE_ERASING = 2
+	SCARLETT2_FLASH_WRITE_STATE_ERASING = 2,
+	SCARLETT2_FLASH_WRITE_STATE_WRITE = 3
 };
 
 static const char *const scarlett2_dim_mute_names[SCARLETT2_DIM_MUTE_COUNT] = {
@@ -1176,6 +1177,7 @@ static int scarlett2_get_port_start_num(
 #define SCARLETT2_USB_METER_LEVELS_GET_MAGIC 1
 
 #define SCARLETT2_FLASH_BLOCK_SIZE 4096
+#define SCARLETT2_FLASH_WRITE_MAX 1024
 #define SCARLETT2_SEGMENT_NUM_MIN 1
 #define SCARLETT2_SEGMENT_NUM_MAX 4
 
@@ -5079,10 +5081,10 @@ static int scarlett2_ioctl_get_erase_progress(
 		return -EFAULT;
 
 	/* If the erase is complete, change the state from ERASING to
-	 * IDLE.
+	 * WRITE.
 	 */
 	if (progress.progress == 0xff)
-		private->flash_write_state = SCARLETT2_FLASH_WRITE_STATE_IDLE;
+		private->flash_write_state = SCARLETT2_FLASH_WRITE_STATE_WRITE;
 
 	return 0;
 }
@@ -5135,6 +5137,93 @@ static int scarlett2_hwdep_ioctl(struct snd_hwdep *hw, struct file *file,
 	}
 }
 
+static long scarlett2_hwdep_write(struct snd_hwdep *hw,
+				  const char __user *buf,
+				  long count, loff_t *offset)
+{
+	struct usb_mixer_interface *mixer = hw->private_data;
+	struct scarlett2_data *private = mixer->private_data;
+	int segment_id, segment_num, err, len;
+	int flash_size;
+
+	/* SCARLETT2_USB_WRITE_SEGMENT request data */
+	struct {
+		__le32 segment_num;
+		__le32 offset;
+		__le32 pad;
+		u8 data[];
+	} __packed *req;
+
+	/* Calculate the maximum permitted in data[] */
+	const size_t max_data_size = SCARLETT2_FLASH_WRITE_MAX -
+				     offsetof(typeof(*req), data);
+
+	/* If erasing, wait for it to complete */
+	if (private->flash_write_state ==
+	      SCARLETT2_FLASH_WRITE_STATE_ERASING) {
+		err = scarlett2_wait_for_erase(mixer);
+		if (err < 0)
+			return err;
+		private->flash_write_state = SCARLETT2_FLASH_WRITE_STATE_WRITE;
+
+	/* Check that an erase has been done & completed */
+	} else if (private->flash_write_state !=
+		     SCARLETT2_FLASH_WRITE_STATE_WRITE) {
+		return -EINVAL;
+	}
+
+	/* Check that we're writing to the upgrade firmware */
+	segment_id = private->selected_flash_segment_id;
+	if (segment_id != SCARLETT2_SEGMENT_ID_FIRMWARE)
+		return -EINVAL;
+
+	segment_num = private->flash_segment_nums[segment_id];
+	if (segment_num < SCARLETT2_SEGMENT_NUM_MIN ||
+	    segment_num > SCARLETT2_SEGMENT_NUM_MAX)
+		return -EFAULT;
+
+	/* Validate the offset and count */
+	flash_size = private->flash_segment_blocks[segment_id] *
+		     SCARLETT2_FLASH_BLOCK_SIZE;
+
+	if (count < 0 || *offset < 0 || *offset + count >= flash_size)
+		return -EINVAL;
+
+	if (!count)
+		return 0;
+
+	/* Limit the *req size to SCARLETT2_FLASH_WRITE_MAX */
+	if (count > max_data_size)
+		count = max_data_size;
+
+	/* Create and send the request */
+	len = struct_size(req, data, count);
+	req = kzalloc(len, GFP_KERNEL);
+	if (!req)
+		return -ENOMEM;
+
+	req->segment_num = cpu_to_le32(segment_num);
+	req->offset = cpu_to_le32(*offset);
+	req->pad = 0;
+
+	if (copy_from_user(req->data, buf, count)) {
+		err = -EFAULT;
+		goto error;
+	}
+
+	err = scarlett2_usb(mixer, SCARLETT2_USB_WRITE_SEGMENT,
+			    req, len, NULL, 0);
+	if (err < 0)
+		goto error;
+
+	*offset += count;
+	err = count;
+
+error:
+	kfree(req);
+	return err;
+}
+
 static int scarlett2_hwdep_release(struct snd_hwdep *hw, struct file *file)
 {
 	struct usb_mixer_interface *mixer = hw->private_data;
@@ -5164,6 +5253,7 @@ static int scarlett2_hwdep_init(struct usb_mixer_interface *mixer)
 	hw->exclusive = 1;
 	hw->ops.open = scarlett2_hwdep_open;
 	hw->ops.ioctl = scarlett2_hwdep_ioctl;
+	hw->ops.write = scarlett2_hwdep_write;
 	hw->ops.release = scarlett2_hwdep_release;
 
 	return 0;
-- 
2.43.0

