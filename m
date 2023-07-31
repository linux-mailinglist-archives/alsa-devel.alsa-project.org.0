Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98305769B2D
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 17:49:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9648851;
	Mon, 31 Jul 2023 17:48:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9648851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690818587;
	bh=TRCefZNHPU+1f+aJGXvpnU6eA2xR6gPHC7il7u4ioBU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dpcYh6/pvK3wM41XrYCcSabWOKNP0uzKZhG8gktlzg7sj14FGZefTep9YmqkZdPgb
	 +q2WeOTqVySaXjYTyyZZr+lQcy79QfYWcuBBqT5H/REnKrw2Wm6TLdoSjDeH67BHtH
	 eEpkYWQbK6iXW51HSYSuIWL2lK3WBN7eV8PhI50I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59B77F805B2; Mon, 31 Jul 2023 17:47:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A9317F805AB;
	Mon, 31 Jul 2023 17:47:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F144F80578; Mon, 31 Jul 2023 17:47:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5FCEF80548
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 17:47:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5FCEF80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=XcQDLg3p;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Jn9017XR
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 386AC221D4;
	Mon, 31 Jul 2023 15:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690818445;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NhGyuv2QhrKeVLN8MkQSIrUPA/3JOG2HNobZuqC2b+g=;
	b=XcQDLg3pzr9Mduz9XSyUAYHSUSUOM3ObwocxMQpBKDu3ahXkSH8uUL1/iA1Y5xBEq4fqd1
	2mJ1YqzkePd+3Sh3LNjGg5wUZ3eMrlV4FRveiJdEZrR8N2uM547B15G5cnlPAWM5GusFdV
	VkEIQWIau03s5SXkUrEo0aQq/STCqa4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690818445;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NhGyuv2QhrKeVLN8MkQSIrUPA/3JOG2HNobZuqC2b+g=;
	b=Jn9017XRBwJhdjBGdpeFGQ+Ue3EAIvNhSoBrDxhgc8hTGbO4u0JPWM9oWIagSzg2JkOMh7
	y90wW4VqgITSh1Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1D0A1138EE;
	Mon, 31 Jul 2023 15:47:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id YJ48Bo3Xx2Q3fwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 31 Jul 2023 15:47:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 11/24] ALSA: hdsp: Convert to generic PCM copy ops
Date: Mon, 31 Jul 2023 17:47:05 +0200
Message-Id: <20230731154718.31048-12-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230731154718.31048-1-tiwai@suse.de>
References: <20230731154718.31048-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PMOPRAWX5L2A4BT2HGQGVA7MSLAQKOZQ
X-Message-ID-Hash: PMOPRAWX5L2A4BT2HGQGVA7MSLAQKOZQ
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PMOPRAWX5L2A4BT2HGQGVA7MSLAQKOZQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch converts the hdsp driver code to use the new unified PCM
copy callback.  It's a straightforward conversion from *_user() to
*_sockptr() variants.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme9652/hdsp.c | 42 ++++++----------------------------------
 1 file changed, 6 insertions(+), 36 deletions(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index 65add92c88aa..6d8410ea4244 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -3961,7 +3961,7 @@ static signed char *hdsp_channel_buffer_location(struct hdsp *hdsp,
 
 static int snd_hdsp_playback_copy(struct snd_pcm_substream *substream,
 				  int channel, unsigned long pos,
-				  void __user *src, unsigned long count)
+				  sockptr_t src, unsigned long count)
 {
 	struct hdsp *hdsp = snd_pcm_substream_chip(substream);
 	signed char *channel_buf;
@@ -3972,28 +3972,14 @@ static int snd_hdsp_playback_copy(struct snd_pcm_substream *substream,
 	channel_buf = hdsp_channel_buffer_location (hdsp, substream->pstr->stream, channel);
 	if (snd_BUG_ON(!channel_buf))
 		return -EIO;
-	if (copy_from_user(channel_buf + pos, src, count))
+	if (copy_from_sockptr(channel_buf + pos, src, count))
 		return -EFAULT;
 	return 0;
 }
 
-static int snd_hdsp_playback_copy_kernel(struct snd_pcm_substream *substream,
-					 int channel, unsigned long pos,
-					 void *src, unsigned long count)
-{
-	struct hdsp *hdsp = snd_pcm_substream_chip(substream);
-	signed char *channel_buf;
-
-	channel_buf = hdsp_channel_buffer_location(hdsp, substream->pstr->stream, channel);
-	if (snd_BUG_ON(!channel_buf))
-		return -EIO;
-	memcpy(channel_buf + pos, src, count);
-	return 0;
-}
-
 static int snd_hdsp_capture_copy(struct snd_pcm_substream *substream,
 				 int channel, unsigned long pos,
-				 void __user *dst, unsigned long count)
+				 sockptr_t dst, unsigned long count)
 {
 	struct hdsp *hdsp = snd_pcm_substream_chip(substream);
 	signed char *channel_buf;
@@ -4004,25 +3990,11 @@ static int snd_hdsp_capture_copy(struct snd_pcm_substream *substream,
 	channel_buf = hdsp_channel_buffer_location (hdsp, substream->pstr->stream, channel);
 	if (snd_BUG_ON(!channel_buf))
 		return -EIO;
-	if (copy_to_user(dst, channel_buf + pos, count))
+	if (copy_to_sockptr(dst, channel_buf + pos, count))
 		return -EFAULT;
 	return 0;
 }
 
-static int snd_hdsp_capture_copy_kernel(struct snd_pcm_substream *substream,
-					int channel, unsigned long pos,
-					void *dst, unsigned long count)
-{
-	struct hdsp *hdsp = snd_pcm_substream_chip(substream);
-	signed char *channel_buf;
-
-	channel_buf = hdsp_channel_buffer_location(hdsp, substream->pstr->stream, channel);
-	if (snd_BUG_ON(!channel_buf))
-		return -EIO;
-	memcpy(dst, channel_buf + pos, count);
-	return 0;
-}
-
 static int snd_hdsp_hw_silence(struct snd_pcm_substream *substream,
 			       int channel, unsigned long pos,
 			       unsigned long count)
@@ -4950,8 +4922,7 @@ static const struct snd_pcm_ops snd_hdsp_playback_ops = {
 	.prepare =	snd_hdsp_prepare,
 	.trigger =	snd_hdsp_trigger,
 	.pointer =	snd_hdsp_hw_pointer,
-	.copy_user =	snd_hdsp_playback_copy,
-	.copy_kernel =	snd_hdsp_playback_copy_kernel,
+	.copy =		snd_hdsp_playback_copy,
 	.fill_silence =	snd_hdsp_hw_silence,
 };
 
@@ -4963,8 +4934,7 @@ static const struct snd_pcm_ops snd_hdsp_capture_ops = {
 	.prepare =	snd_hdsp_prepare,
 	.trigger =	snd_hdsp_trigger,
 	.pointer =	snd_hdsp_hw_pointer,
-	.copy_user =	snd_hdsp_capture_copy,
-	.copy_kernel =	snd_hdsp_capture_copy_kernel,
+	.copy =		snd_hdsp_capture_copy,
 };
 
 static int snd_hdsp_create_hwdep(struct snd_card *card, struct hdsp *hdsp)
-- 
2.35.3

