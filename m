Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8694F2F70
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 14:14:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83CCB17DC;
	Tue,  5 Apr 2022 14:13:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83CCB17DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649160887;
	bh=+7H+UNtukcqj5+PZFgw3Yc/3Dld7H+mJAp+cwsuTHvg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d8glw44bmMwOeDuBlNk0MjsW/qwZI2QqlJOJb41ChiPHAYAo+Ddblxvafy1Ixg81E
	 c5RpGOEpj32UuGng6Rl/yqve5ZyjAc6axcFshP51jnx+iNtDpn9Z+norL68+rW/Pmn
	 ujPqAzNqlDbbprZrlqgxlKAg8OOUEza3ETlbufzs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E720CF800D2;
	Tue,  5 Apr 2022 14:13:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B372F8016A; Tue,  5 Apr 2022 14:13:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id D3F8AF8012C
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 14:13:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3F8AF8012C
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EB9ED6E;
 Tue,  5 Apr 2022 05:13:37 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9F7643F5A1;
 Tue,  5 Apr 2022 05:13:36 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ALSA: emu10k1: Stop using iommu_present()
Date: Tue,  5 Apr 2022 13:13:33 +0100
Message-Id: <5ac9b54285b2189b848da2595408eb3cae8e5e9d.1649160813.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: iommu@lists.linux-foundation.org, alsa-devel@alsa-project.org,
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

iommu_get_domain_for_dev() is already perfectly happy to return NULL
if the given device has no IOMMU. Drop the unnecessary check.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 sound/pci/emu10k1/emu10k1_main.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index 86cc1ca025e4..5ffab343b89c 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -1751,9 +1751,6 @@ static void snd_emu10k1_detect_iommu(struct snd_emu10k1 *emu)
 
 	emu->iommu_workaround = false;
 
-	if (!iommu_present(emu->card->dev->bus))
-		return;
-
 	domain = iommu_get_domain_for_dev(emu->card->dev);
 	if (domain && domain->type == IOMMU_DOMAIN_IDENTITY)
 		return;
-- 
2.28.0.dirty

