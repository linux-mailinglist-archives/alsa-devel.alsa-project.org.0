Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CFE39F883
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:11:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85D4A16FA;
	Tue,  8 Jun 2021 16:10:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85D4A16FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623161466;
	bh=Aipjm5O5mMllK4pe9ezKKbc/tDHyyVnDNXrLDmmP/Es=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HGGUkuPeOJh/3kimYdkcyWYZ+glCTOjthjOirzZGChaz/6mct8KtNMXNEs8jOqh/D
	 n7JOxYv6rleHRBqNozSC6rJbWj023ypPKkZl53RAXs1usZVdjlTsvVkzC3PqPGYapj
	 e/csJ1FVE5WlfIMH8xP4lhr4VZej4hmffNVMITIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFE0EF80579;
	Tue,  8 Jun 2021 16:06:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26E6FF804C2; Tue,  8 Jun 2021 16:06:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7D3EF804B2
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7D3EF804B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="xMotSfy6"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="+XZuM8MG"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 3C1BD1FD57
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TeejCGWgHbwBttd9JigXlJg1aOWIWlIRvUEwiWpt+eE=;
 b=xMotSfy6EhXvA1EB4eDmeIgDWt9ZtOboeERKXUgWXjxQ0rdersKwEj0VSbul3oz2/oiwyy
 9blZGQz0rXRfo85IuFfEXoejD1kWCsQPbjqPJCC7cYFL8DVwzYJ+y9pT3vToH7u80jNLdK
 iVsTj04n7rpOf0DLzUOFjXlJsFLWjRM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161143;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TeejCGWgHbwBttd9JigXlJg1aOWIWlIRvUEwiWpt+eE=;
 b=+XZuM8MG7shwcwMfrNDOAVxOT8ovvFb9QbiqoeUJgUkGxWZDzRBWSYTlQkDAapXh1+PKAp
 EsvN/DlvQfM653BA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 2C8B2A3B84;
 Tue,  8 Jun 2021 14:05:43 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 13/66] ALSA: azt2320: Fix assignment in if condition
Date: Tue,  8 Jun 2021 16:04:47 +0200
Message-Id: <20210608140540.17885-14-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210608140540.17885-1-tiwai@suse.de>
References: <20210608140540.17885-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

ISA AZT2320 driver code contains lots of assignments in if condition,
which is a bad coding style that may confuse readers and occasionally
lead to bugs.

This patch is merely for coding-style fixes, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/azt2320.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/sound/isa/azt2320.c b/sound/isa/azt2320.c
index 867e9ae8f65a..dd5c059b3744 100644
--- a/sound/isa/azt2320.c
+++ b/sound/isa/azt2320.c
@@ -148,9 +148,11 @@ static int snd_card_azt2320_enable_wss(unsigned long port)
 {
 	int error;
 
-	if ((error = snd_card_azt2320_command(port, 0x09)))
+	error = snd_card_azt2320_command(port, 0x09);
+	if (error)
 		return error;
-	if ((error = snd_card_azt2320_command(port, 0x00)))
+	error = snd_card_azt2320_command(port, 0x00);
+	if (error)
 		return error;
 
 	mdelay(5);
@@ -174,12 +176,14 @@ static int snd_card_azt2320_probe(int dev,
 		return error;
 	acard = card->private_data;
 
-	if ((error = snd_card_azt2320_pnp(dev, acard, pcard, pid))) {
+	error = snd_card_azt2320_pnp(dev, acard, pcard, pid);
+	if (error) {
 		snd_card_free(card);
 		return error;
 	}
 
-	if ((error = snd_card_azt2320_enable_wss(port[dev]))) {
+	error = snd_card_azt2320_enable_wss(port[dev]);
+	if (error) {
 		snd_card_free(card);
 		return error;
 	}
@@ -228,18 +232,21 @@ static int snd_card_azt2320_probe(int dev,
 			snd_printk(KERN_ERR PFX "no OPL device at 0x%lx-0x%lx\n",
 				   fm_port[dev], fm_port[dev] + 2);
 		} else {
-			if ((error = snd_opl3_timer_new(opl3, 1, 2)) < 0) {
+			error = snd_opl3_timer_new(opl3, 1, 2);
+			if (error < 0) {
 				snd_card_free(card);
 				return error;
 			}
-			if ((error = snd_opl3_hwdep_new(opl3, 0, 1, NULL)) < 0) {
+			error = snd_opl3_hwdep_new(opl3, 0, 1, NULL);
+			if (error < 0) {
 				snd_card_free(card);
 				return error;
 			}
 		}
 	}
 
-	if ((error = snd_card_register(card)) < 0) {
+	error = snd_card_register(card);
+	if (error < 0) {
 		snd_card_free(card);
 		return error;
 	}
-- 
2.26.2

