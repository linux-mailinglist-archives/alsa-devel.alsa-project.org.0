Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8787C23C9A0
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Aug 2020 11:55:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A38B1660;
	Wed,  5 Aug 2020 11:54:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A38B1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596621330;
	bh=2bufS4QL/WSzPhgO2bDyW+E2dnqpRdje1tx7oAgaQw0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LAlV5JtwIaziHxibLW6G4p3VTgjZQhw0E00KqITMocTtFD81O6skLIpW1q7vMJ0nK
	 g3adzeQ+AG5urYTEkTQUKfzRlnjqfKtx21A8gcAEnd9Ak59+Hph6kU8zxANDXXwJhW
	 sy9nJv+lAVs08g7rJH7wW2h8cXEdKkf/jwmMuHwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74031F802BE;
	Wed,  5 Aug 2020 11:53:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8CFDF80259; Wed,  5 Aug 2020 11:52:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0FF5F801F7
 for <alsa-devel@alsa-project.org>; Wed,  5 Aug 2020 11:52:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0FF5F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="BWBMWt6Q"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f2a815f0000>; Wed, 05 Aug 2020 02:52:31 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 05 Aug 2020 02:52:45 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 05 Aug 2020 02:52:45 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 5 Aug
 2020 09:52:45 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 5 Aug 2020 09:52:44 +0000
Received: from mkumard.nvidia.com (Not Verified[10.24.34.162]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f2a816a0000>; Wed, 05 Aug 2020 02:52:44 -0700
From: Mohan Kumar <mkumard@nvidia.com>
To: <tiwai@suse.com>, <perex@perex.cz>
Subject: [PATCH v2 0/3]  Tegra Specific fixes
Date: Wed, 5 Aug 2020 15:22:18 +0530
Message-ID: <20200805095221.5476-1-mkumard@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1596621151; bh=n1dlz8iyQVQn9u37McbzKI0W09GdeF2ZXWm7kj2D8ro=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:Content-Type;
 b=BWBMWt6QVMLMuh32CQv7EbgOGFYLt4B1kJkv4Q2FjTIqnRzzSczyZt51aN0DmDSUG
 W00eF6NWgZc4saNzaisPb8Lx/k7wsfXRUw6zDcunG2jTPLThr/hBmWiHj8Q8ZOLOiX
 SEpA0QeeFRYq6GWyI0aNR3+3O+iJF90IgwuU9IPxSxNRsT7QihuaXdKuXSoKSpz0co
 QrS92fAO+DLM3SQSwaI/jTG5Umc/uY77DjaEYnR7eWjsUHWqAlLZzYZExDXEQcjCFg
 PKEln59tCG4H/vRBp2C0Bj/FSYPX9c+CSbTVAXUXw79wwtmMofbUPXq/udTPZr2aor
 fvgTSksTu8scA==
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
  ALSA: hda: Add dma stop delay variable
  ALSA: hda/tegra: Add 100us dma stop delay

 include/sound/hdaudio.h   | 3 +++
 sound/hda/hdac_stream.c   | 7 +++++++
 sound/pci/hda/hda_tegra.c | 3 +++
 3 files changed, 13 insertions(+)

-- 
2.17.1

