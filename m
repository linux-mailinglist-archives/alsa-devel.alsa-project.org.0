Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEF6118A13
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 14:42:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD0BA1657;
	Tue, 10 Dec 2019 14:41:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD0BA1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575985323;
	bh=0xGNYlr5T4ukqv2azDzt9k9B5ZEHk4EVhDFrZKWtdyU=;
	h=In-Reply-To:References:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EamRyB/ljkgxr3Ygeng3Hu45vNK7FBhEiunhDVMAnsc2gn6bzBEStNaOOxA9Q6Gf9
	 UYSLjyNDOw+fvPNoGbw6R2Nru1mSbWMPKgH8dWnkiDDcQNJ8bTeMnRVpq3gSwMTX9d
	 p+Y/DGuSAQoKkK+22CIIhAxmcRzKG1b9SX/VP3C4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C862EF80248;
	Tue, 10 Dec 2019 14:40:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5CE5F801D8; Tue, 10 Dec 2019 14:40:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout3.hostsharing.net (mailout3.hostsharing.net
 [IPv6:2a01:4f8:150:2161:1:b009:f236:0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D9C9F800F3
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 14:39:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D9C9F800F3
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
 by mailout3.hostsharing.net (Postfix) with ESMTPS id CC914101E692D;
 Tue, 10 Dec 2019 14:39:53 +0100 (CET)
Received: from localhost (pd95be530.dip0.t-ipconnect.de [217.91.229.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by h08.hostsharing.net (Postfix) with ESMTPSA id 545A661C7F8C;
 Tue, 10 Dec 2019 14:39:53 +0100 (CET)
X-Mailbox-Line: From 77aa6c01aefe1ebc4004e87b0bc714f2759f15c4 Mon Sep 17
 00:00:00 2001
Message-Id: <77aa6c01aefe1ebc4004e87b0bc714f2759f15c4.1575985006.git.lukas@wunner.de>
In-Reply-To: <PSXP216MB0438BFEAA0617283A834E11580580@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM>
References: <PSXP216MB0438BFEAA0617283A834E11580580@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM>
From: Lukas Wunner <lukas@wunner.de>
Date: Tue, 10 Dec 2019 14:39:50 +0100
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org,
 Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <helgaas@kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [alsa-devel] [PATCH] ALSA: hda/hdmi - Fix duplicate unref of pci_dev
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

Nicholas Johnson reports a null pointer deref as well as a refcount
underflow upon hot-removal of a Thunderbolt-attached AMD eGPU.
He's bisected the issue down to commit 586bc4aab878 ("ALSA: hda/hdmi -
fix vgaswitcheroo detection for AMD").

The commit iterates over PCI devices using pci_get_class() and
unreferences each device found, even though pci_get_class()
subsequently unreferences the device as well.  Fix it.

Fixes: 586bc4aab878 ("ALSA: hda/hdmi - fix vgaswitcheroo detection for AMD")
Link: https://lore.kernel.org/r/PSXP216MB0438BFEAA0617283A834E11580580@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM/
Reported-and-tested-by: Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>
Signed-off-by: Lukas Wunner <lukas@wunner.de>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Alexander Deucher <alexander.deucher@amd.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>
---
 sound/pci/hda/hda_intel.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 35b4526f0d28..b856b89378ac 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1419,7 +1419,6 @@ static bool atpx_present(void)
 				return true;
 			}
 		}
-		pci_dev_put(pdev);
 	}
 	return false;
 }
-- 
2.24.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
