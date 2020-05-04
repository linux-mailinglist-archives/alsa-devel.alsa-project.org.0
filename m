Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1AE1C3437
	for <lists+alsa-devel@lfdr.de>; Mon,  4 May 2020 10:18:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E02216E7;
	Mon,  4 May 2020 10:17:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E02216E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588580307;
	bh=bfNTq8X3SPke2UgsUa2HjQnpURAiJXtcTn9LqIay8Cw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iSpVULYC/quQq9ZeuwqzzDEox7HGG1+wdq0+E00nPrp6wH/WDdyVLVhEnWClvqbXg
	 r8/QVWPdcNZnUFUE+TwXi460GoI4SlOC5fam8VXy3MsMpd8MlNQGB6ZWPVjKgz85+p
	 1WuOjSfEhutt+trZ4ItAaPQ1+N/KDo6GoB7iOBms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85C4FF800DE;
	Mon,  4 May 2020 10:16:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C75DAF80249; Mon,  4 May 2020 10:16:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98C3DF800DE
 for <alsa-devel@alsa-project.org>; Mon,  4 May 2020 10:16:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98C3DF800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="GgqI2nXc"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5eafcee50001>; Mon, 04 May 2020 01:14:30 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 04 May 2020 01:16:37 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 04 May 2020 01:16:37 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 4 May
 2020 08:16:36 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 4 May 2020 08:16:36 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5eafcf600002>; Mon, 04 May 2020 01:16:35 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <perex@perex.cz>, <tiwai@suse.com>
Subject: [PATCH 0/3] Tegra194 HW Fixes
Date: Mon, 4 May 2020 13:46:13 +0530
Message-ID: <1588580176-2801-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1588580070; bh=zUEiA6/N+ok9bG2zchOM1YIm2uvHGbS/o7XvZezsxfM=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:Content-Type;
 b=GgqI2nXcuC6ccVS6bieRn5Iw7/KjOyCod8MRs9TCbQcNxbiOTQV8sblj3cBiNIjGf
 p6hU0CwveBHLEgKfzNUS1XKAPKV7ONCxWbbnUMzRX3ymljjqibisdZUJDcWbamKKXu
 BJF9XpoTAOtIvI5BciTZAJUsyL5Nc68G+JqIMGy/uwxKuXc4+f6E250YoRFpaTzDA0
 IpdXP6xBP+elHtR5gyh4BQ7EgKdrl9W9So2zPWh2XyZPPMobiFlKVHUj8w845iUlkx
 bZj/YSV+HRfogPSl1+2Z8MX8rCtow1e6oj5QLvH2+YfYVwCXUO6X4Z4Wt9hjr71IgB
 voxUOYky7/L+w==
Cc: alsa-devel@alsa-project.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, thierry.reding@gmail.com, atalambedu@nvidia.com,
 linux-tegra@vger.kernel.org, rlokhande@nvidia.com, mkumard@nvidia.com,
 dramesh@nvidia.com
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

This series proposes SW workarounds for Tegra194 HDA HW bugs.
Following are the two issues seen:
 1. GCAP register does not reflect true capability.
    The actual number of SDO lines is "4", where as it reflects "2".
 2. With 4 SDO line configuration playback fails for,
    44.1K/48K, 2-channel, 16-bps audio stream.

After fixing [1], issue [2] is uncovered.
As per recommendation by Tegra HW team the workarounds are pushed.

Testing done
============
 * Verify GCAP register after registering HDA sound card
 * Verify audio playback for 44.1K/48K, 2-channel, 16-bps.

Sameer Pujar (3):
  ALSA: hda/tegra: correct number of SDO lines for Tegra194
  ALSA: hda: add member to store ratio for stripe control
  ALSA: hda/tegra: workaround playback failure on Tegra194

 include/sound/hdaudio.h     |  3 +++
 sound/hda/hdac_controller.c | 11 ++++++++++
 sound/hda/hdac_stream.c     |  2 +-
 sound/pci/hda/hda_tegra.c   | 50 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 65 insertions(+), 1 deletion(-)

-- 
2.7.4

