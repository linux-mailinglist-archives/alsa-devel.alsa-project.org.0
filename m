Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 509A35EA7BF
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Sep 2022 15:58:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8D9F820;
	Mon, 26 Sep 2022 15:57:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8D9F820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664200685;
	bh=szZtDH+LJJDyat6+0c2qRFB0CG9d8FElFNeCRa4gCI8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xq87p1lprVnlUbzDEzwOFi7jvXdF/QfVuJcyzX2YtPYlpjOJ52r312qKb33TMfsOW
	 LHeiwPa3sEFSBjqGQIqG0Eb5vAdsZ0rQY5OOJ5r5YHMg40aZOnqAa845E+IyBW62q3
	 Fy9iY636AHEVxn2PHrwwjMPk9DLuw4wLXu+ChqL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3901DF80115;
	Mon, 26 Sep 2022 15:56:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11C74F8055C; Mon, 26 Sep 2022 15:56:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2F5AF80535
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 15:56:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2F5AF80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="qiiOfKqZ"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="aagJl7SC"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1AD8121EB6;
 Mon, 26 Sep 2022 13:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664200573; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q7Hw1n4wxGBCs256tM2bb2MtuQ2cZzjjeZL/vKyw+Co=;
 b=qiiOfKqZsnGDFbhioE3LnDg+z/zvs/dYeI787fd2FIYR9WE4/c+2Yr0Tb38lSL00dgSkd2
 /BtMZ/e3ZcL6XidSWZ1XDPOSpzunTd2aMxUmeuq92qtrTzLZtqdtg5FAzZtuRv58VgkHO3
 0UnFLSmh/L+YGFUmwq3ex+vA/XsQPsM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664200573;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q7Hw1n4wxGBCs256tM2bb2MtuQ2cZzjjeZL/vKyw+Co=;
 b=aagJl7SCPTvtBV2HUI9Lv1eM/xyTAJ526z8Z7JHIm1RNP2e3YL/C/lhk9rDfZn2EPvdSgw
 yQfnJwELMAXS+nDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DCAAF139BD;
 Mon, 26 Sep 2022 13:56:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8Oq4NHyvMWPxegAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 26 Sep 2022 13:56:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/11] ALSA: asihpi: Replace runtime->status->state reference
 to runtime->state
Date: Mon, 26 Sep 2022 15:55:53 +0200
Message-Id: <20220926135558.26580-7-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220926135558.26580-1-tiwai@suse.de>
References: <20220926135558.26580-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>
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

The recent change in ALSA core allows drivers to get the current PCM
state directly from runtime object.  Replace the calls accordingly.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/asihpi/asihpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
index 5e1f9f10051b..8de43aaa10aa 100644
--- a/sound/pci/asihpi/asihpi.c
+++ b/sound/pci/asihpi/asihpi.c
@@ -632,7 +632,7 @@ static int snd_card_asihpi_trigger(struct snd_pcm_substream *substream,
 
 			/*? workaround linked streams don't
 			transition to SETUP 20070706*/
-			s->runtime->status->state = SNDRV_PCM_STATE_SETUP;
+			__snd_pcm_set_state(s->runtime, SNDRV_PCM_STATE_SETUP);
 
 			if (card->support_grouping) {
 				snd_printdd("%d group\n", s->number);
-- 
2.35.3

