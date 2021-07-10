Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A0C3C2F72
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jul 2021 04:29:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E932D167A;
	Sat, 10 Jul 2021 04:28:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E932D167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625884190;
	bh=WTR3HR2O77FCPjnMuu4vUPAkOF6KxIhKe3sBHTkkkNk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mE5Jd5ZYhCwBzO5pso47MuXoLArnruDkwzZACUc29sirLVzmP5nO5bhzX59w/jok8
	 UISireMgbmwrynLgc+qSlGzgsNTAfppm6j8RkTi7WwKRKYqmRkjDCs/vNAUkvCC31r
	 EhzukhBNEE5xCKpxi7LdZwy1U23z3p1ro5h0zK/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD3EBF80525;
	Sat, 10 Jul 2021 04:23:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC458F80520; Sat, 10 Jul 2021 04:23:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03ADFF80520
 for <alsa-devel@alsa-project.org>; Sat, 10 Jul 2021 04:23:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03ADFF80520
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tfUsU5cO"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 77331613DF;
 Sat, 10 Jul 2021 02:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625883793;
 bh=WTR3HR2O77FCPjnMuu4vUPAkOF6KxIhKe3sBHTkkkNk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tfUsU5cOjIKmqm9gNSqNKrnUACi6wzy/9uPEWtBZnWJXcCeU9KsrSqPMMjyY4tfqf
 pfHipOO2msq0GV17kP63JM8igqEA39Pu8C6dpVhIIPBJz+3JGNlDI4NFXd6nDi/Uhg
 +UC0iTlWbfYb9Ep7mFQjLJ8j9+kIq7ZKIC0dAuVxJx34eKTpCVJe92edeHlZkYUZJw
 RLYGGUjuSrceD23ta52aP7BnZC1CE+ZJ9zowTSm55qBd2OEdYIcOk8HNdZv1P0Awqe
 PM1SpS+Sv+IWsP1ayb06FR5iaWRZT7zYTIH5Qh1eUwBIpW6Szf1a45vHFUulc/o3vr
 O9t7lPXlZ/3sg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 058/104] ALSA: sb: Fix potential double-free of
 CSP mixer elements
Date: Fri,  9 Jul 2021 22:21:10 -0400
Message-Id: <20210710022156.3168825-58-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710022156.3168825-1-sashal@kernel.org>
References: <20210710022156.3168825-1-sashal@kernel.org>
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
index 4789345a8fdd..c98ccd421a2e 100644
--- a/sound/isa/sb/sb16_csp.c
+++ b/sound/isa/sb/sb16_csp.c
@@ -1072,10 +1072,14 @@ static void snd_sb_qsound_destroy(struct snd_sb_csp * p)
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

