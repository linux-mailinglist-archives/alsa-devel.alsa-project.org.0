Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F541251D3
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 20:27:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 838711673;
	Wed, 18 Dec 2019 20:26:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 838711673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576697236;
	bh=7rgmESWhrbn1TiXTBmJoWP4q+GzQgEztERRN0uq6vXw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b4x1UAMfgN33L2B8Kuhrk5Ic42V6omcR7H5BdvOz79h51+JPA04yipo7JUct5hAJB
	 BaZRV76U8d36/ihIhtd+corlZUQB0qSGPymGqiC1CLxsulfanw3pLc5CrVjJtf5kSg
	 OLX0saLG6GIeueHx/AfhnXIUENgwK0zt6ppJwjn4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66765F80257;
	Wed, 18 Dec 2019 20:26:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B118F80247; Wed, 18 Dec 2019 20:26:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E311F8014C
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 20:26:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E311F8014C
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 78AC7ADEF;
 Wed, 18 Dec 2019 19:26:09 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Wed, 18 Dec 2019 20:26:06 +0100
Message-Id: <20191218192606.12866-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [alsa-devel] [PATCH] ALSA: ice1724: Fix sleep-in-atomic in
	Infrasonic Quartet support code
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

Jia-Ju Bai reported a possible sleep-in-atomic scenario in the ice1724
driver with Infrasonic Quartet support code: namely, ice->set_rate
callback gets called inside ice->reg_lock spinlock, while the callback
in quartet.c holds ice->gpio_mutex.

This patch fixes the invalid call: it simply moves the calls of
ice->set_rate and ice->set_mclk callbacks outside the spinlock.

Reported-by: Jia-Ju Bai <baijiaju1990@gmail.com>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/5d43135e-73b9-a46a-2155-9e91d0dcdf83@gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ice1712/ice1724.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/pci/ice1712/ice1724.c b/sound/pci/ice1712/ice1724.c
index c80a16ee6e76..242542e23d28 100644
--- a/sound/pci/ice1712/ice1724.c
+++ b/sound/pci/ice1712/ice1724.c
@@ -647,6 +647,7 @@ static int snd_vt1724_set_pro_rate(struct snd_ice1712 *ice, unsigned int rate,
 	unsigned long flags;
 	unsigned char mclk_change;
 	unsigned int i, old_rate;
+	bool call_set_rate = false;
 
 	if (rate > ice->hw_rates->list[ice->hw_rates->count - 1])
 		return -EINVAL;
@@ -670,7 +671,7 @@ static int snd_vt1724_set_pro_rate(struct snd_ice1712 *ice, unsigned int rate,
 		 * setting clock rate for internal clock mode */
 		old_rate = ice->get_rate(ice);
 		if (force || (old_rate != rate))
-			ice->set_rate(ice, rate);
+			call_set_rate = true;
 		else if (rate == ice->cur_rate) {
 			spin_unlock_irqrestore(&ice->reg_lock, flags);
 			return 0;
@@ -678,12 +679,14 @@ static int snd_vt1724_set_pro_rate(struct snd_ice1712 *ice, unsigned int rate,
 	}
 
 	ice->cur_rate = rate;
+	spin_unlock_irqrestore(&ice->reg_lock, flags);
+
+	if (call_set_rate)
+		ice->set_rate(ice, rate);
 
 	/* setting master clock */
 	mclk_change = ice->set_mclk(ice, rate);
 
-	spin_unlock_irqrestore(&ice->reg_lock, flags);
-
 	if (mclk_change && ice->gpio.i2s_mclk_changed)
 		ice->gpio.i2s_mclk_changed(ice);
 	if (ice->gpio.set_pro_rate)
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
