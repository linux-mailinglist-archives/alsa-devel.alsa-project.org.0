Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CC9251178
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 07:27:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA4FB1686;
	Tue, 25 Aug 2020 07:26:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA4FB1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598333230;
	bh=lNB5Z/rhUOiHKBhyl465TtiHvBjGFR98jhwYXJAAHT0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VHK50waBYx/q3W/HXTFY/u8Tsq1otLbAgR3i9y0aGSv/DEgFDQmT1V6vb91N96FYk
	 OIBlNyLn3CkyUTaP0M1aEHV3xxUqWktv8Ui+ViM96dGPKXdG+BptMXzO3qdHztuQ6I
	 0xkOxTpgBR2JfUPI0FkwjJJlyijZoGyTTnlSwBz4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBC7CF80299;
	Tue, 25 Aug 2020 07:24:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 881B0F80260; Tue, 25 Aug 2020 07:24:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA979F80143
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 07:24:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA979F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="Ed1atWGo"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f44a01a0000>; Mon, 24 Aug 2020 22:22:34 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 24 Aug 2020 22:24:33 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 24 Aug 2020 22:24:33 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 25 Aug
 2020 05:24:33 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 25 Aug 2020 05:24:33 +0000
Received: from mkumard.nvidia.com (Not Verified[10.24.34.162]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f44a08f0000>; Mon, 24 Aug 2020 22:24:32 -0700
From: Mohan Kumar <mkumard@nvidia.com>
To: <tiwai@suse.com>, <aplattner@nvidia.com>, <spujar@nvidia.com>
Subject: [PATCH 2/2] ALSA: hda/tegra: Program WAKEEN register for Tegra
Date: Tue, 25 Aug 2020 10:54:15 +0530
Message-ID: <20200825052415.20626-3-mkumard@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200825052415.20626-1-mkumard@nvidia.com>
References: <20200825052415.20626-1-mkumard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1598332954; bh=V3k7pXWGgN/GZqoe8TtrBUUNuwi6xsjpgkCnABrzqZw=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Type;
 b=Ed1atWGoVtIPM0hItslm2xpcLvv1ty/Cmb0WPt+BLSTIwtfDYU8ZC0npsWBS6olqn
 EqsQ34LoR4h9BiKTZcm2WTSBtQtModoyvIe5JAVez7opiWjWocHg2X1tAnNXOB0WUb
 gIrYFFrj14MQIiQt1/9baPSCyuWBUjqs7cmrvboJOIHnpAosflz5wU5lfq0nSzIp7F
 2piJJEfpJ46LWhUydEFewcY8a71Or78RoTpAQGGvU0fFWdxitKnUHQ6uQ5Sk11MYuX
 ocDenPh9tg4+wJh7/J93aBgH+mgkC0Lwh8IyL+NdVV5Pc/2keCTu9e6tG245apwXCK
 jd4buSbx4WnrQ==
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 treding@nvidia.com, Mohan Kumar <mkumard@nvidia.com>, jonathanh@nvidia.com
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

The WAKEEN bits are used to indicate which bits in the
STATESTS register may cause wake event during the codec
state change request. Configure the WAKEEN register for
the Tegra to detect the wake events.

Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
---
 sound/pci/hda/hda_tegra.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index c94553bcca88..70164d1428d4 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -179,6 +179,10 @@ static int __maybe_unused hda_tegra_runtime_suspend(struct device *dev)
 	struct hda_tegra *hda = container_of(chip, struct hda_tegra, chip);
 
 	if (chip && chip->running) {
+		/* enable controller wake up event */
+		azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) |
+			   STATESTS_INT_MASK);
+
 		azx_stop_chip(chip);
 		azx_enter_link_reset(chip);
 	}
@@ -200,6 +204,9 @@ static int __maybe_unused hda_tegra_runtime_resume(struct device *dev)
 	if (chip && chip->running) {
 		hda_tegra_init(hda);
 		azx_init_chip(chip, 1);
+		/* disable controller wake up event*/
+		azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) &
+			   ~STATESTS_INT_MASK);
 	}
 
 	return 0;
-- 
2.17.1

