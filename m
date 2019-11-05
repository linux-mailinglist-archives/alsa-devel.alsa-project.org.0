Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E377EF71D
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 09:20:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 250191710;
	Tue,  5 Nov 2019 09:19:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 250191710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572942014;
	bh=Qldwp+pqakABxoarWgBUTbQqS/jdih3FkaJt5DoEVUc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Qrk1080xV7IfUDvt1XlFE/dmGMdYhKoZQklwQlHL9Z8rFi3G+EDEoh0HPjRe3AcH8
	 HjiyVHbGvyURD6MnOmDfJY4qYRZBERe+7wriiLR+HJw2EkKmW5a4MoWG49Tsw0j4X3
	 fiP2Nn4A20fB+QdJZN5byDQqPdOrOg6jF7dCAtSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79C57F8053B;
	Tue,  5 Nov 2019 09:18:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9583F8049B; Tue,  5 Nov 2019 09:18:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5B5AF800F3
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 09:18:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5B5AF800F3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AA465AF95
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 08:18:23 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue,  5 Nov 2019 09:18:06 +0100
Message-Id: <20191105081806.4896-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH] ALSA: hda: Disable regmap internal locking
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

Since we apply the own mutex (bus->cmd_mutex) in HDA core side, the
internal locking in regmap is superfluous.  This patch adds the flag
to indicate that.

Also, an infamous side-effect by this change is that it disables the
regmap debugfs, too, and this is seen rather good; the regmap debugfs
isn't quite useful for HD-audio as it provides the very sparse
registers and its debugfs access tends to lead to the way too high
resource usages or sometimes hang up.  So it'd be rather safe to
disable it altogether.

Link: https://lore.kernel.org/r/2029139028.10333037.1572874551626.JavaMail.zimbra@redhat.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/hdac_regmap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/hdac_regmap.c b/sound/hda/hdac_regmap.c
index 286361ecd640..906b1e20bae0 100644
--- a/sound/hda/hdac_regmap.c
+++ b/sound/hda/hdac_regmap.c
@@ -363,6 +363,7 @@ static const struct regmap_config hda_regmap_cfg = {
 	.reg_write = hda_reg_write,
 	.use_single_read = true,
 	.use_single_write = true,
+	.disable_locking = true,
 };
 
 /**
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
