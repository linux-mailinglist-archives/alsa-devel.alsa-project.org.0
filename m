Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FD345A998
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 18:04:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3496167A;
	Tue, 23 Nov 2021 18:03:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3496167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637687056;
	bh=IoiiWz0yF6TC4a1AMmiL89W1BHbY1zaJfFj1qDQw5+c=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uHzJJSoHna8ib5inW/qJSsRMZ3TBfyCYx8AixwCwI3y9w45Ej8mdrfNo5U2JD5mw1
	 pj2QP2ItmQgNv6u9JfM9KMPwuR9JtxZmb9VOjNaPgfC4uBwq+Qkxu2sHYBfZdc2H1j
	 zpLaCOimiJwiDkZiIDCQVrKQ29QyWFxqVJ1hjWDE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 642F3F804AB;
	Tue, 23 Nov 2021 18:02:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75C85F8049E; Tue, 23 Nov 2021 18:02:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 734C1F80154
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 18:02:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 734C1F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="i76CmE4/"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="WPC9RP9Q"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 0A0801FD62
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 17:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1637686968; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=tDdiLG3VrSohj1fNsmxeHPAv8i9OjQyZRtct69DqJWg=;
 b=i76CmE4/TXy3ztw3tC7Pgzy4unQtfsH+XT72DaXc9RKUOEZwyx+NX8mnEojbs7Rig5QfzH
 zmhVpQokUv92mViyY4wl6aLt/TDVri530eLyLCriMiUQHclbMTi20kzdjsnuSr4YMSXtOJ
 hcQ6B7I1uwzgn/O/fRowi0CIqKX7XlU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1637686968;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=tDdiLG3VrSohj1fNsmxeHPAv8i9OjQyZRtct69DqJWg=;
 b=WPC9RP9QPVIazGolkb6tXffNaJSKZ+DQzJ+8b9uN1AyvsFGfwJRZMHZFcBIrnmiaVU1Jnu
 MvIc088zTA08NwAA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id F0FAFA3B84;
 Tue, 23 Nov 2021 17:02:47 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: led: Use restricted type for iface assignment
Date: Tue, 23 Nov 2021 18:02:47 +0100
Message-Id: <20211123170247.2962-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
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

Fix a sparse warning that complains about the inconsistent type
assignment for iface, which is a restricted type of
snd_ctl_elem_iface_t.

Fixes: a135dfb5de15 ("ALSA: led control - add sysfs kcontrol LED marking layer")
Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/r/202111201028.xduVYgH5-lkp@intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/control_led.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index a95332b2b90b..207828f30983 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -509,7 +509,7 @@ static char *parse_string(char *s, char *val, size_t val_size)
 	return s;
 }
 
-static char *parse_iface(char *s, unsigned int *val)
+static char *parse_iface(char *s, snd_ctl_elem_iface_t *val)
 {
 	if (!strncasecmp(s, "card", 4))
 		*val = SNDRV_CTL_ELEM_IFACE_CARD;
-- 
2.31.1

