Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA8F38EA17
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 16:51:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E4851696;
	Mon, 24 May 2021 16:51:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E4851696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621867911;
	bh=T73aE6qjderFT5AXqvF+eWkmvZ0i4FnAsV5zIEkKxBo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f2K+NCdOocciUQnEzG/X83eyO2aXH98OwDhWpBNnOf0vJ6s6KKrK7glvPrkNVDqqY
	 2hJIPlWsVwp3Xr+ZtSscFAFH/lfMzQgfze8gZTLCEh0wHEFDrwAIbFi0OoVO3kwMLs
	 fEqkesylJrR3XCiduGrFBHwmPx3t6/Dg1I2+AUsk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A6A2F804E6;
	Mon, 24 May 2021 16:48:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9488CF804E6; Mon, 24 May 2021 16:48:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D38F8F804E5
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 16:48:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D38F8F804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="s1D55jXw"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2ECDF6128D;
 Mon, 24 May 2021 14:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621867683;
 bh=T73aE6qjderFT5AXqvF+eWkmvZ0i4FnAsV5zIEkKxBo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s1D55jXw0dAbJHUscZmUrO6jn3kvYLuG5OT8O1HwKwuhyx7wVEg0X42aOvR8wBp7S
 81BnvhEvngvOq1glgeJJwUApx6a+TLpycntk3upU2QlC6UcbJHZfk9334xd+pj3rJi
 kmKPXzoj1OoADYfrALDfPvA+kR5j1tAvwVa4/3PkHUbuUgM+tke3I2sJPEVTsRkd7Q
 v7uLjzDHTVio1gGuEL7CEMnUymH9rhUMZr5oIavW4Xo7nYJ8KdOKF8jfmebKURnkFd
 e72Ti0dr3OJ4tYKl4jXvZc+0tifcMmugeOwGsLcrY3OlpXdgJkBL1mJhlBXOgPLMnI
 yx07Me2Xj2A6Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 16/62] Revert "ALSA: gus: add a check of the
 status of snd_ctl_add"
Date: Mon, 24 May 2021 10:46:57 -0400
Message-Id: <20210524144744.2497894-16-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210524144744.2497894-1-sashal@kernel.org>
References: <20210524144744.2497894-1-sashal@kernel.org>
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

