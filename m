Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64177B8B8F
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Sep 2019 09:32:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE7E61679;
	Fri, 20 Sep 2019 09:31:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE7E61679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568964754;
	bh=5gOlGDfsEhPnZtJaAC9mTq86fNoPntM3/GdN18xlayQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZY7x+eSiEKrURbL+iYFwDCCq+w8btbUD6WuU4ex7Dhkn+dcUuTrUrSyIxRN0Kv7Nz
	 +yt8R+yKiU1JBnvbhOtwHA7E9xtF3kGKZuB+GJKVl7RC9zhd+apjmJshfUh9jGsXY2
	 nVam0V//8EJzBuiN2LB3k+VnB6VU/R30g5g0itmU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F776F80506;
	Fri, 20 Sep 2019 09:30:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 347F2F80506; Fri, 20 Sep 2019 09:30:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8011CF80146
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 09:30:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8011CF80146
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 81BB6B622;
 Fri, 20 Sep 2019 07:30:42 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri, 20 Sep 2019 09:30:40 +0200
Message-Id: <20190920073040.31764-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Dennis Padiernos <depadiernos@gmail.com>
Subject: [alsa-devel] [PATCH] ALSA: hda - Apply AMD controller workaround
	for Raven platform
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

It's reported that the garbled sound on HP Envy x360 13z-ag000 (Ryzen
Laptop) is fixed by the same workaround applied to other AMD chips.
Update the driver_data entry for Raven (1022:15e3) to use the newly
introduced preset, AZX_DCAPS_PRESET_AMD_SB.  Since it already contains
AZX_DCAPS_PM_RUNTIME, we can drop that bit, too.

Reported-and-tested-by: Dennis Padiernos <depadiernos@gmail.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_intel.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 91e71be42fa4..240f4ca76391 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2485,8 +2485,7 @@ static const struct pci_device_id azx_ids[] = {
 			 AZX_DCAPS_PM_RUNTIME },
 	/* AMD Raven */
 	{ PCI_DEVICE(0x1022, 0x15e3),
-	  .driver_data = AZX_DRIVER_GENERIC | AZX_DCAPS_PRESET_ATI_SB |
-			 AZX_DCAPS_PM_RUNTIME },
+	  .driver_data = AZX_DRIVER_GENERIC | AZX_DCAPS_PRESET_AMD_SB },
 	/* ATI HDMI */
 	{ PCI_DEVICE(0x1002, 0x0002),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
