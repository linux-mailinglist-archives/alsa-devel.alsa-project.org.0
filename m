Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE85A3E036
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2025 17:16:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3CD06030D;
	Thu, 20 Feb 2025 17:16:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3CD06030D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1740068196;
	bh=Kz2vKX/s2pjV0F8lpMN1zrqeG9TVl5tlG5+9BI52XZo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gR323EO3Kv5aZ7A7zHR1lRrYgdGvyCureDb/DA76JqYc92n49El1j7uLySsbcQ4iX
	 pvXoUUJgZb5rXZE2AkJRsy77F0TxuHBn7eQaW8V2iXlhmMAV0hcG2/q0hnAwOQMkaB
	 OCZ3qIQxDoI38YiT0sb/J1GkI6zV4bzIoU5K+yg0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2331DF805BD; Thu, 20 Feb 2025 17:16:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76311F805BD;
	Thu, 20 Feb 2025 17:16:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AAAB7F8032D; Thu, 20 Feb 2025 17:15:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mail.d-sys.org (70-31-180-213.sta.estpak.ee [213.180.31.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37530F80016
	for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2025 17:15:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37530F80016
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=d-systems.ee header.i=@d-systems.ee header.a=rsa-sha256
 header.s=mail header.b=vqUbcWqq
Received: from mail.d-sys.org (localhost [127.0.0.1])
	by mail.d-sys.org (Postfix) with ESMTP id 8301560A53;
	Thu, 20 Feb 2025 18:15:42 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=d-systems.ee; s=mail;
	t=1740068142; bh=Kz2vKX/s2pjV0F8lpMN1zrqeG9TVl5tlG5+9BI52XZo=;
	h=From:To:Cc:Subject:Date;
	b=vqUbcWqqT2Z05kJC4FXQoGSpX1q739W1XwN5R9DTiEKOiUWh6BZLPHRb8OPttqTaW
	 cFurft6FwlvcbSDwyOXS9G8j3Nn7aq+Yxb0aB4aHwW4YZ0iUPzkobUUwPJynkh126S
	 7hJisI0uC+6kSTaQv03H88TBbQUsYYK/ELiOi8JmryB1Hdx6HNroOMERJIAOLZZRHD
	 i8YyBFIvBBMIXlVHm8QRP9K44nWZxa8ei7YSH9sTEw3xELmzEJqgYJesZO0eaRfacg
	 J8mab9LL9AfSYMGj7XQQLnSRk76U/M6ZFR9UF8er2w3UorNzJMxBpBWcFku/OZ4ZMM
	 lPJptI5mTFR1Q==
Received: from WSMF.dh (unknown [10.255.0.244])
	by mail.d-sys.org (Postfix) with ESMTP id 70AD96097F;
	Thu, 20 Feb 2025 18:15:42 +0200 (EET)
From: Dmitry Panchenko | d-Systems <dmitry@d-systems.ee>
To: alsa-devel@alsa-project.org
Cc: Dmitry Panchenko <dmitry@d-systems.ee>
Subject: [PATCH] ALSA: usb-audio: Re-add sample rate quirk for Pioneer
 DJM-900NXS2
Date: Thu, 20 Feb 2025 18:15:37 +0200
Message-ID: <20250220161540.3624660-1-dmitry@d-systems.ee>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP
Message-ID-Hash: IMU3R2GL2454M3Q3W4XCXP7MWTECYRVI
X-Message-ID-Hash: IMU3R2GL2454M3Q3W4XCXP7MWTECYRVI
X-MailFrom: dmitry@d-systems.ee
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IMU3R2GL2454M3Q3W4XCXP7MWTECYRVI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Dmitry Panchenko <dmitry@d-systems.ee>

Re-add the sample-rate quirk for the Pioneer DJM-900NXS2. This
device does not not work without setting sample-rate.

Signed-off-by: Dmitry Panchenko <dmitry@d-systems.ee>
---
 sound/usb/quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index a97efb7b131e..09210fb4ac60 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1868,6 +1868,7 @@ void snd_usb_set_format_quirk(struct snd_usb_substream *subs,
 	case USB_ID(0x534d, 0x2109): /* MacroSilicon MS2109 */
 		subs->stream_offset_adj = 2;
 		break;
+	case USB_ID(0x2b73, 0x000a): /* Pioneer DJM-900NXS2 */
 	case USB_ID(0x2b73, 0x0013): /* Pioneer DJM-450 */
 		pioneer_djm_set_format_quirk(subs, 0x0082);
 		break;
-- 
2.43.0

