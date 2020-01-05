Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CBF130893
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 16:11:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33D2117F2;
	Sun,  5 Jan 2020 16:11:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33D2117F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578237111;
	bh=6YU8EZyUKbwOTTiZW0C4PhvW6Y4uj9hpPr/BqEROwGs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z1utKs6TPnNnLV85q4k/PjiAuuRg4yDiEFE0vWaEH80kM/JsUf3iudmzbN836K8VV
	 o0pr8i+GqSJJKMknZDCvnHx3qsL6Qcbz+A9aoP71obZnjJHm6sI/xQlqlfO7UhLmGQ
	 e0GLXWaRsu+X8tredZ+YFxraJV//SoZzTN9D10vI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F21CF80436;
	Sun,  5 Jan 2020 15:50:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C941EF8036F; Sun,  5 Jan 2020 15:49:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7260F8029A
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7260F8029A
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 467F4B29F
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:33 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:47:48 +0100
Message-Id: <20200105144823.29547-34-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 33/68] ALSA: atiixp: More constifications
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

Apply const prefix to the static register tables.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/atiixp.c       | 2 +-
 sound/pci/atiixp_modem.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/atiixp.c b/sound/pci/atiixp.c
index 4a840734e7a7..85d3b4e95489 100644
--- a/sound/pci/atiixp.c
+++ b/sound/pci/atiixp.c
@@ -1407,7 +1407,7 @@ static int snd_atiixp_mixer_new(struct atiixp *chip, int clock,
 		.write = snd_atiixp_ac97_write,
 		.read = snd_atiixp_ac97_read,
 	};
-	static unsigned int codec_skip[NUM_ATI_CODECS] = {
+	static const unsigned int codec_skip[NUM_ATI_CODECS] = {
 		ATI_REG_ISR_CODEC0_NOT_READY,
 		ATI_REG_ISR_CODEC1_NOT_READY,
 		ATI_REG_ISR_CODEC2_NOT_READY,
diff --git a/sound/pci/atiixp_modem.c b/sound/pci/atiixp_modem.c
index 3ec34e78ffef..ae88217d685a 100644
--- a/sound/pci/atiixp_modem.c
+++ b/sound/pci/atiixp_modem.c
@@ -1050,7 +1050,7 @@ static int snd_atiixp_mixer_new(struct atiixp_modem *chip, int clock)
 		.write = snd_atiixp_ac97_write,
 		.read = snd_atiixp_ac97_read,
 	};
-	static unsigned int codec_skip[NUM_ATI_CODECS] = {
+	static const unsigned int codec_skip[NUM_ATI_CODECS] = {
 		ATI_REG_ISR_CODEC0_NOT_READY,
 		ATI_REG_ISR_CODEC1_NOT_READY,
 		ATI_REG_ISR_CODEC2_NOT_READY,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
