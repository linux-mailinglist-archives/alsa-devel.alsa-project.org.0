Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAD0757F2C
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 16:15:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23908112;
	Tue, 18 Jul 2023 16:14:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23908112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689689714;
	bh=lnc2KoUgRG3lwpxDCiPgnX5sIJoytStqVfE8awnvY3w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AXBsNF44dvRPWPqIYvcDbRtTl/TNeP6foZ4McKtIfXk26xQGtCw2Pu/pS3kB/oEqA
	 WHFJ3fTVly+TvmLqmmrwMKXXd4S39Yeetgz6syVliTgVGoutpV7CDaXrJqRZ6JxQBM
	 aUXRBBY10tQFgzbj+lYebr8H09BZeZR+jTL+mQN0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1BFBF805AA; Tue, 18 Jul 2023 16:13:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA35FF80552;
	Tue, 18 Jul 2023 16:13:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A071F80587; Tue, 18 Jul 2023 16:13:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F383F80557
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 16:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F383F80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=UmSnC/8N;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=a/c7sDuO
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8EE8E2192D;
	Tue, 18 Jul 2023 14:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689689596;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iIrqHue+vf3qZavIkbDu6YFbh1oK68e6yOjrTSxU3IQ=;
	b=UmSnC/8NupZsC/KIEJ9gNG2ZE83GjoMJoBbgO4yltuTTWJJBRbWLl0nUjDTitR4EwqIWOD
	KDgCLACIldUCzk08FzVdBMklTwYy9b8/OPcC2o4Ux9yls7e2R15QM7WAhDq0jVFq8pBzBe
	L4wqTV41IN0QuDesqe4NM2DCm/6eZf0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689689596;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iIrqHue+vf3qZavIkbDu6YFbh1oK68e6yOjrTSxU3IQ=;
	b=a/c7sDuOlNCLRxlfs8P//U8PXrTOr5Cwu2/f+PP4azQ1Hx9X/mHEc6/bNDiGMpdq4Jg9vi
	24Me/ZZwMVajUwCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 74A4D134B0;
	Tue, 18 Jul 2023 14:13:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id cGGfG/ydtmQ8AQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 18 Jul 2023 14:13:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 11/11] ALSA: emu10k1: Go back and simplify with
 snd_ctl_find_id()
Date: Tue, 18 Jul 2023 16:13:04 +0200
Message-Id: <20230718141304.1032-12-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230718141304.1032-1-tiwai@suse.de>
References: <20230718141304.1032-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7TFSXAXS3QEYXIS3KLSQAHRJKG3D7PT3
X-Message-ID-Hash: 7TFSXAXS3QEYXIS3KLSQAHRJKG3D7PT3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7TFSXAXS3QEYXIS3KLSQAHRJKG3D7PT3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now that snd_ctl_find_id() takes the locking itself, we can get rid of
the messy locking in the caller side in snd_emu10k1_verify_controls().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/emu10k1/emufx.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 318a064f2cec..f114bda25eea 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -799,13 +799,10 @@ static int snd_emu10k1_verify_controls(struct snd_emu10k1 *emu,
 		if (snd_emu10k1_look_for_ctl(emu, &gctl->id))
 			continue;
 		gctl_id = (struct snd_ctl_elem_id *)&gctl->id;
-		down_read(&emu->card->controls_rwsem);
-		if (snd_ctl_find_id_locked(emu->card, gctl_id)) {
-			up_read(&emu->card->controls_rwsem);
+		if (snd_ctl_find_id(emu->card, gctl_id)) {
 			err = -EEXIST;
 			goto __error;
 		}
-		up_read(&emu->card->controls_rwsem);
 		if (gctl_id->iface != SNDRV_CTL_ELEM_IFACE_MIXER &&
 		    gctl_id->iface != SNDRV_CTL_ELEM_IFACE_PCM) {
 			err = -EINVAL;
-- 
2.35.3

