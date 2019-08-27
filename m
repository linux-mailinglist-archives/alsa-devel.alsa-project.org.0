Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 669039EA14
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 15:50:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A6A5166F;
	Tue, 27 Aug 2019 15:49:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A6A5166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566913846;
	bh=MzPi3OkvpnImGlz25xuyi0mTYTk8gesuUn0C9PlmPGk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZtKqrPjmKKU45AE1VhEDH9oD7x2r744ZeYy9HFl2JrAiRSDOOC94isjipHGaOBvxF
	 GvNInl2zZYoFDn/YRUm2T5B1JLK7yJFpayEhtVMomVlJh4J0tyZe7IQcHUTCpHrHxo
	 ZzBCZtCZRkc3imN4H7KZeaLTxqYQM9fzUD0wk+8Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93BD5F805A0;
	Tue, 27 Aug 2019 15:48:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29C86F800E7; Tue, 27 Aug 2019 15:48:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F830F800E7
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 15:48:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F830F800E7
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37]
 helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <kai.heng.feng@canonical.com>)
 id 1i2bpN-0005tS-6V; Tue, 27 Aug 2019 13:48:05 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: bhelgaas@google.com,
	tiwai@suse.com
Date: Tue, 27 Aug 2019 21:47:56 +0800
Message-Id: <20190827134756.10807-2-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190827134756.10807-1-kai.heng.feng@canonical.com>
References: <20190827134756.10807-1-kai.heng.feng@canonical.com>
Cc: linux-pci@vger.kernel.org, alsa-devel@alsa-project.org,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH 2/2] ALSA: hda: Allow HDA to be runtime
	suspended when dGPU is not bound
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

It's a common practice to let dGPU unbound and use PCI port PM to
disable its power through _PR3. When the dGPU comes with an HDA
function, the HDA won't be suspended if the dGPU is unbound, so the dGPU
power can't be disabled.

Commit 37a3a98ef601 ("ALSA: hda - Enable runtime PM only for
discrete GPU") only allows HDA to be runtime-suspended once GPU is
bound, to keep APU's HDA working.

However, HDA on dGPU isn't that useful if dGPU is unbound. So let relax
the runtime suspend requirement for dGPU's HDA function, to save lots of
power.

BugLink: https://bugs.launchpad.net/bugs/1840835
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 sound/pci/hda/hda_intel.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 99fc0917339b..d4ee070e1a29 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1285,7 +1285,8 @@ static void init_vga_switcheroo(struct azx *chip)
 		dev_info(chip->card->dev,
 			 "Handle vga_switcheroo audio client\n");
 		hda->use_vga_switcheroo = 1;
-		hda->need_eld_notify_link = 1; /* cleared in gpu_bound op */
+		/* cleared in gpu_bound op */
+		hda->need_eld_notify_link = !pci_pr3_present(p);
 		chip->driver_caps |= AZX_DCAPS_PM_RUNTIME;
 		pci_dev_put(p);
 	}
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
