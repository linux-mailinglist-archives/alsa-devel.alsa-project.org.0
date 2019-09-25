Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E68F1BDD39
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2019 13:35:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E78CF16DF;
	Wed, 25 Sep 2019 13:34:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E78CF16DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569411339;
	bh=qImkegdeL0/QhXUHNx1eUlrQmXTh7TrMGZL3+4TP/XE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JgNIGYTpfQvGMiKma4D/glW31vddKaRgYJk0CmdsttXARM03QMIfSCdUAmzvkFbk0
	 uJD6avrF5J07ruDgVH7smoX5W7GhKpOooxGWCLRlh104ZSyWozfqrX+9m07pkQ1Liz
	 J0mowIYMvxu5q/m9+5J3DwqGOBUTyQYwUIdP8D5I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB0E1F805FC;
	Wed, 25 Sep 2019 13:33:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1FEAF805FA; Wed, 25 Sep 2019 13:33:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3113BF805F8
 for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2019 13:33:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3113BF805F8
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1iD5Xc-00040S-Ng; Wed, 25 Sep 2019 11:33:05 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: bhelgaas@google.com,
	tiwai@suse.com
Date: Wed, 25 Sep 2019 19:32:55 +0800
Message-Id: <20190925113255.25062-2-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190925113255.25062-1-kai.heng.feng@canonical.com>
References: <20190925113255.25062-1-kai.heng.feng@canonical.com>
Cc: linux-pci@vger.kernel.org, alsa-devel@alsa-project.org,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v4 2/2] ALSA: hda: Allow HDA to be runtime
	suspended when dGPU is not bound to a driver
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

Nvidia proprietary driver doesn't support runtime power management, so
when a user only wants to use the integrated GPU, it's a common practice
to let dGPU not to bind any driver, and let its upstream port to be
runtime suspended. At the end of runtime suspension the port uses
platform power management to disable power through _OFF method of power
resource, which is listed by _PR3.

After commit b516ea586d71 ("PCI: Enable NVIDIA HDA controllers"), when
the dGPU comes with an HDA function, the HDA won't be suspended if the
dGPU is unbound, so the power resource can't be turned off by its
upstream port driver.

Commit 37a3a98ef601 ("ALSA: hda - Enable runtime PM only for
discrete GPU") only allows HDA to be runtime suspended once GPU is
bound, to keep APU's HDA working.

However, HDA on dGPU isn't that useful if dGPU is not bound to any
driver.  So let's relax the runtime suspend requirement for dGPU's HDA
function, to disable the power source to save lots of power.

BugLink: https://bugs.launchpad.net/bugs/1840835
Fixes: b516ea586d71 ("PCI: Enable NVIDIA HDA controllers")
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
v4:
- Find upstream port, it's callee's responsibility now.
v3:
- Make changelog more clear.
v2:
- Change wording.
- Rebase to Tiwai's branch.
 sound/pci/hda/hda_intel.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 240f4ca76391..e63b871343e5 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1280,11 +1280,17 @@ static void init_vga_switcheroo(struct azx *chip)
 {
 	struct hda_intel *hda = container_of(chip, struct hda_intel, chip);
 	struct pci_dev *p = get_bound_vga(chip->pci);
+	struct pci_dev *parent;
 	if (p) {
 		dev_info(chip->card->dev,
 			 "Handle vga_switcheroo audio client\n");
 		hda->use_vga_switcheroo = 1;
-		chip->bus.keep_power = 1; /* cleared in either gpu_bound op or codec probe */
+
+		/* cleared in either gpu_bound op or codec probe, or when its
+		 * upstream port has _PR3 (i.e. dGPU).
+		 */
+		parent = pci_upstream_bridge(p);
+		chip->bus.keep_power = parent ? !pci_pr3_present(parent) : 1;
 		chip->driver_caps |= AZX_DCAPS_PM_RUNTIME;
 		pci_dev_put(p);
 	}
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
