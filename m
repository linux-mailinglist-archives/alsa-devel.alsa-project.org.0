Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE22E23C8B9
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Aug 2020 11:13:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 743331666;
	Wed,  5 Aug 2020 11:12:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 743331666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596618808;
	bh=xizJCmSCGwKIH7IyT5/jNECCyc1mca96bAaOVep9ubw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Opm/HaoRBZ0lj0PWRaF/MO12g10lymClj1nP0BDu1TIFU7GH9pLkPpOU9K5L4yGZ2
	 wXGJUPRa4VBxhuuo1SjUhLC+Bc8dsLawc9+8VuggVulTaGHT56F0MzIpePNjCUVbpL
	 QFsSdEPnr38NgqeCwwiPEpxBMTtPZ0AcE6IbmHDU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC1ACF800B7;
	Wed,  5 Aug 2020 11:11:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CACBFF80234; Wed,  5 Aug 2020 11:11:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4A45F800B7
 for <alsa-devel@alsa-project.org>; Wed,  5 Aug 2020 11:11:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4A45F800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="YTZrZVBj"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f2a77950001>; Wed, 05 Aug 2020 02:10:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 05 Aug 2020 02:11:34 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 05 Aug 2020 02:11:34 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 5 Aug
 2020 09:11:34 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Wed, 5 Aug 2020 09:11:34 +0000
Received: from mkumard.nvidia.com (Not Verified[10.24.34.162]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f2a77c40000>; Wed, 05 Aug 2020 02:11:33 -0700
From: Mohan Kumar <mkumard@nvidia.com>
To: <tiwai@suse.com>, <perex@perex.cz>
Subject: [PATCH 0/3] Tegra Specific fixes
Date: Wed, 5 Aug 2020 14:41:13 +0530
Message-ID: <20200805091116.2314-1-mkumard@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1596618645; bh=5slDGC1M33xL2s2ysl137a0ShsilwhhCiWFS/kOUJDM=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:Content-Type;
 b=YTZrZVBj98V1+qq0MPOMCwaujXLloyBI2kEdEwxtgAvtpNi4VIP1SkSJvOl/9vXXb
 oojceGD5YsvreLrBsHMTHirVcVd9LGJpJUQ3QbRS32m2mSS4feHfqviqKv7l9ARznR
 4evD7S2xDYwLUVU1uXI75AwSx4mayOswQpX2HLyyhDtF8r9d/T79oVKa+LZDlaYbgZ
 SjFBxaltD4zEwVIh44y+lTD85xP4aM6Bmuf+oTcsUbIsWw99J7y2ooyn8DK/RWmfaE
 Cgvul7TE2ovcMM6GrO9IVOk5mWhsb4tyDYT1o3pUSt5XEHlg8Cj8goCLxIrMAtxLON
 zQ8MuXwUJO7iQ==
Cc: alsa-devel@alsa-project.org, spujar@nvidia.com, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, treding@nvidia.com,
 Mohan Kumar <mkumard@nvidia.com>
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

This series proposes following fixes to Tegra HDA driver.
* Align the buffer to 128 bytes for Tegra.
* Add new behavior flag dma_stop_delay in hdac_bus structure.
* Add 100us as dma stop delay for Tegra.

Mohan Kumar (3):
  ASoC: hda/tegra: Set buffer alignment to 128 bytes
  ALSA: hda: Add behaviour flag for dma stop delay
  ALSA: hda/tegra: Add 100us dma stop delay

 include/sound/hdaudio.h   | 2 ++
 sound/hda/hdac_stream.c   | 7 +++++++
 sound/pci/hda/hda_tegra.c | 3 +++
 3 files changed, 12 insertions(+)

-- 
2.17.1

