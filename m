Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 204C778C65F
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 15:45:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DA50825;
	Tue, 29 Aug 2023 15:44:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DA50825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693316710;
	bh=SkormG+H1rbI3alme52IsQCdZFg7GN89pQnpuyXIorc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vZ0KZPoZSIbZLwfZaAP9gHHOUzhJFxWjcd9RdUbsB3ptOdRZoMBHbcXH8eyeqiHFX
	 Nga7p4eQU6qbZwnIm1Pt9eSkdpNasPDEe50EcjVfx9l4mtpnGiZ6vsc0nLR9wrBDO7
	 sk4LAM2UQqNH7PMp/ncRLOm1O6+i5QNGtuEmauOw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6A38F8032D; Tue, 29 Aug 2023 15:43:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D9E4F80155;
	Tue, 29 Aug 2023 15:43:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B9C7F80158; Tue, 29 Aug 2023 15:43:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 72878F800F5
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 15:43:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72878F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=zAMn//3d;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=U82udEiU
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 69EB01F45B;
	Tue, 29 Aug 2023 13:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1693316632;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=/0FVqYaSXhrOzI3J2WRZWAYS9qgZ4k0FVCniBP2vRec=;
	b=zAMn//3dZfoawBTCHQfdIyFXUL/YgIDejQdC3O4zIBZWol1F91IyZW9C3Oe2FQCeEkxo/A
	YjgGgDqDa+TjQ9n63hkMqwW2mbANSciWrGHylcAD0kq6ViOxQUrLMI/QAY/RFtffZH9Agx
	S6fs94x84uZVtCF08v02gk6Wr+7+m1k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693316632;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=/0FVqYaSXhrOzI3J2WRZWAYS9qgZ4k0FVCniBP2vRec=;
	b=U82udEiU818GYATOYvovSfbxz6mZ4wNWLgN4qQ4nGOLc8KLlCD5ZbetCG8HQkpGfYwAxE5
	eNfCcRZTuRMm0vAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 482F513301;
	Tue, 29 Aug 2023 13:43:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 1KSyEBj27WTkZQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 29 Aug 2023 13:43:52 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Meng_Cai@novatek.com.cn
Subject: [PATCH] ALSA: pcm: Fix missing fixup call in compat hw_refine ioctl
Date: Tue, 29 Aug 2023 15:43:44 +0200
Message-Id: <20230829134344.31588-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DPHOATTRCDHVJFQ35NGN5MFR5Q2ZUBSK
X-Message-ID-Hash: DPHOATTRCDHVJFQ35NGN5MFR5Q2ZUBSK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DPHOATTRCDHVJFQ35NGN5MFR5Q2ZUBSK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The update of rate_num/den and msbits were factored out to
fixup_unreferenced_params() function to be called explicitly after the
hw_refine or hw_params procedure.  It's called from
snd_pcm_hw_refine_user(), but it's forgotten in the PCM compat ioctl.
This ended up with the incomplete rate_num/den and msbits parameters
when 32bit compat ioctl is used.

This patch adds the missing call in snd_pcm_ioctl_hw_params_compat().

Reported-by: Meng_Cai@novatek.com.cn
Fixes: f9a076bff053 ("ALSA: pcm: calculate non-mask/non-interval parameters always when possible")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_compat.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
index 42c2ada8e888..c96483091f30 100644
--- a/sound/core/pcm_compat.c
+++ b/sound/core/pcm_compat.c
@@ -253,10 +253,14 @@ static int snd_pcm_ioctl_hw_params_compat(struct snd_pcm_substream *substream,
 		goto error;
 	}
 
-	if (refine)
+	if (refine) {
 		err = snd_pcm_hw_refine(substream, data);
-	else
+		if (err < 0)
+			goto error;
+		err = fixup_unreferenced_params(substream, data);
+	} else {
 		err = snd_pcm_hw_params(substream, data);
+	}
 	if (err < 0)
 		goto error;
 	if (copy_to_user(data32, data, sizeof(*data32)) ||
-- 
2.35.3

