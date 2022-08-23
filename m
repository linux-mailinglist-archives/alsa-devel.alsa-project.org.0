Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF79C59D215
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 09:28:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22880857;
	Tue, 23 Aug 2022 09:27:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22880857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661239707;
	bh=86qkeW1JrIGOoMIDiPEw3gxNJYwxCpzLYzexmZpcjuU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bh6eS8sqWpJS2TbpGd+mBsCj02z7GlVWq31bHMnZjntjNLe59SxwJ7S5Ni/rEsech
	 TpuCgOMAI9IxhNA+pH8aSMMM/jKkyE+ItLojhWLMbQ7VQ/M/vwv4E0LlRYIP7SA1k5
	 DpJex+XZ+oY6R85DoorobXOVqAmGPXD72P0VhoBg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93257F8027B;
	Tue, 23 Aug 2022 09:27:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BE4EF8027B; Tue, 23 Aug 2022 09:27:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D8F9F8014E
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 09:27:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D8F9F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="lLlQLP3w"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="4GD2ro2Y"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 80DCB33F81;
 Tue, 23 Aug 2022 07:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1661239639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y7xTrYu8sbgUnDBbDyyK3lLwA90zL9gq0/5bZLvFxT0=;
 b=lLlQLP3wE4UQm90iMxs7HzvwWcbNb846eOirZBWWu8PjCXT/sVrba2kF+WKIitxDdzB4d8
 gw84i1UiI4pxSIfgCQInLiYnaYZt/4vBh+hOw/bNOqNZgNv+kdnA4r3A3SVl7QO0Cc8f36
 MM3ifiuEoKR2iqqGSOFdNBGAxuabBC0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1661239639;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y7xTrYu8sbgUnDBbDyyK3lLwA90zL9gq0/5bZLvFxT0=;
 b=4GD2ro2YrJ8wMXGXPsCAscchOAIyLzTXgmi+MK+aM83hsspRDzTEFW2zxA8Z5lesPIpAwm
 4jArsL2UlRctooAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 55B9213AE6;
 Tue, 23 Aug 2022 07:27:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0O0yFFeBBGOUPAAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 23 Aug 2022 07:27:19 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: seq: Fix data-race at module auto-loading
Date: Tue, 23 Aug 2022 09:27:17 +0200
Message-Id: <20220823072717.1706-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220823072717.1706-1-tiwai@suse.de>
References: <20220823072717.1706-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Abhishek Shah <abhishek.shah@columbia.edu>,
 Gabriel Ryan <gabe@cs.columbia.edu>
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

It's been reported that there is a possible data-race accessing to the
global card_requested[] array at ALSA sequencer core, which is used
for determining whether to call request_module() for the card or not.
This data race itself is almost harmless, as it might end up with one
extra request_module() call for the already loaded module at most.
But it's still better to fix.

This patch addresses the possible data race of card_requested[] and
client_requested[] arrays by replacing them with bitmask.
It's an atomic operation and can work without locks.

Reported-by: Abhishek Shah <abhishek.shah@columbia.edu>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/CAEHB24_ay6YzARpA1zgCsE7=H9CSJJzux618E=Ka4h0YdKn=qA@mail.gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 2e9d695d336c..052a690b5e11 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -121,13 +121,13 @@ struct snd_seq_client *snd_seq_client_use_ptr(int clientid)
 	spin_unlock_irqrestore(&clients_lock, flags);
 #ifdef CONFIG_MODULES
 	if (!in_interrupt()) {
-		static char client_requested[SNDRV_SEQ_GLOBAL_CLIENTS];
-		static char card_requested[SNDRV_CARDS];
+		static DECLARE_BITMAP(client_requested, SNDRV_SEQ_GLOBAL_CLIENTS);
+		static DECLARE_BITMAP(card_requested, SNDRV_CARDS);
+
 		if (clientid < SNDRV_SEQ_GLOBAL_CLIENTS) {
 			int idx;
 			
-			if (!client_requested[clientid]) {
-				client_requested[clientid] = 1;
+			if (!test_and_set_bit(clientid, client_requested)) {
 				for (idx = 0; idx < 15; idx++) {
 					if (seq_client_load[idx] < 0)
 						break;
@@ -142,10 +142,8 @@ struct snd_seq_client *snd_seq_client_use_ptr(int clientid)
 			int card = (clientid - SNDRV_SEQ_GLOBAL_CLIENTS) /
 				SNDRV_SEQ_CLIENTS_PER_CARD;
 			if (card < snd_ecards_limit) {
-				if (! card_requested[card]) {
-					card_requested[card] = 1;
+				if (!test_and_set_bit(card_requested, card))
 					snd_request_card(card);
-				}
 				snd_seq_device_load_drivers();
 			}
 		}
-- 
2.35.3

