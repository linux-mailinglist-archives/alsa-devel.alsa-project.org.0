Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D90C1AD937
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 10:58:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FEAC1663;
	Fri, 17 Apr 2020 10:57:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FEAC1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587113893;
	bh=wQMHWpXPklsxFgX2uPWwcudF+qbeMgCFjsaK312hNw8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jQbwZs5cpq73i31feW6QZVq2KrYF2AckQiY3AqEeSD6obY9jVdGVaCbA1kOnZfeZa
	 mIMVyvvtsccbVpRJiMiCyY3Z91R3gG8vIXw8C/frGDudkxZ0eVHoXK1XhuQpOlEDhG
	 BykcfrIjjt3tIowDCqqAv/iJ+q9Nem7SDu/5xInc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66FBCF800AB;
	Fri, 17 Apr 2020 10:56:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C17C2F80245; Fri, 17 Apr 2020 10:56:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9B64F800AB
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 10:56:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9B64F800AB
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id D73A273877486DB52B06;
 Fri, 17 Apr 2020 16:56:17 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Fri, 17 Apr 2020
 16:56:07 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <hariprasad.kelam@gmail.com>,
 <yanaijie@huawei.com>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] ALSA: au88x0: remove some dead code
Date: Fri, 17 Apr 2020 17:22:32 +0800
Message-ID: <20200417092232.13371-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Cc: Hulk Robot <hulkci@huawei.com>
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

Fix the following gcc warning:

sound/pci/au88x0/au88x0_a3ddata.c:62:25: warning: ‘A3dHrirDImpulse’
defined but not used [-Wunused-const-variable=]
 static const a3d_Hrtf_t A3dHrirDImpulse = {
                         ^~~~~~~~~~~~~~~
sound/pci/au88x0/au88x0_a3ddata.c:50:25: warning: ‘A3dHrirSatTest’
defined but not used [-Wunused-const-variable=]
 static const a3d_Hrtf_t A3dHrirSatTest = {
                         ^~~~~~~~~~~~~~
sound/pci/au88x0/au88x0_a3ddata.c:33:25: warning: ‘A3dHrirOnes’ defined
but not used [-Wunused-const-variable=]
 static const a3d_Hrtf_t A3dHrirOnes = {
                         ^~~~~~~~~~~

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 sound/pci/au88x0/au88x0_a3d.c     | 23 -------------------
 sound/pci/au88x0/au88x0_a3ddata.c | 38 -------------------------------
 2 files changed, 61 deletions(-)

diff --git a/sound/pci/au88x0/au88x0_a3d.c b/sound/pci/au88x0/au88x0_a3d.c
index 2db183f8826a..4d3b79a34c69 100644
--- a/sound/pci/au88x0/au88x0_a3d.c
+++ b/sound/pci/au88x0/au88x0_a3d.c
@@ -512,31 +512,8 @@ static void a3dsrc_ProgramPipe(a3dsrc_t * a)
 	/* Single spike leads to identity transfer function. */
 	a3dsrc_SetHrtfCurrent(a, A3dHrirImpulse, A3dHrirImpulse);
 	a3dsrc_SetHrtfTarget(a, A3dHrirImpulse, A3dHrirImpulse);
-
-	/* Test: Sounds saturated. */
-	//a3dsrc_SetHrtfCurrent(a, A3dHrirSatTest, A3dHrirSatTest);
-	//a3dsrc_SetHrtfTarget(a, A3dHrirSatTest, A3dHrirSatTest);      
 }
 
-/* VDB = Vortex audio Dataflow Bus */
-#if 0
-static void a3dsrc_ClearVDBData(a3dsrc_t * a, unsigned long aa)
-{
-	vortex_t *vortex = (vortex_t *) (a->vortex);
-
-	// ((aa >> 2) << 8) - (aa >> 2)
-	hwwrite(vortex->mmio,
-		a3d_addrS(a->slice, A3D_SLICE_VDBDest) + (a->source << 2), 0);
-	hwwrite(vortex->mmio,
-		a3d_addrS(a->slice,
-			  A3D_SLICE_VDBDest + 4) + (a->source << 2), 0);
-	/*
-	   hwwrite(vortex->mmio, 0x19c00 + (((aa>>2)*255*4)+aa)*8, 0);
-	   hwwrite(vortex->mmio, 0x19c04 + (((aa>>2)*255*4)+aa)*8, 0);
-	 */
-}
-#endif
-
 /* A3D HwSource stuff. */
 
 static void vortex_A3dSourceHw_Initialize(vortex_t * v, int source, int slice)
diff --git a/sound/pci/au88x0/au88x0_a3ddata.c b/sound/pci/au88x0/au88x0_a3ddata.c
index 18623cb6bc52..cc41ea67a6d3 100644
--- a/sound/pci/au88x0/au88x0_a3ddata.c
+++ b/sound/pci/au88x0/au88x0_a3ddata.c
@@ -30,44 +30,6 @@ static const a3d_Hrtf_t A3dHrirImpulse = {
 	0, 0, 0
 };
 
-static const a3d_Hrtf_t A3dHrirOnes = {
-	0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff,
-	0x7fff,
-	0x7fff,
-	0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff,
-	0x7fff,
-	0x7fff,
-	0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff,
-	0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff,
-	0x7fff,
-	0x7fff,
-	0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff,
-	0x7fff,
-	0x7fff,
-	0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff
-};
-
-static const a3d_Hrtf_t A3dHrirSatTest = {
-	0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff,
-	0x7fff,
-	0x7fff,
-	0x8001, 0x8001, 0x8001, 0x8001, 0x8001, 0x8001, 0x8001, 0x8001,
-	0x8001,
-	0x8001,
-	0x7fff, 0x0000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-	0, 0, 0,
-	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
-};
-
-static const a3d_Hrtf_t A3dHrirDImpulse = {
-	0, 0x7fff, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-	0, 0, 0,
-	0, 0, 0, 0,
-	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-	0, 0, 0,
-	0, 0, 0
-};
-
 static const a3d_ItdDline_t A3dItdDlineZeros = {
 	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
-- 
2.21.1

