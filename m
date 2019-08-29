Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D89A1E84
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 17:11:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AB391708;
	Thu, 29 Aug 2019 17:10:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AB391708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567091469;
	bh=7ZYjdJTuYvRbbWgKru6VlBU5CZclt8C4x3OtUv6IM8Q=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UqqCrhq/AphV37ruQnA/aiXzVLLt/dmrNXwSlsW/SeZvkzkffuRsH+2uDXedaGBZj
	 KxPC99ojYkfcCjiPHZhMzuR7umhsZoociZDWkiTPKYStynltAVDjAikfbLEfmnOI2y
	 uqGK8AhB+Vn/ckvQ6p4pbTLu2qtXXzcHhCdN4BI4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A00D3F89840;
	Thu, 29 Aug 2019 10:11:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EC4AF8983E; Thu, 29 Aug 2019 10:11:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E36CDF8983C
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 10:10:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E36CDF8983C
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 422A2AD35
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 08:10:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu, 29 Aug 2019 10:10:43 +0200
Message-Id: <20190829081043.18432-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH] ALSA: hda - Fix potential endless loop at
	applying quirks
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

Since the chained quirks via chained_before flag is applied before the
depth check, it may lead to the endless recursive calls, when the
chain were set up incorrectly.  Fix it by moving the depth check at
the beginning of the loop.

Fixes: 1f57825077dc ("ALSA: hda - Add chained_before flag to the fixup entry")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_auto_parser.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/hda_auto_parser.c b/sound/pci/hda/hda_auto_parser.c
index 8a134f750bae..2c6d2becfe1a 100644
--- a/sound/pci/hda/hda_auto_parser.c
+++ b/sound/pci/hda/hda_auto_parser.c
@@ -824,6 +824,8 @@ static void apply_fixup(struct hda_codec *codec, int id, int action, int depth)
 	while (id >= 0) {
 		const struct hda_fixup *fix = codec->fixup_list + id;
 
+		if (++depth > 10)
+			break;
 		if (fix->chained_before)
 			apply_fixup(codec, fix->chain_id, action, depth + 1);
 
@@ -863,8 +865,6 @@ static void apply_fixup(struct hda_codec *codec, int id, int action, int depth)
 		}
 		if (!fix->chained || fix->chained_before)
 			break;
-		if (++depth > 10)
-			break;
 		id = fix->chain_id;
 	}
 }
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
