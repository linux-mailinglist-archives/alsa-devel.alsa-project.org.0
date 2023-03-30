Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 931E36D06C7
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Mar 2023 15:32:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0B6E3E7;
	Thu, 30 Mar 2023 15:31:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0B6E3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680183144;
	bh=N+UPhvXmPsIz/3IaFG6nmi9etuye8S3wLmyHedObTRk=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RFboFs7SJJ4IJkNP7AuM4BE24eiNBgy90ugbSDBRNhpIFo5peUVTuoSBGWIm4WE+2
	 XtcRX1yeA9VMzqJNyBrszvkXpoewesmii8fbTAAkY7zPsXzoSDOQkSYtn+BN8ms93o
	 /kNpUOGOPPLg67gwEMYswqTB9hQGH5c19IoEp3tM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD521F80533;
	Thu, 30 Mar 2023 15:31:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82FD5F80272; Thu, 30 Mar 2023 15:28:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0416BF8021D
	for <alsa-devel@alsa-project.org>; Thu, 30 Mar 2023 15:28:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0416BF8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=tOHghr+6;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=4FhjhgiH
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4B61221A4E;
	Thu, 30 Mar 2023 13:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1680182930; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=9nukpsQfQFmwJK+nduUX7Xc92irN89tfsOYnRlNJhRA=;
	b=tOHghr+6Fb1AGoYD5QS3GUqT/EENVdw6G3tJMkl7vi9B+tZ+5tRY54cFtrToG3dy7qx0hX
	QTXuvDQkgylABKQNgfDgwb3iuZzB3hTMAwOMIcR5rz7TSX4ErZ7RCzjpwf9I5sJVzWYxlf
	7o0Tp4Sp7mylS9x/HZnkkBtxfjMzPgo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680182930;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=9nukpsQfQFmwJK+nduUX7Xc92irN89tfsOYnRlNJhRA=;
	b=4FhjhgiHA7asWDYLRn76u2D0GUfsfgO2eRVEMve1kRzG5J7WOdstky7ks/+FnMPFtJ0Vhv
	KqVx9M14YGSi7lDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2FF161348E;
	Thu, 30 Mar 2023 13:28:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id PaMGC5KOJWTgCQAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 30 Mar 2023 13:28:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: ac97: Define dummy functions for snd_ac97_suspend() and
 resume()
Date: Thu, 30 Mar 2023 15:28:47 +0200
Message-Id: <20230330132847.12882-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LVMOWRUAMP2VKFY7U4D2VX242ZYZ3NZD
X-Message-ID-Hash: LVMOWRUAMP2VKFY7U4D2VX242ZYZ3NZD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LVMOWRUAMP2VKFY7U4D2VX242ZYZ3NZD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For allowing the build without CONFIG_PM, add definitions of dummy
functions for snd_ac97_suspend() and snd_ac97_resume() without
CONFIG_PM, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/ac97_codec.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/sound/ac97_codec.h b/include/sound/ac97_codec.h
index 49200ec26dc4..c495c6d5fbe0 100644
--- a/include/sound/ac97_codec.h
+++ b/include/sound/ac97_codec.h
@@ -335,6 +335,9 @@ static inline int snd_ac97_update_power(struct snd_ac97 *ac97, int reg,
 #ifdef CONFIG_PM
 void snd_ac97_suspend(struct snd_ac97 *ac97);
 void snd_ac97_resume(struct snd_ac97 *ac97);
+#else
+static inline void snd_ac97_suspend(struct snd_ac97 *ac97) {}
+static inline void snd_ac97_resume(struct snd_ac97 *ac97) {}
 #endif
 int snd_ac97_reset(struct snd_ac97 *ac97, bool try_warm, unsigned int id,
 	unsigned int id_mask);
-- 
2.35.3

