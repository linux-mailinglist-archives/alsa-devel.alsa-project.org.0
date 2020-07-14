Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B7221F6CE
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 18:10:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C49E1669;
	Tue, 14 Jul 2020 18:09:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C49E1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594743048;
	bh=7UHhARcBXmB3ZO+ojNXN8LNIM765zMgg5ibNzulu/Vg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kqHXY0QjMZ8VCgkYmXgPe1kGL0kjbFojJ7cP75BsFnCXQ8uIOq1L/ck5PEcvnXqyI
	 JjV0+PXRSO4CSOtmuJ5XK2FVwJOANaaxemqMCjKUvx+AXdhW/M3PCjPXoQ9RrttIb7
	 I/dJ2Tr+sVprQPY0Tcfk55DIs3qKMIFI3gBRAGUI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6725DF8016F;
	Tue, 14 Jul 2020 18:09:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80696F8019B; Tue, 14 Jul 2020 18:09:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07521F8014E
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 18:08:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07521F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="USlGF96E"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f0dd85b0002>; Tue, 14 Jul 2020 09:07:55 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 14 Jul 2020 09:08:53 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 14 Jul 2020 09:08:53 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Jul
 2020 16:08:53 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Tue, 14 Jul 2020 16:08:53 +0000
Received: from moonraker.nvidia.com (Not Verified[10.26.72.103]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f0dd8930000>; Tue, 14 Jul 2020 09:08:52 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: hda/tegra: Disable sync-write operation
Date: Tue, 14 Jul 2020 17:08:41 +0100
Message-ID: <20200714160841.2293-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1594742875; bh=i3gz+Ja8f4tqrDDaz10qB5uT8lawrEDmEtgIcA+J9Qo=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 X-NVConfidentiality:MIME-Version:Content-Type;
 b=USlGF96EkTRhPtE8f3OM1kGfq3EBY1kAaLFAP6I2NTJxcUJxr1UxmVpKTXuZSZ4S4
 krtACtUZe1lGW5UPAM5tnY5hhRy6aux9FRXrXu3CiM8AAiFWXX6lSfWvdeEbipVZ1h
 5X640rG/Y0LR/I84AJ0905spH+jtI11NFjlV/83eT4o+S+IzAyTa69//jp08Nvq4uQ
 U2IK4nckWwHKysHYIqO26QFD4RicL7d9jT+NSRPdmRtaN2VaYRc2GrTCmr1cKsAgKZ
 dClcqy48FfjQmQ6MtYJ9jahRseEutcWG/hhqOsbyJCFBr2xzkgKbrWZNOMFGPwFxKd
 HXcRrgcbPY1Lw==
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 Thierry Reding <thierry.reding@gmail.com>, Mohan Kumar <mkumard@nvidia.com>,
 Jon Hunter <jonathanh@nvidia.com>
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

Commit f34a4c9dd4ca ("ALSA: hda: Enable sync-write operation as default
for all controllers") enabled sync-write for all controllers and this is
causing audio playback on the Tegra186 HDA device to fail. For now,
disable sync-write support for Tegra to fix this.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 sound/pci/hda/hda_tegra.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 0cc5fad1af8a..5637f0129932 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -443,6 +443,7 @@ static int hda_tegra_create(struct snd_card *card,
 	if (err < 0)
 		return err;
 
+	chip->bus.core.sync_write = 0;
 	chip->bus.core.needs_damn_long_delay = 1;
 	chip->bus.core.aligned_mmio = 1;
 
-- 
2.17.1

