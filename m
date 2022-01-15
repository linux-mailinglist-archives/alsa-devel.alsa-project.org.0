Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C5448FBD1
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jan 2022 09:52:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40F821816;
	Sun, 16 Jan 2022 09:51:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40F821816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642323154;
	bh=nQYn1GRV6KPCrTtR24/ry9XaROEpVWcrS9MYyIBGf9g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OzQQAKDQHp5i1tWzMtQlD/E805OtleIDM38TZyyDA3kUswJMHE7mKFLyl+A1DCwxn
	 +lnQhxgjaRHkQLYlv3ei5iDbPnQ015ePrqcxZWVZLojZjqZEFKPg66LhEcmmNeFK97
	 3s4+698sLFbVa3bVBZM/j9ey++r8YMWFSaW3F2SM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C52A8F8050F;
	Sun, 16 Jan 2022 09:50:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBE0CF801D8; Sat, 15 Jan 2022 15:03:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8D04F800B0
 for <alsa-devel@alsa-project.org>; Sat, 15 Jan 2022 15:03:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8D04F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eNlULm9K"
Received: by mail-wm1-x331.google.com with SMTP id
 n19-20020a7bc5d3000000b003466ef16375so13188534wmk.1
 for <alsa-devel@alsa-project.org>; Sat, 15 Jan 2022 06:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BgqdAQ+WwQ2orxsAM2n1S2UekO1K+V1jDnafdr+cUBA=;
 b=eNlULm9KFr7sVfv7XXX8WvBvJ3EfnXgUDJB50ROFdt/F+8ya6/aT3s+UQrnnIPVR9a
 46btCi0k7UxcG9C16YryKFwdNsh3kpvNfwx5BcbuRatdkkZgwrp/ojsyvrylHuxYufIq
 EhA4Wf2KVbxkJ1VPLZ6iWslGLpPkqdDXHC2cDUIO1sj8b7DP4Qo6bDkA6cFzpfx0fdQ8
 Tb3cwWyN/t//79o4oszMDCL6TPrc+kmBrjlQs0RkEXQj3N0r5ZZq//cipYXG+jAsJuUB
 4OANPlKVCQZ0wjnvXtBXaDb7t6wEW/Qy1dH1cmn/BUFoIOZF+hdrczNY5din6QbN8SWD
 iShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BgqdAQ+WwQ2orxsAM2n1S2UekO1K+V1jDnafdr+cUBA=;
 b=GdXUwDRaP69J492Wlg2ZWZzn7U7qhaJkQYrz6fpfFvd3ABA30NvwINYvYuw7uDK7Yj
 MDCZwqAD5/bPYqdkBzmsS1LqTfH0RPonAQM4IFvcjdxjCsEAcNJez50YUhYDGnLeFjyE
 hwUNpOLIlZ2fWoADRxvYj1GN/kYJEKvQOFen9VFFrsEgjCzEuLSDhHpeiKqevAzjgDiA
 IvjVvUfnTzRNA5MmN/gbl3DDPJVKZ58vEYKUZ9TeIQZK1eMUpiGA+v5BnVbUJUBXTpbU
 LRAAQM8CmerJ+RatOqZn51lm+QNFUjO/SNEAlHmqqJcT5sh6OMMOL2Yhmzx8Ct4JyL7S
 4dOw==
X-Gm-Message-State: AOAM533MpKTe0FeMXQvABr1q3mYu22DAkldqzFvinS0vnBJTFtKzqFKE
 loKQhicHdBxe1C8bXHLMFTL7OVyIwEcl/gHZ/Wo=
X-Google-Smtp-Source: ABdhPJxpkSz+rTg4zCg4BU+pdDS31h57yxHNbH9tGWP4j2dQMy8tIubmv1xnIBgPdZ60V/gmyOln5w==
X-Received: by 2002:a05:6000:18ab:: with SMTP id
 b11mr12329440wri.385.1642255432721; 
 Sat, 15 Jan 2022 06:03:52 -0800 (PST)
Received: from kyrandia.fritz.box ([2001:a61:5e8:7801:dabb:c1ff:fe6f:aedd])
 by smtp.googlemail.com with ESMTPSA id p2sm11148434wmg.44.2022.01.15.06.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 06:03:51 -0800 (PST)
From: Johannes Schickel <lordhoto@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: add mapping for MSI MPG X570S Carbon Max
 Wifi.
Date: Sat, 15 Jan 2022 15:02:57 +0100
Message-Id: <20220115140257.8751-1-lordhoto@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 16 Jan 2022 09:50:50 +0100
Cc: Andrea Fagiani <andfagiani@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Johannes Schickel <lordhoto@gmail.com>,
 Timo Gurr <timo.gurr@gmail.com>
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

The USB audio device 0db0:419c based on the Realtek ALC4080 chip exposes
all playback volume controls as "PCM". This is makes distinguishing the
individual functions hard.

The added mapping distinguishes all playback volume controls as their
respective function:
 - Speaker              - for back panel output
 - Frontpanel Headphone - for front panel output
 - IEC958               - for digital output on the back panel

This clarifies the individual volume control functions for users.

Signed-off-by: Johannes Schickel <lordhoto@gmail.com>
---
 sound/usb/mixer_maps.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 5d391f62351b..96991ddf5055 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -431,6 +431,14 @@ static const struct usbmix_name_map aorus_master_alc1220vb_map[] = {
 	{}
 };
 
+/* MSI MPG X570S Carbon Max Wifi with ALC4080  */
+static const struct usbmix_name_map msi_mpg_x570s_carbon_max_wifi_alc4080_map[] = {
+	{ 29, "Speaker Playback" },
+	{ 30, "Front Headphone Playback" },
+	{ 32, "IEC958 Playback" },
+	{}
+};
+
 /*
  * Control map entries
  */
@@ -577,6 +585,10 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
 		.map = trx40_mobo_map,
 		.connector_map = trx40_mobo_connector_map,
 	},
+	{	/* MSI MPG X570S Carbon Max Wifi */
+		.id = USB_ID(0x0db0, 0x419c),
+		.map = msi_mpg_x570s_carbon_max_wifi_alc4080_map,
+	},
 	{	/* MSI TRX40 */
 		.id = USB_ID(0x0db0, 0x543d),
 		.map = trx40_mobo_map,
-- 
2.34.1

