Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9519F8CA1C
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 06:11:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21D4D169C;
	Wed, 14 Aug 2019 06:10:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21D4D169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565755880;
	bh=6Kgk8VgXLLac1Oa4zZ+1jROsTtCynw6eN3Q4x3sQMgc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bHr70Q+GV14b+9uVSPysX2R6DBcuIICFuO0sHKb4ljmOC8P9zBr4PbaVmGxWsrjyU
	 vS90Hjb2GCNXOA/tSx4nrSn7A35MdGK3XGNSeYa9gteJWp66SNX1CBRdx9d1IwHBUP
	 IuEAfegXK4FnGrlStEQea6NvS89EBZNfzE80ZVZg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1345FF80214;
	Wed, 14 Aug 2019 06:09:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19DDCF80268; Wed, 14 Aug 2019 06:09:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50DA5F801DF
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 06:09:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50DA5F801DF
Received: from [114.254.46.119] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <hui.wang@canonical.com>)
 id 1hxkbJ-0000CA-3b; Wed, 14 Aug 2019 04:09:29 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Wed, 14 Aug 2019 12:09:07 +0800
Message-Id: <20190814040908.9758-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.17.1
Cc: stable@vger.kernel.org
Subject: [alsa-devel] [PATCH 1/2] ALSA: hda - Let all conexant codec enter
	D3 when rebooting
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

We have 3 new lenovo laptops which have conexant codec 0x14f11f86,
these 3 laptops also have the noise issue when rebooting, after
letting the codec enter D3 before rebooting or poweroff, the noise
disappers.

Instead of adding a new ID again in the reboot_notify(), let us make
this function apply to all conexant codec. In theory make codec enter
D3 before rebooting or poweroff is harmless, and I tested this change
on a couple of other Lenovo laptops which have different conexant
codecs, there is no side effect so far.

Cc: stable@vger.kernel.org
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/patch_conexant.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index f299f137eaea..93a303676aea 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -163,15 +163,6 @@ static void cx_auto_reboot_notify(struct hda_codec *codec)
 {
 	struct conexant_spec *spec = codec->spec;
 
-	switch (codec->core.vendor_id) {
-	case 0x14f12008: /* CX8200 */
-	case 0x14f150f2: /* CX20722 */
-	case 0x14f150f4: /* CX20724 */
-		break;
-	default:
-		return;
-	}
-
 	/* Turn the problematic codec into D3 to avoid spurious noises
 	   from the internal speaker during (and after) reboot */
 	cx_auto_turn_eapd(codec, spec->num_eapds, spec->eapds, false);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
