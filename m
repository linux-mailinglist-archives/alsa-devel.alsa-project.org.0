Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8D4711516
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 20:46:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89DC0A4A;
	Thu, 25 May 2023 20:45:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89DC0A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685040367;
	bh=+KXX0pkDVrwxls1xANPzrragmwSQkYYEJj7K5lltQSE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X2W+MoE5yGwfny3oGvnKcoke/+AcDbW3feIXaN4dPtDH3/wqCXYmHMfd4OA4ZGaUE
	 zN020SO8xaObBK+MiMCmEWSDz4fs0wb/M8+bauN3HuawRxdzX1GEEh6t6O3VrWgGEE
	 05Ev7d9qiqP1UwiTCZXYUBswRH0toR3L80awn058=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 580D5F80544; Thu, 25 May 2023 20:45:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF982F8016A;
	Thu, 25 May 2023 20:45:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D44ABF80249; Thu, 25 May 2023 20:45:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D973F8001F
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 20:45:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D973F8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LunbdhyZ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1C45660B8D;
	Thu, 25 May 2023 18:45:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 745A9C433A4;
	Thu, 25 May 2023 18:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685040310;
	bh=+KXX0pkDVrwxls1xANPzrragmwSQkYYEJj7K5lltQSE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LunbdhyZSmW9XTJJRoXV7EfHlPOqJEkpyT5HVcaeZszuWWVWFQwtXsWomQewu6YP5
	 h6+CW2TLQ9bhBidNqq4GB0Ur7AX5XJdXWJK/Ib7YGeIQvwBbBcl/7WZ07ixI/moRrJ
	 q/+0QsO7qDUDNT9VbzZnHdwHbrwD82nP/q+LC2AqOtzq9nbJRfiIx2ddbeLNOxqgWO
	 V8je1sWXcMFE23gSjPNKC+SCl7k0CDgg3sUG4a+33r8HrhwYKHzWSmAmsqouWIFKoZ
	 41UyV63EYSagRwqpaIa9uutO81s0s5IcWS6S9XJxt9xldoi6EfrLNwpotuxpfMwSh7
	 XOhYGvv429lFQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Takashi Iwai <tiwai@suse.de>,
	Sasha Levin <sashal@kernel.org>,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 4.19 25/27] ALSA: oss: avoid missing-prototype
 warnings
Date: Thu, 25 May 2023 14:43:51 -0400
Message-Id: <20230525184356.1974216-25-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525184356.1974216-1-sashal@kernel.org>
References: <20230525184356.1974216-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7ZNV57FTCUTWSIKFPDHZZBK5E34CNNKB
X-Message-ID-Hash: 7ZNV57FTCUTWSIKFPDHZZBK5E34CNNKB
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7ZNV57FTCUTWSIKFPDHZZBK5E34CNNKB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

[ Upstream commit 040b5a046a9e18098580d3ccd029e2318fca7859 ]

Two functions are defined and used in pcm_oss.c but also optionally
used from io.c, with an optional prototype. If CONFIG_SND_PCM_OSS_PLUGINS
is disabled, this causes a warning as the functions are not static
and have no prototype:

sound/core/oss/pcm_oss.c:1235:19: error: no previous prototype for 'snd_pcm_oss_write3' [-Werror=missing-prototypes]
sound/core/oss/pcm_oss.c:1266:19: error: no previous prototype for 'snd_pcm_oss_read3' [-Werror=missing-prototypes]

Avoid this by making the prototypes unconditional.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/r/20230516195046.550584-2-arnd@kernel.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/core/oss/pcm_plugin.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/core/oss/pcm_plugin.h b/sound/core/oss/pcm_plugin.h
index c9cd29d86efda..64a2057aa0610 100644
--- a/sound/core/oss/pcm_plugin.h
+++ b/sound/core/oss/pcm_plugin.h
@@ -156,6 +156,14 @@ int snd_pcm_area_copy(const struct snd_pcm_channel_area *src_channel,
 
 void *snd_pcm_plug_buf_alloc(struct snd_pcm_substream *plug, snd_pcm_uframes_t size);
 void snd_pcm_plug_buf_unlock(struct snd_pcm_substream *plug, void *ptr);
+#else
+
+static inline snd_pcm_sframes_t snd_pcm_plug_client_size(struct snd_pcm_substream *handle, snd_pcm_uframes_t drv_size) { return drv_size; }
+static inline snd_pcm_sframes_t snd_pcm_plug_slave_size(struct snd_pcm_substream *handle, snd_pcm_uframes_t clt_size) { return clt_size; }
+static inline int snd_pcm_plug_slave_format(int format, const struct snd_mask *format_mask) { return format; }
+
+#endif
+
 snd_pcm_sframes_t snd_pcm_oss_write3(struct snd_pcm_substream *substream,
 				     const char *ptr, snd_pcm_uframes_t size,
 				     int in_kernel);
@@ -166,14 +174,6 @@ snd_pcm_sframes_t snd_pcm_oss_writev3(struct snd_pcm_substream *substream,
 snd_pcm_sframes_t snd_pcm_oss_readv3(struct snd_pcm_substream *substream,
 				     void **bufs, snd_pcm_uframes_t frames);
 
-#else
-
-static inline snd_pcm_sframes_t snd_pcm_plug_client_size(struct snd_pcm_substream *handle, snd_pcm_uframes_t drv_size) { return drv_size; }
-static inline snd_pcm_sframes_t snd_pcm_plug_slave_size(struct snd_pcm_substream *handle, snd_pcm_uframes_t clt_size) { return clt_size; }
-static inline int snd_pcm_plug_slave_format(int format, const struct snd_mask *format_mask) { return format; }
-
-#endif
-
 #ifdef PLUGIN_DEBUG
 #define pdprintf(fmt, args...) printk(KERN_DEBUG "plugin: " fmt, ##args)
 #else
-- 
2.39.2

