Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D21BD708379
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 16:04:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0AE0200;
	Thu, 18 May 2023 16:03:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0AE0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684418680;
	bh=DNoCcK7Sd8s/2dijhA8umvHR1S3iJegwj02zv5Y1l2g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eDKoASld+Scic2Jyq45kDodxN9bD2DHeyUOF4m8nH33XxvU3v/TIZues3MNtfWKIV
	 W+A0fUiAeFiQ2bDDwcbi3y5c8A+bZYpi7OIYxHMvpA2nPsKwMgNn1es9azS1jpnPww
	 4M/ApRqZ9tQEnS0EczhbVRLiM2DhXezLZZoMR0mo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF88EF80557; Thu, 18 May 2023 16:03:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D9D5F8053D;
	Thu, 18 May 2023 16:03:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7A8CF80542; Thu, 18 May 2023 16:03:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1EF30F8016D
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 16:03:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EF30F8016D
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id AAA8C240F9;
	Thu, 18 May 2023 10:03:39 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pzeEF-cLU-00; Thu, 18 May 2023 16:03:39 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 2/2] ALSA: emu10k1: fix terminating synthesizer voices
Date: Thu, 18 May 2023 16:03:39 +0200
Message-Id: <20230518140339.3722308-2-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230518140339.3722308-1-oswald.buddenhagen@gmx.de>
References: <20230518140339.3722308-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RQMC7XSU6JRJJ5ALETYR2VT5ZJ26HYY4
X-Message-ID-Hash: RQMC7XSU6JRJJ5ALETYR2VT5ZJ26HYY4
X-MailFrom: ossi@kde.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RQMC7XSU6JRJJ5ALETYR2VT5ZJ26HYY4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Make terminate_voice() actually do at all what it's supposed to do:
instantly and completely shut down the note.

The bogus behavior was mostly harmless, as usually the voice is freed
right afterwards, which implicitly terminates it anyway.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emu10k1_callback.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_callback.c b/sound/pci/emu10k1/emu10k1_callback.c
index aab8d64fd708..dcd7be2d281b 100644
--- a/sound/pci/emu10k1/emu10k1_callback.c
+++ b/sound/pci/emu10k1/emu10k1_callback.c
@@ -136,8 +136,13 @@ terminate_voice(struct snd_emux_voice *vp)
 	if (snd_BUG_ON(!vp))
 		return;
 	hw = vp->hw;
-	snd_emu10k1_ptr_write(hw, DCYSUSV, vp->ch,
-		DCYSUSV_PHASE1_MASK | DCYSUSV_DECAYTIME_MASK | DCYSUSV_CHANNELENABLE_MASK);
+	snd_emu10k1_ptr_write_multiple(hw, vp->ch,
+		DCYSUSV, 0,
+		VTFT, VTFT_FILTERTARGET_MASK,
+		CVCF, CVCF_CURRENTFILTER_MASK,
+		PTRX, 0,
+		CPF, 0,
+		REGLIST_END);
 	if (vp->block) {
 		struct snd_emu10k1_memblk *emem;
 		emem = (struct snd_emu10k1_memblk *)vp->block;
-- 
2.40.0.152.g15d061e6df

