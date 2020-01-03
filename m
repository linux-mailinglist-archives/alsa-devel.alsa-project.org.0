Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9D712F5BF
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 09:52:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDC871799;
	Fri,  3 Jan 2020 09:51:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDC871799
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578041555;
	bh=0mEQifAWxygZYxt0kHzfdq++ZpR+PsP9jV2li1YorC0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g8nhNYFuyuxb7l1tbEd0JWCzpIgZTizXS4Uqr8iIQNr/5T5mCu+wIunXJEp0Pk4bz
	 wXbLig5S6ndhMaxbVLJ4+ScP4TggF2N7ERjSfMKRo/pbYOMQz4hlM7FvY4ajTtQ8q4
	 SuH/M/cUkSNpnCO3wyL1ydRbhqU73Ip9rsc4On7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F63BF8051F;
	Fri,  3 Jan 2020 09:19:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2998F803CC; Fri,  3 Jan 2020 09:18:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0A13F802E0
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 09:17:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0A13F802E0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 09946B285
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 08:17:22 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  3 Jan 2020 09:17:05 +0100
Message-Id: <20200103081714.9560-50-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200103081714.9560-1-tiwai@suse.de>
References: <20200103081714.9560-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 49/58] ALSA: ice1712: Constify wm-specific
	tables
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The tables defined in wm8766.c and wm8776.c are referred as read-only,
hence they can be declared as const gracefully.

There should be no functional changes by this patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ice1712/wm8766.c | 2 +-
 sound/pci/ice1712/wm8776.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/ice1712/wm8766.c b/sound/pci/ice1712/wm8766.c
index 0943f9ef73cf..fe3e243b3854 100644
--- a/sound/pci/ice1712/wm8766.c
+++ b/sound/pci/ice1712/wm8766.c
@@ -26,7 +26,7 @@ static void snd_wm8766_write(struct snd_wm8766 *wm, u16 addr, u16 data)
 
 static const DECLARE_TLV_DB_SCALE(wm8766_tlv, -12750, 50, 1);
 
-static struct snd_wm8766_ctl snd_wm8766_default_ctl[WM8766_CTL_COUNT] = {
+static const struct snd_wm8766_ctl snd_wm8766_default_ctl[WM8766_CTL_COUNT] = {
 	[WM8766_CTL_CH1_VOL] = {
 		.name = "Channel 1 Playback Volume",
 		.type = SNDRV_CTL_ELEM_TYPE_INTEGER,
diff --git a/sound/pci/ice1712/wm8776.c b/sound/pci/ice1712/wm8776.c
index d696a7c29f7e..d96008df880d 100644
--- a/sound/pci/ice1712/wm8776.c
+++ b/sound/pci/ice1712/wm8776.c
@@ -129,7 +129,7 @@ static const DECLARE_TLV_DB_SCALE(wm8776_ngth_tlv, -7800, 600, 0);
 static const DECLARE_TLV_DB_SCALE(wm8776_maxatten_lim_tlv, -1200, 100, 0);
 static const DECLARE_TLV_DB_SCALE(wm8776_maxatten_alc_tlv, -2100, 400, 0);
 
-static struct snd_wm8776_ctl snd_wm8776_default_ctl[WM8776_CTL_COUNT] = {
+static const struct snd_wm8776_ctl snd_wm8776_default_ctl[WM8776_CTL_COUNT] = {
 	[WM8776_CTL_DAC_VOL] = {
 		.name = "Master Playback Volume",
 		.type = SNDRV_CTL_ELEM_TYPE_INTEGER,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
