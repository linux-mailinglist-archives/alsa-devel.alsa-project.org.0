Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD352037B4
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 15:17:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB84216C5;
	Mon, 22 Jun 2020 15:16:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB84216C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592831827;
	bh=mWeTDIW67t9jYdpSIhRDV4omjfnAqJZRqUvpLi9jfRA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kchSeBYcQ/Iu3jJCfR/h+K/CgIa1jkXz+mAXTyCkwO0uaKL96GkxrTwkjKMYe2vmH
	 ub40fwhdZE6VQM9KTRAGUdMoUyB0oFuYG6KEsMQmSjPcMl8BqZ/K4/FYzi8sKkz8lm
	 I/AMA74vGtOIrgUoZQKgju9BYGair4HaO8yHC9Jk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9452F8028A;
	Mon, 22 Jun 2020 15:15:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD66FF8028A; Mon, 22 Jun 2020 15:15:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB059F8010E
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 15:15:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB059F8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="TD0ucgs0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=a;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:
 Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uz8hBjt0fgzGPTxt0+OXhBQqBiZWLMciY724Z+W+uw8=; b=TD0ucgs0xMkNj6PMpXHwF/3RID
 YYd50xMS0CIsNCJB+37oUGgS8MjblTL/cz69dG/IhO0GeSsG3YzaTWQ3y1RO3HHZ/T9OFjXkTMyxF
 6K0B9nMNl3LJK2Wn1krLScM7Kx7qSQPrScnub40osv2NEYiYm+aKM8tkcKnSAb4jPCf2yvpmO3kLC
 m7QRUwZpHwpgTyGSAxCzxEoGKvwsckKk70Xrwads8qZZo3bh/EBb+tmYhn5Mjz0szUSQFiUOdp5dF
 bC0eN8sYdGeVAwBLDPtASNQGTVJ4GZb41pzVAd1ZDykDidOiGLwJa2J6hXqebO7pnh4K/MGa/6AWF
 WqeSyByQ==;
Received: from cpc1-hari17-2-0-cust102.20-2.cable.virginm.net ([86.18.4.103]
 helo=stax.localdomain) by jazz.pogo.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94 (FreeBSD))
 (envelope-from <mark@xwax.org>)
 id 1jnMI7-000BwQ-QB; Mon, 22 Jun 2020 14:15:15 +0100
Received: from mark by stax.localdomain with local (Exim 4.84)
 (envelope-from <mark@stax.localdomain>)
 id 1jnMI7-00066S-74; Mon, 22 Jun 2020 14:15:15 +0100
From: Mark Hills <mark@xwax.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 9/9] pcm: Annotate the _avail functions
Date: Mon, 22 Jun 2020 14:15:15 +0100
Message-Id: <20200622131515.23385-9-mark@xwax.org>
X-Mailer: git-send-email 2.17.5
In-Reply-To: <2006221356390.20421@stax.localdomain>
References: <2006221356390.20421@stax.localdomain>
Cc: alsa-devel@alsa-project.org
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

I took time to understand these functions in the context of the
rest of the code, which would have been a lot quicker with a comment
like this.

Signed-off-by: Mark Hills <mark@xwax.org>
---
 src/pcm/pcm_local.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/src/pcm/pcm_local.h b/src/pcm/pcm_local.h
index cf018fc0..aae58ed3 100644
--- a/src/pcm/pcm_local.h
+++ b/src/pcm/pcm_local.h
@@ -480,6 +480,13 @@ static inline int snd_pcm_check_error(snd_pcm_t *pcm, int err)
 	return err;
 }
 
+/**
+ * \retval number of frames available to the application for playback
+ *
+ * This is how far ahead the hardware position in the ring buffer is,
+ * compared to the application position. ie. for playback it's the
+ * number of frames in the empty part of the ring buffer.
+ */
 static inline snd_pcm_uframes_t __snd_pcm_playback_avail(snd_pcm_t *pcm,
 							 const snd_pcm_uframes_t hw_ptr,
 							 const snd_pcm_uframes_t appl_ptr)
@@ -498,6 +505,13 @@ static inline snd_pcm_uframes_t snd_pcm_mmap_playback_avail(snd_pcm_t *pcm)
 	return __snd_pcm_playback_avail(pcm, *pcm->hw.ptr, *pcm->appl.ptr);
 }
 
+/*
+ * \retval number of frames available to the application for capture
+ *
+ * This is how far ahead the hardware position in the ring buffer is
+ * compared to the application position.  ie. for capture, it's the
+ * number of frames in the filled part of the ring buffer.
+ */
 static inline snd_pcm_uframes_t __snd_pcm_capture_avail(snd_pcm_t *pcm,
 							const snd_pcm_uframes_t hw_ptr,
 							const snd_pcm_uframes_t appl_ptr)
@@ -529,11 +543,21 @@ static inline snd_pcm_uframes_t snd_pcm_mmap_avail(snd_pcm_t *pcm)
 	return __snd_pcm_avail(pcm, *pcm->hw.ptr, *pcm->appl.ptr);
 }
 
+/*
+ * \retval number of frames available to the hardware for playback
+ *
+ * ie. the filled part of the ring buffer
+ */
 static inline snd_pcm_sframes_t snd_pcm_mmap_playback_hw_avail(snd_pcm_t *pcm)
 {
 	return pcm->buffer_size - snd_pcm_mmap_playback_avail(pcm);
 }
 
+/*
+ * \retval number of frames available to the hardware for capture
+ *
+ * ie. the empty part of the ring buffer.
+ */
 static inline snd_pcm_sframes_t snd_pcm_mmap_capture_hw_avail(snd_pcm_t *pcm)
 {
 	return pcm->buffer_size - snd_pcm_mmap_capture_avail(pcm);
-- 
2.17.5

