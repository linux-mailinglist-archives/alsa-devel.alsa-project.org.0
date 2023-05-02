Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 878186F432A
	for <lists+alsa-devel@lfdr.de>; Tue,  2 May 2023 13:56:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7EDA165F;
	Tue,  2 May 2023 13:56:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7EDA165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683028611;
	bh=qCt6kTMLrPY0RGfaN8bBoXmvjbOiugAoHHjEIBcXOEY=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Z/MiYYClXlwt3Rt98M0milT9T6/jwmWjOT+jGy3FWq51lUi/ePQS0epPvVSrk9Eoi
	 21uSk3zAslrJE414LF8hT+4l4js4pooUCzoJpcT9pnmg+1q/M6HUCCdob6fkTTFyii
	 vJKRjdDolU6Q39WSe6H9T1UmJG+gCuo1Vz6sEy8c=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 393A6F8032B;
	Tue,  2 May 2023 13:56:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4AFDF8049E; Tue,  2 May 2023 13:55:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7BEEFF80114
	for <alsa-devel@alsa-project.org>; Tue,  2 May 2023 13:55:55 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id B736211E2;
	Tue,  2 May 2023 13:55:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz B736211E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1683028553; bh=1mI958yPPhDPPcJ7Z4ZWt8wLKReatfW0myv8PEBJZ3A=;
	h=From:To:Cc:Subject:Date:From;
	b=RnMODiVHF5fGLC1etMj2lb3VCn0ie/SvbeVh26BR2NsLFRTVDeLg80Mcb7pmm5hUh
	 s3tq1/EphLb+A0zWhm+jfcw0QW4BPfw+8gPNR8WQ8qaboRWcy/P2XOPYXiabUwhmHU
	 3OX+ISXRsQY2oyhojHvOify6vx1jALQcPYN1jDso=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue,  2 May 2023 13:55:50 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH] ALSA: uapi: pcm: control the filling of the silence samples
 for drain
Date: Tue,  2 May 2023 13:55:36 +0200
Message-Id: <20230502115536.986900-1-perex@perex.cz>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: M5VQGOENXQN5HRKOJGOTOFLJ6TSBXPV2
X-Message-ID-Hash: M5VQGOENXQN5HRKOJGOTOFLJ6TSBXPV2
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M5VQGOENXQN5HRKOJGOTOFLJ6TSBXPV2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Introduce SNDRV_PCM_INFO_PERFECT_DRAIN and SNDRV_PCM_HW_PARAMS_NO_DRAIN_SILENCE
flags to fully control the filling of the silence samples in the drain ioctl.
Actually, the configurable silencing is going to be implemented in the user
space [1], but drivers (hardware) may not require this operation. Those flags
do the bidirectional setup for this operation:

1) driver may notify the presence of the perfect drain
2) user space may not require the filling of the silence samples to inhibit clicks

If we decide to move this operation to the kernel space in future, the
SNDRV_PCM_INFO_PERFECT_DRAIN flag may handle this situation without
double "silence" processing (user + kernel space).

The ALSA API should be universal, so forcing the behaviour (modifying of
the ring buffer with any samples) for the drain operation is not ideal.

[1] https://lore.kernel.org/alsa-devel/20230502115010.986325-1-perex@perex.cz/

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 include/uapi/sound/asound.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 0aa955aa8246..e4b0f95694c5 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -274,6 +274,7 @@ typedef int __bitwise snd_pcm_subformat_t;
 #define SNDRV_PCM_INFO_DOUBLE		0x00000004	/* Double buffering needed for PCM start/stop */
 #define SNDRV_PCM_INFO_BATCH		0x00000010	/* double buffering */
 #define SNDRV_PCM_INFO_SYNC_APPLPTR	0x00000020	/* need the explicit sync of appl_ptr update */
+#define SNDRV_PCM_INFO_PERFECT_DRAIN	0x00000040	/* silencing at the end of stream is not required */
 #define SNDRV_PCM_INFO_INTERLEAVED	0x00000100	/* channels are interleaved */
 #define SNDRV_PCM_INFO_NONINTERLEAVED	0x00000200	/* channels are not interleaved */
 #define SNDRV_PCM_INFO_COMPLEX		0x00000400	/* complex frame organization (mmap only) */
@@ -383,6 +384,9 @@ typedef int snd_pcm_hw_param_t;
 #define SNDRV_PCM_HW_PARAMS_NORESAMPLE	(1<<0)	/* avoid rate resampling */
 #define SNDRV_PCM_HW_PARAMS_EXPORT_BUFFER	(1<<1)	/* export buffer */
 #define SNDRV_PCM_HW_PARAMS_NO_PERIOD_WAKEUP	(1<<2)	/* disable period wakeups */
+#define SNDRV_PCM_HW_PARAMS_NO_DRAIN_SILENCE	(1<<3)	/* supress drain with the filling
+							 * of the silence samples
+							 */
 
 struct snd_interval {
 	unsigned int min, max;
-- 
2.39.2

