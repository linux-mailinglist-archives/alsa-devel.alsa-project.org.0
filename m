Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 585044D1A56
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 15:23:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 508EB17B2;
	Tue,  8 Mar 2022 15:23:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 508EB17B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646749435;
	bh=4n2bs1BaHZFrHtWLk+m+rfBUED9GCu9sznDGRPtTjEE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NhH5GKLIkJ7mVeoLbxi4zLJ8N9v2ONocQbuybPzihN6WcS7kxX7LL+sepePfagG4S
	 EC/UAvOA1/Pd3uHm6a2otII+5re4iE/JWz0gZYJIDroSfkoYmoNJ8iJVvBZY+x2lYO
	 I608DxslPZgq+maqfqeJV5uIa0sxKQyAGjPErrl8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E98EEF80271;
	Tue,  8 Mar 2022 15:23:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 782DAF800D1; Tue,  8 Mar 2022 15:23:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02506F800D1
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 15:22:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02506F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DK6rV52C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646749378; x=1678285378;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4n2bs1BaHZFrHtWLk+m+rfBUED9GCu9sznDGRPtTjEE=;
 b=DK6rV52CeELUYfB1g1urWG8lxkL0e9nUPcHRnWm2USKdZppq5ky9+Uoh
 xEeHTe8k3vY1cwI4mlSlpgM/Lc+NnR5EDivIee/wXz4edfaYPpMFNrgWv
 Fk9ZAIDFqYnmhV1wQcjbX+KaokYcbHar1vgBVSIzgTXDVjObi4ocKzZIt
 IQUNzxN+6UaK56ldYA4rikInSqXVEko96hTDMFoJzEm2gXzbsv17JlRFi
 wIzjpqnABrAN1YPuAgewICqRWfhneinBhyc1kDycjt4Wx9lIoWCAUj7zH
 y2fL7XvQpYs6tS/4qjkuuPyq2gzaKtR2eR3M7TMN/J28NRNNWL3LOZ2eg Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254631815"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="254631815"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 06:22:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="578003754"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga001.jf.intel.com with ESMTP; 08 Mar 2022 06:22:25 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH] ALSA: hda: Add AlderLake-PS variant PCI ID
Date: Tue,  8 Mar 2022 16:13:22 +0200
Message-Id: <20220308141322.880775-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com
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

Add HD Audio PCI ID for a variant of Intel AlderLake-P.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/pci/hda/hda_intel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 5af7a1e18013..0a83eb6b88b1 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2499,6 +2499,8 @@ static const struct pci_device_id azx_ids[] = {
 	/* Alderlake-P */
 	{ PCI_DEVICE(0x8086, 0x51c8),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
+	{ PCI_DEVICE(0x8086, 0x51c9),
+	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
 	{ PCI_DEVICE(0x8086, 0x51cd),
 	  .driver_data = AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE},
 	/* Alderlake-M */

base-commit: fd7698cf0858f8c5e659b655109cd93c2f15cdd3
prerequisite-patch-id: 0259e96fec7d4c6138df07807ca8fbc6f73e0c31
-- 
2.35.1

