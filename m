Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 029C32B91FA
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Nov 2020 13:05:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99F2816FE;
	Thu, 19 Nov 2020 13:05:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99F2816FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605787552;
	bh=MC6mYsiY5JhLDa1gNMiiuIJnar4qxf4vzzfFka/rB9E=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L4UmH3D6Zwsxn8IYj15wN+OO6AJZwOp+zmz6ehczKKWoAoy+hkkC7Yz9bsntYsntm
	 nLW8SwhyJBjvXKg6Q64wy5KKYkPzRwZorxY28SkiHryRJNASpUuNgoel7mFvcmALlW
	 2MgNSY+elOylrYAjMPdno7QsMSMjJDQjviKBUfAA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1A38F801F5;
	Thu, 19 Nov 2020 13:04:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D076F801ED; Thu, 19 Nov 2020 13:04:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD629F800C5
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 13:04:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD629F800C5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0AB0BACC5
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 12:04:06 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/ca0132: Fix compile warning without PCI
Date: Thu, 19 Nov 2020 13:04:04 +0100
Message-Id: <20201119120404.16833-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
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

CONFIG_PCI=n leads to a compile warning like:
  sound/pci/hda/patch_ca0132.c:8214:10: warning: no case matching constant switch condition '0'
due to the missed handling of QUIRK_NONE in ca0132_mmio_init().
Fix it.

Fixes: bf2aa9ccc8e5 ("ALSA: hda/ca0132 - Cleanup ca0132_mmio_init function.")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_ca0132.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index e0c38f2735c6..d8370a417e3d 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -9183,6 +9183,8 @@ static void ca0132_mmio_init(struct hda_codec *codec)
 	case QUIRK_AE5:
 		ca0132_mmio_init_ae5(codec);
 		break;
+	default:
+		break;
 	}
 }
 
-- 
2.16.4

