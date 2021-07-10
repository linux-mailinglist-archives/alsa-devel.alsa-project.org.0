Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FEC3C3201
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jul 2021 04:51:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64EB91781;
	Sat, 10 Jul 2021 04:50:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64EB91781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625885481;
	bh=FyrjZ1RTao5syKYtfJ/7HgX6cs7d7hvz3SfCLP7np0A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VadEqHtL1Viayw5l1v5czgOWqfdry3ohfvd2Ja/z+vx01ywBFTjhnMPC2JoDGcHrh
	 bLSmXD3zNCoA98Q+xQE0NbtQM//xTTIEvmAsSoE538FSCHnj0LOguAYlemnTfs6lD3
	 YIoHQAqOsEMQVHE/8jUHS4gW7CVm8hGrIP8P2ljg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A36F7F805C4;
	Sat, 10 Jul 2021 04:35:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CFC9F805C2; Sat, 10 Jul 2021 04:35:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8F5EF805C1
 for <alsa-devel@alsa-project.org>; Sat, 10 Jul 2021 04:35:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8F5EF805C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="owEVmhSt"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 69C246140F;
 Sat, 10 Jul 2021 02:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625884538;
 bh=FyrjZ1RTao5syKYtfJ/7HgX6cs7d7hvz3SfCLP7np0A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=owEVmhSt/XnCGFhwbtAbUmwsOgAAPmKBHY6TYm/wpaejlzyN0EWxiXdgAkb+yXrOS
 sUc7mmuA9xNPb/JFIhBBytem00Gh6T5Ya0ePP0v/JArGmtB4KOi1E5WdvtGq/NAftT
 wezlpzzNftxWa+0ST6R02o37IE6LRK/Jxn3Ula62LDJIb0OST/lGlXY9e7dbWOx7Uy
 JVKEkahtqbEkv9ryEb3q86x7o19AtoLXNet5yHL+l+/ZAb5Jnl9NRhZ5Cy5txdFbA4
 KOLONx+t8WpXOKZHhZX6QWZQNZwOH7oBfWaEPviZ7EUX7xhY3BcQ6Wh2BReyAY5X1+
 FXS5T3LSAw+ZA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 17/33] ALSA: sb: Fix potential double-free of CSP
 mixer elements
Date: Fri,  9 Jul 2021 22:34:59 -0400
Message-Id: <20210710023516.3172075-17-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710023516.3172075-1-sashal@kernel.org>
References: <20210710023516.3172075-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org
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

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit c305366a37441c2ac90b08711cb6f032b43672f2 ]

snd_sb_qsound_destroy() contains the calls of removing the previously
created mixer controls, but it doesn't clear the pointers.  As
snd_sb_qsound_destroy() itself may be repeatedly called via ioctl,
this could lead to double-free potentially.

Fix it by clearing the struct fields properly afterwards.

Link: https://lore.kernel.org/r/20210608140540.17885-4-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/isa/sb/sb16_csp.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/isa/sb/sb16_csp.c b/sound/isa/sb/sb16_csp.c
index 5450f58e4f2e..69f392cf67b6 100644
--- a/sound/isa/sb/sb16_csp.c
+++ b/sound/isa/sb/sb16_csp.c
@@ -1086,10 +1086,14 @@ static void snd_sb_qsound_destroy(struct snd_sb_csp * p)
 	card = p->chip->card;	
 	
 	down_write(&card->controls_rwsem);
-	if (p->qsound_switch)
+	if (p->qsound_switch) {
 		snd_ctl_remove(card, p->qsound_switch);
-	if (p->qsound_space)
+		p->qsound_switch = NULL;
+	}
+	if (p->qsound_space) {
 		snd_ctl_remove(card, p->qsound_space);
+		p->qsound_space = NULL;
+	}
 	up_write(&card->controls_rwsem);
 
 	/* cancel pending transfer of QSound parameters */
-- 
2.30.2

