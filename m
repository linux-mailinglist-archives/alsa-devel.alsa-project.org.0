Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 795A0404A71
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Sep 2021 13:45:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12FEC16C2;
	Thu,  9 Sep 2021 13:45:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12FEC16C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631187957;
	bh=gMzlS6eZ1f/ByV3KBZmIrkiSw6UxTcu2UVXACyjKUw4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aWAX4WGROjkraHJjDGjJyisiRAbJgGyZRP7OVUjqTvKKxryFqyW3YSv6PRONOPUtm
	 s5S6+j8VfyfXLIZPMvwREt0STqN7qY3GF1qxwRcLBQkQriIQ59kwdS/imfuhxZiCeR
	 46L0r/yflxNIImCgyyxTbAjf6sjagyHEOd4knN4Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 194AEF802A9;
	Thu,  9 Sep 2021 13:44:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00FFCF80224; Thu,  9 Sep 2021 13:44:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CC91F80253
 for <alsa-devel@alsa-project.org>; Thu,  9 Sep 2021 13:44:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CC91F80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Wesw0w6t"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 08C846138E;
 Thu,  9 Sep 2021 11:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631187883;
 bh=gMzlS6eZ1f/ByV3KBZmIrkiSw6UxTcu2UVXACyjKUw4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wesw0w6tM8cQIj/SM+2L1+lcs8ODNqvh+eWS3qsHUb79uuup9MOJ+swzm9jdXnk9m
 cs2RFFkHI1ID4Y0hnaTea3lzymd3JZzLPopIu3PB5um6xDT6+qJDLlYxGeyULlz/lb
 ypInvHyZFaqOsFfgZlZ4D9KyPToviAIsLVRZVqQVx9933fSux0toxaBX9uz/cQKEbV
 vAJ25UrvIPzi8Z/+CYCnPl4dnjE8j/MAlwP0YAMbQd7QWC/GGqOysRuCDbMhUZz1/s
 Tp7JGxPn1KiaHFIG0QH7yL/gfJH+IEPU0fgKbDK16WCQGMedjDq4g/tJcsvC5q+DBy
 KVZkRybgyFVaA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.14 166/252] ALSA: hda: Drop workaround for a hang at
 shutdown again
Date: Thu,  9 Sep 2021 07:39:40 -0400
Message-Id: <20210909114106.141462-166-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909114106.141462-1-sashal@kernel.org>
References: <20210909114106.141462-1-sashal@kernel.org>
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

[ Upstream commit 8fc8e903156f42c66245838441d03607e9067381 ]

The commit 0165c4e19f6e ("ALSA: hda: Fix hang during shutdown due to
link reset") modified the shutdown callback of the HD-audio controller
for working around a hang.  Meanwhile, the actual culprit of the hang
was identified to be the leftover active codecs that may interfere
with the powered down controller somehow, but we took a minimal fix
approach for 5.14, and that was the commit above.

Now, since the codec drivers go runtime-suspend at shutdown for 5.15,
we can revert the change and make sure that the full runtime-suspend
is performed at shutdown of HD-audio controller again.  This patch
essentially reverts the commit above to restore the behavior.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=214045
Link: https://lore.kernel.org/r/20210817075630.7115-1-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/hda_intel.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 0062c18b646a..0322b289505e 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -883,11 +883,10 @@ static unsigned int azx_get_pos_skl(struct azx *chip, struct azx_dev *azx_dev)
 	return azx_get_pos_posbuf(chip, azx_dev);
 }
 
-static void __azx_shutdown_chip(struct azx *chip, bool skip_link_reset)
+static void azx_shutdown_chip(struct azx *chip)
 {
 	azx_stop_chip(chip);
-	if (!skip_link_reset)
-		azx_enter_link_reset(chip);
+	azx_enter_link_reset(chip);
 	azx_clear_irq_pending(chip);
 	display_power(chip, false);
 }
@@ -896,11 +895,6 @@ static void __azx_shutdown_chip(struct azx *chip, bool skip_link_reset)
 static DEFINE_MUTEX(card_list_lock);
 static LIST_HEAD(card_list);
 
-static void azx_shutdown_chip(struct azx *chip)
-{
-	__azx_shutdown_chip(chip, false);
-}
-
 static void azx_add_card_list(struct azx *chip)
 {
 	struct hda_intel *hda = container_of(chip, struct hda_intel, chip);
@@ -2391,7 +2385,7 @@ static void azx_shutdown(struct pci_dev *pci)
 		return;
 	chip = card->private_data;
 	if (chip && chip->running)
-		__azx_shutdown_chip(chip, true);
+		azx_shutdown_chip(chip);
 }
 
 /* PCI IDs */
-- 
2.30.2

