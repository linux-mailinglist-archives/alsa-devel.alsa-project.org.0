Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EB1374342
	for <lists+alsa-devel@lfdr.de>; Wed,  5 May 2021 19:03:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DA991782;
	Wed,  5 May 2021 19:02:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DA991782
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620234196;
	bh=Umgn2PAyD9RUbxja/JXmKFpCaWb1l4D3wphIxd1ySN0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sr0LNCny/bTEegncB8wiQKca+wyn0qwk4G03g+wazwQp77ytGeCJPatqnL946Z71a
	 DQzdiUB0rLEXpW5bB2hN9rMBcw+H7Ggq2Z06StdX+EYpTa+FHFnM7YlnlXD9UqL5N2
	 meuTJ9gTqW6XlFGhjkPKe+UoreJXG8Dfv9UehTW8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0390BF806ED;
	Wed,  5 May 2021 18:41:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76A68F806F0; Wed,  5 May 2021 18:41:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27779F80533
 for <alsa-devel@alsa-project.org>; Wed,  5 May 2021 18:41:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27779F80533
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lDuOTlNv"
Received: by mail.kernel.org (Postfix) with ESMTPSA id DFA88613C7;
 Wed,  5 May 2021 16:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232898;
 bh=Umgn2PAyD9RUbxja/JXmKFpCaWb1l4D3wphIxd1ySN0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lDuOTlNvDrkQX6DgzcCJ04Tzh7b82vJ3JroZUL6qG/kUAxvaC7mgPuWNM+QV8y+mL
 A6ZE1VznUvNut7/LpeprTftCRxYEvsmFTocsFTxR2k/RbIHQW7zAhGgVPDets9arvK
 9OK6ntYVhIWhP+m0OC7wParD/PbD0WbA0jeLwAasjLjK0jbCd2bLAu8skJUMGYtUVJ
 SOh6emFs01zLPuKp2fyfyZdUr/94QXdFRPn5ts8NVeDjmQuhNcZHOG4jYo5fAY49fi
 sI1CiOHCVU9pLYB3tVfz6apTIlMQsCjWJPMRDzzUfpC3DqgusBeZMMOIzwDmbXQB3b
 KZXSPfFVdN6jA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 06/22] ALSA: rme9652: don't disable if not enabled
Date: Wed,  5 May 2021 12:41:13 -0400
Message-Id: <20210505164129.3464277-6-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505164129.3464277-1-sashal@kernel.org>
References: <20210505164129.3464277-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Tong Zhang <ztong0001@gmail.com>,
 alsa-devel@alsa-project.org, Sasha Levin <sashal@kernel.org>
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

From: Tong Zhang <ztong0001@gmail.com>

[ Upstream commit f57a741874bb6995089020e97a1dcdf9b165dcbe ]

rme9652 wants to disable a not enabled pci device, which makes kernel
throw a warning. Make sure the device is enabled before calling disable.

[    1.751595] snd_rme9652 0000:00:03.0: disabling already-disabled device
[    1.751605] WARNING: CPU: 0 PID: 174 at drivers/pci/pci.c:2146 pci_disable_device+0x91/0xb0
[    1.759968] Call Trace:
[    1.760145]  snd_rme9652_card_free+0x76/0xa0 [snd_rme9652]
[    1.760434]  release_card_device+0x4b/0x80 [snd]
[    1.760679]  device_release+0x3b/0xa0
[    1.760874]  kobject_put+0x94/0x1b0
[    1.761059]  put_device+0x13/0x20
[    1.761235]  snd_card_free+0x61/0x90 [snd]
[    1.761454]  snd_rme9652_probe+0x3be/0x700 [snd_rme9652]

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Tong Zhang <ztong0001@gmail.com>
Link: https://lore.kernel.org/r/20210321153840.378226-4-ztong0001@gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/rme9652/rme9652.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/rme9652/rme9652.c b/sound/pci/rme9652/rme9652.c
index a76b1f147660..67bd75fbdc7e 100644
--- a/sound/pci/rme9652/rme9652.c
+++ b/sound/pci/rme9652/rme9652.c
@@ -1761,7 +1761,8 @@ static int snd_rme9652_free(struct snd_rme9652 *rme9652)
 	if (rme9652->port)
 		pci_release_regions(rme9652->pci);
 
-	pci_disable_device(rme9652->pci);
+	if (pci_is_enabled(rme9652->pci))
+		pci_disable_device(rme9652->pci);
 	return 0;
 }
 
-- 
2.30.2

