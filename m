Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC442E0C45
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Dec 2020 15:59:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97A8316F2;
	Tue, 22 Dec 2020 15:58:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97A8316F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608649187;
	bh=NSz6+iByvAfYjsaQMWvCLpIU3gZpHyhHqp0N8MdDX5M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hoGTR3QyOwgRvT02K4PClspyQe/TzhrfBI/k1NzJED1L+D3YgiAMTctzNDLutk5Ze
	 Iv7GASNKeA56DvHJzOnSEYts8dXLesraArxKdGs8fdJEIxAth1HkgaNN1A4uWGGOkg
	 TKgntLXT22KErwdNc+Y01u9C3y7mvF7d9XLUrvDs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37FDCF80264;
	Tue, 22 Dec 2020 15:58:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 123D4F80264; Tue, 22 Dec 2020 15:58:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ns4.inleed.net (mailout4.inleed.net
 [IPv6:2a0b:dc80:cafe:104::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFCA3F80232
 for <alsa-devel@alsa-project.org>; Tue, 22 Dec 2020 15:58:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFCA3F80232
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=diwic.se header.i=@diwic.se
 header.b="Plz+/TET"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=diwic.se;
 s=x; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Mbklorwlc4Pzgs74b9AZxhoXGQZM101QXiRy1oGM+m8=; b=Plz+/TET1vWAds7+wa3pJFQCbq
 jKU5A4PdQTLUIIgem/4tvdFtCRzsrnRDAjnOJoGWkdr3ag9IEpShm0zrcPEjMv002kdU0Y09Klew6
 OVohoEadnMijVQViFpYDHhePcJT5520/vU25eFxD+tFd0jKWuCKuh1vn6E8bSPiLakVzIa/evAJwP
 9Us/TRE200mvRYTgCYJS8/rQdIwPKIkGBPAbK9LHCPghNX0PURvwEBx8z71XkFOikCdK57CQjL3bQ
 mPnWOiOpT5xKqb7XwShHIzW6XgrgDB2OpON36+1jh2d3fZbkR5GzUuBcS14t0pVR3d+s/78GY6iOr
 /WR5z0gQ==;
Received: from c83-254-143-147.bredband.comhem.se ([83.254.143.147]
 helo=localhost.localdomain)
 by ns4.inleed.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <coding@diwic.se>)
 id 1krj6q-00FQMk-4f; Tue, 22 Dec 2020 15:57:56 +0100
From: David Henningsson <coding@diwic.se>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH 1/2] pcm: Add snd_pcm_audio_tstamp_type_t constants
Date: Tue, 22 Dec 2020 15:57:27 +0100
Message-Id: <20201222145728.9368-2-coding@diwic.se>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201222145728.9368-1-coding@diwic.se>
References: <20201222145728.9368-1-coding@diwic.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: coding@diwic.se
Cc: David Henningsson <coding@diwic.se>, Alex Moon <alex.r.moon@gmail.com>
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

These are mostly a copy-paste from the kernel headers. But since functions
snd_pcm_audio_tstamp_config make use of these they should be added to the
public API as well.

Reported-by: Alex Moon <alex.r.moon@gmail.com>
Signed-off-by: David Henningsson <coding@diwic.se>
---
 include/pcm.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/pcm.h b/include/pcm.h
index 5b078231..cf1eea8b 100644
--- a/include/pcm.h
+++ b/include/pcm.h
@@ -350,6 +350,20 @@ typedef enum _snd_pcm_tstamp_type {
 	SND_PCM_TSTAMP_TYPE_LAST = SND_PCM_TSTAMP_TYPE_MONOTONIC_RAW,
 } snd_pcm_tstamp_type_t;
 
+typedef enum _snd_pcm_audio_tstamp_type {
+	/**
+	 * first definition for backwards compatibility only,
+	 * maps to wallclock/link time for HDAudio playback and DEFAULT/DMA time for everything else
+	 */
+	SND_PCM_AUDIO_TSTAMP_TYPE_COMPAT = 0,
+	SND_PCM_AUDIO_TSTAMP_TYPE_DEFAULT = 1,           /**< DMA time, reported as per hw_ptr */
+	SND_PCM_AUDIO_TSTAMP_TYPE_LINK = 2,	           /**< link time reported by sample or wallclock counter, reset on startup */
+	SND_PCM_AUDIO_TSTAMP_TYPE_LINK_ABSOLUTE = 3,	   /**< link time reported by sample or wallclock counter, not reset on startup */
+	SND_PCM_AUDIO_TSTAMP_TYPE_LINK_ESTIMATED = 4,    /**< link time estimated indirectly */
+	SND_PCM_AUDIO_TSTAMP_TYPE_LINK_SYNCHRONIZED = 5, /**< link time synchronized with system time */
+	SND_PCM_AUDIO_TSTAMP_TYPE_LAST = SNDRV_PCM_AUDIO_TSTAMP_TYPE_LINK_SYNCHRONIZED
+} snd_pcm_audio_tstamp_type_t;
+
 typedef struct _snd_pcm_audio_tstamp_config {
 	/* 5 of max 16 bits used */
 	unsigned int type_requested:4;
-- 
2.25.1

