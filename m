Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B756C600A
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 07:54:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19FA3ED9;
	Thu, 23 Mar 2023 07:54:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19FA3ED9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679554493;
	bh=xUMXMcJ0y6HcNVGe6ccqmKmvRprZG3PMML60AvdQP0s=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=lO4AIded75d7tO0dMy2xrhc3MEa2k4DYwowptWAtNnMx7UHctNn4jQt5jQhLwD84x
	 ucsr79WgzwZkFT2PD+9ClTYqh5Yqe1JoUb6nBwFr9U0OJnUUe98fiPMK2ZkDRAgBqI
	 HBlt24UcuU2X/XFulRikTg/jX34SY13nXTYBCb5Q=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A027AF80534;
	Thu, 23 Mar 2023 07:52:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53EDBF804B1; Thu, 23 Mar 2023 07:52:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3BAE6F804B1
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 07:52:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BAE6F804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=xqk5w9e7;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=s+szM6H0
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 68699343D6;
	Thu, 23 Mar 2023 06:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1679554363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=la69nbGyKIu8Re0yRxWaK1dihnrS3qIKPsKGsLWm2h4=;
	b=xqk5w9e7bCQnaBENC21fc3dD4FwAFFKm6I8N4AaH1f4oJmtHXyI1HDpRBrtzGwEwSq5k95
	/Aw8XNjOvr7xWFprcZbDiC77/AylR0LvSJsPdfLhsCArnNN4I+FBd2BgLtON7JsyX05xy9
	vmXBQcNape2RZqt4fDW2r7B2OUEuR8g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1679554363;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=la69nbGyKIu8Re0yRxWaK1dihnrS3qIKPsKGsLWm2h4=;
	b=s+szM6H01vrmKf6yq9P/dA8ZB4Btoap2ayryxdtMiV8DkkaE6K/sYG5fNSloZHrTfKRdfc
	e29TLylQ6qu2GpDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 41DBB13596;
	Thu, 23 Mar 2023 06:52:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id qCNXDzv3G2QJcQAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 23 Mar 2023 06:52:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ALSA: docs: A few more words for PCM XRUN handling and
 stream locks
Date: Thu, 23 Mar 2023 07:52:37 +0100
Message-Id: <20230323065237.5062-4-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230323065237.5062-1-tiwai@suse.de>
References: <20230323065237.5062-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XFZM74HJUMM24VKJEAS743HZ7QSMG7RY
X-Message-ID-Hash: XFZM74HJUMM24VKJEAS743HZ7QSMG7RY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XFZM74HJUMM24VKJEAS743HZ7QSMG7RY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Enhance the documents about the PCM, missing descriptions for a couple
of helpers like snd_pcm_period_elapsed_under_stream_lock() and
snd_pcm_stop_xrun().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 .../kernel-api/writing-an-alsa-driver.rst      | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
index 6b8f3495407f..a368529e8ed3 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -2215,6 +2215,12 @@ Typical code would be like:
               return IRQ_HANDLED;
       }
 
+Also, when the device can detect a buffer underrun/overrun, the driver
+can notify the XRUN status to the PCM core by calling
+:c:func:`snd_pcm_stop_xrun()`. This function stops the stream and sets
+the PCM state to ``SNDRV_PCM_STATE_XRUN``. Note that it must be called
+outside the PCM stream lock, hence it can't be called from the atomic
+callback.
 
 
 High frequency timer interrupts
@@ -2294,8 +2300,9 @@ mutexes or semaphores instead.
 As already seen, some pcm callbacks are atomic and some are not. For
 example, the ``hw_params`` callback is non-atomic, while ``trigger``
 callback is atomic. This means, the latter is called already in a
-spinlock held by the PCM middle layer. Please take this atomicity into
-account when you choose a locking scheme in the callbacks.
+spinlock held by the PCM middle layer, the PCM stream lock. Please
+take this atomicity into account when you choose a locking scheme in
+the callbacks.
 
 In the atomic callbacks, you cannot use functions which may call
 :c:func:`schedule()` or go to :c:func:`sleep()`. Semaphores and
@@ -2318,6 +2325,13 @@ in the PCM core instead of spin and rwlocks, so that you can call all PCM
 functions safely in a non-atomic
 context.
 
+Also, in some cases, you might need to call
+:c:func:`snd_pcm_period_elapsed()` in the atomic context (e.g. the
+period gets elapsed during ``ack`` or other callback). There is a
+variant that can be called inside the PCM stream lock
+:c:func:`snd_pcm_period_elapsed_under_stream_lock()` for that purpose,
+too.
+
 Constraints
 -----------
 
-- 
2.35.3

