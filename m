Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10816302261
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jan 2021 08:19:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB127186E;
	Mon, 25 Jan 2021 08:18:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB127186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611559165;
	bh=c1+b8G+pKb1nQbK8jjJnq95HygYb5aUJVYkgYWFuhhA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BArA4H6l60SyRtpR3kkDMmKIow8XnoYK0OR4AZI6B2HR6nX2K00hk3RgOYDX3UyyA
	 tAb5JFmdpKFp94ylThjcklx1sb5e3wLWD7HR5hGNv1rm8ngNl79tiiZufrVDq1wNWT
	 NcucYjic3wXwxKb38qR+56/4RY16O6Ph/+zVxHG0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31C67F8014D;
	Mon, 25 Jan 2021 08:17:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9928EF80218; Mon, 25 Jan 2021 08:17:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC5BBF8012D
 for <alsa-devel@alsa-project.org>; Mon, 25 Jan 2021 08:17:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC5BBF8012D
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R791e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357;
 MF=abaci-bugfix@linux.alibaba.com; NM=1; PH=DS; RN=11; SR=0;
 TI=SMTPD_---0UMkwr09_1611559048; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:abaci-bugfix@linux.alibaba.com
 fp:SMTPD_---0UMkwr09_1611559048) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 25 Jan 2021 15:17:32 +0800
From: Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
To: perex@perex.cz
Subject: [PATCH] ALSA: hda: Assign boolean values to a bool variable
Date: Mon, 25 Jan 2021 15:17:27 +0800
Message-Id: <1611559047-106928-1-git-send-email-abaci-bugfix@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, hui.wang@canonical.com,
 kai.heng.feng@canonical.com, Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>,
 rppt@kernel.org
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

Fix the following coccicheck warnings:

./sound/pci/hda/hda_intel.c:2309:3-23: WARNING: Assignment of
0/1 to bool variable.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
---
 sound/pci/hda/hda_intel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 5a50d3a..24e9762 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2304,7 +2304,7 @@ static int azx_probe_continue(struct azx *chip)
 
 		/* HSW/BDW controllers need this power */
 		if (CONTROLLER_IN_GPU(pci))
-			hda->need_i915_power = 1;
+			hda->need_i915_power = true;
 	}
 
 	/* Request display power well for the HDA controller or codec. For
-- 
1.8.3.1

