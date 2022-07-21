Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 468A957D0A0
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 18:04:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B381118BF;
	Thu, 21 Jul 2022 18:03:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B381118BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658419447;
	bh=iJU7kfsMpwslKAJN1u/TCZeUKxwzKshVy/G/n+ttbNY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iPgcVrebNRhpue1NgSWTnORBDD8TIPh4Mn+SFfEJX66C7zq8l8k0aH6X7/nKCVbmW
	 XGidyAmDyZrLteNkj/Obj3xdgpXdMt4F9ZqEAkIMdA05WWNTIxFMS2fGQk53npVUC8
	 2SgOmHzg3RXQUvKK1lUDIdN2mUmNKFH1w7IyfoN0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6CBEF805CB;
	Thu, 21 Jul 2022 17:58:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6EF4F8016D; Thu, 21 Jul 2022 17:05:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbg.qq.com (unknown [43.155.67.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 640C6F800BA
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 17:05:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 640C6F800BA
X-QQ-mid: bizesmtp67t1658415941trffb0df
Received: from localhost.localdomain ( [125.70.163.183])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 21 Jul 2022 23:05:32 +0800 (CST)
X-QQ-SSF: 01000000002000409000B00A0000000
X-QQ-FEAT: dDyohfujUnkwCuUiL58tJnO6zzR4NDiMnbHCq0ugwSbBYiDCLMByWHQMOXbvB
 VM4J1r9cg9xK1XpFDCfUEK5UsLYf0qoo4eUMo9jJWsCNA91WvnFua729T+IRGkKo68D9DXY
 O/mXWGm4q1br78s+RAsBFoWEbC7pOdmDH8N/10PYdux6tpaIv+9WIyTvnzu8xXrJ7Vf7cbk
 QUNPdjkEnh5NZCgsI0XFy7TD8CdbdzRVF3DfIHEiyg18Eenzv+g6nJXr7toDp0dH3BkDIqQ
 xdTuGyfWJvefjZ2kcIgQqLyK34MuEX2kzWpzPuX1xmXPFF+3812o16hvcT+nX8xLHiKcADm
 MTFcCatSl2TcqZuB9+iCQGNCTfp4MX3obb/n9qxHlvDx35uzjYkiKoQZss+0S5zyiEinMBj
X-QQ-GoodBg: 0
From: shaomin Deng <dengshaomin@cdjrlc.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ALSA: emu10k1: Fix typo in comments
Date: Thu, 21 Jul 2022 11:05:28 -0400
Message-Id: <20220721150528.22099-1-dengshaomin@cdjrlc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-Mailman-Approved-At: Thu, 21 Jul 2022 17:58:03 +0200
Cc: alsa-devel@alsa-project.org, shaomin Deng <dengshaomin@cdjrlc.com>,
 linux-kernel@vger.kernel.org
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

Remove the rebundant word "in" in comments.

Signed-off-by: shaomin Deng <dengshaomin@cdjrlc.com>
---
 sound/pci/emu10k1/memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/emu10k1/memory.c b/sound/pci/emu10k1/memory.c
index 9d26535f3fa3..edb3f1763719 100644
--- a/sound/pci/emu10k1/memory.c
+++ b/sound/pci/emu10k1/memory.c
@@ -324,7 +324,7 @@ snd_emu10k1_alloc_pages(struct snd_emu10k1 *emu, struct snd_pcm_substream *subst
 		return NULL;
 	}
 	/* fill buffer addresses but pointers are not stored so that
-	 * snd_free_pci_page() is not called in in synth_free()
+	 * snd_free_pci_page() is not called in synth_free()
 	 */
 	idx = 0;
 	for (page = blk->first_page; page <= blk->last_page; page++, idx++) {
-- 
2.35.1

