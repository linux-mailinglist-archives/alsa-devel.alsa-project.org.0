Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1B481DC19
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Dec 2023 20:28:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F7A593A;
	Sun, 24 Dec 2023 20:28:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F7A593A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703446131;
	bh=MD8ILXUHHUGqyNcaqTNQRY4/6qsNkKCu3nkVN2mOS28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=czz0P9/i2420C/9WS6JmuqhSr/V+z1OBLnW3ZkLfsnH0yOcvlNMWzMqEr1C9IoMd6
	 5yOBJdhS53IcvXRoyUQKcJyVI0nAPNmgDNt8zyAryTQsW14/Ir6T5Oo3SOehPTDoYT
	 d6H5yJuuOfq7ScuzyBlcTce8vrCdIHrwTlJ6vZ3E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98962F805FA; Sun, 24 Dec 2023 20:27:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FA90F805EE;
	Sun, 24 Dec 2023 20:27:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB0C5F805AB; Sun, 24 Dec 2023 20:27:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34827F805AB
	for <alsa-devel@alsa-project.org>; Sun, 24 Dec 2023 20:27:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34827F805AB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=FgZZPDcM
Received: by m.b4.vu (Postfix, from userid 1000)
	id 91D4E604B9CB; Mon, 25 Dec 2023 05:57:16 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 91D4E604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703446036; bh=tqdoNC8FmJJqw+TaWGKncCIEZx4K22FShl6pqV3L1pk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FgZZPDcMUcBD/rXEriwiRm+cVUztZkhOffHtrds4O9x5VvDJAuUr6MgWPWf4y+a96
	 5i9xm5UW8JDuNjOxVVlzqQ/m6UP6BUV30PjlyttbUKRQ8g/ZnCPqG1zeZJBNVWVEEP
	 WBX/cNO5n0YLHvBZ7u1XHwxfL+g9srKhnqXdSS525UyFBw0SIWHgjfxtgjdC1MiN8D
	 cdKUZQSH3nekZLLN35POBQy+4qr+x8+XohoHwgXu/b+rT5ItUR4cd3SvNa9iq30Z78
	 YgCRuk0SS1lMQJ0FZXohgD1WO/LTzziR3o3tNdjXeM3jqJKHT4GgGywpiztOVXZcou
	 nL76MZtCaEKwg==
Date: Mon, 25 Dec 2023 05:57:16 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 10/23] ALSA: scarlett2: Refactor scarlett2_config_save()
Message-ID: <bbc733dc081f311fb3167e81b15cd76324aa6307.1703444932.git.g@b4.vu>
References: <cover.1703444932.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703444932.git.g@b4.vu>
Message-ID-Hash: ZFCK7QF67SKA4WG52K2IG2AQDPBPBWT5
X-Message-ID-Hash: ZFCK7QF67SKA4WG52K2IG2AQDPBPBWT5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZFCK7QF67SKA4WG52K2IG2AQDPBPBWT5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use the new scarlett2_usb_activate_config() helper function rather
than preparing the request manually and calling scarlett2_usb().

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 40 ++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index bbc60b94b7bc..f15ee9e6c2eb 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -1562,27 +1562,6 @@ static int scarlett2_usb_get_config(
 	return 0;
 }
 
-/* Send SCARLETT2_USB_DATA_CMD SCARLETT2_USB_CONFIG_SAVE */
-static void scarlett2_config_save(struct usb_mixer_interface *mixer)
-{
-	__le32 req = cpu_to_le32(SCARLETT2_USB_CONFIG_SAVE);
-
-	int err = scarlett2_usb(mixer, SCARLETT2_USB_DATA_CMD,
-				&req, sizeof(u32),
-				NULL, 0);
-	if (err < 0)
-		usb_audio_err(mixer->chip, "config save failed: %d\n", err);
-}
-
-/* Delayed work to save config */
-static void scarlett2_config_save_work(struct work_struct *work)
-{
-	struct scarlett2_data *private =
-		container_of(work, struct scarlett2_data, work.work);
-
-	scarlett2_config_save(private->mixer);
-}
-
 /* Send a SCARLETT2_USB_SET_DATA command.
  * offset: location in the device's data space
  * size: size in bytes of the value (1, 2, 4)
@@ -1686,6 +1665,25 @@ static int scarlett2_usb_set_config(
 	return 0;
 }
 
+/* Send SCARLETT2_USB_DATA_CMD SCARLETT2_USB_CONFIG_SAVE */
+static void scarlett2_config_save(struct usb_mixer_interface *mixer)
+{
+	int err;
+
+	err = scarlett2_usb_activate_config(mixer, SCARLETT2_USB_CONFIG_SAVE);
+	if (err < 0)
+		usb_audio_err(mixer->chip, "config save failed: %d\n", err);
+}
+
+/* Delayed work to save config */
+static void scarlett2_config_save_work(struct work_struct *work)
+{
+	struct scarlett2_data *private =
+		container_of(work, struct scarlett2_data, work.work);
+
+	scarlett2_config_save(private->mixer);
+}
+
 /* Send a USB message to get sync status; result placed in *sync */
 static int scarlett2_usb_get_sync_status(
 	struct usb_mixer_interface *mixer,
-- 
2.43.0

