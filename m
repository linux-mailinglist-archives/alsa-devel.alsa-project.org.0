Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA68AD856B
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jun 2025 10:23:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6164F601F9;
	Fri, 13 Jun 2025 10:23:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6164F601F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749803039;
	bh=niW1Z5/2R05MmPnD4eCTnKvr4c0P3IfHZsdwsFaDST0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=p028z9L0sZIUpBF16Q4sDpa81/xRKAnfHIO36lGbnpmQJ+YN9Q+u668WjGf3ZGE1d
	 KuSe8JA1M/gCBylxeKG4cBYJ7sjeTE1LjTaHd6EwKfCr0TAzAkVb8XbJj/hXJHJ215
	 T9KVFbGVOfZhWUrCwvwwbO4mJ4xRRX0kDLjvDvjw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E67C5F805C3; Fri, 13 Jun 2025 10:23:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D04F8F805B3;
	Fri, 13 Jun 2025 10:23:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D90AF80424; Fri, 13 Jun 2025 08:37:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C668F80075
	for <alsa-devel@alsa-project.org>; Fri, 13 Jun 2025 08:36:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C668F80075
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=SL9wuNi9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=4Z
	4Zk6gFMiiiZCc+KOTwsC9S+QK7pJWpmIYxo8X11Ys=; b=SL9wuNi92DVR4EZZg1
	AcrmdZhnTbCzkePXev9RZ2c9A4mBcPkVyZR1r5Sd5MfJTFIPW6EX4VxC2qGqCgQ9
	RfeqOC/NB3B0M5+S9bc7pgO5LMBRTMM7sNgfOzVP4G91LJOuOwrgi142L1QFaBgt
	Vaad342x3Z0IHqsY5D11Yb1zo=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgCXdSQGx0togsW6Bg--.7897S2;
	Fri, 13 Jun 2025 14:36:55 +0800 (CST)
From: wangdicheng <wangdich9700@163.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH] ALSA: usb-audio: Rename ALSA kcontrol PCM and PCM1 for the
 KTMicro sound card
Date: Fri, 13 Jun 2025 14:36:36 +0800
Message-Id: <20250613063636.239683-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgCXdSQGx0togsW6Bg--.7897S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr45AryrAF1UtrWfXr4fXwb_yoWkAwb_Ja
	1Y9FW7AF15GFy3AFy7KF1ava4vyay7uasFgF98tryDta4Dtw1UAr42yF1kZFyqgrZ3JFy3
	J3WDtr1S9a47JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbl_MDUUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/1S2mRwBrT2hLxekfZwAAsU
X-MailFrom: wangdich9700@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RRQL327GUYG2ZQLZBZGXU5ZXKHQGVDDM
X-Message-ID-Hash: RRQL327GUYG2ZQLZBZGXU5ZXKHQGVDDM
X-Mailman-Approved-At: Fri, 13 Jun 2025 08:23:23 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RRQL327GUYG2ZQLZBZGXU5ZXKHQGVDDM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: wangdicheng <wangdicheng@kylinos.cn>

PCM1 not in Pulseaudio's control list;standardize control to "Speaker"and"Headphone"

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/usb/mixer_maps.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 0e9b5431a47f..faac7df1fbcf 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -383,6 +383,13 @@ static const struct usbmix_name_map ms_usb_link_map[] = {
 	{ 0 }   /* terminator */
 };
 
+/* KTMicro USB */
+static struct usbmix_name_map s31b2_0022_map[] = {
+	{ 23, "Speaker Playback" },
+	{ 18, "Headphone Playback" },
+	{ 0 }
+};
+
 /* ASUS ROG Zenith II with Realtek ALC1220-VB */
 static const struct usbmix_name_map asus_zenith_ii_map[] = {
 	{ 19, NULL, 12 }, /* FU, Input Gain Pad - broken response, disabled */
@@ -692,6 +699,11 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
 		.id = USB_ID(0x045e, 0x083c),
 		.map = ms_usb_link_map,
 	},
+	{
+		/* KTMicro USB */
+		.id = USB_ID(0X31b2, 0x0022),
+		.map = s31b2_0022_map,
+	},
 	{ 0 } /* terminator */
 };
 
-- 
2.25.1

