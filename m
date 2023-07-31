Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5528769B3F
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 17:51:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18E94857;
	Mon, 31 Jul 2023 17:50:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18E94857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690818663;
	bh=Scazlv5y4jVW8v1hac7i8YNFhAlfHpLETAYaiWotc3A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pfAYOQjpIPWXsJBbDwMXj1fsYIZ1GOsGio+/jt36VEhMJ/IqXmNDJyMosJ3hrTXD1
	 wjmVoLzHDVWrmql/Srx/4BYgj4yk/CSFn9SA9tlfXHLbecGaDYtpkE1JptA6Fu4pnf
	 S488MsbNby8M+ie+b5bFFg6v+KCXdsyFT57D7kS4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 172A6F805E6; Mon, 31 Jul 2023 17:48:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16242F80567;
	Mon, 31 Jul 2023 17:48:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86DC5F805C1; Mon, 31 Jul 2023 17:47:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B677F8055A
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 17:47:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B677F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=I2b+aLsv;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=yWTBfoun
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 128951F8A4;
	Mon, 31 Jul 2023 15:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690818446;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7xzGyeOqADYuhvj9+f7Ht1+vWxKhBHvAgQBKLm+82Kc=;
	b=I2b+aLsv1a+mhlVVFFTmUyeFxV3ah6hcx7cpXBJTWxqyXWC4ij1ICKX4xcOa79AL5CU7Mn
	oTvKXOIiYGT6llyQ0+tcycloVEgQSpi5NTo9Gk15+YK4+rE1NKNK1BSj1MpkZqZo4O6M/k
	p0thvhXAFIoMstb8CMmrGT6YhtYb5Y4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690818446;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7xzGyeOqADYuhvj9+f7Ht1+vWxKhBHvAgQBKLm+82Kc=;
	b=yWTBfounRAZaa1yN1FUOJOlogvaJkE7A3YoLrkiLvu3mV0+nla53+ok9v0VmwDCd0c7olD
	p0gT1VPRwL9skQCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D3CC61322C;
	Mon, 31 Jul 2023 15:47:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id OFTwMo3Xx2Q3fwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 31 Jul 2023 15:47:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Anton Sviridenko <anton@corp.bluecherry.net>,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Ismael Luceno <ismael@iodev.co.uk>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 16/24] media: solo6x10: Convert to generic PCM copy ops
Date: Mon, 31 Jul 2023 17:47:10 +0200
Message-Id: <20230731154718.31048-17-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230731154718.31048-1-tiwai@suse.de>
References: <20230731154718.31048-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IF6Z6375XG2UMRCDIHITFW5Y2GH3NXXA
X-Message-ID-Hash: IF6Z6375XG2UMRCDIHITFW5Y2GH3NXXA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IF6Z6375XG2UMRCDIHITFW5Y2GH3NXXA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch converts the solo6x10 driver code to use the new unified
PCM copy callback.  It's a straightforward conversion from *_user() to
*_sockptr() variants.

Cc: Bluecherry Maintainers <maintainers@bluecherrydvr.com>
Cc: Anton Sviridenko <anton@corp.bluecherry.net>
Cc: Andrey Utkin <andrey_utkin@fastmail.com>
Cc: Ismael Luceno <ismael@iodev.co.uk>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/media/pci/solo6x10/solo6x10-g723.c | 41 +++++-----------------
 1 file changed, 8 insertions(+), 33 deletions(-)

diff --git a/drivers/media/pci/solo6x10/solo6x10-g723.c b/drivers/media/pci/solo6x10/solo6x10-g723.c
index 6cebad665565..cf134810b8ec 100644
--- a/drivers/media/pci/solo6x10/solo6x10-g723.c
+++ b/drivers/media/pci/solo6x10/solo6x10-g723.c
@@ -204,12 +204,13 @@ static snd_pcm_uframes_t snd_solo_pcm_pointer(struct snd_pcm_substream *ss)
 	return idx * G723_FRAMES_PER_PAGE;
 }
 
-static int snd_solo_pcm_copy_user(struct snd_pcm_substream *ss, int channel,
-				  unsigned long pos, void __user *dst,
-				  unsigned long count)
+static int snd_solo_pcm_copy(struct snd_pcm_substream *ss, int channel,
+			     unsigned long pos, sockptr_t dst,
+			     unsigned long count)
 {
 	struct solo_snd_pcm *solo_pcm = snd_pcm_substream_chip(ss);
 	struct solo_dev *solo_dev = solo_pcm->solo_dev;
+	unsigned int off = 0;
 	int err, i;
 
 	for (i = 0; i < (count / G723_FRAMES_PER_PAGE); i++) {
@@ -223,35 +224,10 @@ static int snd_solo_pcm_copy_user(struct snd_pcm_substream *ss, int channel,
 		if (err)
 			return err;
 
-		if (copy_to_user(dst, solo_pcm->g723_buf, G723_PERIOD_BYTES))
+		if (copy_to_sockptr_offset(dst, off,
+					   solo_pcm->g723_buf, G723_PERIOD_BYTES))
 			return -EFAULT;
-		dst += G723_PERIOD_BYTES;
-	}
-
-	return 0;
-}
-
-static int snd_solo_pcm_copy_kernel(struct snd_pcm_substream *ss, int channel,
-				    unsigned long pos, void *dst,
-				    unsigned long count)
-{
-	struct solo_snd_pcm *solo_pcm = snd_pcm_substream_chip(ss);
-	struct solo_dev *solo_dev = solo_pcm->solo_dev;
-	int err, i;
-
-	for (i = 0; i < (count / G723_FRAMES_PER_PAGE); i++) {
-		int page = (pos / G723_FRAMES_PER_PAGE) + i;
-
-		err = solo_p2m_dma_t(solo_dev, 0, solo_pcm->g723_dma,
-				     SOLO_G723_EXT_ADDR(solo_dev) +
-				     (page * G723_PERIOD_BLOCK) +
-				     (ss->number * G723_PERIOD_BYTES),
-				     G723_PERIOD_BYTES, 0, 0);
-		if (err)
-			return err;
-
-		memcpy(dst, solo_pcm->g723_buf, G723_PERIOD_BYTES);
-		dst += G723_PERIOD_BYTES;
+		off += G723_PERIOD_BYTES;
 	}
 
 	return 0;
@@ -263,8 +239,7 @@ static const struct snd_pcm_ops snd_solo_pcm_ops = {
 	.prepare = snd_solo_pcm_prepare,
 	.trigger = snd_solo_pcm_trigger,
 	.pointer = snd_solo_pcm_pointer,
-	.copy_user = snd_solo_pcm_copy_user,
-	.copy_kernel = snd_solo_pcm_copy_kernel,
+	.copy = snd_solo_pcm_copy,
 };
 
 static int snd_solo_capture_volume_info(struct snd_kcontrol *kcontrol,
-- 
2.35.3

