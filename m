Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C94CD6AF7D5
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 22:42:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC59A15B1;
	Tue,  7 Mar 2023 22:41:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC59A15B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678225328;
	bh=/AJxUHLBNkIXMqqlDW3RXr9CiYtLgIGonmvd3qOFEvI=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UIAYNxC9AyOhnTi0HaNjMXaqrd+FFvrOTls2cn0NkIDGh+p66dujMWUoT6NQ4TLij
	 QoOvlxspp+Z0mDoWilECFS8qDQ2X/31J7ZiuL6W2CL7MdiY7OGQTZrI4arRbSI7B9K
	 Vvzc6XPXMhNk7H+7Limbh6Ot/8Wi160MRUnbjtdw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F21CCF80236;
	Tue,  7 Mar 2023 22:41:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59385F8042F; Tue,  7 Mar 2023 22:41:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8FEB4F800DF
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 22:41:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FEB4F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QZMN8Yj+
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 60E9CB81987;
	Tue,  7 Mar 2023 21:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2924C433EF;
	Tue,  7 Mar 2023 21:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678225259;
	bh=/AJxUHLBNkIXMqqlDW3RXr9CiYtLgIGonmvd3qOFEvI=;
	h=From:To:Cc:Subject:Date:From;
	b=QZMN8Yj+yCOMk33J+lBwsYw6nmd0dy416jCkWsOsdaHGSmGr72EZ4Mg2yQ6N5vVMd
	 ScO2mKZpgip3EdbqazAL8G2FX2KbLVpbsN7XaZwomaiF7+kxvAuVL7FnNu8sYsDut0
	 zdPKVG12O+831cXhCdqNFZ0miEkc+0bPVDyu17uRCeNB7WMgzmAoYNxQMcpQuiMrv6
	 39WbAjit7hf5ia1+9OPJGbtelnreyOxj6N7v4wZw7g+FMIG/lZw1c5q2xTYCzzBz9p
	 pNdfMV9x2OsO2Rk8nMxW+EI1R8nSLtQzmivetrGZ6XsU6sWr10R2I8GGZHpvWvNhg0
	 HAcN9JgLd1Hig==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: hda: Match only Intel devices with CONTROLLER_IN_GPU()
Date: Tue,  7 Mar 2023 15:40:54 -0600
Message-Id: <20230307214054.886721-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CRKV3LIOJHJIY2RVD3ROZLIAN22IURWW
X-Message-ID-Hash: CRKV3LIOJHJIY2RVD3ROZLIAN22IURWW
X-MailFrom: helgaas@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CRKV3LIOJHJIY2RVD3ROZLIAN22IURWW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bjorn Helgaas <bhelgaas@google.com>

CONTROLLER_IN_GPU() is clearly intended to match only Intel devices, but
previously it checked only the PCI Device ID, not the Vendor ID, so it
could match devices from other vendors that happened to use the same Device
ID.

Update CONTROLLER_IN_GPU() so it matches only Intel devices.

Fixes: 535115b5ff51 ("ALSA: hda - Abort the probe without i915 binding for HSW/B")
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 sound/pci/hda/hda_intel.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 81c4a45254ff..77a592f21947 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -328,14 +328,15 @@ enum {
 #define needs_eld_notify_link(chip)	false
 #endif
 
-#define CONTROLLER_IN_GPU(pci) (((pci)->device == 0x0a0c) || \
+#define CONTROLLER_IN_GPU(pci) (((pci)->vendor == 0x8086) &&         \
+				       (((pci)->device == 0x0a0c) || \
 					((pci)->device == 0x0c0c) || \
 					((pci)->device == 0x0d0c) || \
 					((pci)->device == 0x160c) || \
 					((pci)->device == 0x490d) || \
 					((pci)->device == 0x4f90) || \
 					((pci)->device == 0x4f91) || \
-					((pci)->device == 0x4f92))
+					((pci)->device == 0x4f92)))
 
 #define IS_BXT(pci) ((pci)->vendor == 0x8086 && (pci)->device == 0x5a98)
 
-- 
2.25.1

