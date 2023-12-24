Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C04181DC17
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Dec 2023 20:28:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE9C8DF5;
	Sun, 24 Dec 2023 20:27:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE9C8DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703446079;
	bh=XdpCqOveyJSyanwYpd7YtLoOVXpVCXXx8Ded4FTqL3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uKHYvMiu04SWLnGqWzNAAZRrtJhkpa+eY4v7+KuLmItk8hA4vsDm35aSYaHC/38G6
	 LvG6ZNFo18gJdvUel9sAJySZYCXZWEWYwDrOeRsY0dFH7LtXlDKIg9Jvd9Kx7VCirB
	 xnwmJc22e4qioE6codVZS3pkgjEFacNQVMKgUcjY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3B7CF8064F; Sun, 24 Dec 2023 20:26:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B2B4F80673;
	Sun, 24 Dec 2023 20:26:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4B28F8016D; Sun, 24 Dec 2023 20:25:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE147F800BD
	for <alsa-devel@alsa-project.org>; Sun, 24 Dec 2023 20:25:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE147F800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=abQeqhau
Received: by m.b4.vu (Postfix, from userid 1000)
	id BA1CE604B9CB; Mon, 25 Dec 2023 05:55:10 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu BA1CE604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703445910; bh=JL3Yhdp+Mo0nGsHZInIZZCviTwQbkSM8K/eLO2zXfEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=abQeqhauIlHTkQkxg53MLv0sHGlVVepSmkaF77QUuTrpHYpbJmNTUl701AbRlf24g
	 71OaHnMFJr/Vipe7Wtf4aWiMgIvMvg6BvaeU13MXOxK4+Lga3TquSUk87xUxMNUrQk
	 yQjWXuSWVDT3YnUQVCm5ODJE4wxig7Sngr416vjs/wq/NUopnbRW6nciXsBQxbrpmv
	 Xn5KEtGUZiNIsIXqL/5KaOUjrbqfObRiK0wHENCJ3Yaf4HgwBZHPRlcRrNBwS01LST
	 2nM/v1VttLrW+QBKFqWBHmRHXvF6t+tEhsVl8T3fuvq/Gp646koeW5V/KjvvAh/Sv8
	 4q1n4hP5nnnNw==
Date: Mon, 25 Dec 2023 05:55:10 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 08/23] ALSA: scarlett2: Add check for config_item presence
Message-ID: <b0572b23291ffd1b208f21d298adaf4d9f1fe4bc.1703444932.git.g@b4.vu>
References: <cover.1703444932.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703444932.git.g@b4.vu>
Message-ID-Hash: AA42S27P77OUGRZEHXL7MZ4WV7Z3J6RD
X-Message-ID-Hash: AA42S27P77OUGRZEHXL7MZ4WV7Z3J6RD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AA42S27P77OUGRZEHXL7MZ4WV7Z3J6RD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Update scarlett2_usb_get_config() and scarlett2_usb_set_config() to
make sure that the config_item_num is valid for the device.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index bff777a93d65..4849dfeea429 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -1528,6 +1528,12 @@ static int scarlett2_usb_get_config(
 	u8 *buf_8;
 	u8 value;
 
+	/* Check that the configuration item is present in the
+	 * configuration set used by this device
+	 */
+	if (!config_item->offset)
+		return -EFAULT;
+
 	/* For byte-sized parameters, retrieve directly into buf */
 	if (config_item->size >= 8) {
 		size = config_item->size / 8 * count;
@@ -1594,6 +1600,12 @@ static int scarlett2_usb_set_config(
 	int offset, size;
 	int err;
 
+	/* Check that the configuration item is present in the
+	 * configuration set used by this device
+	 */
+	if (!config_item->offset)
+		return -EFAULT;
+
 	/* Cancel any pending NVRAM save */
 	cancel_delayed_work_sync(&private->work);
 
-- 
2.43.0

