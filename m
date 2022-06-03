Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B88B953F5E4
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 08:11:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65869172F;
	Tue,  7 Jun 2022 08:10:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65869172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654582277;
	bh=dKRC0uiyyrKFb6HUXKrNJyA1AtnHEoemKM5oOAvYDgU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Gt/ezx/srcREhU+t0jEaUo+RAztE6Z80Y5gxk++bN+XlgGLIDCL62RNMKMivkYVVP
	 v9M9TlHVEXr0tkNEyD3IK4SROa9Tqbg9N6Cb5KbkHpgbbqx1mcCShzZD8kcOL2D9dc
	 dw2Xw/dJHRKu5rRAorG0EzxEo4FYuddNZapS/xKo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8FBDF80248;
	Tue,  7 Jun 2022 08:10:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D343F804CC; Fri,  3 Jun 2022 22:15:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.tpi.com (mail.tpi.com [50.126.108.186])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0719F800F5
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 22:15:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0719F800F5
Received: from sushi.tpi.com (sushi.tpi.com [10.0.0.212])
 by mail.tpi.com (Postfix) with ESMTPA id 55DBD47EC7EC;
 Fri,  3 Jun 2022 13:15:01 -0700 (PDT)
From: Dean Gehnert <deang@tpi.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: topology: Avoid card NULL deref in
 snd_soc_tplg_component_remove()
Date: Fri,  3 Jun 2022 13:14:25 -0700
Message-Id: <20220603201425.2590-1-deang@tpi.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 07 Jun 2022 08:10:18 +0200
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 stable@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Dean Gehnert <deang@tpi.com>, Mark Brown <broonie@kernel.org>
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

Don't deference card in comp->card->snd_card before checking for NULL card.

During the unloading of ASoC kernel modules, there is a kernel oops in
snd_soc_tplg_component_remove() that happens because comp->card is set to
NULL in soc_cleanup_component().

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Fixes: 7e567b5ae063 ("ASoC: topology: Add missing rwsem around snd_ctl_remove() calls")
Signed-off-by: Dean Gehnert <deang@tpi.com>
---
 sound/soc/soc-topology.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 3f9d314fba16..cf0efe1147c2 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -2613,15 +2613,18 @@ EXPORT_SYMBOL_GPL(snd_soc_tplg_component_load);
 /* remove dynamic controls from the component driver */
 int snd_soc_tplg_component_remove(struct snd_soc_component *comp)
 {
-	struct snd_card *card = comp->card->snd_card;
+	struct snd_card *card;
 	struct snd_soc_dobj *dobj, *next_dobj;
 	int pass;
 
 	/* process the header types from end to start */
 	for (pass = SOC_TPLG_PASS_END; pass >= SOC_TPLG_PASS_START; pass--) {
 
+		card = (comp->card) ? comp->card->snd_card : NULL;
+
 		/* remove mixer controls */
-		down_write(&card->controls_rwsem);
+		if (card)
+			down_write(&card->controls_rwsem);
 		list_for_each_entry_safe(dobj, next_dobj, &comp->dobj_list,
 			list) {
 
@@ -2660,7 +2663,8 @@ int snd_soc_tplg_component_remove(struct snd_soc_component *comp)
 				break;
 			}
 		}
-		up_write(&card->controls_rwsem);
+		if (card)
+			up_write(&card->controls_rwsem);
 	}
 
 	/* let caller know if FW can be freed when no objects are left */
-- 
2.17.1

