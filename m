Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A48AE38E983
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 16:48:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1ADC1675;
	Mon, 24 May 2021 16:47:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1ADC1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621867703;
	bh=T73aE6qjderFT5AXqvF+eWkmvZ0i4FnAsV5zIEkKxBo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IOwU/EJ6KDuFElU2lJg6FvtYK9aTx3XtAgfxcOyLz23LV42qJswAL3KDsPL0eLWax
	 LVgU0uZiZyT6XdQsRhL/x7R8sPGbJBifF+kZWwqlCErWoUb8s6sMrdhaKUqVU755Wn
	 KqQ/V1ZemexL0q9Sm0w+8knYVjsx2DdrMaWiaksk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 364F1F802C4;
	Mon, 24 May 2021 16:46:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50E24F8022B; Mon, 24 May 2021 16:46:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAE00F8022B
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 16:46:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAE00F8022B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nSh7Pb22"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1ECDC613CC;
 Mon, 24 May 2021 14:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621867601;
 bh=T73aE6qjderFT5AXqvF+eWkmvZ0i4FnAsV5zIEkKxBo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nSh7Pb22r8gzH3dLl97xUYti8T8rCEob6VRpsZV5Prn0BcGjwDaomlbrbTGY2SUU9
 aGHDncRBvHl1ZISAo59V+KxyMDTuSCy9Ta6+zXgZEjUKTdwtEXDakWdo+Yq39jDPIz
 HZZ4/gqPPHWHV1O+gE4TPvghPHSFHSQmHdINlXRHzNuyrhXfDSJrnrIumILfnh6ctX
 9p1nmFT3V/lrGF/QAh1uojZj2mTIItjNn6GLQZdomIDTcCNknWCWHpXMOy3rX8rrAo
 +B4DRCm5bSL/e/n0/WTKW3gN8Ys9ovvRVbvmRIXJGpcfMsesNCsEWTEfYwQ8vrofPX
 FjNrRVwJ9Nkvw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 16/63] Revert "ALSA: gus: add a check of the
 status of snd_ctl_add"
Date: Mon, 24 May 2021 10:45:33 -0400
Message-Id: <20210524144620.2497249-16-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210524144620.2497249-1-sashal@kernel.org>
References: <20210524144620.2497249-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alsa-devel@alsa-project.org,
 Kangjie Lu <kjlu@umn.edu>, Sasha Levin <sashal@kernel.org>
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

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

[ Upstream commit 1dacca7fa1ebea47d38d20cd2df37094805d2649 ]

This reverts commit 0f25e000cb4398081748e54f62a902098aa79ec1.

Because of recent interactions with developers from @umn.edu, all
commits from them have been recently re-reviewed to ensure if they were
correct or not.

Upon review, this commit was found to be incorrect for the reasons
below, so it must be reverted.  It will be fixed up "correctly" in a
later kernel change.

The original commit did nothing if there was an error, except to print
out a message, which is pointless.  So remove the commit as it gives a
"false sense of doing something".

Cc: Kangjie Lu <kjlu@umn.edu>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20210503115736.2104747-33-gregkh@linuxfoundation.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/isa/gus/gus_main.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/sound/isa/gus/gus_main.c b/sound/isa/gus/gus_main.c
index afc088f0377c..b7518122a10d 100644
--- a/sound/isa/gus/gus_main.c
+++ b/sound/isa/gus/gus_main.c
@@ -77,17 +77,8 @@ static const struct snd_kcontrol_new snd_gus_joystick_control = {
 
 static void snd_gus_init_control(struct snd_gus_card *gus)
 {
-	int ret;
-
-	if (!gus->ace_flag) {
-		ret =
-			snd_ctl_add(gus->card,
-					snd_ctl_new1(&snd_gus_joystick_control,
-						gus));
-		if (ret)
-			snd_printk(KERN_ERR "gus: snd_ctl_add failed: %d\n",
-					ret);
-	}
+	if (!gus->ace_flag)
+		snd_ctl_add(gus->card, snd_ctl_new1(&snd_gus_joystick_control, gus));
 }
 
 /*
-- 
2.30.2

